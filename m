From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Jun 2015 23:48:13 +0200
Subject: [Buildroot] [PATCH] libxmlrpc: fix static build
In-Reply-To: <20150614230049.6ab5e979@free-electrons.com>
References: <5425b32256128e928f8ad22c596f91ab7ac5f9e8.1433859609.git.baruch@tkos.co.il>	<20150612231307.690e22d0@free-electrons.com>	<20150614190738.GE8165@tarshish>
 <20150614230049.6ab5e979@free-electrons.com>
Message-ID: <557DF69D.2060903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/14/15 23:00, Thomas Petazzoni wrote:
> Dear Baruch Siach,
> 
> On Sun, 14 Jun 2015 22:07:38 +0300, Baruch Siach wrote:
> 
>> Unfortunately, these make variables are set explicitly in common.mk. So 
>> passing them in make environment has no effect.
> 
> Argh, ok.
> 
>> Now that I think about it, why don't we have a similar thing for MAKE_OPTS, 
>> say, $(PKG)_MAKE_VARS. Something like (untested, host packages missing):
>>
>> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
>> index 1d694f0618fc..27ff16235f27 100644
>> --- a/package/pkg-autotools.mk
>> +++ b/package/pkg-autotools.mk
>> @@ -154,10 +154,10 @@ endif
>>  $(2)_CONF_ENV			?=
>>  $(2)_CONF_OPTS			?=
>>  $(2)_MAKE_ENV			?=
>> -$(2)_MAKE_OPTS			?=
>> -$(2)_INSTALL_OPTS                ?= install
>> -$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
>> -$(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR)  install
>> +$(2)_MAKE_OPTS			?= $$($(2)_MAKE_VARS)
>> +$(2)_INSTALL_OPTS		?= $$($(2)_MAKE_VARS) install
>> +$(2)_INSTALL_STAGING_OPTS	?= $$($(2)_MAKE_VARS) DESTDIR=$$(STAGING_DIR) install
>> +$(2)_INSTALL_TARGET_OPTS	?= $$($(2)_MAKE_VARS) DESTDIR=$$(TARGET_DIR) install
> 
> Why not. Though I'd be more convinced if there is some evidence that it
> would also be useful for other packages.
> 
> Or maybe we simply need to make $(2)_MAKE_OPTS used for both the build
> and install steps?

 Well, MAKE_OPTS includes the target that has to be built, so it can't just be
reused as is for _INSTALL. So Baruch's proposal makes more sense to me.

 Regards,
 Arnout

> 
> Best regards,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
