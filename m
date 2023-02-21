Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0453DC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 15:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8788482F57;
	Tue, 21 Feb 2023 15:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8788482F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sjuTfOqcFQlI; Tue, 21 Feb 2023 15:27:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E7D482F37;
	Tue, 21 Feb 2023 15:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E7D482F37
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B79121BF390
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 15:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E618611F3
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 15:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E618611F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B6MQedSzMzKW for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 15:27:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03856611FC
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03856611FC
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 15:27:26 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z8so4578674wrm.8
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 07:27:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GaRSHCjzu1t3AsoPUE3wmOdk5eFuvXcQMG+iice/Cmo=;
 b=d/pr2geWgC8+rdODB0+6/MyX6zilJn5Uaz0W5uQr4kHcGInRa+1OIufGtE2OHm9LEz
 9Gm63eM8FjAFgmpdqxVKQojid6gdWCfjOR5QzbnkBFHNyzXqAjiI9rUXBnpm8KeJVffn
 5/H+vr7N8uY6iL3luJSHm0HDAeRjbDkc9OmoIfyD0mk5xhZzRxcaQLtiagDhfQ5ipxhw
 iy9jCiE7q6rnMiJHP0fhPGZpypZKFMyrF8ZVPFtoUKNZCblo+xE6vsQ3KMQNVpF2Lpjg
 xDYRONXt96VS9RCaPnLdxYEjeALeKp3AjXKC9ySwJTtmAluWMqjW0TTuAOsihsfMvONy
 4cgA==
X-Gm-Message-State: AO0yUKXOHLSpT/d/b4No0rpLUyAVShg0DdeN+huJgSVZpjGXRcmeFDQW
 T9i+ztvLw5ObWvGPKy1F64/3fu9aD30=
X-Google-Smtp-Source: AK7set+OnjtqUe+ibNCL0Ilxtn8X558ppd2CgCWX9THGTJNuFxgJ3C/u8lkiWtDXpWmxE8Q3LrvX8A==
X-Received: by 2002:adf:f710:0:b0:2bf:eec5:3912 with SMTP id
 r16-20020adff710000000b002bfeec53912mr4490004wrp.34.1676993244861; 
 Tue, 21 Feb 2023 07:27:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n16-20020a5d51d0000000b002c56046a3b5sm5088628wrv.53.2023.02.21.07.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 07:27:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 16:27:22 +0100
Message-Id: <20230221152722.2418893-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GaRSHCjzu1t3AsoPUE3wmOdk5eFuvXcQMG+iice/Cmo=;
 b=dTBuyli1zGRE9IlktFGTQOaJEgzpmtcv94Ine305I4CqZC8NEn5klJE05egQ8mIwAD
 lTyfass/j1oTiauIaGgQXQRXO5iIR/1yaShnK+ebVnecpeCq1iNB92m7/WYMQqY5fBin
 nOt2yI1Yr+i7jyvjQEiGdLvAa85C2AfCI89niIWNy1b/nk2ay9DaWoeX5gBylUmjWQqE
 /w+/JrHHtscu46ZJ397TlNmiJk3RfOqdOGtG+VX2t9YI6JzTtAzoaAuW+64BPd1QQhjz
 s9Vo+sXKZyAlpEgHIVqbtkqvHU9e4H/jdpSQW7bZMVSHjKAmxb7U/Qkz0GSn3LxoK3cM
 EjXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dTBuyli1
Subject: [Buildroot] [PATCH 1/1] package/janet: needs gcc >= 4.9
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

janet needs gcc >= 4.9 for stdatomic.h since version 1.26.0 and
https://github.com/janet-lang/janet/commit/bfcfd58259911b92ff516bab9216831b34653805
resulting in the following build failure since commit
5c6f32bd255fc97823d464beacfa905a141066ec:

src/core/abstract.c:35:23: fatal error: stdatomic.h: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/a2b40adb93b751221ba2cdf9a705f86c30499021

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/janet/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/janet/Config.in b/package/janet/Config.in
index 0e25ce34e3..7b78c14bf4 100644
--- a/package/janet/Config.in
+++ b/package/janet/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_JANET
 	bool "janet"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	help
 	  Janet is a functional and imperative programming language.
 	  The entire language (core library, interpreter, compiler,
@@ -8,3 +9,6 @@ config BR2_PACKAGE_JANET
 	  and two headers.
 
 	  https://janet-lang.org/
+
+comment "janet needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
