Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4FBCD98D8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 20:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C08E4406D2;
	Fri, 12 Jun 2026 20:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4ARXzZO-iZL; Fri, 12 Jun 2026 20:51:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E239406F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781297481;
	bh=G9J8ocheC34TZnBAoxK64uQ+wpbZ0kjGbJYRGo+gln8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rQA0nFGIknRIfBH4DnhdjHbVShQEezHTMHZkBp/l9OR4J/U+CVxwYe104kl5Z4CX7
	 6GLx5aeUWFojcYdYOhOohbQBd/Jrr7/pDb5Cj6pe0QHCcH3WBgPE2J9O/Pd1EkAySZ
	 RZBEB1xqi2cSqF9mBFsZaeH89xmkT3RfBCqhEUb40L/PXjl+yxKSNI+H9OmY+5kshG
	 oi+jG+t5bApJr6aQNIhsR4WtZoO3sgwlU6sB6xQzv8WP23dIOiK2MTTcXXfBNQjzuQ
	 3IxQuOhtgihUO/lPnDTFzWZyQ2iqfEylOOBJE9m3tI10HSUA0QWbH0hPiZr6QaLiD6
	 HXebbPtF+I8yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E239406F9;
	Fri, 12 Jun 2026 20:51:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49746237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37CB78414B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AetPgKQerMdk for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 20:51:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E82ED816EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E82ED816EE
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E82ED816EE
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 20:51:16 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45ef56d9b67so1109595f8f.2
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 13:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781297475; x=1781902275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DlD7dH0uVjPZw8T5KkyXe5gKETOZqhBG+rvNo8OBPh8=;
 b=ANsep6nVkWP26j07mX25RO2gXpfu8dXHP2a+nUlL8eBBTpB5E1VlNXf0o2fi17ZXhZ
 2QJNIRJZzES5wR64lkzdVBG2Yteg2Mg/a5ctlsJHH+X0qFuf0oWaCR8YJV2iY4NKzGeV
 dkPZ2/JlpGqvGkeP/UhNGRY2PQr1Dm2l67rMqbfcFo5QQ5t+O81t9QTS0kJLhELeM16w
 MQUVsyYaA5DtS7qu7Ud18YDfbdvVQWrGiybnZFUfg7Kc6qSucBLy5H8R9P8b5M5Jx1Us
 eEVFS31bNBShRbOGIg22o9tSFKGP36Kig08AaUxQEN9zSmgF3S2bgzJWL8HzR1ol8QDS
 CL+g==
X-Gm-Message-State: AOJu0YyVWQSauEditQGSotTPDo5/MukNCNVsWy0z5Mj5yNDECfhpB28A
 bzJ6eEia4nnksk69jaydPozeAxkZL6MtOJ+pB73IbAO66087W3Wsu8JN17p4nOMDZtLSj3zCQcK
 RYMFrnQ==
X-Gm-Gg: Acq92OHG+fCpwIoMTNzTi9CqEhScXnqF0hRlvPI30k47yCjwVUvw44g/JWNSmUcJNFS
 rBupUod7sb+aaGfW33Va3fvjnH6ZeaVkmuy8egirBm48YeliXvHY2fVzAN2+HBXH3qN5myse5Re
 EWkPrn53Ww3NfLodTkKr6nbfhLqZxq6N1VyjOp6OEWVyy5HXtVIbvnjxelSg4Ijsf/494pzVIA4
 EjBygU7XswzPc+tEkoGMTqIH0olm0EjCPJG6DaXMN9viXpzHe0sI3qC1vZBqKjE4vXi1l5oQSMv
 fmciYmrqqCg0uR+3kjCceo8s99mR9k481qlX5I1Y6U8sF3XdoZXBheQwf1EtXZVVlQQ7fAP5xvq
 RsUdxutJwhyHMSKbEm66xYrli8m7yUDxL/tNr82SfNA5auM6sZiRwEQY+d2nve6pAULx9/52rKZ
 ZKzY6zNi7AAlRotixdcmlqrODxRp2rt9Uf3etpX37XZM8k3GdJHw==
X-Received: by 2002:a05:6000:1869:b0:460:70ae:f1a4 with SMTP id
 ffacd0b85a97d-46074b8219emr990230f8f.13.1781297473174; 
 Fri, 12 Jun 2026 13:51:13 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26434dsm9353447f8f.1.2026.06.12.13.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 13:51:12 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Fri, 12 Jun 2026 22:50:24 +0200
Message-ID: <20260612205029.269642-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612205029.269642-1-francois.perrad@gadz.org>
References: <20260612205029.269642-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1781297475; x=1781902275; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DlD7dH0uVjPZw8T5KkyXe5gKETOZqhBG+rvNo8OBPh8=;
 b=FL/4o1OPNe8bECcBU6huTsP5cQ0so3aPgtLH0ubYiZoX2CZEdXSukZ/lgiknenx4dc
 ZNRzknxcY81vOS5ecTRnFCf60AjeXW4lNc19IXgLJeG20IhmFRNUgCG09ukW1J+7TYJj
 zA3C/g4P4icNj/k33Qu2ViT16/y6zU7FWZsGE2KSbBfxWRsYzHnPuXkNT7+sqMJzLTMk
 U3Bk3w+rXBtaty44FeYzCcDEZ9jAeeO5PByO7lHarkcrjzKcZ4Y53BAm9BSIo2NqbFAe
 8CBBrZWzWs0VgU43kEgkI6cqM3U04NYGTIZuIsY+sWENf33rLig+OOtPm72kT5B2t4Vf
 xW0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=FL/4o1OP
Subject: [Buildroot] [RFC PATCH 5/9] package/hare: new infrastructure
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                            |  1 +
 docs/manual/adding-packages-hare.adoc | 87 +++++++++++++++++++++++++
 docs/manual/adding-packages.adoc      |  2 +
 package/Makefile.in                   |  1 +
 package/pkg-hare.mk                   | 93 +++++++++++++++++++++++++++
 5 files changed, 184 insertions(+)
 create mode 100644 docs/manual/adding-packages-hare.adoc
 create mode 100644 package/pkg-hare.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 81259905b..fe759a8aa 100644
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
index 000000000..9e3aa929f
--- /dev/null
+++ b/package/pkg-hare.mk
@@ -0,0 +1,93 @@
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
