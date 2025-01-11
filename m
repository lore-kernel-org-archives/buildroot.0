Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE10E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEA3B6121C;
	Sat, 11 Jan 2025 17:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NrwXru6YUMN; Sat, 11 Jan 2025 17:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D77366121B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D77366121B;
	Sat, 11 Jan 2025 17:12:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5E3D942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C15404013D
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xxc07JqhBQ-z for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:12:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A357540017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A357540017
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A357540017
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:12:25 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-844ce213af6so95367039f.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 09:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736615544; x=1737220344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SFctpYQS5uTm82LhKEQHDbwhSVnZyFuFwe8wv5BWl/E=;
 b=sytKRLtBQqADCzNqqQpVS6NSsrluqEY51U8bum9rRr3Nrk6v3Cx2cFnx5LMzLWtjaP
 YpgrA6vxzFDgnJzNvJ41/lIWX9cpRHpO4o/YgT+bS55yg7EjBGFTP6YIp9wlPp6S+Ezk
 NrdqmYj1hy8RpNozOisD21FBIDMe5bgtxI8uvUv6OtnbBtquJPJejRKsok6UZP6z8BqX
 ZWarJKltdOuwywjG64gNF5rZomnx+TpPLbw24o4MtgNV3qARdodwS0fbyj2sGw4vflfw
 7CLSZH9Z8ajRnLyLfl5Uwug8bjorKym5Ct2tNsRpm+ck+6CLnHgxqUmzkYUV2lxM+ctG
 CZZg==
X-Gm-Message-State: AOJu0YzMGAWJ46YsoGBdyoCWi7hmv4JoRYHVUyBoeZhqLrJ2BOiTJRDH
 Ag/NRsjxtkGWGa2SGdJXSS1+d9K2dZwb0t4ZKJesdiN1eX0pEn3Qk6nW1Hli7ZM=
X-Gm-Gg: ASbGncv5hGL54y1y+sBE9vjLQTVJjyyEsfnQehbch9agufBubihd32A3XKHtDNhyycG
 D0C+jmYNe4PJ2eFBx0sqfBBHWfRfYZOXeLZYPKeOo60Fm0TD0EEwVzy4fKUfzq4txEH2fe4kva2
 BJvTGIYNR3G45zvmaEgcmvJSXIPD9oKkdIQ+cC5akjJpjOxyJ0zhaYCMgtgBo1P9pjNSWoYFnBO
 ZI4NkA0+uef9asRBYN+4twS22sF1gBcr+kuUc65WyKlB941v8hBlN6Kb6QrZ78Nbqt3x31RM62v
 uyvujAFNa6LwgU32aOqdDDJzTnPlywU=
X-Google-Smtp-Source: AGHT+IGmDhUG8y0SpFO32YtLW2HF6TaTQVZ5pTbfZ4i7/WYCjJLDeSp43DOVgwpwXmD1ywQit4L61Q==
X-Received: by 2002:a05:6e02:1c81:b0:3a7:6636:eb3b with SMTP id
 e9e14a558f8ab-3ce3aa5ad65mr104270105ab.17.1736615544419; 
 Sat, 11 Jan 2025 09:12:24 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea2bb07a36sm891854173.28.2025.01.11.09.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 09:12:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 10:12:22 -0700
Message-Id: <20250111171222.2906306-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736615544; x=1737220344; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SFctpYQS5uTm82LhKEQHDbwhSVnZyFuFwe8wv5BWl/E=;
 b=LjkWUVOyq7ORB9vgZH78ZK5+JZ40KZ55C0OpUTdtxqhQUuQUE8ZYbIg8p70IOoE+H3
 dfQw6mpXbvmTcHGNW+9rALbyp0RjTLmlOqTxyZo4DhXFhswOTo9UzKGuUnJqkcuWRKC0
 ukctmj2HF9IeJDMRyvQAWA2Y7QTpaNOr/QpDx4hWeHvfQ4SiFxbeQiTnqUUJGPYww1ky
 /tcBCPeu3F7y6JsomykgtuysuE26m0+zYefojLoIbU4Wy6yKXZZnYFTW8Ka3sgAIcfH5
 0nsDcIRWpJB0NUkAgydORxfUPdS+5y/HpjOvYvcpd5KvzGFU079gLpEt7zVLB9AIIZcN
 Xn8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LjkWUVOy
Subject: [Buildroot] [PATCH 1/1] package/python-sh: bump to version 2.2.1
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
 package/python-sh/python-sh.hash | 4 ++--
 package/python-sh/python-sh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index 79a34056dc..4ed2464260 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sh/json
-md5  eba6bd8ec843a707bdc481577835980d  sh-2.1.0.tar.gz
-sha256  7e27301c574bec8ca5bf6f211851357526455ee97cd27a7c4c6cc5e2375399cb  sh-2.1.0.tar.gz
+md5  d1bc1f56e6a99109fb0f589aba574cf2  sh-2.2.1.tar.gz
+sha256  287021ae84183dea49787985e33797dda7fe769e4f95f2c94dff8e245ab4cb00  sh-2.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index a59c6f1324..84ad1aec63 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 2.1.0
+PYTHON_SH_VERSION = 2.2.1
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://files.pythonhosted.org/packages/52/12/b7965006c5adc57ba5459385358bd27c4983cd490884a75be86eb1d3efeb
+PYTHON_SH_SITE = https://files.pythonhosted.org/packages/bd/30/abf254f7b56ba7bcae938767e3ee0f54d220d931a35a8721de350b76dec5
 PYTHON_SH_SETUP_TYPE = poetry
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
