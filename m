Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55956C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 23:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E562F83EB2;
	Thu, 24 Feb 2022 23:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3NYsxkCn8kl; Thu, 24 Feb 2022 23:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15D2183EAF;
	Thu, 24 Feb 2022 23:16:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F16B1BF29C
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 23:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BA9E40C14
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 23:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qrr3pnTZHVqH for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 23:16:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC09840131
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 23:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G2Q2SqrfsEr+t92KwwX1BW3U9v/YTSaDm90uzmA8bac=; b=mG5ieaCnpuzzMdKXyrmqiqO6/k
 paqBkZazfTYTMS8G7xPsTrOHKqSWvAfhh7Rmrem2BuYgNFhYReKnUXgOAOvlhBmIE+cRo+SrhUQ3w
 /HtJQY2jeP81PDrSHNDmFCuf3wJEA6gSw+qKI9BkWBmx2cSMX4BgOumTexBYw6S/+WBYEKL8Vbn8F
 0mimQcuS7+OzNGOv8hoPIpwtSQ9G8ElYOKgyUl9nqwyiJ2J9hn0cVYKEBv7A4qq6obQRZutEAvja6
 IBQMp5ZsD4LEqsAhYRWYgXQ2s7w5ov/U8vl0914awPjN6oxkqegyrdD5tXod18/f8II9UtqWwkRIN
 DVJ9O+XA==;
Received: from 91-153-34-133.elisa-laajakaista.fi ([91.153.34.133] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nNNLT-000C9E-NH; Fri, 25 Feb 2022 00:16:23 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 81ab9578;
 Thu, 24 Feb 2022 23:16:09 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 01:16:09 +0200
Message-Id: <20220224231609.1097793-2-aperez@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224231609.1097793-1-aperez@igalia.com>
References: <20220224231609.1097793-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 2/2] package/bubblewrap: switch to the
 meson build system
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 0.6.0 introduced a Meson build system, and upstream seems to
have the intention to abandon the previous autotools based one. Switch
to Meson for future proofing.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/bubblewrap/bubblewrap.mk | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 4d6593576e..6b00dfe7f9 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -14,22 +14,24 @@ BUBBLEWRAP_LICENSE_FILES = COPYING
 BUBBLEWRAP_CPE_ID_VENDOR = projectatomic
 
 BUBBLEWRAP_CONF_OPTS = \
-	--enable-require-userns=no \
-	--disable-man \
-	--disable-sudo \
-	--with-priv-mode=none
+	-Dzsh_completion=disabled \
+	-Dman=disabled \
+	-Dpython=$(HOST_DIR)/bin/python \
+	-Drequire_userns=false
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
-BUBBLEWRAP_CONF_OPTS += --with-bash-completion-dir=/usr/share/bash-completion/completions
+BUBBLEWRAP_CONF_OPTS += \
+	-Dbash_completion=enabled \
+	-Dbash_completion_dir=/usr/share/bash-completion/completions
 else
-BUBBLEWRAP_CONF_OPTS += --without-bash-completion-dir
+BUBBLEWRAP_CONF_OPTS += -Dbash_completion=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-BUBBLEWRAP_CONF_OPTS += --enable-selinux
+BUBBLEWRAP_CONF_OPTS += -Dselinux=enabled
 BUBBLEWRAP_DEPENDENCIES += libselinux
 else
-BUBBLEWRAP_CONF_OPTS += --disable-selinux
+BUBBLEWRAP_CONF_OPTS += -Dselinux=disabled
 endif
 
 # We need to mark bwrap as setuid, in case the kernel
@@ -38,4 +40,4 @@ define BUBBLEWRAP_PERMISSIONS
 	/usr/bin/bwrap f 1755 0 0 - - - - -
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
