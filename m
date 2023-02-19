Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBF2C05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 14:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC51640B00;
	Sun, 19 Feb 2023 14:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC51640B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dilhqQ2gElwE; Sun, 19 Feb 2023 14:01:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43E1640AF4;
	Sun, 19 Feb 2023 14:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43E1640AF4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 560E61BF285
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 14:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CC3760C06
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 14:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CC3760C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zl6lvT4VrKaP for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 14:01:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62BDE60BFC
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62BDE60BFC
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 14:01:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bk4so441520wrb.9
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 06:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jALTwcTDLPdI2KlI2RUplUVENqDdPdnW1cUpA/CwtMM=;
 b=32XFY/Fmjd3JEu4VUbO88oubAFp2wqwJNKv0cvBsSGQUchFFxiOfWw3DrEk1kDWBXo
 9iFEVVnqM1h/KVA2HFQeoglWpF8RCy5eDCdAzj1CDKLmTPTkfdtOgyjoIpFirFsK8hxx
 tAW/dTwq3zVxB6JR5o4OhT0FLawe3Yw0bkokcgUN0ovmQXaKNKEBrTdJrum4oLMF9FxZ
 yGM4/7Q41GYmavqgFS0ImvYEQxOzUnA0qP0/v7RqVVvBJosTtt5X24tqfjcfQ78pQ+tr
 1bCC4DbzqFk6uWX8NmOhEKJT5ebfjAuENk1GzanAa3vbrpBQJP5m8iG5o0+QvNvbA2Uz
 7f6g==
X-Gm-Message-State: AO0yUKXo2Bw9svtQthTbU7ZrO3DqAu5IdrezxRO2dK3CJ1SLI8oUE4rx
 j+GcRPf7QWsHu1ytDK945AY94HlVXoo=
X-Google-Smtp-Source: AK7set+fAPkPpcU0Q51oyH8paCFTprY2t7YEbe91Tm8WDf7pheT+YxYhdBXn8zRL4Miy/F3PCtXchQ==
X-Received: by 2002:a05:6000:1144:b0:2c5:7c55:501b with SMTP id
 d4-20020a056000114400b002c57c55501bmr127806wrx.26.1676815260988; 
 Sun, 19 Feb 2023 06:01:00 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d6b4d000000b002c6e8af1037sm1659333wrw.104.2023.02.19.06.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 06:01:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 15:00:50 +0100
Message-Id: <20230219140051.80647-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230219140051.80647-1-fontaine.fabrice@gmail.com>
References: <20230219140051.80647-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jALTwcTDLPdI2KlI2RUplUVENqDdPdnW1cUpA/CwtMM=;
 b=d7TccPMEKbUyL2WedKyMuFP/2Egn3n+COU4xQ6Lj1RqzKPH2TYkapxgkobq/iehvnU
 Ew4qOx+9LBgmuvXfxRKIBQ6KFqLcYAECLNudEZZhrTJvqbyKUHQ78BWnHf6nIPgTKWVA
 p4rwENbyJwlnk5W0zY2kSzgUzhnC8MgqgQi/3K92zAIa/fXE3CXNsFl6NK8Fv6NtvMTw
 MNpYnYATGmA9ZPPvQHNe8j8Woz++frAvny/v9173z3Sga9vlulfJ1vews1fxLGcNgdCL
 m04tPMNeasYI81TUq2nwimnNe1tt+MgxlYKR8alXhbm0rGzetItttPZ+zwdZqYAQPOnS
 gNOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d7TccPME
Subject: [Buildroot] [PATCH 2/3] package/libjxl: disable benchmark and tests
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable benchmark and tests which are enabled by default since the
addition of the package in commit
e648d399d8bd609697e78f13f7fa76be06d91a57

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libjxl/libjxl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index 02a93ac5d9..77405e4f11 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -23,7 +23,9 @@ endif
 LIBJXL_CONF_OPTS = \
 	-DJPEGXL_BUNDLE_LIBPNG=OFF \
 	-DJPEGXL_BUNDLE_SKCMS=OFF \
+	-DJPEGXL_ENABLE_BENCHMARK=OFF \
 	-DJPEGXL_ENABLE_DOXYGEN=OFF \
+	-DJPEGXL_ENABLE_EXAMPLES=OFF \
 	-DJPEGXL_ENABLE_JNI=OFF \
 	-DJPEGXL_ENABLE_MANPAGES=OFF \
 	-DJPEGXL_ENABLE_OPENEXR=OFF \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
