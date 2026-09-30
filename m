Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1231CA5FC4
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 20:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77DCF81204;
	Wed, 30 Sep 2026 20:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vsin4FT6zk_p; Wed, 30 Sep 2026 20:37:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4287180FAB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790800671;
	b=Aqd2wL3J6plPYsqXK3r3BZvzRLkcWZjNmaWfmhEheDYnU4n3ZYl6Qvnyl3xQozoERBc0
	 S4aoN0q1PnFUDUeb6CMO8nDgWRzd234Xn+TqXTpDWfOJW+izIBlG97NEh7dlvt5hbgd/t
	 V3pETNUpeW6b42Hy4BchRdoGKgpZcDH4OutKRI/35OTob9ZZ5lbKK2fIkSubsKA0HQUv/
	 woTssC28i3bhfsH25snbkhKaVfwemLRWdRx1c9gEIjNbbw3S5hrw7r/on45pOZINDVwGI
	 1kYYEzjG4vBMfF1Tp3QYvrGU7B1l7VyqdAIvOEl7zE3gbIFPgPRCIeTz6APNVhQZLJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790800671;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2PWEqdKQsW9smXJoALNCe/k9FeI4LCyGGSF00CeEP/0=;
	b=lYYiXFpuZlk3SIP1zcfA6GpaXyIoCa/MJjm5PS+q00XUg8njNQkXR5fseDxsIzmq5IIM
	 DJh2nRdlF0kMAY4kzEsWsBOnkCFwJkzRSuswmM7A6T0+ZMvpZaQqv8e5+84qP8YUjE066
	 APG94reZF7SXFlEZfipN3UqDU6RxQlo1gEK438F7aw7O2UIP2lrkg6yL78C2SaDLNA3QC
	 ss8aF5dphxdB/1TdNoUNuLgKSduoB8wpS8/PxfLK+uBXbnslfmGNSxExup5rXJYtv0BFb
	 Nc9k1Bhp1ThRF6ZVocTkKJH7DnkxuJ+99JxE4Eum2cT84K2FYOnwdNNZHCzIeoRIo4w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790800671;
	bh=2PWEqdKQsW9smXJoALNCe/k9FeI4LCyGGSF00CeEP/0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NKKJTa7PlNs1yghYw2aMI5U/ZAxs5B/BrNjn2IGtsXSjPlKQTks9AIylQ4C6IJcmQ
	 xtQhx0HPLe9/ecEfMjyMDEr/ziLd4/uXt3AcMAJYwhjYrwSopdVPs1i5Pe8U58d1em
	 nMpyhBCjWHap1MuFHol9mhF4ozh57PqPnH6bdFzBXIvHM3Lx2FqDKSZxENFy+c8BDD
	 Ki+cVyREHE1xArw8AHkTrbLvxrMLPTvBTKuW3+yeLramC2Evg0p9aU4fGaLUijxqbj
	 vMGCaSi5OGcKX9UztMqfRCwvCiBtAqfRKjn2eEa20Nz4uFV4C5rTr+Jc79FcthuJYU
	 76O6N1qHAEX2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4287180FAB;
	Wed, 30 Sep 2026 20:37:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 697A0116C
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 20:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F55660A41
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 20:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUlgMxvyTua3 for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 20:37:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C097F605AD
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=74.125.225.141
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790800668;
 b=d/Zz0GksOYTwNotfbkMZSOZQZmiXmuCELFaWB6wfgyvsVF1vwKTfHA7zcO8MlLYsH0bR
 tHbfTlIRpo0CpwLbeDaqib14FnNsK9P2MxaqUmUoAn/7QC8e1fpKWXWHxh2ODMQMnDZ6L
 2spC4PCrmLC0w07lL7JhEa6wbRagVWrb2JhZdta7PJQeILjvd0xxwgWRK4KekXNlJZ5/w
 G2oGrKXkLDLaOQoXNJyh+eNxRpDSFOkJI48oQEy3eNMioeYOkkML/1LuXebG1BaxngHiG
 MBCUMq7aoY1rM2yBqhLKRM3Aepy0lBXbXZ5esTiIXMe1vs9ggUuDnudZxwNPkERygoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790800668;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ouqo+8VO2s5y5p6+HgoS7Gqqpd3kCje/xSjS1LK23g8=;
 b=Q9EZJfLcKrkRJQo2kQgnXNWw7gE3Xhgrqs6erWrCNbVet7DVieXVRybPD3qyeUV2vB7k
 /Fc/QF81gysvOmV674obzdovX4mEEBnfvVGf92/eKx6u8nuzpzW+DZlq4HYltqAOgE+SE
 sV1Tq6Os5bCC1Ake7OLF+Yol0eOUexynD+9Baxk6jRryG0qaq+fSco4qSlS5eajclROkI
 YFlo81+6ja0Qd/MBP5NMoSUE+2GZOYjbdrQ5EJ0cVOaA+iGLm37bZJPXr5nq264BlQKqz
 fhA5oihXBvhmoeflwrT8l7/d5wM2onWF9MACqCmS587UGChmy8etgiHnViPPBXudq3g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=devoogdt.com; 
 arc=none smtp.remote-ip=74.125.225.141
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=74.125.225.141;
 helo=mail-wm2-f13.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com
 [74.125.225.141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C097F605AD
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 20:37:47 +0000 (UTC)
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e7bcb94d3so43858185e9.2
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 13:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790800665; x=1791405465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ouqo+8VO2s5y5p6+HgoS7Gqqpd3kCje/xSjS1LK23g8=;
 b=Wds+SbV439lstLi3Kp8+VB2NnBdvqc3mWmTrrRlskn+w8hB8YnpCjbVrCIz6BeSur0
 55rvgQ+q5THfR+1yVsdHABNUEc3qhMeNOTylf0cMtp7A+TomkYxj2y4uFgpOXy3FXcol
 D9WKAe5Tmin8xa7AQ8YxkrsvVpyd3c9afmiHW8cxFpECsKKB6swf5PqIprjoX+PAQqQC
 DXJL2k4ERPr0QooREuVHNvzcqwmrmI9BaSZMDlAcLBAUVAEaY7ngLzj3GsOLHgFiCRv4
 15aoaWUut05sDIfZsEzpJxUku5BjSGdxBp0XKcCRJQsFj7mOxFtU8oHD+CY8VfLqS8jV
 S4mw==
X-Gm-Message-State: AFuF++lmi3UrE3/L8hHd/u0geGfhneP2Qvlnyby3ZpC3EoT0Ou/lCiE5
 hEKg0MESXreT84JcfuhtavhVvziXyhwgth5oee7OLArKYZm3tyY2bbA3mtxYfp5C
X-Gm-Gg: AYBFou0Inq5JU314KNp08WsZAhXjypLUUP540amko+AiJ283M5VLucNv0W6DGK2O92W
 5IPtB0/JceronO0BMJa3fn1ZXI6UHXq5dQulCylIwttTiuSrcHLDuWVUQIlo6I3Ephj4TPCyYYQ
 eOgis7lOl0U1C7L8xF8tLsyAC/PWAw0l9ZKBz55Zj5dL2Ko3LuQATSXV754BgbhV/crWBkGhNzH
 DGjz2f8f4FtFJrlvvPZBe8YOPvfWyjbreWEV0Pv5y2RpHloHoWWJ9AGA/G+/s/gMpzwkxHKvbnV
 LW3ltIFxR5iMSWk51v3TppN5qXJUUaNqVwhuogK080a9JQduK9z1F6zhdm8q5TZe04nkeyoIYOx
 v3N8eTPHZ5GSdW8KWvgHd6qCIfq2dvb/No92W3cvrlB2rDbX8/KvlkcqRF0YQvRnxePHT8Lm9fp
 xBFimv1nqIRWVBK+bYV6eSLeYxOJY8QHCbtZjqBhXbFBJ0GsUnq/sd4E2dUyNsJwjM84zHon7/k
 cama1KRoLYrPziRNunCeixZ7ufyou4VAptp64u7H7uj2XHxIhtphBkcvLfGmC8vEoetkL1PpBkm
 6chf/GvzUvB6aQHbYnkMBld23rrc5Ac=
X-Received: by 2002:a05:600c:1d2a:b0:49c:fc6e:8caf with SMTP id
 5b1f17b1804b1-4a01b11c737mr47574635e9.19.1790800664789; 
 Wed, 30 Sep 2026 13:37:44 -0700 (PDT)
Received: from KORLIN44614.barco.com ([2a02:a03f:eb5f:fa00:304b:f68b:5c4:281])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4a01f96d01csm6588025e9.2.2026.09.30.13.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 13:37:44 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 30 Sep 2026 22:37:41 +0200
Message-ID: <20260930203741.3900469-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] core: allow host-cmake to be built with ccache
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

host-cmake takes a long time to build, but it is never built with
ccache: host-ccache is a cmake package, so when no suitable cmake is
available on the build host, host-ccache depends on host-cmake, and
host-cmake cannot depend on host-ccache.

However, the packages in the host-ccache dependency chain (ccache,
hiredis, blake3) only need cmake 3.18, while BR2_HOST_CMAKE_AT_LEAST
may be much higher, e.g. 4.3 for mosquitto. So a cmake from the build
host is often suitable to build host-ccache, even if it is not
suitable for the other packages.

Thus, when BR2_CCACHE is enabled, look for a separate cmake of at
least 3.18, exposed as BR2_CMAKE_NOCCACHE and
BR2_CMAKE_NOCCACHE_HOST_DEPENDENCY, and use it in pkg-cmake.mk for
all packages that set <PKG>_ADD_CCACHE_DEPENDENCY = NO, as those can
by definition not depend on a host-cmake built with ccache.

When that cmake is found on the build host, host-cmake depends on
host-ccache, and uses it for both the bootstrap (--enable-ccache) and
the main build (CMAKE_<LANG>_COMPILER_LAUNCHER). Otherwise, host-cmake
is built without ccache, as before.

Additionally, when BR2_PACKAGE_HOST_CMAKE is enabled, use host-cmake
for all cmake packages instead of the one from the build host.

Tested with a system cmake 3.28, and without one (by passing
BR2_CMAKE_CANDIDATES=nonexistent):
 - system cmake, host-cmake enabled: host-ccache is built with the
   system cmake and host-cmake with ccache; a rebuild of host-cmake
   with a warm cache takes 2m06s, with 1502/1736 cache hits;
 - no system cmake: host-cmake is built without ccache and is used to
   build host-ccache, no circular dependency;
 - system cmake too old for BR2_HOST_CMAKE_AT_LEAST (mosquitto
   enabled): host-ccache still uses the system cmake.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 docs/manual/ccache-support.adoc          |  5 +++++
 package/cmake/Config.in.host             |  3 +++
 package/cmake/cmake.mk                   | 15 ++++++++++++---
 package/pkg-cmake.mk                     | 21 ++++++++++++++-------
 support/dependencies/check-host-cmake.mk | 24 ++++++++++++++++++++++++
 5 files changed, 58 insertions(+), 10 deletions(-)

diff --git a/docs/manual/ccache-support.adoc b/docs/manual/ccache-support.adoc
index 86cb4a150dc..45af6dfd41d 100644
--- a/docs/manual/ccache-support.adoc
+++ b/docs/manual/ccache-support.adoc
@@ -15,6 +15,11 @@ speed up the build process.
 +Enable compiler cache+ in +Build options+. This will automatically
 build +ccache+ and use it for every host and target compilation.
 
+Since +ccache+ is built with CMake, a suitable CMake from the build
+machine (at least 3.18) is used for +ccache+ and its dependencies. This
+allows +host-cmake+, if needed, to be built with +ccache+ as well.
+Without such a CMake, +host-cmake+ is built first, without +ccache+.
+
 The cache is located in the directory defined by the +BR2_CCACHE_DIR+
 configuration option, which defaults to
 +$HOME/.buildroot-ccache+. This default location is outside of
diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index b8221a7d222..f4dea749e12 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -8,6 +8,9 @@ config BR2_PACKAGE_HOST_CMAKE
 	  generate native makefiles and workspaces that can be used in
 	  the compiler environment of your choice.
 
+	  When enabled, this cmake is used to build all CMake
+	  packages, instead of a cmake from the build machine.
+
 	  http://www.cmake.org/
 
 # The minimum system cmake version we expect if 3.18 as provided by
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 098f6e91582..632fa2bf781 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -12,8 +12,15 @@ CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
 CMAKE_CPE_ID_VALID = YES
 
-# The package is a dependency to ccache so ccache cannot be a dependency
+# host-cmake can only use ccache when host-ccache is built with a system cmake
+ifeq ($(BR2_CCACHE):$(BR2_CMAKE_NOCCACHE_HOST_DEPENDENCY),y:)
+HOST_CMAKE_BOOTSTRAP_OPTS = --enable-ccache
+HOST_CMAKE_CCACHE_OPTS = \
+	-DCMAKE_C_COMPILER_LAUNCHER=$(CCACHE) \
+	-DCMAKE_CXX_COMPILER_LAUNCHER=$(CCACHE)
+else
 HOST_CMAKE_ADD_CCACHE_DEPENDENCY = NO
+endif
 
 # CMake is a particular package:
 # * CMake can be built using the generic infrastructure or the cmake one.
@@ -43,7 +50,7 @@ CMAKE_CONF_OPTS = \
 HOST_CMAKE_CFLAGS = $(shell echo $(HOST_CFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
 HOST_CMAKE_CXXFLAGS = $(shell echo $(HOST_CXXFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
 
-# We may be a ccache dependency, so we can't use ccache
+# ccache is enabled via bootstrap options, not via CC/CXX
 HOST_CMAKE_CONFIGURE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	CC="$(HOSTCC_NOCCACHE)" \
@@ -55,7 +62,9 @@ define HOST_CMAKE_CONFIGURE_CMDS
 		$(HOST_CMAKE_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CMAKE_CFLAGS)" \
 		./bootstrap --prefix=$(HOST_DIR) \
-			--parallel=$(PARALLEL_JOBS) -- \
+			--parallel=$(PARALLEL_JOBS) \
+			$(HOST_CMAKE_BOOTSTRAP_OPTS) -- \
+			$(HOST_CMAKE_CCACHE_OPTS) \
 			-DCMAKE_C_FLAGS="$(HOST_CMAKE_CFLAGS)" \
 			-DCMAKE_CXX_FLAGS="$(HOST_CMAKE_CXXFLAGS)" \
 			-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index f572bdebb3d..d205f6c5dcc 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -103,7 +103,7 @@ define $(2)_CONFIGURE_CMDS
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$(if $$(BR2_INSTALL_LIBSTDCPP),,CXX=/bin/false) \
-	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
+	$$($$(PKG)_CONF_ENV) $$($$(PKG)_CMAKE) $$($$(PKG)_SRCDIR) \
 		-G$$($$(PKG)_GENERATOR) \
 		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
@@ -135,7 +135,7 @@ define $(2)_CONFIGURE_CMDS
 	PKG_CONFIG_LIBDIR="$$(HOST_DIR)/lib/pkgconfig:$$(HOST_DIR)/share/pkgconfig" \
 	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
+	$$($$(PKG)_CONF_ENV) $$($$(PKG)_CMAKE) $$($$(PKG)_SRCDIR) \
 		-G$$($$(PKG)_GENERATOR) \
 		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
@@ -174,7 +174,14 @@ endif
 # primitives to find {C,LD}FLAGS, add it to the dependency list.
 $(2)_DEPENDENCIES += host-pkgconf
 
+# Packages that host-ccache depends on can't use a host-cmake built with ccache
+ifeq ($$($(2)_ADD_CCACHE_DEPENDENCY),NO)
+$(2)_CMAKE = $$(BR2_CMAKE_NOCCACHE)
+$(2)_DEPENDENCIES += $(BR2_CMAKE_NOCCACHE_HOST_DEPENDENCY)
+else
+$(2)_CMAKE = $$(BR2_CMAKE)
 $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
+endif
 
 #
 # Build step. Only define it if not already defined by the package .mk
@@ -183,11 +190,11 @@ $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) -j$(PARALLEL_JOBS) $$($$(PKG)_BUILD_OPTS)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$($$(PKG)_CMAKE) --build $$($$(PKG)_BUILDDIR) -j$(PARALLEL_JOBS) $$($$(PKG)_BUILD_OPTS)
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) -j$(PARALLEL_JOBS) $$($$(PKG)_BUILD_OPTS)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$($$(PKG)_CMAKE) --build $$($$(PKG)_BUILDDIR) -j$(PARALLEL_JOBS) $$($$(PKG)_BUILD_OPTS)
 endef
 endif
 endif
@@ -198,7 +205,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_OPTS)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$($$(PKG)_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_OPTS)
 endef
 endif
 
@@ -208,7 +215,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(STAGING_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_STAGING_OPTS)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(STAGING_DIR) $$($$(PKG)_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_STAGING_OPTS)
 endef
 endif
 
@@ -218,7 +225,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(TARGET_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_TARGET_OPTS)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(TARGET_DIR) $$($$(PKG)_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_TARGET_OPTS)
 endef
 endif
 
diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index e3676903198..52ea9271a56 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -8,9 +8,33 @@
 BR2_CMAKE_VERSION_MIN = $(BR2_HOST_CMAKE_AT_LEAST)
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
+
+# When host-cmake is enabled, use it for all packages.
+ifeq ($(BR2_PACKAGE_HOST_CMAKE),y)
+BR2_CMAKE = $(HOST_DIR)/bin/cmake
+BR2_CMAKE_HOST_DEPENDENCY = host-cmake
+else
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
 	$(BR2_CMAKE_VERSION_MIN) $(BR2_CMAKE_CANDIDATES))
 ifeq ($(BR2_CMAKE),)
 BR2_CMAKE = $(HOST_DIR)/bin/cmake
 BR2_CMAKE_HOST_DEPENDENCY = host-cmake
 endif
+endif
+
+# cmake for packages that host-ccache depends on (<PKG>_ADD_CCACHE_DEPENDENCY
+# = NO). A suitable system cmake is preferred, so host-cmake can then itself
+# be built with ccache. The minimum is the one required by ccache.
+BR2_CMAKE_NOCCACHE_VERSION_MIN = 3.18
+
+ifeq ($(BR2_CCACHE),y)
+BR2_CMAKE_NOCCACHE ?= $(call suitable-host-package,cmake,\
+	$(BR2_CMAKE_NOCCACHE_VERSION_MIN) $(BR2_CMAKE_CANDIDATES))
+ifeq ($(BR2_CMAKE_NOCCACHE),)
+BR2_CMAKE_NOCCACHE = $(HOST_DIR)/bin/cmake
+BR2_CMAKE_NOCCACHE_HOST_DEPENDENCY = host-cmake
+endif
+else
+BR2_CMAKE_NOCCACHE = $(BR2_CMAKE)
+BR2_CMAKE_NOCCACHE_HOST_DEPENDENCY = $(BR2_CMAKE_HOST_DEPENDENCY)
+endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
