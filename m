Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6F2C4452D
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 09:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C06E4087E;
	Tue, 21 Jul 2026 09:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inwNCcw0SA8u; Tue, 21 Jul 2026 09:39:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7532740880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784626793;
	bh=woG5rlPSeJLlPYhJqS88nMvekYMv0IhWy3JyzKQ81rU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XeVoYBGznWvsLADih+I7O9N0TPSdwnhF79KFweEAbMfV47d6AotDnteTBpryStakV
	 aWHQaHUfo5WuPx424fole2OLlzZ0Fuxx8SS9dOhKiFtazoxhsPN2KEU0JipIcllTi0
	 I+Ym2DgL+9xaT43CKHsAflVUAL8DHJhTknSBnb4Jl9gjlIzBhkPCpxzA99ZNwsLGra
	 gex75poei9JnpW/J+JjrQ9L9lbqAta9SpZzijOrwq42ybyFEpeJ51PnNMoLc+yr3UE
	 LHWX+jet3r91FO9hePPb659a4q9rDe/TAnkccf7RJTlXLPrpePCaEzPO07j4p4bCk3
	 fAoz473VQmzww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7532740880;
	Tue, 21 Jul 2026 09:39:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 656FB42A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5763680B84
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-aiq4ZyOJ6t for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 09:39:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0659180CA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0659180CA2
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0659180CA2
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 09:39:46 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49548e01d02so18368315e9.0
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 02:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784626785; x=1785231585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Xh+MOPb8Cd5qMS6x4t6BNHQNPhaxKyyzAge9zfIo9nw=;
 b=h237cPTZrTWHfDiWUls4nrlCfS8zM7FJUq3aNjiMlU4ew4UfiRYJvOEo663xu3fYiN
 Z+aVGeXnqZwBeYPBeYYG1Qy1ZtQ8FYHhThOIRQnESFjKz/wI3CbD/u7BdH1yORzORtVX
 a6u452sJjraskPWR3VB/5Q1PttAoabkfseH7AI9JBV/jz1T2MVTJN7sdCH5i7DiddESI
 xVDYSWqLwm2YHwu8XRrEmd2SYMfVpxbiLhiXtvF/AvmtMDP2KehYQGL4SQV+Ayt5iXFk
 XbrCm9bm/uFnnwA4RsKKUqc7btxOC5FCi9VpT68EfsEvdbf6C+878rkh1ZOEeNZ6e+io
 fqgg==
X-Gm-Message-State: AOJu0Yx6jdXrpfv3RvXAjsGeGJRnoB0ifYhuIF7PYon2TMixSvmYqsqp
 gRteRw/ZPk0Ta0Yy8inrxPO2FLQb0dnAq3vT5yOFxo2cYQQ9pZbU1qXkxjnWoA==
X-Gm-Gg: AfdE7clyMvz4ePfjn+DHH9zrCfr8U/yZcQ6xzCodgnqopXTyIcJuiVZmhkVS6vplphe
 5sHpKcUb4kV9zqpDaoCThHfmcpGMyG6PnHw9YkZXwac+i1uNZn/apsmMvpSRe2RP+HiJPsyVXa6
 f2L7t/i19V3frvzxho/KkVhUDTdUknzKSvLsc4ed4MvuXPlVsQuGp4CDa6gFzOW8md4HaNNCioU
 Yt+lqwitDv/6Fr9AFWgqIXcDmLRs7addLyJGlPwmBF9n2vGsw83WDuwmKtudKm+v8h+KWaDLHa6
 xLKQvxBGXVUEA+ao8iqkEw+tbOuoiacWw/FLjswiaySSQL05RJdaDWOXLwufV4dqtY6hltUpGgm
 nUMjF8FuvKGSICsBrxsA7rNcgdA0jC+1UX5lPftn8oDZqR5gpq4zQ5hr7+AamPioC9EBsopJZOx
 wSLQLvG0yZe3yS4FYLO+L5IdqbuE412iOXxg==
X-Received: by 2002:a05:600c:1d1e:b0:493:a966:d5b5 with SMTP id
 5b1f17b1804b1-4954a3d0cc7mr185183955e9.2.1784626784895; 
 Tue, 21 Jul 2026 02:39:44 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956546db7bsm56227655e9.3.2026.07.21.02.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 02:39:44 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 21 Jul 2026 11:39:29 +0200
Message-ID: <20260721093932.282565-6-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721093932.282565-1-francois.perrad.86@gmail.com>
References: <20260721093932.282565-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784626785; x=1785231585; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Xh+MOPb8Cd5qMS6x4t6BNHQNPhaxKyyzAge9zfIo9nw=;
 b=sJcodULlYCgYCb2E6Yosk3NBjGsqDVNZyQZQTlqtR7rNWJ0iL7KvuDndiku0UGBML+
 GhoKPw0JsrL9dyWkEAxS38vW5yo8FkmIMJmsgWXvrotlSTSFbMSMsXb1bn+57iC7Za0L
 PSnadSc2TbharT0ukBHRrlZrZJ4YC1w1TFCq8ZpYLdMt1+qwJ7r3B0O0hWChqlNmBmc9
 nE5l0VVuBcYTTq7sodC9QDDUu2NUozx6RrK9dFzUKhTtIdRWKEsRzhCslmwyMIsnoOPu
 IVVcBxqHS8q+wUm9YIj2kuqLldNpVQtMsYhNgjT9UmUXXYchEAAJNvH/tjI2emfXrx9h
 QDAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=sJcodULl
Subject: [Buildroot] [PATCH v3 5/8] package/pkg-hare.mk: new infrastructure
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 DEVELOPERS                            |  1 +
 docs/manual/adding-packages-hare.adoc | 87 ++++++++++++++++++++++++
 docs/manual/adding-packages.adoc      |  2 +
 package/Makefile.in                   |  1 +
 package/pkg-hare.mk                   | 95 +++++++++++++++++++++++++++
 5 files changed, 186 insertions(+)
 create mode 100644 docs/manual/adding-packages-hare.adoc
 create mode 100644 package/pkg-hare.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 89232ff71..ac7345e04 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1194,6 +1194,7 @@ F:	package/lzlib/
 F:	package/moarvm/
 F:	package/opendoas/
 F:	package/perl*
+F:	package/pkg-hare.mk
 F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
 F:	package/quickjs/
diff --git a/docs/manual/adding-packages-hare.adoc b/docs/manual/adding-packages-hare.adoc
new file mode 100644
index 000000000..b52d953b2
--- /dev/null
+++ b/docs/manual/adding-packages-hare.adoc
@@ -0,0 +1,87 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Infrastructure for Hare packages
+
+[[hare-package-tutorial]]
+
+==== +hare-package+ tutorial
+
+The +Config.in+ file of Hare-based package 'hare-foo' should contain:
+
+----
+01: config BR2_PACKAGE_HARE_FOO
+02: 	bool "hare-foo"
+03: 	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+04:	select BR2_PACKAGE_HOST_HARE
+05: 	help
+06: 	  This is a comment that explains what foo is.
+07:
+08: 	  https://foosoftware.org/foo/
+----
+
+And the +.mk+ file for this package should contain:
+
+----
+01: ################################################################################
+02: #
+03: # hare-foo
+04: #
+05: ################################################################################
+06:
+07: HARE_FOO_VERSION = 0.42.0
+08: HARE_FOO_SITE = https://git.sr.ht/~sircmpwn/hare-foo
+09: HARE_FOO_SITE_METHOD = git
+10: HARE_FOO_LICENSE = MPL-2.0
+11: HARE_FOO_LICENSE_FILES = COPYING
+12: HARE_FOO_INSTALL_STAGING = YES
+13:
+14: $(eval $(hare-package))
+----
+
+The Makefile starts with the definition of the standard variables for
+package declaration (lines 7 to 12).
+
+Finally, on line 14, we invoke the +hare-package+
+macro that generates all the Makefile rules that actually allows the
+package to be built.
+
+[[hare-package-reference]]
+
+==== +hare-package+ reference
+
+As a policy, packages that provide Hare modules should all be
+named +hare-<something>+ in Buildroot.
+
+In their +Config.in+ file, packages using the +hare-package+
+infrastructure should depend on +BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS+
+because Buildroot will automatically add a dependency on +host-hare+
+to such packages.
+
+The main macro of the Hare package infrastructure is +hare-package+:
+like +generic-package+ it works by defining a number of variables providing
+metadata information about the package, and then calling the +hare-package+
+macro.
+
+Just like the generic infrastructure, the Hare infrastructure works
+by defining a number of variables before calling the +hare-package+
+macro.
+
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the Hare infrastructure.
+
+This infrastructure expects that the upstream package follows the
+https://harelang.org/documentation/usage/project-structure.html#makefiles[project structure conventions],
+because the upstream +Makefile+ is called.
+
+When the package contains Hare modules (ie. libraries),
+there are not compiled by this BR package,
+there are just installed in +$(STAGING_DIR)/usr/src/hare/third-party+,
+for a future use.
+
+When the package produces one or more executables,
+all Hare sources (from this package, from dependent modules,
+from the Hare stdlib) are compiled and statically linked.
+If a binding to a native library is used,
+the link requires the static library, not the shared one.
diff --git a/docs/manual/adding-packages.adoc b/docs/manual/adding-packages.adoc
index 10acae0b1..2c66d88f3 100644
--- a/docs/manual/adding-packages.adoc
+++ b/docs/manual/adding-packages.adoc
@@ -43,6 +43,8 @@ include::adding-packages-golang.adoc[]
 
 include::adding-packages-qmake.adoc[]
 
+include::adding-packages-hare.adoc[]
+
 include::adding-packages-kernel-module.adoc[]
 
 include::adding-packages-asciidoc.adoc[]
diff --git a/package/Makefile.in b/package/Makefile.in
index 5ebb5f9ba..eac28b3a9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -474,3 +474,4 @@ include package/pkg-golang.mk
 include package/pkg-meson.mk
 include package/pkg-qmake.mk
 include package/pkg-cargo.mk
+include package/pkg-hare.mk
diff --git a/package/pkg-hare.mk b/package/pkg-hare.mk
new file mode 100644
index 000000000..e1c1415d0
--- /dev/null
+++ b/package/pkg-hare.mk
@@ -0,0 +1,95 @@
+################################################################################
+# Hare package infrastructure
+# see https://harelang.org/
+#
+# This file implements an infrastructure that eases development of
+# package .mk files for Hare packages.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this Hare infrastructure requires
+# the .mk file to only specify metadata information about the
+# package: name, version, etc.
+#
+################################################################################
+
+HARE_RUN_CMD = PATH=$(BR_PATH) HAREPATH="$(HOST_DIR)/usr/src/hare/stdlib:$(STAGING_DIR)/usr/src/hare/third-party" $(HOST_DIR)/bin/hare
+HARE_ARCH_OPT = -a $(ARCH)
+HARE_LIBDIR_OPT = -L $(STAGING_DIR)/usr/lib
+
+################################################################################
+# inner-hare-package -- defines how the configuration, compilation and
+# installation of a Hare package should be done, implements a few hooks to
+# tune the build process and calls the generic package infrastructure to
+# generate the necessary make targets
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including a HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the type (target or host)
+################################################################################
+
+define inner-hare-package
+
+$(2)_DEPENDENCIES += host-hare
+
+#
+# Build step. Only define it if not already defined by the package .mk
+# file.
+#
+ifndef $(2)_BUILD_CMDS
+# in perfect world, all project follows the conventions described in https://harelang.org/documentation/usage/project-structure.html#makefiles
+# but in real world, the target "all" is not always the default one
+define $(2)_BUILD_CMDS
+	if grep "^all:" $$($(2)_SRCDIR)Makefile > /dev/null; then \
+		$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" all; \
+	else \
+		$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)"; \
+	fi
+endef
+endif
+
+#
+# Staging installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_STAGING_CMDS
+define $(2)_INSTALL_STAGING_CMDS
+	$(MAKE) -C $$($(2)_SRCDIR) PREFIX=/usr DESTDIR="$$(STAGING_DIR)" install
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$(MAKE) -C $$($(2)_SRCDIR) PREFIX=/usr DESTDIR="$$(TARGET_DIR)" install
+endef
+endif
+
+# Call the generic package infrastructure to generate the necessary
+# make targets
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
+
+endef
+
+################################################################################
+# hare-package -- the target generator macro for Hare packages
+################################################################################
+
+hare-package = $(call inner-hare-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
+
+################################################################################
+# Cleanup target /usr/src/hare
+################################################################################
+
+define HARE_FINALIZE_TARGET
+	rm -rf $(TARGET_DIR)/usr/src/hare
+endef
+
+TARGET_FINALIZE_HOOKS += HARE_FINALIZE_TARGET
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
