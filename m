Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D872C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 20:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4528E40BA1;
	Sat, 25 Feb 2023 20:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4528E40BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GkgIpzfaEG52; Sat, 25 Feb 2023 20:54:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 568A140BDF;
	Sat, 25 Feb 2023 20:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 568A140BDF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E77E21BF3EE
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C875880C0B
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 20:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C875880C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZVXI5exYE5U for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 274C280BF7
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 274C280BF7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 162E886AE2; Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 21:46:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21a3097e7e227e8a26075f4f036324706e20d54f
X-Git-Newrev: 11ba2c5b8d23e086d589e025b7a31cdd7bae14a5
X-Patchwork-Hint: ignore
Message-Id: <20230225205333.162E886AE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsigrokdecode: fix build with
 python > 3.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11ba2c5b8d23e086d589e025b7a31cdd7bae14a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with sigrok-cli and python > 3.10:

/home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/mips64-buildroot-linux-gnu/11.3.0/../../../../mips64-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/bin/../mips64-buildroot-linux-gnu/sysroot/usr/lib/libsigrokdecode.so: undefined reference to `PyTuple_SetItem'

Fixes:
 - http://autobuild.buildroot.org/results/435ad19597a1e216a7974bc9ccaf17064d1eccea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ure-ac-Use-python3-embed-pc-as-a-fallback.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.patch b/package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.patch
new file mode 100644
index 0000000000..8e9c6f0063
--- /dev/null
+++ b/package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.patch
@@ -0,0 +1,30 @@
+From a6a5e2c8b0e9ecf5d69d0c237c8e8b717b82b36f Mon Sep 17 00:00:00 2001
+From: Evangelos Foutras <evangelos@foutrelis.com>
+Date: Thu, 3 Dec 2020 19:17:00 +0200
+Subject: [PATCH] configure.ac: Use python3-embed.pc as a fallback
+
+This provides some future-proofing against newer Python versions.
+
+[Retrieved from:
+https://sigrok.org/gitweb/?p=libsigrokdecode.git;a=commit;h=a6a5e2c8b0e9ecf5d69d0c237c8e8b717b82b36f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b8841f8..c1314bb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -100,7 +100,7 @@ SR_PKG_CHECK_SUMMARY([srd_pkglibs_summary])
+ # first, since usually only that variant will add "-lpython3.8".
+ # https://docs.python.org/3/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
+ SR_PKG_CHECK([python3], [SRD_PKGLIBS],
+-	[python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
++	[python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python3-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
+ AS_IF([test "x$sr_have_python3" = xno],
+ 	[AC_MSG_ERROR([Cannot find Python 3 development headers.])])
+ 
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
