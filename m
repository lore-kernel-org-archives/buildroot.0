From: =?UTF-8?B?QW5kcsOpIEVyZG1hbm4=?= <dywi@mailerd.de>
Date: Sat, 25 Apr 2015 15:44:40 +0200
Subject: [Buildroot] [PATCH 1/3] support: add script to find maintainers
In-Reply-To: <20150425124626.GC4275@free.fr>
References: <cover.1427044305.git.yann.morin.1998@free.fr>
 <6fa246aa883ffa33c0fbcf7d52e7032b9685bfaf.1427044305.git.yann.morin.1998@free.fr>
 <553B83E3.7010804@mailerd.de> <20150425124626.GC4275@free.fr>
Message-ID: <553B9A48.9060607@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015/4/25 Yann E. Morin <yann.morin.1998@free.fr>:
> Andr?, All,
> 
> On 2015-04-25 14:09 +0200, Andr? Erdmann spake thusly:
>> 2015/4/24 Yann E. Morin <yann.morin.1998@free.fr>:
>>> With the growing number of packages, as well as the many infrastructures
>>> we now have (package, download...), it is time we introduce the notion
>>> of maintainers.
> [--SNIP--]
>>> diff --git a/support/scripts/check-maintainer b/support/scripts/check-maintainer
>>> new file mode 100755
>>> index 0000000..0ca7136
>>> --- /dev/null
>>> +++ b/support/scripts/check-maintainer
>>> @@ -0,0 +1,157 @@
>>> +#!/usr/bin/env bash
>>> +
>>> +main() {
>>> +    local OPT OPTARGS
>>
>> s/OPTARGS/OPTARG?
> 
> Bummer...
> 
>> Not sure if it makes sense to local-scope getopts vars,
>> there's also OPTIND and maybe OPTERR.
> 
> Well, it does not really matter, even for OPT and OPTARG, since main()
> is the sole function in the script.
> 
> Still, I have for a while tried to declare all local-scope variables
> with 'local', As I find it to be a "good" behaviour.
> 
> But you're right, to be consistent, all should be declared local.
> 
> And OPTERR is not something set by bash, it is a variable that bash
> reads to see how to behave on error.  So, as long as it is not set,
> there's no reason to declare it. But of course, there is, since we
> do not want to inhrit it from the user's environment.
>

bash initializes OPTIND to 1, might be a good idea to do "local -i OPTIND=1" then.

 
> [SNIP]
>>> +    # We can't easily scan the pattern->maintainer relations into an
>>> +    # array, because each pattern may be associated with more than one
>>> +    # maintainer, and entries in bash arrays can't be another array
>>> +    # (i.e. arrays are only one-dimensional).
>>> +    # So, we scan the maintainers file once, and for each pattern we
>>> +    # check if there is a matching file, which in practice is the
>>> +    # optimum solution.
>>> +    # Note: filtering-out comments and empty lines in the bash 'case'
>>> +    # is slightly faster (~10%) than it is to 'sed' them out.
>>> +    while read pattern; do
>>
>> "read -r" unless backslash escapes should be expanded
> 
> There's no need for backslash escapes, so I'll use 'read -r'.
> 
>>> +        case "${pattern}" in
>>> +        "#"*|"")
>>> +            continue
>>> +        ;;
>>> +        *@*)
>>> +            maintainer="${pattern}"
>>> +            continue
>>> +        ;;
>>> +        esac
>>
>> A "have maintainer?" check would slightly help against a malformed
>> maintainers file (file pattern before the first "Person <mail>" line):
>>
>>     [ -z "${maintainer}" ] || \
> 
> Better yet:
>     [ -n "${maintainer}" ] || continue
> 
> No?
>

yes
 
>>> +        for file in "${files[@]}"; do
>>> +            if filematch "${file}" "${pattern}"; then
>>> +                debug "  --> adding '%s'\n" "${maintainer}"
>>> +                rcpt+=( "${maintainer}" )
>>> +            fi
>>> +        done
>>> +    done <MAINTAINERS
>>> +
>>
>> The read-loop basically reads as follows:
>>
>>    foreach maintainer, pattern loop
>>       foreach file loop
>>          if filematch file, pattern then
>>             rank up maintainer
>>          end if
>>       end loop
>>    end loop
>>
>> => Maintainers with more than one pattern matching the same file get ranked up,
>>    try "check-maintainer -p opengl" ;) (after applying patch 3 of this series)
>>
>> Is that on purpose or accepted behavior due to otherwise increased script complexity?
> 
> Yes, that's on purpose, see the comment a few lines later:
>     # Report all interested maintainers, ranking by number of matches
> 
> Is that a problem ranking by number of matches?
> 

Well, you match package/opengl/opengl.mk with two different patterns:

   package/opengl/
   package/opengl*/*

and get a score of 2 - that feels like cheating! ;)

(It gets worse when the number of files and/or the number
of overlapping patterns increase, because the upper score bound
of the current approach is "number of files" * "number of patterns"
and not "number of files".)


>> It'd be rather easy to fix it in bash 4 /w an associative array (*),
>> but I don't know of any sane solution for bash 3, if that's a requirement.
>>
>> (*) as long as all patterns are listed in one block per maintainer
>>     (no "person <mail>" redefinition), but that's guaranteed by the file format
> 
> No, we can not use associative arrays to store { patterns -> maintainer } 
> relations, because a single pattern may have more than one maintainer.
> 
> For example, I'm interested in linux/* and you're interested in linux/*
> too. How can w estore that in an associative array? Remember that arrays
> in bash are one-dimensional, so we can have an associative array like;
>     { pattern -> { maint-1, maint-2 } }
>

You can't track who's interested in which package matched by which pattern unless
you go the eval / dynamic variables / special value encoding route, but you
can track easily if a maintainer has already shown interest in a specific file
(with the "all patterns in one block per maintainer" restriction):

Expanding the pseudo-code snippet from before:

   maintainer := <empty str>
   fmatched   := <don't care>

   foreach nonempty/non-comment input_line loop
      if input_line starts new maintainer block then
         maintainer := input_line
         fmatched   := <empty associative array>

      else
         # is a pattern
         foreach file loop
            if file not in fmatched then
               if filematch file, input_line then
                   fmatched->file := YES
                   rank up maintainer
               end if
            end if
         end loop
      end if
   end loop

 
> That's explained in the comment above the read-loop.
> 
>>> +DESCRIPTION
>>> +    In some projects, some persons are considered responsible for one or
>>> +    more specific parts of the projects; they are called "maintainers",
>>> +    like is done in the Linux kernel.
>>> +
>>> +    In Buildroot, however, we do not have such "maintainers"; rather,
>>> +    some people can declare themselves to be "interested" in specific
>>> +    parts of the project. We still call them "maintainers", though.
>>> +
>>> +    ${my_name} helps in finding such persons. It can be used in two ways.
>>> +
>>> +    In the first synopsis, you pass it a package name or an architecture
>>> +    name, and it will tell you the persons that have declared interests
>>> +    in those.
>>> +
>>> +    In the second synopsis, with no options, it will read a patch from
>>> +    stdin, and it will tell you who has declared interest in the areas
>>> +    touched by the patch.
>>> +
>>> +OPTIONS
>>> +    -h  This help text.
>>> +
>>> +    -p PKG
>>> +        Find the persons interested in package PKG.
>>> +
>>
>> Noteworthy: PKG can also be a glob pattern,
>>             e.g. "usb_modeswitch*" (because of "find -name <PKG>.mk").
> 
> Well, even if that works, do we want to document it? Hmm... yes, it
> might be usefull; consider e.g. 'kodi*' or 'matchbox*', indeed.
> 
> OK, will add to the help.
> 
>> Also, "-p" and "-a" can be given more than once,
> 
> Will make it explicit.
> 
>> whereas "-b" introduced in patch 2 behaves differently.
> 
> Does it make sense to support more than one autobuild failure?
>

Don't know - just looked at the getopts-loop and noticed that it's different.

-- 
Andr?

 
