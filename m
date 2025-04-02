Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F23BC28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 18:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18C61812B7;
	Wed,  2 Apr 2025 18:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcPc-mr4Tqfv; Wed,  2 Apr 2025 18:36:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45A89812E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45A89812E1;
	Wed,  2 Apr 2025 18:36:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B035B117
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 18:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96ED340257
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 18:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EelMp7qHaoo for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 18:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05D7C4021A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05D7C4021A
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05D7C4021A
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 18:36:44 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7396f13b750so105660b3a.1
 for <buildroot@buildroot.org>; Wed, 02 Apr 2025 11:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743619004; x=1744223804;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZTpL1ZRPJWD/gQeHthVxq5VrQRWBBj3xxYA2xbgAQnU=;
 b=CiQAUVT1Kd8/YrtOa8m04MgU1VSo2FOu5nkSPLAUaBmb/59WVHfCylNrjCp9vr7lWT
 zqTT3mvuhGeqYHK7ib+j7XJEUV2vBOKyNyw//ZHox7EOpUkwXYj+zib+uCqW4JsIdGBe
 gZjRcYFM3VDVO72yH3gnKub1THFf1ezZnvRlPRulLcxDeAoe1i/jGg1sqkksxt9UF67b
 RbVszTQjhuex9g5hWjYCO1/mTslzvozM5MnJ7tw+2x1CvMYkeVcRDH2sZboMlqZnkPPM
 ApbVBncehJ1pvr1fMf1gMKBnZZ1AqL52hbkEgxa0yhsDxmLaKPrqvkeN/L1JbaE1+n0Q
 9w1g==
X-Gm-Message-State: AOJu0YwEk69p9YrGes7kW0XdNshvDBfyj0G2jnPH53oFAiG2qu7hPi0O
 4SNUdLBIqVjUkvzePlr1s3Y8hXGyYJH0VpRhOwqQnwY5aksDjNsE+LLB4Mx2Jfp7UDHhiEJh9gI
 W
X-Gm-Gg: ASbGncs0fZRUTsm5dy64HWRPAGHTztbzeSrTaShWRJrepgl8lXCbarmHcuCWLHMT9Qu
 jBk2z7vHvmjaqn0oX4kG9H+V43fhiHm8mbQehReW6SboWYPZTSfWdJ4zpwrc+WeQL4hhOkw2KpI
 T1f4CfIRxTo3P9Q0O7agpyYKTuRaJBIkgpWSh9RXmSM5JZw6C6yvC+wNaREAbYWzkqKoY1JegCF
 uXeXmRDAaKIJEzqLjcHnvEYxYTlEwVGC42+ZdhRoscimN0suTVYhwMbGZi2caUg5bJ4GmABErb3
 jXHc3sVANseswdIxSTRFEbDBbXk5oW/XB0E=
X-Google-Smtp-Source: AGHT+IE0sBBXMXMTg1JFkMoaXeQ3uYXcw4Lvub67CeFoDq6Ur0htj9UReON1lQJA0Fd9j1tSWdrbdQ==
X-Received: by 2002:a05:6a20:d704:b0:1f5:717b:46dc with SMTP id
 adf61e73a8af0-200e4ccd906mr4617686637.27.1743619004277; 
 Wed, 02 Apr 2025 11:36:44 -0700 (PDT)
Received: from ghost ([50.145.13.30]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af93b6a0948sm8653937a12.31.2025.04.02.11.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 11:36:43 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:36:41 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <Z-2DuYT4ymI3vNBn@ghost>
References: <20250331-bump_linux_pam_1-7-0-v1-1-dfc4b55a0dd8@rivosinc.com>
 <f0605945c9018fab7218ae831b193b3b@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0605945c9018fab7218ae831b193b3b@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743619004; x=1744223804;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZTpL1ZRPJWD/gQeHthVxq5VrQRWBBj3xxYA2xbgAQnU=;
 b=U5UKUgUKaPnA8Vxn6wCtDAe6dmFrTQqjjR4Vrwss4Vo2dxp0uTZ1hMMVqn519QekzI
 eHNCXk1CY9ptHm5dmygfpDcc4NTPfbInxz/2ISHZ6gXv9JH8PN8OryX+4UQggeJkio00
 eJl8WDnfqFNg5AnqVA50tfS/tZRwSueTNOILwsrwgs5jr4qvNSlmHSUrH29zDi5nvMk2
 NDatkwger4OiwFshHmEVZ4SIfJ4nZgHeZIP8c8sUDKQJvPIE8OgNZJN1eXsDc0zOouId
 CLLnFBY5TKXx8XbKdR10/wsdcEm2mrmGjAU6bNMVQ84v1MDUpvGb3yluSwrCgQFDrGxQ
 wPiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=U5UKUgUK
Subject: Re: [Buildroot] [PATCH] package/linux-pam: bump to version 1.7.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Apr 01, 2025 at 09:00:07PM +0200, Julien Olivain wrote:
> Hi Charlies,
> 
> Thanks for the patch.
> 
> On 01/04/2025 04:57, Charlie Jenkins wrote:
> > Bump to latest version. Remove patch included in release and fixup the
> > configure options due to linux-pam migrating to the Meson build system.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> [...]
> > diff --git a/package/linux-pam/linux-pam.mk
> > b/package/linux-pam/linux-pam.mk
> > index 23b09efbaea6a148924bc0eb7721e6cbec7f8e6b..4f18a12c2059e70498ecb0adb1b23dff2fa04388
> > 100644
> > --- a/package/linux-pam/linux-pam.mk
> > +++ b/package/linux-pam/linux-pam.mk
> > @@ -4,17 +4,15 @@
> >  #
> > ################################################################################
> > 
> > -LINUX_PAM_VERSION = 1.6.1
> > +LINUX_PAM_VERSION = 1.7.0
> 
> This new version seems to introduce new build failures. See: [1]
> 
> Apparently, setting BR2_PACKAGE_LINUX_PAM_LASTLOG=y requires a libc
> with the logwtmp() function. Maybe this option should depends on !musl.
> See for example [2].
> 
> Also, the bootlin-microblazeel-uclibc toolchain is failing. It seems
> to be due to linker warnings to be treated as errors. Maybe a fix
> like [3] should be added.
> 
> Could you have a look to those issues and send an updated patch,
> please?

Thanks! There's a third problem I am not sure how to resolve. The
problem is:

<path to buildroot>/output/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/13.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in <path to buildroot>/output/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/13.3.0/libgcc.a(_umoddi3.o)(.eh_frame) prevents .eh_frame_hdr table being created

Do you know how to resolve this?

- Charlie

> 
> Best regards,
> 
> Julien.
> 
> [1] https://gitlab.com/jolivain/buildroot/-/pipelines/1747133176
> [2] https://gitlab.com/buildroot.org/buildroot/-/commit/14532e4fc6e02a755b30e634fd60f53b92655bcd
> [3] https://gitlab.com/buildroot.org/buildroot/-/commit/132eec5c47f5f9542d0c2e93d12341d624627de0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
