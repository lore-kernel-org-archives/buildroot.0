Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E88FC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C04A6812D9;
	Thu,  3 Nov 2022 20:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C04A6812D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HWvud35puFXi; Thu,  3 Nov 2022 20:44:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0E0D81270;
	Thu,  3 Nov 2022 20:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0E0D81270
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2D1A1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDBDC40BC0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDBDC40BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4C31QrYixbwI for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:44:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEE4340138
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEE4340138
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:44:49 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id q5so1671764ilt.13
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 13:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AhWxNJ8Dacv5rZzpzQ17yUHfuXuRv3oTDYum8HESoZI=;
 b=fh7EdyHsK2INwB/95m+/6/TdRA3coER+Rgy/vX19/rFc9wlB0ihyhhX8K4RwNeWZtK
 Hk5XPYOy85f1f/a8la3r9RXgQLy7jjn3Vh/qgVv2bK8lyjlFMXKmQ6ou/EkArj6BTQfN
 hmJUH577YCIwVw7xZefdehADgn4Sr3d1ESXtkeCDck65k5xcrep6blHwphi3tUsgd0cR
 Ghlj7pZzj4CUun8jHsg3Hwy/e1X/c/Njwogky6Q23TgHwI1r2igmv/tTeQHV6/XS3QFq
 hFeMu0zCOyyey5QpU8KIJrLvxk7BOB1UQJQTisDk1Bp+o5X60pFI4CHKNuC8ymG2KIPy
 BkQA==
X-Gm-Message-State: ACrzQf3JoGbZEAxeWYvuJR2vuIPzHogX8eFaxCrBsix1aLSTy9A1ijTQ
 x4Hurx9EkSuVelJc4JSsqrdtAjURlFkRD04L
X-Google-Smtp-Source: AMsMyM6nK4U3PhoqVZ2jNyo/TlmUj16iA4mmc5yrdZzwjh0Ubbq0sTpwhrUlLJ0BM4UqQ4/niLQ22g==
X-Received: by 2002:a05:6e02:8a1:b0:300:b0f4:3683 with SMTP id
 a1-20020a056e0208a100b00300b0f43683mr13500169ilt.318.1667508288769; 
 Thu, 03 Nov 2022 13:44:48 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 x1-20020a92d641000000b002f9a7dc2e1fsm622994ilp.53.2022.11.03.13.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:44:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:44:46 -0600
Message-Id: <20221103204446.1441228-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AhWxNJ8Dacv5rZzpzQ17yUHfuXuRv3oTDYum8HESoZI=;
 b=qGQd9QRHvmJqHiDLmLLRpIcUtp/7DJrInUxECRsKCaPOebdhmmm4W5M3kvvMch6bHJ
 V1UtcjSpl8LjyP8e9OCGpImkhGHVQByQHpfnK/PINKRlvfUw3/X2ahNfW+sMq/JDL6Wt
 qaQUBh7xG00kH2iC0Q+OygfiWfKSY4zrIsxhQ7wmM2CVDgPSVnTmRbtPXvBp9Eg9Yeke
 AzVX/xGhp5xbYHJi0EOJ96YOtcUWWm96Lk0c2C2o9VEhdzxOIuh0PnSoITsIi26QTmQt
 WRyi3pezulqaexwKsd1Ldyds+8da20U234ndzjgH+1KR8bcwv2BZUFOSAjo2i6OSijvY
 rIAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qGQd9QRH
Subject: [Buildroot] [PATCH 1/1] package/python-websocket-client: bump to
 version 1.4.1
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

Drop no longer required six runtime dependency.

Project relicensed as Apache 2.0:
https://github.com/websocket-client/websocket-client/commit/ee5e352ebfcb78dd944d6923ce775ee4fcb5fd7f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-websocket-client/Config.in                 | 1 -
 .../python-websocket-client/python-websocket-client.hash  | 6 +++---
 .../python-websocket-client/python-websocket-client.mk    | 8 ++++----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-websocket-client/Config.in b/package/python-websocket-client/Config.in
index 519e506615..f915905400 100644
--- a/package/python-websocket-client/Config.in
+++ b/package/python-websocket-client/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT
 	bool "python-websocket-client"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  WebSocket client for python. hybi13 is supported.
diff --git a/package/python-websocket-client/python-websocket-client.hash b/package/python-websocket-client/python-websocket-client.hash
index 1e745dc1d5..08a6c260ca 100644
--- a/package/python-websocket-client/python-websocket-client.hash
+++ b/package/python-websocket-client/python-websocket-client.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websocket-client/json
-md5  8fc86b13dc97dc032855c6257f9168df  websocket_client-0.58.0.tar.gz
-sha256  63509b41d158ae5b7f67eb4ad20fecbb4eee99434e73e140354dc3ff8e09716f  websocket_client-0.58.0.tar.gz
+md5  1e8b6daae0cad86f8cd9210b24bdf95b  websocket-client-1.4.1.tar.gz
+sha256  f9611eb65c8241a67fb373bef040b3cf8ad377a9f6546a12b620b6511e8ea9ef  websocket-client-1.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256  7c6699c75f87b52bdc542db26d6b1b92892577cda46e20eceb79e2790a1c291b  LICENSE
+sha256  638eb70dcc4af2e6d8388de0636ced399f7c24716e11b8573a6b06f879e80691  LICENSE
diff --git a/package/python-websocket-client/python-websocket-client.mk b/package/python-websocket-client/python-websocket-client.mk
index d2873e3601..7e21187e22 100644
--- a/package/python-websocket-client/python-websocket-client.mk
+++ b/package/python-websocket-client/python-websocket-client.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKET_CLIENT_VERSION = 0.58.0
-PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket_client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
-PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/4a/df/112c278ba1ead96786d24d973429ce1e1a2c86b9843183d9f8ef8c6330d7
+PYTHON_WEBSOCKET_CLIENT_VERSION = 1.4.1
+PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket-client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
+PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/99/11/01fe7ebcb7545a1990c53c11f31230afe1388b0b34256e3fd20e49482245
 PYTHON_WEBSOCKET_CLIENT_SETUP_TYPE = setuptools
-PYTHON_WEBSOCKET_CLIENT_LICENSE = LGPL-2.1+
+PYTHON_WEBSOCKET_CLIENT_LICENSE = Apache-2.0
 PYTHON_WEBSOCKET_CLIENT_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
