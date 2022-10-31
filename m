Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD4AFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 17:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5127281B01;
	Mon, 31 Oct 2022 17:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5127281B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16JpU40cBS9r; Mon, 31 Oct 2022 17:46:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 740B781AD7;
	Mon, 31 Oct 2022 17:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 740B781AD7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 668161BF327
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 17:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 421F2405CB
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 17:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 421F2405CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szWCM0yXFIEL for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 17:46:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31FCB4055D
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31FCB4055D
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 17:46:44 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id p8so20337678lfu.11
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eLxN45HUg3A79aoadGpy9g3MN4pUpdxcmOBbdcKDcSI=;
 b=mT50gj2a+ysedM/P40gGN1zSWWZFWVDM/qb8RQaUntaYxw4JMhTYFRpK21kYQqjT2U
 VtZ8A/kQWYXSwYjnACJAZ/jq/34fy0vGiSahzsYuYsaEY3FW1h0AWmdrMdanI4t5j/ZG
 BTq/cifgH3OpfrRoyyAhd6GNjpiESgA59R4e0lK7NIyB9XOdUwdTdaqlctfNXpxcVOco
 iNwber+LUQZGVKd9n4Wp11c4NnhkQSzAX9o9z9LgO94i7APNQv1gncsDfagplpDfANoz
 DyjDcymml2Z7ci2HpjhI6IlnfmEUS2k6mdrHi2qD6ZEr3vm9DFNPTf4EImwdAA6WHt70
 vC/A==
X-Gm-Message-State: ACrzQf17/UobSrxRIeszq5PePl1RioDc3o5fzvI9uuBITyFR7Fpwb8TY
 Zy2ZD8i/7QU8OPMLtcuaMkWFCwuJlGg=
X-Google-Smtp-Source: AMsMyM4EKhZ2NylQj7/RasRlidkXxxyeMGtU2zfXpDkQXqDbvrtXWu2PCY65HpC06cefNFQ8gtsKXQ==
X-Received: by 2002:ac2:533b:0:b0:4a2:a732:1b8e with SMTP id
 f27-20020ac2533b000000b004a2a7321b8emr5393084lfh.244.1667238401792; 
 Mon, 31 Oct 2022 10:46:41 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21f:cc00::af3])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05651205cf00b004a9b9ccfbe6sm1362239lfo.51.2022.10.31.10.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 10:46:41 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 18:46:30 +0100
Message-Id: <20221031174632.377586-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031174632.377586-1-troglobit@gmail.com>
References: <20221031174632.377586-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eLxN45HUg3A79aoadGpy9g3MN4pUpdxcmOBbdcKDcSI=;
 b=ZYjFL+T/7U+Cb9Xoaqvw+xFQcSZmiNidhFftQFWA6YC9I/gH8Y7cBnimaqb2xBjbDm
 ljph3dV+kbzbZsuUhkeevCV+xfG9W8oSLTQo/YvLc74sgl5Lx6E2VON5rNgdnwKjAFVE
 5OkgtoIZ5zqSgSiwwmt9+ZCZWZnhCMuY4cNSIsdVGXpcOwn3VWPRGekf5R/BOVDmJ6/J
 7BqKgWLPs/Q3UtT6IV5x8rAoBcmscds+LGVM/T0KHdnZOWlLaLc2TGyH33TFLxNMP0Fp
 ptVcrns0goi6nA8k20X8UzZpIRuWzh+9J+RVSgxUisJ2wES3GMvoq/WPNKdcS/AcRb4b
 efNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZYjFL+T/
Subject: [Buildroot] [PATCH 1/3] package/ssdp-responder: bump to version 1.9
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
 - New command line options to ssdp-scan
 - Update copyright years (affects LICENSE file hash)

Fixes:
 - Workaround for OpenVPN /32 default server setup
 - Time-of-check vs time-of-use issue with caching of UUID,
   found by Coverity Scan, fixed by Raul Porancea

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/ssdp-responder/ssdp-responder.hash | 4 ++--
 package/ssdp-responder/ssdp-responder.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ssdp-responder/ssdp-responder.hash b/package/ssdp-responder/ssdp-responder.hash
index e8cbbb4a1f..425ad86e08 100644
--- a/package/ssdp-responder/ssdp-responder.hash
+++ b/package/ssdp-responder/ssdp-responder.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7ae49229e7c7a55fed9e36598b12e2173eecef0fffe0a386b6a10fad30f3c79f  ssdp-responder-1.8.tar.gz
-sha256  e17dc0bc91bf499d8cca5e016c22c6d2a4770e3cc1a43756a7973375a83ddb90  LICENSE
+sha256  974c244abd4ba8c87532867a84756182a1460c99072ffb1eb91c5a1f73311d89  ssdp-responder-1.9.tar.gz
+sha256  68d6fdc22e337f725fe719bf9ae6d92b1d8d0ca4cff8219b303ab76706670a8d  LICENSE
diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
index 3fee4c2006..fd7b1ea44b 100644
--- a/package/ssdp-responder/ssdp-responder.mk
+++ b/package/ssdp-responder/ssdp-responder.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSDP_RESPONDER_VERSION = 1.8
+SSDP_RESPONDER_VERSION = 1.9
 SSDP_RESPONDER_SITE = https://github.com/troglobit/ssdp-responder/releases/download/v$(SSDP_RESPONDER_VERSION)
 SSDP_RESPONDER_LICENSE = ISC
 SSDP_RESPONDER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
