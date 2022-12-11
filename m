Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7B5C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93D6D4047B;
	Sun, 11 Dec 2022 20:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93D6D4047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43XeRfjoVzTU; Sun, 11 Dec 2022 20:18:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A91284051C;
	Sun, 11 Dec 2022 20:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A91284051C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67A031BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40B60408F1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40B60408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T2Mtikf5X9dQ for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:18:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA5E540352
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA5E540352
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:18:01 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id j28so2479941ila.9
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 12:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tmTpBQEQpM5UZJJuam3ee2/XBEudvLaKqHQE+xLs0+M=;
 b=BwymKAgP+WExBvaITdi0MHvYT2nuVbs7sO4xnNjfRMP8GDRqSeWSXtw69nRK6t8AMt
 aKKBKrkilxseINa8QBWzkEuEk/iGg9xuCddL/FbYVlHr5E+s8PAug3Y3hWLf8n1HNl1/
 eVPXYeIzegih9lFMbqs1qlc3Ac1tqNNfBKRiZoVciGraiQji6MgSE3DqGZ1NhCUjTJNJ
 1D7+r5aJUfNWLR/ZhyXJcwcyTRdzVOQb32l6koZ3jHzS+PeheuxUAuwJPgq2jZaiKXop
 AtqtOMgKhnNggIY0CFALlCbDVMDmwZSR29AcKIvF1PgM085AJlFUek8jV9sI1t9shZHN
 VH/w==
X-Gm-Message-State: ANoB5pklU7PMDkxBQKkugZ7FfrbK0JGlj9t61uEK7I2E7VANxJ9ik81A
 YAtcmaELJO7+gBdOLonFhigZQ1MFpeQNcQ==
X-Google-Smtp-Source: AA0mqf6NY9/i5EfYzf23VuQdlS8/Vwru8PJ/i7L5PHV+5oiBHoVO3k9LdD+MP2pgYJAHzbuTYsW0Tg==
X-Received: by 2002:a92:da49:0:b0:303:2d1e:f28c with SMTP id
 p9-20020a92da49000000b003032d1ef28cmr7654813ilq.24.1670789880729; 
 Sun, 11 Dec 2022 12:18:00 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 x17-20020a029711000000b00363ec4dcaacsm2547826jai.22.2022.12.11.12.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 12:18:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 13:17:58 -0700
Message-Id: <20221211201758.146018-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211201758.146018-1-james.hilliard1@gmail.com>
References: <20221211201758.146018-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tmTpBQEQpM5UZJJuam3ee2/XBEudvLaKqHQE+xLs0+M=;
 b=LjBPVHAL0/pdme/uCO8313vyq0rliCt5WR1uQtajfbbP3dfZWUwAJ5YbkvTFOf5s3G
 VAdfXpvSIMixdhCRY2uFoo8rfVB3TZFVYkU18SDSnfD9bBQuK1uc+E5JmpE3hbdLjkrH
 zuWQz4Otm++wDhu+T2xnIb+ku1t+J3Remd/lT8KM86JR/eMfrlHOSkAkVFRecYd+W+f+
 QoO5fpl9zN0UtjhPigED0kdurPpF+Tw+C0DGV+aGsY6HZSUfFVAm/hrOF070DnMfAHr/
 43uITF4n0QpSt4QJ0i3zQ3qTDRsrDNxgv/TyZQe6EnN/gWlvTz3uDqnxBXt7zRLxux6g
 03qQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LjBPVHAL
Subject: [Buildroot] [PATCH 2/2] package/python-m2r: remove package
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

This package is no longer maintained and has compatibility issues
with the latest version of mistune.

Fixes:
 - http://autobuild.buildroot.net/results/904/9041acc5be4d2b33dee9ff0ad66dcd41d4dbfba1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Config.in.legacy                   |  6 ++++++
 package/Config.in                  |  1 -
 package/python-m2r/Config.in       |  8 --------
 package/python-m2r/python-m2r.hash |  5 -----
 package/python-m2r/python-m2r.mk   | 16 ----------------
 5 files changed, 6 insertions(+), 30 deletions(-)
 delete mode 100644 package/python-m2r/Config.in
 delete mode 100644 package/python-m2r/python-m2r.hash
 delete mode 100644 package/python-m2r/python-m2r.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 9136ccd0e0..28c6822689 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_PYTHON_M2R
+	bool "python-m2r removed"
+	select BR2_LEGACY
+	help
+	  The python-m2r package is unmaintained.
+
 config BR2_PACKAGE_MESA3D_XVMC
 	bool "mesa Gallium XvMC state tracker removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 10a0493b8d..914c3584e9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1112,7 +1112,6 @@ menu "External python modules"
 	source "package/python-logstash/Config.in"
 	source "package/python-lxml/Config.in"
 	source "package/python-m2crypto/Config.in"
-	source "package/python-m2r/Config.in"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
 	source "package/python-markdown2/Config.in"
diff --git a/package/python-m2r/Config.in b/package/python-m2r/Config.in
deleted file mode 100644
index 44dafaa464..0000000000
--- a/package/python-m2r/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_M2R
-	bool "python-m2r"
-	select BR2_PACKAGE_PYTHON_MISTUNE # runtime
-	select BR2_PACKAGE_PYTHON_DOCUTILS # runtime
-	help
-	  Markdown to reStructuredText converter.
-
-	  https://github.com/miyakogi/m2r
diff --git a/package/python-m2r/python-m2r.hash b/package/python-m2r/python-m2r.hash
deleted file mode 100644
index 4bdd7160d8..0000000000
--- a/package/python-m2r/python-m2r.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/m2r/json
-md5  255d080f56eb3d3a82d95194850c99c3  m2r-0.3.1.tar.gz
-sha256  aafb67fc49cfb1d89e46a3443ac747e15f4bb42df20ed04f067ad9efbee256ab  m2r-0.3.1.tar.gz
-# Locally computed sha256 checksums
-sha256  28728ec0ecbd8c171ebaeccebf69e3961282fd81f06abc7424c65546b6ae6f27  LICENSE
diff --git a/package/python-m2r/python-m2r.mk b/package/python-m2r/python-m2r.mk
deleted file mode 100644
index 8a4708f128..0000000000
--- a/package/python-m2r/python-m2r.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# python-m2r
-#
-################################################################################
-
-PYTHON_M2R_VERSION = 0.3.1
-PYTHON_M2R_SOURCE = m2r-$(PYTHON_M2R_VERSION).tar.gz
-PYTHON_M2R_SITE = https://files.pythonhosted.org/packages/94/65/fd40fbdc608298e760affb95869c3baed237dfe5649d62da1eaa1deca8f3
-PYTHON_M2R_SETUP_TYPE = setuptools
-PYTHON_M2R_LICENSE = MIT
-PYTHON_M2R_LICENSE_FILES = LICENSE
-HOST_PYTHON_M2R_DEPENDENCIES = host-python-docutils host-python-mistune
-
-$(eval $(python-package))
-$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
