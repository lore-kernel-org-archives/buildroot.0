Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F410C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 14:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19980410E3;
	Sun, 24 Jul 2022 14:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19980410E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4aC0n2s63ub2; Sun, 24 Jul 2022 14:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BAB140961;
	Sun, 24 Jul 2022 14:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BAB140961
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 693FC1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42CDF40044
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42CDF40044
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYBqvyS-lyM7 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 14:43:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A04C342443
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A04C342443
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:43:01 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h9so12636639wrm.0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 07:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=iEpUiDYT+c9QK5uSMgpYUQgbxxenZb+SwzK2VyxST3c=;
 b=V3bxyaq2sxJHa7aeWAs+dIK5NVS8/x0ynmNDFmskPG3NGcyEtkIl+2Zu2dhRno5fa6
 pr3rIlgPsJC2oUhUETfeCGbLQsbfJCA4mGR1aPk1+1pG7VscWmDgtNZpw1Oi8beQKi/a
 Y+9U9A0914qRL9EWyScd3H7p6qzGriY7q0bd1ZhTdpwwd5DbMDaVeCDBihC+pLkScTN2
 6n/asn7d+1yRUeP5qzU6BXp78gMlH4qqAJu27CH7eU6U19ynYcJdAJ+m8IjVtfLVluW1
 octr4Cs/1h3jfuWvAZ9tHjY2vB2VMem7R3bEzXDpyNWbHCO8LLUtkFVjqpfLBtoBere2
 02hw==
X-Gm-Message-State: AJIora8Spb4atdd+UzslPBeDdImHLDGBLMd+BQQ6pvIdTzqRAEZ8BAc0
 WH25IryVUixDb1WZw9bMSo2WVmnvQod9hw==
X-Google-Smtp-Source: AGRyM1tgYZ6QadX6Elt3cKh0O2BxNB4acO5Er9j55jxaqTW2ZSGxqHXk1r9+LizyPR6sEPdf55IOEw==
X-Received: by 2002:a5d:6850:0:b0:21e:6194:acb8 with SMTP id
 o16-20020a5d6850000000b0021e6194acb8mr5376223wrw.499.1658673779433; 
 Sun, 24 Jul 2022 07:42:59 -0700 (PDT)
Received: from desktop (pool181-019.domashka.kiev.ua. [78.27.181.19])
 by smtp.gmail.com with ESMTPSA id
 y17-20020adfd091000000b0021e87ec980bsm1141223wrh.84.2022.07.24.07.42.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 24 Jul 2022 07:42:59 -0700 (PDT)
Date: Sun, 24 Jul 2022 17:42:58 +0300
From: =?utf-8?Q?=D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=D0=B4=D1=80_=D0=9C=D0=B0=D0=BA=D0=B0=D1=80=D0=BE=D0=B2?=
 <aleksandr.o.makarov@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <5E6ECFAF-99C6-49CE-A9FC-5C834FDFCC3A@getmailspring.com>
In-Reply-To: <e97beaf0-5173-e6f5-1155-db4b18cadace@mind.be>
References: <e97beaf0-5173-e6f5-1155-db4b18cadace@mind.be>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=iEpUiDYT+c9QK5uSMgpYUQgbxxenZb+SwzK2VyxST3c=;
 b=CdnF3msBm1JNbxOjEs7YjgdOV7hJNfzeHfJC35UjhN0vidmqw3yDZwpPvsEcyfUNfG
 Gd8WyNF3McX48av7Xa63fxWomBWbw0McI4Id4gg2n+INHosEsRpn1gzDTvLlQeTkOtvG
 tgG/ZRWbXALJoVPBg/Q4u/I2f+IJIVN2DY3NGQ7uaqXjhfzlVWrYTh7B7o2eRzKzEqO8
 ltDw//1XzRMGdDOu2+mVPMp/DmZwh18Z/zZ6n2WeEG+FOMrOvDRhGQadbKYCxdr78vWx
 BNN6D5k7+fEHg5YO1P77jG5pChz59poz27pv3X9SdQj9p2pPYgWk0VvnRyqnJ7StdcLe
 gjDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CdnF3msB
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libest: bump version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "=?utf-8?Q?buildroot=40buildroot.org?=" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Jul 24 2022, at 11:09 am, Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Alekxandr,
> 
>  I have a few more comments on the patch. I could fix it up while
> applying, but 
> since you were pretty reactive in the first iteration, I wanted to
> give you the 
> opportunity to do it yourself (and save me a bit of work).
> 
>  First of all, what is the reason to bump to an unreleased version?
> It's 
> probably something like "Upstream makes releases very irregularly; our
> current 
> version is already two years old and upstream HEAD contains a lot of
> fixes. 
> Therefore, bump to the current HEAD sha1." It's good to put that in
> the commit 
> message. Also, the subject could be better with "... bump to current
> HEAD" - we 
> normally put the new version in the subject line because it makes it
> easier to 
> understand what's going on, but a sha1 is not saying much anyway so
> "current 
> HEAD" is enough.
> 
It makes sense to mention this information. I like to use your reasoning unmodified.
> 
> On 23/07/2022 21:46, Aleksandr Makarov wrote:
>> - Removed patches applied to upstream
>> - Added patch to fix erroneous './configure
>> --without-system-libsafec' behavior
> 
>  Since we're no longer using --without-system-libsafec, this patch is
> not 
> really needed for Buildroot, right? It's good that you submitted it
> upstream though.
> 
>> - Auto-select libsafec
> 
>  This warrants a bit more explanation. The comment that you put in the
> .mk file 
> is exactly right.
> 
>> 
>> Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
>> ---
>> v2:
>> - More detailed commit message
>> - Describe contents of configure.ac patch
>> - Auto-select libsafec
>> ---
>>   ...without-system-libsafec-mistakenly-e.patch |  37 ++++
>>   ...client.c-add-support-for-OpenSSL-1.1.patch | 112 ------------
>>   ...le-examples-flag-to-toggle-examples-.patch |  90 ----------
>>   ...libsafec-flag-to-link-against-system.patch | 109 ------------
>>   ...Fix-AC_ARG_ENABLE-AC_ARG_WITH-macros.patch | 164 ------------------
>>   package/libest/Config.in                      |   1 +
>>   package/libest/libest.hash                    |   2 +-
>>   package/libest/libest.mk                      |  21 +--
>>   8 files changed, 48 insertions(+), 488 deletions(-)
>>   create mode 100644 package/libest/0001-Fix-.-configure-without-system-libsafec-mistakenly-e.patch
>>   delete mode 100644 package/libest/0001-java-jni-client.c-add-support-for-OpenSSL-1.1.patch
>>   delete mode 100644 package/libest/0002-Add-enable-disable-examples-flag-to-toggle-examples-.patch
>>   delete mode 100644 package/libest/0003-Add-with-system-libsafec-flag-to-link-against-system.patch
>>   delete mode 100644 package/libest/0004-configure.ac-Fix-AC_ARG_ENABLE-AC_ARG_WITH-macros.patch
>> 
> 
> [snip]
>> diff --git a/package/libest/libest.mk b/package/libest/libest.mk
>> index d9f3cf87bc..faf3aed318 100644
>> --- a/package/libest/libest.mk
>> +++ b/package/libest/libest.mk
>> @@ -4,22 +4,26 @@
>>   #
>>   ################################################################################
>>   
>> -LIBEST_VERSION = 3.2.0
>> -LIBEST_SITE = $(call github,cisco,libest,r$(LIBEST_VERSION))
>> +LIBEST_VERSION = f8a6e5b53a5f70e72fe4029981df0693b17cbb32
>> +LIBEST_SITE = $(call github,cisco,libest,$(LIBEST_VERSION))
>>   # We don't build examples, so we're not affected by the OpenSSL
>>   # license
>>   LIBEST_LICENSE = BSD-3-Clause, MIT, W3C
>>   LIBEST_LICENSE_FILES = LICENSE
>>   LIBEST_INSTALL_STAGING = YES
>>   LIBEST_AUTORECONF = YES
>> -LIBEST_DEPENDENCIES = openssl host-pkgconf
>> -# libcoap support is explicitly disabled because it breaks the build
>> +LIBEST_DEPENDENCIES = openssl host-pkgconf safeclib
>> +# libcoap support is explicitly disabled because it breaks the build.
>> +# Support for libsafec can not be completely disabled - currently,
>> +# --disable-safec just uses bundled copy of library. To avoid that,
>> +# we install the full-featured safeclib package and always use it.
> 
>  The comment is not really useful here. When you look at it on its
> own, it's 
> pretty obvious that we want to use system libsafec rather than the
> bundled one, 
> so no explanatory comment is needed. It is needed in the commit
> message however 
> to explain why this is a change from how it was before.
> 
>>   LIBEST_CONF_OPTS = \
>>   	--with-ssl-dir=$(STAGING_DIR)/usr \
>>   	$(if
>> $(BR2_TOOLCHAIN_HAS_THREADS),--enable-pthreads,--disable-pthreads) \
>>   	$(if $(BR2_PACKAGE_LIBEST_BRSKI),--enable-brski,--disable-brski) \
>>   	--disable-examples \
>> -	--without-libcoap-dir
>> +	--without-libcoap-dir \
>> +	--with-system-libsafec
> 
>  It seems that this change is independent of the version bump, i.e. it
> is 
> already applicable to the existing version of libest. Therefore, this
> part 
> should be done as a separate patch, which will possibly be applied to
> the stable 
> branches (it's a bit borderline, Peter will decide in the end). So
> please make a 
> series of two patches: the first one just adding
> --with-system-libsafec and 
> removing the optional one, using the explanation in the comment above
> as the 
> commit message. And the second one the actual version bump.
> 
I factored out this change into a separate patch as suggested.

Thanks for your comments. Sending the v3 series.

- Aleksandr
> 
>  Regards,
>  Arnout
> 
> 
>>   
>>   ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
>>   LIBEST_DEPENDENCIES += libexecinfo
>> @@ -55,13 +59,6 @@ else
>>   LIBEST_CONF_OPTS += --without-uriparser-dir
>>   endif
>>   
>> -ifeq ($(BR2_PACKAGE_SAFECLIB),y)
>> -LIBEST_CONF_OPTS += --with-system-libsafec
>> -LIBEST_DEPENDENCIES += safeclib
>> -else
>> -LIBEST_CONF_OPTS += --without-system-libsafec
>> -endif
>> -
>>   define LIBEST_INSTALL_PC
>>   	$(INSTALL) -c -m 0644 $(LIBEST_PKGDIR)/libest.pc \
>>   		$(STAGING_DIR)/usr/lib/pkgconfig/libest.pc
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
