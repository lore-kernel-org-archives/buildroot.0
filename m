Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC2AC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 12:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3802760D6F;
	Thu, 28 Jul 2022 12:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3802760D6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mcmkR7bOvQ6z; Thu, 28 Jul 2022 12:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8434960AD7;
	Thu, 28 Jul 2022 12:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8434960AD7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7561A1BF3F2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 12:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C9BF83E81
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 12:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C9BF83E81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfmp3jkaLAZ5 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 12:05:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09AC483EA6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09AC483EA6
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 12:05:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v17so1894176wrr.10
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 05:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2UxvZ/EiIz1Ca5BJAVYoOpmX8OISFWq6YMXzzlt0Pcw=;
 b=gAQk/PV2xC3IT5qA86KWKNFXtgb/wvtMpe//kS5YjacypfzzDWmg1cF7M9fyJEukgf
 2QRD/trC5s0xI2deOhOBWqowPV491s3oW7R8ce+mgGjEJuMRuzjMtCtPcQZ4n2rhRiXd
 A98pdqAEWRNq2lLG7eRCvt1e/fungeyrP1/DXnBEEcxZE+FwZu8wcpDB9lJ1AgnvFNzW
 8t5/Uua+ubZlIwjM0FKV675yXu+A8iiOskuQd5LA0dNOqGyg3hS/h+y8u8z86ZU6xcoq
 28NYx6DTB+Y/4jkU2Oy0iiffc/R74exMXcuHdQHtf4Q5qe+PXVZ7NIPSMRuyD1tZOxvQ
 C27w==
X-Gm-Message-State: AJIora/PpbzKa0c+xjlusa8Q+xVosn7C0RMhXog3NTIFCGeCAc9edLv3
 8B2mH7GcbwRfKqGg11O9be7qpnf7x1Y=
X-Google-Smtp-Source: AGRyM1tEDeB+ecOBQpM6PiM0ygT0ufnb9xPZ36BsjPqI2sUhvX10m7ciciL/GjPbia+gJQW9WZ1pdg==
X-Received: by 2002:a5d:5005:0:b0:21e:f1b0:6eb0 with SMTP id
 e5-20020a5d5005000000b0021ef1b06eb0mr2349352wrt.532.1659009949778; 
 Thu, 28 Jul 2022 05:05:49 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bh16-20020a05600c3d1000b003a326ba4e99sm1100025wmb.34.2022.07.28.05.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 05:05:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 14:05:46 +0200
Message-Id: <20220728120546.2534117-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2UxvZ/EiIz1Ca5BJAVYoOpmX8OISFWq6YMXzzlt0Pcw=;
 b=CAlpLvbDGUb5FdkXDEpjy42YBmd3jD/mln9LuuSxkx2cE49+srnahUaTNd7JvOxFwV
 HLY2E1UjxSbiuy8QZmIgbHhhYKEz5K7TUf6Lh/I2lYexgtENnFueww2+15jNcTQxQGH1
 2f2RL3eXmNik+m/Ar/x6LJta2zDtHgUOr2q1jkqZVHRKxxSHtBUlpzBiX2/1E6SDZNik
 OLXL5S1EvM+MPope78gURRBRU6iYFl5U4RhdQEuRD2Q0Q6pOER3er0B7eGSwwJseHPE0
 NicN0xhQUfNjgYc/sQwHBby4QRr8iyV8muhuROY1CAfo1hTd5dVP9/ehnPlDGz94ZmD8
 /j9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CAlpLvbD
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: select pcre2
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit ea746f312844df298bbc9a697ca178f3a3c67a8f forgot to select pcre2
resulting in the following build failure:

Makefile:575: *** pcre2 is in the dependency chain of libmodsecurity that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/6528d2611bd1a45c1e94bc6b866de9c33dd90a7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmodsecurity/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
index f65ab3de93..b15d808759 100644
--- a/package/libmodsecurity/Config.in
+++ b/package/libmodsecurity/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBMODSECURITY
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# libmodsecurity embeds several mbedtls source files
 	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS)
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  Libmodsecurity is one component of the ModSecurity
 	  v3 project. The library codebase serves as an
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
