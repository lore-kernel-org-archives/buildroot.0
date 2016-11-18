From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Fri, 18 Nov 2016 14:48:56 +0100
Subject: [Buildroot] [PATCH v2 01/15] reproducibility: generate
 SOURCE_DATE_EPOCH
In-Reply-To: <20161118123351.69e79602@free-electrons.com>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-2-git-send-email-jezz@sysmic.org>
 <20161118123351.69e79602@free-electrons.com>
Message-ID: <2b86da687b4149f70193b3dbf2ec9cab@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-11-18 12:33, Thomas Petazzoni wrote:
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
> export SOURCE_DATE_EPOCH = $(if $(wildcard
> $(TOPDIR)/.git),$(SOURCE_DATE_GIT),$(SOURCE_DATE_CHANGES))

I wanted keep all exported variables together, but ok.


>> +SOURCE_DATE_GIT = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 
>> --format=%at)
>> +SOURCE_DATE_CHANGES = $(shell date -d `echo $(BR2_VERSION) | sed 
>> 's/^\(....\)\.\(..\).*/\1-\2-01T23:59:59/'` +%s)
> 
> Why don't we change the way BR2_VERSION is defined in order to avoid
> having to do this?
> 
> BR2_VERSION_DATE = 2016.11
> BR2_VERSION = $(BR2_VERSION)-rc1
> 
> for example.

OK

-- 
J?r?me Pouiller
