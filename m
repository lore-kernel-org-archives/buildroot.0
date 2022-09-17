Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0295FC6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 18:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8931F401D2;
	Sat, 17 Sep 2022 18:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8931F401D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 428vfTHBVdgE; Sat, 17 Sep 2022 18:40:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 660394012C;
	Sat, 17 Sep 2022 18:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 660394012C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8341BF335
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 18:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7349A4012D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 18:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7349A4012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lPkTEGBM3xjX for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 18:40:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D97840119
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 18:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D97840119
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DAE7845F4; Sat, 17 Sep 2022 18:40:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 20:28:27 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 27a2aa5242cb4308fc0195dd870d0570676301c7
X-Git-Newrev: 9452ae0f9091874d8a16a514b6b17634b47517f2
X-Patchwork-Hint: ignore
Message-Id: <20220917184011.0DAE7845F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/igh-ethercat: fix
 build without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=9452ae0f9091874d8a16a514b6b17634b47517f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit 014ebc394d116e886796dd9af377299915cb556d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
