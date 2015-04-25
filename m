From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 14:46:26 +0200
Subject: [Buildroot] [PATCH 1/3] support: add script to find maintainers
In-Reply-To: <553B83E3.7010804@mailerd.de>
References: <cover.1427044305.git.yann.morin.1998@free.fr>
 <6fa246aa883ffa33c0fbcf7d52e7032b9685bfaf.1427044305.git.yann.morin.1998@free.fr>
 <553B83E3.7010804@mailerd.de>
Message-ID: <20150425124626.GC4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?, All,

On 2015-04-25 14:09 +0200, Andr? Erdmann spake thusly:
> 2015/4/24 Yann E. Morin <yann.morin.1998@free.fr>:
> > With the growing number of packages, as well as the many infrastructures
> > we now have (package, download...), it is time we introduce the notion
> > of maintainers.
[--SNIP--]
> > diff --git a/support/scripts/check-maintainer b/support/scripts/check-maintainer
> > new file mode 100755
> > index 0000000..0ca7136
> > --- /dev/null
> > +++ b/support/scripts/check-maintainer
> > @@ -0,0 +1,157 @@
> > +#!/usr/bin/env bash
> > +
> > +main() {
> > +    local OPT OPTARGS
> 
> s/OPTARGS/OPTARG?

Bummer...

> Not sure if it makes sense to local-scope getopts vars,
> there's also OPTIND and maybe OPTERR.

Well, it does not really matter, even for OPT and OPTARG, since main()
is the sole function in the script.

Still, I have for a while tried to declare all local-scope variables
with 'local', As I find it to be a "good" behaviour.

But you're right, to be consistent, all should be declared local.

And OPTERR is not something set by bash, it is a variable that bash
reads to see how to behave on error.  So, as long as it is not set,
there's no reason to declare it. But of course, there is, since we
do not want to inhrit it from the user's environment.

> > +    local -a pkgs archs files rcpt
> > +    local pattern pkg arch file maintainer
> > +
> > +    while getopts :hp:a: OPT; do
> > +        case "${OPT}" in
> > +        h)  help; exit 0;;
> > +        p)  pkgs+=( "${OPTARG}" );;
> > +        a)  archs+=( "${OPTARG}" );;
> > +        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
> > +        \?) error "unknown option '%s'\n" "${OPTARG}";;
> > +        esac
> > +    done
> 
> Non-option args will be ignored by this script.
> If people don't read the help message first and simply run
> "check-maintainer PKG" or do some scripting and end up with
> "check-maintainer -p $(command_that_usually_prints_a_single_package_name_but_now_prints_two)",
> then the script could hang forever waiting for a patch from stdin.
> 
> Might be better to error-exit in this case, e.g.:
> 
>     # bail out if any positional args are given
>     [ ${#} -lt ${OPTIND} ] || error "bad usage: script does not accept positional args.\n"

Good catch. I'll fix.

> > +    # We can't easily scan the pattern->maintainer relations into an
> > +    # array, because each pattern may be associated with more than one
> > +    # maintainer, and entries in bash arrays can't be another array
> > +    # (i.e. arrays are only one-dimensional).
> > +    # So, we scan the maintainers file once, and for each pattern we
> > +    # check if there is a matching file, which in practice is the
> > +    # optimum solution.
> > +    # Note: filtering-out comments and empty lines in the bash 'case'
> > +    # is slightly faster (~10%) than it is to 'sed' them out.
> > +    while read pattern; do
> 
> "read -r" unless backslash escapes should be expanded

There's no need for backslash escapes, so I'll use 'read -r'.

> > +        case "${pattern}" in
> > +        "#"*|"")
> > +            continue
> > +        ;;
> > +        *@*)
> > +            maintainer="${pattern}"
> > +            continue
> > +        ;;
> > +        esac
> 
> A "have maintainer?" check would slightly help against a malformed
> maintainers file (file pattern before the first "Person <mail>" line):
> 
>     [ -z "${maintainer}" ] || \

Better yet:
    [ -n "${maintainer}" ] || continue

No?

> > +        for file in "${files[@]}"; do
> > +            if filematch "${file}" "${pattern}"; then
> > +                debug "  --> adding '%s'\n" "${maintainer}"
> > +                rcpt+=( "${maintainer}" )
> > +            fi
> > +        done
> > +    done <MAINTAINERS
> > +
> 
> The read-loop basically reads as follows:
> 
>    foreach maintainer, pattern loop
>       foreach file loop
>          if filematch file, pattern then
>             rank up maintainer
>          end if
>       end loop
>    end loop
> 
> => Maintainers with more than one pattern matching the same file get ranked up,
>    try "check-maintainer -p opengl" ;) (after applying patch 3 of this series)
> 
> Is that on purpose or accepted behavior due to otherwise increased script complexity?

Yes, that's on purpose, see the comment a few lines later:
    # Report all interested maintainers, ranking by number of matches

Is that a problem ranking by number of matches?

> It'd be rather easy to fix it in bash 4 /w an associative array (*),
> but I don't know of any sane solution for bash 3, if that's a requirement.
> 
> (*) as long as all patterns are listed in one block per maintainer
>     (no "person <mail>" redefinition), but that's guaranteed by the file format

No, we can not use associative arrays to store { patterns -> maintainer } 
relations, because a single pattern may have more than one maintainer.

For example, I'm interested in linux/* and you're interested in linux/*
too. How can w estore that in an associative array? Remember that arrays
in bash are one-dimensional, so we can have an associative array like;
    { pattern -> { maint-1, maint-2 } }

That's explained in the comment above the read-loop.

> > +DESCRIPTION
> > +    In some projects, some persons are considered responsible for one or
> > +    more specific parts of the projects; they are called "maintainers",
> > +    like is done in the Linux kernel.
> > +
> > +    In Buildroot, however, we do not have such "maintainers"; rather,
> > +    some people can declare themselves to be "interested" in specific
> > +    parts of the project. We still call them "maintainers", though.
> > +
> > +    ${my_name} helps in finding such persons. It can be used in two ways.
> > +
> > +    In the first synopsis, you pass it a package name or an architecture
> > +    name, and it will tell you the persons that have declared interests
> > +    in those.
> > +
> > +    In the second synopsis, with no options, it will read a patch from
> > +    stdin, and it will tell you who has declared interest in the areas
> > +    touched by the patch.
> > +
> > +OPTIONS
> > +    -h  This help text.
> > +
> > +    -p PKG
> > +        Find the persons interested in package PKG.
> > +
> 
> Noteworthy: PKG can also be a glob pattern,
>             e.g. "usb_modeswitch*" (because of "find -name <PKG>.mk").

Well, even if that works, do we want to document it? Hmm... yes, it
might be usefull; consider e.g. 'kodi*' or 'matchbox*', indeed.

OK, will add to the help.

> Also, "-p" and "-a" can be given more than once,

Will make it explicit.

> whereas "-b" introduced in patch 2 behaves differently.

Does it make sense to support more than one autobuild failure?

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
