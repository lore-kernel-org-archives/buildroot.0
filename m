From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Nov 2015 00:54:57 +0100
Subject: [Buildroot] [PATCH 5/6] core: check host executables have
	appropriate RPATH
In-Reply-To: <5648FDCE.6040701@mind.be>
References: <cover.1447449754.git.yann.morin.1998@free.fr>
 <8e0bfbb455c19c606ff0b9996a1508f145f4eec7.1447449754.git.yann.morin.1998@free.fr>
 <5648FDCE.6040701@mind.be>
Message-ID: <20151116235457.GA3655@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-11-15 22:49 +0100, Arnout Vandecappelle spake thusly:
>  Some comments on this one (as could be expected :-P )

Eh! ;-)

> On 13-11-15 22:48, Yann E. MORIN wrote:
[--SNIP--]
> > As for libraries, it is unclear whether they should or should not have
> > an RPATH pointing to our host directory. as for programs, it is only
> > important they have such an RPATH if they have a dependency on another
> > host lbrary we build. But even though, in practice this is not an issue,
> > because the program that loads such a libray does have an RPATH (it did
> > find that library!), so the RPATH from the program is also used to
> > search for second-level (and third-level...) dependencies, as well as
> > for libraries loaded via dlopen().
> 
>  This paragraph isn't clear enough. How about:
> 
> For libraries, they only need an RPATH if they depend on another library
> that is not installed in the standard library path. However, any system
> library will already be in the standard library path, and any library we
> install ourselves is in $(HOST_DIR)/usr/lib so already in RPATH.

Further upgrade:

   s/already in RPATH/already in the RPATH of the executable/

>  Also, I think it would be good to repeat this explanation in the script itself.

ACK

> > We add a new support script that checks that all ELF executables have
> > a proper DT_RPATH (or DT_RUNPATH) tag when they link to our host
> > libraries, and reports those file that are missing an RPATH. If a file
> > missing an RPATH is an executable, the script aborts; if only libraries
> > are are missing an RPATH, the script does not abort.
> > 
> > [0] Except if it were to dlopen() it, of course, but the only program
> > I'm aware of that does that is openssl, and it has a correct RPATH tag.
> 
>  cmake and debugfs link with dlopen() as well, so possibly they will dlopen

'debugfs'? We have no such package...

> libraries. Therefore, I'd check for dlopen as well.

Hmm... I am not confident enough about that. What if it uses dlopen() on
a system library?

[--SNIP--]
> > +define check_host_rpath
> > +	$(if $(filter install-host,$(2)),\
> > +		$(if $(filter end,$(1)),support/scripts/check-host-rpath $(3) $(HOST_DIR)))
> > +endef
> > +GLOBAL_INSTRUMENTATION_HOOKS += check_host_rpath
> 
>  As usual, I prefer it to be part of the .stamp_host_installed commands directly
> instead of as a hook, because it is IMHO much more readable and simpler to
> understand. Not to mention that it is 6 lines shorter.

Except this is clearly instrumentation. We're not tweaking anything
here.

>  More importantly, though, there are also some packages that install stuff in
> host during target or staging install, e.g. cppcms.

Gah... Dirty... :-(

> Also, it is usually fairly
> clear where the executable comes from, and you should only really see this error
> while adding a package. So it seems to me that it would be sufficient to do this
> in the finailization step instead of after each host package install.

No, I really do want the build to break early, as soon as a package does
not have a proper RPATH, so we can catch it. Scanning the host/usr/bin
and host/usr/sbin directories takes roughly two seconds on my
not-so-fast-but-not-so-slow-either machine (core-i5).

> >  # User-supplied script
> >  ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
> >  define step_user
> > diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> > new file mode 100755
> > index 0000000..b140974
> > --- /dev/null
> > +++ b/support/scripts/check-host-rpath
> > @@ -0,0 +1,71 @@
> > +#!/usr/bin/env bash
> > +
> > +# This script scans $(HOST_DIR)/{bin,sbin} for all ELF files, and checks
> > +# they have an RPATH to $(HOT_DIR)/usr/lib if they need libraries from
> > +# there.
> > +
> > +# Override the user's locale so we are sure we can parse the output of
> > +# readelf(1) and file(1)
> > +export LC_ALL=C
> > +
> > +main() {
> 
>  Not sure if I like this approach of a main() function, but OK.

I have come to always use a main() function even in shell scripts. It is
much cleaner, and since this is bash, we can use local variables.

And with the experience, it has proven to be much more maintenable over
time.

> > +    local pkg="${1}"
> > +    local hostdir="${2}"
> > +    local file ret
> > +
> > +    # Remove duplicate and trailing '/' for proper match
> > +    hostdir="$( sed -r -e 's:/+:/:g;' <<<"${hostdir}" )"
> > +
> > +    ret=0
> > +    while read file; do
> 
>  I definitely don't like this while read ... <( ... ) approach, because it is
> IMHO much harder to understand

I do not like Python because it is IMHO much harder to understand... ;-]

Really, this is a little bit advanced bash scripting, but we would not
refrain ourselves from using advanced constructs in other languages
(the yield stuff in Python took me a while to understand, it is not
trivial, and yet we use it, and that's good because the program is more
efficient and smaller). Let's use the constructs the language offers,
when they make our lives easier (yes, I believe that <() construct makes
it easier).

> (like a German sentence where all the verbs are
> at the end :-).

Eh! I love German (kidding, it sounds weird in my ear, and I am not able
to write any meaningfull sentence).

> So I would prefer a much simpler:
> 
>    for file in $(find "${hostdir}"/usr/{bin,sbin} -type f); do
>        if file $file | grep -q -E '^([^:]+):.*\<ELF\>.*\<executable\>.*'; then
>            ...

The big advantage of using "find ... -exec file {} +' is that it will
not spwan 'file' for each instance of the file it found, as it iwll pass
it as many arguments as possible on the current system (which is a *lot*
on Linux, so basically a single call to 'file'), which is much faster
than spawning 'file' as many time as there are results.

>  If you're worried about spaces in filenames, just add at the top of the file:
> 
> IFS=$(printf '\n')

That does not work:

    $ cat ess
    #!/bin/bash
    IFS=$(printf '\n')
    for i in $( printf "a b\nc d e\n" ); do
        printf "'%s'\n" "${i}"
    done

    $ ./ess
    'a b
    c d e'

We can do it with IFS="${// /}" but that leaves tabs. Grantd, files with
a tab in their name would be just insane...

But no, spaces in filenames are not my main concern...

> > +        elf_needs_rpath "${file}" "${hostdir}" || continue
> > +        check_elf_has_rpath "${file}" "${hostdir}" && continue
> > +        if [ ${ret} -eq 0 ]; then
> > +            ret=1
> > +            printf "***\n"
> > +            printf "*** ERROR: package %s installs executables without proper RPATH:\n" "${pkg}"
> > +        fi
> > +        printf "***   %s\n" "${file}"
> > +    done < <( find "${hostdir}"/usr/{bin,sbin} -type f -exec file {} + 2>/dev/null \
> > +              |sed -r -e '/^([^:]+):.*\<ELF\>.*\<executable\>.*/!d'                \
> > +                      -e 's//\1/'                                                  \
> 
>  As shown above, I prefer a simple grep over this complicated sed expression.

When I conpare your grep expression and my sed expression, I can;t see
much difference, save for the pattern-matching in mine... :-/

>  In fact I also don't really like extended regexps (because less people are
> familiar with them) but in this case it really makes it simpler.

Extended regular expressions were formally defined in POSIX.2, i.e. in
1992, 23 years ago... Get up-to-speed! ;-)

[--SNIP--]
> > +        [ -e "${hostdir}/usr/lib/${lib}" ] && return 0
> 
>  Nite: I would only use [] inside if constructs, and test if you use it like here.

Using [] make the test actually well delimited, that why I like it over
test(1).

> > +    done < <( readelf -d "${file}"                                         \
> > +              |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
> > +                     -e 's//\1/;'                                          \
> > +            )
> 
>  This is also where the check for dlopen should be added:
> 
>     if readelf -s "${file}" | grep -q 'UND dlopen'; then
>         return 0
>     else
>         return 1
>     fi
> 
>  Well, actually it would be enough to put
> 
>      readelf -s "${file}" | grep -q 'UND dlopen'
> 
> (because the return value of a function is the return value of the last
> pipeline) but that's in fact harder to understand so I don't like it.

Yes, the status of a pipeline is confusing, and I don't like relying on
it either...

[--SNIP--]
> > +    done < <( readelf -d "${file}"                                              \
> > +              |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
> > +                      -e 's//\3/;'                                              \
> > +            )
> 
>  I stopped trying to parse this :-)

Eh! ;-)

ELF tag names are printed between parenthesis. Whatever comes before is
of no interest.

Then, there are two rpath tags [*]:
  - DT_RPATH, the old tag, displayed as 'RPATH',
  - DT_RUNPATH, the new tag, displayed as 'RUNPATH'.

So we match both in a single pattern, by making the 'UN' (and 'un') parts
optional.

Then, all we care about the is the actual value which is in square
brackets.

And we delete lines that do not match the full pattern.

[*] They behave slightly differently, mostly in the order they are
searched for, compared to other locations like LD_LIBRARY_PATH and the
standard search paths.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
