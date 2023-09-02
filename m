Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F782C83F2C
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 22:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5890581F99;
	Sat,  2 Sep 2023 22:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5890581F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yv6w_E5dc1uZ; Sat,  2 Sep 2023 22:07:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9D5A81F93;
	Sat,  2 Sep 2023 22:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9D5A81F93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CA621BF3F2
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 22:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1443260F41
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 22:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1443260F41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJUHccbSEAdB for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 22:07:54 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1907460F28
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 22:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1907460F28
Received: by mail.gandi.net (Postfix) with ESMTPA id EDC5840002;
 Sat,  2 Sep 2023 22:07:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun,  3 Sep 2023 00:07:50 +0200
Message-ID: <20230902220751.3574594-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693692472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2EldqzKYjwuUwsFdONv/VBmQyY3z/hQMuRzLaLno4L0=;
 b=e837tyRyXj/xpGQ/9Rbe3SToo8boFzGaZzXiMpsSVv0PKck2NLvdBadoc4QkI7WpWc2uc/
 MADzMWIf51BFG9zO+aHIsxMxOI76gjktW+relBY6UP432KnP3fhZe0bpx7R2jUmFKWWc3m
 j2NKVGE3jzZNmr8LA02zqLWtDce3nwQhZ7EWx+2kTMX1omgVr/8uYIvnFXlJnx7exZZm01
 p8WOjsU3gNZcG/B3sG2congiz/6Y8dAQfxalw3tFOOdt9HL2B1r8bYrYscqWruNfIM2d6G
 m8574u0HuQxQdZ7Bz6O85Ru3N4sim/1cJkCrwz2NcTWvU2HWP6W9JS0xeoOA/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e837tyRy
Subject: [Buildroot] [PATCH] package/python-ipython: ignore CVE-2023-24816
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It affects only Windows, so we don't care in the context of Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ipython/python-ipython.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index f5a114c2f3..aa274314eb 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -11,6 +11,8 @@ PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
 PYTHON_IPYTHON_CPE_ID_PRODUCT = ipython
+# Affects only Windows. Can be dropped once we update to >= 8.10.0
+PYTHON_IPYTHON_IGNORE_CVES += CVE-2023-24816
 PYTHON_IPYTHON_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
