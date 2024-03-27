Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBE5C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 079A382111;
	Wed, 27 Mar 2024 22:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SK_YdmN4SpSC; Wed, 27 Mar 2024 22:02:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B374820EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B374820EE;
	Wed, 27 Mar 2024 22:02:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0104A1BF982
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCFB64090B
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCISntEv_XLX for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8DB740913
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8DB740913
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:01:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D376F8438E; Wed, 27 Mar 2024 22:01:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 22:55:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05f315c83b63ac36211e3aaf9d30c4027fa73766
X-Git-Newrev: 72c08122c051044628bc6391458b8ba980b32153
X-Patchwork-Hint: ignore
Message-Id: <20240327220143.D376F8438E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiologstash: migrate to
 flit build backend
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=72c08122c051044628bc6391458b8ba980b32153
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to add a patch which selects the correct flit build
backend.

As flit is configured as the pep517 build backend for aiologstash
we need to migrate from setuptools to flit prior to migrating
setuptools to pep517 as the frontend will not fall back to using
setuptools once migrated.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...0001-Fix-flit_core-build-requires-backend.patch | 31 ++++++++++++++++++++++
 package/python-aiologstash/python-aiologstash.mk   |  2 +-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/package/python-aiologstash/0001-Fix-flit_core-build-requires-backend.patch b/package/python-aiologstash/0001-Fix-flit_core-build-requires-backend.patch
new file mode 100644
index 0000000000..99a150a344
--- /dev/null
+++ b/package/python-aiologstash/0001-Fix-flit_core-build-requires-backend.patch
@@ -0,0 +1,31 @@
+From 3c4d1203eb9ee3dbe79b096d587c9baaf8b802ed Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 11 Mar 2022 13:26:31 -0700
+Subject: [PATCH] Fix flit_core build requires/backend.
+
+Only flit_core should be required by pyproject.toml, the regular flit
+package is the pep517 frontend which is not what should be set for the
+build system.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/aio-libs/aiologstash/pull/258
+---
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 7bdaebb..252a660 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,6 +1,6 @@
+ [build-system]
+-requires = ["flit"]
+-build-backend = "flit.buildapi"
++requires = ["flit_core"]
++build-backend = "flit_core.buildapi"
+ 
+ [tool.flit.metadata]
+ module = "aiologstash"
+-- 
+2.34.1
+
diff --git a/package/python-aiologstash/python-aiologstash.mk b/package/python-aiologstash/python-aiologstash.mk
index de0ed820a0..bcf60a72e9 100644
--- a/package/python-aiologstash/python-aiologstash.mk
+++ b/package/python-aiologstash/python-aiologstash.mk
@@ -7,7 +7,7 @@
 PYTHON_AIOLOGSTASH_VERSION = 2.0.0
 PYTHON_AIOLOGSTASH_SOURCE = aiologstash-$(PYTHON_AIOLOGSTASH_VERSION).tar.gz
 PYTHON_AIOLOGSTASH_SITE = https://files.pythonhosted.org/packages/1c/dc/382861d5d25ccc976d02118922598fc4547f74f3287793e270ed614d8176
-PYTHON_AIOLOGSTASH_SETUP_TYPE = setuptools
+PYTHON_AIOLOGSTASH_SETUP_TYPE = flit
 PYTHON_AIOLOGSTASH_LICENSE = MIT
 PYTHON_AIOLOGSTASH_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
