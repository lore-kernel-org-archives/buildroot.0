Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BD5CA101B
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 22:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81BD160DB2;
	Fri, 30 Aug 2024 22:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yf9vN6ruO_lp; Fri, 30 Aug 2024 22:23:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54B40605E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54B40605E1;
	Fri, 30 Aug 2024 22:23:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 263251BF990
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 22:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 126BF424AC
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 22:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id it6hONrWBxsO for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 22:23:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A72964247F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A72964247F
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 22:23:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9163586782; Fri, 30 Aug 2024 22:23:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 00:21:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b6d023bdc2bb8585e779c3a1a7fac75b93bc7d41
X-Git-Newrev: 37801767f68c05500f1d4495b5baac0e7340f7a9
X-Patchwork-Hint: ignore
Message-Id: <20240830222316.9163586782@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gobject-introspection:
 use objdump instead of prelink-cross
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

commit: https://git.buildroot.net/buildroot/commit/?id=37801767f68c05500f1d4495b5baac0e7340f7a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit switches the gobject-introspection package from using
prelink-cross to simply using "objdump -p". This basically implements
the same change as was done in OpenEmbedded commit:

  https://git.openembedded.org/openembedded-core/commit/?id=767e0880d4d729e659e859dd99c1cdb084b8ba51

In particular, this allows to get rid of the architecture dependency
of prelink-cross, which wasn't currently encoded, but that was
actually causing failures such as:

/home/autobuild/autobuild/instance-17/output-1/host/sbin/prelink-rtld: error while loading shared libraries: /lib/libc.so.6: cannot handle TLS data

It also paves the way for removing host-prelink-cross entirely, as the
only remaining user of it now is dracut.

The test tests.package.test_python_gobject.TestPythonPy3Gobject (which
uses gobject-introspection) has been tested to run fine after this
commit.

Fixes:

  http://autobuild.buildroot.net/results/7efa6a18f543752dfe33577f74c20bda3f8b1e65/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 ...gnore-error-return-codes-from-ldd-wrapper.patch | 31 ----------------------
 .../g-ir-scanner-lddwrapper.in                     |  3 +--
 .../gobject-introspection/gobject-introspection.mk |  3 ++-
 4 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4017438f5e..e86fd390e9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -576,7 +576,6 @@ package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch lib_p
 package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
 package/gobject-introspection/0001-disable-tests.patch lib_patch.Upstream
 package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
-package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch lib_patch.Upstream
 package/gpsd/S50gpsd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch lib_patch.Upstream
 package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch lib_patch.Upstream
diff --git a/package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch b/package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
deleted file mode 100644
index f1ea518954..0000000000
--- a/package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e0fc4a2a5161a36483ddc518be9bb14390f11b19 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 5 Sep 2018 16:46:52 +0200
-Subject: [PATCH] giscanner: ignore error return codes from ldd-wrapper
-
-prelink-rtld, which we use instead of ldd returns 127 when it can't find a library.
-It is not an error per se, but it breaks subprocess.check_output().
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- giscanner/shlibs.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
-index 9f8ab5df..7a1a72fe 100644
---- a/giscanner/shlibs.py
-+++ b/giscanner/shlibs.py
-@@ -103,7 +103,7 @@ def _resolve_non_libtool(options, binary, libraries):
-             args.extend(['otool', '-L', binary.args[0]])
-         else:
-             args.extend(['ldd', binary.args[0]])
--        output = subprocess.check_output(args)
-+        output = subprocess.run(args, check=False, stdout=subprocess.PIPE).stdout
-         if isinstance(output, bytes):
-             output = output.decode("utf-8", "replace")
- 
--- 
-2.25.1
-
diff --git a/package/gobject-introspection/g-ir-scanner-lddwrapper.in b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
index 2f09bca77a..7f3db67da4 100644
--- a/package/gobject-introspection/g-ir-scanner-lddwrapper.in
+++ b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
@@ -1,3 +1,2 @@
 #!/usr/bin/env sh
-
-"${HOST_DIR}"/sbin/prelink-rtld --root="$(dirname "$0")/../../" "$@"
+@TARGET_OBJDUMP@ -p "$@"
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index f0c7fcd2ca..ad72af22a2 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -15,7 +15,6 @@ GOBJECT_INTROSPECTION_LICENSE_FILES = COPYING.LGPL COPYING.GPL giscanner/scanner
 GOBJECT_INTROSPECTION_DEPENDENCIES = \
 	host-autoconf-archive \
 	host-gobject-introspection \
-	host-prelink-cross \
 	host-qemu \
 	libffi \
 	libglib2 \
@@ -78,6 +77,8 @@ define GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS
 
 	$(INSTALL) -D -m 755 $(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-scanner-lddwrapper.in \
 		$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper
+	$(SED) "s%@TARGET_OBJDUMP@%$(TARGET_OBJDUMP)%" \
+		$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper
 
 	$(INSTALL) -D -m 755 $(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-scanner-qemuwrapper.in \
 		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
