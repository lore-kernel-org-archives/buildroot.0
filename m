Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FAEC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 23:39:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01B33610A2
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 23:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01B33610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8FA740A3C;
	Wed,  6 Oct 2021 23:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_Z9XORge81n; Wed,  6 Oct 2021 23:39:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9764403A1;
	Wed,  6 Oct 2021 23:39:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EE641BF30B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 23:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F4A1840E0
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 23:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bSgoVUHMXT9h for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 23:39:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81350840DF
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 23:39:37 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id e144so4739795iof.3
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 16:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yUFv6z0bVQtCzxHRGp0rUVoFUVN0mmoD8MwizveIRgM=;
 b=nUbWJCuR6V4+c0UQSNr20hRvgWjDhVK8WCSMD3WSF/UJXKGyk9U4HPCkdH5OoWEQTH
 MHasmDnDVQBY+IvhRqV2zDhgMLMkg6Y6J31ajwjdyhQq7a5yr2WrrA3CTWxIfPXE5d+Y
 H8m58V7gZhPD/4aMbw6T9rfOgv5PIe4P6kOOIFr4WTOs4xgIAGy3yVd8rPP0hiiDVZrK
 ZHBrze4OqRe6Sg+wciNtFQFAFHa9cAHHpUe192w8cnATGKrNJunmkpBKazI7v8dotwOb
 MOy+DAi1lHSHdDdSq/s1fV/sboptV3qRfjAgzFsYE+4bYj5xXMkCDNKnDJ4D0hjCVRF/
 thvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yUFv6z0bVQtCzxHRGp0rUVoFUVN0mmoD8MwizveIRgM=;
 b=dzwwfSjU8NXUnyEOYZTP3lf2fduBWIgKLQNPkuMg0qCkftIas0gF/c4zR83hLOs4m9
 /V2Ge7EiMIX1J6iykPaJWDdVS05VYXrtq+JCJkBhm4Hv+a2EueEzVtlcUnCopA7f/xCM
 ksBU37nsgL1QdBGN1dozsEAnU4mpJ2e6rnmcAxxwD1d1E/A2mud9mm0GyqMx70pWnzlF
 /zLHpjx/6iRPPmCux+B8r4sR73XoUpiNdyJDiPUHoXKPw+hsV//4ZQwjasPMLKO9uodU
 aaMWtAsVHc+QeRqnaaOIBTTV2tagsagP19QXhuMNRLWRauCUrr1D3jDEvXyJUOoxSu+j
 rNIw==
X-Gm-Message-State: AOAM533V+5cGfLs8rxE2tVBhIgRBR854hxFzTYfHjqb6KZSsdCmn1N6U
 8yg/QscMgRutKDsRKIanQBOxx8QJ5Iw=
X-Google-Smtp-Source: ABdhPJwD19VjGmt/eD35O0IALyow1M7djb3VCcZvfglOURtIN22xRnKpvB+Zmi7spthACr41EadT5g==
X-Received: by 2002:a02:c85a:: with SMTP id r26mr450548jao.116.1633563576473; 
 Wed, 06 Oct 2021 16:39:36 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id o3sm12400335iou.11.2021.10.06.16.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 16:39:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 17:39:23 -0600
Message-Id: <20211006233923.3225201-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006233923.3225201-1-james.hilliard1@gmail.com>
References: <20211006233923.3225201-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/python-socketio: bump to version
 5.4.0
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

Remove six dependency which is no longer required.

Add new bidict dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-socketio/Config.in            |  2 +-
 package/python-socketio/python-socketio.hash |  6 +++---
 package/python-socketio/python-socketio.mk   | 14 ++------------
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/package/python-socketio/Config.in b/package/python-socketio/Config.in
index 096e75a623..89d23b6ddf 100644
--- a/package/python-socketio/Config.in
+++ b/package/python-socketio/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_SOCKETIO
 	bool "python-socketio"
 	depends on BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_BIDICT # runtime
 	select BR2_PACKAGE_PYTHON_ENGINEIO # runtime
 	help
 	  Socket.IO server.
diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index d0d8a87dcf..40e74cef96 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5	86cd47dddea1785ce7a6c72f55c93fe7  python-socketio-4.3.1.tar.gz
-sha256	506b2cf7a520b40ea0b3f25e1272eff8de134dce6f471c1f6bc0de8c90fe8c57  python-socketio-4.3.1.tar.gz
+md5  0507825ca4bd6527cbaed81ec5767bfe  python-socketio-5.4.0.tar.gz
+sha256  ca807c9e1f168e96dea412d64dd834fb47c470d27fd83da0504aa4b248ba2544  python-socketio-5.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
+sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index 73dab26f3c..f23342b776 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,20 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 4.3.1
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/36/87/e9128a4da04df991fbdb01f44dc4d6dd8f6c03bfd4d1f42dcd6779fd975a
+PYTHON_SOCKETIO_VERSION = 5.4.0
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/72/70/9b992f4b8adfcbf0724c079c18629d83f20b36fb0eb64d4fdf874054becf
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-# only needed/valid for python 3.x
-define PYTHON_SOCKETIO_RM_PY3_FILES
-	rm -f $(TARGET_DIR)/usr/lib/python*/site-packages/socketio/asgi.py \
-		$(TARGET_DIR)/usr/lib/python*/site-packages/socketio/asyncio_*.py
-endef
-
-PYTHON_SOCKETIO_POST_INSTALL_TARGET_HOOKS += PYTHON_SOCKETIO_RM_PY3_FILES
-endif
-
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
