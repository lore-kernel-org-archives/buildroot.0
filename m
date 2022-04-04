Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0B0C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3932540327;
	Mon,  4 Apr 2022 19:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQq1JEm2HDp1; Mon,  4 Apr 2022 19:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E5CE401DF;
	Mon,  4 Apr 2022 19:33:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AF291BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84FFE40939
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nciE16z_3F0F for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:32:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9350F4092A
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:32:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E55B5825AA; Mon,  4 Apr 2022 19:22:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:20:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efe832dbc3c8d0d2caa1e8ba0ccba8254292de6c
X-Git-Newrev: b91bf2dbe6dc57ca85598730617b4eaccbe7433b
X-Patchwork-Hint: ignore
Message-Id: <20220404192257.E55B5825AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-greenlet: disable cpp test
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

commit: https://git.buildroot.net/buildroot/commit/?id=b91bf2dbe6dc57ca85598730617b4eaccbe7433b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable cpp test to avoid the following build failure without C++ raised
since the addition of the package in commit
826ef33bedc0f2f39a38622f066978cd9cc05226 and
https://github.com/python-greenlet/greenlet/commit/d9cb12af26da2abbabe9f05101564866f25a74e2:

powerpc64-buildroot-linux-gnu-gcc.br_real: error: src/greenlet/tests/_test_extension_cpp.cpp: C++ compiler not installed on this system

Fixes:
 - http://autobuild.buildroot.org/results/1140463b8b2407c2a28b9a955efab6037ee7dbeb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-greenlet/python-greenlet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 3b1ef7e314..72d2747970 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -10,6 +10,7 @@ PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/0c/10/754e21b5bea
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
+PYTHON_GREENLET_ENV = GREENLET_TEST_CPP=no
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
