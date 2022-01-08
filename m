Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFD8C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 23:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36540403A8;
	Sat,  8 Jan 2022 23:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awOULb3r2VCV; Sat,  8 Jan 2022 23:08:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8147540362;
	Sat,  8 Jan 2022 23:08:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD7A11BF27E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB56940362
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zS9NB9St_hTC for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 23:08:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0ABCA40360
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 23:08:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BF7858136C; Sat,  8 Jan 2022 23:02:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 00:08:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65ed981ce0135379b7faeb69519f4e3e666c0717
X-Git-Newrev: 4f5ce3ad2c833d2025b2202a4fdcbb06629f1ece
X-Patchwork-Hint: ignore
Message-Id: <20220108230234.BF7858136C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-packaging: fix host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f5ce3ad2c833d2025b2202a4fdcbb06629f1ece
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host variant of python-packaging was added in commit
4cc445fd5fbb83c2b55f679f3d92223f34f214cb, but has two missing things:

- It's a python3 only package, so it should have
  HOST_PYTHON_PACKAGING_NEEDS_HOST_PYTHON = python3

- It depends on the pyparsing module, so it should have a dependency
  on it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-packaging/python-packaging.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 1fd6f26d64..e2fb9b120b 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -10,6 +10,8 @@ PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/df/86/aef78bab3a
 PYTHON_PACKAGING_SETUP_TYPE = setuptools
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
+HOST_PYTHON_PACKAGING_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_PACKAGING_DEPENDENCIES = host-python-pyparsing
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
