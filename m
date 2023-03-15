Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2374C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 20:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CFFA60E02;
	Wed, 15 Mar 2023 20:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CFFA60E02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zl70u3cbSvph; Wed, 15 Mar 2023 20:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3139560E80;
	Wed, 15 Mar 2023 20:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3139560E80
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FFA51BF41C
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 20:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 867F940459
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 20:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 867F940459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EU0Ic8F2nR5T for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 20:44:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CAE1400AF
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CAE1400AF
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 20:44:21 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y4so51002539edo.2
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 13:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678913059;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xbCXvUB3mR1vfweX+43WQEMmMiYzFY6niWCAOefd9GU=;
 b=KHcoHTukfPch0IdmUE4QQapkCvxZHkLAbRebgHsdM1VwL2fuUXQDEQtuNWZ8j2wlGa
 UIZso7DUHSBE2xu3BD0wTgBN7PSntcHDMT1r+hToGMXkQm/6LENqARtTJ2cq/hxCxLS5
 nxjyQed7MEEJBSS1VzBI7t81xjK8C9gIavctkdE7XIXJPAXX2epnXCkvtYgrdwykqS3y
 iZoG9bRrxJPAqS7ubTj84NT2A/WAo2HPayJJbfm2TTdI8cWPdFLNKhlB4Y05nWw4FM3x
 plBM3vWyp30Sl3/n7hzK+Gwyq0LML21Niu5fFmqHSz7Z24XOZ4gjr1+1eFcAQFroGtFb
 XE4Q==
X-Gm-Message-State: AO0yUKWAFe8gfm0ALSgzRmAAMzSRzhaaT9KvQ3JIhmn2KNwaMdX2JuXJ
 kL6KWuc5T9M2aZ7DN6+7xH0kRGSLMBGh21g68DQ=
X-Google-Smtp-Source: AK7set9QbQ0Sm+8IcCHHiLBPSvf9oqspVWBjqt+LHS/qSKrnn+1ATSCzp455IR64q97CsBPlxYJXZg==
X-Received: by 2002:a17:906:c047:b0:926:8992:4310 with SMTP id
 bm7-20020a170906c04700b0092689924310mr8835725ejb.38.1678913059365; 
 Wed, 15 Mar 2023 13:44:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 pw13-20020a17090720ad00b008e40853a712sm2947444ejb.97.2023.03.15.13.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 13:44:18 -0700 (PDT)
Message-ID: <7ebc84b5-de98-bd18-a997-9d1dbfb3fdbd@mind.be>
Date: Wed, 15 Mar 2023 21:44:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Roman Passler <roman.passler@gmail.com>
References: <20230313183235.2665-1-roman.passler@gmail.com>
 <20230314121332.250268-1-roman.passler@gmail.com>
 <20230314233336.648cfa0f@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230314233336.648cfa0f@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678913059;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xbCXvUB3mR1vfweX+43WQEMmMiYzFY6niWCAOefd9GU=;
 b=KJe7/jymtmYSuizT3+XdA37SMX87PZ1vTlZ3DLTrOEgZUi4vyEHf6Zn6QgWQPwo+rI
 YQuI1a1MLkGfS8vU6bI56khEzDbQdPqCDjPDNBQCnjeEyPV4XsAVjAPaVfKt4tqFy2+7
 u6qrptoTJQF1JZyHSoTGf1lW+zAhoyJv7CkLhEroOy/KJ/HP+58vz1i6JTEm1clvl5CV
 qgXxllWYirif4mOOxblmlY9kfC5YxT6/lx+gOOT7kGGP1bomOGhckj45lZjkwDCeialw
 e6iySuTS8x4Z4QQrsHb5zFsHTK4JqaGLGligCTEufvbNplywgmcb+czbF8twU+LlXn+c
 UuCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KJe7/jym
Subject: Re: [Buildroot] [PATCH v2 1/1] package/openocd: bump to 0.12.0
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/03/2023 23:33, Thomas Petazzoni wrote:
> Hello Roman,
> 
> Thanks for this new iteration. I still have some concern about the
> licensing, so I've added other maintainers in Cc.
> 
> On Tue, 14 Mar 2023 13:13:32 +0100
> Roman Passler <roman.passler@gmail.com> wrote:
> 
>> diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
>> index 91eb56d930..7f828172f1 100644
>> --- a/package/openocd/openocd.hash
>> +++ b/package/openocd/openocd.hash
>> @@ -1,3 +1,15 @@
>> -# From http://sourceforge.net/projects/openocd/files/openocd/0.11.0/
>> -sha256  43a3ce734aff1d3706ad87793a9f3a5371cb0e357f0ffd0a151656b06b3d1e7d  openocd-0.11.0.tar.bz2
>> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>> +# From http://sourceforge.net/projects/openocd/files/openocd/0.12.0/
>> +sha256  af254788be98861f2bd9103fe6e60a774ec96a8c374744eef9197f6043075afa  openocd-0.12.0.tar.bz2
>> +sha256  1b8f7e37ee5afbbf95c2a4d62b12b25232e29538692663b434318503a9a88419  COPYING
>> +sha256  0a37155eb8bc0cb94477a0cae4f030e39da9317374e8a9f597e9229fd09aff78  LICENSES/license-rules.txt
>> +sha256  034da732b4f3079b8783fff756613c1cff89dec5ac80c5cdd90532b7539922a1  LICENSES/exceptions/eCos-exception-2.0
>> +sha256  f3ba76203a7b6993db31f987559cc4c621ae1ff78119ced2a669756c2c5fd3b1  LICENSES/preferred/BSD-1-Clause
>> +sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSES/preferred/BSD-2-Clause
>> +sha256  1483f15e9fddc73b5df0acab1c42d21ecd0bf6ade8a79179fb90c09f13d03dcd  LICENSES/preferred/BSD-2-Clause-Views
>> +sha256  7a83b1aeb460458db9a4bd521d7f237c45b1650f6e60ea5ffc71e49472454de3  LICENSES/preferred/BSD-3-Clause
>> +sha256  5cf024f6e3611d5c6fb98748d1a0ad99b8cf9ffe46f2d60fa10c299cd29e0a75  LICENSES/preferred/BSD-Source-Code
>> +sha256  f35396f4095619f986736ca5e2976b313d381463a35c921c9ae677cc7eb83e28  LICENSES/preferred/GFDL-1.2
>> +sha256  76515be2d7334a1a038f775238c9a4c2b37e19514248e5eea0434cdfee526f9d  LICENSES/preferred/gfdl-1.2.texi.readme
>> +sha256  7d35bc44da7bb763022e3c2c32cfc0125dd222060bc50992420599d8e65f6c0a  LICENSES/preferred/GPL-2.0
>> +sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
>> +sha256  9a41b56594cd89743ca72f188318c9871661847074dd16497ae0c695fe3ab9c9  LICENSES/stand-alone/GPL-3.0
>> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
>> index 37a06ca848..95a7fd3c2a 100644
>> --- a/package/openocd/openocd.mk
>> +++ b/package/openocd/openocd.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>   
>> -OPENOCD_VERSION = 0.11.0
>> +OPENOCD_VERSION = 0.12.0
>>   OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
>>   OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
>>   OPENOCD_LICENSE = GPL-2.0+
> 
> Roman: one thing that isn't good is that you are not adding the new
> license files in the OPENOCD_LICENSE_FILES variable, it makes the new
> hashes quite useless.
> 
> Arnout, Peter, Yann: the COPYING file states that overall the OpenOCD
> license is GPL-2.0+.
> 
> The doc is GFDL.
> 
> There are 3 files in contrib/ (apparently not installed in the
> Buildroot context) which are under GPL-3.0+.
> 
> So, do we list all license files in <pkg>_LICENSE_FILES ? Even if in
> fact we don't install anything that's under GFDL or GPL-3.0+ ? I'm
> particularly concerned by the GPL-3.0+ of course, which is seen by some
> companies as a red flag (for good or bad reasons, that's not the point
> here). If our installation of OpenOCD does not include GPL-3.0+ code, I
> think we should not mention that GPL-3.0+ code is distributed.

  Typically there should be a _LICENSE_FILES for every individual license 
mentioned in _LICENSE, plus an overall README-style file that (in broad strokes) 
specifies which license applies when. And in _LICENSE, we should only mention 
stuff that goes on the target (or in host/staging/images, actually).

  So, for this particular case, _LICENSE is still GPL-2.0+ because we don't 
install the doc or contrib. And _LICENSE_FILES should have COPYING and 
LICENSES/preferred/GPL-2.0 (and possibly LICENSES/license-rules.txt as well, I 
don't know what that contains).

  Unless the GPL-2.0+ statement is not actually correct and there are source 
files that end up on the target that have a different license; those should then 
be added to _LICENSE and _LICENSE_FILES as well, of course.

  Regards,
  Arnout

> 
> Your opinion?
> 
> Best regards,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
