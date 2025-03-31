Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AA5C3600C
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 23:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4122D40B70;
	Mon, 31 Mar 2025 23:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPMxorNRwss0; Mon, 31 Mar 2025 23:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B72A40730
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B72A40730;
	Mon, 31 Mar 2025 23:38:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56D45D8E
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F88E81215
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUsp2JcWC4w8 for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 23:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE5908128D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE5908128D
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE5908128D
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:09 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2295d78b45cso3013305ad.0
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 16:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743464288; x=1744069088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TkZwzjyXXsgETbyC0F56Ikq8Uyeknuy3g0IcgUrhKzQ=;
 b=YcNcwoJ1BPCa9pSR/zxHqlUiDmzOMIpyIS7TMegsvyFm25zQfmN1K8VaPW/NJD97DH
 GbDeI0bI9s125dnq6zZcGJQR0/N4jf8G+s/OCvdz2mkN+k8cLNusqm24tjGZUJC8Bbjn
 DFvvjMIN0+X3o1EoIWUxFZ8w1Kwo/vt6iI9gwUZmWb8WeufpbN6O2kxu8QMk2S75lrHm
 foqHsWQxYI7y1USqDsGXY/u6oYR8DyeHQvn5LvlevjHtcFrogY/k4Wo0EQN81IA7A7JL
 o5n8h3z50H+uh+JHFmxdWuumLUJa4y/dVzIVp6HLy9qykbwLon0H6cL9xWJy43iyDcQ1
 8NMg==
X-Gm-Message-State: AOJu0YybKTpiSPIE8JJ9fbzuXtCZhKrr1Cx6Vx7gyPrml9T2cQzKJez9
 hufCOST8K1FSVIQ/rnn1djQqZRZn90OlQ/m0/xmeAosWh8YssfzJ6pyZg2RfqT9432deHq9WV/v
 zuAw=
X-Gm-Gg: ASbGncsUVmmOyPDkoSWZEHa3/Zu15HBuAfCaEdl6RQvbi6I9oBWbuSB4Xed/cNUUhaz
 leE9MgnTpOBTn1LKMGpOQoVOApXKRRa1kvtGRTul1mJsAt6bqNNCK2W215tOewf8u2HgHmLa/bD
 RMGT+U8cAuubePNt3U+/WU+UoCfy8yh8vAVLn5t92DHI1MuAZ8dm0aBFSVemnWqIePq9MLFu7q7
 CxMm2LMlgykU/7NiGxAFURStcVQ/O62VI7OSHyAkXUeKTZlS5sxKPJQKstfD8gyewIgRxCFRYv3
 RTaW+N2Y2SgPcNgzva4eDqSXAbl2UI0P2mTniLpXsyU3mgUegEckiB5PU0LuzxmS0GJmkebWh/r
 K1FeArKganXliSLnFRA==
X-Google-Smtp-Source: AGHT+IHKodYuddudviMgARhQETjtXNs86AZSpooVLLDgWON2o5w1r4bL50zOyA0/9NaUGtm0nmjkKg==
X-Received: by 2002:a05:6a00:3cc9:b0:736:4cde:5c0e with SMTP id
 d2e1a72fcca58-739803923c7mr14951092b3a.10.1743464287897; 
 Mon, 31 Mar 2025 16:38:07 -0700 (PDT)
Received: from res-0346.adl.internal.resolution.systems ([103.211.209.15])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73971091cadsm7577025b3a.126.2025.03.31.16.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 16:38:07 -0700 (PDT)
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
To: buildroot@buildroot.org
Date: Tue,  1 Apr 2025 10:07:22 +1030
Message-ID: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20230601.gappssmtp.com; s=20230601; t=1743464288; x=1744069088;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TkZwzjyXXsgETbyC0F56Ikq8Uyeknuy3g0IcgUrhKzQ=;
 b=b9nUGP4y5q6vEM0YN0cmW6aJMkdtRxl5JgnR9da/8ylRrm3sRjSDLW/agv3P/y6ezE
 d8gXCIJLx4Pq4ZYXHu3bw7w34aZsv/GystKU3Z7miqtITdZNetN6N5XCo4h3ZlFTMyHb
 tnI/RisoPCfQl4oBNwUrhf2uZPoFBiQCM8ExAoxDiSQJdd998MpsBxC8oFlH64MlA06W
 zQTnYwBIhnNJrrg+U/o54KmaP9uKcOski6jT22arSMD978IbAyXXZq4r40/NaUQRx+DM
 /X2mhNPXLbrEYWkU2J7SiBHq8nidlVgXC38rYBFlbxsHpXCTKJYF+EBlZSBx8ziew5R8
 zrAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maxmine-com-au.20230601.gappssmtp.com
 header.i=@maxmine-com-au.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=b9nUGP4y
Subject: [Buildroot] [PATCH 1/5] package/python-cachelib: add version 0.13.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Daniel Crowe <daniel.crowe@maxmine.com.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Provides caching APIs.
https://cachelib.readthedocs.io/en/stable/

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
---
 package/Config.in                            |  1 +
 package/python-cachelib/Config.in            |  6 ++++++
 package/python-cachelib/python-cachelib.hash |  6 ++++++
 package/python-cachelib/python-cachelib.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-cachelib/Config.in
 create mode 100644 package/python-cachelib/python-cachelib.hash
 create mode 100644 package/python-cachelib/python-cachelib.mk

diff --git a/package/Config.in b/package/Config.in
index 4b7e474cac..71d8580638 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1035,6 +1035,7 @@ menu "External python modules"
 	source "package/python-brotli/Config.in"
 	source "package/python-bsdiff4/Config.in"
 	source "package/python-cached-property/Config.in"
+	source "package/python-cachelib/Config.in"
 	source "package/python-cachetools/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-canopen/Config.in"
diff --git a/package/python-cachelib/Config.in b/package/python-cachelib/Config.in
new file mode 100644
index 0000000000..c17454c4be
--- /dev/null
+++ b/package/python-cachelib/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CACHELIB
+	bool "python-cachelib"
+	help
+	  A collection of cache libraries in the same API interface.
+
+	  https://github.com/pallets-eco/cachelib/
diff --git a/package/python-cachelib/python-cachelib.hash b/package/python-cachelib/python-cachelib.hash
new file mode 100644
index 0000000000..6a50350aa1
--- /dev/null
+++ b/package/python-cachelib/python-cachelib.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/cachelib/json
+md5  fc25e9c9165cd5fd42ce282c2ba540fd  cachelib-0.13.0.tar.gz
+sha256  209d8996e3c57595bee274ff97116d1d73c4980b2fd9a34c7846cd07fd2e1a48  cachelib-0.13.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cd418120812dc2626281ae027e81b648229d166b5aca7472cecd510038d36e7d  LICENSE.rst
+sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-cachelib/python-cachelib.mk b/package/python-cachelib/python-cachelib.mk
new file mode 100644
index 0000000000..7361a21f4f
--- /dev/null
+++ b/package/python-cachelib/python-cachelib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cachelib
+#
+################################################################################
+
+PYTHON_CACHELIB_VERSION = 0.13.0
+PYTHON_CACHELIB_SOURCE = cachelib-$(PYTHON_CACHELIB_VERSION).tar.gz
+PYTHON_CACHELIB_SITE = https://files.pythonhosted.org/packages/1d/69/0b5c1259e12fbcf5c2abe5934b5c0c1294ec0f845e2b4b2a51a91d79a4fb
+PYTHON_CACHELIB_SETUP_TYPE = setuptools
+PYTHON_CACHELIB_LICENSE = BSD-3-Clause
+PYTHON_CACHELIB_LICENSE_FILES = LICENSE.rst docs/license.rst
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
