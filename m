Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A15ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 10:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D11860BFE;
	Sat, 27 Aug 2022 10:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D11860BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hyYXQvvOkJoU; Sat, 27 Aug 2022 10:04:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B44E160BF9;
	Sat, 27 Aug 2022 10:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B44E160BF9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40A001BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 10:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27DF240E47
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 10:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27DF240E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gE5FQXSzSjmF for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 10:03:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2492D40AB9
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 10:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2492D40AB9
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BC83687DDB; Sat, 27 Aug 2022 09:48:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 12:01:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 922fb6ac852af6ba7cb13c93ed361c8adaa668fb
X-Git-Newrev: 014ebc394d116e886796dd9af377299915cb556d
X-Patchwork-Hint: ignore
Message-Id: <20220827094855.BC83687DDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igh-ethercat: fix build without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=014ebc394d116e886796dd9af377299915cb556d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tools needs C++ since the addition of the package in commit
27ad470d7df5509ae4a96edd04521211900090e4 resulting in the following
build failure:

no -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I../include -I../master -Wall -DREV=`if test -s ../revision; then cat ../revision; else hg id -i .. 2>/dev/null || echo "unknown"; fi` -fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0  -c -o ethercat-Command.o `test -f 'Command.cpp' || echo './'`Command.cpp
/bin/bash: line 1: no: command not found

Fixes:
 - http://autobuild.buildroot.org/results/89d096006839f32a3d03786e69e51ec3c5ea70f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: move it before package's options]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/igh-ethercat/igh-ethercat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index b9771e8f8c..cc3f37f883 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -15,6 +15,7 @@ IGH_ETHERCAT_INSTALL_STAGING = YES
 IGH_ETHERCAT_CONF_OPTS = \
 	--with-linux-dir=$(LINUX_DIR)
 
+IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_INSTALL_LIBSTDCPP),--enable-tool,--disable-tool)
 IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too)
 IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E100),--enable-e100,--disable-e100)
 IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,--disable-e1000)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
