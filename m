Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD52C6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 11:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AAF442D3B;
	Tue, 21 Feb 2023 11:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AAF442D3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFuUHaruKEPd; Tue, 21 Feb 2023 11:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A1EA42B57;
	Tue, 21 Feb 2023 11:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A1EA42B57
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1C411BF33F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 11:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABFD140A59
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 11:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABFD140A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xvCPvcN-e2YM for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 11:29:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DE4B400DC
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DE4B400DC
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 11:29:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v3so3977355wrp.2
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 03:29:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FVPAsNfcwccBJN5qCkFihR922134KQpAej4JQzMz+9c=;
 b=mwHTJGJW89/nMq9XAg6jBw2P28JYmPTgBZPbH1WIDdBOzy1PCUiMUqjb7ab/NVeew9
 m94dgSQwmnA6w/ra2av4gnQIYfDcAWGeWM5luMjZ/lJGDdVY7I5w3VXP21DYESHH9MZo
 CmJ4oMjogJAAfvnL6sbsMhvK/7KS/99JKYTXc0z6iqjEasbH9zOYLCbZ2jJIWvO8LIDX
 VzBMOEC3nEtSFmgxx+ncQxeyHi+G+boO6lXlbFHoFmdWdwQBH5gHbDR35bhh+DXn4KZ2
 yojNWsCYcHYsgMuaxsgk9pWV1DUIC++IaakTXGEt/fQzRC6vmOhxuBYiBCIu2zLZfFUr
 brcg==
X-Gm-Message-State: AO0yUKUKRWukMzezc8fEmoVMR3bvslOiJ0oYV2ktH1YtVYEfl58CYi9o
 78I21yjV1Eenkxrq+8bVdcV2LIpH8Ew=
X-Google-Smtp-Source: AK7set8fET50kyBZlqSXHPx5BCmuVlf2ZFRKUJ90SE8LPmA2KZM7DHQJmrKElnUSsuq7JwLPA5m1Kg==
X-Received: by 2002:a05:6000:1086:b0:2c7:454:ed41 with SMTP id
 y6-20020a056000108600b002c70454ed41mr1778592wrw.71.1676978993294; 
 Tue, 21 Feb 2023 03:29:53 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v25-20020a5d5919000000b002c551f7d452sm3955181wrd.98.2023.02.21.03.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 03:29:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 12:29:11 +0100
Message-Id: <20230221112911.177963-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FVPAsNfcwccBJN5qCkFihR922134KQpAej4JQzMz+9c=;
 b=RMnzd/RR/tqIAWZ2lLyFVoLzvKDCTUc3lsohhladivDnnhVJLVXgoCcjM7na4Y0RFO
 j9mBs0gYAYhDSoXGTRcNHxQJtHnTHVgvyGJ8fJRG1JtmZ5sTsIgluWwcRTH2JcIVNcbZ
 Y8iu3gULeDXCYGFv05Iq++9lGBXyE1U3UMrKXh2ZEBmS9ogaQoNJHNAhGxKEAU/c8Dlb
 reE87Yva9T8/vPLnUBceQWjXOGSfd8mOrTQmW/ds7HjXSejneRQwIuDzRHK/2ntU7zRl
 g9VxqLfUMEPgzUcpFFeWhApZfk7ntDIiKT3dcPN+SnuDyv4TC5KyFy5kWB9eSInrgUAr
 /oyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RMnzd/RR
Subject: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-synopsys-arc: drop locale
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

locale is not enabled resulting in the following libcpprestsdk build
failure:

In file included from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/include/cpprest/json.h:18,
                 from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/src/pch/stdafx.h:88,
                 from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/src/http/client/http_client_msg.cpp:13:
/home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/include/cpprest/asyncrt_utils.h:317:13: error: 'locale_t' does not name a type
  317 |     typedef locale_t xplat_locale;
      |             ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e6778e60cc1ea455f5b4511d5824f04d8040f67b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../toolchain-external/toolchain-external-synopsys-arc/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index c3483f331c..37c7b82644 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -4,7 +4,6 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	depends on BR2_HOSTARCH = "x86_64"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_ENABLE_LOCALE
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
