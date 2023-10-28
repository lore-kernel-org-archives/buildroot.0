Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDD4C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 20:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0600142F2F;
	Sat, 28 Oct 2023 20:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0600142F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GtNlMkH2plMd; Sat, 28 Oct 2023 20:37:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F83942F29;
	Sat, 28 Oct 2023 20:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F83942F29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 067151BF25F
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAEAE41887
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAEAE41887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3JWzsXJQkvY6 for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 20:37:06 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A06A24187C
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 20:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A06A24187C
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4084095722aso25151605e9.1
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 13:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698525424; x=1699130224;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JxsEYXgBSsFKiOytKhRsAegzsHVh1aME15srDNp2m2c=;
 b=HQN6DPURvHZwjcvpifQzvfltwSyWgMj7gOIpQmL+OZr6n4IglaQP9YyFYKz9YzYVzl
 D2slcxqOmeYKiL1Ne9P/obhilAMA37IOi5MbC4e6bvrL49ZQQK+iK6P/sffYqB+LkgsG
 dAFI0W/Uikeeq8lfhF6EOCL6tb+RYYq9Sw6qfploX6na0y4vfGt79RnJ6LAESpwS9PUl
 ww9Vx+ZeRAkS0CChQBpeXi3QF0HAb5ELra2lne0I8s3NGETKdhPX5VvCxPNk5gIyzPMh
 5gGMv58QrKikZoip1Bi4Hq4i1yL+98ZlkjayKvxB2PL084A8HLRXV1H3w5yAIbunC5Z7
 9Bqw==
X-Gm-Message-State: AOJu0Yy0Xe4MoN9qrCX2V8l9gh6FH2UYTboXoEesDelSlvtSO/8sBGct
 +Jefm4TsHUt4kdEJriV7WBM0BHSVAaI=
X-Google-Smtp-Source: AGHT+IHDV+eHMOKncvxPyMrFcfkNaDrgZZZbhDmBiOlyMP8/RxJwpNx6fXBUc9QdQCkm1Va0ezykHw==
X-Received: by 2002:a05:600c:4b99:b0:408:4266:12db with SMTP id
 e25-20020a05600c4b9900b00408426612dbmr5171960wmp.13.1698525424017; 
 Sat, 28 Oct 2023 13:37:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v3-20020a05600c428300b0040596352951sm8231891wmc.5.2023.10.28.13.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 13:37:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:37:00 +0200
Message-ID: <20231028203700.1182700-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698525424; x=1699130224; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JxsEYXgBSsFKiOytKhRsAegzsHVh1aME15srDNp2m2c=;
 b=WLai5XbyyQIFBFbe2wLOOzsVp4Aba+U/6R/+37K5m6tnPE/o2yI2vT8YchBN6f/mfv
 DAjF1TI49Ahpx/damw7S1RFbp3VAqhQSjn1sXOLTGrzq7yOyaitiABaJRFIdh7YT+U9S
 ffeZQ42Q1wJ+9bc5zKPxJDCJawx3MpC4Fe20TV4Jk0BIJvSfv0coSNSK1NAYMktHXgf5
 nh4woocgmS95yYQ+BXMLTI+OSb8q8PwyxjQFPkE0XkdT4HRaorWywXYucTUreCaleABT
 mwbW0tDbZlM2oOGuHXBROqyFYXFl0Xbj9XuRI6+W/NEygfQDH6IQRGiTKYu0Ny6KeDQv
 /3Qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WLai5Xby
Subject: [Buildroot] [PATCH 1/1] package/cli11: bump to version 2.3.2
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of LICENSE file (update in year:
https://github.com/CLIUtils/CLI11/commit/39a5f1981e9395e82be863e77b4b0c69239ec338)

https://github.com/CLIUtils/CLI11/releases/tag/v2.3.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cli11/cli11.hash | 4 ++--
 package/cli11/cli11.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cli11/cli11.hash b/package/cli11/cli11.hash
index 12e5b4fb55..42ab5d1311 100644
--- a/package/cli11/cli11.hash
+++ b/package/cli11/cli11.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  378da73d2d1d9a7b82ad6ed2b5bda3e7bc7093c4034a1d680a2e009eb067e7b2  cli11-2.3.1.tar.gz
-sha256  89022151dbf5827a22430557ef2f8a75808dd25fa1e9a12709ef5421d363e66d  LICENSE
+sha256  aac0ab42108131ac5d3344a9db0fdf25c4db652296641955720a4fbe52334e22  cli11-2.3.2.tar.gz
+sha256  4110754959bd99e0ebc34001ed0402ff5f371364e83f9db6d1e230d02368984f  LICENSE
diff --git a/package/cli11/cli11.mk b/package/cli11/cli11.mk
index b02bd4478f..349c14fe60 100644
--- a/package/cli11/cli11.mk
+++ b/package/cli11/cli11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLI11_VERSION = 2.3.1
+CLI11_VERSION = 2.3.2
 CLI11_SITE = $(call github,CLIUtils,CLI11,v$(CLI11_VERSION))
 CLI11_LICENSE = BSD-3-Clause
 CLI11_LICENSE_FILES = LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
