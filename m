From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 May 2016 20:54:24 +0200
Subject: [Buildroot] [PATCH 02/34] reproducibility: override locale and
 timezone
In-Reply-To: <20160507151550.48e49913@free-electrons.com>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-2-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160507151550.48e49913@free-electrons.com>
Message-ID: <968b80a6-b811-52dc-c4e8-0b8b3401216d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/16 15:15, Thomas Petazzoni wrote:
> Hello,
>
> On Sat, 30 Apr 2016 09:48:58 +0200, Gilles Chanteperdrix wrote:
>> ---
>>  Makefile | 7 +++++++
>>  1 file changed, 7 insertions(+)
>
> Missing SoB.
>
>> diff --git a/Makefile b/Makefile
>> index ec7dccb..86b2ed2 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -218,6 +218,13 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
>>  -include $(BR2_CONFIG)
>>  endif
>>
>> +export BR2_REPRODUCIBLE
>
> Why ?

  I guess because it will (or may be) be used in some helper scripts...

>
>> +ifeq ($(BR2_REPRODUCIBLE),y)
>> +export TZ=UTC
>> +export LANG=C
>> +export LC_ALL=C
>> +endif
>
> Regarding overriding TZ, LANG and LC_ALL, I'm wondering if we shouldn't
> do it unconditionally, regardless of the value of BR2_REPRODUCIBLE.
> What is the benefit of leaving those variable to their value from the
> build environment?

  For the record: I had the same comment about this entire series. Most of it 
should be done unconditionally, only the aspects that may be annoying for 
debugging (like the timestamps) should be conditional.

  Unfortunately, that will be a cause for discussion... For instance, LANG=C 
means that compiler error messages will be in English instead of in your native 
language. Do we really want that by default?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
