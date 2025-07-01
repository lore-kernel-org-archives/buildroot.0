Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773D5C83F0B
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 16:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FE4A81EAE;
	Tue,  1 Jul 2025 16:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69blPNfgncmC; Tue,  1 Jul 2025 16:21:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4871E81E11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4871E81E11;
	Tue,  1 Jul 2025 16:21:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1BA4179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 16:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF32140883
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 16:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QghIqibHRaj for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 16:21:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B81F540872
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B81F540872
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B81F540872
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 16:21:32 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-453634d8609so42089155e9.3
 for <buildroot@buildroot.org>; Tue, 01 Jul 2025 09:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751386890; x=1751991690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lNIDF5pTrmCYLs/FmjzgxJPlZdRlZ/Da+nBxtyV0Als=;
 b=dpjnYPivHWmb4LJjjfEUsNXrWs9x7Z+bUbJJKDoTQyD8lEo0fYomGsYeA9RBYwVZXZ
 bXnhpc9JHrJ3hb6Oxel9sS7xkKAALG+WKXOjg7EX0gmUMsOlonBA+Ki8L3v02e0bXLeR
 Fl6/swsD+JzalUw7VWyFLq8RlBxBoaopKwpwMdMyaPUVNWvWRtoplJXpHEZNTjnpGSH+
 QV1X89ha8dsN/EurBK0labW5FPrEulrnPnV0Ycwq2cx0zS7ONmzXKfLJHImGkDsO2TH6
 d1P+s14LZlLhneECmiGbGaX4rTcUTFh3PEGd4oa1BYlBwXZyPdHQEnWbI00WnghPERYe
 fivQ==
X-Gm-Message-State: AOJu0Ywz82cukm7xpKFxIjqDhr+LnaCj/jWmbLvRBalT1wZasaDv9E8d
 Jm7QcW7wLdHejZXn4fsVa/hJn/KtX98zlk/sr9zmbXRV0gUM0TZ3FOvJSY/12DEHjMuKahzOpqt
 r1xVd
X-Gm-Gg: ASbGncvmeIGdsSabiJBqAxT0sNSNZ9FM5aL1/JYVholtciHTV+Emo2Kd3eDL8L9Hz0t
 tiiTyxDTJgKhERC23zsURoLaRTHq5CIXzzolTMNTSvM33vfJYpEaC9eG8YNSOgOzR7BM+cwXWaN
 aqcOvNjsdaLMZcqsgyaSH/46Ff2Sc9Y4vxX4t5MnKfjjmsiM0SwXoezSjWH3Q9EyjI4QYiZFt7e
 pbjcmEnZRdBg54OddzxkHnvSQyrerqJRbIzXOfzeLWAkVomnCZd9yUyEuNKUesJ2b3NLd8JM5Ox
 Zc/xI3L/TKOTX8igBXC+S1Z7PlCSQ+vWkZZKNmk8VBJr1Qc+OHe7DNB6tapawKzNU0rOP9lT6R9
 Jjwd0R0sTvMi2J1cw2A==
X-Google-Smtp-Source: AGHT+IFs8cVBtOJsp4+SyXUqS8y7uTB9cD1dXE69RSdiGUcm3UNGlO3XHCKjlLE16L2lBXi5T57EcA==
X-Received: by 2002:a05:600c:8b52:b0:43c:fa24:8721 with SMTP id
 5b1f17b1804b1-45390699e19mr194899995e9.17.1751386890447; 
 Tue, 01 Jul 2025 09:21:30 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3b2fd7sm173743285e9.17.2025.07.01.09.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 09:21:30 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  1 Jul 2025 18:21:16 +0200
Message-ID: <20250701162116.1319941-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751386890; x=1751991690; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lNIDF5pTrmCYLs/FmjzgxJPlZdRlZ/Da+nBxtyV0Als=;
 b=K7U716kBMEUT8d5tiL5Qdzcp7Yms8G6rhUVjTkqHefIDcUyIofHfpxnNWcGv1oiPhj
 Epzy9k5cEk4mVZ/mswJE/AYJoe3SVGsJxuWyZDS7+3+avCrCv+1qyl6cOp9wud5l1/j0
 q96b2SkVcJ76+sXdoJWjJMA7tlTROGfZVCdkUAGxjcUdj7B69TzcGZJfJULpjrffIIRI
 XEsdxawf2ha5ReZoPsLncI2F7ZgcEjaMaWlMeGmUeaMWOxgsIZp7sgI07xBZLLuhzrdo
 yAQE4Vnf4qkOjoCEoctF+H8a3WQ5MYAllchs9RHKmZgHDmJqtZjdHG/IoVBpDsSUNel4
 0FPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=K7U716kB
Subject: [Buildroot] [PATCH] package/python-urllib3: security bump to v2.5.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerabilities:
- CVE-2025-50181:
    urllib3 redirects are not disabled when retries are disabled on
    PoolManager instantiation

- CVE-2025-50182:
    urllib3 does not control redirects in browsers and Node.js

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 2391108e26..f4162882f7 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  787104cdecd70e6688713f8a079ffd3f  urllib3-2.4.0.tar.gz
-sha256  414bc6535b787febd7567804cc015fee39daab8ad86268f1310a9250697de466  urllib3-2.4.0.tar.gz
+md5  2b8a86438e4d35fbc90572dbdb424759  urllib3-2.5.0.tar.gz
+sha256  3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760  urllib3-2.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 7294742909..9ec6c7f3c0 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.4.0
+PYTHON_URLLIB3_VERSION = 2.5.0
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/8a/78/16493d9c386d8e60e442a35feac5e00f0913c0f4b7c217c11e8ec2ff53e0
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/15/22/9ee70a2574a4f4599c47dd506532914ce044817c7752a79b6a51286319bc
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
