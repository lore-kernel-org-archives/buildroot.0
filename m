Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22259C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 16:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFDA24096E;
	Tue,  4 Jan 2022 16:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Du1vlN09zkrt; Tue,  4 Jan 2022 16:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AE7B404C3;
	Tue,  4 Jan 2022 16:51:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 588221BF5EA
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47A42409CC
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HLegIHiytIny for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 16:51:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7487340986
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 16:51:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E897B82AB8; Tue,  4 Jan 2022 16:45:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 17:43:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40a09b263486b95f000547860da451b32ad19174
X-Git-Newrev: ee16da9654f83682accea5873732303f355e0c0b
X-Patchwork-Hint: ignore
Message-Id: <20220104164505.E897B82AB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fail2ban: fix build with python
 3.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee16da9654f83682accea5873732303f355e0c0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of python3 to version
3.10.1 in commit 25b1fc2898d68ddf2674b14c738045875fc5a2dc:

error in fail2ban setup command: use_2to3 is invalid.

Fixes:
 - http://autobuild.buildroot.org/results/6a5e91f9912f869b2b07b10b576457b432066393

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ails-with-error-in-fail2ban-setup-command.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch b/package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch
new file mode 100644
index 0000000000..8cb097dc38
--- /dev/null
+++ b/package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch
@@ -0,0 +1,67 @@
+From 5ac303df8a171f748330d4c645ccbf1c2c7f3497 Mon Sep 17 00:00:00 2001
+From: sebres <info@sebres.de>
+Date: Sun, 19 Sep 2021 18:49:18 +0200
+Subject: [PATCH] fix gh-3098: build fails with error in fail2ban setup
+ command: use_2to3 is invalid (setuptools 58+)
+
+[Retrieved from:
+https://github.com/fail2ban/fail2ban/commit/5ac303df8a171f748330d4c645ccbf1c2c7f3497]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ setup.py | 16 +---------------
+ 1 file changed, 1 insertion(+), 15 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index f4c2550f6..98413273c 100755
+--- a/setup.py
++++ b/setup.py
+@@ -48,7 +48,7 @@
+ from glob import glob
+ 
+ from fail2ban.setup import updatePyExec
+-
++from fail2ban.version import version
+ 
+ source_dir = os.path.realpath(os.path.dirname(
+ 	# __file__ seems to be overwritten sometimes on some python versions (e.g. bug of 2.6 by running under cProfile, etc.):
+@@ -112,22 +112,12 @@ def update_scripts(self, dry_run=False):
+ # Wrapper to specify fail2ban own options:
+ class install_command_f2b(install):
+ 	user_options = install.user_options + [
+-		('disable-2to3', None, 'Specify to deactivate 2to3, e.g. if the install runs from fail2ban test-cases.'),
+ 		('without-tests', None, 'without tests files installation'),
+ 	]
+ 	def initialize_options(self):
+-		self.disable_2to3 = None
+ 		self.without_tests = not with_tests
+ 		install.initialize_options(self)
+ 	def finalize_options(self):
+-		global _2to3
+-		## in the test cases 2to3 should be already done (fail2ban-2to3):
+-		if self.disable_2to3:
+-			_2to3 = False
+-		if _2to3:
+-			cmdclass = self.distribution.cmdclass
+-			cmdclass['build_py'] = build_py_2to3
+-			cmdclass['build_scripts'] = build_scripts_2to3
+ 		if self.without_tests:
+ 			self.distribution.scripts.remove('bin/fail2ban-testcases')
+ 
+@@ -178,7 +168,6 @@ def run(self):
+ if setuptools:
+ 	setup_extra = {
+ 		'test_suite': "fail2ban.tests.utils.gatherTests",
+-		'use_2to3': True,
+ 	}
+ else:
+ 	setup_extra = {}
+@@ -202,9 +191,6 @@ def run(self):
+ 		('/usr/share/doc/fail2ban', doc_files)
+ 	)
+ 
+-# Get version number, avoiding importing fail2ban.
+-# This is due to tests not functioning for python3 as 2to3 takes place later
+-exec(open(join("fail2ban", "version.py")).read())
+ 
+ setup(
+ 	name = "fail2ban",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
