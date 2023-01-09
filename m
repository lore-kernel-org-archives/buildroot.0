Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4102C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 03:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E60E60A6D;
	Mon,  9 Jan 2023 03:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E60E60A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJOUh7F5Z4iW; Mon,  9 Jan 2023 03:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EAF360A70;
	Mon,  9 Jan 2023 03:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EAF360A70
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0738A1BF86B
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D575540984
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D575540984
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKKfF-tEXAja for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 03:37:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CBD8408BC
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CBD8408BC
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 03:37:55 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id d10so4338490ilc.12
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 19:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fk0rWCWD23v9pmPBQIlaWZtcz2dD5Vlety5d5U/eDuk=;
 b=UYyRJgqgMRLmCc2zNsCJnazOkRjNzFgwLJ7+U5qv6B50X59e5MOpjSSffDRnhno3Pm
 /p5i63YKLp1w6Uj6hazKDM+Oqmxb2OSfeWXeCRXkWNLJcmVloNu5A2buplNfQQSGdfA9
 vdcyzENv0pbCnutUaU0zBYrIvYc8plSKoq5SIXxbEyIjspAsJSeue+qwyTxZ6TorNHKz
 TXwTdOmlaqsHUQ8b5YUXEIwu87KcyZyH5GY8Viq/21/OfLvrcbtI6znPQQ7ChbN3cEv6
 6XcHd+41wCRL651Itdls7uQDyQ9+kNU4K/KbpjMAtfHNJiNhrExKhPGMFurt0SL/jVYD
 RTyg==
X-Gm-Message-State: AFqh2ko7n45uSCxoLkjEzhRANRASAfXdGsF9nLuF7U6htvhoCciOnGMJ
 4Hnv2AOy/PxAXpdCNezk6xE2ADuUc9qehg==
X-Google-Smtp-Source: AMrXdXtN/FC1KEj/lI880iSymlGT8gfRbOJ+7m7gQJDLP1edZL/TNo9LkLCo1vdR/7vG6ie78aQb9g==
X-Received: by 2002:a92:cbcd:0:b0:30b:e954:8365 with SMTP id
 s13-20020a92cbcd000000b0030be9548365mr38680324ilq.3.1673235474353; 
 Sun, 08 Jan 2023 19:37:54 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 m4-20020a924b04000000b0030da3945496sm730862ilg.30.2023.01.08.19.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 19:37:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:37:48 -0700
Message-Id: <20230109033748.2132046-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fk0rWCWD23v9pmPBQIlaWZtcz2dD5Vlety5d5U/eDuk=;
 b=YZn5AtZQEKq69/cKBwFHfQ+gcsN3nQBOVBUQmGl0YhPc/+S1COIiYP7mEhQkzdyXnQ
 iV9TyKyJeI3q5XUfVwbCRk8aZgBtb7uIb5AlzpqOMJ7qrln/tAeMhyO07XSyD8LN0fye
 qg53J17mISN1Fi31bwcUUhMV0ELjQ5ORyhWdp0tld5gJsheGHSBd9OoCieTD/rFZMX4c
 1pIOmt/y6ImsBfpVBAoZfKco5kVxjyL9ZiZ9EpR2sZiKfJYI/yoVL64QgLEO5rHMSBrV
 7h24PFopUC5Mpbq0+hynbqsY5JiD7lN1v/MkjbtXGF1iV7M/wGnC6ZKdfDr/XIJa7BPt
 cr3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YZn5AtZQ
Subject: [Buildroot] [PATCH 1/1] package/python-cython: bump to version
 0.29.33
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 3ed9fb56a1..e7e86264d2 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  91c36ea86c00adcc5c1c11cf48b733c0  Cython-0.29.32.tar.gz
-sha256  8733cf4758b79304f2a4e39ebfac5e92341bce47bcceb26c1254398b2f8c1af7  Cython-0.29.32.tar.gz
+md5  bd42c555cb2298b8a94fa8de7ee679ba  Cython-0.29.33.tar.gz
+sha256  5040764c4a4d2ce964a395da24f0d1ae58144995dab92c6b96f44c3f4d72286a  Cython-0.29.33.tar.gz
 # Locally computed sha256 checksums
 sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 9a90f6198e..b11d75b33d 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.32
+PYTHON_CYTHON_VERSION = 0.29.33
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/4c/76/1e41fbb365ad20b6efab2e61b0f4751518444c953b390f9b2d36cf97eea0
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/dc/f6/e8e302f9942cbebede88b1a0c33d0be3a738c3ac37abae87254d58ffc51c
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
