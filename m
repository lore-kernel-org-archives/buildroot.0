Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829B5C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 20:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E70BD4043A;
	Sun, 26 Nov 2023 20:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E70BD4043A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ibwUbU6qnNtx; Sun, 26 Nov 2023 20:56:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D4140425;
	Sun, 26 Nov 2023 20:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25D4140425
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5697C1BF867
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 20:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CAE2400CE
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 20:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CAE2400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YaAWc9J40H1o for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 20:56:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02444400C1
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 20:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02444400C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0F05873D0; Sun, 26 Nov 2023 20:56:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 21:55:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44243b4c80c3c6fd4364fa1582f6a8e8c8b928da
X-Git-Newrev: 1185c0256bb43bd451e73249d53915db42409476
X-Patchwork-Hint: ignore
Message-Id: <20231126205630.E0F05873D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-msgpack: fix build without
 cpp toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=1185c0256bb43bd451e73249d53915db42409476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prior to being updated to version 1.0.7 in
014a66fcde68bd0b612b62ec722ccc93bdc0d7f9 python-msgpack would
automatically fall back to the pure python version if the cpp based
optimized extension would fail to build for any reason.

This however is no longer the case after updating to 1.0.7 where it
is now required that we explicitely set the MSGPACK_PUREPYTHON=1 if
we do not have cpp support enabled in the toolchain.

Fixes:
 - http://autobuild.buildroot.net/results/361/36185a19bed4bd57421a4d909bce1976c89d130f
 - http://autobuild.buildroot.net/results/477/477f822cb196ebc2246bcbdc1b6eaf940fc018cd

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: add the comment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-msgpack/python-msgpack.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 061ff5a761..3ee7c54ce1 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -11,4 +11,11 @@ PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
 
+# When set in the environment, whatever the value, MSGPACK_PUREPYTHON drives
+# using the pure python implementation rather than rely on the C++ native code.
+# So we can't force it to use C++; we can only force it to use pure python.
+ifeq ($(BR2_INSTALL_LIBSTDCPP),)
+PYTHON_MSGPACK_ENV = MSGPACK_PUREPYTHON=1
+endif
+
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
