Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1094BC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4F4C4F297;
	Tue, 21 Feb 2023 00:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4F4C4F297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uEPGbjtOZoVX; Tue, 21 Feb 2023 00:21:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 980074F2B0;
	Tue, 21 Feb 2023 00:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 980074F2B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5440F1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06157417C6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06157417C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFAxqzP7e5RF for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 394CD417C2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 394CD417C2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34CAC8648F; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 09:31:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: de03312db0190adc5b7dfa5b7658b2275801c933
X-Git-Newrev: 2c41fb6225632ecea0b7008969bb70cf8e2636ef
X-Patchwork-Hint: ignore
Message-Id: <20230220205251.34CAC8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/tests: allow top-level
 parallel builds
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2c41fb6225632ecea0b7008969bb70cf8e2636ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Running tests with top-level parallel builds can speed up running some
tests, expecially those that have a lot of packages like the systemd
init tests.

Trigger TLPB when the configuration enables per-package directories.

We're using the jlevel argument, which normally is used for BR2_JLEVEL
as the value for calling make -j<N> at the top-level. In fact,
BR2_JLEVEL is "unused" when using TLPB, because the top-level make
acts as the job server that distributes tokens to sub-makes (except
for the few build systems like waf or scons that don't support this),
so it's really the top-level make -j<N> that determines the level of
parallelism, and BR2_JLEVEL doesn't really have an effect.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Thomas: extend explanation a bit]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/basetest.py | 2 +-
 support/testing/infra/builder.py  | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 45bcd4c2e2..670c7213d6 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -52,7 +52,7 @@ class BRConfigTest(unittest.TestCase):
 
     def setUp(self):
         self.show_msg("Starting")
-        self.b = Builder(self.config, self.builddir, self.logtofile)
+        self.b = Builder(self.config, self.builddir, self.logtofile, self.jlevel)
 
         if not self.keepbuilds:
             self.b.delete()
diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index 922a707220..a2abb9ed89 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -6,11 +6,12 @@ import infra
 
 
 class Builder(object):
-    def __init__(self, config, builddir, logtofile):
+    def __init__(self, config, builddir, logtofile, jlevel=None):
         self.config = '\n'.join([line.lstrip() for line in
                                  config.splitlines()]) + '\n'
         self.builddir = builddir
         self.logfile = infra.open_log_file(builddir, "build", logtofile)
+        self.jlevel = jlevel
 
     def is_defconfig_valid(self, configfile, defconfig):
         """Check if the .config is contains all lines present in the defconfig."""
@@ -87,6 +88,8 @@ class Builder(object):
         env.update(make_extra_env)
 
         cmd = ["make", "-C", self.builddir]
+        if "BR2_PER_PACKAGE_DIRECTORIES=y" in self.config.splitlines() and self.jlevel:
+            cmd.append(f"-j{self.jlevel}")
         cmd += make_extra_opts
 
         ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
