Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFEEC55822
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 19:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BE5F40650;
	Mon,  3 Aug 2026 19:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jG9qgddZCVML; Mon,  3 Aug 2026 19:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8A7E40652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785785734;
	bh=0+nraz7VKJArNLGi1UJm+7Qwp6/wa0At7QqwV91j4M0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rGrodGL1gLE5SPheZPMdlTUXdEmAqaLT5PSASciJ1ci1KTpgOyIEwheyDDJADV/aU
	 /mCFIu6HQEdfQ7T6o1X/pJII6floLDro9L1YvjCuaNToPiJI/wn7sNs062dqHXXw95
	 /jvwkYEzv9sSXqt/+OjWOnnsVkxxrYyGFWDHrn0TFWCFrdlP25PndEuPC78vjmBp24
	 A19HpyTURcD+GiTZgFQWFJ0mh2tEcrEhEQcWoi9uPI4nvokFVC2j2LHGuHdIOXuz+q
	 CIlECJSE/c0EK4UnVEWlSwPz8pmeXvnA03SbAdutSo7pq86rTH7i2AE88qfWIOV/5f
	 Vr0ovjjkwlpXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8A7E40652;
	Mon,  3 Aug 2026 19:35:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ADE652DE
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B7DC6069F
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aN43F59ct_I1 for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 551326069D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 551326069D
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E1B18B85A; Mon,  3 Aug 2026 19:34:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Aug 2026 21:15:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72ff2ad88d6fd937da12abd4ed59a5fc10d021a0
X-Git-Newrev: 44d38432343e65ec7a6d898cf982985cc2bc1e88
X-Patchwork-Hint: ignore
Message-Id: <20260803193439.9E1B18B85A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-hare.mk: new infrastructure
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44d38432343e65ec7a6d898cf982985cc2bc1e88
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
[Julien: split long lines]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                            |  1 +
 docs/manual/adding-packages-hare.adoc | 87 ++++++++++++++++++++++++++++++
 docs/manual/adding-packages.adoc      |  2 +
 package/Makefile.in                   |  1 +
 package/pkg-hare.mk                   | 99 +++++++++++++++++++++++++++++++++++
 5 files changed, 190 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f9b3ca6278..a877140992 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1203,6 +1203,7 @@ F:	package/lzlib/
 F:	package/moarvm/
 F:	package/opendoas/
 F:	package/perl*
+F:	package/pkg-hare.mk
 F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
 F:	package/quickjs/
diff --git a/docs/manual/adding-packages-hare.adoc b/docs/manual/adding-packages-hare.adoc
new file mode 100644
index 0000000000..b52d953b2e
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
index 10acae0b1a..2c66d88f37 100644
--- a/docs/manual/adding-packages.adoc
+++ b/docs/manual/adding-packages.adoc
@@ -43,6 +43,8 @@ include::adding-packages-golang.adoc[]
 
 include::adding-packages-qmake.adoc[]
 
+include::adding-packages-hare.adoc[]
+
 include::adding-packages-kernel-module.adoc[]
 
 include::adding-packages-asciidoc.adoc[]
diff --git a/package/Makefile.in b/package/Makefile.in
index 5ebb5f9ba8..eac28b3a96 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -474,3 +474,4 @@ include package/pkg-golang.mk
 include package/pkg-meson.mk
 include package/pkg-qmake.mk
 include package/pkg-cargo.mk
+include package/pkg-hare.mk
diff --git a/package/pkg-hare.mk b/package/pkg-hare.mk
new file mode 100644
index 0000000000..14e0cfce5a
--- /dev/null
+++ b/package/pkg-hare.mk
@@ -0,0 +1,99 @@
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
+HARE_RUN_CMD = \
+	PATH=$(BR_PATH) \
+	HAREPATH="$(HOST_DIR)/src/hare/stdlib:$(STAGING_DIR)/usr/src/hare/third-party" \
+	$(HOST_DIR)/bin/hare
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
+# in perfect world, all project follows the conventions described in
+# https://harelang.org/documentation/usage/project-structure.html#makefiles
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
