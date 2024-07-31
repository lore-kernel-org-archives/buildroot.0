Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B89CC3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 11:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D80694014D;
	Wed, 31 Jul 2024 11:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwvjWN6VujjJ; Wed, 31 Jul 2024 11:04:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A775B406C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A775B406C0;
	Wed, 31 Jul 2024 11:04:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5011BF576
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 11:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C996C4040A
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 11:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkv3d3rPP9vn for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 11:04:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4FC27404FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FC27404FC
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FC27404FC
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 11:04:36 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52f01afa11cso8474700e87.0
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 04:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722423874; x=1723028674;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bOdjOr02MkeJM3LpUwYKAlH/iznWNCoNbj20AcEqrPM=;
 b=BO8wW5bBYY2iGUEkIPGY6Xd0B6mlKeqrIR0HXdLbq9FuGtCr/XCg8ZQqYmNrLnzXir
 piOokf9+265NFL+Kvx06V9Yrv7BCDNHnvdkOFGQv5KR8mOTRxz1yN6EpCrf3+JfqCJCC
 RKd0/vtVYSGkWrKfqdCnvU5UPIoT3c0PVKcmUXdaUa9SfDEuIkl6/pj0jooH1HVPaKSV
 AZs4v2KsHUE4g6L3aN16SFZ9yCa3TVH/QZxcBirxoKDga3Bpc8hOdcseXe9tgKrSNO/7
 2lJBNwgGCLd8rwiJQ86ZV5/Is26sB6B/tYhK3qk21uR5wwISUlPdHNmUBT+rsFbko0xw
 2jOg==
X-Gm-Message-State: AOJu0Yw30uN14z8hRGsYA05QwNDzdI1lse0YIenUatRAUE4jZb0urnBt
 QIx/TKOf2BXiYFAFB/30F8+sDfoKDn5pALmKbZYiOMIvq5wljUru2Fo1hQ==
X-Google-Smtp-Source: AGHT+IH6T9p7b8fIW1Cuq3hvkfpxWDiYfJ+d92HGH33qJ+5e0lgwrTQBu6kbnmkSa1pkqGlWkOf95w==
X-Received: by 2002:ac2:4bd5:0:b0:530:abec:9a1b with SMTP id
 2adb3069b0e04-530abecc7b4mr4080361e87.13.1722423873247; 
 Wed, 31 Jul 2024 04:04:33 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5bd1344sm2204698e87.104.2024.07.31.04.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 04:04:32 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 13:04:29 +0200
Message-ID: <20240731110429.245927-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722423874; x=1723028674; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bOdjOr02MkeJM3LpUwYKAlH/iznWNCoNbj20AcEqrPM=;
 b=EYCj7tYQcafi/NMmx/8pfrWgD3fCHrth7E579slpFmz4Pc4lkVQPXlqopPJXYdUn5I
 oCcXx7dBTtpV4RFsiBlCVX7fGOpmMYResJY5n16YtJz/ebDcwdANKwMTCqG01ez0OTAT
 XsbAz9fqC5fglA/VtBH+jmoR/jr0DmEf1a8zbZ9eYIc485z3ladxcEjBadwhgIDWS55C
 OI73iBuOnNmZGWUKqX2dXs87a1JMf9j8o1fyBD/muEz6CfLM4IRkNC1ARDUolHOrJhWo
 Uf75hut7OscuxIJYAXwQohiBJqIQGNnx5T0+RfMScybn/oay3nJzvf4DxQ7PbD4mkzPa
 E6gQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EYCj7tYQ
Subject: [Buildroot] [PATCH 1/1] package/netcalc: bump to v2.1.7
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream now provides sha256sum for tarball.  License hash updated
because of copyright year and maintainer surname changes.

Changes from https://github.com/troglobit/netcalc/releases/tag/v2.1.7:

 - Allow colorized output over pipes, use -n to disable.
   This reverts the auto-disable in pipes, introduced in v2.1
 - Misc. build issues on macOS and *BSD
 - Various minor GCC 13 and Clang 18 warnings

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/netcalc/netcalc.hash | 10 +++++-----
 package/netcalc/netcalc.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/netcalc/netcalc.hash b/package/netcalc/netcalc.hash
index ba503b6457..7a9f2000e0 100644
--- a/package/netcalc/netcalc.hash
+++ b/package/netcalc/netcalc.hash
@@ -1,5 +1,5 @@
-# From https://github.com/troglobit/netcalc/releases/tag/v2.1.6
-md5  c8660b61370c76d866247fe65966a35b  netcalc-2.1.6.tar.gz
-# Locally computed:
-sha256  cff41782fcf63d7d4ce6d35f95ed302127f6ddf6fc0ca03a8188af95a7c3243b  netcalc-2.1.6.tar.gz
-sha256  745538f8d515d37af6f03442df982a8b211b129e8dc10d0195e33c4b42f8fe5f  LICENSE
+# From https://github.com/troglobit/netcalc/releases/tag/v2.1.7
+sha256  7300ceac519dd14a8431d27339359f064eb5d80bdd7307ecb1b1cb1b0ab42969  netcalc-2.1.7.tar.gz
+
+# Locally computed
+sha256  c9462bef0a7f70323f782e10def048ea0bb281d35e93dd0de896ea9805856015  LICENSE
diff --git a/package/netcalc/netcalc.mk b/package/netcalc/netcalc.mk
index 7d96fc53cf..4d69deee61 100644
--- a/package/netcalc/netcalc.mk
+++ b/package/netcalc/netcalc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETCALC_VERSION = 2.1.6
+NETCALC_VERSION = 2.1.7
 NETCALC_SITE = https://github.com/troglobit/netcalc/releases/download/v$(NETCALC_VERSION)
 NETCALC_LICENSE = BSD-3-Clause
 NETCALC_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
