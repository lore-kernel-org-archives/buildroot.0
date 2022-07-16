Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272F5C43334
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 14:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA75460EA1;
	Sat, 16 Jul 2022 14:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA75460EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJJPJKxaCj7U; Sat, 16 Jul 2022 14:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF73A60A9C;
	Sat, 16 Jul 2022 14:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF73A60A9C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82D091BF5DD
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 14:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6134040104
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 14:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6134040104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OnFHmar6ALaT for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 14:36:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38044400A8
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38044400A8
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 14:36:25 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q9so10474740wrd.8
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 07:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iRuyE4FWD7Ua6qCha/RWQ5BxrEi917diUow+2wvPjqM=;
 b=VGUEsX4ldmMjXd9NDI9LJXBdVW71nfSMTuYGZ/pLwjCzrzdh1Z0StjYVlS9l9f0si/
 O0caAwz640AIyexN+JwxtlXzRSzAUVYAScj04aXDZBhMntNQRoiUTRfxpr6FZHi6T591
 dnU1YATTN7G7AoTXFgC0f66vgLhuuajvWg3KDqcEvtAtdDJo3oRNRokyjNqkjPCLlmfC
 9ngcD/X7gXZfkNPasbASVOCzEPyFGcfgU+yU5N23o4aPkH5wnua5OfVmXCgHeToeAXTn
 /MKnVQ9NnoTY25AYy1Bf9vC3TZiklwWL0NWiDc/aMWmcOPZeJNw6klqjok9otaOd32zX
 ay8g==
X-Gm-Message-State: AJIora+YS+aYwEf9jzQr4mgkEJqxjA1Pb9plN3hYO5sm1+0KGpJxzglt
 UZcWEFrt8xegOw3RXdNSGYTKs+iw6S8=
X-Google-Smtp-Source: AGRyM1uu5d0BpVNl/2OEflK6rgAIkRYlLKAirMVSlWzV/A9RldSlptbzr+5p62UReQTV/Bg/3zG9cA==
X-Received: by 2002:adf:ed41:0:b0:210:20a5:26c2 with SMTP id
 u1-20020adfed41000000b0021020a526c2mr15990427wro.603.1657982183074; 
 Sat, 16 Jul 2022 07:36:23 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003a04722d745sm13592682wmq.23.2022.07.16.07.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 07:36:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 16:33:10 +0200
Message-Id: <20220716143311.711343-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iRuyE4FWD7Ua6qCha/RWQ5BxrEi917diUow+2wvPjqM=;
 b=ERpD1DqrK3IAHMRE+7Ej0TsL6rG5d3DBCMtU+DCdmHSuc+saW+fKF75XVA8do6fED4
 K3TLv43c4JvaWQg9Cyg84jdsySF/In6Jcnv4SHvvMbjShHCWvPs0KFFcmeibfj4nO42h
 THMcB9ACUUNtS/atHxNsxSBNk2/N9Z7YoDXmgopQOYLu/aZ/8LcoOvDx1d0VkjJl+AMi
 o1tTi5DNmFoRcVPpdRbKIdmnAb9W+1vfcUihLmgXycnr/XE6mt8868VAiJccYGSdj+sZ
 JvbeVoEOi1UGSA+5PHSZ7Bh1iiLQAK4MMRXT0agdUAv0nDK/qZablTRZg3k5+UuoWqo7
 W9lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ERpD1Dqr
Subject: [Buildroot] [PATCH 1/2] package/gnupg2: drop unrecognized option
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

--disable-regex has been dropped since version 2.2.22 and
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=ba247a114c75a84473c11c1484013b09fbb9bcd1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnupg2/gnupg2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 906b79e0ab..0a2cebfab3 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -16,7 +16,7 @@ GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
 
 GNUPG2_CONF_OPTS = \
-	--disable-rpath --disable-regex \
+	--disable-rpath \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
 	--with-libassuan-prefix=$(STAGING_DIR)/usr \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
