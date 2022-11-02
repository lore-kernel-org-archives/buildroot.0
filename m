Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F50CC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE76F416E3;
	Wed,  2 Nov 2022 20:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE76F416E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fSpaTgIGsbx4; Wed,  2 Nov 2022 20:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EDE6416B7;
	Wed,  2 Nov 2022 20:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EDE6416B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E9F41BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDAC36074C
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDAC36074C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kIb7Zg28wjse for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:10:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0865605BE
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0865605BE
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:10:21 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id p141so15975114iod.6
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 13:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4CPny+/wP0577BZws68L2aXUCa12IyFO/Xw+2WbpgFA=;
 b=oM0QAojq5OJ8IpL7ls/2BHUTluKLK7+fB7zrk43RWwzyB0h+zDoSWLgpgkdRgvx+1E
 +6t4B6zC3L8CX78V/b7fZU9cURO9CgB1jz+6bimSc4hRScI3gjZOrxtnpXjoLc9paObG
 Y3EVylqu7P+l+oISBVJFX0hS1MtpwTwsTvQELWUSBnAE91xvG/dIKli9QG8crRBkgnC2
 nfy4LtBwTZtDddHdi8H6qEV/AHEaDc/kWHSnGIPnlqtj372q2dK9CO3p6piFb4vqvAtm
 UwYot7m3nlCTR51UijGtN0LvvaRsFwHnvEN4X9UxBLLNq8zkfwumCtlv47B5QdK2pu/v
 66ng==
X-Gm-Message-State: ACrzQf2M9pQ4q4L1xX8XJp/WvW3T6/hU1ajSPPI9pYJrLLgf6jU2mXxy
 KeAkP2ptmdNSwJ9rE5KVxuDEjaE0NB/kGQ==
X-Google-Smtp-Source: AMsMyM7lDqovtzqZ3qRn9a/X0dk0NfFILuuvd5ioE/JzFVgVNCV884f0rVtJkBYsmhEwjyCHSNgiBw==
X-Received: by 2002:a05:6602:2b14:b0:67b:8976:2945 with SMTP id
 p20-20020a0566022b1400b0067b89762945mr17315776iov.82.1667419820727; 
 Wed, 02 Nov 2022 13:10:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m11-20020a02a14b000000b00374294947e0sm5196882jah.7.2022.11.02.13.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:10:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:10:18 -0600
Message-Id: <20221102201018.1819737-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4CPny+/wP0577BZws68L2aXUCa12IyFO/Xw+2WbpgFA=;
 b=PVj6W10SylEN4O8/OJYGGfpGNmPukqEeSfysZtmZrqJqALWeE2LKk6NpwicLk6lTzM
 RfLmzZKLULifCSmSageIaRGr3tP9kyYNp/71UzLctHYF1+sqtgxSWYPpG/PtHFqJNWvG
 Hde1ddKFgCbhIxnQ/myQOQtEXU/DouyAIu7GEaxk1IOlzfze65K37KdTBCZm1Dl75Jb2
 sPhyGRm+dLIqeY0qwysAj8SPTOcfBxhkZXSGOsb3o2CasylUYhvhSTze53IuKloZCob8
 0UvHPTvhrA9JiLOuJf68HQnbiT24zOOcR0PeV4RcqCbwhjM6Q+w4XEvL53rEM6awEt9A
 AUfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PVj6W10S
Subject: [Buildroot] [PATCH 1/1] package/python-docutils: bump to version
 0.19
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

License hash changed due to url update:
https://sourceforge.net/p/docutils/code/8959/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-docutils/python-docutils.hash | 9 +++++----
 package/python-docutils/python-docutils.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index f5e0b82db8..6a36f362e9 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/docutils/json, sha256 locally computed
-md5  ca5827e2432fd58f4c8d74a6591135de  docutils-0.18.1.tar.gz
-sha256  679987caf361a7539d76e584cbeddc311e3aee937877c87346f31debc63e9d06  docutils-0.18.1.tar.gz
-sha256  f20172170ef9aeebbf53adf5d8f7d309f7dc6068e9a3a1b52ea772305686739d  COPYING.txt
+# md5, sha256 from https://pypi.org/pypi/docutils/json
+md5  0afa992a6e93db892107c3f087d0d9df  docutils-0.19.tar.gz
+sha256  33995a6753c30b7f577febfc2c50411fec6aac7f7ffeb7c4cfe5991072dcf9e6  docutils-0.19.tar.gz
+# Locally computed sha256 checksums
+sha256  16b78bd9994588326a871ac39f64480969ebeb57ecd46a31874744560e72390a  COPYING.txt
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 39a570f5a1..d06521d10f 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCUTILS_VERSION = 0.18.1
+PYTHON_DOCUTILS_VERSION = 0.19
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/57/b1/b880503681ea1b64df05106fc7e3c4e3801736cf63deffc6fa7fc5404cf5
+PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/6b/5c/330ea8d383eb2ce973df34d1239b3b21e91cd8c865d21ff82902d952f91f
 PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, Python-2.0, GPL-3.0+ (emacs mode)
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
 PYTHON_DOCUTILS_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
