Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71B2C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C0F64098F;
	Tue,  4 Jan 2022 18:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETF8VAdzD8uL; Tue,  4 Jan 2022 18:12:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0E4D408BA;
	Tue,  4 Jan 2022 18:12:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 803D51BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73A8581C6F
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MXtcYggr7rpR for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:09:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E989E823E8
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5E7EF82BA6; Tue,  4 Jan 2022 18:02:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 18:49:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48f790099399e3f74e4487148de437881fee990c
X-Git-Newrev: f384de4f4ec646c28dab6c442dd6bb2f06628725
X-Patchwork-Hint: ignore
Message-Id: <20220104180257.5E7EF82BA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiio: set PYTHON_EXECUTABLE
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

commit: https://git.buildroot.net/buildroot/commit/?id=f384de4f4ec646c28dab6c442dd6bb2f06628725
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
