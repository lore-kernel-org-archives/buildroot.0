From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 09:51:27 +0100
Subject: [Buildroot] [PATCH v2 01/15] reproducibility: generate
 SOURCE_DATE_EPOCH
In-Reply-To: <20161118123351.69e79602@free-electrons.com>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-2-git-send-email-jezz@sysmic.org>
 <20161118123351.69e79602@free-electrons.com>
Message-ID: <d4388412-d390-fc7e-f6ba-685cb6a2104e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-11-16 12:33, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 18 Nov 2016 10:10:10 +0100, J?r?me Pouiller wrote:
> 
>> diff --git a/Makefile b/Makefile
>> index eff814b..17e49e4 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -249,6 +249,10 @@ ifeq ($(BR2_REPRODUCIBLE),y)
>>  export TZ=UTC
>>  export LANG=C
>>  export LC_ALL=C
>> +export SOURCE_DATE_EPOCH=$(SOURCE_DATE_EPOCH)
> 
> Why do you do this instead of just doing
> 
> export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(SOURCE_DATE_GIT),$(SOURCE_DATE_CHANGES))
> 
>> +SOURCE_DATE_GIT = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
>> +SOURCE_DATE_CHANGES = $(shell date -d `echo $(BR2_VERSION) | sed 's/^\(....\)\.\(..\).*/\1-\2-01T23:59:59/'` +%s)
> 
> Why don't we change the way BR2_VERSION is defined in order to avoid having to do this?
> 
> BR2_VERSION_DATE = 2016.11
> BR2_VERSION = $(BR2_VERSION)-rc1

 Or maybe even easier:

BR2_VERSION = 2016.11-rc1
BR2_VERSION_EPOCH = 1479545409

(where the EPOCH is the actual time the release is cut, instead of some fixed
time in the month).

 This is particularly useful for 2016.11.1, which otherwise would have the same
EPOCH as 2016.11.


 Regards,
 Arnout

> 
> for example.
> 
> Thanks,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
