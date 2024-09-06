Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD48E6FE3D
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 18:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25D9060071;
	Fri,  6 Sep 2024 18:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXp_pZicYJu0; Fri,  6 Sep 2024 18:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AF4C6058D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AF4C6058D;
	Fri,  6 Sep 2024 18:18:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CDDC1BF309
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16BE3409EA
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ZYIEqiHhLau for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 18:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE9D940720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE9D940720
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE9D940720
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 18:18:22 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-82521c46feaso96559439f.2
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 11:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725646702; x=1726251502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yG+CLeEeH1tuoPV9MV4Q0KHYKAAdcMWSp/MnlbGlZBA=;
 b=sGrEfTMErn5Al7+tgC850sk1fn8n6Zq7KXtiXGG1yeA0EAsR7ZqdbhTU5jlY7FTOF8
 xUNRBZoau2JGiHdtxVYd9r1mLi+Dsa0LC41u17/X6vHezETPtEPNLGEtv4ijTyN3GFaP
 utoEsKYKTG3TroBl9WzCGzvSrV4YboLI5v6aJy4D6Z7WfYY9CQHTvWx0Nso/pTars0tY
 iJJ8fqxDYq5qYBz02CkLfqmZKiRcH8ueJnmaIsiNJSIby3GJiBNPywsMSTZn16Ss152x
 EOLG+Dfp7/8e9XcLgEnAwqvKBcqB6UsKCBOzU95pRUInkTB2sDUEXRN3Z0RLt3Az1VLn
 m+aQ==
X-Gm-Message-State: AOJu0YxfJV+dpQ24k9zeo/sCLe6gqFqx6mNZJpWTzYO63u9ht7Bt4xN9
 TMZoIkcuv9SrmT1ZpgrMY2qX77AJLE4w+oaMdFstg79ZJDFFlaFuXc/EOg==
X-Google-Smtp-Source: AGHT+IE+vaK6rhXMOJzRgxfITF3bR+Btbj0NrvGkyJOVCmTypQIUKvWZaKKDK7EBXrF/KE6weap+mQ==
X-Received: by 2002:a05:6602:6218:b0:82a:242d:e0c7 with SMTP id
 ca18e2360f4ac-82a961b8c5bmr412476939f.9.1725646701723; 
 Fri, 06 Sep 2024 11:18:21 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d0733da32esm799391173.133.2024.09.06.11.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 11:18:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 12:18:20 -0600
Message-Id: <20240906181820.15261-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725646702; x=1726251502; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yG+CLeEeH1tuoPV9MV4Q0KHYKAAdcMWSp/MnlbGlZBA=;
 b=WiK26FKqO0UVfMVcvQXOK8at74wjFred6kMoZRZYZAh5n8hph8fm0IJtxXNzLpkY0G
 ZHtuAL0p2fSzQ808A+xo4FjuDbTHNYeaEW6+YVkTOaeNwkv6WcXh50E578s+oh7VuIm+
 d00DI9MT/SGuQiKLRXPkcjL7v4c3mo6JGRw7oOJs4Vzd5cyq2rdDEqHzN5HXRLX84iWE
 u5mvU/1Q25Mb2bWz7o0I1lPgRoZ2peVKnYsmZN7Nymtpcmdrj7sXoK0+xGd4rQg535r+
 X9IuexbFdRk29gMQJX7DpMsTJSFSXabYiM0K52rTSr+8hUos6fC1RM0pwgcLRK1o6dKz
 DBlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WiK26FKq
Subject: [Buildroot] [PATCH 1/1] package/python-idna: bump to version 3.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-idna/python-idna.hash | 4 ++--
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 7b22841d88..88459b38df 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  31cc572cb7a6519159c927c998c64c79  idna-3.7.tar.gz
-sha256  028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc  idna-3.7.tar.gz
+md5  4490e5070a3dcbf1a6cd178cb523cdfb  idna-3.8.tar.gz
+sha256  d838c2c0ed6fced7693d5e8ab8e734d5f8fda53a039c0164afb0b82e771e3603  idna-3.8.tar.gz
 # Locally computed sha256 checksums
 sha256  a59f0b0ef3635874109a4461ca44ff7a70d50696e814767bfaf721d4c9b0db0f  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index b3c012ed0d..c9b83a5bff 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 3.7
+PYTHON_IDNA_VERSION = 3.8
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/21/ed/f86a79a07470cb07819390452f178b3bef1d375f2ec021ecfc709fc7cf07
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/e8/ac/e349c5e6d4543326c6883ee9491e3921e0d07b55fdf3cce184b40d63e72a
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = flit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
