Return-Path: <SRS0=nfe+=NH=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E19C4338F
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 06:55:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80C6B61A7B
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 06:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80C6B61A7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F6D0606BD;
	Mon, 16 Aug 2021 06:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmH3hGhZRBSY; Mon, 16 Aug 2021 06:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF9226068C;
	Mon, 16 Aug 2021 06:55:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2804E1BF3C0
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 06:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 174F16068C
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 06:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z_RT2jFU3ZQ8 for <buildroot@lists.busybox.net>;
 Mon, 16 Aug 2021 06:55:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8588860672
 for <buildroot@buildroot.org>; Mon, 16 Aug 2021 06:55:13 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id f10so7765843wml.2
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 23:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u8aVtI/dbL0EsaAGzrELIqCMMTq/+Dk9/3241PlgyPU=;
 b=WyJtKlyDHFNrOazcb0IeT0MEL1L/HxtcnXJnh6JjapZpVagd5c9f/l3JqrM2mg6+Cm
 3e8aPf4XXO1nMcLIqn2/fpYUH2/krb6FhMC6sl6TKzZiqcr94Zm1uQxoiL0/Vibuvbgg
 aTdfq47mU97un9W76jfYRYOReMjrI0EIDU1xZBkQop1InH0B7s7knCAunM650g5OFc4+
 PObjFL2P4S9k2XTxSBmXsZkYzZk2VLZwI3VvxjYa7/O3rO/YQTK7VSLx/DHAU4TOUhJR
 wcMbd/tj7go5V9w0lz7RKksdNz7IEP2mAtUH9H4BAXOdshkjsVN4C6ItGXdhPvRhQYHt
 kOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u8aVtI/dbL0EsaAGzrELIqCMMTq/+Dk9/3241PlgyPU=;
 b=pUK+YI601FCUN8gHc34H3D8Zp53HQTl1sSQpJ66pMxmF6Q1kXdD2AjiXyRwNHt8NLb
 oMOV0T6fglsLAUpD2x+lKuCgwttvLgwXcrdrixcfsdmn7/q5jJBvGJDV3F0TJnnf48ez
 0VPavzdh90XnNdgzfN+x0FtFt1+dqHR1Y+vy/s/W+RBextKXxuEXKgZt1qis9NpLy9KR
 IoDtk/8uElCtZKcB3ouYgnw5DVqKJEo4QquWNh8iHZFR7WFM1t7Hh2BASzmhuf7xm5KN
 +1u+KelkBOfok+Zvvm2EVWgjl5RXkN4f1X2f7ZwHP8UN8Equ52y1OClvMRWWYrf0mlhv
 GQzw==
X-Gm-Message-State: AOAM531dGlOWK/uqj5x6+FP68AaAAfc7WFwA6LPDyXgXpq85fxupMcmp
 J4QukUpc/6/IiCI9wBgIhLamfwvNKxxhyQ==
X-Google-Smtp-Source: ABdhPJx+uiaWWJ+EafRijg0KdrMIAMHPcbN5/VSPfXBjxtJAhrqT8tLckzhl+yoTRwypSA31fb55jw==
X-Received: by 2002:a1c:7c19:: with SMTP id x25mr13448188wmc.172.1629096911371; 
 Sun, 15 Aug 2021 23:55:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id c9sm10711938wrm.43.2021.08.15.23.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 23:55:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Aug 2021 08:54:58 +0200
Message-Id: <20210816065458.1726927-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libkrb5: disable with libressl
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

libkrb5 does not build with libressl since commit
b7a5b9d06d484700fc4fcbd354f2c15e0422688c and upstream is not interested
in fixing this issue as a PR is opened for more than 4 years
(https://github.com/krb5/krb5/pull/607):

pkinit_crypto_openssl.c: In function 'cms_signeddata_verify':
pkinit_crypto_openssl.c:1700:22: error: implicit declaration of function 'OBJ_get0_data'; did you mean 'BIO_get_data'? [-Werror=implicit-function-declaration]
 1700 |         print_buffer(OBJ_get0_data(etype), OBJ_length(etype));
      |                      ^~~~~~~~~~~~~
      |                      BIO_get_data

Fixes:
 - http://autobuild.buildroot.org/results/e623f4e1d6b6004e98815b8b7da3938238890bd8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libkrb5/libkrb5.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 89f219d913..5b30fbba2c 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -41,7 +41,7 @@ else
 LIBKRB5_CONF_OPTS += --without-ldap
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 LIBKRB5_CONF_OPTS += \
 	--enable-pkinit \
 	--with-crypto-impl=openssl \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
