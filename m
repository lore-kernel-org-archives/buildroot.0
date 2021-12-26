Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4FBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 10:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E18A824EE;
	Sun, 26 Dec 2021 10:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HbWp4ij72K-9; Sun, 26 Dec 2021 10:49:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06DDA82435;
	Sun, 26 Dec 2021 10:49:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F9831BF476
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ED18825E6
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id on074N_0ylpL for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 10:49:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09A4C825E8
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:49:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 612A4822C6; Sun, 26 Dec 2021 10:43:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 11:49:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 790abe41827d6ca705fa3c39101728e5d98f57d4
X-Git-Newrev: c7c2ada7583eee504d6fb6e832381dae88fb38d4
X-Patchwork-Hint: ignore
Message-Id: <20211226104338.612A4822C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp-dlna: gstreamer backend
 needs dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7c2ada7583eee504d6fb6e832381dae88fb38d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gstreamer backend needs dynamic library to avoid the following build
failure raised since bump to version 0.12.0 in commit
68c8c37d7d15a11d91b699f15dbaa00adcd4773e:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
__uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'

Fixes:
 - http://autobuild.buildroot.org/results/3b580c8d9cb136455c710549909bb78c8b38b9c1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gupnp-dlna/gupnp-dlna.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index 4f75c9b527..64146f894b 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -22,7 +22,7 @@ else
 GUPNP_DLNA_CONF_OPTS += -Dintrospection=false -Dvapi=false
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE):$(BR2_STATIC_LIBS),y:)
 GUPNP_DLNA_CONF_OPTS += -Dgstreamer_backend=enabled
 GUPNP_DLNA_DEPENDENCIES += gstreamer1 gst1-plugins-base
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
