Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CE2D5E36B
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 18:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 395FF60593;
	Sat,  9 Nov 2024 18:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2B9j2GVefKWv; Sat,  9 Nov 2024 18:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27251605D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27251605D2;
	Sat,  9 Nov 2024 18:46:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C38A0D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B268140613
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iU-0_STZoIY1 for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 18:46:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B12F405E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B12F405E5
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B12F405E5
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:46:18 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-83abcfb9fd4so125016239f.3
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 10:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731177977; x=1731782777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ytxHj4IhMHwEmVBVJLD1/l/M9hUvDiGjm9WLs+Is+1Y=;
 b=LVQlZDnrv1A3Sy3AT1cftqesH/ihohiAJWrlV4OsW5q/sxh/XAbW/IAWirI/xedNue
 44yJdHWrAmBsDBHyXC+2R0rHeHlmKQffbAw8aKR8r2US+Y+tUsfwBZcnVKuZRYnfb9/R
 TgpFjMRpvamYc4nCA6RDaL0j1GvgkIX+ZZ0aVLhui6VK0C0bHlLuBFlhOADh+83mjbod
 qVSk3zXyBhxbcJwnyJDAKFBX3+nf9WwgA5sKNGCedplPEZiuJYwflSO6UHpZFFUJm7nq
 wlxkvEW4H5FpF5K+KE6YWXt8mGqAZ+8E8WiISwG1QgpfqCezHuVT6/fzpehfL/8Nx2ni
 gR/w==
X-Gm-Message-State: AOJu0YzrbriUUeCoCPcBjgWzU8lsw4+nFJuV9GeHa6X8naAF6+Ussel4
 Y7J+Ye4Jl2ikadxNTb8cA/9a0KWpyPMk7cKzHIkjZML7AYWtZrEs+4Ftiw==
X-Google-Smtp-Source: AGHT+IE7rUdcpeOufJTisF8nQqp8Zz4kRBKxhduFyTl/IF2WJRh91qhS0jMms2m+qFoSx/I1mqZWuw==
X-Received: by 2002:a05:6e02:3188:b0:3a4:ec4b:92f0 with SMTP id
 e9e14a558f8ab-3a6f1a37dc7mr84438485ab.19.1731177977154; 
 Sat, 09 Nov 2024 10:46:17 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de7870a223sm442296173.21.2024.11.09.10.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 10:46:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 11:46:14 -0700
Message-Id: <20241109184614.755721-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731177977; x=1731782777; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ytxHj4IhMHwEmVBVJLD1/l/M9hUvDiGjm9WLs+Is+1Y=;
 b=TpGDMbP+L4vxprPWKOSRlgJ9MASomjo64fx8cozJEn0cKoWRf5ex48JUnziJCnesVe
 1XLB3pjLHHVUhaSjqluHGgp3cwt0w8q4mzUT5IsAl6YAZY9HLEyebtAyiZ+3hXZ6PfL2
 KN6Bd6gFQ7LgRV/eqJ3pk+7STeQglewvl79v6oM9Mxtqg/UiZN3l1a+VqbBJS+ssM9A9
 Fh6T/YqpuZeOAMMYQabuu4OASCdbRPbMIeGkow/SmdkdutsxCdszPd31YY9jKXcnXrf7
 XGTiPFwTySYpio8GG1pLxRSD648LvKP78i1Pb3ltY7JdyivuCLHF4k0YQbRjaov7oVXi
 gzhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TpGDMbP+
Subject: [Buildroot] [PATCH 1/1] package/python-packaging: bump to version
 24.2
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-packaging/python-packaging.hash | 4 ++--
 package/python-packaging/python-packaging.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
index dca59bf975..1d1956e2ba 100644
--- a/package/python-packaging/python-packaging.hash
+++ b/package/python-packaging/python-packaging.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/packaging/json
-md5  99b97d1f30017a62a2aae777a14782d0  packaging-24.1.tar.gz
-sha256  026ed72c8ed3fcce5bf8950572258698927fd1dbda10a5e981cdf0ac37f4f002  packaging-24.1.tar.gz
+md5  97dbaca91e00d6b9fd86866e8c7897ae  packaging-24.2.tar.gz
+sha256  c228a6dc5e932d346bc5739379109d49e8853dd8223571c7c5b55260edc0b97f  packaging-24.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 01d6c2bbf2..14d9c5ea4c 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PACKAGING_VERSION = 24.1
+PYTHON_PACKAGING_VERSION = 24.2
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/51/65/50db4dda066951078f0a96cf12f4b9ada6e4b811516bf0262c0f4f7064d4
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/d0/63/68dbb6eb2de9cb10ee4c9c14a0148804425e13c4fb20d61cce69f53106da
 PYTHON_PACKAGING_SETUP_TYPE = flit
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
