Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516ACFC617D
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01B6C60A95;
	Sat,  3 Jan 2026 11:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16YkiXmpqtMy; Sat,  3 Jan 2026 11:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95E1360AA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767438462;
	bh=0czAGp74XC+yw3/Nw01IikkBEuMSpnGaurz2qAEFteA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LdIG/y1CayMh/877n2LksUflJWWjivHj9bDevMnUpjlfiBrLzQiz5iF6yrUwBXNdt
	 e5QIztMj7+K/j29PIVpxizYA4bJWlfjVIHXBWpxhSfF7gkCf5PbhKB1bw8zMzlS7Rb
	 VPX42LSaCsfIcmDlUJcnupO9aH6AtUslUnYgTKBL/HBh3zPmvcxEu2SAOmY38a+t+B
	 EdTHvwPiluhTNpuGLkNfJKhCSU+ZMOKwRQB5FK4Xyjj7o/MdgSOjudXKPXYsbCyj56
	 aLArXw9zCdkOpnDAcKGZspQSGKstYOZTzUBUn1p6LKpeyrtrQxMxkB1Yny5yvXuq/+
	 pM+trFoZij58A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95E1360AA5;
	Sat,  3 Jan 2026 11:07:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FB06351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E9DB406DA
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6-89Vg1F_ZA for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:07:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.52;
 helo=mail-ed1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 019E6406D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 019E6406D7
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 019E6406D7
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:07:39 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-64b9b0b4d5dso21811761a12.1
 for <buildroot@buildroot.org>; Sat, 03 Jan 2026 03:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767438458; x=1768043258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AK3lvPZeXrgAUqIrN7RHthh4nvTQ7xGhcxCebptG5mg=;
 b=gbtppBopv6ph72+aFwCBXwk/eMKiIF8So+ZNmUwbUOAgsFmwREdxXEnW+JtVth28tH
 f9zdVw9KV2MhN4qb5L2vpdALT0xo8cnevTY8XvbkwivpYsZZUht6oBBFdqjqcoYPcxwV
 PI8U3963UP1g/GtX1FRnFAeuHaoie9N/8D6GcV6qnrlSQxueUTUNrMlklmMPN5l2d25W
 l7l4+p/JtrCddxj5cxqczZjQ5m0a0r2PUXZVjuSBC4efha5LVZS90wojMVwItPpfctq1
 6fD3OQlCoaoDtho8PzonMjXK4EwLZ0pSVVwW6PmD2putO3zrks0ByLaAD6fkpLcRVtp9
 xRoQ==
X-Gm-Message-State: AOJu0YzkTCsSSmzKK6kUmk5XRYuT2UcVDCM0lkCcCzxJtuAylP4GJXAH
 RIIiqkOalPKrGLCTp2vkAcllB4Skar/7NoSQrDcVqg2lTN2jnEyhuoHSgcvmzqsNVFg=
X-Gm-Gg: AY/fxX7cs6M5pP9oeICj8LrMFhhPHYyhYFUm6QEggI77OMVE8a8eqG2gBErXHyPpAsK
 CQnUHHPMLyK9jFMNIQfc6r6p6fCD4JU6FhWFzovC41vc1+UnkVrrYMRQGxtTRdpl23BcWxlgcA3
 x4ZUpitm4dAxY8hCjfukLFPm7FnfWS0DWpZgazKFXpcXOFM1KRFh2ZcgdjYi7AxXbZpiHSA+V6s
 tVDGRzI6D951XVtkIESXPJEloz+WLh09VoNkh5IQwWarpEHstI8w1qE7DMMa7mFXljLlhmzIuKg
 K4+/N/P5uvnginVsS6z17kJyIzDIVQSEGFrbmRyJcESBcADYo+p4rGc4gEfZWrWVgFH2bVhxqZr
 oJOfu76JBmcucfSNKAAY4tvaCMrjGaFzwlos6Ykpx5dwVIzDhP54+draL7FQXzzItDwazcgEzHV
 yfP3i2nCaATjU0gQF8UKuwu7sf9iQh0gcd8tJWS39CdMRQkfeOYLkt+gK9Mn2gHDpWFfCDbg==
X-Google-Smtp-Source: AGHT+IENWcxXjj5mCPPgolSIiYE2hHYQFREMNFH8XflXVSc5tToDlvasJwQ8VT8idXZLltRwjXDJ+g==
X-Received: by 2002:a05:6402:278b:b0:64b:a8d2:5380 with SMTP id
 4fb4d7f45d1cf-64ba8d25770mr39318338a12.22.1767438457481; 
 Sat, 03 Jan 2026 03:07:37 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb5f:fa00:21fc:5b5e:13d0:2b7b])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-64b914949bbsm46727993a12.19.2026.01.03.03.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 03:07:37 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: bernd.kuhls@t-online.de, thomas.devoogdt@barco.com,
 thomas.petazzoni@bootlin.com, thomas@devoogdt.com
Date: Sat,  3 Jan 2026 12:07:31 +0100
Message-ID: <20260103110731.2325676-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101175346.47e2d139@windsurf>
References: <20260101175346.47e2d139@windsurf>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2] package/icu: disable icu-config
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Seen while using BR2_PER_PACKAGE_DIRECTORIES (parallel package building).
The exact reproduction steps are unclear.

Fixes:

/usr/bin/install: cannot stat 'config/icu-config.1': No such file or directory
2025-10-25T00:09:10 make[2]: *** [Makefile:359: install-manx] Error 1
2025-10-25T00:09:10 make[2]: Leaving directory '/home/thomas/buildroot/build/output/build/host-icu-73-2/source'
2025-10-25T00:09:10 make[1]: *** [Makefile:153: install-recursive] Error 2
2025-10-25T00:09:10 make[1]: *** Waiting for unfinished jobs....
2025-10-25T00:09:10 make[1]: Leaving directory '/home/thomas/buildroot/build/output/build/host-icu-73-2/source'
2025-10-25T00:09:10 make: *** [package/pkg-generic.mk:283: /home/thomas/buildroot/build/output/build/host-icu-73-2/.stamp_host_installed] Error 2
2025-10-25T00:09:10 make: *** Waiting for unfinished jobs....

A similar proposal was made in the past for a different reason:
https://lore.kernel.org/buildroot/20230516173411.823978-1-bernd.kuhls@t-online.de/

The icu-config script is deprecated upstream:
https://unicode-org.github.io/icu/userguide/icu/howtouseicu.html#notes-on-icu-config

Therefore, it should be disabled entirely.

Testing coverage (all packages directly selecting BR2_PACKAGE_ICU):

$ cat icu.config
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_LIBGTK3=y
BR2_PACKAGE_LIBGTK3_X11=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_CPPCMS=y
BR2_PACKAGE_GERBERA=y
BR2_PACKAGE_PHP=y
BR2_PACKAGE_PYTHON_PYICU=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE=y
BR2_PACKAGE_QT5WEBKIT=y
BR2_PACKAGE_WEBKITGTK=y
BR2_PACKAGE_WPEWEBKIT=y
BR2_PACKAGE_PYTHON3=y

$ ./utils/test-pkg -c icu.config -p icu
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                             arm-aarch64 [6/6]: OK

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2: Tested with minimal config covering all packages that select BR2_PACKAGE_ICU.
    Updated commit message with test results.
---
 package/icu/icu.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index a0b43883558..6ac20857003 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -49,7 +49,8 @@ HOST_ICU_CONF_OPTS = \
 	--disable-tests \
 	--disable-extras \
 	--disable-icuio \
-	--disable-layout
+	--disable-layout \
+	--disable-icu-config
 ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
