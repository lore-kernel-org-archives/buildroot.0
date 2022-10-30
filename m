Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38FDECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ACAD4030D;
	Sun, 30 Oct 2022 21:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ACAD4030D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jrdcZ6YHL8B2; Sun, 30 Oct 2022 21:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41368402B9;
	Sun, 30 Oct 2022 21:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41368402B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 738AA1BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A49F402B9
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A49F402B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gZY3g6WgtR8n for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:52:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36C88402B1
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36C88402B1
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:52:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w14so13570206wru.8
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xy5gmDuHE2BwcX5rkL6e6KRb7pfgffo4C37Vvf1wjrE=;
 b=zxOALYE42TDbR4EXaIGFPQ85JJ037tFAwpPFA4qRLIEeA1kkMqD7bslfg5nXnmPzsi
 nsT/xvTFZSjI1R0z3gmdtjRuSYLe1ktyX76gBDF63qsCdBmu9qBpF8seiBiSuSG/rQYP
 uDCfcgnn7kCBqY3AiSjH5XXHHvS8J+MHbMC9iHCdaJRFx8FGaFjLtc5vF2H+HVbNnUWd
 00u/OyJyfMpremiK3KPcl0GwE5fpFApQ1IkKhNnZQH2X18biJ54V4mD7cTzZW2gtep3e
 gjFHtO3v84Veqqa0A4kYkHsGkFkzmE1nT/3nP75O1BlUQxpaEMaff1mqqLEJQlvwzgeo
 c0Wg==
X-Gm-Message-State: ACrzQf3umHpupoGkyv+frXQmw5CrVtlwjEZ5BBzLwAdEwEHKolYzS7dk
 sGyC2J+ScK27FZiF5ebBEhfzjWkMZc4=
X-Google-Smtp-Source: AMsMyM59+aqHcJIpIAOyQcCqIDm6ZeAp7BCRilWmzNtLBNo6697HOUxAsvt298A5l0EgVlYoLsWAsA==
X-Received: by 2002:a5d:44d0:0:b0:236:4acc:d977 with SMTP id
 z16-20020a5d44d0000000b002364accd977mr5769174wrr.479.1667166724152; 
 Sun, 30 Oct 2022 14:52:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 e15-20020adfe7cf000000b0022cc0a2cbecsm5247238wrn.15.2022.10.30.14.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 14:52:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 22:52:01 +0100
Message-Id: <20221030215201.463000-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xy5gmDuHE2BwcX5rkL6e6KRb7pfgffo4C37Vvf1wjrE=;
 b=aUpK5fzuAmIOui2wps4BTFNfZTdv/SlB+IXHVrfvHqT2KpOF2tqSD2KJelwvWzp9fp
 j5dvCY1ifNPdbe2JDp+ujSvC+1cDYOjQVrSd0hiPvFDdh84sSTdpwHwjfHZEL8zCHEC3
 YjHnSq7F/4Havo3Q+VYTtydGtOuN7cmD6x2yAGKIrs1jLABH7Bb60VDy/6Nkr2Sq4Tmb
 AlWof8SKiL1ItieCEfc34ACeMaPq0I4x6gD+rS4Vc/VkncVp8VBCJTwt8gRpErPoV5rL
 ChFpf4DKDfuggk/nZBJidlB35lVt5aAvnuXyX9a1Dn6t2GJFq6q1fq6Ny7A0nQIVVdVK
 zBeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aUpK5fzu
Subject: [Buildroot] [PATCH 1/1] package/cups-pk-helper: bump to version
 0.2.7
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to meson-package

https://gitlab.freedesktop.org/cups-pk-helper/cups-pk-helper/-/blob/0.2.7/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups-pk-helper/cups-pk-helper.hash | 3 ++-
 package/cups-pk-helper/cups-pk-helper.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/cups-pk-helper/cups-pk-helper.hash b/package/cups-pk-helper/cups-pk-helper.hash
index 18fe789389..75c5a5ffda 100644
--- a/package/cups-pk-helper/cups-pk-helper.hash
+++ b/package/cups-pk-helper/cups-pk-helper.hash
@@ -1,3 +1,4 @@
+# From https://www.freedesktop.org/software/cups-pk-helper/releases/cups-pk-helper-0.2.7.tar.xz.sha256sum
+sha256  66070ddb448fe9fcee76aa26be2ede5a80f85563e3a4afd59d2bfd79fbe2e831  cups-pk-helper-0.2.7.tar.xz
 # Locally computed:
-sha256  959af8f2f5a2761e7e498b61c9caf25ae963335031eae9972d999e9a0d97a228  cups-pk-helper-0.2.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/cups-pk-helper/cups-pk-helper.mk b/package/cups-pk-helper/cups-pk-helper.mk
index c688743160..2bd00c6912 100644
--- a/package/cups-pk-helper/cups-pk-helper.mk
+++ b/package/cups-pk-helper/cups-pk-helper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_PK_HELPER_VERSION = 0.2.6
+CUPS_PK_HELPER_VERSION = 0.2.7
 CUPS_PK_HELPER_SITE = https://www.freedesktop.org/software/cups-pk-helper/releases
 CUPS_PK_HELPER_SOURCE = cups-pk-helper-$(CUPS_PK_HELPER_VERSION).tar.xz
 CUPS_PK_HELPER_LICENSE = GPL-2.0+
@@ -12,4 +12,4 @@ CUPS_PK_HELPER_LICENSE_FILES = COPYING
 CUPS_PK_HELPER_CPE_ID_VENDOR = cups-pk-helper_project
 CUPS_PK_HELPER_DEPENDENCIES = cups libglib2 polkit
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
