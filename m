Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCAAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D1C7416AA;
	Sat, 23 Jul 2022 20:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D1C7416AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gyaihQ0g67ce; Sat, 23 Jul 2022 20:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B9304049B;
	Sat, 23 Jul 2022 20:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B9304049B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CE581BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 742CE42489
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 742CE42489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dygyg3AZRQDX for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:34:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CDE442464
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CDE442464
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:34:31 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z13so10785272wro.13
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jsYwxcvUUXPs2JkjedlxVV/bLNSjgI7Sr2Ie4CVFfho=;
 b=f9noQW6qkrlQYgepFgLlTVBlfCLJWNRs2gwBresV1/vTIgLUDyaynCUtOLj60/e/1S
 r+ojb66SGQrNer7Ue+623268ZbqXzd1BNBLDyBvG52xr5pr+6QuGpof/AdDMS/omoZ9b
 BqiY8KdJuu6vmxerUrgZjJCMumhToFVyx4O96XuXveqI+UCM7TWihVxF6oQRSMS9HNoN
 v0ZIigNjUf94H/LvXLxGh/flhEAQfmd4Pfu/rsvR68FUXMqGErfNPvmYGErXywvh6BPD
 nHaM6HRbnUZi7c1LqqRn4+E0ncYggD2CjTzX863TseH/C7fW/IMdH0rhguKpT1Ivw572
 gVLA==
X-Gm-Message-State: AJIora9/Ts6O5WAPP4FGxUAZSLSygOmNEKrcIfodZz4raAIOjD1k2gij
 OxbQ21NiPGJtBKI5hj9UK/ihZlZxH1k=
X-Google-Smtp-Source: AGRyM1vdwyuaDNRX3vjb+iBIQBkGjWhCzG0yBkCHEoMfWp/2+S3vNakXAhuZbH94tXjUGk4ktBhMNw==
X-Received: by 2002:a5d:6c63:0:b0:21e:61f3:de34 with SMTP id
 r3-20020a5d6c63000000b0021e61f3de34mr3645447wrz.13.1658608468869; 
 Sat, 23 Jul 2022 13:34:28 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c378800b003a2e7c13a3asm8691463wmr.42.2022.07.23.13.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 13:34:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:34:23 +0200
Message-Id: <20220723203423.264553-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jsYwxcvUUXPs2JkjedlxVV/bLNSjgI7Sr2Ie4CVFfho=;
 b=e59uLULnI594Q73DAw/DuPjgMD1V8TpBISMSzoTxf+cNRMOe9U/zz3TGUW0ptDnD8b
 WzlFZyXzYfXg0ZBnzzINeKfqkR3sQ0aDyRApooKBsfVz9cCzqQVinOV7AsBWFVS4IigR
 G9mok9kt1ua7xurJsw4H6XXdp/1Aaf0UHUJ8AtetLrwErqURGA1XipmSZzYrIEEpXIkQ
 Ao4Q2IaQIPbw+uF11tvUkYTbS6ZGzVh2i75EWNfYy6kcDYe4Un1L5dvAJExSHfbp5v1D
 aBe8Ay+LqMkxzp2fT9REj5VGbIkRNS9NiPlofUXfXTyPy+p6OyWcSkrhrYADHybhzsrD
 hWOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=e59uLULn
Subject: [Buildroot] [PATCH v2,1/1] package/ntpsec: fix dependencies
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add python3 dependencies to avoid the following build failure raised
since the addition of the package in commit
27b8d0ba8c4004819e092fb81c0f64f284b3aa4a:

Makefile:576: *** libffi is in the dependency chain of python3 that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/2893c213f49d37a0878dcf14ec68ef991471c70f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Add python3 dependencies instead of depending on it

 package/ntpsec/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/ntpsec/Config.in b/package/ntpsec/Config.in
index 1e88046420..c81673481e 100644
--- a/package/ntpsec/Config.in
+++ b/package/ntpsec/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_NTPSEC
 	bool "ntpsec"
+	depends on BR2_USE_MMU # python3
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on !BR2_STATIC_LIBS # python3
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PYTHON3
@@ -26,3 +30,8 @@ config BR2_PACKAGE_NTPSEC_NTS
 	  Enable Network Time Security (NTS) support.
 
 endif
+
+comment "ntpsec needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
