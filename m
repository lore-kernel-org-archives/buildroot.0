Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775B1CAC597
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 01:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4172240211;
	Tue, 16 Sep 2025 01:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_HX9c2sANcn; Tue, 16 Sep 2025 01:36:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 786B040215
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 786B040215;
	Tue, 16 Sep 2025 01:36:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99B2712D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 801E340211
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1KpIf4G82U4 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 01:36:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A279240203
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A279240203
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A279240203
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:36:10 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-42404af30b0so8968025ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757986569; x=1758591369;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rnDXfv+5Z4rkTXnzBzcWpCSGstNZ6FijtmqQabim5Xk=;
 b=X0RBHtcGsew2BhbES8ajeFFyOSHIGwScCZEJUr934QIb6B/dSP2TVP3gvUsv3F1n4x
 6kBWU+2Ly3H03q1fZ2Njji80Benai47v0Qsa8Bat/TpHCktyO09G5B2XxjSbSlHWibZG
 leURlOp+XJj6OlU/9lNXjz44pRTSTN4Qjpe6cE40bNnrZ9iCWTNrjvmIZl3CFobYtStt
 k65rlnaHitlYlK9RN4hrukdYc2nTY7nU21Cs5c+7io0JUbOTxNz8SYU3Vga/1rEgfnC6
 9cJdWIbtwY5mLFm39IiS5dA747LxpYp2woyNJCGDF1oNVui6unRqx6GCw07JJVacoLJ2
 s0Ag==
X-Gm-Message-State: AOJu0YyUmbLkdx6/bSrDf6oJWxd3Ig0e0EGvZsRa+sKuShNo6mRKAxDp
 y+4XLGc3U3hJ4uD0tm0sbv2V0P8Gdg1+4MWmzVDxel57omdF2zPo24kx4QU/xQ==
X-Gm-Gg: ASbGncspNlipBzL+ZILHJS8YALlwMaS5RPXv3CC52pUdLcFZCwDlrCpmJeHB6U21HZ+
 9LnRBxJj46e6RbXHF78cqxDD0dtU20t64CkrtYtWl9MfiFzGYAV8HWkNV/B9oPb3dMSYmYkmAPZ
 YxC4RdcfCw+pEDawfyXh2QB++tbF32WzUTQ19RwI9piSbehfmP94068GXAEVeqhwyD3kLHmCR7o
 KQ6RH7bwRfB0zxxIr3Ci418SGuUhIqfPIl/da0+wGAu9hQgASojEEtZfGEttyTa4mkv9d6b/ysG
 7XPX6cF+RQiuu9UIxSuzEeiP9rjgwUEAS8b6fOz+5BAagokJ9uhsUE714likJcsSSYVi16Cuc5L
 gcz8sEonpNWNYa2cs5miQ4BxIAqwthyariXi/FTewsBDsXYvid3L0wkbN8YhcKbFS+Kg56ynn5w
 iZ
X-Google-Smtp-Source: AGHT+IF5u3r/DJjTQEPBY02hjA0Kbp4Qq+xNQI5ylokLS2c4qLQICvLuKJzFtCAVXRRw8MYVjN9UiQ==
X-Received: by 2002:a05:6e02:b2d:b0:3fc:733b:326 with SMTP id
 e9e14a558f8ab-420a6110205mr163284945ab.32.1757986569414; 
 Mon, 15 Sep 2025 18:36:09 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-41df8eb45e3sm65924815ab.23.2025.09.15.18.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 18:36:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 19:36:06 -0600
Message-ID: <20250916013606.2596265-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757986569; x=1758591369; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rnDXfv+5Z4rkTXnzBzcWpCSGstNZ6FijtmqQabim5Xk=;
 b=g5tmNuAj3FgWsZZ/Ab0HqqUYJBYsr8gXFxgRQVgmDZS0iTYYxPHlHI4ggkmDMjtcwT
 QabZKehpaaZTyTzl/Rzl5o3VX722mkcX2b+SmF/kUO7T9WaSE/Bw572EZDCDEDoJc6Tn
 4NHn+IVOYphoRxp1TWzDNclypZO5NOl3pErcHVTK32JyzGy0S9eusJk4uymZyIM3ZvMj
 5UbH/KESdOB3tG/MeH/FevWpYc6kpHYduRzC/R/vxrFjO5Hq7Bt7v3YIMtFQgowmnD+s
 AsO7T0Y1Q/jaTV9fO05q5WfO1hRtuM2mjx1tHTKi3NgdAw4QfYocIaarv7Ie2cFB+3/3
 bpgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g5tmNuAj
Subject: [Buildroot] [PATCH 1/1] package/python-selenium: bump to version
 4.35.0
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

License hash changed due to year update:
https://github.com/SeleniumHQ/selenium/commit/c62597e5cdbfb7065a7587bddccc253c3e739846

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-selenium/python-selenium.hash | 4 ++--
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index 55ccb0cf02..47a5b7be67 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  6db4af23dae4b66626cd9a3f730e8aea4d35623953ce3b57b73510c4b8f8af49  python-selenium-4.27.1-cargo4.tar.gz
+sha256  b5a238e9712d8f41c78c27759ec14c761acecc14505399c020b69de8bc38e51c  python-selenium-4.35.0-cargo4.tar.gz
 # Locally computed sha256 checksums
-sha256  de658a7d3761e92b471e2f630ea99eeb3389b27820809b1e4853baabd5fbadb7  LICENSE
+sha256  1ee8454a0696ac46b0d5b67f85b2a0e3af2b7726e1b82cd182af60fd285bcba3  LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index f622674fd2..2dc3b9fa22 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.27.1
+PYTHON_SELENIUM_VERSION = 4.35.0
 PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/44/8c/62c47c91072aa03af1c3b7d7f1c59b987db41c9fec0f158fb03a0da51aa6
+PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/75/67/9016942b5781843cfea6f5bc1383cea852d9fa08f85f55a0547874525b5c
 PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
