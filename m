Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D725C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 12:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF4B5817BA;
	Tue, 28 Dec 2021 12:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhxkbNML_ST7; Tue, 28 Dec 2021 12:55:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6788281766;
	Tue, 28 Dec 2021 12:55:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 877631BF59C
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 12:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75D8181766
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 12:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpDtdJoJnQxg for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 12:55:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB29181764
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 12:55:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6D7F782203; Tue, 28 Dec 2021 12:50:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 13:55:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c618da772df32679fdd338b99f44133655c9113f
X-Git-Newrev: c6610c3f590381ac773fb95b6312fde560e341ce
X-Patchwork-Hint: ignore
Message-Id: <20211228125005.6D7F782203@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zchunk: needs argp
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6610c3f590381ac773fb95b6312fde560e341ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit c618da772df32679fdd338b99f44133655c9113f:

../output-1/build/zchunk-1.1.16/meson.build:35:4: ERROR: C shared or static library 'argp' not found

Fixes:
 - http://autobuild.buildroot.org/results/f82d06e95ac497aa8215268a7a58e929a05b32e3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zchunk/Config.in | 1 +
 package/zchunk/zchunk.mk | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/zchunk/Config.in b/package/zchunk/Config.in
index d610e15997..2c8db434ce 100644
--- a/package/zchunk/Config.in
+++ b/package/zchunk/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ZCHUNK
 	bool "zchunk"
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LIBCURL
 	help
 	  A file format designed for highly efficient deltas while
diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
index d8538542f1..6f7ac799a0 100644
--- a/package/zchunk/zchunk.mk
+++ b/package/zchunk/zchunk.mk
@@ -9,7 +9,9 @@ ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
 ZCHUNK_LICENSE = BSD-2-Clause
 ZCHUNK_LICENSE_FILES = LICENSE
 ZCHUNK_INSTALL_STAGING = YES
-ZCHUNK_DEPENDENCIES = libcurl
+ZCHUNK_DEPENDENCIES = \
+	libcurl \
+	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ZCHUNK_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
