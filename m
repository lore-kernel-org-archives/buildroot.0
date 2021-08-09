Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F63C4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 22:42:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB64E60FDA
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 22:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB64E60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 666FF606AA;
	Mon,  9 Aug 2021 22:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ucrlcvwrUwZL; Mon,  9 Aug 2021 22:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 217A860810;
	Mon,  9 Aug 2021 22:42:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 725551BF3CC
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 22:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BCEC40495
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 22:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gi_Xa-ihMSHG for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 22:42:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1372540494
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 22:42:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m36-20020a05600c3b24b02902e67543e17aso710025wms.0
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 15:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=evCwWbaqUL7RJ/rFjvKsGQuAs1YVCYlAnn7xgeLTHxA=;
 b=DXbcv7xgY5pxxo6HqD/JMzK2+UtTTIyhIZgHzWMfx7Kb/MuHWyY49kfX85KCoj+dZV
 aPlaRn0WNqMgOjXJ78V4HcnBCizGZ6Fn1Zh27QhKxKISx/W8IcA2Cda5FccLeTuCz7gk
 gmBwuUbAuZoS4ZJhr7WAW2hE/WruvgUA0JKxsGnwg7qPqbseg8eQX29p5vBJtK2u3KXb
 6JQ5VIVtxqQ0Xbls+73SCbiOxVwzmWaeKO9m0JbV0zyjBaxErhNHaEd08yltHPf/q72k
 Jaw1QuYMA/WrrAqXmaPj4y+Tk1XLlUtPLnWDdcLZbIfeBAcKQxZm0luYgCkGGHiNSaoE
 Hc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=evCwWbaqUL7RJ/rFjvKsGQuAs1YVCYlAnn7xgeLTHxA=;
 b=GGc0UzNoiN9+ifVeWU0D1Ho0LKVRFk37HDz3Rgx4HgU8WkFimSWzkhqFB9emyozxS4
 ezcJmDlhmmQVaiP2N6esk62bBfGiz5xJ392Tu3gmufFpUkGYd2m+h9CHr6m0sv1sJRB7
 24y2qGDV0r/PGT0kK5VFPGBQkyLaxO/nX+dBgvniXHnFXUU/O4+rBiC9pGAHCMAZKHTD
 cCN0eSkH4vccPzNGeNfcwaz+kh/CQraVaPU1inakn1Kz6AXbQUS4rG8YJ85H1VqH6jcm
 DCqybef90zv9FbdA4N57TFQ1+OrLhunFzta1BxPTEwqB7iB1nLvJxE3RFcHRL6kiJZxt
 ECVw==
X-Gm-Message-State: AOAM533VAcOw7HDJguKeyBZypGFfvDLAaHxxy9ojut/4/9btvXIL+kHG
 bAiTGzLNuc4273T9xps/9TuPJAxBhPHxcQ==
X-Google-Smtp-Source: ABdhPJz2u2RhAIvpWerB1Qee+qJrjzqKYiukpKRV+X3HK1tTf+2lDNILbnCoQAoojmLM8Q0RhOJ7hQ==
X-Received: by 2002:a05:600c:2281:: with SMTP id 1mr5166523wmf.9.1628548950096; 
 Mon, 09 Aug 2021 15:42:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id y66sm19284385wmy.39.2021.08.09.15.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 15:42:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 00:42:14 +0200
Message-Id: <20210809224214.2966469-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix gidatadir
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
Cc: Anisse Astier <anisse@astier.eu>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Since commit 521d387640d704f24caee51841388d98bcac739b gidatadir is
wrongly set to ${libdir}/../share, set it back to
${datadir}/gobject-introspection-1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gobject-introspection/gobject-introspection.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index f56d0c5eff..81938b14df 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -121,7 +121,7 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 	# causes the host /usr/share being used instead of $(STAGING_DIR)/usr/share.
 	# Change datadir to $(libdir)/../share which will prefix $(STAGING_DIR)
 	# to the correct location.
-	$(SED) "s%datadir=.*%datadir=\$${libdir}/../share%g" \
+	$(SED) "s%^datadir=.*%datadir=\$${libdir}/../share%g" \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
 
 	# By default, girdir and typelibdir use datadir and libdir as their prefix,
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
