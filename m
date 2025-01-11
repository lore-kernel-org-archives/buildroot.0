Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11633E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5FAC61091;
	Sat, 11 Jan 2025 18:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PMMTYP-eq0k; Sat, 11 Jan 2025 18:15:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4288610B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4288610B6;
	Sat, 11 Jan 2025 18:15:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E09E942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 086254086E
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1y8EwY_42Xj4 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:15:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B85C5400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B85C5400F9
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B85C5400F9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:15:16 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-844df397754so94389039f.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736619315; x=1737224115;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cODIBXbHL1VmoA5pv7koBdAYQ6JgRG7VRJzFMNLy5pw=;
 b=Hhx6sSwktaTf0rqLzpZ1gtypMhXSzrqUuXcXYDkCZ9hvcM9eeKaaeCYNtl3fgSfHC0
 pI3nYsEzmkwAT1q651xLsItJLhcxYnErcSCQLDNoo+M5oRdi7+SvyZrfdPYlcoNJHhLP
 owQIgjCeVsnFx8bSImpApY7HRaO2bZwazKfa9uyr+zTjcoqoHN2MjFnCDjRJn8PSU+qa
 XSRiBLMOGX9Os0A2gGX0W+N7L9tWFaEs/NbjcP0UuDj5H3eZWB4OTv3/DvtJJGFI9asE
 vaDXB342KkF/li7Ipfr8MtjGx2tORVVveSUIQaCCMZ6B92EWCxGiIXVrz8ZiiU/bNcdu
 9G1g==
X-Gm-Message-State: AOJu0YwE6J49w2rbALN5kgbBmEIY4dyPw+97Spj5OsMEtwfZbxeR8nlJ
 qk1vRi3Pg1J3jZpG4UC6dtJLg7KA9xPFa4aZDKxmaMxR80MF3vsxm3jxhCxR0Ok=
X-Gm-Gg: ASbGncvdO7OuJhN0ZvVR5QgAJdJQDlCdVzymz5f+aKabC5rL3KEeqaH5vgzxV5m3ifn
 B+jgS6Oz8uzKIsnQUDQ88/wxlJSR1Pi7tgC95j6uFUWZk+kgSSzUO4QksCE9reSKI2T6GjhYhfN
 pPuVauikfL0NFCILu6LkX/e8QmVGAZxctAO1ylnrZf8ml1XQnbj+iNRLAZFWGVr0pIBsrVXpZLg
 K/axvYUHL56pYk+sotnQB7fOzuG7x7SF3fmbuBu32iSAXq05JQw42FlelGN6q1MZoDRoAYFiXDm
 rGZlYsmAXqhbldghYG0eG2tkpu4yQhs=
X-Google-Smtp-Source: AGHT+IGaaf4oh6dyQdilbiMpExJCjRGM7rB3+1owYv17YEIZUcG2VyRi+QoT+x9OvR5Asy4wz2xz5g==
X-Received: by 2002:a05:6e02:1547:b0:3cd:b013:5c12 with SMTP id
 e9e14a558f8ab-3ce3a9d40b5mr118574665ab.20.1736619315342; 
 Sat, 11 Jan 2025 10:15:15 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce69d29362sm1484955ab.48.2025.01.11.10.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:15:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:15:13 -0700
Message-Id: <20250111181513.2928154-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736619315; x=1737224115; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cODIBXbHL1VmoA5pv7koBdAYQ6JgRG7VRJzFMNLy5pw=;
 b=JiFZJWNhjKpxQpuZIQ30n6O4YZgzbf3Fly5y4lkimZqnNBh5pxqVEybbFpKbhsgoUa
 KEcgcEbqGbYZNMHj6pjpI4jyOOEi/fEPAp1Y+FpIDaKJHwU0cZeaf4faAQvqLvih+1Jh
 7yGpdQy4l5sfdIq4buoB+BpM+SOW03RoKm324E4wcERXj4uz+OWVJg5i4hPRxiEfCAkY
 O7LnaLGNDLBOXrvF7ofic7c7nJBX5BbLtv2joYy6qqzbl+ENOBDh6deItshpjmCLJGRL
 63t+/XRNaGwbNbuYwuVXvoX3dHh+7pUbUj3RqUUEsrcwtNW02pO6L8VkFO8vYZfzsZfB
 dYvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JiFZJWNh
Subject: [Buildroot] [PATCH 1/1] package/python-tempora: bump to version
 5.8.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace python-pytz runtime dependency with python-dateutil.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tempora/Config.in           | 2 +-
 package/python-tempora/python-tempora.hash | 4 ++--
 package/python-tempora/python-tempora.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tempora/Config.in b/package/python-tempora/Config.in
index 3f4481422a..1e496faa27 100644
--- a/package/python-tempora/Config.in
+++ b/package/python-tempora/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_TEMPORA
 	bool "python-tempora"
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	help
 	  Objects and routines pertaining to date and time.
 
diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index 9d3487d67b..15bdaaf783 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tempora/json
-md5  e4ca48a06f4c8b9aa21b8081937353f2  tempora-5.7.0.tar.gz
-sha256  888190a2dbe3255ff26dfa9fcecb25f4d38434c0f1943cd61de98bb41c410c50  tempora-5.7.0.tar.gz
+md5  ca7fb7c9523fb5232b734a19dae05c6a  tempora-5.8.0.tar.gz
+sha256  1e9606e65a3f2063460961d68515dee07bdaca0859305a8d3e6604168175fef1  tempora-5.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index aeb2e4687c..3b6c644b53 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEMPORA_VERSION = 5.7.0
+PYTHON_TEMPORA_VERSION = 5.8.0
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/5d/52/b4ff0ca21695a4f8ac0f158d884587b5eba08b0e95356b0ea210e00446ac
+PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/c3/f2/bbd6d2178791eaf8bac06857cb0ee39840e69f7b64ecb0c414bf8f46daff
 PYTHON_TEMPORA_LICENSE = MIT
 PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
