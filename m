Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7B7C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 22:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AED3B401D8;
	Sat, 28 Oct 2023 22:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AED3B401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id owZaq1mFGM4H; Sat, 28 Oct 2023 22:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C09B041A42;
	Sat, 28 Oct 2023 22:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C09B041A42
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCC051BF869
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 22:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 892F081A0D
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 22:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 892F081A0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t8whlZ-G5h_S for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 22:35:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A974A819CC
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 22:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A974A819CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C8E586093; Sat, 28 Oct 2023 22:35:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 00:30:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 836a11aaa68593e80466c26fea49384b622dc2eb
X-Git-Newrev: 3c6f3af24db4b79d652874dd6c381ce3d6c5266b
X-Patchwork-Hint: ignore
Message-Id: <20231028223510.7C8E586093@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycryptodomex: fix package
 build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c6f3af24db4b79d652874dd6c381ce3d6c5266b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-pycryptodomex uses C99 features like variable
declaration in for-loop statement, while old compilers
assumes C89 by default.

This patch explicitly specifies C99 standard.

Signed-off-by: Oleg Lyovin <ovlevin@salutedevices.com>
[yann.morin.1998@free.fr: use TARGET/HOST_CFLAGS]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pycryptodomex/python-pycryptodomex.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 3790aa4787..d6eb2a9513 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -13,5 +13,8 @@ PYTHON_PYCRYPTODOMEX_LICENSE = \
 	Public Domain (pycrypto original code)
 PYTHON_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
 
+PYTHON_PYCRYPTODOMEX_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
+HOST_PYTHON_PYCRYPTODOMEX_ENV = CFLAGS="$(HOST_CFLAGS) -std=c99"
+
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
