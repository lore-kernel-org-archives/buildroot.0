Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18804C54798
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 18:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 252C04094B;
	Fri, 23 Feb 2024 18:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B8JzlYK-QXzK; Fri, 23 Feb 2024 18:05:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8FCE4095D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8FCE4095D;
	Fri, 23 Feb 2024 18:05:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF9FF1BF409
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 18:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DDF7606DC
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 18:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cwh26uxkHUtm for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 18:05:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91B3D6064F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91B3D6064F
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91B3D6064F
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 18:05:39 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7c7842d029dso17686139f.2
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 10:05:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708711538; x=1709316338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JvoyfaEk+AaO4hvafyM9CxhfG6nkIbDb41l44VfRu8o=;
 b=Se3PI4KlvnXFpgBSVNKkk1Gf8TdmsiVct713SXrpnhTktg4A6ZOrnkLXgNGJSaE58U
 V1UN3OvS9CwmCsmQIjd8usg9ACMgxJs2AlAWGqZSEbE+qdxAgmQMOCHnDcqTLO+XRmGH
 ebvorz1ZUqVWSsXPtp5g+xpsWJG0GcHr/kaOY7IC8/fSCmoCUz7yCW9E5Mq2WNHtnLaZ
 qmzvuRMFBHowz6hq4r32pnep3suSoiM7xPqNGXmtnYPTB7ebNU2vUi5MxBc/qENNOPvJ
 0lLbblN4H2k3ouStIecIuXsa94pbOjUNj9RGPkXuk2nZTu5mWBbl+dtY5mosvoi6rTLb
 MnlA==
X-Gm-Message-State: AOJu0YyHK7MUxiermzvfe2LHxS/j604xo8H/mtuL8OI5WMfaUW+IV2Ry
 OpCrkne4AgSAFOcJKb4D1fxaGunU4akXc8sbkfqWVaXP+EWosqjqbET9NzcApqU=
X-Google-Smtp-Source: AGHT+IHPyeP0gmgdabAj1CSgyWApbqJiN3kjJeL6RSto6S88CbOcjUYMOcRe5qAUSnr3XfsH6poUKA==
X-Received: by 2002:a6b:f30b:0:b0:7c7:a50b:4bd6 with SMTP id
 m11-20020a6bf30b000000b007c7a50b4bd6mr392537ioh.8.1708711537815; 
 Fri, 23 Feb 2024 10:05:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-244-120.hlrn.qwest.net.
 [71.218.244.120]) by smtp.gmail.com with ESMTPSA id
 gu2-20020a0566382e0200b00474341aa2bbsm2459935jab.141.2024.02.23.10.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 10:05:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Feb 2024 11:05:33 -0700
Message-Id: <20240223180533.3011424-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223180533.3011424-1-james.hilliard1@gmail.com>
References: <20240223180533.3011424-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708711538; x=1709316338; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JvoyfaEk+AaO4hvafyM9CxhfG6nkIbDb41l44VfRu8o=;
 b=Ldeab8pD5Q7Bwb2p+4gFKIwoSd9mqrzkewfwHgwOffVXr1B8UxQspaKtfSHi6VLChB
 vSfW44aQEEs2A+yVQG/0ivz1SWwcqcFitLOlFidWG8l+WeqqtH4E4RWI+/ycmtcO5CFT
 FMTUzeB9DYD09t7T1w3lnFJm5QQxzzrmNn9Y/35OMpLgc2rwgpx4GNz6kl9PlpkCbyUv
 /CyCC0o/nDc0PuR5PrQzdH4Oubd6iePGDVg3dwJEAc1Q+ocCDiYOWE4ywb42UH8qzV71
 0n9lglRFbbyWGoMeF3mT+HvqIsDR67ViNIjXKVqSUwmQ4cB5YS820yvatQkehLWvDuib
 vTPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ldeab8pD
Subject: [Buildroot] [PATCH v3 2/2] package/python-betterproto: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
 - add missing python-datetime runtime dependency
---
 package/Config.in                                  |  1 +
 package/python-betterproto/Config.in               |  8 ++++++++
 package/python-betterproto/python-betterproto.hash |  5 +++++
 package/python-betterproto/python-betterproto.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-betterproto/Config.in
 create mode 100644 package/python-betterproto/python-betterproto.hash
 create mode 100644 package/python-betterproto/python-betterproto.mk

diff --git a/package/Config.in b/package/Config.in
index 2ddaadae69..f49c3543b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1006,6 +1006,7 @@ menu "External python modules"
 	source "package/python-backcall/Config.in"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
+	source "package/python-betterproto/Config.in"
 	source "package/python-bidict/Config.in"
 	source "package/python-bitarray/Config.in"
 	source "package/python-bitstring/Config.in"
diff --git a/package/python-betterproto/Config.in b/package/python-betterproto/Config.in
new file mode 100644
index 0000000000..8548fd43ba
--- /dev/null
+++ b/package/python-betterproto/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_BETTERPROTO
+	bool "python-betterproto"
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_GRPCLIB # runtime
+	help
+	  A better Protobuf / gRPC generator & library.
+
+	  http://github.com/danielgtaylor/python-betterproto
diff --git a/package/python-betterproto/python-betterproto.hash b/package/python-betterproto/python-betterproto.hash
new file mode 100644
index 0000000000..8d23d2ae56
--- /dev/null
+++ b/package/python-betterproto/python-betterproto.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/betterproto/json
+md5  bd4192c2997959100097479c34ff87e6  betterproto-2.0.0b6.tar.gz
+sha256  720ae92697000f6fcf049c69267d957f0871654c8b0d7458906607685daee784  betterproto-2.0.0b6.tar.gz
+# Locally computed sha256 checksums
+sha256  a5b8df75467e4b57a308a94cce5fdae84808a83ee6cd5af7e175c6b9784a753f  LICENSE.md
diff --git a/package/python-betterproto/python-betterproto.mk b/package/python-betterproto/python-betterproto.mk
new file mode 100644
index 0000000000..95caf0945a
--- /dev/null
+++ b/package/python-betterproto/python-betterproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-betterproto
+#
+################################################################################
+
+PYTHON_BETTERPROTO_VERSION = 2.0.0b6
+PYTHON_BETTERPROTO_SOURCE = betterproto-$(PYTHON_BETTERPROTO_VERSION).tar.gz
+PYTHON_BETTERPROTO_SITE = https://files.pythonhosted.org/packages/45/43/4c44efd75f2ef48a16b458c2fe2cff7aa74bab8fcadf2653bb5110a87f97
+PYTHON_BETTERPROTO_SETUP_TYPE = setuptools
+PYTHON_BETTERPROTO_LICENSE = MIT
+PYTHON_BETTERPROTO_LICENSE_FILES = LICENSE.md
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
