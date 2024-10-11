Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA85D0EE38
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 21:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D85EC81E41;
	Fri, 11 Oct 2024 21:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2CGFFqYJ8mGP; Fri, 11 Oct 2024 21:12:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB1CE81EB5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB1CE81EB5;
	Fri, 11 Oct 2024 21:12:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1298D1BF2C7
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 21:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 011B1400D3
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 21:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCyBLqq_2eRS for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 21:12:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A2FC740004
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2FC740004
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2FC740004
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 21:12:55 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-8377fd76196so54525739f.2
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 14:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728681174; x=1729285974;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cG4ItmAx7yHMaH40pa4R+/M0PUjrblh73TjcXOZuQpc=;
 b=PdQrUeyodq+9EnTRERf8QohgaPJ0eUl1DIVCkT2gBoarOaGYZv3aXuo0HuZCBK/SYF
 oqbrCuDwSlcLqsn5V2RhUlghwizpfSyTX93201gyt17qld9O5vTjzrd9vXFMFp0QNfvS
 TA0HRxXz4sool3x1PTV97fbgAWOcSNCHimuznuEZkl4mGKRWJlvB62PyH0pfLQyIL8k8
 JgAP9h2llmzONDBcLNzFEKYkSX0xn4ydmTJ3i9CbBvqDxMdQd8CjZ0QoF7KHhWPlq1HV
 L96qSeLxFOy0zuVAsdPjB0DxI5z7i1smyeZjm8XlHhu5ax/P0Acb+VOSbrc6yLLF8AHk
 G4Pw==
X-Gm-Message-State: AOJu0YyuWATXkiXh5CrmM+bQOKCH/AXzmrEu0dNyDrBLKr5w6EAaSC3Z
 NRUzw+Cvv2a6J7Ue0OjeIFCUqwwQXG2j/dX0TMiep7zy47IU5L2F855teg==
X-Google-Smtp-Source: AGHT+IGuaRIOjV3oaz+16q6+s8S+WlH8LizO2CK4/ww8xZa04Nf3TpHF4b6ep/0wHmF5D0FB1Vyjvw==
X-Received: by 2002:a05:6e02:12c5:b0:3a0:4a91:224f with SMTP id
 e9e14a558f8ab-3a3bcd9847dmr5237495ab.1.1728681174040; 
 Fri, 11 Oct 2024 14:12:54 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a3afdae1b2sm8691165ab.3.2024.10.11.14.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 14:12:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 15:12:51 -0600
Message-Id: <20241011211251.2775950-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728681174; x=1729285974; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cG4ItmAx7yHMaH40pa4R+/M0PUjrblh73TjcXOZuQpc=;
 b=XJPb/OrzqdY/Vn5R7SiD+Vnu990l7gl3a4CNCY+n+jSMgXMtXNAjM3hvdCxLv5fnp/
 AXnZ1RlrfwP39ji9RuWWmb/5yt14mdNNDM30eWje+VqrKTClC+Mv3KsivNkNfM5XWYLA
 /FaZNyliyPzUChjN84iW435FGzyJh1ruCj7znPRRe+5jiPelOLtS1DIg2zlB02AnKKEA
 UoIfwDQU36H8Pj1yMQkBNevIUcwasjQEiMRl9fRZd48tVIqCkkVz6dLGMQTBmqXfuGbs
 vHwpLsKPu5x6rSFRb48oEFQk7MLOv4PK4iizCTAphJnxLsvjwVSn4lugG6CwhSRJIiQg
 qGsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XJPb/Orz
Subject: [Buildroot] [PATCH 1/1] package/python-wsaccel: bump to version
 0.6.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wsaccel/python-wsaccel.hash | 4 ++--
 package/python-wsaccel/python-wsaccel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wsaccel/python-wsaccel.hash b/package/python-wsaccel/python-wsaccel.hash
index 9991f8f454..5aaf95c957 100644
--- a/package/python-wsaccel/python-wsaccel.hash
+++ b/package/python-wsaccel/python-wsaccel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wsaccel/json
-md5  b05eecfac9cb19326bfc3b538de495ac  wsaccel-0.6.6.tar.gz
-sha256  18efec0a7182587ba97102b4cd8df7b4f665f45d7ca36f19783f5f081ea114ea  wsaccel-0.6.6.tar.gz
+md5  e710fa8736ce37e4269e711d0aeec4a7  wsaccel-0.6.7.tar.gz
+sha256  aea79ba46b1a3792dbd1fe364aeb8a10128659c67057770c5c320d1f58588a8c  wsaccel-0.6.7.tar.gz
 # Locally computed sha256 checksums
 sha256  b6982974cb838b985b54b663d1780d280735086249c2e28015f25dd455df25da  LICENSE
diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
index 7ccb033256..0f942bb5e4 100644
--- a/package/python-wsaccel/python-wsaccel.mk
+++ b/package/python-wsaccel/python-wsaccel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WSACCEL_VERSION = 0.6.6
+PYTHON_WSACCEL_VERSION = 0.6.7
 PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
-PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/94/28/41c0e711b538f6031a247ab4ec5352267f12ed416e3a638b8d55fc33f609
+PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/8b/06/e8f0450952ed1fb4aa2033a30ae5afb59632f5a35d441bcc6801a3aaca47
 PYTHON_WSACCEL_LICENSE = Apache-2.0
 PYTHON_WSACCEL_LICENSE_FILES = LICENSE
 PYTHON_WSACCEL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
