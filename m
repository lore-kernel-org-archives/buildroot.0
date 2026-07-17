Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D33CC4450F
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 06:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 247B58100D;
	Fri, 17 Jul 2026 06:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k5kijXipJOIF; Fri, 17 Jul 2026 06:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B875A80E05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784269193;
	bh=ai9bRAsvesbBvlZ10oczY9rDYHJWjXGp8VHJuCiHeeE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hMRkTlUxGIhqlP0pZ24Agylx1mgyWj/m9G4ZFAmF6mNykyxRYfSv/RvcAwnQr1hVZ
	 MnAMlZ9kYn3vvfsVlnHp9DX72lhrWQFY50ttiCr635q9L1OywNPKO+f8BRn1hdSQZQ
	 s5CtCHMj+nLW7J7GalfTOaWa2M+XkcsYZPnRhYD1QWsQp6ZiCBv6hk6a7VjO5ZC5Hh
	 4RIXFGOvf9UjWFVNa3/kxQNYbiBjzM1vi72OqEILOYtC9eTaCplVlRc6ElOr9qQr9O
	 zxkkjHvH1++bfgULJNG0BJnpW48GudQ6BHwVais/C3t0kA/IzSBYmZqVIA3hxXXv5d
	 n6Bl2RiPGgONA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B875A80E05;
	Fri, 17 Jul 2026 06:19:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 883FE36E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 06:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E6036084B
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 06:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IePRGw1wEEd2 for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 06:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5956360852
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5956360852
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5956360852
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 06:19:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-49544a80b9dso7610435e9.1
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 23:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784269189; x=1784873989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eW7P/eyghXAwpq3t6H1jGS59WaoXZ36Vd9J3OXe+/zU=;
 b=LMnQd4nlpjKSEFmitSyuQIx+QSn/1f/z7CtbPDNR0Jyb/D3LyfYdhVyAbfIoeIr7ce
 ill2WpXlYzcsSUzkm5LR+k/48sTdVktnDMSUA9ZwWsbf3xzURwH1XPwNCypWTfVdXCRK
 eXiXdq9+WRrtffDsxIyQhx3VE++FEM3OaqranGbyotn5JeiD7oGjjI4o8rY9mxQTDR+B
 /kzVEpUI+LMPrhWQt2geD6uASqlnC3JTMrzYRa7EQMsj3M4vfKlWkg1FvVTupnPXp2d5
 AXUaPH6PRJDf6+IfN1VgaW4OubN4hRAGr4fCx4CU/AV6RXTUXX6kATZUjbWzNDCoJW86
 xY3w==
X-Gm-Message-State: AOJu0YxK+tiVSE1wTrZmfmwoyIQEYWuKuyi+/MQdCpVR2Px6D8zV9JLx
 mAgD/75OaeLaPAFq5bTP1xIb/jD2xKm0e1jdQRsRBlFBjnQAKEJ+WADSvj8Glw7L
X-Gm-Gg: AfdE7cntRfkNjv1SMwovJiSyV6ZRpI9Rk/FcYskyPfGbhjS+ePh7B+4DYXCtZGA18z1
 ahZ+6tjdx0YZYM2WZAwU7yI8uQ9zAINdhtxQxjieNSUyXx75wi/IcW32IdCpa+W48a+UtSHj/eg
 ZA2AxrY8pdBuXIixwywIs1PYDWeNGvgnlI9cn2AGWvTJUeXuQJdcBjagyaaZ/FFEwpNBpBQP1+r
 fbhyzUMXfuFAy97rYIy8a7+bOhrVeTJUnwM4r6ypAQUa21FbafBzC735a3ltEFlkj8zwYYy6h01
 QqsmtvmA+3f5BWpamOYbudNQs8OigxvGE14jmiees3axur7jJd3NQm+lKz1QY0lx98lrWReQsGY
 bxC/wW2oGjwyJ+f9mkK5YNszPM1eg+SaY8agIiqfjbyBmH2YaEjBZSRvqKvixw1gK0OwBSNXkQZ
 ck6jRbeUjx7Z/M+EcCTkhg97u2XHuQx9DlG9iCYYGA5T47vswcrGhYCco=
X-Received: by 2002:a05:600c:55c9:b0:493:bd2f:c5fc with SMTP id
 5b1f17b1804b1-4954a3e4926mr9427935e9.15.1784269188902; 
 Thu, 16 Jul 2026 23:19:48 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954a2b87c6sm35506275e9.7.2026.07.16.23.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 23:19:48 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 09:19:43 +0300
Message-ID: <20260717061943.4491-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784269189; x=1784873989; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=eW7P/eyghXAwpq3t6H1jGS59WaoXZ36Vd9J3OXe+/zU=;
 b=Rtv3l5KvbA5uGyNppkanZVYRvJbza9EPHIt8xqabSDXuP3NlaARwVyV32KHzSrHWww
 Qmzte9dSRTWYMeXHplACJXrFl6HepOhvX7CZPBUnEyI2P3EW+wlVzVq2Yu54WWMvVuRb
 TlEBdf2NHEJBOdsY6OMpthJQDe6bluoNdlqzQZxPRm3+V7cRYcULIkxDSKyc/+AZmnWv
 y/+euounActC7cMXXbG4muHBYiyZzf2PGbk4vnX0OEYXPkKFdhFqdF27gTcBJ96PEET9
 7qaCKrOopNhGbwuamCLQog/hcqtZY1r5ohjxt2AfQzCFwwOMmwD0q7pkBXemtYIgDhKr
 lAQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Rtv3l5Kv
Subject: [Buildroot] [PATCH v2] package/python-snappy: bump version to 0.7.2
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release
on the project homepage, hence the bump to 0.7.2.
Add also PYTHON_SNAPPY_SOURCE for correct package on Pypi.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v2:
- Fix error indicated by Julien Olivain when running make python-snappy-legal-info.
- Link to v1: https://lore.kernel.org/all/20260409152520.5894-1-flaviu.nistor@gmail.com/

 package/python-snappy/python-snappy.hash | 4 ++--
 package/python-snappy/python-snappy.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-snappy/python-snappy.hash b/package/python-snappy/python-snappy.hash
index c4dbc72077..2f40b6c531 100644
--- a/package/python-snappy/python-snappy.hash
+++ b/package/python-snappy/python-snappy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-snappy/json
-md5  fc84cfa3526fba06d66f0d0b2e764300  python-snappy-0.6.1.tar.gz
-sha256  b6a107ab06206acc5359d4c5632bd9b22d448702a79b3169b0c62e0fb808bb2a  python-snappy-0.6.1.tar.gz
+md5  04a4e58b0a932403bb285900e67c778d  python_snappy-0.7.2.tar.gz
+sha256  04bf182f9d9f67b7a846dae2f1df36180ceeee8d3380e4b6799deff5272c4978  python_snappy-0.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a  LICENSE
diff --git a/package/python-snappy/python-snappy.mk b/package/python-snappy/python-snappy.mk
index e80aa861df..b1bd8ca6ca 100644
--- a/package/python-snappy/python-snappy.mk
+++ b/package/python-snappy/python-snappy.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SNAPPY_VERSION = 0.6.1
-PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
+PYTHON_SNAPPY_VERSION = 0.7.2
+PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
+PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
 PYTHON_SNAPPY_SETUP_TYPE = setuptools
 PYTHON_SNAPPY_LICENSE = BSD-3-Clause
 PYTHON_SNAPPY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
