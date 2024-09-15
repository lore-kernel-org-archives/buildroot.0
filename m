Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9EFC35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 07:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 477D2400D3;
	Sun, 15 Sep 2024 07:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDD7Xsp5rrY4; Sun, 15 Sep 2024 07:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1955A402C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1955A402C6;
	Sun, 15 Sep 2024 07:16:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB9861BF282
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B83FB80C5F
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSzvxTx5l7WU for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 07:16:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C302380C52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C302380C52
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C302380C52
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:16:45 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a08c907245so6694965ab.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 00:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726384604; x=1726989404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l5Fc5HFMYEOffWUDsNPsutm6j654VOKM6Bxpikfo+xc=;
 b=HboFndMYY4NdOniaKzT4qbu+B2jiatbs5ePCR81P0bXrnHLAL9y0187vyk1W/ElyNx
 zEyJjSa6bLZRoR/o50/wKGlZugk51SF4ekVmOkd20gBjQHMWAsXl8qnPXE+YQ127HfHI
 lbmpyVJagFfHyX7qYWxIk2p9rK0UYh7DjJmiOtncbieD0dBXWVr7msqJVY4lqfOFOIbZ
 /VYM0lO7mXODA9mzd7UWqnKnF50vtKvBRdBXl0ZOmF5bi+gkiP7NgEKKORqKN3t2BOhb
 PWvHW+LFV+6RKzpmV+MM6NSVR9s+YrdvqQrQ5h/IyA0Q2yi+ZdGk4y5HWG21cBnk3gf3
 NI6A==
X-Gm-Message-State: AOJu0YzUr9BwgUJWostVVih2kr2/oY3s0NBraDCu8fB8r031kv6hZmZD
 nZQWnI+QWOAyheDlXSCVeWrI2GiOe//ik5B8RlP2VwvO2Ty63NjtwSF4AQ==
X-Google-Smtp-Source: AGHT+IHT2EcGcwQrOe1QRUa1wzle3wOFw7kpKzWDR5fINCuZgHpcHYJ7NLUJd+7BdcDndjFNL8z7eA==
X-Received: by 2002:a92:c548:0:b0:3a0:8dcb:b033 with SMTP id
 e9e14a558f8ab-3a08dcbb224mr62056015ab.24.1726384604548; 
 Sun, 15 Sep 2024 00:16:44 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed61ba7sm794830173.172.2024.09.15.00.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 00:16:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 01:16:42 -0600
Message-Id: <20240915071642.1542317-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726384604; x=1726989404; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l5Fc5HFMYEOffWUDsNPsutm6j654VOKM6Bxpikfo+xc=;
 b=VZNZu0lKCpphwWAS+TpP4EoxZx+lDvo5Ox9oVxAbllTbIPs0JLR7dm3VN7vEFsX2lz
 ec8qSb7JEOcooWfEU048/JepuOs2UQIbcUul6Cusl9QrCHTh6qPVaSSYkx7/4wHA0gZ2
 WWPAMrcHNJcTS7Fg2NPpmusFBEFYr89lurhSRhV6qGstmda0C1hCzQtKPFIT3v1XQ9zD
 68oee91Gb76+W1pR4m15X9pASbMRVPO/D4bOPHBVIwhyHb5j3IGEBsz70w3lKLvT/VKM
 SdYclIBHXueprie0Kq1orupwXKRJ0wuSf0576xQk7nH/EQX1FB7iND3PdDw9AdP8xQ7+
 6xhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VZNZu0lK
Subject: [Buildroot] [PATCH 1/1] package/python-google-auth: bump to version
 2.34.0
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
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index 9c201391f4..7351ceba31 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  718e1a2c55baf3b019e9a42524812113  google-auth-2.26.1.tar.gz
-sha256  54385acca5c0fbdda510cd8585ba6f3fcb06eeecf8a6ecca39d3ee148b092590  google-auth-2.26.1.tar.gz
+md5  7bad237adfde8f24d610d1f0595eeede  google_auth-2.34.0.tar.gz
+sha256  8eb87396435c19b20d32abd2f984e31c191a15284af72eb922f10e5bde9c04cc  google_auth-2.34.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 02c8c1164f..3e1aadc506 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.26.1
-PYTHON_GOOGLE_AUTH_SOURCE = google-auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/bc/c0/b5119831db4888e703b2adaa912709931181678ae3a50ca08d51a3904765
+PYTHON_GOOGLE_AUTH_VERSION = 2.34.0
+PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/0f/ae/634dafb151366d91eb848a25846a780dbce4326906ef005d199723fbbca0
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
