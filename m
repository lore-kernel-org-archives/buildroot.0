Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BD8EE3F31
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 21:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4665821A0;
	Tue, 12 Sep 2023 21:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4665821A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xk6xPyHNYxOS; Tue, 12 Sep 2023 21:28:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3460821DE;
	Tue, 12 Sep 2023 21:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3460821DE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 279131BF964
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01A22821A0
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01A22821A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_26rBP_FbiW for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 21:28:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F12A382179
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 21:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F12A382179
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0AB586C38; Tue, 12 Sep 2023 21:28:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 23:26:58 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c03acacfb3a4afb8eb9448f17f07400fea0c0047
X-Git-Newrev: a0360d523110b2bea6a6ea633e940c68a6783d65
X-Patchwork-Hint: ignore
Message-Id: <20230912212814.E0AB586C38@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/nftables: fix the
 build of the python bindings
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a0360d523110b2bea6a6ea633e940c68a6783d65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

nftables provides python bindings; it uses setuptools to install them.
We currently install those bindings by telling the nftables buildsystem,
autotools, to install the python bindings.

However, we do not pass any of the environment variables that are needed
for setuptools packages. When host-python-setuptools is installed before
nftables is built [0], this breaks the system at runtime, as the
bindings are not installed; only the egg is, resulting in runtime errors
like:

    # python -c 'import nftables'
    Traceback (most recent call last):
      File "<string>", line 1, in <module>
    ModuleNotFoundError: No module named 'nftables'

Upstream has been doing some changes on their python handling, but it is
not in a released version yet, and we can't backport those changes
either, due to other big changes.

Instead, we split the pyhon bindings to their own package.

For legacy handling, we make that new package default to y, so that
existing (def)config still work. The only novelty is that it can be
disabled now.

Many thanks to Julien for testing and finding the offending dependency,
to James for suggesting the package split, and to Adam for, well,
trigerring the issue in the first place! ;-p

Note: a git bisect of the issue turns up 72 candidates for the breakage,
all around the time we dropped python2 support in early 2022; the last
known-good commit is 55df30f8b1fb (package/zfs: drop python2 support)
and the first known-bad commit is 697acda00d9f (package/pkg-python: drop
python2 host/setuptools support); everything in-between does not
configure (package/python/Config.in.host still sourced but already
removed), or does not build (host-python still in the dependency chain
but already removed), so had to be skipped during the bisect.

[0] This can happen when another python package using setuptools is
    built before nftables. However, with PPD, this never happens because
    host-python-setuptools is never in the dependency chain of nftables.

Reported-by: Julien Olivain <ju.o@free.fr>
Tested-by: Julien Olivain <ju.o@free.fr>
Suggested-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eb74998125b43701a321e12afff8339e11320d7d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nftables/Config.in                         |  5 +++++
 package/nftables/nftables-python/Config.in         |  4 ++++
 .../nftables/nftables-python/nftables-python.hash  |  1 +
 .../nftables/nftables-python/nftables-python.mk    | 22 ++++++++++++++++++++++
 package/nftables/nftables.mk                       | 18 ++++++++++--------
 5 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index 8d172b7256..833a3a38a2 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -13,5 +13,10 @@ config BR2_PACKAGE_NFTABLES
 
 	  http://www.netfilter.org/projects/nftables/index.html
 
+# Legacy: this used to be handled in nftables.mk
+if BR2_PACKAGE_NFTABLES
+source "package/nftables/nftables-python/Config.in"
+endif
+
 comment "nftables needs a toolchain w/ wchar, headers >= 3.12"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
diff --git a/package/nftables/nftables-python/Config.in b/package/nftables/nftables-python/Config.in
new file mode 100644
index 0000000000..b16e2d0ad1
--- /dev/null
+++ b/package/nftables/nftables-python/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_NFTABLES_PYTHON
+	bool "python bindings"
+	default y # legacy
+	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/nftables/nftables-python/nftables-python.hash b/package/nftables/nftables-python/nftables-python.hash
new file mode 120000
index 0000000000..9ac74580e7
--- /dev/null
+++ b/package/nftables/nftables-python/nftables-python.hash
@@ -0,0 +1 @@
+../nftables.hash
\ No newline at end of file
diff --git a/package/nftables/nftables-python/nftables-python.mk b/package/nftables/nftables-python/nftables-python.mk
new file mode 100644
index 0000000000..908bacd99a
--- /dev/null
+++ b/package/nftables/nftables-python/nftables-python.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# nftables-python
+#
+################################################################################
+
+# The following assignments work only because nftables.mk is included before
+# this file is.
+NFTABLES_PYTHON_VERSION = $(NFTABLES_VERSION)
+NFTABLES_PYTHON_SOURCE = $(NFTABLES_SOURCE)
+NFTABLES_PYTHON_SITE = $(NFTABLES_SITE)
+NFTABLES_PYTHON_LICENSE = $(NFTABLES_LICENSE)
+NFTABLES_PYTHON_LICENSE_FILES = $(NFTABLES_LICENSE_FILES)
+
+# We share the same source code as nftables
+NFTABLES_PYTHON_DL_SUBDIR = nftables
+
+NFTABLES_PYTHON_SUBDIR = py
+
+NFTABLES_PYTHON_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index b0a14bd429..d31df8afa4 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -10,9 +10,15 @@ NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NFTABLES_LICENSE = GPL-2.0
 NFTABLES_LICENSE_FILES = COPYING
-NFTABLES_CONF_OPTS = --disable-debug --disable-man-doc --disable-pdf-doc
 NFTABLES_SELINUX_MODULES = iptables
 
+# Python bindings are handled by package nftables-python
+NFTABLES_CONF_OPTS = \
+	--disable-debug \
+	--disable-man-doc \
+	--disable-pdf-doc \
+	--disable-python
+
 ifeq ($(BR2_PACKAGE_GMP),y)
 NFTABLES_DEPENDENCIES += gmp
 NFTABLES_CONF_OPTS += --without-mini-gmp
@@ -42,13 +48,6 @@ else
 NFTABLES_CONF_OPTS += --without-json
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-NFTABLES_CONF_OPTS += --enable-python
-NFTABLES_DEPENDENCIES += python3
-else
-NFTABLES_CONF_OPTS += --disable-python
-endif
-
 NFTABLES_CONF_ENV = LIBS="$(NFTABLES_LIBS)"
 
 define NFTABLES_LINUX_CONFIG_FIXUPS
@@ -58,3 +57,6 @@ define NFTABLES_LINUX_CONFIG_FIXUPS
 endef
 
 $(eval $(autotools-package))
+
+# Legacy: we used to handle it in this .mk
+include package/nftables/nftables-python/nftables-python.mk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
