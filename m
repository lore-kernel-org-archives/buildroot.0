Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D20C352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 15:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B83581308;
	Tue,  6 Dec 2022 15:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B83581308
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54l8iXyFTi7S; Tue,  6 Dec 2022 15:29:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8161A812F9;
	Tue,  6 Dec 2022 15:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8161A812F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 657321BF3FF
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 15:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40626812F9
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 15:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40626812F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0y132M81LWVc for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 15:29:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C6C812EB
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12C6C812EB
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 15:29:34 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id n21so7031600ejb.9
 for <buildroot@buildroot.org>; Tue, 06 Dec 2022 07:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AMttAlD/1P3B8LLu4E16B9qUPz5H6wj76/lQB+qsBEg=;
 b=KyLiO/ngcaaJq5FyfkDYvM0h7RIkExI/3e+zw+8/NBcBEgbeh55YDp/qgc2/UnM5wQ
 IeXJ4aJKacxWp9Ou0TKj6mxp8j2lhfUdpdwoIliDC2Sey2WIaHec8wEbT3agFfsuc30q
 SbnQGhIFispOgmQ+5jKhuukVNm1EJJ4HvvdGLuUfRD0uvRh7Nfc6BOO1njy9rsSDsh3w
 u1iOpOhAEHDZ99OSUw8UCS595KkgvjNU+VApLyuBcsAzQ7brD+9kEpIKljZdf2IWg7kF
 wUrwVxtLbDBf+HyB2DRs4REQDGgyIlyGi5cUMi084pneP5Fp44mgFeGFlI0eLaAI3uJz
 jtKw==
X-Gm-Message-State: ANoB5pmnIk3tlM/Z4pbHMjU4moSKvw2wxp+OXV2V9jBgDSAoEJYLrqwT
 J85d/Reqeit4WAP8Rx6boERTNny9Pss=
X-Google-Smtp-Source: AA0mqf4PDdXGj5erHsEuQs0bcaEeT9mbMbvKjBQeVE1YNUkzf27Vx0PFsribhifU6mjvpLUGKo88vw==
X-Received: by 2002:a17:906:2552:b0:7ad:917b:61ec with SMTP id
 j18-20020a170906255200b007ad917b61ecmr60076428ejb.513.1670340572824; 
 Tue, 06 Dec 2022 07:29:32 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 e10-20020a056402088a00b00463bc1ddc76sm1100099edy.28.2022.12.06.07.29.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Dec 2022 07:29:32 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  6 Dec 2022 16:29:21 +0100
Message-Id: <20221206152921.22698-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AMttAlD/1P3B8LLu4E16B9qUPz5H6wj76/lQB+qsBEg=;
 b=hQt4eKOsDOAHtWWfHloY+II5hDmxduybffDs8sH7j5fePOlCD53gb/BkcWwYc2EjSR
 A9JZTZEnECdxsBKpH6dgDQ8ixXpTlszBqASQz2dehzzps4M5M8OXOQdAXmDl1nVq4u7O
 EBu48hv50uUAE4FRn/LgXCLngIu/A/KTfDQgmfTovmGQHSio+qMRxmdZ0fh2Vrhv+ZlS
 IzvTXM+jA1fU79296V5+oXsjXFzeH6FjTiIczSBmhhuS8EddzpmyB4CzvTSO5ydC+Swt
 vcWhcLARjwT7VSpw4nlIT7qO0+IzeqhZVXD0IHmJdpqCNh0R763Y5tTgH1kSkysJU9PM
 GWLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hQt4eKOs
Subject: [Buildroot] [PATCH v2] package/python-dicttoxml: remove package
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
Tested-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
---
Changes v1 -> v2:
	- fix indentation

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
index 522102a0c0..99322e2e2b 100644
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
+	  python-dicttoxml2 instead.
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
