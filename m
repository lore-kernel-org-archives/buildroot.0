Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3DAC5320E
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 10:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FF0680B76;
	Thu, 22 Aug 2024 10:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_ceYZdkD41p; Thu, 22 Aug 2024 10:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E5E2808A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E5E2808A3;
	Thu, 22 Aug 2024 10:00:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C2221BF322
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 09:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 655FE8089B
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 09:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GklafpWoz_ni for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 09:59:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D4FC80853
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D4FC80853
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D4FC80853
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 09:59:58 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 67B522C88E67;
 Thu, 22 Aug 2024 11:59:55 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 11:59:53 +0200
Message-Id: <20240822095953.524686-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822095953.524686-1-buildroot@bubu1.eu>
References: <20240822095953.524686-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1724320795; bh=SRBZzY8vSyijNGKkju/fiZr9Zkqtr8zqrbiO7w+aGNg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Gj8x8sSsYlgNLvTWPwDwuxiXkYE8KI/9KLFWAahhzPn7en4ojB3H4o5UmiRM/dRaF
 YIiJvg+8BOFcV0G4/SpiBnsp2WwAAKILnj488fTfVCF8EQgmN+DQyu4yYYsge3YhKo
 FEJGjnQyLnVJfaSvvuv+seuXHMLk8GjRIllf5/+9yQPt8jP6eQHH63pQdwbRaB0yr3
 Q3LKgXcxadv6JaY7CFi1ms8sNOkIEQEAPgNpfONvi5g5kPXESSGLQE+uazfCb6Zpni
 i4UIITuRzzQ7mKUxM5XzPKyvEEqN4ACJzzn/Hl2Y62qmb5ip6U6llEMoZf51i4KOij
 wanMWc25uXFlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Gj8x8sSs
Subject: [Buildroot] [PATCH 2/2] package/python-can: add option to install
 the viewer tool
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enabling the option correctly select the python-curses module dependency
of the viewer tool.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-can/Config.in     | 7 +++++++
 package/python-can/python-can.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index 61955a2b00..36e25b8764 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -11,3 +11,10 @@ config BR2_PACKAGE_PYTHON_CAN
 	  Python.
 
 	  https://github.com/hardbyte/python-can
+
+config BR2_PACKAGE_PYTHON_CAN_VIEWER
+	bool "python-can-viewer"
+	depends on BR2_PACKAGE_PYTHON_CAN
+	select BR2_PACKAGE_PYTHON3_CURSES # runtime
+	help
+	  Also install the viewer tool (requires ncurses).
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index b6547a4d3f..bc67be4f8c 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -11,4 +11,11 @@ PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
 
+ifneq ($(BR2_PACKAGE_PYTHON_CAN_VIEWER),y)
+define PYTHON_CAN_REMOVE_VIEWER
+	rm -f $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/can/viewer.py
+endef
+PYTHON_CAN_POST_INSTALL_TARGET_HOOKS += PYTHON_CAN_REMOVE_VIEWER
+endif
+
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
