Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC48AE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 855E580DE8;
	Sat, 11 Jan 2025 17:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bu460F7gF4Ic; Sat, 11 Jan 2025 17:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A0F480DA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A0F480DA7;
	Sat, 11 Jan 2025 17:17:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB578942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC26C611F3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWL8l3J4q6_b for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:17:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA67B612D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA67B612D9
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA67B612D9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:17:52 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-844e9b83aaaso240272139f.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 09:17:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736615871; x=1737220671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=55jKDmQfX1U+XabTXv2gp8YNQlrKjcgxqu/N2SyzwO0=;
 b=wr2o6mbFFG3h2dwsu2mf4OR9APpBygoEuMyQWB56gVrwCLQhVcZL0weMqEYQ5xxU/b
 GHaIrxOsy9RdyNj78U/6RPsHmD/ELq8bnya7RWs2TaMmu3RoEX05JvBSn8TcIhx3K2Gd
 +UFfj6DCpVqFyP9CdfHqXO/dR7Byf2P3K/79GQuwAmDG3+hFFUsFyBrvfWK/3Q60NhsL
 pBWTO8k5jeqFD2dKGbUSI1YeFlwnwhItwmfPAKovHO2HnzR+mJ+96g1uJfRPVkRBgFrD
 b5ISS18YaYh1ZA00xpNwzfvHw3eVrpUWoC0S5m+N+f0Al9Q2+wbbaT4o/I2//9MbZBt0
 bI9g==
X-Gm-Message-State: AOJu0YxE/GnPP71JKyqnP6wJxibIdQNC5WjDRahtoJcUryNMHuMYe0fj
 rhrHJ2TBU2NHP3QBBGGS8D0JXqpuX/5WnZFBHT7gp8LY74NXlWYLmQXLCv8FVG4=
X-Gm-Gg: ASbGncvbuwHlr5ldW91MlJKSMhXugCAun3b39zt6etEC2GEE6c21X6QEACDUraNIGcv
 n4HtkG3zuD6YjYIy6siz0pxqmHN7O/C7//OV9ZUtNPPhV+3wKHNkLvbMhZDTVNh2c9u1ypZAtaf
 0ViKqa7mefrE3/R0GNAqeaOMVYSJDvt88uAjbQZW4fOf5keVG2jZBeONZ5MaoBSCizNwJndjKQi
 31bVR0ZMD50FLllVsJAiy+su3DIk3k80u5DWFnrwxnFz/XGjPZq6pGqkpzqqtlikIpd+pyAnq+i
 vQhL5aQEQpbxvyZxP9WPQrEH3nbeCGg=
X-Google-Smtp-Source: AGHT+IFAwsJ/PftYwhItxg/xloKXwex+4KfiWGMEMuTxcgYGO940S+u2QpbqEst6A6ZP6UZjLi+IVw==
X-Received: by 2002:a05:6e02:748:b0:3a7:fe8c:b012 with SMTP id
 e9e14a558f8ab-3ce3a8ba423mr132259815ab.18.1736615871360; 
 Sat, 11 Jan 2025 09:17:51 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b7426d6sm1615824173.112.2025.01.11.09.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 09:17:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 10:17:49 -0700
Message-Id: <20250111171749.2909756-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736615871; x=1737220671; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=55jKDmQfX1U+XabTXv2gp8YNQlrKjcgxqu/N2SyzwO0=;
 b=GxTKapFATVLgTqZuNxWFd0QrGcS+Z0D5zHTrOOYzT2hNMp1YBCx/EuOwhoz0s6iHxI
 gpiTGVYUMFx3QQbegJ2M5s3g25dxWRQjvAIDSwp22x+2XDWiyGvhJFpQ5oDASq4C0k3+
 nyKO83yocszY9KWD4pMND0rdiiw049RMhGxM8VJjVmzvz8A6yZl7Qd9mA7hN4a1UE8na
 1zr0qYV/N2a+YpgiV6g3L61NVM9AngGfYLYkak2GepWMze3cQBX/CFo8Zxh5tZk4W47i
 Ni4jRCCvctTM4UAN37KMKgSdNU75gqFcUhN3nUWOQZFhy9DFj82kK96k8xNBrD4IUyL+
 +hHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GxTKapFA
Subject: [Buildroot] [PATCH 1/1] package/python-smbprotocol: bump to version
 1.15.0
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
 package/python-smbprotocol/python-smbprotocol.hash | 4 ++--
 package/python-smbprotocol/python-smbprotocol.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smbprotocol/python-smbprotocol.hash b/package/python-smbprotocol/python-smbprotocol.hash
index e3de9e87d3..ad0c547d7a 100644
--- a/package/python-smbprotocol/python-smbprotocol.hash
+++ b/package/python-smbprotocol/python-smbprotocol.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbprotocol/json
-md5  ca5c38cbe82d7995ed2147021a7d2950  smbprotocol-1.14.0.tar.gz
-sha256  4918ba10a0b0b344308e7a043c1c6741bf7282c3937059a5852de702d3b684da  smbprotocol-1.14.0.tar.gz
+md5  3ff374488f4760f2f40e799e69671c40  smbprotocol-1.15.0.tar.gz
+sha256  3c892f4c22ab147d0576a3a8d34279831b26ab4695b7df911a334bc41f6d652a  smbprotocol-1.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4c3c550abc2b04c507ed0d641dd7e524eaff5bd06c7862af957301836d496d15  LICENSE
diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
index fc464fcbd3..6b35cb170e 100644
--- a/package/python-smbprotocol/python-smbprotocol.mk
+++ b/package/python-smbprotocol/python-smbprotocol.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBPROTOCOL_VERSION = 1.14.0
+PYTHON_SMBPROTOCOL_VERSION = 1.15.0
 PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
-PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/41/0d/d178f651591de45607d6dfc5637e7dcd8c5190b137275303cda005d9a13a
+PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/c7/b4/68d75ae0c2f925976c7a58dd9bd26741378c79c6d56d57c72fabcbe595c4
 PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
 PYTHON_SMBPROTOCOL_LICENSE = MIT
 PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
