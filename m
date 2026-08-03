Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA25C55190
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 07:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9006D80D1D;
	Mon,  3 Aug 2026 07:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WvV9Qbn7Oc8q; Mon,  3 Aug 2026 07:00:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E7B80D16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785740400;
	bh=wsMxeyUKagb05rQ/SvKw22Ym0jztrDhIF2djCBs/HEU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AyKYTV0m34j+PxNeRue5GsCm+ugWu5EoGJso3UybaiU84+8VaFmIaKAt/92gP17Aq
	 2pSXBe0rmwxGAhw5WgehbFH3PHXB2HZXLYF9tkDWR7URxBkZBmJrgjq4b7FzCWvgnn
	 IbBNzFsYZ0E64YysqSonAr1zGM6AbajMDuST0c4KTsfBgslHQL9/oiOzHVhdPLn448
	 vTqoa51rMamEJSWRY7UVeMq01KJavP096AIsH5oV5XsrbVjp3ZyqxzRVLP5Q52ZaQn
	 se1d6wcb7dorOLdTwKdrXN4BR3fOWKuttd1F9FlRb19GftnhogA18Ok2gtJZPeh+s2
	 6dtwUmTs1qg7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44E7B80D16;
	Mon,  3 Aug 2026 07:00:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E8D526C
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8E7C80C9A
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXXXhdBv__xm for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 06:59:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9CFFA80C87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CFFA80C87
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CFFA80C87
 for <buildroot@busybox.net>; Mon,  3 Aug 2026 06:59:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4955158f26aso11659125e9.3
 for <buildroot@busybox.net>; Sun, 02 Aug 2026 23:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785740393; x=1786345193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=igeJeQWBqmSixR2KghTC5YqufksgNZ/9DdWuEcqiymA=;
 b=QsV+fMsVellB9D8MOEMLA4ukn1RTcldHgYbDkDeI4a2VP6u7TBrAuPvV7fZqXwNBfA
 lTrDEO9lQkWqKPqPHTJLK1dIXbcAFUg23ajDqWTuw7BK9jVslWnt2BH0TTeRNT03912b
 4pRVBH81E14bge9iY+bdGKWX43FOXV4e/dqwHDCPo3kbsQ/BDpmq/TbztblLP+GCLzAJ
 8bl1gvflWzByj8rDMLUyRqAMstCh7DHYmiRCthNE4tt3v1TMDaYZSW1XL84iIA+NM1SK
 ImDGD3HQqpJOCCZl6Zw/W7q59Yqy29QZj5genjkhKhTRNRS1MCbfHPTT9CH9XTjSNblY
 /Kzg==
X-Gm-Message-State: AOJu0YxAnslf+9536ydMyWbLZhmvjLi7cYhNmUPzFkubpFJaJUEp88VY
 3fxkn1VrQIG+PWJxerhuaolJSdFCiXTZMSdBklz4EViYT9CNO/DfJZiWRSzTsg==
X-Gm-Gg: AR+sD13HtEgFrDkIjtvsK13vB9A2Obr4i4ZI2FD87WztPg9z8scFg8ac4q5/WIJpn5V
 13fBJMlYw4CB6O3adg6Op/Bb4drTxdA9lN4UlMQnO1J9zvB8XlFhThlauifmBaQNqxTSDHUfNoc
 aHVZVOybFMPWhvuWpVhptkIslRSh3Dbc0UO2FvNWlo5oLGtLksGv/ITTUEda/yyd/PlvqtLRnfg
 42uAELN0oZo3IlBvcNSDvG57xbDxhP+8hE+HnTsk2ra9hUuM9AG/oK9b4031fWfFbqyCdmuQcP2
 sLkrc67oJXzRBKvpuH9HsIDDQTi5AETFuJUtvrrs4bDuJ1C4PTGJ9aZvnqkRV9Eq6CLlfG0tLuf
 mlkGso5spDmODRdky4TLRbmxnLvGHKhQIUMKtweJ8sLsLDWlj+NLGYZ6hOvBVypJvw7xoQB5xdY
 UBjLi4SKSzqkqr+o0OrNubFPbYKlmITiYl/NLetPlB9V5f9z5cp/GsDspj6g2uL8ENpVn4q5Z5h
 BTdQlWyHhhTQEYyw0lFAA==
X-Received: by 2002:a05:600c:4e52:b0:495:3f84:a792 with SMTP id
 5b1f17b1804b1-4980c674dcamr230276285e9.12.1785740392512; 
 Sun, 02 Aug 2026 23:59:52 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b5b4a2sm234639805e9.1.2026.08.02.23.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 23:59:52 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon,  3 Aug 2026 08:59:36 +0200
Message-ID: <20260803065940.224429-6-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803065940.224429-1-francois.perrad.86@gmail.com>
References: <20260803065940.224429-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785740393; x=1786345193; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=igeJeQWBqmSixR2KghTC5YqufksgNZ/9DdWuEcqiymA=;
 b=SXQprq9FNk1jXNc665K4gA6BTxF0QUuY37Jt3K9tsM2sCKLBPJF8aS3Pn2QwMSNn9H
 aPXdwAIb70/B29QAUPj5uWUx5LXCbxZfP3c8T59jtYAG99BNzKSPIl8Em8VJdeli2F8s
 rnr2QqgwnU4F1bjFhC36rj+958NhhqUSp1AtyONE3nMiRUxcceWefntrkDqJZQC29K8I
 2RZwfis3ZYCcYQtE2X8dOkdZ4uwyYHqYOokO11xan9JWdcWb/VXDH3zNeuUuoYHjnEBW
 Ziq5TarY1aHyClri5rjPqdKfjH/ji/kYfiEng7tH9aJfv3Idt5IYvc5U0mnDXdRMS3UV
 2SSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SXQprq9F
Subject: [Buildroot] [PATCH v4 5/8] package/pkg-hare.mk: new infrastructure
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
index 000000000..f3128b3c7
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
+HARE_RUN_CMD = PATH=$(BR_PATH) HAREPATH="$(HOST_DIR)/src/hare/stdlib:$(STAGING_DIR)/usr/src/hare/third-party" $(HOST_DIR)/bin/hare
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
