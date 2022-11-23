Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A57DC433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 10:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A54048207C;
	Wed, 23 Nov 2022 10:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A54048207C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0QB3v6jEw7I; Wed, 23 Nov 2022 10:30:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D334382040;
	Wed, 23 Nov 2022 10:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D334382040
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 192FD1BF85D
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E87418205B
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E87418205B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eak48t_U2amI for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 10:30:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D589581FBB
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D589581FBB
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 10:30:31 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z18so24214266edb.9
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 02:30:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nmhlJns6BfBaAxfD/NuZZm1QmQyKYq4pVoc7CILu5q0=;
 b=GIaoNnbAg+eVR63eBE1BFQRc/Jnfk9J4s+NPf1akwZUu47CWfjqrgUhAOOFUTC/wT1
 65HZE9vP7gTVk3eN4Gbkj5ffYhSj9xrstWMZlqh3vZuXSE4SNS88Q57E6UjShy9Le3rK
 aWj7S0lYkuQclPdAYSdmlIlukY7BVYNjPn6iBdsROh90W5/eBAkJOWtSsCHizG8Jisd0
 YcyCwhH0saskH0m+ApLxPXPwDAZFCMcYSFPrML+717iTTVa5QlpueKWpu/EUq/r66Q56
 sfhhsMZwrAhqe5fIuIJzrgAnHEtnhFx413j3olUrTNJbDiuHyNq8ZiSAjn4giafnFZ82
 HEKw==
X-Gm-Message-State: ANoB5plLOEY2EA+D9jRSi0dzXBLqaBSNnlUC3k/7AKSMA1iYYllZhVDr
 6QbxdXU371Yj4mZiXIen1lAeL9gTrPQ=
X-Google-Smtp-Source: AA0mqf61iR6rXxwMj1pUuFmohrmPVgUfKD9ai8ppcshiS0mHzFfXcgbdsu2aFHVfNcLNgSjD5kJCUw==
X-Received: by 2002:a05:6402:1caa:b0:467:78ce:5fe6 with SMTP id
 cz10-20020a0564021caa00b0046778ce5fe6mr9193649edb.325.1669199429777; 
 Wed, 23 Nov 2022 02:30:29 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 u8-20020aa7d548000000b00459cd13fd34sm7485949edr.85.2022.11.23.02.30.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Nov 2022 02:30:29 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:30:22 +0100
Message-Id: <20221123103022.17397-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nmhlJns6BfBaAxfD/NuZZm1QmQyKYq4pVoc7CILu5q0=;
 b=fNeYXl4nQZ7uz7e8eAOTgjfscO4u+cBxq+ElUOOLSsTgeI+eIVoJWwQmg715n+XGH6
 CgUmDrUMWbJzuR5r4gpQO1xABg2KiJKIWPyiKCLJhDLqr3OJTQsa+toHVR+RtJy+ZZd4
 FbXt3hgfC0fyr1NidJTFlYypuNMBg6PnbBLuGkRa84RQEczrVZYt75dOMK4lBna9NlNO
 MdAE7OjvyhT2SeIVd05dKr+00AwaYAUJYB28MeXKorrlwOtSCcQ5QRkoKJOYipgix2hj
 9vjamTEIwqGU/rGnyNBk7x9T5AhDCccIfl3ARWC9yF/7JSrzghyd9T1khsll8TwPJGBJ
 ZVdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fNeYXl4n
Subject: [Buildroot] [PATCH branch/next] package/python-dicttoxml2: new
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Add a maintained fork instead of the abandoned dicttoxml.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                |  1 +
 package/python-dicttoxml2/Config.in              |  8 ++++++++
 package/python-dicttoxml2/python-dicttoxml2.hash |  5 +++++
 package/python-dicttoxml2/python-dicttoxml2.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-dicttoxml2/Config.in
 create mode 100644 package/python-dicttoxml2/python-dicttoxml2.hash
 create mode 100644 package/python-dicttoxml2/python-dicttoxml2.mk

diff --git a/package/Config.in b/package/Config.in
index cafd3b338c..7d227f8112 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1021,6 +1021,7 @@ menu "External python modules"
 	source "package/python-defusedxml/Config.in"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dicttoxml/Config.in"
+	source "package/python-dicttoxml2/Config.in"
 	source "package/python-distro/Config.in"
 	source "package/python-django/Config.in"
 	source "package/python-django-enumfields/Config.in"
diff --git a/package/python-dicttoxml2/Config.in b/package/python-dicttoxml2/Config.in
new file mode 100644
index 0000000000..0bd8068dd6
--- /dev/null
+++ b/package/python-dicttoxml2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_DICTTOXML2
+	bool "python-dicttoxml2"
+	select BR2_PACKAGE_PYTHON3_PYEXPAT
+	help
+	  Converts a Python dictionary or other native data type into
+	  a valid XML string.
+
+	  https://github.com/Ousret/dicttoxml
diff --git a/package/python-dicttoxml2/python-dicttoxml2.hash b/package/python-dicttoxml2/python-dicttoxml2.hash
new file mode 100644
index 0000000000..7f584cc000
--- /dev/null
+++ b/package/python-dicttoxml2/python-dicttoxml2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dicttoxml2/json
+md5  787ea4b80cd6234a41c016e8efa7ff40  dicttoxml2-2.1.0.tar.gz
+sha256  67cb729f337dd752808c021b70c8df8a34f84b9e111a5dbaa37e000eeaf4d462  dicttoxml2-2.1.0.tar.gz
+# Locally computed
+sha256 4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
diff --git a/package/python-dicttoxml2/python-dicttoxml2.mk b/package/python-dicttoxml2/python-dicttoxml2.mk
new file mode 100644
index 0000000000..d2abe63860
--- /dev/null
+++ b/package/python-dicttoxml2/python-dicttoxml2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-dicttoxml2
+#
+################################################################################
+
+PYTHON_DICTTOXML2_VERSION = 2.1.0
+PYTHON_DICTTOXML2_SOURCE = dicttoxml2-$(PYTHON_DICTTOXML2_VERSION).tar.gz
+PYTHON_DICTTOXML2_SITE = https://files.pythonhosted.org/packages/0b/24/7a6d37b2770843e34685e470fd711955cb0f77c354c73d8ca64b02420bce
+PYTHON_DICTTOXML2_SETUP_TYPE = setuptools
+PYTHON_DICTTOXML2_LICENSE = GPL-2.0
+PYTHON_DICTTOXML2_LICENSE_FILES = LICENCE.txt
+
+$(eval $(python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
