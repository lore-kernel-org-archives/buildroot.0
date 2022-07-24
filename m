Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825A3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 02:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1020C42451;
	Sun, 24 Jul 2022 02:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1020C42451
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99GnDt5HUY5n; Sun, 24 Jul 2022 02:29:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB42442446;
	Sun, 24 Jul 2022 02:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB42442446
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDC371BF4E7
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B41F561069
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B41F561069
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Q1lE80bGg0n for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 02:29:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3D5061060
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3D5061060
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:29:45 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id h14so4052675ilq.12
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9B+fvM0rsNTT5tYqvOhoBsAv9aB7lCnz3ddEGfY07Oc=;
 b=cB4nHcb2H7EWCVTic7K7Soqm5dN4GE/mgOft5upbPY8JFl4lMfpiNeIOIl96ur1RyF
 nAerIHprELX8v5qhMKdOnd+8Orx8gp3PdJA0cjSCkzOBNMT29os1Db8/k4xTpAmkyUYL
 XxRK5FZWDnlg37Ok6ZtMLFM3s3ie1+/D5UPWr//mMNzZeEcRCNb9RJ+O6dlv0K+bDsVx
 l+DpufwDwIio2/OkZSBb+hjF4kL6I+dY+qCnkFQyi3UO1IqtrIeDSM3+pc8eJ2cLP6N6
 QFTkEAq/PUi2E85xl/MMYWOef7Kt+hiMi9lqvAMHxFpjpY52Emevjz9RihqtCz4M4yNG
 znIw==
X-Gm-Message-State: AJIora8jBK87zN/tp09txFit7agQelM6c8Wra7M7yeB5jpo0VlEcMZov
 rTDyX3V6WEqKbHx5UreNshZhcYZYV7ezAQ==
X-Google-Smtp-Source: AGRyM1uVxQtbSCXHtKdF4kEZzsKDmyRNRSN+3cGHk4NSU1QTa71gbPI1UUg7CYwOUl5V3i74P/AKGg==
X-Received: by 2002:a05:6e02:144a:b0:2dd:16e1:dab3 with SMTP id
 p10-20020a056e02144a00b002dd16e1dab3mr2508838ilo.258.1658629784577; 
 Sat, 23 Jul 2022 19:29:44 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 k7-20020a056e02156700b002dc7bfe144dsm3199620ilu.84.2022.07.23.19.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 19:29:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 20:29:42 -0600
Message-Id: <20220724022942.1022774-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9B+fvM0rsNTT5tYqvOhoBsAv9aB7lCnz3ddEGfY07Oc=;
 b=kgPZJB8Q5xdaR5cTq7nammwdTOPEDsws5/51rPd8WXwGCzFSuZguJhiL/qMLoQWiln
 AVakIoKXIqORlmieSvVjy3zxXydbe8h3UaKIyvYR+xYKJjpEHRhNdw9GlUnMPvnoIxF3
 8C7eTJMynIEUAiPZdQZd16WwJ/LO1CSvOch9Xt/maj4w605gwfdB+fmOeWitIsoOJ2Rc
 oxhDwrTGDNwmQ5KunXmTPwaBbWUs9XzdjUp41c0y1Wn+pOMG68V45bpuzZ6k3+r+ONYm
 0JveMM52YPAmhMQRa1DZo+h+f7SLzUM2XzcedtmG8Hldto7crNOYDLbhiLsMOiKT8I4I
 VyWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kgPZJB8Q
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 37.0.4
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
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index b51945a928..66ac9d094a 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  b8ebc656926a88931d1822e3060001e288ecc7712feaa9fe7e1ddacd675c0a57  cryptography-37.0.2.tar.gz
+sha256  49692c2a2b7c18f854d20ac5239cd5bbccef033e3efdc7647b3e29fd5970c823  cryptography-37.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 99eba3eeab..76041470f7 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 37.0.2
+PYTHON_CRYPTOGRAPHY_VERSION = 37.0.4
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/51/05/bb2b681f6a77276fc423d04187c39dafdb65b799c8d87b62ca82659f9ead
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/89/d9/5fcd312d5cce0b4d7ee8b551a0ea99e4ea9db0fdbf6dd455a19042e3370b
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
