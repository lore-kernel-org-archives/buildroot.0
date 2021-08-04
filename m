Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C00CC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:39:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B20F60FC3
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B20F60FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F6EA60661;
	Wed,  4 Aug 2021 14:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dDQzNJQYmLC2; Wed,  4 Aug 2021 14:39:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6700960620;
	Wed,  4 Aug 2021 14:39:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 380E41BF5E9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 332B4401D8
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1DwBHmrk6DaG for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:39:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82AD340231
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:39:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1AA418B562; Wed,  4 Aug 2021 14:39:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 16:30:19 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: ba1da14621308898abee47fb269ae568abd56777
X-Git-Newrev: ce1eb3f9070d0ed0a6b58fa10eef239e5cedf099
X-Patchwork-Hint: ignore
Message-Id: <20210804143911.1AA418B562@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/granite: link
 with -lintl if needed
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ce1eb3f9070d0ed0a6b58fa10eef239e5cedf099
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Link with TARGET_NLS_LIBS if needed to avoid the following build
failure:

/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: lib/libgranite.so.5.4.0.p/meson-generated_Application.c.o: in function `_vala_array_free.constprop.0':
Application.c:(.text+0x340): undefined reference to `libintl_bindtextdomain'

Fixes:
 - http://autobuild.buildroot.org/results/d754cb776a1e11031cef4e66d45619aad5c4575d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 82a5ffca28250bb7e474a85fad3904539539bdc8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/granite/granite.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/granite/granite.mk b/package/granite/granite.mk
index d5dd1fa1ff..037113f715 100644
--- a/package/granite/granite.mk
+++ b/package/granite/granite.mk
@@ -6,10 +6,17 @@
 
 GRANITE_VERSION = 5.4.0
 GRANITE_SITE = $(call github,elementary,granite,$(GRANITE_VERSION))
-GRANITE_DEPENDENCIES = host-pkgconf host-vala libgee libglib2 libgtk3
+GRANITE_DEPENDENCIES = \
+	host-pkgconf \
+	host-vala \
+	libgee \
+	libglib2 \
+	libgtk3 \
+	$(TARGET_NLS_DEPENDENCIES)
 GRANITE_INSTALL_STAGING = YES
 GRANITE_LICENSE = LGPL-3.0+
 GRANITE_LICENSE_FILES = COPYING
+GRANITE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GRANITE_CONF_OPTS += -Dintrospection=true
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
