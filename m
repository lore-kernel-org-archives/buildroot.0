Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CE2C4167B
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 15:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E08ED418B5;
	Sat, 25 Nov 2023 15:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E08ED418B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6M-hOEHUg4v6; Sat, 25 Nov 2023 15:40:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 341BD418A4;
	Sat, 25 Nov 2023 15:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 341BD418A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7F501BF423
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 15:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8070060B69
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 15:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8070060B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HYPX-aNU_UGq for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 15:40:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DD0260B68
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 15:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD0260B68
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A8468704D; Sat, 25 Nov 2023 15:40:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 16:40:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0ff5d3df052d9a1594db05360e301c7614ca68f2
X-Git-Newrev: ba27abf3566a86ecf2f89c7a4bb1d2c6a50eda89
X-Patchwork-Hint: ignore
Message-Id: <20231125154055.8A8468704D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-python.mk: remove
 _BASE_BUILD_OPTS variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba27abf3566a86ecf2f89c7a4bb1d2c6a50eda89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This variable can just as well be merged into _BASE_BUILD_CMD. This is
how it's done for the install opts. And anyway it's only used by
distutils and nowhere else.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 1fc096efb3..eacf75c165 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -198,8 +198,7 @@ endif
 ifeq ($$($(2)_SETUP_TYPE),distutils)
 ifeq ($(4),target)
 $(2)_BASE_ENV = $$(PKG_PYTHON_DISTUTILS_ENV)
-$(2)_BASE_BUILD_CMD = setup.py build
-$(2)_BASE_BUILD_OPTS = $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
+$(2)_BASE_BUILD_CMD = setup.py build $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
 $(2)_BASE_INSTALL_TARGET_CMD  = setup.py install --no-compile $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
 else
@@ -335,7 +334,7 @@ define $(2)_BUILD_CMDS
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
 		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_BUILD_CMD) \
-		$$($$(PKG)_BASE_BUILD_OPTS) $$($$(PKG)_BUILD_OPTS))
+		$$($$(PKG)_BUILD_OPTS))
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
