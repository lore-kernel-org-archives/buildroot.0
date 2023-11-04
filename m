Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA805C4167B
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4172660D4D;
	Sat,  4 Nov 2023 21:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4172660D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41szGrsojEwL; Sat,  4 Nov 2023 21:15:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AB4F60BAF;
	Sat,  4 Nov 2023 21:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AB4F60BAF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 137491BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE54882115
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE54882115
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hf7b3YSYQ9mD for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:15:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2F2A82109
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2F2A82109
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 946D885FD5; Sat,  4 Nov 2023 21:15:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 22:13:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 666d29c821abefc65789f8ba2d69cc9a08a39751
X-Git-Newrev: 489562aca728a70ec74e9860ae94627cdb2eb163
X-Patchwork-Hint: ignore
Message-Id: <20231104211523.946D885FD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libftdi1: add patch to move from
 distutils to sysconfig
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=489562aca728a70ec74e9860ae94627cdb2eb163
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preperation of python 3.12.0, distutils has been removed completely.
Take an upstream commit that switches to sysconfig instead of distutils
to find the python module path.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Arnout:
 - apply to libftdi1, not libftdi;
 - use the actual upstream commit instead of something homegrown;
 - use a URL to the upstream commit instead of just the hash.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0004-move-from-distutils-to-sysconfig.patch    | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/libftdi1/0004-move-from-distutils-to-sysconfig.patch b/package/libftdi1/0004-move-from-distutils-to-sysconfig.patch
new file mode 100644
index 0000000000..7b38993ada
--- /dev/null
+++ b/package/libftdi1/0004-move-from-distutils-to-sysconfig.patch
@@ -0,0 +1,33 @@
+From abd19b721f7e9b4d514ed319ece173ebc7b1ea72 Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Dan=20Hor=C3=A1k?= <dan@danny.cz>
+Date: Mon, 19 Dec 2022 17:40:43 +0100
+Subject: [PATCH] python: move from distutils to sysconfig
+
+The distutils module was deprecated in Python 3.10, and will be removed
+in 3.12 [1], thus switch to the sysconfig module instead.
+
+[1] https://peps.python.org/pep-0632/
+
+Upstream: http://developer.intra2net.com/git/?p=libftdi;a=commit;h=abd19b721f7e9b4d514ed319ece173ebc7b1ea72
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
+---
+ python/CMakeLists.txt |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
+index 5e406ff..9358419 100644
+--- a/python/CMakeLists.txt
++++ b/python/CMakeLists.txt
+@@ -42,7 +42,7 @@ endif ()
+ 
+ set_target_properties ( ${SWIG_MODULE_ftdi1_REAL_NAME} PROPERTIES NO_SONAME ON )
+ 
+-execute_process ( COMMAND ${PYTHON_EXECUTABLE} -c "from distutils import sysconfig; print( sysconfig.get_python_lib( plat_specific=True, prefix='${CMAKE_INSTALL_PREFIX}' ) )"
++execute_process ( COMMAND ${PYTHON_EXECUTABLE} -c "import sysconfig; print( sysconfig.get_path( 'platlib', vars={'platbase': '${CMAKE_INSTALL_PREFIX}'} ) )"
+                   OUTPUT_VARIABLE _ABS_PYTHON_MODULE_PATH
+                   OUTPUT_STRIP_TRAILING_WHITESPACE )
+ 
+-- 
+1.7.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
