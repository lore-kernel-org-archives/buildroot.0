Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08EAC43334
	for <buildroot@archiver.kernel.org>; Sun, 26 Jun 2022 19:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B0F60F41;
	Sun, 26 Jun 2022 19:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32B0F60F41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bbtFvQ9Qv-B2; Sun, 26 Jun 2022 19:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4896D60F09;
	Sun, 26 Jun 2022 19:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4896D60F09
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B98A1BF3CE
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 19:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F1F6404F7
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 19:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F1F6404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMKF8nQgS6Nt for <buildroot@lists.busybox.net>;
 Sun, 26 Jun 2022 19:52:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CD154023F
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CD154023F
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 19:52:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id n185so4183714wmn.4
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 12:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cEqw5pdzd5Zq/Fh4lovuMCiHK3oeXcHwhB1F0eaY/tM=;
 b=Bl/iCe3TKiHF/PkSIghsXcI+DAPSANZxGkwsJusxl0lMVV6hjUoXWpyWLSm8XS16Z3
 raXBcPI/nLtPWnZHUKFdhP1lAs3g3HDvTteHEpOMFZRqNXP0Ha2NI13KijuIKZ0t/vyM
 kC2ZZnT2rsDL41v5MKBftTI0vNzetjQT61i5Y2JlHsW6/0NJ7xvXiDnm7v0jb1NArb+6
 6p//c46NJeVc7ONIq4P6yXtZMySCTo/m0vuobkvA33fQlSYUjpb8e6NYE6T3ipg1ZQCe
 ziNnu5z8LsgjmJBsdn70zq2P5qXBJrKPTvwoRywtH9gTbdqyiCaQQjmA31Amcw06VPok
 k6Cg==
X-Gm-Message-State: AJIora+Qetkj4uNRc38jHpLoVwDHq0ICl8TdAKq8nsED3jsUEZeNKtsL
 F3DyYXjKOsAn5kewWsw8M8sl3L8RIy0=
X-Google-Smtp-Source: AGRyM1ui6FjSZRiC2uFhaRwzmQE35/1uFer/ZZ10h2OgAso+k2z/t4ur2KHxUKN8k7FyssHdyO+oBw==
X-Received: by 2002:a05:600c:3493:b0:39c:8731:84c3 with SMTP id
 a19-20020a05600c349300b0039c873184c3mr16580540wmq.45.1656273119344; 
 Sun, 26 Jun 2022 12:51:59 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a5d6145000000b0020cdcb0efa2sm8410576wrt.34.2022.06.26.12.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 12:51:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 21:49:06 +0200
Message-Id: <20220626194907.1569568-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cEqw5pdzd5Zq/Fh4lovuMCiHK3oeXcHwhB1F0eaY/tM=;
 b=TpEig+5EzKET6pL3IBR06pVPWDYUdiFolPm5AFZCP7L3w0L5tJbDtNx+QHX7basC4z
 uVWCgepDlpki+ObgVyPLir/CipKhLrjDmfNYPZl3Nlfpu+07jFVkTyQvJ8l11gMYdhwT
 4L+H+Q/brPAvc8IgUe/wTsF4youqcglx48DenbSGsZui9cKvkt5xCNCLEy/0a/ADEtOV
 YZyndBRWtmyxfWgEzL05J83ixOAkzTQqVsv5RoZEmGa8TkJZ4dhTjozX8iBdswbVOqVy
 4jdRPIAuGsP5/79k5ByycMlcXDDUBeoa0q/gfLU6+/2n29MmvRTf6Z2L/CGtuiHC6+ZW
 TskQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TpEig+5E
Subject: [Buildroot] [PATCH 1/2] package/speex: bump to version 1.2.1
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

- Update COPYING hash (trailing white space removed:
  https://gitlab.xiph.org/xiph/speex/-/commit/1e64d72bbfd86695eb72e2c122506e071894cb1a)
- Update indentation in hash file (two spaces)

https://gitlab.xiph.org/xiph/speex/-/tags/Speex-1.2.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/speex/speex.hash | 6 ++----
 package/speex/speex.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/speex/speex.hash b/package/speex/speex.hash
index f5235d6262..5a2f942e82 100644
--- a/package/speex/speex.hash
+++ b/package/speex/speex.hash
@@ -1,6 +1,4 @@
 # From https://downloads.xiph.org/releases/speex/SHA256SUMS.txt
-sha256 eaae8af0ac742dc7d542c9439ac72f1f385ce838392dc849cae4536af9210094  speex-1.2.0.tar.gz
-# From https://downloads.xiph.org/releases/speex/MD5SUMS
-md5 8ab7bb2589110dfaf0ed7fa7757dc49c  speex-1.2.0.tar.gz
+sha256  4b44d4f2b38a370a2d98a78329fefc56a0cf93d1c1be70029217baae6628feea  speex-1.2.1.tar.gz
 # Locally computed
-sha256 671bb5d8fd3c6b05a2e831d90f978ac27965c92bd8ea6d16b3df76e3440c0e9f  COPYING
+sha256  2654a4264b2bfe298dedc508748d140111840c315cc8eb646a3a68c13fa75b01  COPYING
diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 674be78ff8..6d61e93833 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPEEX_VERSION = 1.2.0
+SPEEX_VERSION = 1.2.1
 SPEEX_SITE = https://downloads.xiph.org/releases/speex
 SPEEX_LICENSE = BSD-3-Clause
 SPEEX_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
