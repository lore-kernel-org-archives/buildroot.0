From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Nov 2015 22:49:02 +0100
Subject: [Buildroot] [PATCH 5/6] core: check host executables have
	appropriate RPATH
In-Reply-To: <8e0bfbb455c19c606ff0b9996a1508f145f4eec7.1447449754.git.yann.morin.1998@free.fr>
References: <cover.1447449754.git.yann.morin.1998@free.fr>
 <8e0bfbb455c19c606ff0b9996a1508f145f4eec7.1447449754.git.yann.morin.1998@free.fr>
Message-ID: <5648FDCE.6040701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Yann,

 Some comments on this one (as could be expected :-P )


On 13-11-15 22:48, Yann E. MORIN wrote:
> When we build our host programs, and they depend on a host library we
> also build, we want to ensure that program actually uses that library at
> runtime, and not the one from the system.
> 
> We currently ensure that in two ways:
>   - we add a RPATH tag that points to our host library directory,
>   - we export LD_LIBRARY_PATH to point to that same directory.
> 
> With thse two in place, we're pretty much confident that our host
       these

> libraries will be used by our host programs.
> 
> However, it turns our that not all the host programs we build end up
> with an RPATH tag:
>   - some packages do not use our $(HOST_LDFLAGS)
>   - some packages' build system are oblivious to those LDFLAGS
> 
> In this case, there are two situation:
                              situations

>   - the program is not linked to one of our host libraries: it in fact
>     does not need an RPATH tag [0]
>   - the program actually uses one of our host libraries: in that case it
>     should have had an RPATH tag pointing to the host directory.
> 
> As for libraries, it is unclear whether they should or should not have
> an RPATH pointing to our host directory. as for programs, it is only
> important they have such an RPATH if they have a dependency on another
> host lbrary we build. But even though, in practice this is not an issue,
> because the program that loads such a libray does have an RPATH (it did
> find that library!), so the RPATH from the program is also used to
> search for second-level (and third-level...) dependencies, as well as
> for libraries loaded via dlopen().

 This paragraph isn't clear enough. How about:

For libraries, they only need an RPATH if they depend on another library
that is not installed in the standard library path. However, any system
library will already be in the standard library path, and any library we
install ourselves is in $(HOST_DIR)/usr/lib so already in RPATH.


 Also, I think it would be good to repeat this explanation in the script itself.


> We add a new support script that checks that all ELF executables have
> a proper DT_RPATH (or DT_RUNPATH) tag when they link to our host
> libraries, and reports those file that are missing an RPATH. If a file
> missing an RPATH is an executable, the script aborts; if only libraries
> are are missing an RPATH, the script does not abort.
> 
> [0] Except if it were to dlopen() it, of course, but the only program
> I'm aware of that does that is openssl, and it has a correct RPATH tag.

 cmake and debugfs link with dlopen() as well, so possibly they will dlopen
libraries. Therefore, I'd check for dlopen as well.

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> ---
>  package/pkg-generic.mk           |  8 +++++
>  support/scripts/check-host-rpath | 71 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 79 insertions(+)
>  create mode 100755 support/scripts/check-host-rpath
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a5d0e57..ccb0d26 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -87,6 +87,14 @@ define step_pkg_size
>  endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
>  
> +# This hook checks that host packages that need libraries that we build
> +# have a proper DT_RPATH or DT_RUNPATH tag
> +define check_host_rpath
> +	$(if $(filter install-host,$(2)),\
> +		$(if $(filter end,$(1)),support/scripts/check-host-rpath $(3) $(HOST_DIR)))
> +endef
> +GLOBAL_INSTRUMENTATION_HOOKS += check_host_rpath

 As usual, I prefer it to be part of the .stamp_host_installed commands directly
instead of as a hook, because it is IMHO much more readable and simpler to
understand. Not to mention that it is 6 lines shorter.

 More importantly, though, there are also some packages that install stuff in
host during target or staging install, e.g. cppcms. Also, it is usually fairly
clear where the executable comes from, and you should only really see this error
while adding a package. So it seems to me that it would be sufficient to do this
in the finailization step instead of after each host package install.

> +
>  # User-supplied script
>  ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
>  define step_user
> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> new file mode 100755
> index 0000000..b140974
> --- /dev/null
> +++ b/support/scripts/check-host-rpath
> @@ -0,0 +1,71 @@
> +#!/usr/bin/env bash
> +
> +# This script scans $(HOST_DIR)/{bin,sbin} for all ELF files, and checks
> +# they have an RPATH to $(HOT_DIR)/usr/lib if they need libraries from
> +# there.
> +
> +# Override the user's locale so we are sure we can parse the output of
> +# readelf(1) and file(1)
> +export LC_ALL=C
> +
> +main() {

 Not sure if I like this approach of a main() function, but OK.

> +    local pkg="${1}"
> +    local hostdir="${2}"
> +    local file ret
> +
> +    # Remove duplicate and trailing '/' for proper match
> +    hostdir="$( sed -r -e 's:/+:/:g;' <<<"${hostdir}" )"
> +
> +    ret=0
> +    while read file; do

 I definitely don't like this while read ... <( ... ) approach, because it is
IMHO much harder to understand (like a German sentence where all the verbs are
at the end :-). So I would prefer a much simpler:

   for file in $(find "${hostdir}"/usr/{bin,sbin} -type f); do
       if file $file | grep -q -E '^([^:]+):.*\<ELF\>.*\<executable\>.*'; then
           ...

 If you're worried about spaces in filenames, just add at the top of the file:

IFS=$(printf '\n')

> +        elf_needs_rpath "${file}" "${hostdir}" || continue
> +        check_elf_has_rpath "${file}" "${hostdir}" && continue
> +        if [ ${ret} -eq 0 ]; then
> +            ret=1
> +            printf "***\n"
> +            printf "*** ERROR: package %s installs executables without proper RPATH:\n" "${pkg}"
> +        fi
> +        printf "***   %s\n" "${file}"
> +    done < <( find "${hostdir}"/usr/{bin,sbin} -type f -exec file {} + 2>/dev/null \
> +              |sed -r -e '/^([^:]+):.*\<ELF\>.*\<executable\>.*/!d'                \
> +                      -e 's//\1/'                                                  \

 As shown above, I prefer a simple grep over this complicated sed expression.

 In fact I also don't really like extended regexps (because less people are
familiar with them) but in this case it really makes it simpler.

> +            )
> +
> +    return ${ret}
> +}
> +
> +elf_needs_rpath() {
> +    local file="${1}"
> +    local hostdir="${2}"
> +    local lib
> +
> +    while read lib; do

 Same while story here.

> +        [ -e "${hostdir}/usr/lib/${lib}" ] && return 0

 Nite: I would only use [] inside if constructs, and test if you use it like here.

> +    done < <( readelf -d "${file}"                                         \
> +              |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
> +                     -e 's//\1/;'                                          \
> +            )

 This is also where the check for dlopen should be added:

    if readelf -s "${file}" | grep -q 'UND dlopen'; then
        return 0
    else
        return 1
    fi

 Well, actually it would be enough to put

     readelf -s "${file}" | grep -q 'UND dlopen'

(because the return value of a function is the return value of the last
pipeline) but that's in fact harder to understand so I don't like it.

> +
> +    return 1
> +}
> +
> +check_elf_has_rpath() {
> +    local file="${1}"
> +    local hostdir="${2}"
> +    local rpath dir
> +
> +    while read rpath; do
> +        for dir in ${rpath//:/ }; do
> +            # Remove duplicate and trailing '/' for proper match
> +            dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
> +            [ "${dir}" = "${hostdir}/usr/lib" ] && return 0
> +        done
> +    done < <( readelf -d "${file}"                                              \
> +              |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
> +                      -e 's//\3/;'                                              \
> +            )

 I stopped trying to parse this :-)

 Regards,
 Arnout

> +
> +    return 1
> +}
> +
> +main "${@}"
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
