Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09632C352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 13:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B2C941775;
	Tue,  6 Dec 2022 13:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B2C941775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ggkIqokrgKXt; Tue,  6 Dec 2022 13:18:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 162A241773;
	Tue,  6 Dec 2022 13:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 162A241773
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C22441BF3F7
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 13:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A35F640272
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 13:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A35F640272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WrGPuvSrqFGB for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 13:18:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F110409EE
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F110409EE
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 13:18:09 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id t17so6161567eju.1
 for <buildroot@buildroot.org>; Tue, 06 Dec 2022 05:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eVo4pUC5ic1h504Sqhl0Kjw9P79qDZRQvuEXCBuLwqE=;
 b=q++BJGqauGXYOzlpFazhHvDZkaBy03UkX2o8+S1wLUCxtm2rnc3yscK2q5PEjAWMZA
 INcRrRHiWoyBVWJNlfCVCBInWio0UXz7HBZ3IbrYQ16aqMC1HW3Xf7o59q2kKQSF+VBN
 YZjD8iiSf/wz3WcZLTkXRF1rGRe12pa6lm1ZhBvkLAQ1xTmezxVejQvOoKDkVEjqvcZ6
 beVCWhCB+F2+oY4IffabRAlAVEg405jyKd860C1QsTi1zqABdXxz/9KBvMhFSxJ8sNc3
 zCSOY4BgrX/XWmev1EBxeEexn3tidN5QY55R3QbTnluXfQwA/ei7QhLrzDSFdkq4FPKE
 1o8A==
X-Gm-Message-State: ANoB5pkywU1f+upVJoGq3/y4zSX4mdExP82X4F1O7KgXUkMdlNdKggso
 w848py+w+ZLu/2g20RXQBVEFckqT02w=
X-Google-Smtp-Source: AA0mqf6nT7J+BTJdVqUsdJvgz9yTUl+whO3wrGuprgkmYy4cerUUUsZWq3VHKV02pNWQWby+HFJJXw==
X-Received: by 2002:a17:906:5f8d:b0:7c0:e0d7:38d4 with SMTP id
 a13-20020a1709065f8d00b007c0e0d738d4mr9846921eju.428.1670332687393; 
 Tue, 06 Dec 2022 05:18:07 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b0078d9cd0d2d6sm7521401ejo.11.2022.12.06.05.18.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Dec 2022 05:18:06 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  6 Dec 2022 14:18:01 +0100
Message-Id: <20221206131801.20376-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eVo4pUC5ic1h504Sqhl0Kjw9P79qDZRQvuEXCBuLwqE=;
 b=S96ruYUrebrktuRdPI9U5W77oQQsyDc5i4ku1RJmAlZJob9NET2/JUHvuiGskccu1J
 bHJK/Pjts2A8v4pW2VxFvpKS2RlolzVEJD5FIDVUJ0+B+G2GxAtWGxC2N5bcHTOKExTJ
 oJ4/pw9QqSoUPsPr+Tqwd83EZwAfNughHFYT9HOxK9xuwa9gDhwizdcmllTpnS5qy2Wz
 6kefVhNnTzVH4+7hLczXBgSV7B4r6x7pJ4EUSnf/aT22aAeDnSJJpxSz0BPY81FIkquH
 +AOGGsqkQmdANX+GrtXpHKkphv9AVEgq+YVlFh7RKu3ELzpB3y19EesKZ22HMo8HNs0H
 VqmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S96ruYUr
Subject: [Buildroot] [PATCH] package/python-dicttoxml: remove package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Package was removed because it was unmaintained. Use
python-dicttoxml2 instead.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 Config.in.legacy                               |  8 ++++++++
 package/Config.in                              |  1 -
 package/python-dicttoxml/Config.in             |  8 --------
 package/python-dicttoxml/python-dicttoxml.hash |  5 -----
 package/python-dicttoxml/python-dicttoxml.mk   | 14 --------------
 5 files changed, 8 insertions(+), 28 deletions(-)
 delete mode 100644 package/python-dicttoxml/Config.in
 delete mode 100644 package/python-dicttoxml/python-dicttoxml.hash
 delete mode 100644 package/python-dicttoxml/python-dicttoxml.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 522102a0c0..12839b24a0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -154,6 +154,14 @@ config BR2_PACKAGE_USBREDIR_SERVER
 	  0.13.0. usbredir tools (which include usbredirect binary) can
 	  be used as a replacement.
 
+config BR2_PACKAGE_PYTHON_DICTTOXML
+	bool "python-dicttoxml removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_PYTHON_DICTTOXML2
+	help
+	  Package was removed because it was unmaintained. Use
+          python-dicttoxml2 instead.
+
 comment "Legacy options removed in 2022.11"
 
 config BR2_PACKAGE_RABBITMQ_SERVER
diff --git a/package/Config.in b/package/Config.in
index f4a423c7a6..58edd43432 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1022,7 +1022,6 @@ menu "External python modules"
 	source "package/python-decorator/Config.in"
 	source "package/python-defusedxml/Config.in"
 	source "package/python-dialog3/Config.in"
-	source "package/python-dicttoxml/Config.in"
 	source "package/python-dicttoxml2/Config.in"
 	source "package/python-distro/Config.in"
 	source "package/python-django/Config.in"
diff --git a/package/python-dicttoxml/Config.in b/package/python-dicttoxml/Config.in
deleted file mode 100644
index 145887eddc..0000000000
--- a/package/python-dicttoxml/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_DICTTOXML
-	bool "python-dicttoxml"
-	select BR2_PACKAGE_PYTHON3_PYEXPAT
-	help
-	  Converts a Python dictionary or other native data type into
-	  a valid XML string.
-
-	  https://github.com/quandyfactory/dicttoxml
diff --git a/package/python-dicttoxml/python-dicttoxml.hash b/package/python-dicttoxml/python-dicttoxml.hash
deleted file mode 100644
index d8c43d0144..0000000000
--- a/package/python-dicttoxml/python-dicttoxml.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5 from https://pypi.python.org/pypi/dicttoxml/json
-md5  ec5643a048cf32dad3c28db236b923e4  dicttoxml-1.7.4.tar.gz
-# Locally computed
-sha256  ea44cc4ec6c0f85098c57a431a1ee891b3549347b07b7414c8a24611ecf37e45  dicttoxml-1.7.4.tar.gz
-sha256  4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
diff --git a/package/python-dicttoxml/python-dicttoxml.mk b/package/python-dicttoxml/python-dicttoxml.mk
deleted file mode 100644
index 537afff601..0000000000
--- a/package/python-dicttoxml/python-dicttoxml.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-dicttoxml
-#
-################################################################################
-
-PYTHON_DICTTOXML_VERSION = 1.7.4
-PYTHON_DICTTOXML_SOURCE = dicttoxml-$(PYTHON_DICTTOXML_VERSION).tar.gz
-PYTHON_DICTTOXML_SITE = https://pypi.python.org/packages/74/36/534db111db9e7610a41641a1f6669a964aacaf51858f466de264cc8dcdd9
-PYTHON_DICTTOXML_SETUP_TYPE = distutils
-PYTHON_DICTTOXML_LICENSE = GPL-2.0
-PYTHON_DICTTOXML_LICENSE_FILES = LICENCE.txt
-
-$(eval $(python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
