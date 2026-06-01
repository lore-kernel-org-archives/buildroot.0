Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21EBCD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B3A1404E7;
	Mon,  1 Jun 2026 20:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bL8DcJyrv-fu; Mon,  1 Jun 2026 20:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 988F140587
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780346898;
	bh=X4nkD4NQQM/mJyKPxPTdhKQaR853ygFR+M+lcDHyPV4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YBti13hlqozkVZiAQOI7C59lMrqK5AleKf6qsiJBQGQzYRIbzj3B0dZp6mZz/zgd7
	 T8mM00/P7GtNNEBsDpnOVYqE1w+7qmtwpobR05ojz9juvgD0H4n28vHZhj5bonFZlW
	 MSBIaPcrrvOezZoqclOVALKVVH4ZTdzV13THPRoe1xS+jT8XQE0YsJZ5JO6eOnqqRd
	 2yCB8gPgRLb3uueD7UStiujHMePzYslhYCthM7zt4udvCsksSbeBYe2kDtbgLTY4st
	 RU8OtMBU/x/utEW0Jyb9t1TtkE6VEW4bpwoUp9xhRvoKB1TXYm1HeQWAstSbpc8Sot
	 2Yc/oOtmZOP2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 988F140587;
	Mon,  1 Jun 2026 20:48:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C70B8F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B16C081196
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxW1OpKzUZOY for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:48:10 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 825798118C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 825798118C
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 825798118C
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:48:09 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5aa68cfc182so1701269e87.0
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 13:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780346887; x=1780951687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jm8CDKbMwNHVwOhIPWIt8JR45BRhkftnsWVmImEgUio=;
 b=BzyaccyrDTE88przYqxQmdHntByT1Hdskv49yfd2/Rc99k5ACZ5a2zVtcM4Yw+rlIl
 iCDCzne7oyN6PM0/vMFHsyIa3j/iEWxCVfzPuhFCJ1YNbqUyvG2zEN2X1Xj5JHX2Prq5
 qCpoLadQrCHXwMHkm/3A51GpSz00pIVGAjJgM1rNplb4xMZbcfIK4zJunZzRK5rzCNQ4
 kyHU0dUQCe6dqQmiMvHksFop79m9VZDCvHYZhjldaS8P4Z4ecEWJeTDnngXF54TK7tRg
 V6YW64l8hbfuwx6i6NrOThFG8oW+zV4+3LFEZ4B57e9AqV+Gp+mz5SCoqgUVfyDbo5JB
 HY1w==
X-Gm-Message-State: AOJu0YzN5a4dpazy+GvFpv0yOpC8/HwKGzgSrK99LBlBmuZ/aXxZWrD3
 fy7cwBzdB/nm0LivZHwMvHJqUDGAWwa34tyCKFFbu9crwZA4ZsMiqxyANnqB0QwPE8D0vts5oOA
 6OHYoIluvIA==
X-Gm-Gg: Acq92OG53G3OdZ4gIQEe0QRpIiPXWJgjT1J9L9N2pLNtiFeGTG3b50BVth53ruscZza
 p0h32UnCK3IW4D4twlOxD5wIanZaimLQvTk1QWGx/Zt91yrQMEqgxuZG6ATVXpYf6RY00U3WcsJ
 1eRkMkxZMxgvyGGhNgtHc6EKzJ4hAmIeOx5ZuOsOWjytCHIM3+Cv2bTAybmQDMpdqJVtVxqImed
 aaxFPFFAObd7i7tajRUpys/6XMKNwTyhN87OzvDKqqmXImtVFk23X+P3laI6UCdRambJHNJefmt
 nG1tVhVcxp+xVHG+pBiMyZBRLdFQ59ZYyUhanpJuwZBuGPP0hN5pXYbFc7NVMGMcCgcrK0Vpg40
 EqnluNo4Gna9I9GXkWHs+FQYmh1N1Qn69VtavNZ26R+4/BIx733nYSBwl/l0owyq4Bau++jeVCi
 VXXf8oHu5MP/5qCx4WAxmyv33CGK6EbK2kM/rxTHzAUYO6abh00jZJFfiywJU24w==
X-Received: by 2002:a05:6512:3b1e:b0:5aa:5c8c:9cf4 with SMTP id
 2adb3069b0e04-5aa607cb6f9mr4138164e87.17.1780346887142; 
 Mon, 01 Jun 2026 13:48:07 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5aa5b79f04dsm2307787e87.83.2026.06.01.13.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 13:48:05 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Date: Mon,  1 Jun 2026 22:47:34 +0200
Message-ID: <20260601204735.888967-9-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601204735.888967-1-j@j-ernberg.se>
References: <20260601204735.888967-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780346887; x=1780951687;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jm8CDKbMwNHVwOhIPWIt8JR45BRhkftnsWVmImEgUio=;
 b=vsQiBjaGDu0gsZoLZb7N6TZ/TXbMXvTYd1/SZpUGqjK6kDei4jN6w4wgHqhcvD9BH/
 7FCc0jJKeardZhPG6C0PQnuTFSi5ZK70CT4FaDELZggfGevkHP8CCisVlGzAzs5wtRCR
 NBcJp8I72YzfVS14498YCswMdye3uYOVh6Re4gOPQDPQrXENc0yyh7bVhS723jYzX/ae
 Lx/nX4f+a4ZcWo/z87T3h01ul9gswulGDGobYv+B7t8zAgnAjvDbmhCj2kgTAsXV17kU
 SCDtyQKIf7N/B9i7+AcS1ZVJx3wACMWyXyfKOwHfaGV/l0j1yUkG2OQtwoNOLHhWNOK3
 kK5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=vsQiBjaG
Subject: [Buildroot] [RFC PATCH 8/9] package/python-xlib: Drop the package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, John Ernberg <j@j-ernberg.se>,
 John Ernberg <john.ernberg@actia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream has not seen any active work since late 2022. [1]
There was an attempt at finding a new maintainer in 2024, which didn't
lead anywhere. [2]

The package will no longer build with setuptools >= 82. [3]

Link: https://github.com/python-xlib/python-xlib/commits/master/ [1]
Link: https://github.com/python-xlib/python-xlib/discussions/273 [2]
Link: https://autobuild.buildroot.org/results/33ef2859c48f78552dd4a7d53b13955d3d9b05d3/ [3]
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
---
 Config.in.legacy                     |  7 +++++++
 DEVELOPERS                           |  1 -
 package/Config.in                    |  1 -
 package/python-xlib/Config.in        |  7 -------
 package/python-xlib/python-xlib.hash |  5 -----
 package/python-xlib/python-xlib.mk   | 14 --------------
 6 files changed, 7 insertions(+), 28 deletions(-)
 delete mode 100644 package/python-xlib/Config.in
 delete mode 100644 package/python-xlib/python-xlib.hash
 delete mode 100644 package/python-xlib/python-xlib.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 7fdb014c0b..f74ee85ba8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.xx"
 
+config BR2_PACKAGE_PYTHON_XLIB
+	bool "python-xlib removed"
+	select BR2_LEGACY
+	help
+	  Upstream is no longer maintained, and the package does not
+	  build with setuptools >= 82.
+
 config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
 	bool "jailhouse helper scripts removed"
 	select BR2_PACKAGE_JAILHOUSE
diff --git a/DEVELOPERS b/DEVELOPERS
index 0308d1ef41..2692cfbdef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1750,7 +1750,6 @@ F:	package/python-raven/
 F:	package/python-schedule/
 F:	package/python-sentry-sdk/
 F:	package/python-websockets/
-F:	package/python-xlib/
 F:	package/sentry-cli/
 F:	package/sentry-native/
 F:	package/unclutter-xfixes/
diff --git a/package/Config.in b/package/Config.in
index b69782ec6b..469afd751f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1512,7 +1512,6 @@ menu "External python modules"
 	source "package/python-wsaccel/Config.in"
 	source "package/python-wsproto/Config.in"
 	source "package/python-wtforms/Config.in"
-	source "package/python-xlib/Config.in"
 	source "package/python-xlrd/Config.in"
 	source "package/python-xlsxwriter/Config.in"
 	source "package/python-xlutils/Config.in"
diff --git a/package/python-xlib/Config.in b/package/python-xlib/Config.in
deleted file mode 100644
index 081af6a2fc..0000000000
--- a/package/python-xlib/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_PYTHON_XLIB
-	bool "python-xlib"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	help
-	  XLib in pure Python (Py2/Py3 compatible)
-
-	  https://github.com/python-xlib/python-xlib
diff --git a/package/python-xlib/python-xlib.hash b/package/python-xlib/python-xlib.hash
deleted file mode 100644
index f516d7b4c4..0000000000
--- a/package/python-xlib/python-xlib.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/python-xlib/json
-md5  20a687ac84ee632aea9b9861206aa0eb  python-xlib-0.33.tar.gz
-sha256  55af7906a2c75ce6cb280a584776080602444f75815a7aff4d287bb2d7018b32  python-xlib-0.33.tar.gz
-# Locally computed sha256 checksums
-sha256  3bb6f6bec94b99e2927a8880bf49c401f5e8f48a20ddea96310860264cae20b0  LICENSE
diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
deleted file mode 100644
index 23c7b39974..0000000000
--- a/package/python-xlib/python-xlib.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-xlib
-#
-################################################################################
-
-PYTHON_XLIB_VERSION = 0.33
-PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/86/f5/8c0653e5bb54e0cbdfe27bf32d41f27bc4e12faa8742778c17f2a71be2c0
-PYTHON_XLIB_SETUP_TYPE = setuptools
-PYTHON_XLIB_LICENSE = LGPL-2.1+
-PYTHON_XLIB_LICENSE_FILES = LICENSE
-PYTHON_XLIB_DEPENDENCIES = host-python-setuptools-scm
-
-$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
