Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415C1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 20:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A33D04177F;
	Sat, 28 May 2022 20:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zbU4kBGBJmR; Sat, 28 May 2022 20:46:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 693B041708;
	Sat, 28 May 2022 20:46:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E12F1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98BBD60ACE
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EpKDshRzwclF for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 20:46:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75D7360AAA
 for <buildroot@buildroot.org>; Sat, 28 May 2022 20:46:54 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x17so965599wrg.6
 for <buildroot@buildroot.org>; Sat, 28 May 2022 13:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KzNBo3Ru3krI0Fcqj/eYdaygIuhRFRj4BvQuuEv9h4I=;
 b=CUe3/5Y/hBNLG2DUEDRJakxDyaqx1y2jNT0vH/O+CFCe5To8GKOerNi5xDYepw+amp
 mV7b3c8FPgxCspJs9GUoTEQV75cTBg0mXDJEp+ygrbJfnSd6wqbChOKpTgqXAHQvAGZD
 TZq9Flrw+Xc1F5xLI920W2ZnxuhnpbHEXcc5HAPOv1dlxD/RnNWVi+JNiACxoKlidqgJ
 J9Hn2s+Bqez8dDp5qwzXqlUmQL+Pd/uTh9vCcu57kSxp0ucBk5KuwIxo2+9YT59s1sCW
 ePdUAkqk+pXCW10ndhMnuZT/BN2J+OliwCYE8FUqJ7QckCtyI1Fa/RWF0lilAqQJm3VO
 6ZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KzNBo3Ru3krI0Fcqj/eYdaygIuhRFRj4BvQuuEv9h4I=;
 b=TqJ5QaMB0vyeLeYm8aNMoab7squDKQcsRWcUmy/ITl8LYwg1J2Oy6G62p7491cQjxe
 4Z2fs3kTm6+t1jS9+c0szztu8nUutSjv/zlPCs5zdkR/lfNKf9LOf/JAy7Ioe/024E3G
 c4IVjBIGHel7mbiB6YTBCVgN18fQOhQ3bU/BwwCVYeJLiTSPsUfOyhYDrtNYiSW+/fxv
 mGy4ev0+yuiR8VP0IOGlsdiNxRhXCjt/+GFxb8lCG1jgtE20pO/E3v7AB/QptPJ0UPGC
 PbEYlm83TQ/72000ycHtijNccxI3P9rlIojSkltoJPdrTBpKFMs7Qgft/vnZi7UKzhmE
 KmZw==
X-Gm-Message-State: AOAM5302t3ekyjREIx3gkz6J4cPmPOMeFMr7DM3qhrkgjJsyA0qNP/2n
 6azStKkGh05V2yhNPqizLghfg5gxSkA=
X-Google-Smtp-Source: ABdhPJzTmKZOMOgoGUTnftDWLcrS7VLeHuMsAvaynX0P8ZfCs57WDen72I/QvSyltIWGXJPwGUrBqQ==
X-Received: by 2002:adf:fd0a:0:b0:210:219f:9784 with SMTP id
 e10-20020adffd0a000000b00210219f9784mr5117578wrr.565.1653770812372; 
 Sat, 28 May 2022 13:46:52 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b18-20020adff912000000b0020fded972c0sm5996046wrr.45.2022.05.28.13.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 13:46:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 22:44:23 +0200
Message-Id: <20220528204423.2214898-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: disable -Werror
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

Disable -Werror (enabled by default) through DISABLE_WERROR which is
available since version 4.1.0 and
https://github.com/warmcat/libwebsockets/commit/c9c152baba1fbd6e2b061b16a5c987a80309caee
to avoid the following build failure with gcc 4.8 and libev:

/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/libwebsockets-4.3.1/lib/event-libs/libev/libev.c: In function 'lws_ev_hrtimer_cb':
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/libwebsockets-4.3.1/lib/event-libs/libev/libev.c:44:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
   ev_timer_set(&ptpr->hrtimer, ((float)us) / 1000000.0, 0);
   ^

Fixes:
 - http://autobuild.buildroot.org/results/75ddbd2e0b058b69a99a2a2f01c62dedad1199c0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libwebsockets/libwebsockets.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 63d50999a5..3a9b9ea88f 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -11,6 +11,7 @@ LIBWEBSOCKETS_LICENSE_FILES = LICENSE
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 LIBWEBSOCKETS_CONF_OPTS = \
+	-DDISABLE_WERROR=ON \
 	-DLWS_WITHOUT_TESTAPPS=ON \
 	-DLWS_IPV6=ON \
 	-DLWS_UNIX_SOCK=ON \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
