Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF9BC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 19:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C642E83D3D;
	Thu, 14 Dec 2023 19:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C642E83D3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AzwGa1WamPCM; Thu, 14 Dec 2023 19:25:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 067B883BF4;
	Thu, 14 Dec 2023 19:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 067B883BF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE5EE1BF3EA
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4241416DA
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4241416DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ffL3f8zeDgJ for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 19:24:44 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4D3D41625
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 19:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4D3D41625
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7b6f43740b4so333991039f.1
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 11:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702581883; x=1703186683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FynLiaYS6a3a/kugsvepLj8zKgNP1six3UfkoFB5SPI=;
 b=f8XWDPZlcs2QmRcIfU2sGurTq92N9T/yHkxDzI0R0favExUBI/9knK2nasTFgf5Nny
 Q9si3fzC7iX0W+PYg1zV9mUFTFEuq1X9e88e1Ka2FEV/nhC4cKjhoh+J1MISAXNoLrm9
 uXEy/8f9spiFuzDmuwgczCY6b2unL7HqldWBeTX+q8P+nHXQjOFi9bZedd7RAMkNO0Oz
 Tnl23AWH1fD9dj/kTE3Z7Ekb5sH+CiGr5x9ef9yCQ6QlmL7zMz3qKsdqCSSTvszdEVo9
 evhJcaX72jfUzbcAbMRoaFVegT9+cWkQz8dq5tMfHJMVgDA8GoWHiKMvd+G7Fgq0gSQG
 BN0g==
X-Gm-Message-State: AOJu0YwJM+eF5d3YhdSL+5kAyw9LlpqPbt+Hvi0RZsSB87kZ+iDBUghu
 b5hSnZlvwMRAl7l0H1v4/MtwChtPB569tg==
X-Google-Smtp-Source: AGHT+IH6cwwkCkGQj35/tJO6LhTGoffoIIqXgmdtnZwkIqXmtxZT08G8wvnFx3qBNZREDUTPjiWdVw==
X-Received: by 2002:a05:6602:4c0e:b0:7b7:1c30:bc1f with SMTP id
 et14-20020a0566024c0e00b007b71c30bc1fmr11123254iob.13.1702581882970; 
 Thu, 14 Dec 2023 11:24:42 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 c16-20020a0290d0000000b00468e80fa254sm1345615jag.148.2023.12.14.11.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 11:24:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 12:24:34 -0700
Message-Id: <20231214192439.259156-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214192439.259156-1-james.hilliard1@gmail.com>
References: <20231214192439.259156-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702581883; x=1703186683; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FynLiaYS6a3a/kugsvepLj8zKgNP1six3UfkoFB5SPI=;
 b=hS9kP79JUUJT/ZpTHgRZWwKndH4oC53jkgTncrJFI9HWa83E+V9xBg7qCbh3PSvSAC
 hncI0tGq1fdkVSm1fYzWPDvIRmSni8x+P0bPj5OF8AEs1+bXmXa0NaoPJ9RgYgGzrde6
 LbEOZOSVUbf39btT+uYVMELWTF0KwO+84Gpw8REAkFd3l1nyYw1bOWHa8KpzF5R0CSRC
 zRMt7l+15lqxleDKj4lUYuDs4V4QNc7Cwy4ViUw4q2Ak+XeuSRjpmM6M1uXafA2uUI4e
 gIZAVnvSuDXU/syvGZuCxBIHvbLGnUHAXQKUfOFM7kqkVoFPxWqScPR87C85a1FKtwQJ
 5DtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hS9kP79J
Subject: [Buildroot] [PATCH 2/7] package/python-grpcio-reflection: new
 package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-grpcio-reflection/Config.in         |  8 ++++++++
 .../python-grpcio-reflection.hash                  |  5 +++++
 .../python-grpcio-reflection.mk                    | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-grpcio-reflection/Config.in
 create mode 100644 package/python-grpcio-reflection/python-grpcio-reflection.hash
 create mode 100644 package/python-grpcio-reflection/python-grpcio-reflection.mk

diff --git a/package/Config.in b/package/Config.in
index 69972156eb..5a6de1d1b7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1095,6 +1095,7 @@ menu "External python modules"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
 	source "package/python-grpcio/Config.in"
+	source "package/python-grpcio-reflection/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
diff --git a/package/python-grpcio-reflection/Config.in b/package/python-grpcio-reflection/Config.in
new file mode 100644
index 0000000000..d2ee039c5f
--- /dev/null
+++ b/package/python-grpcio-reflection/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION
+	bool "python-grpcio-reflection"
+	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
+	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
+	help
+	  Standard Protobuf Reflection Service for gRPC.
+
+	  https://grpc.io
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
new file mode 100644
index 0000000000..d17087d4bb
--- /dev/null
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
+md5  f93b042f8092cf1818f249518668a78a  grpcio-reflection-1.60.0.tar.gz
+sha256  3f6c0c73ba8f20d1420c5e72fc4dd0389fac346ed8fb32a28e6e1967b44fff35  grpcio-reflection-1.60.0.tar.gz
+# Locally computed sha256 checksums
+sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
new file mode 100644
index 0000000000..b3d2fdffa8
--- /dev/null
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-grpcio-reflection
+#
+################################################################################
+
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.60.0
+PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio-reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/33/3a/e257225b8fd9f05d2af3e363459f0d074ca684438667892ea3215e2162ca
+PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
+PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
+PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
