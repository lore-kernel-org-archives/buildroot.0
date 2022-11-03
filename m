Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBED4C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FA166105E;
	Thu,  3 Nov 2022 21:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FA166105E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXfMpFjxVCky; Thu,  3 Nov 2022 21:28:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAF2861046;
	Thu,  3 Nov 2022 21:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAF2861046
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DA931BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB18781E29
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB18781E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v78baLbR3aAI for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:13:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FEA3819D1
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FEA3819D1
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:13:03 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id n191so2415653iod.13
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 14:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YcYs3Zo81lRxvCco5AK1AEvCiPyzfWKvsJpLEIynn78=;
 b=VmpLmNVnlYnrVOsXzPfgjww6OHX63RBHMsiFIKtaiSmmY0AnpBmRDvBHAKM4KgbfAU
 zHu5hz1d3p+wE3kOEwmWRt8S2ShKOCLK021vgMl6b4Mq8cR8YMxruK3Ct83UJQoHEHAz
 I9zIsDwSeFtdr/eu5b7+o7DChdTBvKlompabJtohiHBmWmTWZv2i300gwLgKmnSC4pZa
 KkcDtBxG3EtBCdts6DKlXMcMIjwmYqjYj2+cg50lU6YaZlUEtrakuURPQzOo576sxqjq
 5vaf/QZmGDxQH67zYR8JhpOixKad5ZE/6D/fP519s5ZwFG7G67odo8PBQcKqAirEdaeG
 d/Vg==
X-Gm-Message-State: ACrzQf1cw7xz+MdKud0MZ1GxdsU7qFFiVUfSmJGlLU/fALQyuoavr7El
 V28eML4KPnBqFNxPpW0fgDOnBWTintkHIt3l
X-Google-Smtp-Source: AMsMyM7ojNZec1iFoOWa8TwBx0hJA5gafulxj6uE8t2+Mb7s0QIA8pBJjyxRrDWIUaWsz79oVYCJ4A==
X-Received: by 2002:a02:c8d0:0:b0:375:109f:bc14 with SMTP id
 q16-20020a02c8d0000000b00375109fbc14mr19808665jao.233.1667509981854; 
 Thu, 03 Nov 2022 14:13:01 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 t10-20020a056602140a00b0067fb21ad9c3sm735014iov.22.2022.11.03.14.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:13:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 15:12:59 -0600
Message-Id: <20221103211259.3920599-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YcYs3Zo81lRxvCco5AK1AEvCiPyzfWKvsJpLEIynn78=;
 b=ijm8QBOuzevQzuHddiDSC+oVpPPDdP+55uuFDaGOf07JdMbO0+o2v7ie7dLCWjFhdF
 sYPOdMDfz+lNvBJ5oGj175EmjYCBR6qknAbh6TJqW93dRL33OMn6oSOftw3lvyW431Xo
 MpuOVgGhN99RDwb3Q+29Mh5gDKIEdmIws+bO88mpyksBsyJOCTSMA0xfYulZjUWlYQaM
 EA6vPJ1DqCEtyH8jN7LYBmqaF/1XjUijw84lJcPUvkfpSYSTI5Sw6HvV12JYmNqUKpLX
 WQAM31onY3B9yag79J9MyzzeO/RarKq/qzO/YDTl/fAzMYznAfHUpWxsgQDTxwxoc6SV
 C5ZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ijm8QBOu
Subject: [Buildroot] [PATCH 1/1] package/python-xlib: bump to version 0.32
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-xlib/python-xlib.hash | 4 ++--
 package/python-xlib/python-xlib.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xlib/python-xlib.hash b/package/python-xlib/python-xlib.hash
index 120541f998..066f450416 100644
--- a/package/python-xlib/python-xlib.hash
+++ b/package/python-xlib/python-xlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-xlib/json
-md5  3a87f81bff4cb4f8a52881097ba51a49  python-xlib-0.27.tar.bz2
-sha256  a90667c70905c6ef0754c8a09fa61acbc1e1b7ddb946d527831800d7cbfe9348  python-xlib-0.27.tar.bz2
+md5  ba31623fb64a1e5a0b1ae1f6495c3bf6  python-xlib-0.32.tar.gz
+sha256  20e1382f8a98d8ed0facfa45415c46fd0c8eeb6f9996e58c22d3382a4ed6e37b  python-xlib-0.32.tar.gz
 # Locally computed sha256 checksums
 sha256  06eb1c441443cf15ac84f309003f4c43c62246939d37c75fc3e056c2d34cd300  LICENSE
diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
index ae8ca1653b..3ce1c5fdb0 100644
--- a/package/python-xlib/python-xlib.mk
+++ b/package/python-xlib/python-xlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLIB_VERSION = 0.27
-PYTHON_XLIB_SOURCE = python-xlib-$(PYTHON_XLIB_VERSION).tar.bz2
-PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/e8/fa/a61ef33df117de4c57d11b4ba0b624f5352f21aa2e1eda404860155e8855
+PYTHON_XLIB_VERSION = 0.32
+PYTHON_XLIB_SOURCE = python-xlib-$(PYTHON_XLIB_VERSION).tar.gz
+PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/4d/cf/a29ecb43a5c84a65ffd726e3b28806f56b3bc5e796ddb533ff52af107dcf
 PYTHON_XLIB_SETUP_TYPE = setuptools
 PYTHON_XLIB_LICENSE = LGPL-2.1+
 PYTHON_XLIB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
