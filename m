From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 28 Aug 2013 10:26:37 +0200
Subject: [Buildroot] [PATCH v2 2/3] package: fix generic extract target
 for top-level parallel make
In-Reply-To: <521C40AB.2000107@mind.be>
References: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
 <1374138746-23279-3-git-send-email-fabio.porcedda@gmail.com>
 <521513E3.8080401@mind.be>
 <CAHkwnC_6k4tY_KRudG7yWp1gOi5WZnYKDwWv2gh_xBtCQhJesQ@mail.gmail.com>
 <52163548.2020108@mind.be>
 <CAHkwnC9CqFDM=mb7zaA7VDydfGKe=mjGT9ZzkP3obUgzd02mMA@mail.gmail.com>
 <521C40AB.2000107@mind.be>
Message-ID: <CAHkwnC-Fxf1hQMO-=PEcAyyRk56=Ncf2+t-xVv_DAkB8fZMYdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 27, 2013 at 8:01 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 08/26/13 10:29, Fabio Porcedda wrote:
>>
>> On Thu, Aug 22, 2013 at 5:59 PM, Arnout Vandecappelle <arnout@mind.be>
>> wrote:
>>>
>>> On 22/08/13 09:44, Fabio Porcedda wrote:
>
> [snip]
>
>>>> To be able to change the others targets i need to add stamp file for
>>>> every target inside $$($(2)_DEPENDENCIES,
>>>> i need to do that because a file cannot depends on a non existing file.
>>>
>>>
>>>
>>>   That's not true. Take the following Makefile:
>>>
>>> ----------------
>>> %.source:
>>>          touch $@
>>>
>>> %.extract: %.source
>>>          touch $@
>>>
>>> %.config: %.extract
>>>          touch $@
>>>
>>> %.build: %.config
>>>          touch $@
>>>
>>> X_DEPS = y z
>>>
>>> x.config: $(X_DEPS)
>>
>>
>> The problem with this solution is that the "x.config" target is
>> reevaluated every time because it does not depends on a virtual
>> target, the only solution that i found is to add a stamp file for
>> every dependencies.
>> Using virtual target as dependency is fine only with virtual targets.
>
>
>  Ah yes, you're right.
>
>  However, using the order-only rule that you mentioned in reply to Thomas
> solves the problem. So
>
> x.config: | $(X_DEPS)

That's great, I didn't know that.
I'm working on the v3.

Regards
Fabio Porcedda
