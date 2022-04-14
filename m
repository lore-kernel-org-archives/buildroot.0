Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1E8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC76383F8A;
	Thu, 14 Apr 2022 19:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HSBd9bVZsk8z; Thu, 14 Apr 2022 19:46:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 033BF83F7B;
	Thu, 14 Apr 2022 19:46:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2891BF290
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE7D460ACE
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-33_xzldCPw for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:45:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3265A60DF6
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:45:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DD7F683C8D; Thu, 14 Apr 2022 19:36:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 21:45:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3c9d992cf73acafca96c6186428be3593457dde
X-Git-Newrev: 41d22ae1abf3df441273bed9611e473a8326b190
X-Patchwork-Hint: ignore
Message-Id: <20220414193600.DD7F683C8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flac: Configure powerpc vector
 extensions
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

commit: https://git.buildroot.net/buildroot/commit/?id=41d22ae1abf3df441273bed9611e473a8326b190
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the hard coded disabling of altivec and vsx, and instead use the
BR2_POWERPC_CPU_HAS_VSX and BR2_POWERPC_CPU_HAS_ALTIVEC variables to
control the flags.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[Arnout: rewrite with $(if ...) and --enable]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/flac/flac.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 3a18d81591..27fc63e2c2 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -17,11 +17,11 @@ FLAC_CPE_ID_VENDOR = flac_project
 FLAC_AUTORECONF = YES
 
 FLAC_CONF_OPTS = \
+	$(if $(BR2_POWERPC_CPU_HAS_ALTIVEC),--enable-altivec,--disable-altivec) \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
+	$(if $(BR2_POWERPC_CPU_HAS_VSX),--enable-vsx,--disable-vsx) \
 	--disable-xmms-plugin \
-	--disable-altivec \
-	--disable-stack-smash-protection \
-	--disable-vsx
+	--disable-stack-smash-protection
 
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
 FLAC_CONF_OPTS += --with-ogg=$(STAGING_DIR)/usr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
