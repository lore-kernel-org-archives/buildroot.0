Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A1FC35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 07:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6990140443;
	Sun, 15 Sep 2024 07:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2Tw6m04Op1m; Sun, 15 Sep 2024 07:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF2AE4028E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF2AE4028E;
	Sun, 15 Sep 2024 07:38:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 755491BF282
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 642C84028E
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnM3nPNLvBrQ for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 07:38:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C5EC40136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C5EC40136
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C5EC40136
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:38:09 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82aa4fd82a4so115837339f.2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 00:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726385888; x=1726990688;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bjz00124o2cctjepHGv5gLvpMLNnVvQ//kbLzYpYIms=;
 b=nEPTN97Jdl8WeOD111jH0UUARx1PLxOH9h7GGto0KCyCm9NEiWkF+eXn1Y627WyeNk
 PSvTB3aMUAV7ATm092vLWXEkSVgUzvi7WI0YJ8/YPb/6SvA+n7fkfxA0C3laUXhM0TXa
 9FcnAE8hopml52c06nqz9I5Y3T0BpvMj4q6mccSqZg/1f7X0g5V4FIPDJN9QRE3WQQqX
 K9pQZe0A4sJAOzzq3IRwb3GA/pthAL4g24QdEtwXbfa3xuShGLoPeV4Ovk14rPZ4Q1ir
 XiHyPwO4siED5Dl3Dl0FWfX/298zgchw8trEa6gR62k+i58QQ1T2+kFO9LNZBrKO6lN/
 qLlg==
X-Gm-Message-State: AOJu0YzsGJZRs3xOkrhZTlnHX3sw6YwxyivVAG8A2GY0xkErz5i3Eq80
 hZTYb/kzIWecL92LxYciaL4+uOkU+5oi9RS5nYUCGwynCwUHt1+3K4AZJA==
X-Google-Smtp-Source: AGHT+IF2y+Jx/P5fZfEMRUxkljff7vLtOI4HpkYHgiKlnxvpSlPGTufNP3cxoclBAXrlY6g+3RZ2Dw==
X-Received: by 2002:a05:6e02:1b0a:b0:39b:3980:3288 with SMTP id
 e9e14a558f8ab-3a0848af762mr109050155ab.1.1726385887883; 
 Sun, 15 Sep 2024 00:38:07 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092dfe271sm8983595ab.6.2024.09.15.00.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 00:38:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 01:38:05 -0600
Message-Id: <20240915073805.1552173-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726385888; x=1726990688; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bjz00124o2cctjepHGv5gLvpMLNnVvQ//kbLzYpYIms=;
 b=V8dqXcwzDe5wT/Dk7yHYcVGh9UH6dcq8Q3sQPHqMOmiiVUGNKF8fjvUsemnog3D7Ha
 Np570KW63cm4E+zohhSxhHKNy1stuMNdbAHUxZ7xBb/niJmPaujXmLNfiTGZ+9bEqvbF
 0rcx2bTuyKVfXXCzQHOgSkmZe0hoearHhU4CC7PLDTZCgy0wsLFj/rJcwznjEmcoGLma
 r5Ad+GhurKo0o7OOuOpW5jnfraBend7m7tFZv9XZDN+39pIdnNUVAckMUrO+7FQnJzau
 65rEgtCXzvkR1W4Y/+OnbqdSiAVZei9b6UtLU5j19dFj2q9ykwZJJ62FZ+a+3Y5Lz7vO
 CShg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V8dqXcwz
Subject: [Buildroot] [PATCH 1/1] package/python-grpc-requests: bump to
 version 0.1.20
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

Add new python-protobuf runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-grpc-requests/Config.in                 | 1 +
 package/python-grpc-requests/python-grpc-requests.hash | 4 ++--
 package/python-grpc-requests/python-grpc-requests.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-grpc-requests/Config.in b/package/python-grpc-requests/Config.in
index 1cdd0d3f67..ad29617795 100644
--- a/package/python-grpc-requests/Config.in
+++ b/package/python-grpc-requests/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
 	select BR2_PACKAGE_PYTHON_GOOGLE_API_CORE # runtime
 	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
 	select BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION # runtime
+	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
 	help
 	  grpc for Humans. grpc reflection support client.
 
diff --git a/package/python-grpc-requests/python-grpc-requests.hash b/package/python-grpc-requests/python-grpc-requests.hash
index c816a65b50..aeb5336a4c 100644
--- a/package/python-grpc-requests/python-grpc-requests.hash
+++ b/package/python-grpc-requests/python-grpc-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpc-requests/json
-md5  39f0d7ef45ab3620d8b63c2408af35b0  grpc_requests-0.1.13.tar.gz
-sha256  30a00493b206156b94be21f641edcbef5ea69fb43daf503390da661123520521  grpc_requests-0.1.13.tar.gz
+md5  6d63bed1f4a80fc3e59191ce69903d31  grpc_requests-0.1.20.tar.gz
+sha256  a76744d781c5a7bf3abde8dc778d24c4e17deb39d173d85096ff3caee3d15250  grpc_requests-0.1.20.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-grpc-requests/python-grpc-requests.mk b/package/python-grpc-requests/python-grpc-requests.mk
index 9ffd73d424..7fecdf5a3c 100644
--- a/package/python-grpc-requests/python-grpc-requests.mk
+++ b/package/python-grpc-requests/python-grpc-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPC_REQUESTS_VERSION = 0.1.13
+PYTHON_GRPC_REQUESTS_VERSION = 0.1.20
 PYTHON_GRPC_REQUESTS_SOURCE = grpc_requests-$(PYTHON_GRPC_REQUESTS_VERSION).tar.gz
-PYTHON_GRPC_REQUESTS_SITE = https://files.pythonhosted.org/packages/46/51/8981bce4ca61bce1c7b7a12dd04f6cbd35c4ea874842b06283f6bbc9a0e8
+PYTHON_GRPC_REQUESTS_SITE = https://files.pythonhosted.org/packages/92/84/f5a3874a6e10448d8c198253d2c79f7b34a23fb4a96b78a648dc468913a6
 PYTHON_GRPC_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_GRPC_REQUESTS_LICENSE = Apache-2.0
 PYTHON_GRPC_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
