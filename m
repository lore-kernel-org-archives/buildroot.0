Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4D6C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 13:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71C5540A8D;
	Tue,  5 Apr 2022 13:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n7Myf9R0yH6D; Tue,  5 Apr 2022 13:29:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99F8040A82;
	Tue,  5 Apr 2022 13:29:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFD031BF3AD
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 13:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBE598247F
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 13:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LR3FG-sGpsf0 for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 13:29:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8AE18193E
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 13:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KyTz9LTKS9TH3TPDR+ZUkl+gaf1OIglOK5w4opD1YCU=; b=c94F1U/GlDDcTTaZltQ03IWbwa
 y7MDTTHH8DwdhiCps8bXlTDF1tA3aIrnqpxcJqIpRtCIZqppwDp2h0IETxk+y2mWPs/JvOdk278e2
 /24LidiIoIMVbUfJaa2xFLh+o5pnJ57gCO7i1Oa9kLEB5zzM7KXZ9VzlXLho+F3MVlj7m91TeytTc
 8Scym+NpDz+1cD4au6fTkq/3Fvng3vCX6I0izfx5uzLQGDvczZU9vlCUg8yn66zwDSsgP0P8PlBtr
 zr9yTuEfIZj3H7V7gjLDf32tu+Fst+9bYDdHBJJKoxtdWg5F+SQRzGNlt2R4+PGdnse4HlJ7b685Q
 9kmVKFeQ==;
Received: from 91-153-34-241.elisa-laajakaista.fi ([91.153.34.241] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nbjFh-000BmB-Na; Tue, 05 Apr 2022 15:29:45 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 5bf3a6c6;
 Tue, 5 Apr 2022 13:29:29 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 16:29:29 +0300
Message-Id: <20220405132929.823106-2-aperez@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405132929.823106-1-aperez@igalia.com>
References: <20220405132929.823106-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/webkitgtk: use the WPE renderer if
 available
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If enabled at build time, WebKit's internal nested compositor can work
more efficiently when targeting Wayland, by avoiding one unneeded buffer
copy. The build option has been available for a few years in WebKitGTK
releases.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 8d8f083ea2..eca175d1bd 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -28,8 +28,7 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_OPENJPEG=ON \
 	-DUSE_SOUP2=ON \
-	-DUSE_WOFF2=ON \
-	-DUSE_WPE_RENDERER=OFF
+	-DUSE_WOFF2=ON
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_SANDBOX),y)
 WEBKITGTK_CONF_OPTS += \
@@ -101,6 +100,13 @@ WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND)$(BR2_PACKAGE_WPEBACKEND_FDO),yy)
+WEBKITGTK_CONF_OPTS += -DUSE_WPE_RENDERER=ON
+WEBKITGTK_DEPENDENCIES += wpebackend-fdo
+else
+WEBKITGTK_CONF_OPTS += -DUSE_WPE_RENDERER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WEBKITGTK_USE_GSTREAMER_GL),y)
 WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
