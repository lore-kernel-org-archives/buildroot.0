Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD5FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 22:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8E7C403A3;
	Mon, 22 Nov 2021 22:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZGhDyNTLPvLF; Mon, 22 Nov 2021 22:31:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0A204038D;
	Mon, 22 Nov 2021 22:31:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEE161BF951
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC32B80F7C
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:31:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8wPwVk6_VTyM for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 22:31:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19AA780D4C
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 22:31:05 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c4so35377127wrd.9
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 14:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQ8cdFXfHMb31t78EjuUAWoRDH3Nri5kESxzLANGdgA=;
 b=ferFIRIzIIsiOm5IM3hMyUY3LTQPYgl5eAAuw+5NBJDsT3hFAWaPF4GWcmJ24E3DHe
 L9H7dSVa2NRGgDXtt8YZh7RAVgyukTB2HOx0zP4/Esozl8JOUueUUcvsVS7px1NrHPmP
 1VlImBZk6VrMHpPVzEhcnDh5Z76eEYZTSBaqbM4RzpQOkvrr4ITbVGOW/Elg6qjA9ox6
 yRc9YYe5OBb062GwtzJMq5l5HNWheEPsc2MRr5xY2JmVTwaoouys1t4CjOqu1iwzADSe
 tVWYKCO6C+QLk8v3GDMp7mGFTMHe2i4AP0JPMQl3NKmWQ7cZAWKsB7csnwOC72/yOT/g
 K9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQ8cdFXfHMb31t78EjuUAWoRDH3Nri5kESxzLANGdgA=;
 b=CH9a9CkZojtPy6JmOyUsfcgN0VM49J3nJ4tH3FWVbP9w0m3sXYBta1OqmoL13BZwdY
 GQuh1EMw7qBEbsQPvW8FPar54RGZTh5K3+Lc6t0k2Gpm26/Ph0W7bmbjd2l6ms2gbc/J
 z49Gx9J9z7Xx9gJ0O2/H2BvsS/ERyviQkqxIG+wkppF4EQ+zLkYq90AFuzCrgOKnOhQz
 6oCw97IC1KpZzn1B+JyO5nKh45SjP/5Rp3JFskXY+AmslGaGaLo3k3SvBZgfVSEbKjL0
 RjAcVix4LX704NRHKjK3vbNiYVOTa5V5CpeawxZMoX4MQ7mW6VG8/BOsWXG3WID3NhpU
 dCOQ==
X-Gm-Message-State: AOAM5326/khTgJoOyDGPM68tpqpN9sVDEKa8GW1BesR4+UY1xS5T3Dha
 6w4C+ihTGUwcZ0iBXJriFVDoQpL0oYI=
X-Google-Smtp-Source: ABdhPJy/B50/iSaybjzdY4nVSK0+D029CprCh5KYdyEcOWiWiUS0jMAOJmramcsLlqi4l2V+FzPWZA==
X-Received: by 2002:a5d:69c5:: with SMTP id s5mr906338wrw.283.1637620263903;
 Mon, 22 Nov 2021 14:31:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id b10sm10282251wrt.36.2021.11.22.14.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 14:31:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 23:28:41 +0100
Message-Id: <20211122222841.3539866-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/automake: rename GTK_DOC_M4_INSTALL
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/automake/automake.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 5270e7864d..fd7933dd74 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -15,7 +15,7 @@ HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
 ACLOCAL_HOST_DIR = $(HOST_DIR)/share/aclocal
 
-define GTK_DOC_M4_INSTALL
+define HOST_AUTOMAKE_GTK_DOC_M4_INSTALL
 	$(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 \
 		$(ACLOCAL_HOST_DIR)/gtk-doc.m4
 endef
@@ -25,7 +25,7 @@ define HOST_AUTOMAKE_MAKE_ACLOCAL
 	mkdir -p $(ACLOCAL_DIR)
 endef
 
-HOST_AUTOMAKE_POST_INSTALL_HOOKS += GTK_DOC_M4_INSTALL
+HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_GTK_DOC_M4_INSTALL
 HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_MAKE_ACLOCAL
 
 $(eval $(host-autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
