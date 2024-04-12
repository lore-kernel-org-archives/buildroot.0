Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A587CC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 13:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 639FC60886;
	Fri, 12 Apr 2024 13:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUi6W86IlGlu; Fri, 12 Apr 2024 13:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A3556137E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A3556137E;
	Fri, 12 Apr 2024 13:28:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAC381BF3A9
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71F4D81006
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SY9fhgvShyE for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 13:27:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B1EB80F73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B1EB80F73
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B1EB80F73
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 13:27:41 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-346f4266e59so670359f8f.3
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 06:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712928459; x=1713533259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tb4u9gMZDG5pbaDq+WSDdlpQGXpWHnLyJGufKG+Vq78=;
 b=SqVI3ootXV2elpDbbi2fJkcPLEAyRsCB5545SGvZg4RhA/oIctCVN9+CTdtqRShP7k
 wf14rdq+V5M3xEpKeIG0R2v3lgldK4Fmyve5CCwaxf/Coama7WOevfq84UoipNq1cu0S
 Q/Y11r2Bfnv/YI2GmrOXEOsO0KxnrmCGqVHb2cVlZG0RTAqOoXPXi1RsO5YaDaxcCZzD
 sdMuUcFbv+hglBgqFXuU3TDSYwjAT3DZs1iVfjLE9/6WIgasLeSlcHlptpnUZ/nxbRiK
 i5z6XhMPfwDtre9Y5/ZDkItBQg0nWu4CCDCKjjhEDiLdbquqEVXC9sCo36rh8xoEvUna
 z88A==
X-Gm-Message-State: AOJu0YyCZO1TqKsGSueGYu63o8LQ6erKykfwko9QSwzKc4I+M24U3ha4
 O5nc4M9Lj/C2fWTOHv7FnQxhdA8NqbtY901px0Kq+fp3bNkHy9kCDmT2ZkJXpEEVZdmFv/AxvNm
 xu2Y=
X-Google-Smtp-Source: AGHT+IG8h/WNvUxgZvsrELladA7QbBqJ8mf8216J18kqKg347XVtWevDnrHyLaMydve+hDgjfJvTzQ==
X-Received: by 2002:a5d:5102:0:b0:33e:72f4:d6b5 with SMTP id
 s2-20020a5d5102000000b0033e72f4d6b5mr1694631wrt.66.1712928459302; 
 Fri, 12 Apr 2024 06:27:39 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a5d6a84000000b00343a66f6be4sm4288163wru.24.2024.04.12.06.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 06:27:38 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 15:26:54 +0200
Message-ID: <20240412132659.1168317-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412132659.1168317-1-thomas.perale@mind.be>
References: <20240412132659.1168317-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1712928459; x=1713533259; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tb4u9gMZDG5pbaDq+WSDdlpQGXpWHnLyJGufKG+Vq78=;
 b=KCAbiDs+57o4VcdoHoaSRo8eF+PKfJ4baS6sDBBoONfKcDpqTyifKEUu6Me1LoMSfH
 5eIiUNHx1djQyX9KH1ZrtGP5dg3B7yIBESczIU5Pei13u6heBxJKQfDiOgvEd7HE97vP
 SZJi8Jf9ukTIqCio7ZDHblfo3oL96hX/HHkrMCf53/H/Preln95Rrb14jsJbGUUpD78P
 vkLETuPObTuZvIi1aAOR9CNSjgUsHephly71KQtSqLiogXMInA0RSRTbacJv+oyKjAIk
 R0pEo1KXuVxGYKewQHmCt4K9NTCfbjZJPvJZF5EOf0/jRsTvYgrZ+hbccUZsVOyKJJ7z
 kaJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=KCAbiDs+
Subject: [Buildroot] [PATCH 2/6] package/go: new subdirectory for go variants
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
Cc: Christian Stewart <christian@aperture.us>,
 Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Thomas Perale <thomas.perale@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move every go compiler-related packages into a newly created
package/go/ subdirectory.

This subdirectory structure moves the GO_VERSION variable into the
common package/go/go.mk file. In the next commits, host-go will be
turned into a virtual-package and the common GO_VERSION force the
providers to use the same Go compiler version.
Common variables to all providers are kept in package/go/go.mk and
package/go/Config.in.host.
Also, the subdirectory structure forces the evaluation of the common
GO_VERSION before the providers access it.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                           |  2 +-
 DEVELOPERS                                    |  3 --
 package/Config.in.host                        |  3 --
 package/go/Config.in.host                     |  4 ++
 .../go-bootstrap-stage1/Config.in.host        |  0
 .../go-bootstrap-stage1.hash                  |  0
 .../go-bootstrap-stage1.mk                    |  0
 .../go-bootstrap-stage2/Config.in.host        |  0
 .../go-bootstrap-stage2.hash                  |  0
 .../go-bootstrap-stage2.mk                    |  0
 .../go-bootstrap-stage3/Config.in.host        |  0
 .../go-bootstrap-stage3.hash                  |  0
 .../go-bootstrap-stage3.mk                    |  0
 package/go/go.mk                              | 40 +-------------
 ...explicit-option-for-crosscompilation.patch |  0
 ...ldvcs-false-when-building-go-bootstr.patch |  0
 package/go/{ => go}/go.hash                   |  0
 package/go/go/go.mk                           | 53 +++++++++++++++++++
 18 files changed, 60 insertions(+), 45 deletions(-)
 rename package/{ => go}/go-bootstrap-stage1/Config.in.host (100%)
 rename package/{ => go}/go-bootstrap-stage1/go-bootstrap-stage1.hash (100%)
 rename package/{ => go}/go-bootstrap-stage1/go-bootstrap-stage1.mk (100%)
 rename package/{ => go}/go-bootstrap-stage2/Config.in.host (100%)
 rename package/{ => go}/go-bootstrap-stage2/go-bootstrap-stage2.hash (100%)
 rename package/{ => go}/go-bootstrap-stage2/go-bootstrap-stage2.mk (100%)
 rename package/{ => go}/go-bootstrap-stage3/Config.in.host (100%)
 rename package/{ => go}/go-bootstrap-stage3/go-bootstrap-stage3.hash (100%)
 rename package/{ => go}/go-bootstrap-stage3/go-bootstrap-stage3.mk (100%)
 rename package/go/{ => go}/0001-build.go-explicit-option-for-crosscompilation.patch (100%)
 rename package/go/{ => go}/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch (100%)
 rename package/go/{ => go}/go.hash (100%)
 create mode 100644 package/go/go/go.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 1b336ce7a3..b3eab26071 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -465,7 +465,7 @@ package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch lib_patch.U
 package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch lib_patch.Upstream
 package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch lib_patch.Upstream
 package/gnuplot/0001-configure-add-without-demo-option.patch lib_patch.Upstream
-package/go/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
+package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
 package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
 package/gobject-introspection/0001-disable-tests.patch lib_patch.Upstream
 package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
diff --git a/DEVELOPERS b/DEVELOPERS
index 039b803d50..51fc4962c9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -603,9 +603,6 @@ F:	package/docker-engine/
 F:	package/embiggen-disk/
 F:	package/fuse-overlayfs/
 F:	package/go/
-F:	package/go-bootstrap-stage1/
-F:	package/go-bootstrap-stage2/
-F:	package/go-bootstrap-stage3/
 F:	package/gocryptfs/
 F:	package/mbpfan/
 F:	package/moby-buildkit/
diff --git a/package/Config.in.host b/package/Config.in.host
index 9543a22ffc..2c481cfae7 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -44,9 +44,6 @@ menu "Host utilities"
 	source "package/genpart/Config.in.host"
 	source "package/gnupg/Config.in.host"
 	source "package/go/Config.in.host"
-	source "package/go-bootstrap-stage1/Config.in.host"
-	source "package/go-bootstrap-stage2/Config.in.host"
-	source "package/go-bootstrap-stage3/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imagemagick/Config.in.host"
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 0d89e875ad..7edf45850d 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -31,3 +31,7 @@ config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+
+source "package/go/go-bootstrap-stage1/Config.in.host"
+source "package/go/go-bootstrap-stage2/Config.in.host"
+source "package/go/go-bootstrap-stage3/Config.in.host"
diff --git a/package/go-bootstrap-stage1/Config.in.host b/package/go/go-bootstrap-stage1/Config.in.host
similarity index 100%
rename from package/go-bootstrap-stage1/Config.in.host
rename to package/go/go-bootstrap-stage1/Config.in.host
diff --git a/package/go-bootstrap-stage1/go-bootstrap-stage1.hash b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.hash
similarity index 100%
rename from package/go-bootstrap-stage1/go-bootstrap-stage1.hash
rename to package/go/go-bootstrap-stage1/go-bootstrap-stage1.hash
diff --git a/package/go-bootstrap-stage1/go-bootstrap-stage1.mk b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
similarity index 100%
rename from package/go-bootstrap-stage1/go-bootstrap-stage1.mk
rename to package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
diff --git a/package/go-bootstrap-stage2/Config.in.host b/package/go/go-bootstrap-stage2/Config.in.host
similarity index 100%
rename from package/go-bootstrap-stage2/Config.in.host
rename to package/go/go-bootstrap-stage2/Config.in.host
diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash b/package/go/go-bootstrap-stage2/go-bootstrap-stage2.hash
similarity index 100%
rename from package/go-bootstrap-stage2/go-bootstrap-stage2.hash
rename to package/go/go-bootstrap-stage2/go-bootstrap-stage2.hash
diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk b/package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk
similarity index 100%
rename from package/go-bootstrap-stage2/go-bootstrap-stage2.mk
rename to package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk
diff --git a/package/go-bootstrap-stage3/Config.in.host b/package/go/go-bootstrap-stage3/Config.in.host
similarity index 100%
rename from package/go-bootstrap-stage3/Config.in.host
rename to package/go/go-bootstrap-stage3/Config.in.host
diff --git a/package/go-bootstrap-stage3/go-bootstrap-stage3.hash b/package/go/go-bootstrap-stage3/go-bootstrap-stage3.hash
similarity index 100%
rename from package/go-bootstrap-stage3/go-bootstrap-stage3.hash
rename to package/go/go-bootstrap-stage3/go-bootstrap-stage3.hash
diff --git a/package/go-bootstrap-stage3/go-bootstrap-stage3.mk b/package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk
similarity index 100%
rename from package/go-bootstrap-stage3/go-bootstrap-stage3.mk
rename to package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk
diff --git a/package/go/go.mk b/package/go/go.mk
index 0e39ad9f8c..104a4a73fb 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -5,14 +5,7 @@
 ################################################################################
 
 GO_VERSION = 1.22.2
-GO_SITE = https://storage.googleapis.com/golang
-GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-GO_LICENSE = BSD-3-Clause
-GO_LICENSE_FILES = LICENSE
-GO_CPE_ID_VENDOR = golang
-
-HOST_GO_DEPENDENCIES = host-go-bootstrap-stage3
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
@@ -96,15 +89,6 @@ else
 HOST_GO_CGO_ENABLED = 0
 endif
 
-HOST_GO_CROSS_ENV = \
-	CC_FOR_TARGET="$(TARGET_CC)" \
-	CXX_FOR_TARGET="$(TARGET_CXX)" \
-	GOOS="linux" \
-	GOARCH=$(GO_GOARCH) \
-	$(if $(GO_GO386),GO386=$(GO_GO386)) \
-	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
-	GO_ASSUME_CROSSCOMPILING=1
-
 else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 # host-go can still be used to build packages for the host. No need to set all
 # the arch stuff since we will not be cross-compiling.
@@ -123,27 +107,7 @@ HOST_GO_HOST_ENV = \
 	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
 	CGO_LDFLAGS="$(HOST_LDFLAGS)"
 
-# The go build system is not compatible with ccache, so use
-# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
-HOST_GO_MAKE_ENV = \
-	GO111MODULE=off \
-	GOCACHE=$(HOST_GO_HOST_CACHE) \
-	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
-	GOROOT_FINAL=$(HOST_GO_ROOT) \
-	GOROOT="$(@D)" \
-	GOBIN="$(@D)/bin" \
-	GOOS=linux \
-	CC=$(HOSTCC_NOCCACHE) \
-	CXX=$(HOSTCXX_NOCCACHE) \
-	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
-	$(HOST_GO_CROSS_ENV)
-
-define HOST_GO_BUILD_CMDS
-	cd $(@D)/src && \
-		$(HOST_GO_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
-endef
-
-define HOST_GO_INSTALL_CMDS
+define GO_BINARIES_INSTALL
 	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_ROOT)/bin/go
 	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
 
@@ -165,4 +129,4 @@ define HOST_GO_INSTALL_CMDS
 	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
 endef
 
-$(eval $(host-generic-package))
+include $(sort $(wildcard package/go/*/*.mk))
diff --git a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch
similarity index 100%
rename from package/go/0001-build.go-explicit-option-for-crosscompilation.patch
rename to package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch
diff --git a/package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
similarity index 100%
rename from package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
rename to package/go/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
diff --git a/package/go/go.hash b/package/go/go/go.hash
similarity index 100%
rename from package/go/go.hash
rename to package/go/go/go.hash
diff --git a/package/go/go/go.mk b/package/go/go/go.mk
new file mode 100644
index 0000000000..c3c40922f4
--- /dev/null
+++ b/package/go/go/go.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# go
+#
+################################################################################
+
+GO_SITE = https://storage.googleapis.com/golang
+GO_SOURCE = go$(GO_VERSION).src.tar.gz
+
+GO_LICENSE = BSD-3-Clause
+GO_LICENSE_FILES = LICENSE
+GO_CPE_ID_VENDOR = golang
+
+HOST_GO_DEPENDENCIES = host-go-bootstrap-stage3
+
+ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
+
+HOST_GO_CROSS_ENV = \
+	CC_FOR_TARGET="$(TARGET_CC)" \
+	CXX_FOR_TARGET="$(TARGET_CXX)" \
+	GOOS="linux" \
+	GOARCH=$(GO_GOARCH) \
+	$(if $(GO_GO386),GO386=$(GO_GO386)) \
+	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
+	GO_ASSUME_CROSSCOMPILING=1
+
+endif
+
+# The go build system is not compatible with ccache, so use
+# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
+HOST_GO_MAKE_ENV = \
+	GO111MODULE=off \
+	GOCACHE=$(HOST_GO_HOST_CACHE) \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
+	GOROOT_FINAL=$(HOST_GO_ROOT) \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin" \
+	GOOS=linux \
+	CC=$(HOSTCC_NOCCACHE) \
+	CXX=$(HOSTCXX_NOCCACHE) \
+	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
+	$(HOST_GO_CROSS_ENV)
+
+define HOST_GO_BUILD_CMDS
+	cd $(@D)/src && \
+		$(HOST_GO_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
+endef
+
+define HOST_GO_INSTALL_CMDS
+	$(GO_BINARIES_INSTALL)
+endef
+
+$(eval $(host-generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
