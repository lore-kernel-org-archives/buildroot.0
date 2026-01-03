Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFE4FC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 17:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D4388108B;
	Sat,  3 Jan 2026 17:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkeluFajA5QT; Sat,  3 Jan 2026 17:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2509981096
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767462941;
	bh=PLGvy+7Be4ElFm6zUmVEcz3bOwNfDb9X6bsMzdQOCEI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=r7C29GL+RReqzu8Qd0sozETpAT4cRkg/aG+4XuAc1eddwwLJmsnazZ2nU6VvmWDE8
	 9VnxdwwwiHsqpuErfu+bkfVVYzhLcXi1hl+dkV+hacUmrMWgXudT5/LQXzUx7rizfR
	 J8I4U4SXv1Jl1G9Be22rcfsBiryG1FswAbWhjKVPLU9us3VqPocwHp+lU0eO4eIonN
	 2bbMXaJDWVyYCbopJn9KMMwN3EoMQ6ANZY3srR4bBusVgQ/4Bl/bL+gI3sCyVtklxz
	 fPHK9eUrMg37CChVmslrPLNpP7SCEsNXwRnQGYAZPvGGD08U5HQZeWvFDC9f8i5iqo
	 +I3TDImvUes8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2509981096;
	Sat,  3 Jan 2026 17:55:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F4DC249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 17:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5101C60774
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 17:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wy-3I0CM_KQF for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 17:55:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6ABE0606E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ABE0606E2
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ABE0606E2
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 17:55:38 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7c7533dbd87so9650799a34.2
 for <buildroot@buildroot.org>; Sat, 03 Jan 2026 09:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767462937; x=1768067737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XE20AY7oQbSQKpOK6kqVkjxWe94FNtDBuBsLyHpYFTc=;
 b=awf5+dd63LtvtnX68+cO3v7IMVqr7poSpXQl8404XEa+d0lK93UVK746fGybr5bADG
 /4zl7ZgKBOB70Cx8OHfQG7oEn3X6eRn7aXoEUOkia1L+A8VN4VXwLmlGNbr5b0DiGZZP
 kmququ4mlLDkZz/AKWFE3xcY/WVA4BqJhxHtKDvJGLmVc+u1rNMvf/m5ntH2Rn5hYyys
 AVNn2y/1V7R2ezxWsGTgYoCizhGr91o8Aixqb4CgRNy24hLOXCDILB8GK9K3ZiXIUWyD
 WiY1RKfuSnJWVOF/flGUn40CQcFezoHQCO3wIDQVJXBvlhiM1QnEul3aKgZLY1IPdPlx
 xo7w==
X-Gm-Message-State: AOJu0YzI9/vdbrU7RNhj3H9fAxjLYg8GNu8IrZEqEo80GnO+ZXhK7XKT
 VJ6Qboerr5v0yu8P/2TuUYa/2m4/uIDSDSmIkYIZkPlBdZBxjSFDl+i6iux2S0Zi
X-Gm-Gg: AY/fxX67wK+hVfn/mvEPdSIpqIsl2MooVX0rZnLwoIuvua3hcnhDLMDnuXYuP0EzLTA
 PjvgRgsSEfmopN+Py/r90O2+Rp7WRekd65nfjnsJJ53k2FkKXOVBWD1tAIV/q+mE46lx2OhWo3/
 CmFEKEslKExV6610DvvZWgefk1E5EReqYuaaVVZqgiYcx6Hz/I8/KYcTk2a6/xVSCAA65Q/2Aew
 uiAzImZDnD2kgYz2auPa19j4XNcygAObWQcDKAR4K1rEM6rdyWtcRU0nZn6RpqmhivZvxCZNiiU
 Tb6LASyLra19R0RHwhiOQznEvWBG6bqpzD1z9WEPQmueafmcnt1PiUEV8r1Cwz/tvlK0/KUPqRa
 nCjBah1QJKZHtFehdqH+jlJ7edCxw0kSOcjL0yoBbuSz8PerCAd1rMbLvkw4E7KMgD44VNyZdgG
 rVws21Zn6G+eJgKHchJ01ePi1qfEmY9nmXbcbEmE8PwLVbeb/q2P+ZSV7THN81BkUJsNzudPkAc
 dPm+ALep5GqT2yfYLteXfA6EuxizIKmARRfn8uOh7sybUTLuxmX34c=
X-Google-Smtp-Source: AGHT+IF9FLkLbnWfUjvt7OEGBxaSdgCC2oJ8jtf5iip7+b4YJ/+U4fZv4pT/SlRL17E/0JUfjcqBrw==
X-Received: by 2002:a05:6830:4c0b:b0:7c7:59ce:d195 with SMTP id
 46e09a7af769-7cc668be171mr26750249a34.6.1767462936803; 
 Sat, 03 Jan 2026 09:55:36 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc6680e5bfsm33598988a34.31.2026.01.03.09.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 09:55:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 10:55:33 -0700
Message-ID: <20260103175533.1988160-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260103175533.1988160-1-james.hilliard1@gmail.com>
References: <20260103175533.1988160-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767462937; x=1768067737; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XE20AY7oQbSQKpOK6kqVkjxWe94FNtDBuBsLyHpYFTc=;
 b=Wtef02cPceAgBUBKf66pDti9Cna2y83xZTwcG9qMqzKp6FKBalceggE+xn5Y1FMvJ8
 LvNWf1sQazaY1StgapUrxYG2T7hzayPWHqpnhy7YgjQkqIa55ViS3URaGSjOXRptpWVW
 i6ausnnnxS8YSgSGCHcqJHV/yvmcI4BpWEh0cT1vacDe18ENxkZGbLeHcBlWWun8YBFY
 W0gSGQy8ZoHRv1D/5eiIeIGamLbbbxGb5j1wej8qgpeM7xOqjy9mpPMMOWVMecECW+V+
 hUgooZqZdRVs5SXTlZUjLNvRmlx9djRnb+HiKJPYaGkd+DTyON+d5VoEsewEx7PafEFA
 YpWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Wtef02cP
Subject: [Buildroot] [PATCH 2/2] package/python-textual: bump to version
 7.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-mdit-py-plugins runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-textual/Config.in           | 1 +
 package/python-textual/python-textual.hash | 4 ++--
 package/python-textual/python-textual.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-textual/Config.in b/package/python-textual/Config.in
index aecf050ec9..103264fc5d 100644
--- a/package/python-textual/Config.in
+++ b/package/python-textual/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_TEXTUAL
 	bool "python-textual"
 	select BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY # runtime
+	select BR2_PACKAGE_PYTHON_MDIT_PY_PLUGINS # runtime
 	select BR2_PACKAGE_PYTHON_PLATFORMDIRS # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
 	select BR2_PACKAGE_PYTHON_RICH # runtime
diff --git a/package/python-textual/python-textual.hash b/package/python-textual/python-textual.hash
index 692e0d757b..7a9c2d403e 100644
--- a/package/python-textual/python-textual.hash
+++ b/package/python-textual/python-textual.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/textual/json
-md5  cb43b8d6d3903ca171330a626cfa05e5  textual-5.3.0.tar.gz
-sha256  1b6128b339adef2e298cc23ab4777180443240ece5c232f29b22960efd658d4d  textual-5.3.0.tar.gz
+md5  e8d6a911d150acdf7b46dc30a1a1d94d  textual-7.0.0.tar.gz
+sha256  617638a2be74fb7507aff3ea6ec9374148be02e5a7bb1d02396d1d557b66c0a9  textual-7.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  94f290a762376dfdb7768e42070618b0abfd2a2799eab1b1c097816c3a39eb57  LICENSE
diff --git a/package/python-textual/python-textual.mk b/package/python-textual/python-textual.mk
index 49cccc299d..77187b3102 100644
--- a/package/python-textual/python-textual.mk
+++ b/package/python-textual/python-textual.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTUAL_VERSION = 5.3.0
+PYTHON_TEXTUAL_VERSION = 7.0.0
 PYTHON_TEXTUAL_SOURCE = textual-$(PYTHON_TEXTUAL_VERSION).tar.gz
-PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/ba/ce/f0f938d33d9bebbf8629e0020be00c560ddfa90a23ebe727c2e5aa3f30cf
+PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/d4/9c/ebc9ca1f95366bef4c0e8360f4a77400d47a79aeecc08747de1990ef8bdc
 PYTHON_TEXTUAL_SETUP_TYPE = poetry
 PYTHON_TEXTUAL_LICENSE = MIT
 PYTHON_TEXTUAL_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
