From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 4 Oct 2013 10:54:55 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <524D9DE2.7090509@mind.be>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <20131002172307.0d6f02ea@skate> <524C4AD4.9040902@lucaceresoli.net>
 <CAAXf6LXWf34Amx44pdixKL0m87jq_FMBxN8BJO9TBDbQ58Po1Q@mail.gmail.com>
 <524D9DE2.7090509@mind.be>
Message-ID: <CAAXf6LUTTX0OFNaP4NxVWXKC4OFBROXK-PFiumL8zYrumkbtog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Oct 3, 2013 at 6:40 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 10/03/13 10:24, Thomas De Schampheleire wrote:
>>
>>>>
>>>> Agreed. However, in make, doing FOOBAR = or not defining FOOBAR leads
>>>> to the same thing: FOOBAR is an empty variable. So we have to decide on
>>>> an explicit magic value to use when no license files are available (and
>>>> ensure this magic value is never going to be used for the name of a
>>>> license file).
>>>>
>>>> FOO_LICENSE_FILES = N/A
>>>> FOO_LICENSE_FILES = not-available
>>>> FOO_LICENSE_FILES = none
>>>> FOO_LICENSE_FILES = NONE
>>>
>>>
>>>
>>> It's not clear to me whether this is the correct way to address the
>>> problem
>>> of packages having license file.
>>>
>>> I think usually that means they /do/ have a license, but it's only
>>> written
>>> in the top lines of source files and/or in a README containing other
>>> stuff.
>>> IOW, the license text is there, but we currently have no way to extract
>>> it.
>>
>>
>> This is also how I see it.
>
>
>  So in this situation, the proper way to deal with it is to issue a warning,
> right? Which is exactly what the current code does.
>
>  I can think of only one situation (except for the PROPRIETARY case) where
> no license text is provided and we don't need to be warned of this, and that
> is when it is public domain. But maybe that's just a limit of my imagination
> :-).

Probably a warning is the safe action here, because most licenses do
indeed require you to distribute the actual text, as you mentioned.
However, I dislike the current warning 'FOO_LICENSE_FILES not defined'
because it is not accurate: in such a case we _know_ that the package
does not contain a license file and intentionally provided an empty or
magic FOO_LICENSE_FILES. So the warning should rather be something
like: 'foo does not contain a license file'.

To come back on the comment ThomasP made about 'FOO =' and not
defining FOO leading to the same empty FOO variable: this does not
mean we cannot differentiate both cases: with $(origin FOO) you can.

>
>  That said, it would be good if we would just error out when a license is
> defined but no license files are provided. Now we check for that during
> review (and require an explicit comment if no license file exists), but it's
> of course even better if that can be done during autobuilder tests.

When you say 'error out' you mean actually aborting the make process?
Currently, anomalies in the legal-info area are just warnings hinting
the developer he has to take some action. Do we really want to error
out in such cases?

But if we will make a distinction between an undefined
FOO_LICENSE_FILES (an anomaly) and an empty/magic one, then the
autobuilder package stats could be updated with an extra column, or a
YES/NO/EMPTY value in the existing column.
http://autobuild.buildroot.org/stats/

(by the way: where is the code that generates these stats? I had
expected to find it in buildroot-test, but didn't.)

> As to
> the naming, I think N/A is very good because the chance of having an N
> directory with an A file is very small.

The chances of having a license file called none or NONE are also
pretty small IMO :)

But, re-thinking this, I think none of these are actually very good:
there _should_ be a license file but it is missing. So it's not
'not-applicable', and it's not 'none'. Rather, something like:
FOO_LICENSE_FILES = missing
FOO_LICENSE_FILES = not-provided
FOO_LICENSE_FILES = none-provided

Best regards,
Thomas
