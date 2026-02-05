Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBC8ECD995
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 18:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 071B5405A6;
	Thu,  5 Feb 2026 18:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMoWlsoso85b; Thu,  5 Feb 2026 18:26:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23C07405E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770315980;
	bh=aKpQI5lvDbSrSsEvMa/+6c8LuxLoMU1KtDz/IHq71a0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TVBS1x0uK5y60C0SlrgvWvZXTFpdxs4vlDb+H99wi+ICLmIC4RMoMJeZF7HmH44gG
	 pNnPpvQl3GHRVNv1XaLpv/1VPdQtTJujeNLDOnqqc0WjCJkY38aq0twWQuz5dHa+Cv
	 8NgbbUUHCDjUULdAx91swmh/JjXriPHVpK8ikXNcyzbD/uod3p2ww8XXNUpqHjFsbE
	 mU/TW7N29WiaGBt9r747diYIZkx9H12JTjDlwgByaMHIp1NUSwrgCJVF2Yi/I9zrPq
	 d2q0rPQCYZJFYDN1T+uf8NP6JqrcZIRV4bqFPKvf8wMDRMTViy01tNFRqWqhsrHZUH
	 ry6tP9Rf9K5aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23C07405E5;
	Thu,  5 Feb 2026 18:26:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24C2E17A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 18:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 091E4405D2
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 18:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dO7khAo4L5mg for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 18:26:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fbstachura@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD2A5405A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD2A5405A6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD2A5405A6
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 18:26:17 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so12492105e9.0
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 10:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770315975; x=1770920775;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=she6AQUed4lTfVp2pe0XMX+nwxplRTEWSZbryCVi1ow=;
 b=GayKfbAsHrgIXLFQiG9jhdOzBdiGWASfCGcsgEdP6ETiYSkJoWlHRgurntnuejm0Nu
 6pNtHcGy0d91fLW6CvQup1hltERvmnKkG6YHsllIwmyPVfqeYendyvGnvFzDdzIm2aBO
 St/5WiGEYI3NozR6wokp0xJ8A2EFi6TNOH1UFNm31HrwjjIguGdAgYVZyqVAWI+0R+QB
 f0SuiLYCFhxChK6+FG5QsZ/bW1vPYf3cNC1SXljydPLa6XfaBBttza8ArhGWaYS5n4kE
 tZvVTcfYckmqWFoI/uyXMQn92zNrDz3O+XhIZpI8uz1UQu3mCG/SZDfUtBPWAvigNlmd
 jykA==
X-Gm-Message-State: AOJu0Yyio9EIVl3lBnKWBLsQdWyY8OmsbLUNFuCpYIZtTOnFHKjhYOHn
 PcmXrt+1fReYUGGLXjB1Cc+3rpjViVuXKS+F2yTn6/V4pVwbRMHcmeNUTpd4Uw==
X-Gm-Gg: AZuq6aIPhV9G7ose6PxjhjYmd42CQjh++GkQaCRiYWNIqeJzX2jg2jJ0HrIW8cSlHPc
 w2CXq6QRRo5p+il8zz/JKzdwhc+7zgNFauWR5ThJBZ2vikxzJyg2E50/yCYL7aDEgVaJ2pUHqav
 Z9yNirUtO1HSNL1EcKujMehBQn/ItVjSBjDTA8wE3RGUwZuT8omfF8p2Xqseo3Mdjb8jLiClX60
 NqPC050wynmjfhlkzd6BGhjmsuQX2hEz06HB9COARQDXMqZOk449ty+gZSsgrUcQomR9/jH4v8l
 c4gOGMF0DlfyFDcRwgBquAcMWsiiYVR3SEoFRp7kQhjwDESQSXkJ0aQW2H5aQjem/H4i5xHNlm8
 VqojDSlZq0qAnoCvWJdBlE3qLXsB7xPC8ROgxDSgLopG3j2R6baywm2PUJuek360bRoYOqBtb/v
 lqu6g0gLHq
X-Received: by 2002:a05:600c:492f:b0:47d:7004:f488 with SMTP id
 5b1f17b1804b1-48317917840mr33271565e9.10.1770315975437; 
 Thu, 05 Feb 2026 10:26:15 -0800 (PST)
Received: from trial ([2a02:a311:4383:f700:e3c5:29dd:2134:1c1c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d2ba61sm110473055e9.1.2026.02.05.10.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 10:26:14 -0800 (PST)
From: Franciszek Stachura <fbstachura@gmail.com>
To: buildroot@buildroot.org
Cc: Franciszek Stachura <fbstachura@gmail.com>
Date: Thu,  5 Feb 2026 19:25:51 +0100
Message-ID: <20260205182549.3299927-3-fbstachura@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770315975; x=1770920775; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=she6AQUed4lTfVp2pe0XMX+nwxplRTEWSZbryCVi1ow=;
 b=ILStY4llQN6Y7Lq+8qo2cmuTC/vtwYMdiXkJ3cWnqXffROYjJd7UJaQrJmUgxxwIEj
 Lyz/KLpL0JzvkGIXlgYjOSJ92qJGdl2piqAgA1/ciwsBr/U76zcT7WFUabNAH6mZKDxc
 jMYM6+Ti1GJ57Ra6LsQgdW/Q/XlPOQcezJkmKIZ+0hYGnnyvoRxHwgV4Vzv6gJ2K24mr
 eely9S6zMtlQB4l1mbm8C71wjlDyh2H9SCONT2aKtt3ZfybXfSGvrerYlgi/4P8LILqX
 7qmoef0JwuVNLhRrd6FGt2FwGkOlee+LeV4OZsUZIDEHxZaAExp+FzpDJ4p5B0/Q3ePp
 ZnCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ILStY4ll
Subject: [Buildroot] [PATCH] package/memcached: bump version to 1.6.40
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes are available here:
https://github.com/memcached/memcached/wiki/ReleaseNotes

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 781897b6b7..fc6ad5eb88 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.29.tar.gz.sha1
-sha1  a9699aed111d86b6e37b3ce5e6ef4e7539582d5f  memcached-1.6.29.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.40.tar.gz.sha1
+sha1  f2513db7079ee4c6558eb11fabb55e1adf1fdf38  memcached-1.6.40.tar.gz
 
 # Locally computed
-sha256  269643d518b7ba2033c7a1f66fdfc560d72725a2822194d90c8235408c443a49  memcached-1.6.29.tar.gz
+sha256  a3d360e9da2221a49bf9aae4e6880f2d44da6b2a2fae39b1911b9ca76488fbfd  memcached-1.6.40.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index a01d5aa9d6..d3ec9d36d7 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.29
+MEMCACHED_VERSION = 1.6.40
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
