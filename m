Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6EAC3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 20:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 654BB81E09;
	Sat, 20 Jul 2024 20:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6YwgV67mIwq; Sat, 20 Jul 2024 20:22:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AEF681E0F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AEF681E0F;
	Sat, 20 Jul 2024 20:22:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B8561BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 793CB60731
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4i0MO78kzcBf for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 20:22:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3AF4D6068A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AF4D6068A
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AF4D6068A
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 20:22:40 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4266ea6a488so24122535e9.1
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 13:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721506958; x=1722111758;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Tw6Dgr+83G0YjtXVO61VQ4Xkto5SqpmXUVsiCiIZwY=;
 b=M5eEEoYU/6gbWs5qmkAfJpRtSXEA/6WD16/rBES5z8kYsoocJb0IHPpNXl7vT840dz
 rbCpJwpVeBI/qlI3YGL/gOPkqbo2dnjPzOc2dZIdptmle0dSqEYwC5vRrBhG5x0RQB9n
 MPwfFnptx58R/w3gMbHT444HP78SIW0u6Oo9Z/A6ApFR1ExHCLlEzy3t/lFMAPkLgpnZ
 4lOZpKLAVCrfVVDi0bCqxFRtUOMqAsXl1n1pGk8xarnc2BnYcosvbUQaJOjHjxyUfseE
 x1s0Pi3Sh5Fom13cpIcz0bip0x2xri8p+EjbSOY1v0eEAKokKw2kRCxNp/wcAwK5bNDZ
 laKA==
X-Gm-Message-State: AOJu0Yzq0wWp2RiL+pipozKbT2f9Co8b1QnoXsDPs2Acb/LWewnt0awZ
 4Tg5BqonMuPdC7WoYSmeCKnNMDnIxHfD/4M1BxQU/gcPMZ30IcfmoVRwaw==
X-Google-Smtp-Source: AGHT+IGOK7zfyieoBDhWywmQu+IfS1LID0gOZhXnFCVZ75x7EZoqDdi3PiOMKqQyAGM8/V442p/w8A==
X-Received: by 2002:a05:600c:468b:b0:426:6714:5415 with SMTP id
 5b1f17b1804b1-427dc55bc31mr16420715e9.30.1721506957732; 
 Sat, 20 Jul 2024 13:22:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a5c34bsm94492715e9.16.2024.07.20.13.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 13:22:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 22:22:31 +0200
Message-ID: <20240720202231.1432128-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721506958; x=1722111758; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2Tw6Dgr+83G0YjtXVO61VQ4Xkto5SqpmXUVsiCiIZwY=;
 b=URn1AauAD3r4hHM5kh6Y4dN27c/mKicLcA1gfo/2BQxPSERv/JKtUZ9KWmqT+1Zg+o
 +R8sDz5Hv6XJnXKeVmRf8smfgKWu1u4ojBy4pHovSARwPbSAyDryz6lk+8nhZQyylAXz
 QGqbR8wqD7ZLnTRdvOTyrk5UqE8j8jnzjSKZdnV1tp1mJ9j67zaLmYpj1yyb7jX2NcEh
 SWpxNCgRD0LOZfUWoTVMo7i7cAL5e8OkaFhVJ2OYfu+yjwyOBiWPXlFMEPCE7qLJnB6/
 1l0G4p6k+hVIDCtOU5m2W1LcOUrYmjbmy8GDRJv8Pn63NBfib+jh9GOu/WzXXjYyYBGI
 Mmrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=URn1AauA
Subject: [Buildroot] [PATCH 1/1] package/augeas: bump to version 1.14.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure with gcc >= 14 thanks to
https://github.com/hercules-team/augeas/commit/792fb220a31a42043de6962fac6a1f6c030d67c5:

internal.c: In function 'xstrerror':
internal.c:436:12: error: returning 'int' from a function with return type 'const char *' makes pointer from integer without a cast [-Wint-conversion]
  436 |     return strerror_r(errnum, buf, len);
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://github.com/hercules-team/augeas/blob/release-1.14.1/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/65014642966721115ae4050c23b083a7f39e1300

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/augeas/augeas.hash | 5 ++---
 package/augeas/augeas.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/augeas/augeas.hash b/package/augeas/augeas.hash
index 03b71349ac..b3b2a2427c 100644
--- a/package/augeas/augeas.hash
+++ b/package/augeas/augeas.hash
@@ -1,4 +1,3 @@
-# Locally calculated after checking pgp signature from
-# http://download.augeas.net/augeas-1.12.0.tar.gz.sig
-sha256  321942c9cc32185e2e9cb72d0a70eea106635b50269075aca6714e3ec282cb87  augeas-1.12.0.tar.gz
+# Locally calculated
+sha256  368bfdd782e4b9c7163baadd621359c82b162734864b667051ff6bcb57b9edff  augeas-1.14.1.tar.gz
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING
diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
index a0bc294565..ac4bc7d0be 100644
--- a/package/augeas/augeas.mk
+++ b/package/augeas/augeas.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AUGEAS_VERSION = 1.12.0
-AUGEAS_SITE = http://download.augeas.net
+AUGEAS_VERSION = 1.14.1
+AUGEAS_SITE = https://github.com/hercules-team/augeas/releases/download/release-$(AUGEAS_VERSION)
 AUGEAS_INSTALL_STAGING = YES
 AUGEAS_LICENSE = LGPL-2.1+
 AUGEAS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
