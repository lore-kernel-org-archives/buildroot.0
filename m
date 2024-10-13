Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F00ACF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 19:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2D2C80EF6;
	Sun, 13 Oct 2024 19:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0d6CmlYeAn8I; Sun, 13 Oct 2024 19:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C74BA810EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C74BA810EC;
	Sun, 13 Oct 2024 19:01:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 918131BF3DF
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 19:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FE1E404EB
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 19:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdwNAORbXHXQ for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 19:01:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5AE08404A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AE08404A5
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AE08404A5
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 19:01:56 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-8377f24fcd5so183737739f.2
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 12:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728846115; x=1729450915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6doljN8eLMo9CDlY6ys896wjQJ7eCxsvqOXS88SN8I=;
 b=CACurSItZwdaAHLaFQbyaK3fsAL/NdKNC/klw984Gh5mbbESRXU77lKSCKJ4kkyTpn
 XaNraFjzB9oPwFCOBNOFzLOSJqEBNHSNClKXAWkKw8d03HcZnW9EQ0v/VlzR6yaMu7rk
 qKRdxgpM6+V7huY7XCfjrcAzH2GTlGdZ+DuxMMt8Mt+KqOb8H9aLTad5gj1ixlHCVm8u
 pipi/kUHrCAP3UY2d8/DTQofSwpPnKiRD2r1UNeAxdcvRRTzYjGbdR8gXnP7EYTXqRry
 9RRdREGH2F9aQY9o7xFCVXhs89o5f+dlSvQiPyyzGttVPt8+a8M/lStLtOK3LdX64088
 jFfg==
X-Gm-Message-State: AOJu0YzfNBk9FFwHS7p0sndy/WitdqYl0A4dO309uWsBtiq5nlYauMmQ
 q2DLk4FckZFWjGOik/7bxiBrOWaIt8dBLePru/utEhuaLI/EjZ4r6yYRsg==
X-Google-Smtp-Source: AGHT+IEKKbFY6V5rQW+sQOTeft7aWaLbzzHUMvOtWie64z4AMvM++gib2cdtwQfexBYWtNeufCvMEA==
X-Received: by 2002:a05:6e02:1809:b0:3a0:8d60:8ba4 with SMTP id
 e9e14a558f8ab-3a3b603df81mr72360185ab.16.1728846114958; 
 Sun, 13 Oct 2024 12:01:54 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a3afdbcd37sm16498335ab.41.2024.10.13.12.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 12:01:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 13:01:52 -0600
Message-Id: <20241013190152.2796967-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728846115; x=1729450915; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/6doljN8eLMo9CDlY6ys896wjQJ7eCxsvqOXS88SN8I=;
 b=Rz3wgDqsRE56MQV5RaEr56kT8KR51O5kAHUxJcYjk69gHBz5YWCr/SiJ4etz5T8PrD
 dGlJgtUqqC8f3MHxuKLzXrmLfA9ylNd87yzgTNKb3DNuYpwuZSosEjLiqPE8dMXxYTRZ
 R6lTGcjNs2zFV2Eyi5rCQvZnantDr85D2ffwf9oDxHBgnSoC5TkKn1rdvBAHe+GWZhu1
 1Nswlnw8HP8HvoFUVOaC3uq8qTRZQVVmZ7gaBgJMuAaRtSwjHHi5GFss4oU+Kz5qyFB+
 tZM98E59v/huHmE89OVfF0iAI+9hT/EJ0PTAwhlNv+xzUCEnaVxO2eY9M/YXzbTl4gJR
 FbCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Rz3wgDqs
Subject: [Buildroot] [PATCH 1/1] package/python-s3transfer: bump to verison
 0.10.3
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-s3transfer/python-s3transfer.hash | 4 ++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index c8b8f65d0c..9b2c7d6282 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  891737ce35aeb23b02a47a72c7f9b639  s3transfer-0.10.2.tar.gz
-sha256  0711534e9356d3cc692fdde846b4a1e4b0cb6519971860796e6bc4c7aea00ef6  s3transfer-0.10.2.tar.gz
+md5  3c81bf7128a462187e9a88d9f400b5b4  s3transfer-0.10.3.tar.gz
+sha256  4f50ed74ab84d474ce614475e0b8d5047ff080810aac5d01ea25231cfc944b0c  s3transfer-0.10.3.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index 1851bb8426..dad4033c02 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.10.2
+PYTHON_S3TRANSFER_VERSION = 0.10.3
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/cb/67/94c6730ee4c34505b14d94040e2f31edf144c230b6b49e971b4f25ff8fab
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/a0/a8/e0a98fd7bd874914f0608ef7c90ffde17e116aefad765021de0f012690a2
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
