Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C232C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E7B6414CD;
	Sat, 15 Oct 2022 15:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E7B6414CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLrHwtBKm6ta; Sat, 15 Oct 2022 15:07:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86BEC414C9;
	Sat, 15 Oct 2022 15:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86BEC414C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CAB641BF5DE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3D7C414C9
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3D7C414C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RSLUqOjNPsi4 for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:07:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21C4B414C4
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21C4B414C4
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:07:15 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b12so10454295edd.6
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 08:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DUh66jw8bVvPmW/bMAzIlqzpKECIqDfRQbY+tWS+WM8=;
 b=MEeGq996xicE30H/WtEZeXx1UIDpE43dbdmwYTYxMqKh66JEfDDLqzvRTAYenqH+T5
 ZqYgNs8VpC0eQM82PrML+kuC0bAFsAO+W4dGXEXtSS8osmmmgVUOd24Xs+3fH03wkOPm
 RNb2Ybx7N7pmTQC+ip4w1V0mKEUN5UosP/zfwBPq8fSD+SNDzKjb6FvQGy/ZECgoH0bh
 PQ0VigX+TaXpWHDXn0OcqjbrTvtBJvviieowmD6eZZ1dohIM59fAdkdnggisqMgE5KG/
 fI180w5sbqmv251mdXri+a2R/NOZUkRRoOhYzS6AeDPjvEa0n8ZOwWnXuQZ8P50RxQer
 cjcQ==
X-Gm-Message-State: ACrzQf34+2sHUZjrleMg6dim5j7ErGFP24/SnIGsiplhBiTm5oiDXKbf
 YF0n5wXnka1JhWy/j1njYdZc8Mz7wAZ9mw==
X-Google-Smtp-Source: AMsMyM5HLGrXOTx9pEe9BdWOcdrIB+ZauAE4Q1NexcSVAZCRX/IfBFg2/hq1bBcgJJWBDgrOQbxMsw==
X-Received: by 2002:a05:6402:c45:b0:442:c549:8e6b with SMTP id
 cs5-20020a0564020c4500b00442c5498e6bmr2629774edb.123.1665846433036; 
 Sat, 15 Oct 2022 08:07:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-101-110.retail.telecomitalia.it. [95.244.101.110])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a1709063a5800b0078128c89439sm3298991ejf.6.2022.10.15.08.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 08:07:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:07:02 +0200
Message-Id: <20221015150702.3645905-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DUh66jw8bVvPmW/bMAzIlqzpKECIqDfRQbY+tWS+WM8=;
 b=LTWamI/LS18lZ5kMYege2VeLLmJ7RhomuMsrAHjI9rAEqEhePUAnAB6BsYADexyD9j
 RWiTktSz1CJUf2ahpBhfqjAFXp+JQdYyYQTmhF8GZexmFE5i+IYcR8/Z8NZv+SP77Ukv
 IFNyjqrPfcFVHZyvOkKxB8LjdGlm6nhv8wopE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=LTWamI/L
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.4
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix memory leak cause by getaddrinfo
- Fix crash when last block actual size < m_output_size
- Add -dm to disable small memory for debug purpose
- Fix a dead lock when reset stream
- Stop http download when error happen
- Add error check for all request_data
- Fix linux build warning
- Add gzip stream support
- Rework buffer management to support small memory version
- Fix support of empty environment variables in Windows OS
- Fix crash when environment variable is last word in script
- Fix update libusb path
- Update libusb submodule
- Drop vs2017 support.
- Use $(DefaultPlatformToolset)
- Try remove PlatformToolset and set WindowsTargetPlatformVersion to 10.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index de00c649b12b..50da0f9bf3d9 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  9fcfe317c379be1e274aae34c19e1fd57188107f8fd0cdd379fe4473aacc92b1  uuu_source-1.4.243.tar.gz
+sha256  baaf3e031958075b96530d43d7435f19cb428088894066e0b02349a3b9666666  uuu_source-1.5.4.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
 sha256  584bfbb18b4c08b872d48b80419dd453307212a144134fb516bd6ddc0700c2e8  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 7ed2599598c0..681c1fbc44e5 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.4.243
+UUU_VERSION = 1.5.4
 UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
