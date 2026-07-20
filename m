Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC66C4452B
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 15:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D473606E5;
	Mon, 20 Jul 2026 15:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpu7Xpz8B431; Mon, 20 Jul 2026 15:02:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4D45606EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784559774;
	bh=L6ZdShU4CqRHGlgp6l++MweZP0GWjJjHBWQQEYvM49c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Um9/mdt/Sji2qJr2hWIVBPCHdDP7c1CqDCSgvT6ejEgaQpo12Gu1ruPgcRotUnWgG
	 HTtCKkRZIV3lPQPHWIjZzxEmjznunZY9LrPGAE9ZZU1IhOCEShgztMgJRVhkP8qOhP
	 tYE8qPEJObPYTujjXXPjDr0NQmIAdi04QEsJEb5TeL6vD4jYtsXenW1NHatnrWDMuD
	 C6RF90ScBnQqfj5FnbXiyOUT5AN8zukEvELE+NCuENDHdvc5QQGB58NVODQt0UFCiC
	 ksu8jJ5kKfe50tiZvg4VJ3NUSTR/VKB2y+/3TjeivbGEB3eZbTEQxoDMfTkPtPv4y6
	 zIM6zERdS9C0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4D45606EC;
	Mon, 20 Jul 2026 15:02:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15B481F6
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C29B80CBF
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1vReDnBtVeU for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 15:02:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B931480CD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B931480CD0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B931480CD0
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 15:02:49 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so5550702f8f.3
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 08:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784559768; x=1785164568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OsOKKujHwKWVSYe2U+emsOSRH4ZXN++sdgibMDntras=;
 b=ZW9kckKfeY1SZKlZwNJCzUgIVOfDsWyyIBE2nZq37+LkHK996/rFYh/AK4gIFXK2CP
 f/rzH00oM36H3FJGLCCyjxgPHz+lDJi3v98dn4s/Q8iYPckSOJijW7zrkRvhgqefEOpn
 65IFUq03wckNxknCmhbEAdkZbyvCLh9bJvBwC2r3JJV0nCzmCyGlo4iUm86juuneoonn
 I560KGXz0jrn6UsvT/pI7G+tB/ZlbdogXbgfEWsyFwxnV5sh1dtxhCVaHTA7JWTpWEhQ
 Z5KKMwXH4BHJ6CYg2dlZAxzR4vVjOuJJ3dpEg9IwTKLfIuHerKQ41DQqmtzMXQgwdt2Q
 G/IQ==
X-Gm-Message-State: AOJu0YxWIJCpjh0eMVOQ6IgjvNVGZEa3ffLf+IXiug36o+eE1xAtvxai
 9ErA1O1uEydXVhcfqSuBH6GGIN1lkqeFyTU0O4mVp7fN4d7X0Icqom40bI6NQQ==
X-Gm-Gg: AR+sD11cirxaaoL+yN4YDCGFk2jFoKbW61XaD0NQgwIqVLGpFcoDFm+KeAd5MzZvANR
 qnN//OusnjjR8rGsgrwouEvNqZiDmlvrED4BBCTIYDGPEK5PN8sygjYdgBHUL7JqvgkwLaBzvuN
 YaHRuBcPR0wXNYIgv9ADT00jBtbU956PX6ctX2xS6+UpFyn6nzgCYkbkhc42tYW7LzQZBTkRS8V
 hlzjOogELrINFF4Aw7HLcnmSagTBUgpk0zC+ZT0ND7/dvvJYCPfD1hP45+0sJdYdLATltozID+F
 MGheHlJsz2rl3C3aDUovXEi1N+SFkFOZcUHBb6BUHA/YEfAOSMjP/Zr8aSl7RaIWPs4CaN884+K
 +3nLD+TbH8t+xuxp3ZdrPYJG2byAduDGvYbG17TU/GAxDE0MN3TEI910bXf8wONFFA9gVowRDLP
 FKBCzIMY7fqWRAsXrk+fXyji9QLuy2
X-Received: by 2002:a5d:5d82:0:b0:47f:59b4:390c with SMTP id
 ffacd0b85a97d-47f62329496mr16566293f8f.50.1784559767321; 
 Mon, 20 Jul 2026 08:02:47 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ee926dsm28681532f8f.35.2026.07.20.08.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 08:02:46 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 20 Jul 2026 17:02:32 +0200
Message-ID: <20260720150236.243961-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720150236.243961-1-francois.perrad@gadz.org>
References: <20260720150236.243961-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784559768; x=1785164568; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OsOKKujHwKWVSYe2U+emsOSRH4ZXN++sdgibMDntras=;
 b=OvVxW5M/K1TSQlqRkm+yJk+CDp4zyp3kpZPlxrmRW6qmol97H5qP9uompaPeVLNYrn
 5bFtwTKgnflxxZ56nsVpP51dBlxbY50cPfwr8otcCNGw3MKNVMTh+s3Jh9Cy3CDwdTNa
 sb1yAyh59gPwuR0lS09/NfHJaOW6t/yatczkNQR+lweFPpjTFNPFqgVytbCOzZXDSBKf
 FElHB8YNOjQkVSrJqptLwb5SczQlY5kCj3Q/cn0I5IlVCySdcpDf8OlYKUjc5BnUTySp
 6h3klgExxnMPmqzPPY/c/IEaNZ7xNmpsKDUUEX9Oh1kZnFcTbpxKyZ0gNDCTUdWk6m9V
 d5Ww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OvVxW5M/
Subject: [Buildroot] [PATCH v2 5/8] package/pkg-hare.mk: new infrastructure
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
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
