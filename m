Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845A3C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2023A417E5;
	Thu,  3 Nov 2022 13:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2023A417E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HinZFcfYRP17; Thu,  3 Nov 2022 13:47:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8C5841634;
	Thu,  3 Nov 2022 13:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8C5841634
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4217E1BF968
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CAE3605AE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CAE3605AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJGz7ZMZ4OU2 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:47:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1858A60B04
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1858A60B04
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:47:21 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id h206so1317931iof.10
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Skr3zEI0f8FqI74VXV06v9a/TqSyNHNDq8mjkye+SgE=;
 b=1y62vo0XK+S2SHUITsDVvOTkUraahMdpE7I/IkVUS9xLp4y2KqwP7dk001X2WFmmv6
 EpVyPc74SN1Tfjncqz0Bi2q7pyY5dVtPzBB8dr0cAOA70GjNljNfQ6uOJAjUoGN0/mWX
 iCY6gftWuT+0IWs6BHtBQKPxkUSWkOPGsUPbW/6cSSLmtYjaPuCXqJFGty5Z4HkSsz8M
 wTk961uWIW/QbIhJY/puuAZhRYEsecVjeYS+U3lRE8MNP8Q+mo3R5oGDahcIheufLxeV
 OGQ+2h10LFDIRSbsTZprfJtLWuzKIL083gqfm+HRmsIPOcdOzChm3l/NM6YGwinLJtb4
 6sww==
X-Gm-Message-State: ACrzQf1Z39Md7ey79OzjgVDyre/QaZdMZ4djnZjJj7DTtxazLHStm7NH
 PYPgPtGwV17+C+63xgI4FIDFRKDnl3J+mQFi
X-Google-Smtp-Source: AMsMyM40dEYNFVxRYsyoHR9ZHsVwKK4I7Abm2jar6EemlUUCo7ijj2dTQRWPAWsU8zSVOVJhdeHD5Q==
X-Received: by 2002:a02:ac19:0:b0:375:9c2d:b44e with SMTP id
 a25-20020a02ac19000000b003759c2db44emr884403jao.149.1667483240797; 
 Thu, 03 Nov 2022 06:47:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q18-20020a0566022f1200b006bb7764890dsm338143iow.45.2022.11.03.06.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:47:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:47:19 -0600
Message-Id: <20221103134719.2630335-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Skr3zEI0f8FqI74VXV06v9a/TqSyNHNDq8mjkye+SgE=;
 b=LX1cG/T17/AC8HO50XV65NLr/7Amkklc9RLELqb6o4bJUPlRz2aEnlWc/gbUV+k6Wq
 YD5FmDyinflYIUa7e/Fgz7IY9jaKa57KscdvJvo+fCXY1WMsCLizy2F97fR+NisFQtk0
 5sETgpSqgJLgwQy1AhC8VMgjzRY/BCR6pTA5iH6IatoNp217H/9kLgdwI2SETKBfROxu
 fVA7hBHpCK0hd3XU9n/78XHZtODYJSJT5I3z3bdE3Vz2AUdAcFZLrgZeHzVVOAdyCa5U
 UEJMflENe4IxWmJSbszBM7GI8piBOVDlzgxWxz1ufDlTX49clTTRaNId/Yk60gGkJ2zf
 qD+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LX1cG/T1
Subject: [Buildroot] [PATCH 1/1] package/python-portend: bump to version
 3.1.0
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

License hash changed due to line wrap change:
https://github.com/jaraco/portend/commit/7558cfe2eb2f1ffe3676905e9871466cbc9da24f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-portend/python-portend.hash | 6 +++---
 package/python-portend/python-portend.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-portend/python-portend.hash b/package/python-portend/python-portend.hash
index 1e212b15e5..6af3b77792 100644
--- a/package/python-portend/python-portend.hash
+++ b/package/python-portend/python-portend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/portend/json
-md5  0ab51a12b7462a5275946a3645a71e92  portend-2.5.tar.gz
-sha256  19dc27bfb3c72471bd30a235a4d5fbefef8a7e31cab367744b5d87a205e7bfd9  portend-2.5.tar.gz
+md5  c37d676837505a6fc8dd33185c6d62a7  portend-3.1.0.tar.gz
+sha256  239e3116045ea823f6df87d6168107ad75ccc0590e37242af0cc1e98c5d224e4  portend-3.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-portend/python-portend.mk b/package/python-portend/python-portend.mk
index 8d619052c9..4322121e9b 100644
--- a/package/python-portend/python-portend.mk
+++ b/package/python-portend/python-portend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PORTEND_VERSION = 2.5
+PYTHON_PORTEND_VERSION = 3.1.0
 PYTHON_PORTEND_SOURCE = portend-$(PYTHON_PORTEND_VERSION).tar.gz
-PYTHON_PORTEND_SITE = https://files.pythonhosted.org/packages/2c/59/948666fc2455ae471efd40cb2a9a990f5f6f2354a9a6b228e29b9fb4a307
+PYTHON_PORTEND_SITE = https://files.pythonhosted.org/packages/6e/0a/42bcc9c97744958ce72d33f526e972379b9e90adede8a151f338818c41d4
 PYTHON_PORTEND_LICENSE = MIT
 PYTHON_PORTEND_LICENSE_FILES = LICENSE
 PYTHON_PORTEND_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
