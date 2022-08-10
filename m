Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECEFC00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 05:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C83EB415E6;
	Wed, 10 Aug 2022 05:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C83EB415E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CAyARAHARru2; Wed, 10 Aug 2022 05:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AEDD415AE;
	Wed, 10 Aug 2022 05:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AEDD415AE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 382531BF4E7
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 05:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F5BC61006
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 05:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F5BC61006
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rm-fwC_V6SI for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 05:31:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE3B660FFC
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE3B660FFC
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 05:31:12 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id u14so8343334oie.2
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 22:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=fXSncZHfsr0+a4QxqzzhB2xEUKlNGiXNbnQKheeIp6U=;
 b=TzHDvUcQ4bowtXTod/sgUoBQhUUG4wePCMcn5k1CJ9s6qoJLi7yknXPusw1OLeYr0v
 QKX5jHHfami16H0ZEVEvx3ym9Gnjq/jBacOyrP5itPwvtB4zrFrXiGIV8PVX4UlKvMpr
 hNVB+1mtWuOzY9SQDjKtwn/J3Choagzq+fJiUB2bVdA1Ds9hBYPXd7lmKFgPI4R2C/aK
 5nU6mQIie9K3FjfKvJTMeqcDq6700bKT3ZEju2B/nfFrBSU+jGTkXOyV1DLaMeoLZXd9
 F7LEbr+BmUHL+HVIbyIgc85Y+KaJ8BvSWKA3nezKrY1AjrfIX3+5Gnkm3CFoVnuSF7DW
 9opA==
X-Gm-Message-State: ACgBeo39KBb6RZuNG+d6q9rUflMMFVJVsWpZeddlST3n8m4zrwMw0M+o
 YRWsRPTEuqWjXPvs/M6d2gvPCvlyawA=
X-Google-Smtp-Source: AA6agR6KFAoVdeDG7wz0c4q0xtBndVPkrYyQV9maySq5FA97efKOn2Yy0PAgW/rcFUpI1X2xq938yQ==
X-Received: by 2002:a05:6808:1153:b0:33a:faea:c86f with SMTP id
 u19-20020a056808115300b0033afaeac86fmr725037oiu.10.1660109471248; 
 Tue, 09 Aug 2022 22:31:11 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 y24-20020a9d4618000000b00636c81d4109sm527263ote.46.2022.08.09.22.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 22:31:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 23:31:02 -0600
Message-Id: <20220810053102.2625513-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810053102.2625513-1-james.hilliard1@gmail.com>
References: <20220810053102.2625513-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=fXSncZHfsr0+a4QxqzzhB2xEUKlNGiXNbnQKheeIp6U=;
 b=BOMu9TyG6vmsfTOC534V0/eT62H1R8EuFsWkt8xtv2CifBZJE761ikdgrFVtpiOqE9
 Xkz3884Ts5a4cyzTWW1Bqrsio19j8zV+Qn5ydlQVpqfOnu+cMFImw1Nxhd23PZo3leuk
 93nfkUkf/TO7mnlnZg08kqnJ24Wn713/RHR6WM9L2zZN88BHqSJDBzt7bZKcN7+lQu+V
 6f7C7xPmw16KNCjvLKR//bmNDRJdCzcp5GADiSzXFLfMeuPNe879LFRgbpb2fJQRKt7l
 HspsLD84A9I2G4daZrPaM8/+p0wT1FRkQqbTmNpx3nb4bct+EZCVUZyrbZRML0E9HUgZ
 AyZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BOMu9TyG
Subject: [Buildroot] [PATCH 3/3] package/python-orjson: bump to version
 3.7.11
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index dd511fd8fc..1de1d7cdc2 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  ffd677a941c08c9a6cbaf3f49dba12b353833e8028b70e76cd1091b39e096de0  orjson-3.7.7.tar.gz
+sha256  285091518bdbde8086c60c5ed6d7090eccc1c232b00138c964c410f1a7da654f  orjson-3.7.11.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index e0071fa390..0a266e827a 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.7.7
+PYTHON_ORJSON_VERSION = 3.7.11
 PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/8a/68/47bc5e624431d77445f06a2d3ba32777fda650f05a2f803ea1dc2b07b65a
+PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/fd/52/42520dbfd47191977140c49fa601624b9b4c6cc9d6a62d3e68970ee9eac6
 PYTHON_ORJSON_SETUP_TYPE = pep517
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
