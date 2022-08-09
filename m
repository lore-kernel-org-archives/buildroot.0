Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AD8C25B07
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 08:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512DF60AF1;
	Tue,  9 Aug 2022 08:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 512DF60AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SCfhc1Rd8sE6; Tue,  9 Aug 2022 08:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E0F560AEA;
	Tue,  9 Aug 2022 08:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E0F560AEA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E5801BF5F5
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 08:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59B38403AC
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 08:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59B38403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yLar10Vq3xKi for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 08:04:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 035A2401A3
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 035A2401A3
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 08:04:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 i128-20020a1c3b86000000b003a536d58f73so3568111wma.4
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 01:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=cD9WeUU3wP7sr4ySXCupGqCnYn5+GNLfKgiQPv21YGc=;
 b=4HrlD5XF4jRfMlllbjixyHhTgASQgWwqTS3soGqu0z3e99HX90uNBZjEbxH9+Y9hQ9
 zjzf+ck0L+pywL9FKLl3jUdqMxOR0fiT825AiXTCmUuOJ5HgB6y0KgGzqeqjqPvi49rk
 bIrTXdr7522hjxnSzxpbTlFISdMP/TmnoEzdSC+XQPHaXcXRWw3fG9yGxksZAnbAPcPP
 kVkotvaRycIhdamIzSAu0POsGLxWZOkg5FTwtect7TVTBH5ni86p0AHM0/uTAzWwZUjI
 QKaG2txPN+PdTyx5PNXNp6P6I5Y4bmNdEiop5JLf0C9L2sdHBxf1O4jrRSW5JbdgwIZo
 G+AQ==
X-Gm-Message-State: ACgBeo2aeDYKw27q+ctz/HJXDSTNRRpnLqSm2ZjcWl0lxrOwOplsIuay
 BOdBNo31iayufUTntXEueesVP1xR70Q=
X-Google-Smtp-Source: AA6agR5dhTQIfNXMUMZdUABJXnTGZBWYzQh8y1fftZiycMXB0cXBbFl1ZWkpiys+SXeS5kvpcYO8vg==
X-Received: by 2002:a05:600c:3508:b0:3a3:2fc8:1d4 with SMTP id
 h8-20020a05600c350800b003a32fc801d4mr15280823wmq.200.1660032265880; 
 Tue, 09 Aug 2022 01:04:25 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a05600c0a4500b003a305c0ab06sm24013870wmq.31.2022.08.09.01.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 01:04:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:04:16 +0200
Message-Id: <20220809080416.1895252-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=cD9WeUU3wP7sr4ySXCupGqCnYn5+GNLfKgiQPv21YGc=;
 b=k5fH9s8LGO4keR4Sg9Az/2JX1pS0zL7Yx9gU7KDRuKKaqLny0CFott6AM2NOuV/OK4
 P+ze0Kv0Y8HWb+JMkH9/tpVgEiuZeOMtMW11wmshZgKQU4QHMgtvZsHVWp0Q/zAMkdo2
 n/nmhW5CKdD46SHopoEI0RXkIR3MzrCeQW9N9iWXHrxfYM0ZBfAEjgrFTz5vKiPZDfe2
 9cqgWtBUsLvzMTQACqqDCHXOEZNW9ORHEOurIsJZXwSHq7umEZzLG8p0GMfslYUfcQth
 EfP8uAHJBw2AxGRIhjbm/d/RU49FZZklFxH12X+UAFwdEXJT4eoCtzBM2LcHnv+qk5dv
 n3nQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=k5fH9s8L
Subject: [Buildroot] [PATCH v2,
 1/1] package/xenomai: always set default version
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Always set a default value for BR2_PACKAGE_XENOMAI_VERSION to avoid a
build failure when BR2_PACKAGE_XENOMAI_VERSION is empty with
BR2_PACKAGE_XENOMAI_CUSTOM_{GIT,VERSION}

Fixes:
 - http://autobuild.buildroot.org/results/d80c295a848b5be69324f5dfbd269b046dc68e8c
 - http://autobuild.buildroot.org/results/4e57a499b43208e546dd962ca04b43408c0c082c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Prepend v to version for custom git

 package/xenomai/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index ec6d9e5d29..43276665a1 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -73,8 +73,9 @@ config BR2_PACKAGE_XENOMAI_VERSION
 	string "Custom Xenomai version" if \
 		!BR2_PACKAGE_XENOMAI_LATEST_VERSION && \
 		!BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
-	default "3.0.10" if BR2_PACKAGE_XENOMAI_LATEST_VERSION
 	default "custom" if BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
+	default "v3.0.10" if BR2_PACKAGE_XENOMAI_CUSTOM_GIT
+	default "3.0.10"
 
 config BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL_URL
 	string "URL of custom tarball"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
