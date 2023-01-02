Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC38EC3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 12:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53E4840600;
	Mon,  2 Jan 2023 12:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53E4840600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3LXZ1bfpc8m; Mon,  2 Jan 2023 12:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4A6D404B9;
	Mon,  2 Jan 2023 12:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4A6D404B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 490451BF33E
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 318A98109A
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 318A98109A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RRFPWpZ0c9ov for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 12:22:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B1E780D7B
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B1E780D7B
 for <buildroot@busybox.net>; Mon,  2 Jan 2023 12:22:27 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso18466679wmb.3
 for <buildroot@busybox.net>; Mon, 02 Jan 2023 04:22:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMOFd0A5wsvJkf2CWhmsabV7YLTm/0cKjJutdLdOvKY=;
 b=RZcr6obsp+P+ZgvXdJbnJWSIncTCP6PHbTXHKavuKcLpea/BSXPANrWTCrFh+ymFqm
 yqGMoOIs9qmQ5fJZ4Sd5gc/6UIHLHXVavxbxAOArspDcFuXxJ58VelFDhsWu6WPnUDvL
 Q5PPHjCTQ54PMQlUpb1yMNY/E0n2FCy5IarNf2L+UDBYrLYBqYXPty1nlYesS3zW195S
 PYwITDbwHVzGAaLT1Oxlm0TchpaYAVM6j7D5UP4cDqwwzM4/GzxF3gCYRdRSzvs9q3Hc
 aofUWUq+21+yaeSKj6ddNG7nohNvryshzqqQ/pTc/85fwWsS+JXELcwgb5b9uqa4slJG
 u5BQ==
X-Gm-Message-State: AFqh2koC4QmAOJMb3l2sVYqzzCmdEYfjfKq5p0OMuR66mf2QJXp2hIm0
 4/hAhtpCvMGRLF12/EA5iIbFldcdUXE=
X-Google-Smtp-Source: AMrXdXvdaKfXzZSeYXbVpBodz0soD16QdDX8S+Mi80N/g0S6Py3zwclYTFQIbCO962Ta4rQJR7RGgQ==
X-Received: by 2002:a05:600c:c0d:b0:3d9:7667:c0e4 with SMTP id
 fm13-20020a05600c0c0d00b003d97667c0e4mr20356265wmb.31.1672662145423; 
 Mon, 02 Jan 2023 04:22:25 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a7bcb5a000000b003cf4eac8e80sm44193850wmj.23.2023.01.02.04.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 04:22:25 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Jan 2023 13:22:19 +0100
Message-Id: <20230102122219.1912388-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GMOFd0A5wsvJkf2CWhmsabV7YLTm/0cKjJutdLdOvKY=;
 b=NDOQni79QOP8kVhDrdJyjC/gBUcYEZ91WCvY3rr6lKuwgL0JisGcpQ72c2IwbvxU4v
 uTLQ8+PbcBRk0glE8b22jgfENje7DmMSan8e/8KGJ8WbfSBA8LBsYHCvXfDhIpLEYYhm
 Cox1spTjj39Oj1vsSN4RoLo4Za9Hya+vQHK/VnnrtqR+6/jSC+G3FSu8Ia9dH/4CKvQ3
 IhnL3L8at/vN9om9Ulv+DqJV5HESQF825TMtVMGEMvsyVgH4ZyOeV7rK6SjwPRKp3Qq/
 su2qAyRQLJyH7hsoFFRK7P769FEpjp8vnZIMj5yEbgMN5iLa8JI04XIQBMIpXD+UGilz
 uGcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NDOQni79
Subject: [Buildroot] [PATCH] package/strace: bump to version 6.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 1743a369b..9478fbd45 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.0/strace-6.0.tar.xz.asc
-sha256  92d720a666855e9f1c6a11512fd6e99674a82bbfe1442557815f2ce8e1293338  strace-6.0.tar.xz
+# https://strace.io/files/6.1/strace-6.1.tar.xz.asc
+sha256  2579e9cec37dbb786f6ea0bebd15f40dd561ef2bde2a2a2ecdce5963b01859fd  strace-6.1.tar.xz
 sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 09e620530..cbb574559 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.0
+STRACE_VERSION = 6.1
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
