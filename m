Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599DACA0EED
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 15:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 110D141488;
	Sat, 23 Aug 2025 15:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLvNyD3gBVp2; Sat, 23 Aug 2025 15:05:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B38841480
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B38841480;
	Sat, 23 Aug 2025 15:05:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9C3B19C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6F7F6128F
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtvPWx0ItGvL for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 15:05:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F0C7F61289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0C7F61289
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0C7F61289
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:05:48 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b9d41c1149so1829026f8f.0
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 08:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755961547; x=1756566347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nxsH2ZaLb7PRf8OArCfnyWFSijDA7h4jP8EGXEgJBB0=;
 b=bMzJNMf9W7tVqMs60vKM6y1uw3yvLhFXMNDJCbeFJxAH4XkptXJk305Bdb1seS9VPr
 nGJq53gKnscdxcyyXOMJi1jv7kCHf26UjVrAfcC1z3dL/8XZAJif/xJF6sZhGu6wL/lq
 en2saFm+9vUDgttH+EoZx9+146OJ9lhvrkWE3GCvEAmRWp6tpJkXIIpRA7r6Vp1ZwOtW
 KZKMfdFBVsphyR7Lf4iEf89ecnZfiITohg2qQGXnqcv19t91imEgcY5AIUz2FgjxguTg
 gX3vJgV9Zv44y5V/1EVvFW0q6VOcx9WqvFlxYWnLB6b8e1qIY08zavK2bKc/xkkXlykx
 D/ug==
X-Gm-Message-State: AOJu0YxIWBxHgxkcCzT3qJYnWQ1Gybz4lfC8R4vab+XyWFxnUrRpkzTT
 mdnpI3Q6en8YiQtSR73RspnwiqrPM4AOiU68FO6ll/cn577CjlKr4XPVD6rfAWLIinhh8Qr8ohP
 hgRVI
X-Gm-Gg: ASbGncsR9n6Em4zqdJznMGtSqKSDSoJpnSIsmWKrOROesrxd5wpu3WyVL/nqocka/vK
 YdzhNfl/Vy0rW2zCRulkViATA882dFsyVcXUJ3p6GlkTH5U1NJi75aWebZ6ZtUoUk1W2Mmi9KF3
 UCjW7wC1FmVKiP1Q83Ptuh6RdwrpiDjQc7dVoPQWJ16JpNQZ46g9Xd+BWjwL0v6VhzAbDhq40Ct
 iQwdYkQtyUFbHeRHbszlUuXd5dBy9bTFdSasY0mZZMH8GiSywaGCiBj4zntWBk11S62V0Jz12I2
 TiNuoS6g1or4FvW2iqk2aOCOBGTlXDh63jPGR6r+sDXzxwE57DHcX+G3adPwNTWB1LejhHG75gX
 y/y0ov5P1NIrnBGSwGnyqhSv9h6to1S16JCxDDV+v7RVxG6xJP1uQHxhISwZQqVsxW3Ct8USG9j
 rhcRWV15H9LsTvqYmB1+dNnSPpNYVRxYk=
X-Google-Smtp-Source: AGHT+IEmug9wymmJimNbTUl+50y1nDp+5+tpVpNYrqsFE6aZ7wtLSzfw4PxHZSEjSm7PrqYWX4rrgg==
X-Received: by 2002:a05:6000:2882:b0:3b8:d16a:a4a5 with SMTP id
 ffacd0b85a97d-3c5d7ac658emr4512823f8f.0.1755961546778; 
 Sat, 23 Aug 2025 08:05:46 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711d9f389sm3833503f8f.60.2025.08.23.08.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 08:05:46 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sat, 23 Aug 2025 17:05:41 +0200
Message-ID: <20250823150543.3233205-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823150543.3233205-1-romain.naour@smile.fr>
References: <20250823150543.3233205-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755961547; x=1756566347; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxsH2ZaLb7PRf8OArCfnyWFSijDA7h4jP8EGXEgJBB0=;
 b=0UQ2yk6HoUqQGmw1PaV8rYN0vwc5wsGt2TWdHSywsX0AJ4nSo1mRDWFyQ+AlmViaOZ
 xBeYbNvu0QmsjB5R+l5uVVoEADCOWg3u7x35hu66/L2XENh+V9STcNp2255ajg3tHUyj
 Nu2IRRbikclL/69OJYLZUHv83bXuWu7f26MSM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=0UQ2yk6H
Subject: [Buildroot] [PATCH 2/4] support/testing: TestWget: replace thttpd
 by Busybox's httpd server
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

In order to remove thttpd package from Buildroot, we have to replace it
from TestWget.

Busybox's httpd server doesn't report server identification, update
TestWget accordingly.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295041

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_wget.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_wget.py b/support/testing/tests/package/test_wget.py
index c121cbd21c..7279b77667 100644
--- a/support/testing/tests/package/test_wget.py
+++ b/support/testing/tests/package/test_wget.py
@@ -7,8 +7,8 @@ class TestWget(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_BUSYBOX_HTTPD=y
         BR2_PACKAGE_WGET=y
-        BR2_PACKAGE_THTTPD=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
@@ -47,11 +47,9 @@ class TestWget(infra.basetest.BRTest):
         self.assertEqual(out[0], msg)
 
         # We download one last time, showing the server response. We
-        # check we can see the OK status and our thttpd server
-        # identification.
+        # check we can see the OK status.
         cmd = f"wget --no-verbose --server-response -O /dev/null {url}"
         out, ret = self.emulator.run(cmd)
         self.assertEqual(ret, 0)
         out_str = "\n".join(out)
         self.assertIn("HTTP/1.1 200 OK", out_str)
-        self.assertIn("Server: thttpd/", out_str)
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
