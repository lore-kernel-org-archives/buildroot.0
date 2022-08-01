Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC1CC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 11:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65FD1813CA;
	Mon,  1 Aug 2022 11:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65FD1813CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rUpefCa9Hsz3; Mon,  1 Aug 2022 11:43:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FF4981295;
	Mon,  1 Aug 2022 11:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FF4981295
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 565461BF29C
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 11:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C89C408A3
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 11:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C89C408A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yab5v3Z7fzZj for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 11:43:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF2664088D
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF2664088D
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 11:43:25 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id x39so7272366lfu.7
 for <buildroot@buildroot.org>; Mon, 01 Aug 2022 04:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=A7gtq3WocrVYKHEvghVI6ctnZJUyX/5SVoOQzwRUAJ4=;
 b=19k3hqyZU7z3bQ2y+8WzXaHVd9zIwl4xsS4gpweHuoG8b4W/2i5V0kOJDZfz9LZZIX
 w7xOJVQ9DRmfJMevAmjJjBsJYSbBvcpglek3q6p7B1cE/CBzW5cGfpGTfbSWQ/XA/1mm
 XdGt6eGw4EF8/oJtuhqZ+QX+karZG9ZnoI3EJTdxzhwT2vi7zgi5vopZ1gGlhpks7t/h
 fi29c7WcytfqE7wHSFxeFP1BeLCMJOqWvQqwJtiwMrOwE6DKZFp9r2vA42kO4KYWbamO
 smpYgDV0YC7FxTKZshUpyJW6triGIVhR90RB19Mh46QEXqO83hXXoxfe5fDEE9YcfA5m
 cneQ==
X-Gm-Message-State: AJIora8CjxQS7XFzMprYUe5uq+mLYQOmS/h39LEIC+9TwXMcdPeHj6sz
 T29NfYNSdZJAd6Tw2+P/gbKTZR8mR2M=
X-Google-Smtp-Source: AGRyM1sPDNF3VegIfg8VfkDLU9kyrpB9zLTF92fD2NsR8q2B0JFMCeSMytaB3wO5GsS7tQ57FqB3sg==
X-Received: by 2002:a05:6512:32c2:b0:48a:982a:b2be with SMTP id
 f2-20020a05651232c200b0048a982ab2bemr5512675lfg.493.1659354203387; 
 Mon, 01 Aug 2022 04:43:23 -0700 (PDT)
Received: from localhost.localdomain ([176.10.248.200])
 by smtp.gmail.com with ESMTPSA id
 7-20020a2eb947000000b0025d3c2e6b8dsm1519302ljs.105.2022.08.01.04.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 04:43:22 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Aug 2022 13:43:20 +0200
Message-Id: <20220801114320.3729655-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=A7gtq3WocrVYKHEvghVI6ctnZJUyX/5SVoOQzwRUAJ4=;
 b=Xlywm5pPqb41WAENpcFpDX8CTDgDCTjh/G2ITaPBZnAdaG+Ld6qhi8ym1E4oWqqOae
 Yb5srTnfeEwzVTjxNWmgl1AZ+jdBWlaTgNx8qTyVYZjmLQiG9J5uG1n8EvAjGDrfLnib
 F8xUpVh+bZvNxGvdXoEZ7+yE2Ix5+lfXLsQHqHhhCAvqP2uvmrfYQoGpByebw1OORb9I
 x7SAtNLXS0FsmnsgqX4IBsroHRRQ2Lvi/6hnPTROoH94sLzMGCfXXsIrna3l6yf/JzFj
 DyRT7XGLNKsLhZdZZcKczOTs1yfGRdd+UWDVernWR7JxjQ6+2kabPrA4UK0eviIuFiQL
 Kcmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Xlywm5pP
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to version 2.4.2
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

Mostly a bugfix release (critical fixes to syslogd below), which also
includes some features added to the logger tool and libsyslog related
to logging to remote syslog servers, bypassing the local syslogd.

Critical fixes:
  - Prevent over-read when scanning kermel log messages
  - Prevent kernel log file corruption when messages contain control
    codes, notably '\n', now C-style hex encoding is preserved (\x0a)
  - Forwarding of log messages to remote servers stops after a few
    SIGHUPs have been received (bug introduced in v2.4.0)

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 16a8bb4609..bac35ebcc1 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  1d9ed88a772af95c8b46c9e92ddc5bf4a76ac233ec5850f084290b80df7e02c4  sysklogd-2.4.0.tar.gz
+sha256  64acdb6ade609a1f42eeb7fbdb25c539b1c16abf2f6ff722606773b84a3c4073  sysklogd-2.4.2.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 9e5932f8fa..b25937df31 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.4.0
+SYSKLOGD_VERSION = 2.4.2
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
