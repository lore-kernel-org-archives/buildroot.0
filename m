Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF2EC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFAB840A6F;
	Sun,  5 Nov 2023 20:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFAB840A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IUGs1by2h-8F; Sun,  5 Nov 2023 20:29:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D34040A90;
	Sun,  5 Nov 2023 20:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D34040A90
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAB271BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3DD28200D
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3DD28200D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ey_yBBRlyxE3 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:23 +0000 (UTC)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA67B81F90
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA67B81F90
Received: by mail-pl1-x643.google.com with SMTP id
 d9443c01a7336-1cc1ee2d8dfso34387365ad.3
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215982; x=1699820782;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iJcB4OzaDiKOsPoE0DgipAcQyYeyl+enQ02uWVCOnDw=;
 b=IsMF3mDuEwZ8n7DX/b2KbsM/eBv28yfi720vT4pe3hyk6e6qCndYFnqPz6weOLCtTX
 H+tGGgBaEyU5UjSp7iN+U4plwXaxwiT6LQWewb5YiS9Fg1dNr8/SnRcJk6mIM2vA0lPt
 2bqle89YSQjxCPizP/oTenhtcV14MJ/8GO/WoE3FIh+M/sriwi9W//Sufkl3DHQvD4ih
 O0s7P/rvgrjbPXVFwEvfgito6fYNYnEutl1O2v5Zmuff6of82ZIOs4dlEfjy40kzj+nF
 yGTnFUHLy6N+oHFUmInHTgz9p7MbTXowgoo129BCPCFeIklo63K0rRSzrUHlsHpD9Ez6
 8BLw==
X-Gm-Message-State: AOJu0YzZKaNg4caRb1kKVZnQiw5gYDdJrfrx4l/MpymewMQiFrzWg2RS
 QUV9S+jFnh13InHrH3K7jt2REJLCQJ3Ju6qzkrYZ/iUdpp8=
X-Google-Smtp-Source: AGHT+IHMt9oFjK4rXPoRTImBsIPI3lrRzsj+3fw22ik09UN4JGcHb9YLNmDTvnKiVywHHgFW7dM3eQ==
X-Received: by 2002:a17:902:d3cc:b0:1cc:9781:4785 with SMTP id
 w12-20020a170902d3cc00b001cc97814785mr9829717plb.50.1699215982479; 
 Sun, 05 Nov 2023 12:26:22 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:21 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:47 -0700
Message-ID: <20231105202555.359391-16-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215982; x=1699820782;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iJcB4OzaDiKOsPoE0DgipAcQyYeyl+enQ02uWVCOnDw=;
 b=gdcVztHVvMyKQ9pBEi+ZTbilY8JRZc5q4sfL5kdSvTh34ZG9QqTbHOapssuSPw1kyZ
 JYsclK6GNK7Atn2IGQJWRyB6Qg0dTyORkP1Y2RJnFeNlArDcuFnmBNmth+cBbXDKUN63
 Vs9ZtkvjcCuhdQl685U0THuuhEDei6NnwSxiI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=gdcVztHV
Subject: [Buildroot] [PATCH v2 16/24] package/python-versioneer: new package
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
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Used with the latest version of python-constantly. It is only needed as a
host package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Add this package

 DEVELOPERS                                       |  1 +
 package/python-versioneer/python-versioneer.hash |  5 +++++
 package/python-versioneer/python-versioneer.mk   | 14 ++++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/python-versioneer/python-versioneer.hash
 create mode 100644 package/python-versioneer/python-versioneer.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d096ab0449..3334cad77f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/python-versioneer/
 F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Heinrich <adam@adamh.cz>
diff --git a/package/python-versioneer/python-versioneer.hash b/package/python-versioneer/python-versioneer.hash
new file mode 100644
index 0000000000..44cbeb1593
--- /dev/null
+++ b/package/python-versioneer/python-versioneer.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/versioneer/json
+md5  1703d6ced3656553066fa71e42c5eee6  versioneer-0.29.tar.gz
+sha256  5ab283b9857211d61b53318b7c792cf68e798e765ee17c27ade9f6c924235731  versioneer-0.29.tar.gz
+# Locally computed sha256 checksums
+sha256  b5065838cbac452dfc855ba6e6e031481ad2c68406f70d21ead9321374653e6c  LICENSE
diff --git a/package/python-versioneer/python-versioneer.mk b/package/python-versioneer/python-versioneer.mk
new file mode 100644
index 0000000000..5dbf0dd1c2
--- /dev/null
+++ b/package/python-versioneer/python-versioneer.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-versioneer
+#
+################################################################################
+
+PYTHON_VERSIONEER_VERSION = 0.29
+PYTHON_VERSIONEER_SOURCE = versioneer-$(PYTHON_VERSIONEER_VERSION).tar.gz
+PYTHON_VERSIONEER_SITE = https://files.pythonhosted.org/packages/32/d7/854e45d2b03e1a8ee2aa6429dd396d002ce71e5d88b77551b2fb249cb382
+PYTHON_VERSIONEER_SETUP_TYPE = setuptools
+PYTHON_VERSIONEER_LICENSE = Unlicense
+PYTHON_VERSIONEER_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
