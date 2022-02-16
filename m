Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BE3C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 205684177F;
	Wed, 16 Feb 2022 21:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prlUsSDPFg89; Wed, 16 Feb 2022 21:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3878741785;
	Wed, 16 Feb 2022 21:06:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F8831BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BF0783DFD
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VAY8D6swXL4C for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:02:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB4C583DF9
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:02:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id EC426836B5; Wed, 16 Feb 2022 20:54:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:02:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d06737b27b4f01ecb69b69ef3dcc44ca4fd7eec6
X-Git-Newrev: b2e6e376a2d7551ccf146855ec4e99a65c35bd16
X-Patchwork-Hint: ignore
Message-Id: <20220216205442.EC426836B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycli: fix build with
 python >= 3.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2e6e376a2d7551ccf146855ec4e99a65c35bd16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of python3 to version
3.10.1 in commit 25b1fc2898d68ddf2674b14c738045875fc5a2dc due to the new
"Multiple Exception types without parentheses" exception
(https://docs.python.org/3/whatsnew/3.10.html)

error:   File "/usr/lib/python3.10/site-packages/cli/app.py", line 242
    except Exception, e:
           ^^^^^^^^^^^^
SyntaxError: multiple exception types must be parenthesized

Fixes:
 - http://autobuild.buildroot.org/results/8d7b0c23472abffc9447e4a6de273bdd04486d39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-re-raise-exceptions-in-wrapped-functions.patch | 26 ++++++++++++++
 ...-except-statement-changed-slightly-in-2-6.patch | 41 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch b/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch
new file mode 100644
index 0000000000..7ac9d7af9f
--- /dev/null
+++ b/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch
@@ -0,0 +1,26 @@
+From 57c563f8b47a56feefc0a8bcbef05f4b54280549 Mon Sep 17 00:00:00 2001
+From: mmbutter <mario.butter@gmail.com>
+Date: Tue, 9 Jun 2020 11:50:41 -0500
+Subject: [PATCH] Fix problem with re-raise exceptions in wrapped functions.
+
+[Retrieved from:
+https://github.com/whilp/cli/commit/57c563f8b47a56feefc0a8bcbef05f4b54280549]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/cli/app.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/cli/app.py b/lib/cli/app.py
+index 7b6db52..f487ab4 100644
+--- a/lib/cli/app.py
++++ b/lib/cli/app.py
+@@ -240,6 +240,9 @@ def run(self):
+         try:
+             returned = self.main(*args)
+         except Exception, e:
++        	elif isinstance(e, self.reraise):
++        	    # raising the last exception preserves traceback
++        	    raise
+             returned = e
+ 
+         return self.post_run(returned)
diff --git a/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch b/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch
new file mode 100644
index 0000000000..75869d6d23
--- /dev/null
+++ b/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch
@@ -0,0 +1,41 @@
+From 2af95cff5609142ec14efdf13b394f9b0121ab2e Mon Sep 17 00:00:00 2001
+From: mmbutter <mario.butter@gmail.com>
+Date: Thu, 11 Jun 2020 15:50:03 -0500
+Subject: [PATCH] except statement changed slightly in 2.6. This could cause
+ problems in newer versions. Updated to the new format.
+
+[Retrieved from:
+https://github.com/whilp/cli/commit/2af95cff5609142ec14efdf13b394f9b0121ab2e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/cli/app.py | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lib/cli/app.py b/lib/cli/app.py
+index f487ab4..45256b8 100644
+--- a/lib/cli/app.py
++++ b/lib/cli/app.py
+@@ -239,10 +239,10 @@ def run(self):
+             args = ()
+         try:
+             returned = self.main(*args)
+-        except Exception, e:
+-        	elif isinstance(e, self.reraise):
+-        	    # raising the last exception preserves traceback
+-        	    raise
++        except self.reraise:
++            # raising the last exception preserves traceback
++            raise
++        except Exception as e:
+             returned = e
+ 
+         return self.post_run(returned)
+@@ -420,7 +420,7 @@ def pre_run(self):
+         """
+         try:
+             ns = self.argparser.parse_args()
+-        except SystemExit, e:
++        except SystemExit as e:
+             if self.exit_after_main:
+                 raise
+             else:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
