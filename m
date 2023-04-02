Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E963FC76196
	for <buildroot@archiver.kernel.org>; Sun,  2 Apr 2023 12:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC4C60F56;
	Sun,  2 Apr 2023 12:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EC4C60F56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9EBZNHGsIBW; Sun,  2 Apr 2023 12:37:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B10EF60C2A;
	Sun,  2 Apr 2023 12:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B10EF60C2A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 920891BF473
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 12:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BBDC400EF
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 12:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BBDC400EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcrzQU3hrw5t for <buildroot@lists.busybox.net>;
 Sun,  2 Apr 2023 12:37:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7671A400EC
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7671A400EC
 for <buildroot@buildroot.org>; Sun,  2 Apr 2023 12:37:40 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id n19so15535412wms.0
 for <buildroot@buildroot.org>; Sun, 02 Apr 2023 05:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680439058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PTJRMDnMssaKhOmC+MPtHNABp9WPqfyEhKUJxW5ZBqU=;
 b=xW3NE6BFeN0IaL3Z10PeE01+AtwG79nBgcWtkaBeh77yY9fUtL2BUFOjwNZ22eeM2M
 p8pcJR5Bc+4xYo+JKQ5orAaZa0xB7PoK9g25wSF9/6BQVMSdtq8iRvsRHFFpHMTmEcml
 KfBE6/rIda+dTaO+Jr2F94l0XWE6VM0qgE6ZHIUDTmZTqKMoUey0z5U5tsc4ql1nVYuA
 katjhiWNub27lipshHYB4ZqFaO4Qx9/yVF497SvKilMDr9bWG1CXYVVyJwrXsnHiX60p
 Yw/Ouyfwa1SjowIgDIs0L4RtoSZFuPoTiTX/evJiRovzKt+tdttzIWY28ObaB0yjxFlK
 0VeA==
X-Gm-Message-State: AO0yUKVcz5l8KKhdGCUQ/P1I84aspxTnSwwHZivnp7Acuf2jj/tzM17T
 VdiREZVBQmvuFnP+u3lhqli6sJtVidQ=
X-Google-Smtp-Source: AK7set+RNvG8mMIoFZjnQl5rZ1PveRtzqT3gk524h4qO2HtGTj7QEvYvxjM6NPKnFWfrbKlD+9RY3A==
X-Received: by 2002:a05:600c:b54:b0:3ee:36f:3485 with SMTP id
 k20-20020a05600c0b5400b003ee036f3485mr25116630wmr.8.1680439058154; 
 Sun, 02 Apr 2023 05:37:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k22-20020a7bc316000000b003ee20b4b2dasm8911942wmj.46.2023.04.02.05.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 05:37:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Apr 2023 14:37:35 +0200
Message-Id: <20230402123735.1055900-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680439058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PTJRMDnMssaKhOmC+MPtHNABp9WPqfyEhKUJxW5ZBqU=;
 b=q2Aaxf0jGIEaEMSH0g+XtyJzSA9+Djis7Sul70GSI1paO6WkYKSfgxhEXXvPsv0b1j
 rvM7SEWNZeL9tg+SUo4d9Nr68CTeNVnjJ2ysQc2+6RWDn5rXbA/3POu0COVVcCdf6s/k
 WkQKdoDkUj9/ivTN4THLAa/7e8euZKE36RE/dAYZ8k0rZTreU97qNuJcMPIvgIFm2vcf
 CKIpg7jHpNNzLzNNbtmTg3WZn5YxSTNhqcEaoQU7PyfYkHagRhAQ79q1EX8eRA097YpA
 HIaYmPJoa14Ni6VMjMrLSjP8W56J9Kr/1mYqM8hWKG1DLe3mOEIiUfm0UdSR5Nqkr5UV
 vmCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q2Aaxf0j
Subject: [Buildroot] [PATCH 1/1] package/ccid: bump to version 1.5.2
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

https://github.com/LudovicRousseau/CCID/releases/tag/1.5.1
https://github.com/LudovicRousseau/CCID/releases/tag/1.5.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ccid/ccid.hash | 2 +-
 package/ccid/ccid.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccid/ccid.hash b/package/ccid/ccid.hash
index d42d0778f1..fcd8d10ed9 100644
--- a/package/ccid/ccid.hash
+++ b/package/ccid/ccid.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  81549b3422469d503996d03a3aed2ef1375b359167f10d66be9e3844e729322e  ccid-1.5.0.tar.bz2
+sha256  13934487e6f8b48f699a16d367cc7a1af7a3ca874de721ac6e9633beb86e7219  ccid-1.5.2.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index c05e28a5d2..0510b4c9ad 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.5.0
+CCID_VERSION = 1.5.2
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
 CCID_SITE = https://ccid.apdu.fr/files
 CCID_LICENSE = LGPL-2.1+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
