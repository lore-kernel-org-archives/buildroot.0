Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A33C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 22:15:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99C6160720
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 22:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99C6160720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 620E9607BB;
	Tue, 17 Aug 2021 22:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04mD1LiktxK0; Tue, 17 Aug 2021 22:15:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F538607C2;
	Tue, 17 Aug 2021 22:15:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74B4C1BF362
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 22:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63B72401E9
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 22:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pI0RRY7lT1WD for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 22:15:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 100E940202
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 22:15:41 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q10so333539wro.2
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 15:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oyDjAVEg1EDNHCstjyidyURO8htPBBma/7nMsI406Rw=;
 b=lB5oZUT6gb2pCZ0hBcb4Hhi8itmcVTWeZOYvAr5oy+BIIgTK4jD162E4MRouzlLGIs
 f46eCyat/RBnXlL8tdnfS4IzBB82jGej9mw/i7xLb0Xh8oUQphBTH+gysPoAhziujf9C
 Zc0pauPM7cvcU+K6T9VIIvshVdaSNVTPhVDaAstecWEPv1Wiih96wvBHPc3GdITPCX+l
 hyHE4ruEhZTuSwtXdYMQknIwisCzyxJ8MHSXe8cMpyokGnNEm4qR2n3Prhp7wBqm29Fu
 +XZaBtVNQf9Wgq3NcTspVYagUxvsoOydngWcN7qtmiSNUWB7SZCFJN1GZpzuE5p+1PKf
 6Z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oyDjAVEg1EDNHCstjyidyURO8htPBBma/7nMsI406Rw=;
 b=f1T85Jou/YdYPCYNIOZEn7vY1IlA4bUDWZ7+6cgY9CVUn0JdcnbAPwkXa9c37/nB86
 cNFftwsQKHKr0kw5bB2KbAF9MhRYfYwaQ1VWFciEWwYCoA49DdFIrEcgwcUd/vjAoP5e
 pn/sma465ka7IRbh7wXFT/zHZy4toE5Tl7/W0hZC+OZLhhRnMtkj0wy1L/+Kbaezt0pj
 OQcmya2LTr+a4pF6geA7TdNK7nn38DYjKFG20JG+J86FSJQgdbqF9jcYsXAtRzchs2W1
 7DfrfqseOOhNFZa9AD2nyPujudJ61Jav4mbIRSHQsc2Bpwr0FHSZg8PL5zn/qxaU+WGj
 3TEA==
X-Gm-Message-State: AOAM532/vP7CAvoyQhyXVhw8JsIfogfXaZfRm/8VF8fA9soi2kZXXVWT
 G9ILs7mpFhi0RDtMgzv//XJ2bl3P00BeHg==
X-Google-Smtp-Source: ABdhPJybIdmXJID2NukzJYyAyy8LJ7euOAO8Udj5l9dI8il/W5fLRrhYMBEBXHb4FM0ASIzbPA1rRQ==
X-Received: by 2002:adf:b1cd:: with SMTP id r13mr6586598wra.78.1629238539846; 
 Tue, 17 Aug 2021 15:15:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id w9sm3192280wmc.19.2021.08.17.15.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 15:15:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Aug 2021 00:15:30 +0200
Message-Id: <20210817221530.2343233-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Revert "package/libshout: enable optional
 dependency for libressl"
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This reverts commit 46b8fb7500ecca65a79507318fd3052208559c09 indeed if
libressl is selected as the openssl provider, the BR2_PACKAGE_OPENSSL
conditition will always be used and the BR2_PACKAGE_LIBRESSL condition
will never be triggered. Moreover, libressl provides a pkg-config file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libshout/libshout.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 57d26390c5..4afb762de6 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -33,9 +33,6 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBSHOUT_CONF_OPTS += --with-openssl
 LIBSHOUT_DEPENDENCIES += openssl
-else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
-LIBSHOUT_CONF_OPTS += --with-openssl=$(STAGING_DIR)/lib
-LIBSHOUT_DEPENDENCIES += libressl
 else
 LIBSHOUT_CONF_OPTS += --without-openssl
 endif
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
