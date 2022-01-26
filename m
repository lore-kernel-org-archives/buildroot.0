Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D6AC2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF52460F96;
	Wed, 26 Jan 2022 20:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBR2pmUrPqQQ; Wed, 26 Jan 2022 20:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ED2F60EF5;
	Wed, 26 Jan 2022 20:10:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E9B91BF4D5
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AD1A417A9
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6w5vCWQ6bTtt for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8356D417A6
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:10:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3BD4781346; Wed, 26 Jan 2022 20:03:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:08:57 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 23b5ad969c17c2cfe3b3eee5f184e38e351ee392
X-Git-Newrev: 2686b22bc5254163519974fc85f85f609ac0a363
X-Patchwork-Hint: ignore
Message-Id: <20220126200310.3BD4781346@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libiio: set
 PYTHON_EXECUTABLE
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

commit: https://git.buildroot.net/buildroot/commit/?id=2686b22bc5254163519974fc85f85f609ac0a363
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Set PYTHON_EXECUTABLE to avoid the following build failure when
BR2_PACKAGE_PYTHON is enabled but libiio finds python3 without
setuptools on host:

-- Found Python: /usr/bin/python3.5 (found version "3.5.3") found components: Interpreter
-- new
-- Python_EXECUTABLE /usr/bin/python3.5

[...]

Traceback (most recent call last):
  File "/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.23/bindings/python/setup.py", line 15, in <module>
    from setuptools import setup
ImportError: No module named 'setuptools'

Fixes:
 - http://autobuild.buildroot.org/results/d80e56e4ad84c8e7f244cf6d1cb96c116e8eb734

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f384de4f4ec646c28dab6c442dd6bb2f06628725)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiio/libiio.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index f706298c22..38b2f83e6e 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -76,8 +76,10 @@ endif
 ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LIBIIO_DEPENDENCIES += host-python-setuptools python
+LIBIIO_CONF_OPTS += -DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python
 else ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIBIIO_DEPENDENCIES += host-python3-setuptools python3
+LIBIIO_CONF_OPTS += -DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
 endif
 LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
