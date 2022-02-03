Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61F1C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 538DC81437;
	Thu,  3 Feb 2022 20:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYcO4OyYNKPK; Thu,  3 Feb 2022 20:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2A8581392;
	Thu,  3 Feb 2022 20:38:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88C701BF38D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 842DD404AA
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id soUd8ftI5Ix9 for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:38:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E852400F1
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:38:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2CCB882A25; Thu,  3 Feb 2022 20:31:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 3 Feb 2022 21:37:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5770a645a3a49a3f0f02972131a4ff5283b4c11e
X-Git-Newrev: 7c1bb5c2bfdc9d726c41a66b30b7aa8e759c6596
X-Patchwork-Hint: ignore
Message-Id: <20220203203125.2CCB882A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python: set
 _PYTHON_PROJECT_BASE
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c1bb5c2bfdc9d726c41a66b30b7aa8e759c6596
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variable is supposed to be set when cross compiling and is
now required by setuptools to be set correctly after the latest
version bump.

Not much reference for that variable, exept for:
    https://github.com/python/cpython/blob/v3.10.2/Lib/sysconfig.py#L157-L159

Fixes:
http://autobuild.buildroot.net/results/2e8/2e8093e68d04e8cbb20b095068b24c8bbe5f69ad
http://autobuild.buildroot.net/results/9e3/9e3cfddb651a59d7f2d04bc88e6fff2a06e9b465

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 22ea77352c..00bdb9150a 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -33,6 +33,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	PYTHONNOUSERSITE=1 \
+	_PYTHON_PROJECT_BASE="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_DIR),$(PYTHON_DIR))" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
@@ -60,6 +61,7 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
+	_PYTHON_PROJECT_BASE="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_DIR),$(PYTHON_DIR))" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
