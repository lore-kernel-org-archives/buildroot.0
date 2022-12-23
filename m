Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8278DC4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 15:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE0FA4198E;
	Fri, 23 Dec 2022 15:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE0FA4198E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6AyQ2GWzKCvZ; Fri, 23 Dec 2022 15:24:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD8CC41992;
	Fri, 23 Dec 2022 15:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD8CC41992
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28CD11BF5E6
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 15:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F07DE41992
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 15:24:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F07DE41992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RJpGJt768iTV for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 15:24:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8641D4198E
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8641D4198E
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 15:24:04 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h16so4840233wrz.12
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 07:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XIVJFXXnj2L0EDApMA5XC4967Rn0nR2Le5LQKD2ImmI=;
 b=NApkMdiWdBf7qBTsxHgSA7DFNqX263tK1lwMEZZGQneuub9y2KPCanLenMm5BdNF8l
 aoErZvcivKwKHs7apdX/YNiDSVpUXbm9jsodlccixo1hM9iOYwr9oW81Pkh+RoYnn0O1
 dIgj6UXAzyaouaiT+XgHA3DKFK0zIJSGuz8QXWWFAphsbscoNg3PqpQ+2P9Bw+ZhCGDV
 NLR7XkbbWS1FyMkm/G7JLIhXifA3EeyQXdx9uw0akUX5Vn8ZHu2wlKbSCtVDC7RzN3SS
 n88cYcUvZlQ0ubkVxTJ0kKMQ9SUhq19LMj+HnB6j6MCuNJ12InT/3Fsn9qwTik9Hviq9
 zagg==
X-Gm-Message-State: AFqh2kp2X5ClLr6L36Xw5+NaML9/iCs8IZHRBVpnqrRk21Qq/7KV1E2e
 l5PRQmZUgRTAQloO3MLz0ECYFLu1xPI=
X-Google-Smtp-Source: AMrXdXvULiH0vg3KXBcjryfJ42pv4ObclVvm8Cfo2SWxHrfxnN2joU/Asctr4P1eIGDKy51QgrEpKw==
X-Received: by 2002:adf:e7d0:0:b0:242:6583:acc1 with SMTP id
 e16-20020adfe7d0000000b002426583acc1mr6675988wrn.57.1671809042353; 
 Fri, 23 Dec 2022 07:24:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b0026a4bb75477sm3308928wrf.28.2022.12.23.07.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 07:24:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 16:23:56 +0100
Message-Id: <20221223152357.272307-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XIVJFXXnj2L0EDApMA5XC4967Rn0nR2Le5LQKD2ImmI=;
 b=qF9TD0LtcvcxdQUFrs214R8T2OJfgf1nCoGTucw8C/wF/Ic73q8T1Zcror/bObEMaR
 WyAIuS9cB5dyg9FWg8zfW0iTBu4rSpwnJG4VXDQswvDGa48qJhN0MPKaZtNTq8ynbEb6
 t0SuwaYITn8QPNaf0dgDXPXR+Og95Ezk4Dib8XwDkQPseteuYVGmG1H7m8cRhojipeg7
 1hQkEI/7SPAKega1F/8fvhRwDOPnYL+RLCG5/M/qniA8HyyYzU6zl9fKldvyFuoEEhkX
 JNBa3clRUm8A935Bqamf/Qqxq7DghWYrr62LT3jFcI9MZw9UTRGL8TWo0f1MQQgI2vYT
 cSOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qF9TD0Lt
Subject: [Buildroot] [PATCH 1/2] package/rtl_433: drop dynamic library
 dependency
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

rtl_433 can be built statically since its addition in commit
4634e84978a3e64e9050021d209a41cd88a1ad16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rtl_433/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/rtl_433/Config.in b/package/rtl_433/Config.in
index 5664227c82..a6db00f477 100644
--- a/package/rtl_433/Config.in
+++ b/package/rtl_433/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_RTL_433
 	bool "rtl_433"
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK if BR2_PACKAGE_LIBOPENSSL
 	help
@@ -11,6 +10,6 @@ config BR2_PACKAGE_RTL_433
 
 	  https://github.com/merbanan/rtl_433
 
-comment "rtl_433 needs a toolchain w/ dynamic library, threads"
+comment "rtl_433 needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
