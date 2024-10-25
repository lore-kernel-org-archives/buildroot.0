Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E75ED149CD
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 17:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD58E60AD6;
	Fri, 25 Oct 2024 17:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZpK_F8alE-ph; Fri, 25 Oct 2024 17:35:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4DD560AFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4DD560AFA;
	Fri, 25 Oct 2024 17:35:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 604472316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3827840768
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rN82pZxToqBE for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 17:35:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00BBF40891
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00BBF40891
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00BBF40891
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:35:01 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a3b0247d67so8601235ab.3
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 10:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729877701; x=1730482501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I8buIyv8B7ZvE5pR9rWg9D0aBEoB0+A3UvHq0fNw+30=;
 b=HGUg+ZnSNtI/HrAB2doHmTGriYuod0fxZQiGzhGEECRL5GVwxvqgH6cmRgykXlVTqM
 CbUX8YMAxn+W7YVVAKCmS1yyIJsdF1G/rU6KvjNjRyfvuGwa4A035TdVtu4xAOOSSbGu
 bquRON8Dc/sxzrupamAN2xsEZoBTAzC2b9oSdH0KEJ+rSAYJZgXEiVnI0xsk8+AM9AA6
 Gp0FAyQGOhRIqHmFwCMjP82Uft4OIE1F+eFjX9q33z4hbpbFbNHABMa7angJjsRnzAt0
 uQgQIFC0pa0zqqoQpzi5l9xD+Q+jAkxxssgF+112HvBrv3C6mAaK5t/9LBKkTSlEtCfU
 qLuQ==
X-Gm-Message-State: AOJu0Yz8l0kkOXbToQoqNS8w1DScIuUVPIVUZ5cPwIYJ4N6vpdluzQmK
 a8cY5EJHrjsl7McXQ8avL8tjhOm9g5J/rf29uPvavMbs5zIuosuLr8W1sg==
X-Google-Smtp-Source: AGHT+IH0H3brc2hIRntddqkcp3vzNdJ/AvQLcmsb3vemtup53EEVmKP6zvchrx6MMFQsPFA2ElTAQQ==
X-Received: by 2002:a05:6e02:20c5:b0:3a4:e99a:bd41 with SMTP id
 e9e14a558f8ab-3a4ed2f3861mr267605ab.12.1729877700693; 
 Fri, 25 Oct 2024 10:35:00 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6e568b0sm3635745ab.69.2024.10.25.10.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:34:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 11:34:57 -0600
Message-Id: <20241025173458.3580955-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729877701; x=1730482501; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I8buIyv8B7ZvE5pR9rWg9D0aBEoB0+A3UvHq0fNw+30=;
 b=KvIJ8hTchY71BloHd7jloLnTWbiCqWTurFwsO21f2sNT3KauLVtAe0/bQPUbKPHPYO
 9R1Q6GPlY99LBdviKXKj3vmsWyd/x1nvxxoGQwAl8OVWHcaPNfxaN3RCCwlZNPPjV5Ny
 arQAA76w4KFy3OgOaNhk2cLykQtwkxZfXG+OT3MUUXb75pkUPByjnzHyd/V8vMIarRQk
 BDrvQTNVueaZw0YQFzPRSlIDqc+xEBpV/p5ZxgVgyEPpAc5yEBSU7jX5M38XzQW60EEe
 5mimQV20PJlFs4ReBkuV6bJUcOTyjHN4ck8UVnCXdSUwI/Fw/ykfTCaJoYbevAiqgGur
 W2Jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KvIJ8hTc
Subject: [Buildroot] [PATCH 1/2] package/python-starlette: bump to version
 0.41.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 9a9671f41c..22b4f05f7c 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  cdef39e4684305e568bd91b45ceb9dbf  starlette-0.39.2.tar.gz
-sha256  caaa3b87ef8518ef913dac4f073dea44e85f73343ad2bdc17941931835b2a26a  starlette-0.39.2.tar.gz
+md5  c7bea1bc676a8e9adce0214bf632f67b  starlette-0.41.0.tar.gz
+sha256  39cbd8768b107d68bfe1ff1672b38a2c38b49777de46d2a592841d58e3bf7c2a  starlette-0.41.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index e1fa34a3ce..92c9ebb16b 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.39.2
+PYTHON_STARLETTE_VERSION = 0.41.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/02/0a/62fbd5697f6174041f9b4e2e377b6f383f9189b77dbb7d73d24624caca1d
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/78/53/c3a36690a923706e7ac841f649c64f5108889ab1ec44218dac45771f252a
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
