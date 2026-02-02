Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75AFE7DF1A
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 18:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B65140BA5;
	Mon,  2 Feb 2026 18:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuaPQbwc4Xgz; Mon,  2 Feb 2026 18:15:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C48D40B7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770056142;
	bh=jaV16Il5g9TBjV6ptpgjNs/en6eKbFb2+VNIeZcj1bs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=o5cebkwlJOTRA8fJG1dsIlm9j9cnM8pWCx817SqouuDSGNbqtr6vpmu0fFd3/5edX
	 Yoky85rNGwOaLxYW1OqNbHAzqzD3ncGuGp4eugMRNdu9w6nHk+Vn8ocR+zSV6fdb2z
	 99GABC75EsRXcLW1bYekhE7YyviQpVtddfCrifL96dsFbnzfvxYAtXrJLBumFPW06U
	 ZEx0hxFhpu01ZCz8Qpt0DP3gOJeZiQaE/Mpk2BYjd1wqyXgGXt8vDNeXgU8ffCC7fN
	 UAXaGH6xFzOtXp72fBxMMdEVUWgU+zSSwh/Kh8xzHKfHXw+REVdsifJ3V2rL3RC9mN
	 4UilUP2WUqE0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C48D40B7D;
	Mon,  2 Feb 2026 18:15:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56121F4
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3853840358
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CaHeZdNDT7Kt for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 18:15:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B12D400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B12D400C5
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B12D400C5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:15:39 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4806b43beb6so35213735e9.3
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 10:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770056138; x=1770660938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+vR43HPPWUKl2JosrMHJl4WRyZGmdCX8I2k+Va+zbKA=;
 b=Y+ghNKkh84xer6hxbjMTGIw0MytVqxzJso5yibrAqmjRllk3Y9cRIaLycXBFrbAZX1
 WJoJbIDtdMx4VF6f6GeAFbTYLOxZwzLDEafUD9e6bTdscPWEWtspcwkN3ajCusksnOO7
 4lE5GAv6hGC/KdFFz9WjJVhnvxYedrVXkogpQHpy0FB4UhUkPE3g8QvEJJwQJYSYXEiq
 EdYlkVf/hlaqvmOd+aOXULY5/jt/+8cu+FVpG0lTMLga9x6pR5Oj0bB4HtNUrewCalPg
 /LTe2lJZyQxYAPvK+h+5PZ7xGlh4O2BWahwohmfVU2l14g27CQyDl28dhK/J1z+7zocI
 BpDg==
X-Gm-Message-State: AOJu0YyPjD/olOtLz/TmuWBI43DB+wAhLuy7T3rurwjrY8OR7iMfq9d2
 4cjGjeW+12uvqRTp7SMhd1dtgTL6Nm5RJ8cfN5BgyikOaqU45NuK1vyjlrZRmdmbXr9cTNLUZOv
 PNAJ2Xak=
X-Gm-Gg: AZuq6aJVxncdNJgv+COIWe3EZeFP6FtejpMw/Qmn5RdO3yBP6VLMq9zZud0OJYFEw6R
 8UimvIxJf1CUgnW7E9qmHDJqv5qbhDvdZytl4FXNj0xPOCdouCgb8G1t18qNyO1lcMXKaRJXftP
 L6LkmGoJLSkCrAmbEr2iNSDsPXB+rg3wgyDenv5gQ9/1lBLvLq3Pz3I1dzcC2Pfnhcv/QGaKYzD
 eIli7DsyIj7o/0ylx/+HfLiBNa0/o5X2j2a+GiiH3LNOdMILbgrnEjuMo5iWODw0GhyhylhKG/N
 Ks8sbSDr2akeGXRNZ6L25GmSsVCHuiTrHLGj+XwILe5J9SBfFhIiwBQMvXHnFPjJAkoU2yeMfYN
 iZoP3/pEpWDH2Hyqgv4/IvQG/zqfZCxQaEYnqJtWJPF++VPNp9MDQ1QuWdyZYtZCR0LMvg/Mfhm
 S3uVtnDhf/YqJn6VW+JlUe7r6x1e1SF/nuqUkC/tvvHWFapEoc
X-Received: by 2002:a05:600c:4fd5:b0:477:a219:cdb7 with SMTP id
 5b1f17b1804b1-482db213bc7mr166983795e9.0.1770056137984; 
 Mon, 02 Feb 2026 10:15:37 -0800 (PST)
Received: from P-NTS-Evian (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830511bfc6sm12452415e9.2.2026.02.02.10.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 10:15:37 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Mon,  2 Feb 2026 19:15:26 +0100
Message-ID: <20260202181527.2584850-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770056138; x=1770660938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+vR43HPPWUKl2JosrMHJl4WRyZGmdCX8I2k+Va+zbKA=;
 b=iFq/mOl96/mpsHNXrjC8hlUP5TbZudSrCSl3N2NxupYeWHZpFJDdYefHd6LCID0Bnc
 N76hYLUWd6D09EPJk3ZlVwY7MmQfglqBxDylqkorQDvczrHxhIbHkjlSRnWbddIm76tw
 BtfTtIB9+Z+WVBEUEAcmlYlrV7A+MduGREEWQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=iFq/mOl9
Subject: [Buildroot] [PATCH 1/2] package/python3: add optional zstd support
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Python 3.14 introduced a new zstd module [1][2] that requires zstd
package as dependency.

Packages that requires this new module should select
BR2_PACKAGE_PYTHON3_ZSTD.

[1] https://docs.python.org/3/library/compression.zstd.html
[2] https://peps.python.org/pep-0784/

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python3/Config.in  | 6 ++++++
 package/python3/python3.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index cfc08bad86..423e5daabb 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -127,6 +127,12 @@ config BR2_PACKAGE_PYTHON3_ZLIB
 	help
 	  zlib support in Python3
 
+config BR2_PACKAGE_PYTHON3_ZSTD
+	bool "zstd module"
+	select BR2_PACKAGE_ZSTD
+	help
+	  zstd support in Python3
+
 endmenu
 
 endif
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 31b5a4500e..8195f4fd83 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -170,6 +170,12 @@ else
 PYTHON3_CONF_ENV += py_cv_module_zlib=n/a
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3_ZSTD),y)
+PYTHON3_DEPENDENCIES += zstd
+else
+PYTHON3_CONF_ENV += py_cv_module__zstd=n/a
+endif
+
 ifneq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
 PYTHON3_CONF_ENV += py_cv_module_ossaudiodev=n/a
 endif
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
