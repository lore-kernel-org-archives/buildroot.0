Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB17C4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 585A5417A7;
	Sat,  3 Feb 2024 18:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 585A5417A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egJaeOudpFAu; Sat,  3 Feb 2024 18:30:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 994F941C61;
	Sat,  3 Feb 2024 18:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 994F941C61
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1B61BF285
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 18:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74D2B40474
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 18:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D2B40474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6RPjCdwCAw9D for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 18:28:50 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52C2F400A4
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 18:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52C2F400A4
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40fc52c2ae4so16919145e9.3
 for <buildroot@buildroot.org>; Sat, 03 Feb 2024 10:28:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706984927; x=1707589727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JJdUbWDY0JhQhwGBv/r89cOpU7/ToESXp4hQrAwYE8U=;
 b=Co3g/1+CxHGB4nSIIl+p3AJ54YOTfLXwM0TxZG3lVEWSVSkI3iT4YaqZpVt7GHZvPz
 IhDzeMN0ZTrXRVugA4RuUQBMtTfVYsqUknLjgIidKwA9Pt1lVxAc4uNUPyfD3OiLyTED
 vgd+tmnUI5o0uWtX0zbdN5aexMpwlrdNyA32k2+Nn2Uq71RU1uUnK3OFBPXCPix+hPPJ
 VTNKVcOMZdCFchSuzkcdSCSAjXBWwFS9QD5icOHFnKsqPWSPRsHZcGnfhe2n94aJFhg0
 PV3YqWViMAJm+u01IjuSH6HeL3jonX6bC4Tb7hWfK01EXKTLwkAhy5XsVclK69ytxfPm
 T2aA==
X-Gm-Message-State: AOJu0YwzcqWIspGTKwKdtqWdx8baQ0JTdVNGyZU409L2uLK8qnXqflmU
 AMpzv8WvK2MzwyGuqWWXYhvaDCZZ1BOGGtrKD84NXj0R3xwlDKx6NPGbfEzYSSo=
X-Google-Smtp-Source: AGHT+IGW5KKUMeZ4hrkJdiKJR4i4dXFEIKFjS7vnieA9wh/++mGRGbq/L7Cv0e0owzsq3MB34W/8Vw==
X-Received: by 2002:adf:f3ce:0:b0:33a:ff67:74a with SMTP id
 g14-20020adff3ce000000b0033aff67074amr3099771wrp.63.1706984927391; 
 Sat, 03 Feb 2024 10:28:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n14-20020a5d660e000000b0033b1cb8135asm4515630wru.88.2024.02.03.10.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 10:28:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Feb 2024 19:28:45 +0100
Message-ID: <20240203182845.158531-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706984927; x=1707589727; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JJdUbWDY0JhQhwGBv/r89cOpU7/ToESXp4hQrAwYE8U=;
 b=a36e8AEz70O6VcRx4nzGVMd5/rpsiMVqYVMJyaVz5Rl/k2FSpeCm8l2mwaLLPQkDGC
 dju7ThSZ4nEBfEtwA4bcFj+pbsWLpx4KjhClSRcTFocil5a5u76sL7U23mQ7ESeb9bl7
 tpWMWMwKpLvLrCdgAJpoB7+VTCw1vU02+Wmp/YYLYv+STdBjP/hJ8DzyPpUT31wG67H2
 P2rshOf2bxtH/dcMk2n2EovwwQwCN2rfHt0Jo+cvrTz9PVmcvTqe24OSR4OklA8xmwhH
 ZMVNxSMYCmZux9VVFaihG2u8X50LcLnqTcZRvpFQiJucpPY6C15nandThzXIuYPnOKdj
 nyZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a36e8AEz
Subject: [Buildroot] [PATCH 1/1] package/flex: update FLEX_CPE_ID_VENDOR
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

cpe:2.3:a:flex_project:flex has been deprecated in favor of
cpe:2.3:a:westes:flex in October 2023:

  <cpe-item name="cpe:/a:flex_project:flex:2.6.4" deprecated="true" deprecation_date="2023-10-06T17:12:20.950Z">
    <title xml:lang="en-US">Flex Fast Lexical Analyser 2.6.4</title>
      <reference href="https://github.com/westes/flex/releases">Version</reference>
      <reference href="https://github.com/westes/flex/">Product</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:flex_project:flex:2.6.4:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:westes:flex:2.6.4:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flex/flex.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index f1e731ce2e..c6417fea83 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -9,7 +9,7 @@ FLEX_SITE = https://github.com/westes/flex/files/981163
 FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
-FLEX_CPE_ID_VENDOR = flex_project
+FLEX_CPE_ID_VENDOR = westes
 # bug does not cause stack overflows in the generated code and has been
 # noted upstream as a bug in the code generator
 FLEX_IGNORE_CVES = CVE-2019-6293
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
