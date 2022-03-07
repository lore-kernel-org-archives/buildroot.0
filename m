Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039C6C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0B3D60EFD;
	Mon,  7 Mar 2022 22:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zCAOahQUQmCB; Mon,  7 Mar 2022 22:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA31260EE3;
	Mon,  7 Mar 2022 22:11:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F36AC1BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C53EE60D87
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEGZNeqpHBJK for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:09:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C71E460BDD
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F000182941; Mon,  7 Mar 2022 22:01:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:57:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fc9d586a3acd091653da3a62f471041d329d6bd
X-Git-Newrev: 0e9565f831da2377622c79bfd6e5be37f7baaa7c
X-Patchwork-Hint: ignore
Message-Id: <20220307220126.F000182941@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycli: drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e9565f831da2377622c79bfd6e5be37f7baaa7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even with the two upstream patches added in commit
b2e6e376a2d7551ccf146855ec4e99a65c35bd16, python-pycli still raises the
following build failure since bump of python3 to version 3.10.1 in
commit 25b1fc2898d68ddf2674b14c738045875fc5a2dc due to the new "Multiple
Exception types without parentheses" exception
(https://docs.python.org/3/whatsnew/3.10.html):

error:   File "/usr/lib/python3.10/site-packages/cli/test.py", line 142
    except raises, e:
           ^^^^^^^^^
SyntaxError: multiple exception types must be parenthesized

So drop the package as the last release was made 10 years ago.

Fixes:
 - http://autobuild.buildroot.org/results/6112e1830ce608abcea4a26b659c10e5ff09a66a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                   |  7 ++++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 ...-re-raise-exceptions-in-wrapped-functions.patch | 26 --------------
 ...-except-statement-changed-slightly-in-2-6.patch | 41 ----------------------
 package/python-pycli/Config.in                     |  7 ----
 package/python-pycli/python-pycli.hash             |  5 ---
 package/python-pycli/python-pycli.mk               | 14 --------
 8 files changed, 7 insertions(+), 95 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b90b9dbcbc..3b066bbf72 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -158,6 +158,13 @@ config BR2_PACKAGE_WESTON_FBDEV
 	help
 	  fbdev compositor was deprecated in weston 10.0.0.
 
+config BR2_PACKAGE_PYTHON_PYCLI
+	bool "python-pycli removed"
+	select BR2_LEGACY
+	help
+	  Package was removed because it is not compatible with python
+	  3.10 and is not maintained anymore (no release since 2012).
+
 config BR2_PACKAGE_LINUX_TOOLS_BPFTOOL
 	bool "bpftool was moved"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index b7a7c8771c..b5183711b5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1061,7 +1061,6 @@ N:	Geoff Levand <geoff@infradead.org>
 F:	package/flannel/
 
 N:	Geoffrey Ragot <geoffreyragot@gmail.com>
-F:	package/python-pycli/
 F:	package/python-pyyaml/
 
 N:	Gerome Burlats <gerome.burlats@smile.fr>
diff --git a/package/Config.in b/package/Config.in
index 8d2d550a64..517e66cce7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1144,7 +1144,6 @@ menu "External python modules"
 	source "package/python-pybind/Config.in"
 	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
-	source "package/python-pycli/Config.in"
 	source "package/python-pycparser/Config.in"
 	source "package/python-pycryptodomex/Config.in"
 	source "package/python-pycups/Config.in"
diff --git a/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch b/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch
deleted file mode 100644
index 7ac9d7af9f..0000000000
--- a/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 57c563f8b47a56feefc0a8bcbef05f4b54280549 Mon Sep 17 00:00:00 2001
-From: mmbutter <mario.butter@gmail.com>
-Date: Tue, 9 Jun 2020 11:50:41 -0500
-Subject: [PATCH] Fix problem with re-raise exceptions in wrapped functions.
-
-[Retrieved from:
-https://github.com/whilp/cli/commit/57c563f8b47a56feefc0a8bcbef05f4b54280549]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/cli/app.py | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/lib/cli/app.py b/lib/cli/app.py
-index 7b6db52..f487ab4 100644
---- a/lib/cli/app.py
-+++ b/lib/cli/app.py
-@@ -240,6 +240,9 @@ def run(self):
-         try:
-             returned = self.main(*args)
-         except Exception, e:
-+        	elif isinstance(e, self.reraise):
-+        	    # raising the last exception preserves traceback
-+        	    raise
-             returned = e
- 
-         return self.post_run(returned)
diff --git a/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch b/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch
deleted file mode 100644
index 75869d6d23..0000000000
--- a/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2af95cff5609142ec14efdf13b394f9b0121ab2e Mon Sep 17 00:00:00 2001
-From: mmbutter <mario.butter@gmail.com>
-Date: Thu, 11 Jun 2020 15:50:03 -0500
-Subject: [PATCH] except statement changed slightly in 2.6. This could cause
- problems in newer versions. Updated to the new format.
-
-[Retrieved from:
-https://github.com/whilp/cli/commit/2af95cff5609142ec14efdf13b394f9b0121ab2e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/cli/app.py | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/lib/cli/app.py b/lib/cli/app.py
-index f487ab4..45256b8 100644
---- a/lib/cli/app.py
-+++ b/lib/cli/app.py
-@@ -239,10 +239,10 @@ def run(self):
-             args = ()
-         try:
-             returned = self.main(*args)
--        except Exception, e:
--        	elif isinstance(e, self.reraise):
--        	    # raising the last exception preserves traceback
--        	    raise
-+        except self.reraise:
-+            # raising the last exception preserves traceback
-+            raise
-+        except Exception as e:
-             returned = e
- 
-         return self.post_run(returned)
-@@ -420,7 +420,7 @@ def pre_run(self):
-         """
-         try:
-             ns = self.argparser.parse_args()
--        except SystemExit, e:
-+        except SystemExit as e:
-             if self.exit_after_main:
-                 raise
-             else:
diff --git a/package/python-pycli/Config.in b/package/python-pycli/Config.in
deleted file mode 100644
index e1ce3b99a6..0000000000
--- a/package/python-pycli/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYCLI
-	bool "python-pycli"
-	help
-	  The cli package is a framework for making simple, correct
-	  command line applications in Python.
-
-	  https://pythonhosted.org/pyCLI/
diff --git a/package/python-pycli/python-pycli.hash b/package/python-pycli/python-pycli.hash
deleted file mode 100644
index f0890e83a9..0000000000
--- a/package/python-pycli/python-pycli.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5 from https://pypi.python.org/pypi/pycli/json
-md5 89c487e7c8068ce05d63394d2ae7ebad pyCLI-2.0.3.tar.gz
-# Locally computed
-sha256  bc53e6c5db031ae1c05d131641f153d22a201c5e82cc8c9324a945752efbb622  pyCLI-2.0.3.tar.gz
-sha256  591490b2ef462a4ad2be1aae5dd47738cb17e191c82d3ba38c3ae906d288e6ba  lib/cli/__init__.py
diff --git a/package/python-pycli/python-pycli.mk b/package/python-pycli/python-pycli.mk
deleted file mode 100644
index 7aff1c6200..0000000000
--- a/package/python-pycli/python-pycli.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-pycli
-#
-################################################################################
-
-PYTHON_PYCLI_VERSION = 2.0.3
-PYTHON_PYCLI_SOURCE = pyCLI-$(PYTHON_PYCLI_VERSION).tar.gz
-PYTHON_PYCLI_SITE = https://pypi.python.org/packages/95/fc/b2d86a5fbdac4072bcf70b01674b612e1a13026f54962c878fe3eca36fd1
-PYTHON_PYCLI_LICENSE = ISC-like
-PYTHON_PYCLI_LICENSE_FILES = lib/cli/__init__.py
-PYTHON_PYCLI_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
