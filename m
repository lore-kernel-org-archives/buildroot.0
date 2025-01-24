Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556C3C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 18:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2177760849;
	Fri, 24 Jan 2025 18:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRnr5YC8cj_u; Fri, 24 Jan 2025 18:53:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21ACB6082E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21ACB6082E;
	Fri, 24 Jan 2025 18:53:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BF61941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D5E981E71
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSpM2oRkeApy for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 18:53:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78E3581E6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E3581E6F
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78E3581E6F
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:53:54 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-844e12f702dso64976939f.3
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 10:53:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737744833; x=1738349633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rMU7g/ubBydsfdpm2QNZvZjWyDfXH+e+O6u9aFS2HDM=;
 b=jaA+N2kPUj6VzQkDzD1d8+GkjwSPxmVg/4ItiU3oGTmy181OkstmD1rqIYVqKrhBZm
 v3CNyAv1v+CJzePdJys0gjkveQtJZ0J7ih8pyf7WRDRQFLKSTg8UINKYM+N39LhKcYiF
 oOiTU8Ohn5WPNbPw7uVYle73GqVp/wcQ4T9PgGYQGLybeLDA2C9H+dNHRQcnFITs9C7q
 Nf7IS2KFFv1A33HH+7IWa1ue+sGL4xaKt7jpDjvyu8ldLeyk3NigK6jzVodV6lS5IUYr
 syU7YtAatjKqW3ALEoUjm0p2PEphld3k9a1uYweiqtvGMquGAgPiXb8zXKXpkBbXnT5H
 guKg==
X-Gm-Message-State: AOJu0YzbCtYokdFKC0usGlaoFu0u0MLZSwdA8QtB2blJWK4A8uy/PGq1
 VIGnK9af6dPIU/EKiMlYK849BlJLzxAtTHYONlFQHWHZsE3Rzsqt/2oF+RRO
X-Gm-Gg: ASbGncvMgbTT1yhI0GcnwymxlSYuOK1S0bNmCRdwkhEWtBcIzrcvMhQDRLeQjgufFsS
 2DpwV1CkV+AHoO89Tfkm+W6PZ7IPg4ftlFVQttbFbZrlX9OENYTaER6K90uJoRrt0ykOVcsRftv
 4qwvt5QRteRvAjvrWG4wDoR5CjjLQwD7IOZbqX5wQMFDc3EmkRuMl38jPCAYXd9jcxvSh/CnrsU
 CeXU1Ch0EIAweJeava/XZM0pTk0NGA9chVewyxywCRjz4cn6+9cvsi35SwzkNrSan+tfk/nIbA2
 ZfEmx6vJAKeofWE4LbL8RPc6OnWyequPxaufyGF2womlf0HrIvBQfY0=
X-Google-Smtp-Source: AGHT+IHtxXpBf/fyX3FLR3gpUlOhzKjxsLFedpFDsCddhMkeU46WNH0ydG3wqOkDGVpE6DCbWyhkKA==
X-Received: by 2002:a05:6602:6cce:b0:84a:5201:41ff with SMTP id
 ca18e2360f4ac-851b61658e7mr2651898839f.3.1737744833076; 
 Fri, 24 Jan 2025 10:53:53 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521df2d479sm84385839f.25.2025.01.24.10.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 10:53:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 11:53:49 -0700
Message-Id: <20250124185349.3800744-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737744833; x=1738349633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rMU7g/ubBydsfdpm2QNZvZjWyDfXH+e+O6u9aFS2HDM=;
 b=S3DOrAvQlwvwdj6M0RGv2ml8RQcAX7DXUUhLSEkN8FgzrWsoItNH9DKeq8WooZhSVl
 lh4Z3acwTV3Aa+9a35ffJtIdQY5BclNx28jpjBdurqMOLr9n+AmK+qVvBo0IJiDU3QNy
 +0enTTVJaKwHRWiGMo5kgaiEN+ukzdi8Iq2Ghij+wx/8z3Bbs2Z1v83d7z5MnUirmus4
 Iavn59vrNtOOBVk/ZO+VbId6ibaC5jmYPu1MHNHAI2CgZOuWFwunnuxO+OAL/KYrB9ej
 lqfU2uTOy9DW8Q3vrOwSlcrFWiQshLTqrMC+NlSO0kUH98mpqMII++R/liBwZZyrvD5j
 m/oQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S3DOrAvQ
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.55.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 16209aaf84..8d674490a8 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  00874aa8f3bea8d706bec0e6882c43e2  fonttools-4.55.3.tar.gz
-sha256  3983313c2a04d6cc1fe9251f8fc647754cf49a61dac6cb1e7249ae67afaafc45  fonttools-4.55.3.tar.gz
+md5  594a6c4d008aa227f0bc38ddcd121722  fonttools-4.55.5.tar.gz
+sha256  87afe2a1e81a55131bbae66f3f1718b1faee3218b1261abce036d7d189094c36  fonttools-4.55.5.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index d235cf8869..ca8ba46d76 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.55.3
+PYTHON_FONTTOOLS_VERSION = 4.55.5
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/76/61/a300d1574dc381393424047c0396a0e213db212e28361123af9830d71a8d
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/8b/d0/6a515b1587f2fe3540429120b20c674687e6f5fdd7dbd114f0fca224294b
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
