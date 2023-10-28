Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAA6C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 20:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E84E42E68;
	Sat, 28 Oct 2023 20:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E84E42E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EwhRvPI8Amug; Sat, 28 Oct 2023 20:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 933CC42E61;
	Sat, 28 Oct 2023 20:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 933CC42E61
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D949A1BF25F
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF49642E61
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF49642E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q0TTmXsGRtGB for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 20:08:54 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 485A542E5D
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 20:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 485A542E5D
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32d834ec222so2004226f8f.0
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 13:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698523732; x=1699128532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ox8tPKJtpaWJ+cnJ8XkGeAHZ90Mgcqhe7nFI4vZP1eg=;
 b=T/9uFTOb8BlFZpPVNi2UzC11za1+LGYeuqCkhm0EQUatKfAXbMvvUepaYv84u3QvUZ
 BVSMCrDjklCaDgnOCIQDvYlHY4eQKIfPjc72xb6FLr4QLYa6a4Na2XTK0lejIqHxK9Pj
 rsQVIrfHz/XrAQGiWpY+58bWE1ofORju+6tczUPZ1+IhsgzLXS+pkzzVB0R1VFoOz1fH
 +0dLg2G7M1yAKjKTsOAhGx+NNDivdJsGNbOC5Xe/Md4sF+nrwh0KN9rrvrlP547csFIJ
 jEnV/+gbn2TYSdFDJlVDMvOr8VRex/KUtnCHZTRjuOLTeJFqYR3B3Y2QH7t6Tn30idnN
 MdTA==
X-Gm-Message-State: AOJu0YxFpIm9idokJXpeQR5QumskYRNc1jJ/R3tx63pNFF2ouK2Xyg1A
 GuPSeq1NLdBdkPmCtkPJS0qGqPNiGyw=
X-Google-Smtp-Source: AGHT+IHaZQ0Ns/ZUqYknxfiis7d8Pu9IO56iSnDDRR5uWQIfAk3liQYKDeaS+DLJ9IMlRrMOuu0b8g==
X-Received: by 2002:adf:d1e8:0:b0:32f:7d50:267e with SMTP id
 g8-20020adfd1e8000000b0032f7d50267emr1564501wrd.9.1698523731830; 
 Sat, 28 Oct 2023 13:08:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h6-20020a5d4fc6000000b00327de0173f6sm4478769wrw.115.2023.10.28.13.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 13:08:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:08:48 +0200
Message-ID: <20231028200848.1134223-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698523732; x=1699128532; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ox8tPKJtpaWJ+cnJ8XkGeAHZ90Mgcqhe7nFI4vZP1eg=;
 b=Dk9y+C3WAsyRxXkEtfIDPOMoPNSsZ48ijb+W6AXs4EFlNI5/3a8I5k+4Zu9C4z4bRh
 b6hg+bB4D2Zn3lJ49cxu1HeWhcH68bKpP23ZCMEAZQZVGikOyZGMHylngI4NGUnjC/1K
 KHFDN1k1n4REZWzRL/vdmn/fRNHOa1X34G2UlZcV+o6X6hZOLiiHgH9CbYPUqCasO0Cx
 kfG6wVh9YweJapL6DkWSQpeThBJUiq0Wa/dk9CSf4yV/1cdJj3Nq9Lvxwggj5/9p1kz2
 Nz2oVqK575lZ2avnFISm2GkGxwCa+pqBMONVjbDzqDMKZLEGzbAG1c8OYVf8NYVv6UtP
 Enpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Dk9y+C3W
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXpm: security bump to
 version 3.5.17
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

Fix CVE-2023-43788, CVE-2023-43789 and CVE-2023-43786

https://lists.x.org/archives/xorg-announce/2023-October/003424.html
https://lists.x.org/archives/xorg-announce/2023-October/003425.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.hash | 6 +++---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.hash b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
index a041f0d440..3582169891 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.hash
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003385.html
-sha256  e6bc5da7a69dbd9bcc67e87c93d4904fe2f5177a0711c56e71fa2f6eff649f51  libXpm-3.5.16.tar.xz
-sha512  ee564311f8c1c9c08ed1035d55c287ecf7c20c6fee09ad448acfab59f38fd1ef381d4a24b4af2b581f3033730eebc7c690918e52ba706de689d1ef11085edac2  libXpm-3.5.16.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-October/003425.html
+sha256  64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43  libXpm-3.5.17.tar.xz
+sha512  52f9d2664a47a26c1a6ad65d18867de870b66947b0b0d99cca3512756a0aaa6ce2a245c0b49f20b70c3ce48bf04c47c333e8119a147465c277bca727f6ab017e  libXpm-3.5.17.tar.xz
 # Locally calculated
 sha256  a80d706759624a04aa90fd62bc644a360fc3d72e08dcbfb129f167c11ca285de  COPYING
 sha256  cbe4ced0abc8a32bea471204ae01038c202758ce4e772d3d329a341ffa761e71  COPYRIGHT
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 51f6283370..0bba3ea946 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXPM_VERSION = 3.5.16
+XLIB_LIBXPM_VERSION = 3.5.17
 XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.xz
 XLIB_LIBXPM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
