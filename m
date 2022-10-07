Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB18C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 12:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19BAB404D3;
	Fri,  7 Oct 2022 12:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19BAB404D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfHWdeLqmucj; Fri,  7 Oct 2022 12:52:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F9B940339;
	Fri,  7 Oct 2022 12:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F9B940339
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5A621BF338
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 12:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C4F7417A4
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 12:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C4F7417A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X1cFXPlk20wN for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 12:52:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A54841568
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A54841568
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 12:52:54 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id i9so2453681ilv.9
 for <buildroot@buildroot.org>; Fri, 07 Oct 2022 05:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=05uHvXsesgKYdYZri2Cp6UlTJY4635reqXIsabKvNk4=;
 b=8IsX6LbJKae4+qdq6sgiIuJU34R38w+2NmjemQ6HCzWiKhhMD8Dd5O9WIyrxJpqnNC
 kQeG06lMIOsA7mbNplSdSdHMjkfieDlsGseuIwQZNXCo5LtMrOISMTE2vCyi4ZaJJUys
 J2/if5fBXBJr3QNeZtZqXXo+4zWMU9nOlep2EtCVbwYBFrgCSGkGuIwt/dZJmchvZNkw
 v/30M7Sbz8xcA0JrmaO3GU+4Y6Q85yaoHbdgTwAA72TT4IYMPM0iKhC7CZ1Cgjq4uuHB
 SPFT+5JReJibX68rKzys4WX6HC+hDLNux7rMd86apd32B5LvXL5r0+kbk8nLKCMfFXpY
 a8tw==
X-Gm-Message-State: ACrzQf32pMidPn4DB2e9yPCxAWpidjS4gT5VosJ9Rl74BSytGAJbhQa7
 u2aBPhmBCtrWecc4cGywbd49EaNLYJJzPw==
X-Google-Smtp-Source: AMsMyM6hAbzG5g5SQunNsITDCf450Es11dVdm8C1dO98wRyJyz6ROS+vHreKtOejW1JRNL35iFk1mQ==
X-Received: by 2002:a92:4a07:0:b0:2f5:2c31:36da with SMTP id
 m7-20020a924a07000000b002f52c3136damr2325797ilf.170.1665147173063; 
 Fri, 07 Oct 2022 05:52:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 b20-20020a05660214d400b006bb7764890dsm922724iow.45.2022.10.07.05.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 05:52:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Oct 2022 06:52:50 -0600
Message-Id: <20221007125250.3259333-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=05uHvXsesgKYdYZri2Cp6UlTJY4635reqXIsabKvNk4=;
 b=M3wtBIp8uZlPNi6viVvwyhkZehv9REkCBOc3TAJPNF8r+zYmLXkb7g3mWVUcxK8Qar
 zCeaEvWJrpXZwQFARgKmh308IElxitRNFii0Svk3mkjSFhg1zP/J1leUBeio8fUK9Z+S
 whDHSVjiE7TWPUUrD1yExURzoU1eKVORPPtfqKRALWbOTRrc+7hohTY/YQN8cYT6EkX6
 rx6Nwo0PzmvNZ5SLbfwFNSU4vBqmf/wPu9qW3LwexVYJlJyGfMKNX8/C73rmfLzcnXbw
 DqgQVg/v5jRvUQUUQyvKksLbBMZ+WMLOvzq9owiPVB1mJzCEQ63BY9yuspE3cL6qTv5C
 /g3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M3wtBIp8
Subject: [Buildroot] [PATCH 1/1] package/brltty: bump to version 6.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Mario Lang <mlang@blind.guru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

README hash changed due to version update:
https://github.com/brltty/brltty/commit/4bb7f50767b8b99ea75aebda82c84b8e0df167b3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/brltty/brltty.hash | 4 ++--
 package/brltty/brltty.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
index cec074d8ce..9fc63714bc 100644
--- a/package/brltty/brltty.hash
+++ b/package/brltty/brltty.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  bc7573b0d0ab865c36607945b64c209312405571788f3b409397726f6143eaa6  brltty-6.4.tar.xz
+sha256  2f173535291ba39b5a9fc8d80c349234333d92042d95d6dd88796c98a02f316b  brltty-6.5.tar.xz
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  LICENSE-LGPL
-sha256  429be921e6bf783303a1f94cbb7f29dc4f0839e47efe38150b808f886028f4df  README
+sha256  c00c876cb4581a6b54fcc176f7e694896e5b52c4b015615566a787e8bc89fe69  README
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 600bf596df..dc5a38cddb 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRLTTY_VERSION = 6.4
+BRLTTY_VERSION = 6.5
 BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
 BRLTTY_SITE = http://brltty.com/archive
 BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
