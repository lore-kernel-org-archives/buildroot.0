Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDE6CAC5AA
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 22:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98D4D81DEA;
	Tue, 17 Sep 2024 22:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbQhlOKg6fsJ; Tue, 17 Sep 2024 22:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8D5781E07
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8D5781E07;
	Tue, 17 Sep 2024 22:14:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D67C1BF316
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 22:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B16641A50
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 22:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3La7BfUOX_WJ for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 22:14:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E9F741964
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E9F741964
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E9F741964
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 22:14:28 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82cdb749598so348473239f.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 15:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726611267; x=1727216067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/38AMwS3S66xs+e8++up2WzghVmZyETlpy4jnzjhka4=;
 b=KdDQmJ4xgGU6+JVkVznovTxpinc4LVX3Unfq51y/C8mowF3x2rpFcGE3ZYK+u69jyy
 dOFBmWTM64EiXpuH1xTHKrJpYAcs6Aspdqvrk+GxyowU4QARSyINy4yGD+hoG/fMRBEy
 OG2KaBr4H4odEnjecDyVee0hQa9/qHb3oFcEK6AFcEgYCbfFI6HwkkKvj95TkBd2SkqH
 r6Ds0I97H9y6D4X8fQtrZZfh257cljUKJ97Nf93eyqyb4t7Klqifx/m+yy7nVKC/7TeU
 VXO+KJptYtGjsEHtC1BC6IySPoyrmcrDFJBvSemxZ7KnttWHYE036tFJlNwp5aj/xfCz
 alsQ==
X-Gm-Message-State: AOJu0YzF/dIZj5YuLtGLl6QKOoj7rJKQj5QLEggx7nJBezPfnUcDJe4W
 HeaPmpwT/h7+vazCVJd0+t4Ux8cXx8H3xzeND/5zElgJjNHh8BNstskz8g==
X-Google-Smtp-Source: AGHT+IH8z48eIimsZMrcLo2RHe6wMMwu3v0dcy5ctwgsHwE5k9KzBUwuq0GHe/Rd8j7Ob91zD6j13Q==
X-Received: by 2002:a05:6e02:12e2:b0:3a0:9ea3:8d79 with SMTP id
 e9e14a558f8ab-3a09ea38f9dmr84800335ab.16.1726611267106; 
 Tue, 17 Sep 2024 15:14:27 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13cf6sm2159133173.96.2024.09.17.15.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 15:14:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 16:14:25 -0600
Message-Id: <20240917221425.110481-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726611267; x=1727216067; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/38AMwS3S66xs+e8++up2WzghVmZyETlpy4jnzjhka4=;
 b=Ne/EOExduaOTRfVbP8DTyX9sFT+wT/Dcca6dHA52dkhor5Xc2u+n5KnDxWG94BS+YN
 awHJS+ZpyEgBrNMGIttudHmTEJD0nY/D579c3nccrbqay8JM45xeIehsOCwjavqX4oUS
 gYPGtsn7MDZ/psHeLW1Z4ATYujAYWe7JCt7kUKmDLrnWtO4PsDIpF6TIvfLdgVm47pdq
 /52vgRpGUtocfghjI/x+kq4X7KNz95CRFx44vmOk4MznG7xIR42sUhiPr8gssrYVxE/P
 uK2yDCGDzFVV/ajT14MmHrZaR5ItKyZlYjP3NF/WEAVxZ29gRx8DZbpTuZAdM732DyXI
 eBlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ne/EOExd
Subject: [Buildroot] [PATCH 1/1] package/python-pyjwt: bump to version 2.9.0
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyjwt/python-pyjwt.hash | 4 ++--
 package/python-pyjwt/python-pyjwt.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index 06b91bc14a..a6c8d90853 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyJWT/json
-md5  a683445793adb7fcf39ad3e55c5c347c  PyJWT-2.8.0.tar.gz
-sha256  57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de  PyJWT-2.8.0.tar.gz
+md5  88c9dbeb3e6302c7db813195e202420a  pyjwt-2.9.0.tar.gz
+sha256  7e1e5b56cc735432a7369cbfa0efe50fa113ebecdc04ae6922deba8b84582d0c  pyjwt-2.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  797a7a20231d4c433e9f1911db1731d06b5828b98f499819a034f7c0f56f5ce5  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index d4cf226941..084d4ac802 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.8.0
-PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/30/72/8259b2bccfe4673330cea843ab23f86858a419d8f1493f66d413a76c7e3b
+PYTHON_PYJWT_VERSION = 2.9.0
+PYTHON_PYJWT_SOURCE = pyjwt-$(PYTHON_PYJWT_VERSION).tar.gz
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/fb/68/ce067f09fca4abeca8771fe667d89cc347d1e99da3e093112ac329c6020e
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
