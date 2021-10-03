Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD087C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:35:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50A6F6128A
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50A6F6128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21EAB60B47;
	Sun,  3 Oct 2021 20:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GX9_ceX8yC46; Sun,  3 Oct 2021 20:35:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D01860B3A;
	Sun,  3 Oct 2021 20:35:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 161131BF44A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 055D541480
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcCxujxE8pMy for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:35:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 268D54062C
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:35:27 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id y15so16158766ilu.12
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 13:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L2ShGpQpurAPo7I9f4FSrLb0XvX7xipgHDauzNUwZ9o=;
 b=pFe4JD0q+FUj9kO+E6i5Z7hIGqHsU04BTCql6r9HtJ9v+DPFmY8WOOAMxFza16x6kx
 TmjX3d9lmel5uJKrIsCNuJMyUabbghSaLzEn2IiQnssS16r9IlAfwl5AS0YfblOLoUah
 O+OUYvlEUSf8bTcMmuylqv+0/Xyiz3xo6gf9HS9tjagdDAYuc/URLrWxRRnfdlnqoUI6
 Pdm/78jIWCkN6ZyTWFBizDHGj2C2TQkxJ9xv/XOkdTSytS4V906fEKXV7FG1WneIOVCW
 fXZW1FdflTTerBcc7xTEqjAF0QRT4Acn9vDCOYPv3PlQ9tbrv8kV4oJ9D4dEwhHvILZc
 36VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L2ShGpQpurAPo7I9f4FSrLb0XvX7xipgHDauzNUwZ9o=;
 b=ST1phsQ+7xNViw6CN9OqNEopxOW+6hfvbbONce5wl3orcuXUMWN+C3N5E3LsU9sSuu
 A1z5+dn4aAsrbjDJVulFRvrSahySeQ6S1isWX4vNlNCqaSx4UyOUPznvhxMrJfLqJIyo
 wNgtGQyy8dbEILufccKbofVCKhF2zgjciIAPNfLF3QU0m5EI17fnvMmLsvXOZl6VSnCS
 VUhfLucQQLhcWB5d7jOvM7Ppvnf+oWQ1XqXiU4NZfWoum7e+RQCbvYR3dtPNz1KJ6pW0
 QVGnt5pRp6GPuKDEY4Bu4TkaUVGuJOeMGPjnQCWc2o5/GhiEKwAZhwVjAYXB9HN66T05
 +Wxg==
X-Gm-Message-State: AOAM533vF4eRLae7o8Z21A/qNwSmXzvdf9dp+tAvxV5mHo/LKY9e2wvw
 IB4hwn/RKb6qTtYLnz8q1+3WjRee0Qw=
X-Google-Smtp-Source: ABdhPJy+qwB/byY4DngaPCJ2aHTUbEJavc52VWSXtrmcdiujmxjzynzUEe/ewdf7dEgZs5fWm0Gndw==
X-Received: by 2002:a05:6e02:8b4:: with SMTP id
 a20mr7426722ilt.315.1633293326112; 
 Sun, 03 Oct 2021 13:35:26 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id z11sm7890858ilb.11.2021.10.03.13.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 13:35:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Oct 2021 14:35:23 -0600
Message-Id: <20211003203523.1726540-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-multidict: bump to version
 5.2.0
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to removal of full text copy:
https://github.com/aio-libs/multidict/commit/5ea0e62dd848b147251dbdc6bbe4a10644cb2d88

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-multidict/python-multidict.hash | 6 +++---
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 65af9a58e5..2d9943fc0d 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  df8b37f069809779214d6b80b250e45b  multidict-5.1.0.tar.gz
-sha256  25b4e5f22d3a37ddf3effc0710ba692cfc792c2b9edfb9c05aefe823256e84d5  multidict-5.1.0.tar.gz
+md5  e28b9592289597b232f09e5cc3857f32  multidict-5.2.0.tar.gz
+sha256  0dd1c93edb444b33ba2274b66f63def8a327d607c6c790772f448a53b6ea59ce  multidict-5.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
+sha256  06a240ea10ba868fda2de58df859886961df873aa74bbab1e0f13eaf99f92b7b  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index edf9656043..2619cad2ee 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 5.1.0
+PYTHON_MULTIDICT_VERSION = 5.2.0
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/1c/74/e8b46156f37ca56d10d895d4e8595aa2b344cff3c1fb3629ec97a8656ccb
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/8e/7c/e12a69795b7b7d5071614af2c691c97fbf16a2a513c66ec52dd7d0a115bb
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
