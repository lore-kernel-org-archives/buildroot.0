Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC93C27C55
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 15:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F22426086B;
	Mon, 10 Jun 2024 15:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aePAGKasT1uY; Mon, 10 Jun 2024 15:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C87A6607FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C87A6607FD;
	Mon, 10 Jun 2024 15:41:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5EF61BF3BE
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 15:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1504408A4
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 15:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMohR1rbjOND for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 15:41:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.athaariq.my.id; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D6D8406EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D6D8406EE
Received: from mail.athaariq.my.id (unknown [117.53.144.211])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D6D8406EE
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 15:41:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.athaariq.my.id (Postfix) with ESMTPSA id 403B943056;
 Mon, 10 Jun 2024 15:41:49 +0000 (UTC)
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
To: buildroot@buildroot.org
Date: Mon, 10 Jun 2024 22:40:23 +0700
Message-ID: <20240610154028.792440-2-foss@athaariq.my.id>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240610154028.792440-1-foss@athaariq.my.id>
References: <20240610154028.792440-1-foss@athaariq.my.id>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
Subject: [Buildroot] [PATCH 2/3] package/go: move source-specific to go-src
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
Cc: Athaariq Ardhiansyah <foss@athaariq.my.id>,
 Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some of package/go/go.mk includes source compilation specific
requirements, which are not effective for prebuilt Go compiler option.
Therefore, I moved some of source-specific conditionals and variables to
the host-go-src before adding host-go-bin support.

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
---
 package/go/go-src/go-src.mk | 68 +++++++++++++++++++++++++++++++++++
 package/go/go.mk            | 71 -------------------------------------
 2 files changed, 68 insertions(+), 71 deletions(-)

diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
index 1e061e20bc..a0c903282f 100644
--- a/package/go/go-src/go-src.mk
+++ b/package/go/go-src/go-src.mk
@@ -16,6 +16,67 @@ HOST_GO_SRC_DEPENDENCIES = host-go-bootstrap-stage3
 
 ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
 
+ifeq ($(BR2_arm),y)
+GO_GOARCH = arm
+ifeq ($(BR2_ARM_CPU_ARMV5),y)
+GO_GOARM = 5
+else ifeq ($(BR2_ARM_CPU_ARMV6),y)
+GO_GOARM = 6
+else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
+GO_GOARM = 7
+else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
+# Go doesn't support 32-bit GOARM=8 (https://github.com/golang/go/issues/29373)
+# but can still benefit from armv7 optimisations
+GO_GOARM = 7
+endif
+else ifeq ($(BR2_aarch64),y)
+GO_GOARCH = arm64
+else ifeq ($(BR2_i386),y)
+GO_GOARCH = 386
+# i386: use softfloat if no SSE2: https://golang.org/doc/go1.16#386
+ifneq ($(BR2_X86_CPU_HAS_SSE2),y)
+GO_GO386 = softfloat
+endif
+else ifeq ($(BR2_x86_64),y)
+GO_GOARCH = amd64
+else ifeq ($(BR2_powerpc64),y)
+GO_GOARCH = ppc64
+else ifeq ($(BR2_powerpc64le),y)
+GO_GOARCH = ppc64le
+else ifeq ($(BR2_mips64),y)
+GO_GOARCH = mips64
+else ifeq ($(BR2_mips64el),y)
+GO_GOARCH = mips64le
+else ifeq ($(BR2_riscv),y)
+GO_GOARCH = riscv64
+else ifeq ($(BR2_s390x),y)
+GO_GOARCH = s390x
+endif
+
+# For the convienience of target packages.
+HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
+HOST_GO_TARGET_ENV = \
+	$(HOST_GO_COMMON_ENV) \
+	GOOS="linux" \
+	GOARCH=$(GO_GOARCH) \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)" \
+	CGO_CFLAGS="$(TARGET_CFLAGS)" \
+	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
+	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
+	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
+
+# The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
+# set, build in cgo support for any go programs that may need it.  Note that
+# any target package needing cgo support must include
+# 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+HOST_GO_DEPENDENCIES += toolchain
+HOST_GO_CGO_ENABLED = 1
+else
+HOST_GO_CGO_ENABLED = 0
+endif
+
 HOST_GO_SRC_CROSS_ENV = \
 	CC_FOR_TARGET="$(TARGET_CC)" \
 	CXX_FOR_TARGET="$(TARGET_CXX)" \
@@ -25,6 +86,11 @@ HOST_GO_SRC_CROSS_ENV = \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	GO_ASSUME_CROSSCOMPILING=1
 
+else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+# host-go can still be used to build packages for the host. No need to set all
+# the arch stuff since we will not be cross-compiling.
+HOST_GO_CGO_ENABLED = 1
+
 endif
 
 # The go build system is not compatible with ccache, so use
@@ -52,3 +118,5 @@ define HOST_GO_SRC_INSTALL_CMDS
 endef
 
 $(eval $(host-generic-package))
+
+include $(sort $(wildcard package/go/go-bootstrap-*/*.mk))
diff --git a/package/go/go.mk b/package/go/go.mk
index dfcb633aa7..489d749d46 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -26,75 +26,6 @@ HOST_GO_COMMON_ENV = \
 	GOBIN= \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
 
-ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
-
-ifeq ($(BR2_arm),y)
-GO_GOARCH = arm
-ifeq ($(BR2_ARM_CPU_ARMV5),y)
-GO_GOARM = 5
-else ifeq ($(BR2_ARM_CPU_ARMV6),y)
-GO_GOARM = 6
-else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
-GO_GOARM = 7
-else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
-# Go doesn't support 32-bit GOARM=8 (https://github.com/golang/go/issues/29373)
-# but can still benefit from armv7 optimisations
-GO_GOARM = 7
-endif
-else ifeq ($(BR2_aarch64),y)
-GO_GOARCH = arm64
-else ifeq ($(BR2_i386),y)
-GO_GOARCH = 386
-# i386: use softfloat if no SSE2: https://golang.org/doc/go1.16#386
-ifneq ($(BR2_X86_CPU_HAS_SSE2),y)
-GO_GO386 = softfloat
-endif
-else ifeq ($(BR2_x86_64),y)
-GO_GOARCH = amd64
-else ifeq ($(BR2_powerpc64),y)
-GO_GOARCH = ppc64
-else ifeq ($(BR2_powerpc64le),y)
-GO_GOARCH = ppc64le
-else ifeq ($(BR2_mips64),y)
-GO_GOARCH = mips64
-else ifeq ($(BR2_mips64el),y)
-GO_GOARCH = mips64le
-else ifeq ($(BR2_riscv),y)
-GO_GOARCH = riscv64
-else ifeq ($(BR2_s390x),y)
-GO_GOARCH = s390x
-endif
-
-# For the convienience of target packages.
-HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
-HOST_GO_TARGET_ENV = \
-	$(HOST_GO_COMMON_ENV) \
-	GOOS="linux" \
-	GOARCH=$(GO_GOARCH) \
-	CC="$(TARGET_CC)" \
-	CXX="$(TARGET_CXX)" \
-	CGO_CFLAGS="$(TARGET_CFLAGS)" \
-	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
-	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
-	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
-
-# The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
-# set, build in cgo support for any go programs that may need it.  Note that
-# any target package needing cgo support must include
-# 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-HOST_GO_DEPENDENCIES += toolchain
-HOST_GO_CGO_ENABLED = 1
-else
-HOST_GO_CGO_ENABLED = 0
-endif
-
-else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
-# host-go can still be used to build packages for the host. No need to set all
-# the arch stuff since we will not be cross-compiling.
-HOST_GO_CGO_ENABLED = 1
-endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
-
 # For the convenience of host golang packages
 HOST_GO_HOST_ENV = \
 	$(HOST_GO_COMMON_ENV) \
@@ -130,5 +61,3 @@ define GO_BINARIES_INSTALL
 endef
 
 $(eval $(host-virtual-package))
-
-include $(sort $(wildcard package/go/*/*.mk))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
