From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Apr 2015 22:27:04 +0200
Subject: [Buildroot] [PATCH 2/3] manual: cvs: document that a date can
 be used instead of a tag
In-Reply-To: <20150422162936.GA4069@free.fr>
References: <1429376067-9228-1-git-send-email-fabio.porcedda@gmail.com>
 <1429376067-9228-3-git-send-email-fabio.porcedda@gmail.com>
 <20150419081028.GB4313@free.fr>
 <CAHkwnC-mOAdrGEt0E_FCrvf2kFZJ78UuWa+2h0a+Dco8dg49uA@mail.gmail.com>
 <5533CD7D.1070605@mind.be>
 <CAHkwnC9rcyr4Y+ydSYiDBY2x=+3QLfGapr75E3+Do+69wbWF=Q@mail.gmail.com>
 <55356A45.5020301@mind.be>
 <CAHkwnC9qgzpdV9owFZr+Vi51-6fP18+XoeuMkKO=KLfg013xkw@mail.gmail.com>
 <20150422162936.GA4069@free.fr>
Message-ID: <55380418.8050201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 18:29, Yann E. MORIN wrote:
> Fabio, Gustavo, All,
> 
> On 2015-04-22 10:03 +0200, Fabio Porcedda spake thusly:
>> On Mon, Apr 20, 2015 at 11:06 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>> On 20/04/15 04:36, Fabio Porcedda wrote:
> [--SNIP--]
>>>> This one works: (<YYYY>-<MM>-<DD>[T<HH>:<MM>[:<SS>][-<ZZ>] e.g
>>>> 2015-12-20 or 2015-12-20T10:10-00)
>>>
>>>  Well, the example should include a timezone and mention that adding a timezone
>>> is advisable.
>> Ok.
>>
>>>  Alternatively, we could specifies that times are in UTC and set TZ=UTC in the
>>> cvs helper.
>>
>> Fine for me.
>> Yann what do you think about it?
> 
> I don't care. But what if a user specifies a timezone?

 Then the user-specified timezone overrides the environment, so the user gets
exactly what he expects. So I think setting TZ=UTC is the best option.

> 
> The tricky part with dealing with date (aka human date and timei) is
> exactly that: having to deal with it. It is very complex to parse a date
> in a reliable manner.
> 
> So we can't really validate a date. I'd rather we allow the full range
> of dates supported by cvs, and let it deal with whatever the user
> provides, and if that's incorrect, let cvs fail, not us (well, we'd
> eventually fail, but not on our will).

 Well, it was never the intention that we would parse it, just that we provide
an example of a valid date.

> 
>>>> But to made it works I must replace the ":" with "_":
>>>
>>>  Why? The / substitution is only needed because VERSION is used in filenames,
>>> and : is fine in filenames, no?
>>
>> The colon is fine for filenames, neverthless if i don't replace it, I
>> get this error:
>>
>> $ make expect-source
>> package/expect/expect.mk:19: *** target pattern contains no '%'.  Stop.
> 
> Yes, because the $(@D) contains the version string, and it is a make
> goal. So, we'd end up wth something like;
> 
>     foo-2015-04-22T18:26/.stamp_extracted:
>         blabla

 Actually it's in this rule:

$(1)-install-target:            $$($(2)_TARGET_INSTALL_TARGET)
which expands to
foo-install-target: foo-2015-04-22T18:26/.stamp_target_installed

> 
> Notice that there are two columns, and that is not valid make syntax
> (AFAIR).
> 
> Which make me think: "2015-04-22 18:26" is an equally valid date, and we
> do not really support spaces in paths, so we'd have to also replaces
> spaces as well.

 Right!


 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
