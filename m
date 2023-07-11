Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1B4EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 22:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75CCF41E73;
	Tue, 11 Jul 2023 22:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75CCF41E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHNXIfLZv_sA; Tue, 11 Jul 2023 22:09:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06A9F41E98;
	Tue, 11 Jul 2023 22:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06A9F41E98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A14D41BF2C0
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 795F041E61
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 795F041E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UyBG5cq8USAB for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 22:08:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21BB141E60
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21BB141E60
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 22:08:54 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-55ba895d457so3205602a12.0
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 15:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689113333; x=1691705333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fr8k+uLIM71cZMtxO1KWpfDCrHaFPtGvpQGcJ05ErU0=;
 b=dP4N4x1oNIiUo78XNSCXF9BkeFsHMKWzWPKEUc4l6YtSOwqy0uzcKmQ+3U68YHDfKM
 xf9Ii0zyGpGZRC5X8H6ysy7e8P257+l32q1KdNiEpnRSqM3BSW7FG+kTfeytaADefBIj
 7fQcCyiHFrECmkECFubYL4nWkid8om1mGgi9G0sb04BZZhsL1DMzvpBiKsxdPtvkM4+9
 KBASnWgew+KC3EElxbP5VJaz0RTuLUfQXNUqCBXx86jmN6mEV+z64xAUfM4kq7w7XO8g
 CgayTAvf3EAl8oHQysnmdSU/PVUvLAuIvmdVSClHWfkG31RtXj83yS1OrP8f4CC+DFpk
 CuYQ==
X-Gm-Message-State: ABy/qLYbeKruT09kYhruC3UEzpKmqp65c7TbdCK3A8Y9OQzJjZs4v/8N
 yifDaA0x50EncuA5N7RB1zf9Avac2vBYUJuuEfD7mg==
X-Google-Smtp-Source: APBJJlF17mz8bQqC3ZKWzp3kgYSrlW8vg/6zyIFgTV7bIlbKeuvj+WcrRk1/8st726IBR7f+Yztllw==
X-Received: by 2002:a17:90b:4a41:b0:263:fc45:4091 with SMTP id
 lb1-20020a17090b4a4100b00263fc454091mr12588194pjb.15.1689113333362; 
 Tue, 11 Jul 2023 15:08:53 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 ep11-20020a17090ae64b00b0025bbe90d3cbsm2268015pjb.44.2023.07.11.15.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 15:08:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 15:08:47 -0700
Message-ID: <20230711220849.1702358-2-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711220849.1702358-1-christian@aperture.us>
References: <20230711220849.1702358-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1689113333; x=1691705333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fr8k+uLIM71cZMtxO1KWpfDCrHaFPtGvpQGcJ05ErU0=;
 b=AHPe7ZGLavXPMnDezKOTHVOyuV36nl+x/XpJOX7Vy4NwxND1vqVE1umXnzk3vKZE31
 UO9ou0fe9n2Yn5v31HaxJfzWXYjau+FTOyo8Fj7aLDUr99KrAbylOGls6ltURN7o9sSC
 wUjZeAkrTdoabs9u3pHVmDpZV2NJqcAoRzjont+YWvB7LUdQ98SQgFk+LbZjFLHZQpnq
 1K1xcMhmz3Pf9dY6o/r0DK6cs3jVZ29/DiErpVbmISxGkFZ3s+nfOsB0sZGhNWititKN
 JbL8MISUuSJ5mupop6goshDwbJS9PFUiIKn0Iu0TXYy0vRSsxRTmx+S4zTibzY1UnJDY
 fj9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=AHPe7ZGL
Subject: [Buildroot] [PATCH v7 2/4] package/go: adjust comments
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

Adjust comments in the Go package to improve clarity:

Config.in.host:

 - Add comment mentioning list of supported architectures.

go.mk:

 - Improve formatting of comment about NOCCACHE
 - Reword comment re: copying src/ to host/
   - the previously linked issue is not relevant.
   - instead: mention that src/ is needed for stdlib.
 - Adjust comment re: adjusting file timestamps.
   - mention this is needed to avoid rebuilding stdlib

Signed-off-by: Christian Stewart <christian@aperture.us>

---

v3 -> v4:

 - move these comments to a separate patch
 - Thanks Thomas for the review.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/Config.in.host |  2 ++
 package/go/go.mk          | 11 +++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 90a54f0da6..b87b862cec 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -3,6 +3,8 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	# See https://go.dev/doc/install/source#environment
+	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
 		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
diff --git a/package/go/go.mk b/package/go/go.mk
index a96c6ab5dd..66af25db45 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -121,8 +121,8 @@ HOST_GO_HOST_ENV = \
 	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
 	CGO_LDFLAGS="$(HOST_LDFLAGS)"
 
-# The go build system is not compatible with ccache, so use
-# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
+# The go build system is not compatible with ccache, so use HOSTCC_NOCCACHE.
+# See https://github.com/golang/go/issues/11685.
 HOST_GO_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
@@ -154,12 +154,11 @@ define HOST_GO_INSTALL_CMDS
 	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
 	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
 
-	# There is a known issue which requires the go sources to be installed
-	# https://golang.org/issue/2775
+	# The Go sources must be installed to the host/ tree for the Go stdlib.
 	cp -a $(@D)/src $(HOST_GO_ROOT)/
 
-	# Set all file timestamps to prevent the go compiler from rebuilding any
-	# built in packages when programs are built.
+	# Set file timestamps to prevent the Go compiler from rebuilding the stdlib
+	# when compiling other programs.
 	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
 endef
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
