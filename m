Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7042AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 23:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAA8F41EB6;
	Thu, 17 Feb 2022 23:09:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id znwXkkveY1Nl; Thu, 17 Feb 2022 23:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0A5540A01;
	Thu, 17 Feb 2022 23:09:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFFA21C113E
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 23:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC96A400AB
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 23:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lodjAk7vlmXp for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 23:09:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 312B840A01
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 23:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pc7rChLyY/kjpXPZSbMIIBj7KWr8gQdW5SOdXwe590o=; b=g+0qvRV4COLy4rJB8tQ5Whvbla
 cjyXjZ1rztT7yKIhmEiKP5p8rq3WD2kFpBRsqvnkeSVZIKnwv4gbjKKqEsjt2GO/wph4zCdIVt8+9
 If0syFNe3VlrVMo1kLdKHlkQ/a3bvfrA0CNlPQMyrByyq1MIWlh8MkKgiztcpER325DVdp14DGnfo
 ux02ew6v6A3FOcWdtTT0acVlLZkgQJ39GfFRDrjmHTwYkOu/dVUDpw6mKwO6SaVRgjsCtd9Xkf9d8
 L8juYADolqCU1es/TMQWVc/abiLpXouuvz+zHQsuG4tuXr4f3IbTa8oNA3qtGJJxivhSdKanze+gt
 Z1oajp3g==;
Received: from 91-153-34-133.elisa-laajakaista.fi ([91.153.34.133] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nKpts-0003Ia-DE; Fri, 18 Feb 2022 00:09:24 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 9500517f;
 Thu, 17 Feb 2022 23:09:08 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 01:09:08 +0200
Message-Id: <20220217230908.1532564-2-aperez@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217230908.1532564-1-aperez@igalia.com>
References: <20220217230908.1532564-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/webkitgtk: use lcms2 if available
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

Make webkitgtk enable color management support if the lcms2 package has
been selected.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index f4fc1e7838..b3dc2b2fa5 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -24,7 +24,6 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_MINIBROWSER=ON \
 	-DENABLE_SPELLCHECK=ON \
 	-DPORT=GTK \
-	-DUSE_LCMS=OFF \
 	-DUSE_LIBNOTIFY=OFF \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_OPENJPEG=ON \
@@ -58,6 +57,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+WEBKITGTK_CONF_OPTS += -DUSE_LCMS=ON
+WEBKITGTK_DEPENDENCIES += lcms2
+else
+WEBKITGTK_CONF_OPTS += -DUSE_LCMS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_INTROSPECTION=ON
 WEBKITGTK_DEPENDENCIES += gobject-introspection
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
