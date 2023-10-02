Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1965E784AC
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 12:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4DB5401D9;
	Mon,  2 Oct 2023 12:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4DB5401D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6gYnvgiOvuNI; Mon,  2 Oct 2023 12:48:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3D0641E86;
	Mon,  2 Oct 2023 12:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3D0641E86
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DCD81BF589
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 12:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07A2C6101F
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 12:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A2C6101F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zsI-BxrvT3Y4 for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 12:48:13 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9726461014
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 12:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9726461014
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso2334060066b.2
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 05:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696250891; x=1696855691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xsw9F3NoHCqGqmjxUInNe+v7G1lDncfSJBIigZd+xr4=;
 b=tfle5ooSfJ/2Y3l3ZsObhRgom+xD7lEPwJ4teWKPGtDt2sEJ/hY7k82CWc/F0HBxxN
 BCJzqlfid5J+EYtodrqzMrqmd/j1DrO6FmKP7Urg3Y+fX4Buvj0hEKC43neiy8EGvnUK
 zgCfgBO6KJnB/ZYVFl9n9fMnDpfZuDht2ZnCaVx0tAChh/dZX5m+Oq0MK/yvwI7epGyK
 paKfs5yu3v7wOxSH1iBAguypNTysR37P8f/uRCgoeOGZrcAl/h60cbjOStM0vL7RPWf0
 0GgwGaPiS0jes8vZyTgM8cd77ijUHE4m/VizJbLNJ4Oxq/spIYpb8mfGqVYoG/f9Z2G8
 e4aQ==
X-Gm-Message-State: AOJu0YzDDp8h+ztuJpgPWZxW/gXJlrF7vMu2VuNvQ5jPUJAIoZpZ1G3K
 USp72jCC3ebfC0x6zgLE0IkqY6VYDHWFARWfjMXCaA==
X-Google-Smtp-Source: AGHT+IFQbRgSQFAOf3AjvRwoef/Go0ZbArC2bA7+ZO/JeywVfzMgEUCJ4hLrVjRvvTTro1Vzs+bT+w==
X-Received: by 2002:a17:907:7804:b0:9ae:519f:8276 with SMTP id
 la4-20020a170907780400b009ae519f8276mr9004823ejc.73.1696250891194; 
 Mon, 02 Oct 2023 05:48:11 -0700 (PDT)
Received: from localhost.localdomain ([79.132.253.132])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a17090635c300b0098951bb4dc3sm16688189ejb.184.2023.10.02.05.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 05:48:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 14:47:26 +0200
Message-ID: <20231002124736.179251-5-thomas.perale@essensium.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002124736.179251-1-thomas.perale@essensium.com>
References: <20231002124736.179251-1-thomas.perale@essensium.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1696250891; x=1696855691; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xsw9F3NoHCqGqmjxUInNe+v7G1lDncfSJBIigZd+xr4=;
 b=DSWJ3oaGN2vcZV9R4WvkV9WsTGOzKtBFqmQfyXxtUoD2gPtPsiqH2Q5ZWhg/emk35p
 odtgpF+SIevVr/LIvgDyLUyMXUuLF5YpHQ0XjWGPejWMiwfXlJ9MWitfMNniMWYQtwVz
 AWxjXkk5rpskb1FSxXHcoPRvhbV1VIBTOs2lyPuTLPbKOBKbBKEKN1/GYUzZFtaZfCDI
 JhlGKMpW9w6HpgcwCTv55Ec0i38UEeAH4ek+amzorbBLtFqnSOW0qIDuR4O+USrD5O0F
 gWUaUSos2IP3dllnvfGInA2Tgt/1daKHY2DiBhhzk5DtPtrKfSu+TwEjH+pQ7JftyzNb
 spNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=DSWJ3oaG
Subject: [Buildroot] [PATCH 4/6] package/pkg-golang: select go compiler
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Geoff Levand <geoff@infradead.org>, Fabio Estevam <festevam@gmail.com>,
 Anisse Astier <anisse@astier.eu>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Perale <thomas.perale@mind.be>

Select the 'go' virtual package in every package built by the Go
compiler. This maintains the correct dependencies in 'menuconfig'.
The same pattern is currently used for Rust packages.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/balena-engine/Config.in        | 1 +
 package/cni-plugins/Config.in          | 1 +
 package/containerd/Config.in           | 1 +
 package/crucible/Config.in             | 1 +
 package/delve/Config.in                | 1 +
 package/delve/Config.in.host           | 1 +
 package/docker-cli/Config.in           | 1 +
 package/docker-compose/Config.in       | 1 +
 package/docker-engine/Config.in        | 1 +
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
 package/runc/Config.in                 | 1 +
 package/runc/Config.in.host            | 1 +
 package/tinifier/Config.in             | 1 +
 package/wtfutil/Config.in              | 1 +
 23 files changed, 23 insertions(+)

diff --git a/package/balena-engine/Config.in b/package/balena-engine/Config.in
index 02f694515e..5966b33f58 100644
--- a/package/balena-engine/Config.in
+++ b/package/balena-engine/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_BALENA_ENGINE
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_IPTABLES # runtime
 	select BR2_PACKAGE_UTIL_LINUX # runtime
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES # runtime
diff --git a/package/cni-plugins/Config.in b/package/cni-plugins/Config.in
index 25e6ff534d..6d4ca0a5b4 100644
--- a/package/cni-plugins/Config.in
+++ b/package/cni-plugins/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_CNI_PLUGINS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Container Networking Interface plugins.
 
diff --git a/package/containerd/Config.in b/package/containerd/Config.in
index e69dd6768a..e92764f304 100644
--- a/package/containerd/Config.in
+++ b/package/containerd/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_CONTAINERD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
 	depends on BR2_USE_MMU # util-linux
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
diff --git a/package/crucible/Config.in b/package/crucible/Config.in
index b27eb31ae5..1e1b29c3df 100644
--- a/package/crucible/Config.in
+++ b/package/crucible/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CRUCIBLE
 	bool "crucible"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Crucible is a One-Time-Programmable (OTP) fusing tool for the
 	  i.MX family.
diff --git a/package/delve/Config.in b/package/delve/Config.in
index 9428e4016a..288dc1ea15 100644
--- a/package/delve/Config.in
+++ b/package/delve/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_DELVE_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 
 config BR2_PACKAGE_DELVE
 	bool "delve"
diff --git a/package/delve/Config.in.host b/package/delve/Config.in.host
index dab5ca8914..0938ab0659 100644
--- a/package/delve/Config.in.host
+++ b/package/delve/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_DELVE
 	bool "host delve"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Delve is a debugger for the Go programming language.
 
diff --git a/package/docker-cli/Config.in b/package/docker-cli/Config.in
index 6f187c9d22..52e7f7c871 100644
--- a/package/docker-cli/Config.in
+++ b/package/docker-cli/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DOCKER_CLI
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Docker is a platform to build, ship,
 	  and run applications as lightweight containers.
diff --git a/package/docker-compose/Config.in b/package/docker-compose/Config.in
index 59128f7a19..f3560e402b 100644
--- a/package/docker-compose/Config.in
+++ b/package/docker-compose/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DOCKER_COMPOSE
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_DOCKER_CLI
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Multi-container applications with the Docker CLI.
 
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 570b2ff681..a6d8f64a1c 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
 	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
 	select BR2_PACKAGE_CONTAINERD # runtime dependency
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_IPTABLES # runtime dependency
 	select BR2_PACKAGE_LIBSECCOMP
 	help
diff --git a/package/embiggen-disk/Config.in b/package/embiggen-disk/Config.in
index 667d71c86e..c323fb1b6d 100644
--- a/package/embiggen-disk/Config.in
+++ b/package/embiggen-disk/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_EMBIGGEN_DISK
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	depends on BR2_USE_MMU # util-linux
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_UTIL_LINUX # sfdisk
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES # sfdisk
 	help
diff --git a/package/flannel/Config.in b/package/flannel/Config.in
index eb8d798f48..f37cfaa9cc 100644
--- a/package/flannel/Config.in
+++ b/package/flannel/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_FLANNEL
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Flannel is a virtual network that gives a subnet to each
 	  host for use with container runtimes.
diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
index 4289613ab9..cfe8c941bc 100644
--- a/package/gitlab-runner/Config.in
+++ b/package/gitlab-runner/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_GITLAB_RUNNER
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_CA_CERTIFICATES # runtime
 	select BR2_PACKAGE_GIT # runtime
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_LIBCURL # runtime
 	select BR2_PACKAGE_LIBCURL_CURL # runtime
 	select BR2_PACKAGE_LIBCURL_FORCE_TLS # runtime
diff --git a/package/gocryptfs/Config.in b/package/gocryptfs/Config.in
index 2630cafdcf..2c70b9b21b 100644
--- a/package/gocryptfs/Config.in
+++ b/package/gocryptfs/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GOCRYPTFS
 	bool "gocryptfs"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  gocryptfs is an encrypted FUSE overlay filesystem.
 
diff --git a/package/mender-artifact/Config.in.host b/package/mender-artifact/Config.in.host
index c7be0ed261..39353b23e7 100644
--- a/package/mender-artifact/Config.in.host
+++ b/package/mender-artifact/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_MENDER_ARTIFACT
 	bool "host mender-artifact"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  The mender-artifact tool is a CLI implementation of the
 	  Mender artifacts library.
diff --git a/package/mender-connect/Config.in b/package/mender-connect/Config.in
index 0845910880..d478e468c2 100644
--- a/package/mender-connect/Config.in
+++ b/package/mender-connect/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_MENDER_CONNECT
 	depends on BR2_USE_WCHAR # libglib2 -> gettext
 	depends on BR2_USE_MMU # dbus -> fork()
 	select BR2_PACKAGE_DBUS # runtime
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_MENDER # runtime
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/mender/Config.in b/package/mender/Config.in
index 7d768cebec..4831548f76 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
diff --git a/package/moby-buildkit/Config.in b/package/moby-buildkit/Config.in
index 93c852bcdb..1a0b599097 100644
--- a/package/moby-buildkit/Config.in
+++ b/package/moby-buildkit/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_MOBY_BUILDKIT
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
+	select BR2_PACKAGE_HOST_GO
 	help
 	  BuildKit is a toolkit for converting source code to build
 	  artifacts in an efficient, expressive and repeatable manner.
diff --git a/package/moby-buildkit/Config.in.host b/package/moby-buildkit/Config.in.host
index a3b18548f8..d4eb0d74c3 100644
--- a/package/moby-buildkit/Config.in.host
+++ b/package/moby-buildkit/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_MOBY_BUILDKIT
 	bool "host moby-buildkit"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  BuildKit is a toolkit for converting source code to build
 	  artifacts in an efficient expressive and repeatable manner.
diff --git a/package/nerdctl/Config.in b/package/nerdctl/Config.in
index 969b9bb40e..062b36ab85 100644
--- a/package/nerdctl/Config.in
+++ b/package/nerdctl/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_NERDCTL
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_CONTAINERD # runtime
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Docker-compatible CLI for containerd, controlling runc.
 
diff --git a/package/runc/Config.in b/package/runc/Config.in
index fe527b1954..73eac72527 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_RUNC
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	select BR2_PACKAGE_HOST_GO
 	help
 	  runC is a CLI tool for spawning and running containers
 	  according to the OCI specification.
diff --git a/package/runc/Config.in.host b/package/runc/Config.in.host
index 4b2555e029..78193cb499 100644
--- a/package/runc/Config.in.host
+++ b/package/runc/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_RUNC
 	bool "host runc"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  runC is a CLI tool for spawning and running containers
 	  according to the OCI specification.
diff --git a/package/tinifier/Config.in b/package/tinifier/Config.in
index fbadfe6bd9..eae8b8f499 100644
--- a/package/tinifier/Config.in
+++ b/package/tinifier/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TINIFIER
 	bool "tinifier"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  CLI tool for images compressing
 
diff --git a/package/wtfutil/Config.in b/package/wtfutil/Config.in
index 8c3efcea5d..3fd8c41bab 100644
--- a/package/wtfutil/Config.in
+++ b/package/wtfutil/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_WTFUTIL
 	bool "wtfutil"
 	depends on BR2_USE_MMU  # fork()
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  WTF is the personal information dashboard for your terminal.
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
