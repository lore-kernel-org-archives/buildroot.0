Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B59C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:50:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39F0B60F55
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39F0B60F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A0D560764;
	Sat,  4 Sep 2021 21:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EK504TbSSMVR; Sat,  4 Sep 2021 21:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 584D9606D0;
	Sat,  4 Sep 2021 21:50:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D42D1BF3ED
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0D0140421
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIrXC6u_RT8j for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 21:49:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A9EC40402
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 21:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B69628851F; Sat,  4 Sep 2021 21:48:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 23:35:23 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 06e0f6cc678d85a681328b4b0d5862db756fb6a3
X-Git-Newrev: 4144fea23389917c56386dbc7a4c1051b51f2ede
X-Patchwork-Hint: ignore
Message-Id: <20210904214824.B69628851F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/fontconfig: break
 circular dependency
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4144fea23389917c56386dbc7a4c1051b51f2ede
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Build fails because of the following circular dependency:

fontconfig -> util-linux -> udev -> systemd -> polkit ->
gobject-introspection -> cairo -> fontconfig

which results in the following build failure:

checking for UUID... no
checking where uuid functions comes from... configure: error:
*** uuid is required. install util-linux.

To break it, apply the same ugly workaround that was applied for
libglib2 and cryptsetup until a better solution is found:
https://patchwork.ozlabs.org/project/buildroot/patch/20201101150619.1709959-1-fontaine.fabrice@gmail.com/

Fixes:
 - http://autobuild.buildroot.org/results/2c6ef073e7e98e13daa409e1ea6130e9abd32c87

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit eb058222596d83bbdc96c80c5d0cdecb572a4ac3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fontconfig/fontconfig.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 33218ed639..d59e893d4d 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -10,7 +10,8 @@ FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
 # 0002-add-pthread-as-a-dependency-of-a-static-lib.patch
 FONTCONFIG_AUTORECONF = YES
 FONTCONFIG_INSTALL_STAGING = YES
-FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf util-linux
+FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux)
 HOST_FONTCONFIG_DEPENDENCIES = \
 	host-freetype host-expat host-pkgconf host-gperf host-util-linux
 FONTCONFIG_LICENSE = fontconfig license
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
