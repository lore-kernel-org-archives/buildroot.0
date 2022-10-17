Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC29C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 15:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B59CA417CF;
	Mon, 17 Oct 2022 15:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B59CA417CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lwFemtpHWpiU; Mon, 17 Oct 2022 15:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3533A417AF;
	Mon, 17 Oct 2022 15:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3533A417AF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C59F1BF2A5
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 15:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 014C241799
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 15:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 014C241799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Af7jwBH0mj2l for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 15:17:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56E1B41764
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56E1B41764
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 15:17:43 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id fy4so25679808ejc.5
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 08:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MCfElpNEXMpPz85WoyGwXY9GsF7Z1kCOuU5EW+SlCWs=;
 b=lQAUC/lj4E6T91ufsZaE9gGehjuV2mRJfyXztoU7m1T4uQ0oYX1izeMajvjgvYmQxy
 nRMoVIwzEIbJp8bhvgoHE/oJ6FosareSP4mdf8BrdksHIslqEAH3Yuyf75VZdBU1Tx2D
 Iu6cxpLpdv/IQH7IK4u3N86mrE0X7aXkEDAt2OXUmYtRYUTQSmn4wPcOhjurrAhamLuA
 vzwImJFMAcFVGCpM0VpnHTHFbIuHpgmmP6NaT63aNFMoPX+0cEuya9ht+a4rU5V1cukh
 4vF86jrjtfmCQwQvPC/+7mJfsDaWXaACiqOJGS5vU2/dqySPyxnfULNBBC3u8r7T66N+
 S/EQ==
X-Gm-Message-State: ACrzQf15LJu+J4m8ZFSDjDyNBfTORcAPF5AF9HO8Kw/bSUlVDmER8qWZ
 sI48Bs+XlB3QgWLmXt435TX1q9pzS0XErift
X-Google-Smtp-Source: AMsMyM5bF8BqxZL1Jln2kdhtxT1lV4tUERVeaUDpGSG1L+9CHKIJaCmdBXo4uzvKBaOgY46UyudOzw==
X-Received: by 2002:a17:907:272a:b0:791:994d:fb6a with SMTP id
 d10-20020a170907272a00b00791994dfb6amr655944ejl.337.1666019860604; 
 Mon, 17 Oct 2022 08:17:40 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2788:1a4:785::9])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a50d48b000000b00458947539desm7471904edi.78.2022.10.17.08.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 08:17:39 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 17:17:24 +0200
Message-Id: <20221017151726.44005-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20221017151726.44005-1-thomas.perale@mind.be>
References: <20221017151726.44005-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCfElpNEXMpPz85WoyGwXY9GsF7Z1kCOuU5EW+SlCWs=;
 b=UL5jbwo4iXIl541WbwCL1aoKEM5P7K/KxVDcbn7vqMkfgshA8+WpuiHvgXGImheeIO
 PyQ8jz9X967Ljb0EJ/3KVgXumXYqtRp9NeSLPbIxXpXGITX/kzd7AJlmLgqRGsxCaSJV
 pyJgFbvgLGrNcdVxQ/W5DspbWv0deW03K6CPaPAgfQicN8PRON/F/amgQaAksGJBw5Jb
 9tmK5dy9mr6UVJ2pSWvoAOESwrxgcVBM81oPOsXT3a+gBMTuRo4z3fCzcNz8knYIozhZ
 oL4dcqidnL+N5XJckHoRvLIjnvS1JBDvG3w6eMxu2fTaLVeNqxzYmlmoABzuPL2XdCIO
 ENcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=UL5jbwo4
Subject: [Buildroot] [PATCH 2/4] package/pkg-golang: set dependencies to
 host-goc
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use 'host-goc' instead of 'host-go' to build one of the implementation
of the 'goc' package instead of building the 'go' package by default.

Also select 'goc' in every package that are built by the go compiler
to keep the dependencies in the 'menuconfig' corrects.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 fs/oci/Config.in                       | 1 +
 package/balena-engine/Config.in        | 1 +
 package/containerd/Config.in           | 1 +
 package/crucible/Config.in             | 1 +
 package/delve/Config.in                | 1 +
 package/docker-cli/Config.in           | 1 +
 package/docker-compose/Config.in       | 1 +
 package/docker-engine/Config.in        | 1 +
 package/docker-proxy/Config.in         | 1 +
 package/embiggen-disk/Config.in        | 1 +
 package/flannel/Config.in              | 1 +
 package/gitlab-runner/Config.in        | 1 +
 package/gocryptfs/Config.in            | 1 +
 package/mender-artifact/Config.in.host | 1 +
 package/mender-connect/Config.in       | 1 +
 package/mender/Config.in               | 1 +
 package/moby-buildkit/Config.in        | 1 +
 package/moby-buildkit/Config.in.host   | 1 +
 package/nerdctl/Config.in              | 1 +
 package/pkg-golang.mk                  | 4 ++--
 package/runc/Config.in                 | 1 +
 package/tinifier/Config.in             | 1 +
 package/wtfutil/Config.in              | 1 +
 23 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/fs/oci/Config.in b/fs/oci/Config.in
index 5e7aff282f..a7c20fa60f 100644
--- a/fs/oci/Config.in
+++ b/fs/oci/Config.in
@@ -1,6 +1,7 @@
 config BR2_TARGET_ROOTFS_OCI
 	bool "oci image"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  Build an OCI (Open Container Initiative) image.
 
diff --git a/package/balena-engine/Config.in b/package/balena-engine/Config.in
index 02f694515e..64ff17752e 100644
--- a/package/balena-engine/Config.in
+++ b/package/balena-engine/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_BALENA_ENGINE
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT # runtime
 	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT # runtime
 	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT # runtime
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  balenaEngine is a new container engine purpose-built for
 	  embedded and IoT use cases and compatible with Docker
diff --git a/package/containerd/Config.in b/package/containerd/Config.in
index 0e3a55ef39..c07ee08d38 100644
--- a/package/containerd/Config.in
+++ b/package/containerd/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_CONTAINERD
 	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
 	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  containerd is a daemon to control runC.
 
diff --git a/package/crucible/Config.in b/package/crucible/Config.in
index b27eb31ae5..c15a335b49 100644
--- a/package/crucible/Config.in
+++ b/package/crucible/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CRUCIBLE
 	bool "crucible"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  Crucible is a One-Time-Programmable (OTP) fusing tool for the
 	  i.MX family.
diff --git a/package/delve/Config.in b/package/delve/Config.in
index 9428e4016a..c1db230c4d 100644
--- a/package/delve/Config.in
+++ b/package/delve/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_DELVE_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	select BR2_PACKAGE_HOST_GOC
 
 config BR2_PACKAGE_DELVE
 	bool "delve"
diff --git a/package/docker-cli/Config.in b/package/docker-cli/Config.in
index 6f187c9d22..ae57d57e39 100644
--- a/package/docker-cli/Config.in
+++ b/package/docker-cli/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DOCKER_CLI
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  Docker is a platform to build, ship,
 	  and run applications as lightweight containers.
diff --git a/package/docker-compose/Config.in b/package/docker-compose/Config.in
index 59128f7a19..ca037f710e 100644
--- a/package/docker-compose/Config.in
+++ b/package/docker-compose/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DOCKER_COMPOSE
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_DOCKER_CLI
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  Multi-container applications with the Docker CLI.
 
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 1f0efb8fcc..25df1f5819 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	select BR2_PACKAGE_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
 	select BR2_PACKAGE_IPTABLES # runtime dependency
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  Docker is a platform to build, ship,
 	  and run applications as lightweight containers.
diff --git a/package/docker-proxy/Config.in b/package/docker-proxy/Config.in
index 7e40536537..09597b0b53 100644
--- a/package/docker-proxy/Config.in
+++ b/package/docker-proxy/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DOCKER_PROXY
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  Libnetwork is a Container Network Model that provides a
 	  consistent programming interface and the required network
diff --git a/package/embiggen-disk/Config.in b/package/embiggen-disk/Config.in
index 667d71c86e..19d8696a67 100644
--- a/package/embiggen-disk/Config.in
+++ b/package/embiggen-disk/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_EMBIGGEN_DISK
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_UTIL_LINUX # sfdisk
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES # sfdisk
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  embiggen-disk is a tool to resize disk partitions at runtime.
 
diff --git a/package/flannel/Config.in b/package/flannel/Config.in
index eb8d798f48..800746f9c6 100644
--- a/package/flannel/Config.in
+++ b/package/flannel/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_FLANNEL
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  Flannel is a virtual network that gives a subnet to each
 	  host for use with container runtimes.
diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
index 89e3e87b5c..b21763309b 100644
--- a/package/gitlab-runner/Config.in
+++ b/package/gitlab-runner/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_GITLAB_RUNNER
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # runtime
 	select BR2_PACKAGE_LIBOPENSSL_BIN # runtime
 	select BR2_PACKAGE_TAR # runtime
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  GitLab Runner is the open source project that is used to run
 	  your jobs and send the results back to GitLab. It is used in
diff --git a/package/gocryptfs/Config.in b/package/gocryptfs/Config.in
index 2630cafdcf..4cd8b368ea 100644
--- a/package/gocryptfs/Config.in
+++ b/package/gocryptfs/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GOCRYPTFS
 	bool "gocryptfs"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  gocryptfs is an encrypted FUSE overlay filesystem.
 
diff --git a/package/mender-artifact/Config.in.host b/package/mender-artifact/Config.in.host
index c7be0ed261..761dc0e022 100644
--- a/package/mender-artifact/Config.in.host
+++ b/package/mender-artifact/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_MENDER_ARTIFACT
 	bool "host mender-artifact"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  The mender-artifact tool is a CLI implementation of the
 	  Mender artifacts library.
diff --git a/package/mender-connect/Config.in b/package/mender-connect/Config.in
index 0845910880..a91021f1f9 100644
--- a/package/mender-connect/Config.in
+++ b/package/mender-connect/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_MENDER_CONNECT
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_MENDER # runtime
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  mender-connect is a daemon responsible for handling
 	  bidirectional (websocket) communication with the Mender
diff --git a/package/mender/Config.in b/package/mender/Config.in
index cccb46361b..b6fe196f86 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_MENDER
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
diff --git a/package/moby-buildkit/Config.in b/package/moby-buildkit/Config.in
index 93c852bcdb..27496b5647 100644
--- a/package/moby-buildkit/Config.in
+++ b/package/moby-buildkit/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MOBY_BUILDKIT
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_HOST_GOC
 	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
 	help
 	  BuildKit is a toolkit for converting source code to build
diff --git a/package/moby-buildkit/Config.in.host b/package/moby-buildkit/Config.in.host
index a3b18548f8..335153e7fc 100644
--- a/package/moby-buildkit/Config.in.host
+++ b/package/moby-buildkit/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_MOBY_BUILDKIT
 	bool "host moby-buildkit"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  BuildKit is a toolkit for converting source code to build
 	  artifacts in an efficient expressive and repeatable manner.
diff --git a/package/nerdctl/Config.in b/package/nerdctl/Config.in
index 969b9bb40e..472f7b9559 100644
--- a/package/nerdctl/Config.in
+++ b/package/nerdctl/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_NERDCTL
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_CONTAINERD # runtime
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  Docker-compatible CLI for containerd, controlling runc.
 
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 0b3dc3d32f..8c9e645a9c 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -49,8 +49,8 @@ $(2)_BUILD_OPTS += \
 
 # Target packages need the Go compiler on the host at download time (for
 # vendoring), and at build and install time.
-$(2)_DOWNLOAD_DEPENDENCIES += host-go
-$(2)_DEPENDENCIES += host-go
+$(2)_DOWNLOAD_DEPENDENCIES += host-goc
+$(2)_DEPENDENCIES += host-goc
 
 $(2)_BUILD_TARGETS ?= .
 
diff --git a/package/runc/Config.in b/package/runc/Config.in
index fe527b1954..297aea8d64 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_RUNC
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  runC is a CLI tool for spawning and running containers
 	  according to the OCI specification.
diff --git a/package/tinifier/Config.in b/package/tinifier/Config.in
index fbadfe6bd9..89718e3a37 100644
--- a/package/tinifier/Config.in
+++ b/package/tinifier/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TINIFIER
 	bool "tinifier"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  CLI tool for images compressing
 
diff --git a/package/wtfutil/Config.in b/package/wtfutil/Config.in
index 8c3efcea5d..475e6d91df 100644
--- a/package/wtfutil/Config.in
+++ b/package/wtfutil/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_WTFUTIL
 	bool "wtfutil"
 	depends on BR2_USE_MMU  # fork()
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GOC
 	help
 	  WTF is the personal information dashboard for your terminal.
 
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
