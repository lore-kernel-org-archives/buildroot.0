Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F7EC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 05:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDBFA40225;
	Thu, 11 Jan 2024 05:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDBFA40225
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y-EIBx735I7D; Thu, 11 Jan 2024 05:57:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31A4E40016;
	Thu, 11 Jan 2024 05:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31A4E40016
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33BB11BF313
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08DA683DEE
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08DA683DEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wi2hIaJiDgpD for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 05:57:46 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A7E783DEB
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 05:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A7E783DEB
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3608aa647bfso18340825ab.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:57:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704952665; x=1705557465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=klTK8ui8G++RSTIyCpChyn/+0r6EjBazqhYssDXkyZ4=;
 b=EVh2s6IbawqLdK7s8yUC2iiWlR23T9y0hvUl+jyiY+hShH3Ugcd5MYNk6A7owdb4r+
 d5Teb/ZNXoPf02SAZkShgQNrF6zMqmBp3o6dHSq/eXaFZfSnLvfXK9m+4wHH3IAO3P7N
 IfAZt5K4tbOuzKxXZRpAxlYjgLGx67I7IT01hwLxZp+b0ydN5q87st9Ku11uWcXrTsXl
 fgAgw3CtpsBvX9l9f2rSYApZdD40uttKJKvyLDqFoBICnIXWZxbx4bhER6RqF9AUyMX5
 oDzq/OCefiyceZjhghBaaHCo2uDmFM2VrYm2Z55/OLPnpwfZb+KRyoV+wtcFFwg1PO/Q
 J3ZQ==
X-Gm-Message-State: AOJu0YyGBjm86TyWsU1RJKhDqneDuQ3X13IjrDt3f1+UxFtJSPS7KmmS
 Ht6zidNOQCeR2kF4gxzgVk17FSC5eTqDBA==
X-Google-Smtp-Source: AGHT+IGglgBhGVgoQVvuMyY51xyUM+bUYQKnga4+Gr6T4aZReYJOrk2q4zwHKnpW98bZTptWd+YLzg==
X-Received: by 2002:a05:6e02:1685:b0:360:6db6:7e9c with SMTP id
 f5-20020a056e02168500b003606db67e9cmr991337ila.9.1704952664723; 
 Wed, 10 Jan 2024 21:57:44 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 12-20020a056e0216cc00b0036002c8127asm91618ilx.5.2024.01.10.21.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 21:57:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:57:42 -0700
Message-Id: <20240111055742.3023327-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704952665; x=1705557465; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=klTK8ui8G++RSTIyCpChyn/+0r6EjBazqhYssDXkyZ4=;
 b=jsS4PKXuGA/S1+spdFo7atWtc7kb2ByXsff7r4fevdGYvl6jNHZgFkMceONTGfYR4M
 Pi1Pznwi4ySjSfs3Ejq9hF9SVyH2+URo3hHxRhTBZNC+KuqHGsQvR43s7Kc6+cGcAYI9
 R14FbgCAMo2VmNagcw2jgh1AdAwHU5ex0u9zyDkXXyUPMJmfP9v0pc/RX7qrFU7jY3X+
 xXp4TnYu9Bs31VUWE1Hvh+MBwN7IW2l1Wpmxwm3GUSy3EIds9t9/8eivfRSgEZ79EAPh
 aumTD+1js8YT2IBTg1Kvkr4VYfheWD46PK0k44Kj6crlJnvjVTAjhaH+pNLovbcvrXL9
 fgeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jsS4PKXu
Subject: [Buildroot] [PATCH 1/1] package/python-selenium: bump to version
 4.16.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-selenium/python-selenium.hash | 4 ++--
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index 03a9683a21..ef1c34bfd3 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/selenium/json
-md5  02404033a10b2b29aa098f50503c0a1a  selenium-4.9.1.tar.gz
-sha256  3444f4376321530c36ce8355b6b357d8cf4a7d588ce5cf772183465930bbed0e  selenium-4.9.1.tar.gz
+md5  9afd7110a9e06721baae028ac42a2221  selenium-4.16.0.tar.gz
+sha256  b2e987a445306151f7be0e6dfe2aa72a479c2ac6a91b9d5ef2d6dd4e49ad0435  selenium-4.16.0.tar.gz
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index d59a16a57d..0428cefa46 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.9.1
+PYTHON_SELENIUM_VERSION = 4.16.0
 PYTHON_SELENIUM_SOURCE = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE = https://files.pythonhosted.org/packages/fd/e2/0e5bee6762a7bf7852b47a79c5b12f9e526e6962958dbb9719fa490ba24c
+PYTHON_SELENIUM_SITE = https://files.pythonhosted.org/packages/16/fd/a0ef793383077dd6296e4637acc82d1e9893e9a49a47f56e96996909e427
 PYTHON_SELENIUM_SETUP_TYPE = setuptools
 PYTHON_SELENIUM_LICENSE = Apache-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
