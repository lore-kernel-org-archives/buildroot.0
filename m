Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA73C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFD9E4057D;
	Mon, 29 Nov 2021 22:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiizJsLe3mAr; Mon, 29 Nov 2021 22:46:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AF704046D;
	Mon, 29 Nov 2021 22:46:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C63F71BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B38E4401BD
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:46:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vU9eG15YeqW for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:46:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5024C400D4
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:46:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso18030449wml.1
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OjpYPIWrBfZSxMuKBShPZwaywydiQv9ov218X3UrGnc=;
 b=FNzTIU6+CoRg9sb6HIoCCyfKW+MgD7khc0sj7EWzRgKNdk88xVBbZsSaiWLTFNko++
 NF9Kjj+/VpMEnUxaROrIgjs9cz4gsnAIYRctNjSN9Wtv5aPhkYWZm9pmjhKiP66eB3WW
 P0zh7wTWAOqLOPINsjh8je60cJO9UA8fJ/q4kYalfoVDTmE9CVUVJvoZHwIB6+EUzoVZ
 ix4B+nU36trbc/S4h0X4mP+DR/99x9Z+HZjs4AumkP4+1+/hdGuh5YhzEWfqZexnOooR
 fSyL0AOsR78QwPWGggCZtQuX/ofOma8T759QfDJ3zRkYzkRirXv55ZktxVr1SevlSEXF
 AoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OjpYPIWrBfZSxMuKBShPZwaywydiQv9ov218X3UrGnc=;
 b=F5C9P2hM6+ozGBNS+cbDk1mIGhN+mCbUBnQ+F3izJKSUvaWI1RXshYkNFFKPLU7yTO
 Vfs0DBt+CT4vjOPCudnX2QMVv88/3uX4SN1essMChs3n8DpEquB1/f0OaiAV5uwULJ6F
 kf+Q3KvggpD0+Uiu8eIvcQaqwXmUwY1N60YY618oryiB7XPU5Fz0ksUow8pFOhksqj+d
 78UKjtl2nFqILEnbdiy23FgiKpH18/NOSyr7gY/fAm+BnX74S6YVx6NW179uKs8XCKe1
 zn3K3sh9wEGKUcd8wR72XSoUgunc+yvpKx5sDB+boC3fhkQKf67RvC/KG5YZzdq9WoJu
 p2WA==
X-Gm-Message-State: AOAM5306sr0dPrXDrPgJOwfnpZgEj3DYyMwK5xPGzMYGPtLTloaoGvlw
 JvQOw4oWwmCxG8QOh2lQ+c2VO0Qc04E=
X-Google-Smtp-Source: ABdhPJySzCro94uvoM/X+nulI4l3bdnuHRVtqyADZln/oahOvP5Rs0X9AFTmdWac708Gpd5pUN2u/g==
X-Received: by 2002:a05:600c:5125:: with SMTP id
 o37mr864724wms.81.1638225983280; 
 Mon, 29 Nov 2021 14:46:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h17sm14943813wrp.34.2021.11.29.14.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:46:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:43:47 +0100
Message-Id: <20211129224347.2187144-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/coremark-pro: drop spurious space
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
Cc: Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
b9a2e4e8612b96483a20e75f2077f024b3594f45

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/coremark-pro/coremark-pro.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/coremark-pro/coremark-pro.mk b/package/coremark-pro/coremark-pro.mk
index e797f66840..6a85088560 100644
--- a/package/coremark-pro/coremark-pro.mk
+++ b/package/coremark-pro/coremark-pro.mk
@@ -48,7 +48,7 @@ COREMARK_PRO_MARKS = cjpeg-rose7-preset core linear_alg-mid-100x100-sp loops-all
 COREMARK_PRO_SCRIPTS = results_parser.pl cert_median.pl cert_mark.pl headings.txt
 
 define COREMARK_PRO_INSTALL_TARGET_CMDS
-	mkdir -p  $(TARGET_DIR)/usr/share/coremark-pro/logs
+	mkdir -p $(TARGET_DIR)/usr/share/coremark-pro/logs
 	$(foreach m,$(COREMARK_PRO_MARKS),\
 		$(INSTALL) -D $(@D)/builds/linux$(if $(BR2_ARCH_IS_64),64)/gcc$(if $(BR2_ARCH_IS_64),64)/bin/$(m) $(TARGET_DIR)/usr/bin/$(m)$(sep) \
 		size $(TARGET_DIR)/usr/bin/$(m) > $(TARGET_DIR)/usr/share/coremark-pro/logs/$(m).size.log$(sep))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
