Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF4AC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 22:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F1FE811A2;
	Sun, 15 Sep 2024 22:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCa93rotwCSX; Sun, 15 Sep 2024 22:10:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B20781158
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B20781158;
	Sun, 15 Sep 2024 22:10:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66B8F1BF301
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 519AA40493
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KfW52WLeZId for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 22:10:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2AA26405DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AA26405DD
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AA26405DD
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 22:10:23 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b3dbso158795639f.2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 15:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726438222; x=1727043022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MH7knLOnUvT6OjEjnc/96vMk8gQ5fLcAMQ5XySqZtB0=;
 b=OkzP/MBV/AmnRoEccTLlMJcdr/xoPFf5G0lBlCbzRnvghThiXdt6eDnSlKpO+5Jtxw
 u8zhfAexSU1A/vui5P4KQHc1a+6FOR2v+UOOEtV6ccaDF76vk2jANaQgz7zpLx8SFXNR
 bHM0sUxTeD8h1UihoOcLz9XGB+gDRlRM9r7zskDPCUk8V5W/57TZld/DO1/LWPED7EyB
 KryZtAHhlzIjFDpn5+3b8MwHBkFxUjrEQKhiy+J4xA+DSfMxd8KC+exfkYxZFxWXFEdc
 Zge8j6m7cLePszejIXyffj68DXIIh0ywMSSzjLg+FEiIpd2glNMGAfHKI2qT96Fd8cmw
 ElMA==
X-Gm-Message-State: AOJu0YwSrIen0hEevDEB5AOuAAudN1av5l83H7OfTN3lA+vxkUywb0d4
 060aW47cUIeN0xh6CDw1IHW+9kUxPoFrpN2a9dwcN253kGxEVSc+qXR9qA==
X-Google-Smtp-Source: AGHT+IE0orpiWjoCSGui3AAy1XkWPW9Jbcs0EWe99aLV+GT94UJwoxTIFDPrv42LoY+18C5bKFvtMg==
X-Received: by 2002:a05:6e02:184e:b0:3a0:9c8e:9657 with SMTP id
 e9e14a558f8ab-3a09c8ea436mr21371825ab.3.1726438221846; 
 Sun, 15 Sep 2024 15:10:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec2068asm1137023173.60.2024.09.15.15.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 15:10:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 16:10:17 -0600
Message-Id: <20240915221018.1655380-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240915221018.1655380-1-james.hilliard1@gmail.com>
References: <20240915221018.1655380-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726438222; x=1727043022; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MH7knLOnUvT6OjEjnc/96vMk8gQ5fLcAMQ5XySqZtB0=;
 b=hDZVJmpxjQU+RpfKHjIS8aBlPiYUcsZA2ags0QTLcePWxaM9ri/bg4qsnD3u7UM1fj
 6hJLFNe+IhccrxWlaIgeQdi0dOymdF+je5vvlGuHG+ha8Mjd4YgsEqXjQYo+LSZ374Rl
 fQZ6IfT7tNACDLrPJi0zCtGqG6mJsZOWyi2dUKCXYsYw8sZgUMNpTFA9rKaKTsA2EIph
 Nwc0H1NlY8znf8OX5Gg1fyDsirxthDVNMjlP8bMZvROntkJE1V50LLt8t4GPZblPyI7z
 Bw2gP9E5ZOwaCENZtlniEfOtwB3MJe436pXncvfEoEkG/etMzR5x7JfVRd+eT43ssiR1
 QQow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hDZVJmpx
Subject: [Buildroot] [PATCH 2/3] package/python-zipstream-ng: new package
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-zipstream-ng/Config.in              |  6 ++++++
 .../python-zipstream-ng/python-zipstream-ng.hash   |  5 +++++
 package/python-zipstream-ng/python-zipstream-ng.mk | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-zipstream-ng/Config.in
 create mode 100644 package/python-zipstream-ng/python-zipstream-ng.hash
 create mode 100644 package/python-zipstream-ng/python-zipstream-ng.mk

diff --git a/package/Config.in b/package/Config.in
index a0d2f329b7..b48f9819df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1477,6 +1477,7 @@ menu "External python modules"
 	source "package/python-yatl/Config.in"
 	source "package/python-zc-lockfile/Config.in"
 	source "package/python-zeroconf/Config.in"
+	source "package/python-zipstream-ng/Config.in"
 	source "package/python-zlmdb/Config.in"
 	source "package/python-zope-interface/Config.in"
 	source "package/python-zopfli/Config.in"
diff --git a/package/python-zipstream-ng/Config.in b/package/python-zipstream-ng/Config.in
new file mode 100644
index 0000000000..2de36dd861
--- /dev/null
+++ b/package/python-zipstream-ng/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ZIPSTREAM_NG
+	bool "python-zipstream-ng"
+	help
+	  A modern and easy to use streamable zip file generator.
+
+	  https://github.com/pR0Ps/zipstream-ng
diff --git a/package/python-zipstream-ng/python-zipstream-ng.hash b/package/python-zipstream-ng/python-zipstream-ng.hash
new file mode 100644
index 0000000000..dd714389b2
--- /dev/null
+++ b/package/python-zipstream-ng/python-zipstream-ng.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/zipstream-ng/json
+md5  2b7cd8d72a047dd23363415d47096d6a  zipstream-ng-1.7.1.tar.gz
+sha256  f92023b9ca578cd7fdd94ec733c65664ecf7ee32493e38cdf8e365a1316e9ffc  zipstream-ng-1.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  LICENSE
diff --git a/package/python-zipstream-ng/python-zipstream-ng.mk b/package/python-zipstream-ng/python-zipstream-ng.mk
new file mode 100644
index 0000000000..5e26c9303f
--- /dev/null
+++ b/package/python-zipstream-ng/python-zipstream-ng.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-zipstream-ng
+#
+################################################################################
+
+PYTHON_ZIPSTREAM_NG_VERSION = 1.7.1
+PYTHON_ZIPSTREAM_NG_SOURCE = zipstream-ng-$(PYTHON_ZIPSTREAM_NG_VERSION).tar.gz
+PYTHON_ZIPSTREAM_NG_SITE = https://files.pythonhosted.org/packages/74/8c/682c8bb3085d2089e09c0b9393a12721d059dc0009da4e0b6faff6370679
+PYTHON_ZIPSTREAM_NG_SETUP_TYPE = setuptools
+PYTHON_ZIPSTREAM_NG_LICENSE = LGPL-3.0
+PYTHON_ZIPSTREAM_NG_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
