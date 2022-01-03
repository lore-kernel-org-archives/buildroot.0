Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D0EC433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 09:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C75EA81886;
	Mon,  3 Jan 2022 09:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0xHdPQ-zNA6; Mon,  3 Jan 2022 09:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D8A681839;
	Mon,  3 Jan 2022 09:20:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 945241BF360
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 09:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80793400F5
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 09:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUFCyOtFUTHQ for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 09:20:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3FA1400BA
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 09:20:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2CAFC82AD8; Mon,  3 Jan 2022 09:14:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jan 2022 10:20:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76c1664ddd62711183b4698c74749d62462c809a
X-Git-Newrev: 779501290f7205de2dcb7a7eadff9e456b0e2d3e
X-Patchwork-Hint: ignore
Message-Id: <20220103091418.2CAFC82AD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsigrokdecode: fix build with
 python 3.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=779501290f7205de2dcb7a7eadff9e456b0e2d3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with sigrok-cli raised since bump of
python3 to version 3.10.1 in commit
25b1fc2898d68ddf2674b14c738045875fc5a2dc:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/10.3.1/../../../../aarch64-none-linux-gnu/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libsigrokdecode.so: undefined reference to `PyTuple_SetItem'

Fixes:
 - http://autobuild.buildroot.org/results/e2f33366803b18aff29086007610fa0a264f90d6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0002-configure-Add-python-3-10-support.patch   | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch b/package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch
new file mode 100644
index 0000000000..53acb65944
--- /dev/null
+++ b/package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch
@@ -0,0 +1,28 @@
+From c4c10b89396fe21a622b8c38dd5815a496b007bf Mon Sep 17 00:00:00 2001
+From: Soeren Apel <soeren@apelpie.net>
+Date: Mon, 20 Dec 2021 19:36:39 +0100
+Subject: [PATCH] configure: Add python 3.10 support
+
+[Retrieved from:
+https://sigrok.org/gitweb/?p=libsigrokdecode.git;a=commitdiff;h=c4c10b89396fe21a622b8c38dd5815a496b007bf
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2917cb3..b8841f8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -100,7 +100,7 @@ SR_PKG_CHECK_SUMMARY([srd_pkglibs_summary])
+ # first, since usually only that variant will add "-lpython3.8".
+ # https://docs.python.org/3/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
+ SR_PKG_CHECK([python3], [SRD_PKGLIBS],
+-	[python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
++	[python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
+ AS_IF([test "x$sr_have_python3" = xno],
+ 	[AC_MSG_ERROR([Cannot find Python 3 development headers.])])
+ 
+-- 
+2.24.0.rc2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
