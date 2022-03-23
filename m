Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4986DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F71584ABD;
	Wed, 23 Mar 2022 20:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHn6NvIT49Ks; Wed, 23 Mar 2022 20:28:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 124BD84AB6;
	Wed, 23 Mar 2022 20:28:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 041861BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6F7B40FBC
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b0Nu5D5iX6cC for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:27:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B81840CBE
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:27:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 62D8B854E7; Wed, 23 Mar 2022 20:18:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 21:09:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5086d75cc8613a9730150662ca83dfa4592dfef0
X-Git-Newrev: 0c494b5f22da88bae860221f23b494e221a47e44
X-Patchwork-Hint: ignore
Message-Id: <20220323201808.62D8B854E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/ola: drop autoreconf"
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c494b5f22da88bae860221f23b494e221a47e44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 66d348ae18c6e73d6ff9d935a241e55a65948be6 because
for an unknown reason, the build fails if autoreconf is dropped:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: warning: libolauartdmx.so.0, needed by olad/.libs/libolaserver.so, not found (try using -rpath or -rpath-link)
/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: warning: libolaserverplugininterface.so.0, needed by olad/.libs/libolaserver.so, not found (try using -rpath or -rpath-link)

Fixes:
 - http://autobuild.buildroot.org/results/f8164c69da0b9fa38081e8b785d8234f0f297ae1
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ola/ola.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 1874350784..5090076175 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -9,6 +9,7 @@ OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VE
 OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
 OLA_LICENSE_FILES = COPYING GPL LGPL LICENCE
 OLA_INSTALL_STAGING = YES
+OLA_AUTORECONF = YES
 
 # util-linux provides uuid lib
 OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex host-ola
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
