Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BA8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 09:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAC294173E;
	Sun,  3 Apr 2022 09:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfsPu0ApoS3a; Sun,  3 Apr 2022 09:44:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 667B341702;
	Sun,  3 Apr 2022 09:44:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A89121BF599
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5E128266D
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YdADZY28Y_q2 for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 09:44:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3EDD8266A
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 09:44:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4C1E385F55; Sun,  3 Apr 2022 09:34:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 11:44:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5bea8c9521b3fbfdf40030635989064af55cc26c
X-Git-Newrev: 5140d10bf6b9f01e7e1ecb2b357885e03e9d5fb4
X-Patchwork-Hint: ignore
Message-Id: <20220403093454.4C1E385F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-{treq,
 twisted}: add a comment to use the same version
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

commit: https://git.buildroot.net/buildroot/commit/?id=5140d10bf6b9f01e7e1ecb2b357885e03e9d5fb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by [1], python-twisted and python-treq must use the same
version because its the same project:

https://github.com/twisted/twisted
https://github.com/twisted/treq

We have to update python-treq to version 22.2.0 [2] otherwise we have
a runtime issue:

Traceback (most recent call last):
  File "/root/sample_python_treq.py", line 2, in <module>
    import treq
  File "/usr/lib/python3.10/site-packages/treq/__init__.py", line 5, in <module>
  File "/usr/lib/python3.10/site-packages/treq/api.py", line 5, in <module>
  File "/usr/lib/python3.10/site-packages/treq/client.py", line 11, in <module>
ImportError: cannot import name '_PY3' from 'twisted.python.compat' (unknown
location)

The comment should avoid forgeting one of them while upgrading or
backporting version bump.

[1] http://lists.busybox.net/pipermail/buildroot/2022-February/637505.html
[2] https://github.com/twisted/treq/releases/tag/release-22.2.0
[3] https://gitlab.com/buildroot.org/buildroot/-/jobs/2179206653

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-treq/python-treq.mk       | 3 +++
 package/python-twisted/python-twisted.mk | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index 57dc50ee74..8995bf2cfe 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,6 +4,9 @@
 #
 ################################################################################
 
+# When bumping this package, make sure to also verify if the
+# python-twisted package still works and to update its hash,
+# as they share the same version/site variables.
 PYTHON_TREQ_VERSION = 22.2.0
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
 PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/cd/c8/b68ab17d994133baf6edbcb5551ba81e1494bdc6d5e21a9d4f3bc4315140
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index e5d643ec05..8a89d3dc82 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,6 +4,9 @@
 #
 ################################################################################
 
+# When bumping this package, make sure to also verify if the
+# python-treq package still works and to update its hash,
+# as they share the same version/site variables.
 PYTHON_TWISTED_VERSION = 22.2.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.gz
 PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/40/8b/56e8870d412c550b3ff2d6714ee212c7e80a6634f4e720c3a26a983e7b46
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
