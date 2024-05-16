Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69DBC25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 16:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7325281270;
	Thu, 16 May 2024 16:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swmHNgbEGj2H; Thu, 16 May 2024 16:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66EDE83A7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66EDE83A7F;
	Thu, 16 May 2024 16:31:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DBBC1BF5A3
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 16:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 498A541798
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 16:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LXkg4X9MPHN for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 16:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC22041781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC22041781
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC22041781
 for <buildroot@buildroot.org>; Thu, 16 May 2024 16:31:50 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4202ca70287so4872805e9.3
 for <buildroot@buildroot.org>; Thu, 16 May 2024 09:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715877108; x=1716481908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1/6jNaTkllgFS8RbrsTGIT4c7bgWRIQ/RUTiXm5ywVo=;
 b=PJp4IUWiywUeYR1w4PGLEyy7Yl5y2ELTnNhh86Bwybi3ajfxjOnRbKmfHrJw2fDgqw
 tFVLv2jBL8njsk+Uzwy8+pdoJGTsA8J675n9c8Rb1uqSu2mVVc9wadpdnMJdEvemaUoH
 wwqUQ7TWy5OprOBQ99cyRtVP8SfMJN7MK5Sko7FUh2yv0TIFiJ4oPdZP2ruNwJnvqxlS
 wqWO4CRnYvfhJ1CRc9g5QQudYX14LsmRWxtYfO+U/usrpsRwdo3I+iW3sw93cPLJPO/Y
 0wJ8IgF59R1zQV+NGHp+FQbZT22pC5qZly03NtAJx5hr/aU5eP+CYwWBRshji11zH6Tb
 +2wg==
X-Gm-Message-State: AOJu0YyKI8dYRLZFcJUtPr7ZusjL4hkLOEimSb3Nm9rV6njohlxYHklm
 /uD0Z+CbIZzH9gb9tK2gJT2igqGIH22gclnRrmqXutEvKTODQA45f/4Vxg==
X-Google-Smtp-Source: AGHT+IF1NoMYscPYm+3uUgw5i/ioCq4Iqsc2XwSO31gFg05Imuxm1YOTXcNP332izffCVqhcYfHQxw==
X-Received: by 2002:a05:600c:3b86:b0:41c:2992:a3be with SMTP id
 5b1f17b1804b1-41feac556c6mr179000175e9.29.1715877107635; 
 Thu, 16 May 2024 09:31:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41ff7a840d2sm235583455e9.39.2024.05.16.09.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 09:31:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 May 2024 18:31:44 +0200
Message-ID: <20240516163144.640424-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715877108; x=1716481908; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1/6jNaTkllgFS8RbrsTGIT4c7bgWRIQ/RUTiXm5ywVo=;
 b=VjhXCAh3CP4l5tBLzve+/iN9ftHqbZMDUplQhxj6htbc89Spbg3WNVGSLaqSZ1DrHi
 RRdFq+2Mf/K2b+k/WNyeEeCdA+udG6wXFR9xJualE2S0/155Fo/6HUPmaorg3TJgYuBa
 nXImhnPzndrW+3qeMlDYHlPujwdEbNSnBV+vFaZIsWh4CMdXBZu20qYoZzhQFblJKwCU
 d+x9ENrH++ugIKsj5b19i6lrySH7/eUyQRINhAMrhDdlZdI5LtW93mrPcCzR7mX9OzW6
 WdSyBDB5SeciCCoz8B0pDrZ0cu1hMeqC0HVtSHFbMNG0nCw8pKECJtP3mgNohHxXJofg
 ZTSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VjhXCAh3
Subject: [Buildroot] [PATCH 1/1] package/putty: security bump to version 0.81
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
Cc: Alexander Dahl <post@lespocky.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The only change between 0.80 and 0.81 is one security fix:

 - ECDSA signatures using 521-bit keys (the NIST P521 curve, otherwise
   known as ecdsa-sha2-nistp521) were generated with biased random
   numbers. This permits an attacker in possession of a few dozen
   signatures to RECOVER THE PRIVATE KEY.

   Any 521-bit ECDSA private key that PuTTY or Pageant has used to
   sign anything should be considered compromised.

   This vulnerability has the identifier CVE-2024-31497.

Update hash of LICENCE file (update in year with
https://git.tartarus.org/?p=simon/putty.git;a=commit;h=f2f28ac0386eebbd45ea605818d31d62d219f589)

https://lists.tartarus.org/pipermail/putty-announce/2024/000038.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/putty/putty.hash | 8 ++++----
 package/putty/putty.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 84569a31e5..30b749c47b 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,7 +1,7 @@
 # Hashes from: http://the.earth.li/~sgtatham/putty/0.80/{sha1,sha256,sha512}sums
-sha1  9c4a96f63ee3e927472191c935cc89228693c03a  putty-0.80.tar.gz
-sha256  2013c83a721b1753529e9090f7c3830e8fe4c80a070ccce764539badb3f67081  putty-0.80.tar.gz
-sha512  c8a6b6fa54ecd8bcf4ec274fef51343dd9996e6458b250b5555c4dc88ded25e87f97277da482c29858510e65635112d541f559ab683635bd950572d850129f90  putty-0.80.tar.gz
+sha1  8c88d871855d3730a0473bb1cb1006654e73b680  putty-0.81.tar.gz
+sha256  cb8b00a94f453494e345a3df281d7a3ed26bb0dd7e36264f145206f8857639fe  putty-0.81.tar.gz
+sha512  d86f2fd0e126b18275d58cf64334b3b27c450899a1c2be2502de9faa2ef58f7fc8efc5d45f25c8395623f1e21917aa02407343bb2fee44c4c00b9f81267d5ecd  putty-0.81.tar.gz
 
 # Locally calculated
-sha256  7ede37f344ee03436c155a375ecb6cdb42a77105baa6e7804bf43260dc4a0c54  LICENCE
+sha256  e0410341c5e45f7479c28d79298edbf615589cdfc115b2d69683d4ccd0425ce0  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index bff6e78074..617518e647 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.80
+PUTTY_VERSION = 0.81
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
