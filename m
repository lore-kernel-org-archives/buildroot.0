Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4585C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 17:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24361409FE;
	Sat, 10 Dec 2022 17:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24361409FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EhLuwZIzdJGC; Sat, 10 Dec 2022 17:13:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E25CD40F4E;
	Sat, 10 Dec 2022 17:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E25CD40F4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0E721BF3FD
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8856260806
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8856260806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zWcl4baYgsIq for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 17:13:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F025606FF
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F025606FF
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 17:13:33 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id j28so1418530ila.9
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 09:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2dVw4KPKnZTGhu1Y/jels7yeFDtW69GJ46POylz7CA0=;
 b=zxNHltyqeKmfpxdK+xwWHUM+klssj+jEIt4nbHqsfrKHQ/0aYqHOcqdRsmNjYdwm5x
 PoiSHvn3OxqVwmZdeMf8QOAwzMjjlT9KLadmnKiIjCYulVu2nRgMK4mdofvX8eanmnYZ
 yS7wJfY7TyoesXf/apbth7I8wg4ltaAfYD0EPQP1SkYcpYUOdd1byOzaZUT7Mz8amKGh
 JcTuVzy1gROhjmaEOZiWsGekxwcVhyZLE2vPFkZMFFoC0GNbU5K0kkmDAAcRUBxLX/CK
 gYX8ZKwLqdeXffBIg//E9DIdrXIg0xFUD+4mDDsouhxLMNCEclmoTJ2DdqQmSFjfEFfZ
 AGhg==
X-Gm-Message-State: ANoB5pkvUkk9Sb4L17qingvdBFYFs78tIrpDvVJaXpc/zFZjxDPwuw51
 jBo1JdMCsimHWQhd2Pl6SPZ77xYD5jkOoQ==
X-Google-Smtp-Source: AA0mqf7vmw6Aur70btAJOMY4ZVfbAbIM8WF9fCjHXTM0SBXgkE7HHS0UHggJaTd21awScZmSA5WSMQ==
X-Received: by 2002:a05:6e02:e12:b0:304:af35:a464 with SMTP id
 a18-20020a056e020e1200b00304af35a464mr248790ilk.8.1670692412296; 
 Sat, 10 Dec 2022 09:13:32 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 m7-20020a026d07000000b003633848da58sm1563440jac.41.2022.12.10.09.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 09:13:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 10:13:30 -0700
Message-Id: <20221210171330.2608790-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2dVw4KPKnZTGhu1Y/jels7yeFDtW69GJ46POylz7CA0=;
 b=mTAlaZgqoCFIQPVP/6R5gcqCtpUKeXZ1ERC7kKhxsbFAG8z7seinkf5fgm/SYDrmQl
 uDglETcpkwZGeAonHzAOrNJFdR1IhgbQmM3sptg67AVnGHB5hcRThZc/2DaqqaOei5gZ
 LxjKqS9i9I3FDj+dkUjO4JzEKsaVer7HxWS+zFUDP5caMGQPii0XwDwBqMBk8PqnNoVG
 nDgLAS212I86JvmMzQc9wizflH/NpN0rcCf6y1SufqsLa3KZufVaP0ALnm4KzMlk25xj
 yAhJwaQwPyDmHh9zzy9u0BQpo96ZkOi1X3GSkN6bfGRBs0x1z3Kwqh+ty/QVQdkFGP5Q
 iT3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mTAlaZgq
Subject: [Buildroot] [PATCH 1/1] package/python-dnspython: bump to version
 2.2.1
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport patch removing wheel dependency.

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...move-spurious-wheel-build-dependency.patch | 29 +++++++++++++++++++
 .../python-dnspython/python-dnspython.hash    |  4 +--
 package/python-dnspython/python-dnspython.mk  | 20 ++++---------
 3 files changed, 36 insertions(+), 17 deletions(-)
 create mode 100644 package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch

diff --git a/package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch b/package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch
new file mode 100644
index 0000000000..b43217edad
--- /dev/null
+++ b/package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch
@@ -0,0 +1,29 @@
+From 53b989e4ce32c941d748ad33502600497595914a Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 2 Nov 2022 14:01:58 -0600
+Subject: [PATCH] Remove spurious wheel build dependency
+
+Wheel isn't a build dependency so it shouldn't be in setup_requires.
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+53b989e4ce32c941d748ad33502600497595914a]
+---
+ setup.cfg | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.cfg b/setup.cfg
+index 0abd270..2cb3e06 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -46,7 +46,7 @@ packages =
+     dns.rdtypes.CH
+ python_requires = >=3.7
+ test_suite = tests
+-setup_requires = setuptools>=44; wheel; setuptools_scm[toml]>=3.4.3
++setup_requires = setuptools>=44; setuptools_scm[toml]>=3.4.3
+ 
+ [options.extras_require]
+ DOH = httpx>=0.21.1; h2>=4.1.0; requests; requests-toolbelt
+-- 
+2.34.1
+
diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
index c9c74c8d75..29441b41ea 100644
--- a/package/python-dnspython/python-dnspython.hash
+++ b/package/python-dnspython/python-dnspython.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dnspython/json
-md5  8a362d7b2358be3117683e2dbf9654fc  dnspython-2.1.0.zip
-sha256  e4a87f0b573201a0f3727fa18a516b055fd1107e0e5477cded4a2de497df1dd4  dnspython-2.1.0.zip
+md5  c7172f4115cd7b60fd5037cfcd8f9408  dnspython-2.2.1.tar.gz
+sha256  0f7569a4a6ff151958b64304071d370daa3243d15941a7beedf0c9fe5105603e  dnspython-2.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index 77e6082807..43030ae476 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -4,24 +4,14 @@
 #
 ################################################################################
 
-PYTHON_DNSPYTHON_VERSION = 2.1.0
-PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).zip
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/13/27/5277de856f605f3429d752a39af3588e29d10181a3aa2e2ee471d817485a
+PYTHON_DNSPYTHON_VERSION = 2.2.1
+PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/99/fb/e7cd35bba24295ad41abfdff30f6b4c271fd6ac70d20132fa503c3e768e0
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = setuptools
-
-define PYTHON_DNSPYTHON_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(PYTHON_DNSPYTHON_DL_DIR)/$(PYTHON_DNSPYTHON_SOURCE)
-	mv $(@D)/dnspython-$(PYTHON_DNSPYTHON_VERSION)/* $(@D)
-	$(RM) -r $(@D)/dnspython-$(PYTHON_DNSPYTHON_VERSION)
-endef
-
-define HOST_PYTHON_DNSPYTHON_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(HOST_PYTHON_DNSPYTHON_DL_DIR)/$(HOST_PYTHON_DNSPYTHON_SOURCE)
-	mv $(@D)/dnspython-$(HOST_PYTHON_DNSPYTHON_VERSION)/* $(@D)
-	$(RM) -r $(@D)/dnspython-$(HOST_PYTHON_DNSPYTHON_VERSION)
-endef
+PYTHON_DNSPYTHON_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_DNSPYTHON_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
