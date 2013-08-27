From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Aug 2013 08:01:15 +0200
Subject: [Buildroot] [PATCH v2 2/3] package: fix generic extract target
 for top-level parallel make
In-Reply-To: <CAHkwnC9CqFDM=mb7zaA7VDydfGKe=mjGT9ZzkP3obUgzd02mMA@mail.gmail.com>
References: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
 <1374138746-23279-3-git-send-email-fabio.porcedda@gmail.com>
 <521513E3.8080401@mind.be>
 <CAHkwnC_6k4tY_KRudG7yWp1gOi5WZnYKDwWv2gh_xBtCQhJesQ@mail.gmail.com>
 <52163548.2020108@mind.be>
 <CAHkwnC9CqFDM=mb7zaA7VDydfGKe=mjGT9ZzkP3obUgzd02mMA@mail.gmail.com>
Message-ID: <521C40AB.2000107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/26/13 10:29, Fabio Porcedda wrote:
> On Thu, Aug 22, 2013 at 5:59 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 22/08/13 09:44, Fabio Porcedda wrote:
[snip]
>>> To be able to change the others targets i need to add stamp file for
>>> every target inside $$($(2)_DEPENDENCIES,
>>> i need to do that because a file cannot depends on a non existing file.
>>
>>
>>   That's not true. Take the following Makefile:
>>
>> ----------------
>> %.source:
>>          touch $@
>>
>> %.extract: %.source
>>          touch $@
>>
>> %.config: %.extract
>>          touch $@
>>
>> %.build: %.config
>>          touch $@
>>
>> X_DEPS = y z
>>
>> x.config: $(X_DEPS)
>
> The problem with this solution is that the "x.config" target is
> reevaluated every time because it does not depends on a virtual
> target, the only solution that i found is to add a stamp file for
> every dependencies.
> Using virtual target as dependency is fine only with virtual targets.

  Ah yes, you're right.

  However, using the order-only rule that you mentioned in reply to 
Thomas solves the problem. So

x.config: | $(X_DEPS)


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
