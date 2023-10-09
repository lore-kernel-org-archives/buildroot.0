Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456BCCD613C
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 21:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBCC381C26;
	Mon,  9 Oct 2023 21:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBCC381C26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YX4ItKf0n9bR; Mon,  9 Oct 2023 21:36:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B77B881BD4;
	Mon,  9 Oct 2023 21:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B77B881BD4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 824171BF42C
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 21:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63A3A415D9
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 21:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63A3A415D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lwtr0BTMkz-6 for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 21:36:28 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 025A1415D7
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 21:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 025A1415D7
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1c6219307b2so29875885ad.1
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 14:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696887387; x=1697492187;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kjSRNQaZW219qcqXgl9DNCmj1m1ekryAAcpsCT2rXWE=;
 b=coHKHwC16WTICI2xYGXtCAF/y6Th0fmLUyqTRD4dcdCitZswtlVNkV+MrkwJxCVRBN
 FO43na6K4+AvwCL+t4cGV2Iyxyr6z77QKWPfZRdrUI+Bho+BLHdghsumfgcrWDQZAcU5
 8wa/oa+BTteVAjvdi9QK/dj928nIG4Afg6zYCgYJ25nXx6Xw16UHf6IHnJHo2dkMJUTC
 zCga4CHCJ+mmpfxWcPDZ9IA9j7B9wNKKEDQQwEE96o1EZAIFUNsG4hF+byOyoxkNaTtc
 0SX2xO59EJat4NL2a1NCBEblAvJZ5FgHc/4LBqjjndnziFklCMp1J9Mx0xVoYFjT8Zmd
 f9eA==
X-Gm-Message-State: AOJu0YyUTo2sO36SMyN8G87v3PGyt5AF8BzRMDQ6VXdtXqdZl+kIPbKB
 d3quTh0iY4bNHjxW6lmCMAk2KeFaFELhMUObbJqW6Q==
X-Google-Smtp-Source: AGHT+IF3xEyVG9IKKqfdrVK2qevmH3IjCuJiiECV3DjpnsedfZxYrjHXxfVtQszAKHyG5PM/TkyneA==
X-Received: by 2002:a17:902:778a:b0:1bd:d14a:7e14 with SMTP id
 o10-20020a170902778a00b001bdd14a7e14mr12725014pll.65.1696887387032; 
 Mon, 09 Oct 2023 14:36:27 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 m10-20020a170902768a00b001c631236505sm10085914pll.228.2023.10.09.14.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 14:36:26 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 14:36:24 -0700
Message-ID: <20231009213624.107730-1-christian@aperture.us>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1696887387; x=1697492187; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kjSRNQaZW219qcqXgl9DNCmj1m1ekryAAcpsCT2rXWE=;
 b=oHrX3AeiXAfyAwOn5yDKHnJF2Dwqts/sEwwOaVoEHhhmzHNZMIOTfYUGUS4Xe7abfq
 bDzRyyJYtlXm6AhazWhAkQmwpX9eUyqDG4/+ZH4Kxs/WVh/2PidqZgC4oqkTfpFgAxt5
 PNoJbzV5Agll4GkVzgFa27cR6JgtnHNJARp2NahlXZu5EXETfarmf/r+AJjX1Yy/ku+p
 5kBuipEQjwSXK/fw+SJC8+fsRKKupPzZ+U+OQq0ReT2M+l6XNpJjGNW+qU5hlg0xY9w9
 ZfjH0dzsrskUaMxCMzcTZ3EiER/h3iMdANUa5uDwqh0NZFYbpahQnxaMiQj7TYpklf+u
 QlFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=oHrX3Aei
Subject: [Buildroot] [PATCH v1 1/1] package/containerd: bump to version 1.7.7
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Contains various fixes and updates.

https://github.com/containerd/containerd/releases/tag/v1.7.7

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index d5e0ef4517..450d1d1081 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  084a62f78f96cb5fda02221425f14df09d3e0acd093e4d4b3527900e3ff94677  containerd-1.7.6.tar.gz
+sha256  4c6042b13746a803766d76b07f756d03678a33a944b52c0b832c238609db1b2e  containerd-1.7.7.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 0591400709..d29a796a72 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.7.6
+CONTAINERD_VERSION = 1.7.7
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
