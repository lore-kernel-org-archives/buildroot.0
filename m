Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B29FC0032E
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 16:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BBE9416B5;
	Sat, 28 Oct 2023 16:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BBE9416B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 303Kp_s1FA8T; Sat, 28 Oct 2023 16:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BDA2416B0;
	Sat, 28 Oct 2023 16:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BDA2416B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D07921BF32C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 16:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B72A061212
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 16:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B72A061212
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I9hPv1_dekDI for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 16:42:38 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4E9B61217
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 16:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4E9B61217
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso17889465e9.1
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 09:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698511355; x=1699116155;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eIr+Ed/bsX2YWW0ZQblU6reO0qtTHhU/hV9jfWbbEwc=;
 b=IZRdzSwoemL5pQOm/Jh7QXRofrImBl+uCf0IA2L2LgosiR9uEP52zgqH6xiK/Qxxvj
 m6DU+7DyW8PzHwwkGXHWN+PVgnwyfYNgo+FGFf2Ome4Qsq3JmCWF/0RWoTatUHhfHxJc
 LOrkz6Y+Rzt6uS8VaqgcSIxwolfgd0xPsmddarLbbtUztdVl9w6dGLPTvq3sWJzFasQU
 LdcMdefQJp0uEzKP+9fWoH/DPSghKyvVapfn4UI8dybmVgHn6kHod3dWponRJFqfW9Xe
 NgB/WDiGKK1mXLkKVzZSGMYoudnIvlM+zmqansJ0G3bmyQIaYceEXgEk9IykoGAFq86A
 A1fg==
X-Gm-Message-State: AOJu0Yyu0TKIFqXsyZL6qkShjHZHnGte97XlDjFZiKVd4AsT/Ok+oMcF
 0dQib+bksohJj3JdZyNpJogL/80kong=
X-Google-Smtp-Source: AGHT+IFyWLWAfeCtaW1NsYYYlJqDQu/f/IgPB+LEZ6ekMCekE1uAMU1iT5pk4DMnRx0nhO+z1N2AHA==
X-Received: by 2002:a05:600c:1d98:b0:408:36bb:5b0c with SMTP id
 p24-20020a05600c1d9800b0040836bb5b0cmr10022543wms.7.1698511355347; 
 Sat, 28 Oct 2023 09:42:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 hj19-20020a05600c529300b0040841e79715sm4364559wmb.27.2023.10.28.09.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 09:42:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 18:42:29 +0200
Message-ID: <20231028164229.550018-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698511355; x=1699116155; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eIr+Ed/bsX2YWW0ZQblU6reO0qtTHhU/hV9jfWbbEwc=;
 b=fu/hEe9rO5BVb/gmTGArB3RZ/3wyyX4IiNIe8SfHBA0Y+dTUY+j9IFE57IrwDZm4h4
 yjRXUzmwq7wQBNOrdmtwhBYyh2AwrfNi/CSmdwyjLjKVYIUbd7UFPmeE4MhBGVv6rdaF
 VQyQesfnf/k9j8/uNA9wY0x/or5tauRr+VmM5jEhBMMQbXo7s9qJ7BZg5R6qiq1B4ovB
 Y3zRX23jL2aOZA6ie62J6JDmQHYxgz01RdUQacO6AsqYDLxnO+IcjsYAT9EM4XOTfeyq
 DR4IWCDx4LSuZc3l2OoQ9kQ9JbLe2lOtkKuuh1ggCL9SB0+eTViXuBvFA1jAI/g+5ThI
 gM2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fu/hEe9r
Subject: [Buildroot] [PATCH 1/1] package/powerpc-utils: bump to version
 1.3.11
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

https://github.com/ibm-power-utilities/powerpc-utils/blob/v1.3.11/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/powerpc-utils/powerpc-utils.hash | 2 +-
 package/powerpc-utils/powerpc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index b3c77fb223..32387014cc 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d64d9016a3e63a1e44c6e0833742cf964ae6bb1c6a9c7f0c7c5748aa335dc3db  powerpc-utils-1.3.10.tar.gz
+sha256  6bb16078068d8b889afdd78927d2f061702ef155e57fc548ae573e2b0b90ca13  powerpc-utils-1.3.11.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index 19fa84946c..8d5491133b 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = 1.3.10
+POWERPC_UTILS_VERSION = 1.3.11
 POWERPC_UTILS_SITE = $(call github,ibm-power-utilities,powerpc-utils,v$(POWERPC_UTILS_VERSION))
 POWERPC_UTILS_DEPENDENCIES = zlib numactl
 POWERPC_UTILS_AUTORECONF = YES
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
