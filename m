From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Mon, 7 Dec 2015 20:42:25 +0100
Subject: [Buildroot] [PATCH] wine: fix sane related build failure
In-Reply-To: <5662F947.6090900@mind.be>
References: <1436094900-3217-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <5661C4CF.7030709@dawncrow.de> <5662F947.6090900@mind.be>
Message-ID: <5665E121.8010000@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 05.12.2015 um 15:48 schrieb Arnout Vandecappelle:
> On 04-12-15 17:52, Andr? Hentschel wrote:
>> Hi Thomas,
>>
>> Moving this discussion to the correct thread...
>> I meanwhile submitted https://bugs.winehq.org/show_bug.cgi?id=39660 which didn't caught much attention yet.
>> But I looked at it myself and I think I found a way to avoid patching Wine.
>> Wines configure exposes special COMPONENT_CFLAGS and COMPONENT_LIBS variables which get prioritized over "guessed" tools.
>> What's your opinion on this (afaict it works):
>>
>>
>> diff --git a/package/wine/wine.mk b/package/wine/wine.mk
>> index 38576db..e29d616 100644
>> --- a/package/wine/wine.mk
>> +++ b/package/wine/wine.mk
>> @@ -173,8 +173,9 @@ endif
>>  
>>  ifeq ($(BR2_PACKAGE_SANE_BACKENDS),y)
>>  WINE_CONF_OPTS += --with-sane
>> +WINE_CONF_OPTS += SANE_CFLAGS="`$(STAGING_DIR)/usr/bin/sane-config --cflags 2>/dev/null`"
>> +WINE_CONF_OPTS += SANE_LIBS="`$(STAGING_DIR)/usr/bin/sane-config --ldflags 2>/dev/null`"
>>  WINE_DEPENDENCIES += sane-backends
>> -WINE_CONF_ENV += SANE_CONFIG=$(STAGING_DIR)/usr/bin/sane-config
>>  else
>>  WINE_CONF_OPTS += --without-sane
>>  endif
> 
>  Looks good to me. However, doesn't sane install a pkg-config file as well? I'd
> prefer to use that one then.

Thx for the hint, but this is closer to what Wine would do, seems somewhat saver to me and I would stick to this approach if it's not a total NoGo
