From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Nov 2015 10:52:33 +0100
Subject: [Buildroot] [PATCH 5/6] core: check host executables have
	appropriate RPATH
In-Reply-To: <8e0bfbb455c19c606ff0b9996a1508f145f4eec7.1447449754.git.yann.morin.1998@free.fr>
References: <cover.1447449754.git.yann.morin.1998@free.fr>
 <8e0bfbb455c19c606ff0b9996a1508f145f4eec7.1447449754.git.yann.morin.1998@free.fr>
Message-ID: <20151114095233.GA4775@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2015-11-13 22:48 +0100, Yann E. MORIN spake thusly:
> When we build our host programs, and they depend on a host library we
> also build, we want to ensure that program actually uses that library at
> runtime, and not the one from the system.
> 
> We currently ensure that in two ways:
>   - we add a RPATH tag that points to our host library directory,
>   - we export LD_LIBRARY_PATH to point to that same directory.
> 
> With thse two in place, we're pretty much confident that our host
> libraries will be used by our host programs.
> 
> However, it turns our that not all the host programs we build end up
> with an RPATH tag:
>   - some packages do not use our $(HOST_LDFLAGS)
>   - some packages' build system are oblivious to those LDFLAGS
> 
> In this case, there are two situation:
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
> 
> We add a new support script that checks that all ELF executables have
> a proper DT_RPATH (or DT_RUNPATH) tag when they link to our host
> libraries, and reports those file that are missing an RPATH. If a file
> missing an RPATH is an executable, the script aborts; if only libraries
> are are missing an RPATH, the script does not abort.

I forgot to remove that last part of the sentence about libraries. At
first, the script was also looking for shared libraries, but it no
longer does.

Regards,
Yann E. MORIN.

> [0] Except if it were to dlopen() it, of course, but the only program
> I'm aware of that does that is openssl, and it has a correct RPATH tag.
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
> +    local pkg="${1}"
> +    local hostdir="${2}"
> +    local file ret
> +
> +    # Remove duplicate and trailing '/' for proper match
> +    hostdir="$( sed -r -e 's:/+:/:g;' <<<"${hostdir}" )"
> +
> +    ret=0
> +    while read file; do
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
> +        [ -e "${hostdir}/usr/lib/${lib}" ] && return 0
> +    done < <( readelf -d "${file}"                                         \
> +              |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
> +                     -e 's//\1/;'                                          \
> +            )
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
> +
> +    return 1
> +}
> +
> +main "${@}"
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
