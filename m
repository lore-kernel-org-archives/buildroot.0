Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA82FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 17:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2EBA60EDF;
	Tue, 28 Apr 2026 17:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgHeM_x4-aCP; Tue, 28 Apr 2026 17:18:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3AFA60EED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777396714;
	bh=7kKaVlmbkaVUBVDodorzRoRGCUahCLLnS16fG37x3g0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=G070kzPM/7wxlnnAW6B6z/4PcIudj7xt8DbuCkv+LD1TO5sqDS2GjDsUDFQMCWlVE
	 BHSF5f3p8ITltmOZrlfKmvIQXDoqIwfzA9SGb2/BIhKgqc+l2IkgSybT9OBIfUeEp1
	 pf5GNaZ4v8Wr48V1k8VK8me2ImAQGsYPqWA5o5j2sjoi9C/qGOicQYqB2dqkDtWVDl
	 tEToSN109sVmVbzKhubLOcAB+BtKA8ToalRpx+2W6NAcWlnCjDxsLbm/82ZonlK11T
	 Lz1mqBUWPMwnICuOOQs8SnJ7l6NbfUWWQT+aMFXFcT3w62TBAe7pKSkdsckKVzf8BK
	 ii9iNnkvRQWxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3AFA60EED;
	Tue, 28 Apr 2026 17:18:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7533E1B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AA3460F1E
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHGc6YMkgUY4 for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 17:18:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B22360EDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B22360EDF
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B22360EDF
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:18:31 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id
 af79cd13be357-8cb20bcff5aso1087141785a.3
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 10:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777396710; x=1778001510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WADrA5CViYHSnncD4UlXwTUtSOU/n24Uwgps5BQUJMM=;
 b=nBugLeHVpN40WBeWVRvTUFJICn7hQVmGsaQw1NApytHK407Mp0tPNiACwm1E1QwFBK
 9I9vB3kX4HKpjvpOxBrR1FfVJ8+Az8aZWJyuj/BndXF/fHi84cu9khAxZ4PQwsK5xhif
 gBrCyDLPkxGJeUbmUz6HknbW7zcQTZg0/xTHTuG5/wCtvTxz89mPki7fuuq59y2e1LCt
 fUJQClPw2Q6juDBsvxl45TRdUvMqPJTmYzn9bvLOc9m1sx0Aw7udrds1nudJcnkDlVDM
 hOf3B8rdZ+ieFUFtMbyFMZzIIZOEvo1fCxwVZUMdmYjJMpI7/rQkeWYCcst9iQa/3RIt
 XNfA==
X-Gm-Message-State: AOJu0YxWj63wHgi/D6f4auhkioMfxztIchdWUL7/twvTjW5ErNHKssBI
 Yic9Hlf/psNDsabGYkp8rMJFIgb/WbVApd+fCC9GLhYQlzNPcy13EY3XCguna8T6glq3UA8X
X-Gm-Gg: AeBDietfY6pnOqNDszyHeUK6B6ndb54sFb9rlHBvoGY/LloBfTsJ/UdcnBislf8lipR
 ihJ17WBuDnJV74QhmRFx0akkoZX45Nncn275UpsVRYgJBE/cmNjA8eCHgRzTBWtoIRWVXehBNHr
 NAnQAvK1Kak4RwZhs1m+REYPNJCnwdbDvXnlcmtPKf2vtVlmv208qTiHABCGibqckC9+bYE/Ue+
 ZMqbMr/SSQacAoW61iUVL0J01z/0KHHg9DylmMHelfiMUrsJ92nPEDaBdRqDJh25j0QqMvPVRJx
 wx1Boi90T+Z75vBqTZG3TmjnIKhR/SwdDJ90Z9PvvrNGwR853fzYRZkPithij5ZxXn2WcC35zTs
 z9V1ZlJsbP4DpSHlCc9pk5BVjBg8vX7y/X+UU+FQu7ORLVidz5l22kSH0+gEQLI16mCrLipMuTj
 IP4D4rUVnweAeTtqGLIH76LPPqFnxBuA==
X-Received: by 2002:a05:620a:2982:b0:8ed:c550:44ff with SMTP id
 af79cd13be357-8f7d95026aemr549142685a.44.1777396709677; 
 Tue, 28 Apr 2026 10:18:29 -0700 (PDT)
Received: from precialexwin ([76.65.67.233]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b3e2972412sm24199696d6.37.2026.04.28.10.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 10:18:29 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 13:17:59 -0400
Message-ID: <20260428171759.2571-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777396710; x=1778001510; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WADrA5CViYHSnncD4UlXwTUtSOU/n24Uwgps5BQUJMM=;
 b=GCzJ34gz/jdsDnZTrGunlQKGuCL0jnbwVIUERV5wo/p9cHvYUKDPEQ68kCPWpwrfgX
 GUL/XYFRuA4VOoH+dpZPHSCOhUylXU9mzzxx0AfBLXfx5QGggmJLXgZowm+wUuIeDujQ
 QNxagKHjuB2gloo5uMd/J2OYKvfn9/BpbBAmkiCGauGaBtfKTKJhMsrxNd+fPdyaaPWI
 SEspZEmT3pHfy0p0W5pQss1NHzAL1mXoLE2vR06nKJ/ZN2ObwmzQIzN3hZnFWlqQDqZf
 i8x38Z2wLfslHEJ+CPagjENRRY9Q+bbfhGurWVKkyq511faebUMXlDFoEc8F8OoVOeaU
 IeAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GCzJ34gz
Subject: [Buildroot] [PATCH 02/13] package/python-requests-unixsocket2: new
 package
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
Cc: Alexandre Ondet <frcomdev@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-requests-unixsocket2/Config.in      |  7 +++++++
 .../python-requests-unixsocket2.hash               |  4 ++++
 .../python-requests-unixsocket2.mk                 | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-requests-unixsocket2/Config.in
 create mode 100644 package/python-requests-unixsocket2/python-requests-unixsocket2.hash
 create mode 100644 package/python-requests-unixsocket2/python-requests-unixsocket2.mk

diff --git a/package/Config.in b/package/Config.in
index 407966b37c..1a53589155 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1378,6 +1378,7 @@ menu "External python modules"
 	source "package/python-requests/Config.in"
 	source "package/python-requests-oauthlib/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
+	source "package/python-requests-unixsocket2/Config.in"
 	source "package/python-rfc3987/Config.in"
 	source "package/python-rgbmatrix/Config.in"
 	source "package/python-rich/Config.in"
diff --git a/package/python-requests-unixsocket2/Config.in b/package/python-requests-unixsocket2/Config.in
new file mode 100644
index 0000000000..b5ddfea1d1
--- /dev/null
+++ b/package/python-requests-unixsocket2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_REQUESTS_UNIXSOCKET2
+	bool "python-requests-unixsocket2"
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	help
+	  Requests transport adapter for Unix domain sockets.
+
+	  https://pypi.org/project/requests-unixsocket2/
diff --git a/package/python-requests-unixsocket2/python-requests-unixsocket2.hash b/package/python-requests-unixsocket2/python-requests-unixsocket2.hash
new file mode 100644
index 0000000000..c574b23ac7
--- /dev/null
+++ b/package/python-requests-unixsocket2/python-requests-unixsocket2.hash
@@ -0,0 +1,4 @@
+# From https://pypi.org/pypi/requests-unixsocket2/1.0.1/json
+sha256  87953038ae42befb6efbdf504d6dda2554a0b0d13b65e42f7319793b5527a303  requests_unixsocket2-1.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  d22764244c71acf005aa6bad6fe7a9cee48dcfd84882a57b6055e2ede67a39a4  LICENSE
diff --git a/package/python-requests-unixsocket2/python-requests-unixsocket2.mk b/package/python-requests-unixsocket2/python-requests-unixsocket2.mk
new file mode 100644
index 0000000000..f37651746c
--- /dev/null
+++ b/package/python-requests-unixsocket2/python-requests-unixsocket2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-requests-unixsocket2
+#
+################################################################################
+
+PYTHON_REQUESTS_UNIXSOCKET2_VERSION = 1.0.1
+PYTHON_REQUESTS_UNIXSOCKET2_SOURCE = requests_unixsocket2-$(PYTHON_REQUESTS_UNIXSOCKET2_VERSION).tar.gz
+PYTHON_REQUESTS_UNIXSOCKET2_SITE = https://files.pythonhosted.org/packages/source/r/requests-unixsocket2
+PYTHON_REQUESTS_UNIXSOCKET2_SETUP_TYPE = pep517
+PYTHON_REQUESTS_UNIXSOCKET2_LICENSE = ISC
+PYTHON_REQUESTS_UNIXSOCKET2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
