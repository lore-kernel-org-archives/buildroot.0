Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00194E6F06E
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 16:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BFE34243C;
	Fri,  1 Nov 2024 16:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mqf4MfOU3KdR; Fri,  1 Nov 2024 16:49:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C80D42443
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C80D42443;
	Fri,  1 Nov 2024 16:49:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7362C60
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F45F8200D
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_taWjob7Sbg for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 16:49:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60DDA81FF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60DDA81FF0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60DDA81FF0
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:49:22 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a4e5e57678so10812805ab.1
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 09:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730479761; x=1731084561;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=imQ389w2SeIC4R8w5L7faD9ysy5ClUFqVjMT5RuXx44=;
 b=PkKRS7gaECSaSpEG98s3WAxh9Mayl+uyGBa2nt/9z7faRKo1VCB8gVPTMimZ2JBF+j
 +60jHqTpTE8kCID5Ps3oHNtESojyAx4XgS1mIuhAGU1Dlx5Xq19yXOElGK+ymbt1cdL7
 BxJFeCTI0ak+qA3vlg5srHC1a/86HZy/yhrrWSjbgnlZIYEtlgp7F8CIUddo335uu4Sv
 syHl92tsgo85DeJRJRSbt3CtRUEunIRLNuoRNEdCotLkQjdYelJ47TmTkayo8VA4HbRK
 Q9pA6/B+uf4A7Nvi+BfMyXenbhv3W7xBP2u4CxL1ESjvSRRH7GkEOTPVNLkBU+Mwh1oC
 6miw==
X-Gm-Message-State: AOJu0YzaHtvvhqiDsrNqHDCWP3X/AitooCbgeq7m0YOOVk8v7ai1CGN6
 CBPubIOi9RbgSnKboIBmxVLBHAk5hMjPRCZUi2Qkivnx2EwtVG93lPhsfw==
X-Google-Smtp-Source: AGHT+IGJwBj7MCeIfMSq1or9noJ4WN5YQblEqAXqcV3sFLiNX5SOJzaRYIhcaIWdv/dW/58bR6a+Yg==
X-Received: by 2002:a92:c691:0:b0:3a0:ce43:fb62 with SMTP id
 e9e14a558f8ab-3a6aff71f01mr28961525ab.11.1730479760808; 
 Fri, 01 Nov 2024 09:49:20 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6a97b011csm9191385ab.14.2024.11.01.09.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 09:49:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 10:49:18 -0600
Message-Id: <20241101164918.378307-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730479761; x=1731084561; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=imQ389w2SeIC4R8w5L7faD9ysy5ClUFqVjMT5RuXx44=;
 b=T4LfWCxEW/w38tSyfDsDQs0BE9ztc4O+SxOA/dmqWjqdJe1H9FVbKBRpByRWA4yw/7
 YbFmN0Vkj9l+KKWxpZrka73lm9LB2Vcnx5mg6Yril7gUmHPXFCkuLCetlf5ilOFuPIkV
 VpFvO4liwRoJKaVPKWrOkBKf8YC2YMXaGPJpnEqAJJUZuEGQky54KnZ5ooAgNQhe3Ahu
 aBmhhVtpySNVYH2v/zeKqCy1AIg/XfRfT0kxuUFaqPpp45w12VT3RMNv61ijeOC+/Lme
 +rJcxuBniDK7XhBK1HTRndwKFCN1ikUMabFPcuE/nbxcFeMm8wWWkavW2L98YqXNiOWE
 Vf6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T4LfWCxE
Subject: [Buildroot] [PATCH 1/1] package/python-colorlog: bump to version
 6.9.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-colorlog/python-colorlog.hash | 4 ++--
 package/python-colorlog/python-colorlog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-colorlog/python-colorlog.hash b/package/python-colorlog/python-colorlog.hash
index 8750149f75..464ec55321 100644
--- a/package/python-colorlog/python-colorlog.hash
+++ b/package/python-colorlog/python-colorlog.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorlog/json
-md5  0e1097df510644310e09593929e89096  colorlog-6.8.2.tar.gz
-sha256  3e3e079a41feb5a1b64f978b5ea4f46040a94f11f0e8bbb8261e3dbbeca64d44  colorlog-6.8.2.tar.gz
+md5  eded3e4cf270c1d1fabc170826f4d735  colorlog-6.9.0.tar.gz
+sha256  bfba54a1b93b94f54e1f4fe48395725a3d92fd2a4af702f6bd70946bdc0c6ac2  colorlog-6.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b1d9082bc483623fd59fc7279b457f0e40d942a76426cde257239e04dfe4125a  LICENSE
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
index 5289c08cda..c23e1c720f 100644
--- a/package/python-colorlog/python-colorlog.mk
+++ b/package/python-colorlog/python-colorlog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORLOG_VERSION = 6.8.2
+PYTHON_COLORLOG_VERSION = 6.9.0
 PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
-PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/db/38/2992ff192eaa7dd5a793f8b6570d6bbe887c4fbbf7e72702eb0a693a01c8
+PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/d3/7a/359f4d5df2353f26172b3cc39ea32daa39af8de522205f512f458923e677
 PYTHON_COLORLOG_SETUP_TYPE = setuptools
 PYTHON_COLORLOG_LICENSE = MIT
 PYTHON_COLORLOG_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
