From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 May 2016 20:44:55 +0200
Subject: [Buildroot] [PATCH 01/13 v6] support/scripts: add helper to
 hardlink-or-copy
In-Reply-To: <20160505223841.GE4367@free.fr>
References: <cover.1461881416.git.yann.morin.1998@free.fr>
 <0b6395f0d572eec63e4f14fd02d094b5b60f3de9.1461881416.git.yann.morin.1998@free.fr>
 <8e95b534-d9f0-5582-a0a8-495e018d88b8@mind.be>
 <20160505223841.GE4367@free.fr>
Message-ID: <c09bf375-50ae-5e3d-77a1-4637c34bb888@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/06/16 00:38, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2016-05-04 00:53 +0200, Arnout Vandecappelle spake thusly:
>> On 04/29/16 00:27, Yann E. MORIN wrote:
[snip]
>>> +# hardlink-or-copy -- helper script to first try to hardlink,
>>> +# and fallback to copy.
>>> +HARDLINK_OR_COPY := support/scripts/hardlink-or-copy
>>
>>  = instead of :=
>>
>>
>>  However (and here starts the difference of opinion in coding style): why do
>> you need to define a variable for this? In general, I'm not a big fan of
>> variables that just contain a constant string. For numbers, it makes sense,
>> because a number is meaningless by itself. But a string is already something
>> that is searchable and identifiable. And in this specific case, the variable
>> name is even the same as the value... So what's the point? OK, you save 13
>> characters in every place where you use it (that's in only 2 (TWO) places,
>> by the way).
>>
>>  We do have a few existing cases of such variables, but IMHO they are
>> equally useless. And mostly introduced by you, BTW :-)
>
> Well, when the thing s used in multiple places, I find it "better" to
> use a variable so as to be able to change all locations at once with a
> single edit (even if we don't plan on renaming or moving it).

  I was going to build a big argument about why I disagree, but I see in v7 you 
already dropped the variable so let's leave it at that :-)

[snip]
>>> +    rm -f "${dst_f}"
>>> +    ln -f "${src_f}" "${dst_f}" 2>/dev/null || cp -f "${src_f}" "${dst_f}"
>>
>>  Since there's an rm just above, is there any point in adding the -f still
>> here? Yes, for race conditions, but then the rm wasn't much use to begin
>> with.
>
> That's what was diuscussed in the previous reviews. And didn't you
> explcitly mentioned we should use an explicit rm -f :
>
>     http://lists.busybox.net/pipermail/buildroot/2016-February/151140.html

  This one you didn't change in v7... The rm -f is perfect; it's the -f of ln/cp 
which is redundant.

  But it's not really important, so I'll probably just Rev-by the v7.

>
> ;-)
>
>>> +}
>>> +
>>> +main "${@}"
>>
>>  Anothing coding style disagreement. What's the point of putting your
>> complete shell script in a function? I don't really have arguments against
>> it, but do you have reasons why you think it's better like that?
>
> I am not sure what advantages it has, technically-wise (i.e. I am not
> sure it allows things that would not be possible without main).
>
> I've been writing (bash) shell scripts for ages now, and I find it very
> cnvenient to use a main():
>
>   - do not use global variables (even though variables are inherited by
>     sub-functions): declare all variables used in the function and only
>     use that, with explciitly docuemented exceptions;
>
>   - it helps organise the code: it is cleaner in my head;
>
>   - I'm not the only one: https://google.github.io/styleguide/shell.xml

  Great explanation, thanks.

  Regards,
  Arnout


>
>>  Note that currently we have both styles of shell scripts, though the ones
>> with a main function are a minority.
>
> ... and probably mines. ;-)
>
> Regards,
> Yann E. MORIN.
>
>> And none of the python scripts have a
>> main.
>>
>>  Regards,
>>  Arnout
>>
>>
>>
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
