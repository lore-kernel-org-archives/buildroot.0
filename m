Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF36CC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 17:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC5C660AD6;
	Tue, 16 Jul 2024 17:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMc3D5xV-tDu; Tue, 16 Jul 2024 17:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 319EB60ACA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 319EB60ACA;
	Tue, 16 Jul 2024 17:50:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D18E21BF487
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 17:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF24E405F5
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 17:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQbvhmigGqLl for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 17:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B938400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B938400D6
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B938400D6
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 17:50:46 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7fedb09357aso2457239f.2
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 10:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721152245; x=1721757045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TTAAZTBSX3XkGzO0+2p8laqGnHpw7pcBTjz3yWtwL7g=;
 b=Yo50nbCCynBp7TRGRxhNQhvMZ35XUP8zhpKI4jwS9KG6DiUG3YMW/NGzClyYHiJwo+
 NDEIE3CWS7yKF08Tp5LONF/NGadJR2j+vAbkEJAkOYbSD5xdGayBrGaPsV4OGqEjBx7j
 fwAQxUt5LrLvurKipoK2tE+d4tX9VGo3mAyyktCLhl/fLl+y4emXqSYkg/hfceeJXP1D
 FIWzfZmiWcVDxI30bZnmDp8vhLPsNNTPuzN0ZOCNZPnvE+yXwh5UqxMsMK8XqPFK4/hX
 hynDqgdaTpZc+EHidZkFzT1D5Si8NAud++gDcpaGMSRsHW8IXxiWRBypV697P47tfnCW
 cWiA==
X-Gm-Message-State: AOJu0YxwbchoTS8+55/F1omel6rF92m5mdz/jczZ5Alr7wVzaw13KR/l
 3sISYdhIV1wLOFdpe3H5mMBp9Z5GBBE+UN101fUKhcRoMdDPSw+j1mGmh7z0
X-Google-Smtp-Source: AGHT+IEjSok1hWAYWa3v9TWwURZw6JusXF+yetTQ0Ht4lsLiQf8N77tc3bbIpyw+QucbHcKbUCw+jQ==
X-Received: by 2002:a05:6602:26c1:b0:7fa:8178:d672 with SMTP id
 ca18e2360f4ac-816c2a1fd63mr25257339f.4.1721152245200; 
 Tue, 16 Jul 2024 10:50:45 -0700 (PDT)
Received: from james-x399.localdomain (97-118-154-90.hlrn.qwest.net.
 [97.118.154.90]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c210bbef1fsm39420173.31.2024.07.16.10.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 10:50:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 11:50:33 -0600
Message-Id: <20240716175037.1844929-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721152245; x=1721757045; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TTAAZTBSX3XkGzO0+2p8laqGnHpw7pcBTjz3yWtwL7g=;
 b=bNA6sFCqi0pb/sa3giYVFlW3U9oHAHZQAhYgVRE5vYw4FyTbFxoKwtxM2SYC9DkZe3
 lpjJRPYwlwzhpoW5sWykcdyGPk+ajOYt24njsxfpLRuHUftYKOxDI3K0Im7Tga6SgU91
 ngl2LrtNlLSyHfj4hgUoDI2CHdyVBsvqAtTTVEs2w4NX2DnMuJcnOIJi88aiLj7XpNfV
 jCUOBhaUbK6trwT54TcYcKdnSLwI8oh5BYuG0EA/F2Gyzkv7jxQ24shEVuGslkmkNDu4
 u8ufCHFVtFKZngXJF+s+L0GReGFeqWWRu5OhgnMoCy2fYskB9Z0LiDyImSdWJB5Z72aL
 UFZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bNA6sFCq
Subject: [Buildroot] [PATCH v3 1/5] package/python-pefile: new host package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pefile/python-pefile.hash |  5 +++++
 package/python-pefile/python-pefile.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-pefile/python-pefile.hash
 create mode 100644 package/python-pefile/python-pefile.mk

diff --git a/package/python-pefile/python-pefile.hash b/package/python-pefile/python-pefile.hash
new file mode 100644
index 0000000000..af2288487d
--- /dev/null
+++ b/package/python-pefile/python-pefile.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pefile/json
+md5  fa0eba7c91f4e696771ddbfacdca25e4  pefile-2023.2.7.tar.gz
+sha256  82e6114004b3d6911c77c3953e3838654b04511b8b66e8583db70c65998017dc  pefile-2023.2.7.tar.gz
+# Locally computed sha256 checksums
+sha256  bfd4b5e4f8a99c961fd6f94d708e38396cc146bfe8fbc5d2a86e63aa29fb4208  LICENSE
diff --git a/package/python-pefile/python-pefile.mk b/package/python-pefile/python-pefile.mk
new file mode 100644
index 0000000000..c65f1deb60
--- /dev/null
+++ b/package/python-pefile/python-pefile.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pefile
+#
+################################################################################
+
+PYTHON_PEFILE_VERSION = 2023.2.7
+PYTHON_PEFILE_SOURCE = pefile-$(PYTHON_PEFILE_VERSION).tar.gz
+PYTHON_PEFILE_SITE = https://files.pythonhosted.org/packages/78/c5/3b3c62223f72e2360737fd2a57c30e5b2adecd85e70276879609a7403334
+PYTHON_PEFILE_SETUP_TYPE = setuptools
+PYTHON_PEFILE_LICENSE = MIT
+PYTHON_PEFILE_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
