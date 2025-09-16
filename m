Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AEDCAC597
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 00:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BE8840A0E;
	Tue, 16 Sep 2025 00:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3czoPzksDkb0; Tue, 16 Sep 2025 00:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE75440A37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE75440A37;
	Tue, 16 Sep 2025 00:50:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 426A2199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2817240A37
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEjUY-pqEFf5 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 00:50:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4874240A0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4874240A0E
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4874240A0E
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:50:08 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-42404af30b0so8839915ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757983807; x=1758588607;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zD47zG1FaP6eucaF8KfE5TTHFcHtjO210+vqxMo1z/U=;
 b=LabSeIc0UmtWXclAQ4nOYKWCnsX8h7hasBfE6Ob5nR5r+V5vTnNc6asXYCY/MWqu/o
 nMWz0fo1Vup23aJ9p8UY0Gj1RKVxsUwLfdlLjB53m5wwMUUKd4oWP/r2xMIQ/Ddy+Wxz
 BOT5TVvhut82Ep4/jcRpv1MQM9eks8iWVn6PZWGdyfGwiYpeL0+4CBgz2DtUl2oYwz+y
 LayiuPUzwzKnZzVzk/y/CGpfq2OQkJzC8FYXzYv9DooxqnIhfiQwvnT2Fv8VvipxmSn+
 3WVILQuZD9CvxIjSqDYhd2fCR06AKrhdcQtepivJyyx/VZQk/XIU8agzZHVx3in/N3xZ
 nPPw==
X-Gm-Message-State: AOJu0YyeHmZfiOak0ZJGifhJyKqIakzV5FQGxD7M/xpDFvOeKaUPZ8V+
 fwYxuaCCmy1Ya187eD3iZ+zY8hZpq/ewmm3dcc5yGVfwbxdJ/1JTNpQ1OC8yjw==
X-Gm-Gg: ASbGncsSbS+zY5gRoZ65ADOHemN7uPpLjtiBUOMV81n7tVY50Py7RTFzH+jD1VrarQf
 x4ZNAxJ6C+5xVRMlqP3Ot+VFcc8U+n73axABsXwtm9yn4CTZ0HjsfIJKki7Gs8/v7vrIZ9kP5kk
 jC/10C8bwAiuMQTvSK5KZgYPAm0dy/5LbgFPHDylwFyYm3qW+bhi1o23ALAih0/HvU9RruXeNjz
 fYYkJOciIGOpimPeZ/SY6UJVvT6e+W3Z7/PpZzlputu+PilzxsSGSlr11UJiXHBATnAE6sUFq5I
 /lzFWT+3HeYXEuMQCG+zYVomOa+7kDla+8TJR3dKzDm7tL7T8QId2QlcoMi1ihmIMUDgG53TwgW
 g44awaXku/gNCni/gDc+obH6fC75lrbm/zsLr/xRjxx6NtwQXkzJwfGaGr3HcfSyiDj565mBDKa
 u3
X-Google-Smtp-Source: AGHT+IGoUPkGtMF1ygGyeNfqHw3zqp1hdM1/IHhSi1ue3AH/wo2kU+YbXDp9N/kIbC0vpI/ROodsiw==
X-Received: by 2002:a05:6e02:148e:b0:402:b8e3:c9f5 with SMTP id
 e9e14a558f8ab-4209d31bb83mr166496955ab.2.1757983806881; 
 Mon, 15 Sep 2025 17:50:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-511f30675d5sm5364825173.42.2025.09.15.17.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 17:50:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 18:50:04 -0600
Message-ID: <20250916005004.2532218-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757983807; x=1758588607; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zD47zG1FaP6eucaF8KfE5TTHFcHtjO210+vqxMo1z/U=;
 b=Q20TcxdAQJRVRu0Lqh3tUFw4mJfx+7rUJ8uG2SFONs7jE9Zpv2gZaLl3Jd8t75HA/O
 0ejkKewWiIpBLc0r1wGmKtDCWzNSvcS0SWxerzjxiKnQ9CffY1fsboBXCxH1KJWj/gW+
 kK1vSR0aHXXpjFXl6sdVI9wgMc+h+FmNXb3gy2DG3G/RtXoMYHXmRKMiCGHspw1TV6Ly
 1FrfIOl7Dvh1J+h3l2wR0nlCwkCnaZa4Zy2MNHMGKAgdi/FTA2EavlHa6HZdPbebOGb/
 NeOx016OWYXeGw5XSEaqrLPDgigcbbvMG/uzcscUiJdN1b/p/M9Qn8rwcBEZ+l5hZfXA
 uCqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Q20TcxdA
Subject: [Buildroot] [PATCH 1/1] package/python-qrcode: bump to version 8.2
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-qrcode/python-qrcode.hash | 4 ++--
 package/python-qrcode/python-qrcode.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-qrcode/python-qrcode.hash b/package/python-qrcode/python-qrcode.hash
index 549e077c2b..21076091d7 100644
--- a/package/python-qrcode/python-qrcode.hash
+++ b/package/python-qrcode/python-qrcode.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/qrcode/json
-md5  71039efd5939238780bcd6861bf0bc50  qrcode-8.1.tar.gz
-sha256  e8df73caf72c3bace3e93d9fa0af5aa78267d4f3f5bc7ab1b208f271605a5e48  qrcode-8.1.tar.gz
+md5  c1dd482e98405aa0aaf4d5cf5685f57a  qrcode-8.2.tar.gz
+sha256  35c3f2a4172b33136ab9f6b3ef1c00260dd2f66f858f24d88418a015f446506c  qrcode-8.2.tar.gz
 # Locally computed sha256 checksums
 sha256  40dfb903c94ee3f789500131311186548ecba5cefd3557623d7700e2522ab994  LICENSE
diff --git a/package/python-qrcode/python-qrcode.mk b/package/python-qrcode/python-qrcode.mk
index f50d49704f..72c54b5339 100644
--- a/package/python-qrcode/python-qrcode.mk
+++ b/package/python-qrcode/python-qrcode.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_QRCODE_VERSION = 8.1
+PYTHON_QRCODE_VERSION = 8.2
 PYTHON_QRCODE_SOURCE = qrcode-$(PYTHON_QRCODE_VERSION).tar.gz
-PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/61/d4/d222d00f65c81945b55e8f64011c33cb11a2931957ba3e2845fb0874fffe
+PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/8f/b2/7fc2931bfae0af02d5f53b174e9cf701adbb35f39d69c2af63d4a39f81a9
 PYTHON_QRCODE_SETUP_TYPE = poetry
 PYTHON_QRCODE_LICENSE = BSD-3-Clause
 PYTHON_QRCODE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
