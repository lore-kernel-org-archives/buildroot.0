Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C48C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 19:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4055A607C8;
	Sat, 15 Mar 2025 19:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yb_dYR9y3b-Y; Sat, 15 Mar 2025 19:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09F4A6081C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09F4A6081C;
	Sat, 15 Mar 2025 19:57:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 235D4C8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07533400EC
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vzCw9zugq6W for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 19:57:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BAC094043C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAC094043C
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAC094043C
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so4755405e9.1
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068639; x=1742673439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/Fi7lzzlJkjE4h+ZwdRnKqmMu2alGfL0XFZ7UMHenhE=;
 b=RdoXn9sz0vJJSi5WNiaYzDxga6VSSqc6mW33oEhF+ZZY6rFXkKRnTQZ1KxrFuU2/bD
 jH5RFeZFkqVSt81Sb362H16VvkDoJj+SK+QZ/43fWe7HAMgOBW96aBNr5koOaCqOt7/9
 eQSk6vfnqJxmDhT5VHiAGQzfYFNeC94l55ofM9OVwLbIVZryAdcxhTqDxlHIgczU1uR4
 JjsSpLwzsSDm18pN6gmW8N5GGHg3MNkLW0jDqZ3h0PNUHqckSB8hxaemAs9Pa/smpy+B
 tJXraxL5PzaUrQf9m8s+XS6S6sIpz1FLz96YnRWimrRvr3XxIJ/CqQ+T4XWbwlN+8a18
 xmRA==
X-Gm-Message-State: AOJu0YxES1Rl2TFIfebfW16KjeMgwtwDa69vhDoexxSTB7PNmDtHZNMg
 kNf3R0xjIw5C92/sMy+KCzitK7WTOg6jnMgcHO+YxRYf1UJluGGVr/EI4Q==
X-Gm-Gg: ASbGncss2fu1j9Lj4/ol9jj4V9yBIjftd05Nhy4HZl9rOx8PqS0SRuR1u69/1CxPZiY
 bsvxCT8wsgq/hU+48l/wfCXQ48g5Ryb8cRNYB7r3Rzn9qfb5ezB9kmEXLbt2YwJlLWaf8FzY22F
 oaMGMakjPFaSmXIwMmKyNV0DWS6EDqBexY3IBVDngl8RuCp6Tn3VIzyguhBK8qfkyW2/ApZA6+y
 mk76dK4OGAIk4k4hvsZOOlpvvhhLZO1ai+9QSjrYoekIk8SSF8Uj5veuK+BZ6GnIo3lrkBzkrVN
 NDWiIiNCbZahfp6bNgdoS5akga65zDjFcBaBohfi3HmEInlc751KptQ=
X-Google-Smtp-Source: AGHT+IExium0NCC++9s6zbQEcfy30dQOkk/NdVOYMSz89sPMSdjGRuz5+dyIlEFE6OG0lfYmosoYyg==
X-Received: by 2002:a05:600c:4451:b0:43c:fa24:8721 with SMTP id
 5b1f17b1804b1-43d1ec8a44cmr85755225e9.17.1742068638537; 
 Sat, 15 Mar 2025 12:57:18 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975afesm9756836f8f.47.2025.03.15.12.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 12:57:18 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sat, 15 Mar 2025 20:57:11 +0100
Message-ID: <9ee687d52940df6b20a51f069a2a9c92e5ac5e49.1742068624.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1742068624.git.yann.morin.1998@free.fr>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068639; x=1742673439; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Fi7lzzlJkjE4h+ZwdRnKqmMu2alGfL0XFZ7UMHenhE=;
 b=ln18pemqIQYM/f1uUDaLSy0N4h25ytVMHJwfxKvyDqkQdnKCKxAXRLmKsfe/xqAYKr
 xJy7/3YtJ1okvXttksBfPc3xZKjxGhekzRMGAZ4oMYh3OaXwQjstVffAAbFN8YZK3bfs
 7cHWRJJoar0ry04Zi5rpEtggup2eIOXxhjKLVvmh+8BlaoIOazFGQt39NNYjxjcHjPOS
 FjAlTAcp6tKWK6jAJ8o0Vvc39FcvKwaSEFaCJuszWs3tg/tG/G6PkQzORChO1W8cNUWO
 kpz6GTC8HQLX5TF5b2zvc4HPVCiRe+7pEvqcfLU3Mb23gm4fzfzFLC/Zmcjb3K+eN+a4
 j35g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ln18pemq
Subject: [Buildroot] [PATCH 13/14 v4] package/podman: add option to use
 passt as network backend
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

passt/pasta is the officialy supported network backend, with slirp4netns
only considered a legacy solution. However, some people have experienced
corner cases when using passt/pasta (as it still is a yong stack), so we
do not want to do a blanket replace of slirp4netns just yet. Still, we
make passt/pasta the default option.

As a consequence, the existing runtime tests will now test passt/pasta,
so we introduce two new tests for slirp4netns as a network backend.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/podman/Config.in                     | 22 +++++++++++++++-----
 package/podman/containers.conf               |  2 --
 package/podman/podman.mk                     | 19 +++++++++++++----
 support/testing/tests/package/test_podman.py | 19 +++++++++++++++++
 4 files changed, 51 insertions(+), 11 deletions(-)
 delete mode 100644 package/podman/containers.conf

diff --git a/package/podman/Config.in b/package/podman/Config.in
index 41834052f4..4378d9918d 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -4,10 +4,10 @@ config BR2_PACKAGE_PODMAN
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS  # host-go
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # netavark
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
-	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp, slirp4netns
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17  # libseccomp, slirp4netns
-	depends on BR2_TOOLCHAIN_HAS_THREADS  # conmon, slirp4netns
-	depends on BR2_USE_WCHAR  # conmon, slirp4netns
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17  # libseccomp
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # conmon
+	depends on BR2_USE_WCHAR  # conmon
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_CA_CERTIFICATES  # runtime
 	select BR2_PACKAGE_CGROUPFS_V2_MOUNT if !BR2_PACKAGE_CGROUPFS_MOUNT && !BR2_INIT_SYSTEMD  # runtime
@@ -22,7 +22,6 @@ config BR2_PACKAGE_PODMAN
 	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN  # runtime
 	select BR2_PACKAGE_SHADOW
 	select BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
-	select BR2_PACKAGE_SLIRP4NETNS  # runtime
 	help
 	  The best free & open source container tools
 
@@ -67,6 +66,19 @@ config BR2_PACKAGE_PODMAN_INIT_NAME
 	default "tini" if BR2_PACKAGE_PODMAN_INIT_TINI
 	default "catatonit" if BR2_PACKAGE_PODMAN_INIT_CATATONIT
 
+choice
+	bool "Network backend"
+
+config BR2_PACKAGE_PODMAN_NET_PASST
+	bool "passt/pasta"
+	select BR2_PACKAGE_PASST  # runtime
+
+config BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS
+	bool "slirp4netns"
+	select BR2_PACKAGE_SLIRP4NETNS  # runtime
+
+endchoice
+
 endif
 
 comment "podman needs a toolchain w/ headers >= 3.17, threads, wchar"
diff --git a/package/podman/containers.conf b/package/podman/containers.conf
deleted file mode 100644
index 1db48c1905..0000000000
--- a/package/podman/containers.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-[network]
-default_rootless_network_cmd = "slirp4netns"
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 29c5591a0a..7ca9b9ddcb 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -62,6 +62,19 @@ define PODMAN_HELPER_INIT
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_PODMAN_NET_PASST),y)
+define PODMAN_HELPER_PASST
+	$(Q)ln -sf ../../bin/pasta $(TARGET_DIR)/usr/libexec/podman/pasta
+endef
+else
+define PODMAN_HELPER_SLIRP4NETNS
+	$(Q)ln -sf ../../bin/slirp4netns $(TARGET_DIR)/usr/libexec/podman/slirp4netns
+	$(Q)mkdir -p $(TARGET_DIR)/etc/containers/containers.conf.d
+	$(Q)printf '[network]\ndefault_rootless_network_cmd = "slirp4netns"\n' \
+		>$(TARGET_DIR)/etc/containers/containers.conf.d/50-buildroot-net-backend.conf
+endef
+endif
+
 define PODMAN_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CPUSETS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
@@ -87,9 +100,6 @@ define PODMAN_LINUX_CONFIG_FIXUPS
 endef
 
 define PODMAN_CONFIG
-	$(Q)$(INSTALL) -D -m 0644 \
-		$(PODMAN_PKGDIR)/containers.conf \
-		$(TARGET_DIR)/usr/share/containers/containers.conf
 	$(Q)$(INSTALL) -D -m 0644 \
 		$(PODMAN_PKGDIR)/policy.json \
 		$(TARGET_DIR)/etc/containers/policy.json
@@ -103,8 +113,9 @@ define PODMAN_HELPERS
 	$(Q)mkdir -p $(TARGET_DIR)/usr/libexec/podman
 	$(Q)ln -sf ../../bin/aardvark-dns $(TARGET_DIR)/usr/libexec/podman/aardvark-dns
 	$(Q)ln -sf ../../bin/netavark $(TARGET_DIR)/usr/libexec/podman/netavark
-	$(Q)ln -sf ../../bin/slirp4netns $(TARGET_DIR)/usr/libexec/podman/slirp4netns
 	$(PODMAN_HELPER_INIT)
+	$(PODMAN_HELPER_PASST)
+	$(PODMAN_HELPER_SLIRP4NETNS)
 endef
 PODMAN_POST_INSTALL_TARGET_HOOKS += PODMAN_HELPERS
 
diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
index 44211b438e..4d9b19310e 100644
--- a/support/testing/tests/package/test_podman.py
+++ b/support/testing/tests/package/test_podman.py
@@ -239,3 +239,22 @@ class TestPodmanTini(PodmanBase):
 
     def test_run(self):
         self.do_test()
+
+
+class TestPodmanSlirpIptables(PodmanBase):
+    config = PodmanBase.config + """
+    BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS=y
+    """
+
+    def test_run(self):
+        self.do_test()
+
+
+class TestPodmanSlirpNftables(PodmanBase):
+    config = PodmanBase.config + """
+    BR2_PACKAGE_NFTABLES=y
+    BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS=y
+    """
+
+    def test_run(self):
+        self.do_test()
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
