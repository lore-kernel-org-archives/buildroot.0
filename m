From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 May 2018 20:59:40 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: add tainting support
In-Reply-To: <CA+TH9VnVMba-qZi9n8yDo8WYjXpAS5O1XQZGhzQgzrKjinLr3Q@mail.gmail.com>
References: <1520326085-18337-1-git-send-email-angelo@amarulasolutions.com>
 <1520326085-18337-2-git-send-email-angelo@amarulasolutions.com>
 <20180428185332.7d805102@windsurf>
 <CA+TH9VnVMba-qZi9n8yDo8WYjXpAS5O1XQZGhzQgzrKjinLr3Q@mail.gmail.com>
Message-ID: <dc16a557-36ab-e222-fc62-6c55d1ea2683@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-05-18 23:34, Angelo Compagnucci wrote:
> Dear Thomas,
> 
> 2018-04-28 18:53 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
>> Hello,
>>
>> On Tue,  6 Mar 2018 09:48:04 +0100, Angelo Compagnucci wrote:
[snip]
>>> @@ -1063,6 +1074,7 @@ help:
>>>       @echo '  source                 - download all sources needed for offline-build'
>>>       @echo '  external-deps          - list external packages used'
>>>       @echo '  legal-info             - generate info about license compliance'
>>> +     @echo '  check-tainted          - check if any selected package harms build reproducibility'
>>
>> Not sure it is really useful to make this a first class target,
>> documented in the help text. A warning at the end of the build is
>> probably enough.
> 
> I think this should be kept especially for CI systems in which it's
> useful to know if a user introduced something that harms the build.

 Yes, makes sense. Especially the way you did it in v2: non-fatal in the
target-finalize step, but fatal if check-tainted is called explicitly.

>> Or maybe simply mention it as a Config.in comment ?
>>
>> comment "WARNING: nodejs modules will make your build non reproducible!"
>>         depends on BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL != ""
>>
>>>       @echo '  printvars              - dump all the internal variables'
>>>       @echo
>>>       @echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
>>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>>> index a2a12e7..e643ecf 100644
>>> --- a/package/pkg-generic.mk
>>> +++ b/package/pkg-generic.mk
>>> @@ -556,6 +556,10 @@ ifndef $(2)_REDISTRIBUTE
>>>   endif
>>>  endif
>>>
>>> +ifdef $(2)_TAINTS
>>> + BR2_TAINTED_BY+=$$($(2)_RAWNAME)
>>> +endif
>>
>> I think "TAINTS" is very vague. Unfortunately, I don't have a good
>> proposal. In addition, it's not only about tainting the build in terms
>> of reproducibility, but also about the lack of integration with the
>> download and legal infrastructures.
> 
> Yes, it's not the best name probably, but the concept is here.

 In the kernel the 'taint' name is also used for things that are not really
literally tainting, so why not.

 Regards,
 Arnout


>> I'm not sure what a good name for this would be. I've added Arnout in
>> Cc, he often has interesting (and creative) ideas on such topics.
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
