Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F58C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 20:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF57B4079A;
	Sun,  3 Mar 2024 20:14:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qE4JGBCu3AO1; Sun,  3 Mar 2024 20:14:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11721407A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11721407A9;
	Sun,  3 Mar 2024 20:14:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7897A1BF340
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 20:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72BBB6069C
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 20:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gxo6aFCUJ1sy for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 20:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7708460680
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7708460680
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 20:14:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 607E187FF5; Sun,  3 Mar 2024 20:14:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 21:11:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed2090717f657c1f19bb7bd62c97e17a7bf3ff50
X-Git-Newrev: 8895cae09b7f364fdd8eb55ad487a9bad55e2faf
X-Patchwork-Hint: ignore
Message-Id: <20240303201414.607E187FF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tar: fix NLS build
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

commit: https://git.buildroot.net/buildroot/commit/?id=8895cae09b7f364fdd8eb55ad487a9bad55e2faf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 1.35 in
commit d4d483451f0a305781b94b96c15a6cf4b489cd84:

/home/thomas/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/12.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: buffer.o: in function `bufmap_reset':
buffer.c:(.text+0xe8): undefined reference to `libintl_gettext'

Fixes:
 - http://autobuild.buildroot.org/results/99b05d4b495b6337c6a48ea5a551a3a84c6d2e6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/tar/tar.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index dc17647b2c..d57d63970d 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -13,6 +13,8 @@ TAR_CONF_OPTS = --exec-prefix=/
 TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 TAR_CPE_ID_VENDOR = gnu
+TAR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+TAR_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 # 0002-Fix-boundary-checking-in-base-256-decoder.patch
 TAR_IGNORE_CVES += CVE-2022-48303
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
