Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D37FC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CDDD71139;
	Mon, 19 May 2025 11:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Th7e6tKM7qD; Mon, 19 May 2025 11:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E34B47113D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E34B47113D;
	Mon, 19 May 2025 11:04:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96469D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9254540DF5
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPCz2cel1LaL for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FE9241E63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FE9241E63
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E36282A2E; Mon, 19 May 2025 10:40:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 16:34:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6debbd693b920ffa618b8d30ac5eb6edbff814f2
X-Git-Newrev: 67e10ac8988b2b7217f424dc56f5128fb627a37d
X-Patchwork-Hint: ignore
Message-Id: <20250519104008.1E36282A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rpm: backport fix for
 GCC 14.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=67e10ac8988b2b7217f424dc56f5128fb627a37d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

GCC 14.x brought some more strict checks on pointer types, causing a
build issue in the rpm package when python support is enabled. These
issues have been fixed upstream, initially because Clang >= 16 also
added similar stricter checks.

The build issue goes like this:

header-py.c:744:9: error: initialization of 'Py_hash_t (*)(PyObject *)' {aka 'int (*)(struct _object *)'} from incompatible pointer type 'long int (*)(PyObject *)' {aka 'long int (*)(struct _object *)'} [-Wincompatible-pointer-types]
  744 |         hdr_hash,                       /* tp_hash */
      |         ^~~~~~~~
header-py.c:744:9: note: (near initialization for 'hdr_Type.tp_hash')
make[3]: *** [Makefile:664: header-py.lo] Error 1
make[3]: *** Waiting for unfinished jobs....

It never happened in the autobuilders, but it can be reproduced with
the following configuration:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_LUA=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_RPM=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...thon-3.2-compatible-object-hash-slot-type.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/rpm/0002-Use-Python-3.2-compatible-object-hash-slot-type.patch b/package/rpm/0002-Use-Python-3.2-compatible-object-hash-slot-type.patch
new file mode 100644
index 0000000000..cf9865ea3f
--- /dev/null
+++ b/package/rpm/0002-Use-Python-3.2-compatible-object-hash-slot-type.patch
@@ -0,0 +1,58 @@
+From a0a937a454b2f82eae7ed3b4436614e64ef63e2d Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Mon, 13 Mar 2023 12:41:11 +0200
+Subject: [PATCH] Use Python >= 3.2 compatible object hash slot type
+
+Python 3.2 changed the object hash type to make them pointer-width on
+all platforms - an incompatible change but apparently 3.2 was early enough
+in the 3.x days for such changes: https://bugs.python.org/issue9778
+
+The hash vs pointer size mismatch has quietly been there all along but
+clang >= 16 started treating this as an error, causing failed builds.
+The fix is easy and obvious enough, but this requires us to bump the
+minimum Python version from 3.1 to 3.2. Which thankfully is old enough that
+we can do without having to care or introduce build-time compatibility
+workarounds.
+
+Suggested-by: Khem Raj <raj.khem@gmail.com>
+Upstream: 45103f84764b2a293b068eb0f59456f553ec45d8
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ INSTALL            | 4 ++--
+ python/header-py.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/INSTALL b/INSTALL
+index 13d0d8a83..528c1e5c0 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -66,8 +66,8 @@ These are available from
+     http://www.bzip.org
+     http://tukaani.org/xz/
+ 
+-If you want to build the Python bindings to RPM library, it can be enabled
+-with --enable-python option to configure. You'll need to have Python >= 3.1
++Python bindings to RPM library are built by default, but it can be disabled
++with -DENABLE_PYTHON=OFF. You'll need to have Python >= 3.2
+ runtime and C API development environment installed.
+ Python is available from:
+     http://www.python.org/
+diff --git a/python/header-py.c b/python/header-py.c
+index 0aed0c926..c15503f35 100644
+--- a/python/header-py.c
++++ b/python/header-py.c
+@@ -316,9 +316,9 @@ static PyObject * hdr_dsOfHeader(PyObject * s)
+                                  "(Oi)", s, RPMTAG_NEVR);
+ }
+ 
+-static long hdr_hash(PyObject * h)
++static Py_hash_t hdr_hash(PyObject * h)
+ {
+-    return (long) h;
++    return (Py_hash_t) h;
+ }
+ 
+ static PyObject * hdr_reduce(hdrObject *s)
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
