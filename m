Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F692C3600C
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 23:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6F1D81421;
	Mon, 31 Mar 2025 23:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyG0HI-OTZ-Q; Mon, 31 Mar 2025 23:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D472F812C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D472F812C6;
	Mon, 31 Mar 2025 23:38:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56982121
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37EB240275
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhkcEI5fHMFY for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 23:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E99F401B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E99F401B1
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E99F401B1
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:20 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-223fd89d036so105617235ad.1
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 16:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743464299; x=1744069099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kADnlAAiAkzAlkMMjQ7z1yfk9dJY8MKg62YE4xl6NPA=;
 b=fnJisFOIEiJodyDdvMnRj+bShRsuhvPquZRJEEoa2i7eJ9zGWnGkS1VEASzYSQ1oyZ
 3vSVRjKMgKvz2BWgciwZ2AYjirZoS3eglwObhsXhfn1Y1MUh0RF8P0rFZg/eLTwltOOP
 JJMzAu8wTR/N0vte5ET64oby8be//NDsyx1Jmp40yf2Nxm20mjagh823vaioBB2rTLOH
 4H7SiDt0W+bMFF1L1ZYWq4zgtsVbeiEZxTFa7qT5w4CtL+u21m5pMBb3vYM+5txW8asI
 9KePvBH6xDQBw6PJUsK38QAL/0XzQeGXZQTYFFtNKoXwPsU4U/+YoQT2bTnak4VawPZG
 PwjQ==
X-Gm-Message-State: AOJu0Yw6LTtWZt34uXM0buRhUJyV30ZKQoshENJmJ3wDAg45jOb2awjc
 NretWlFDbejMwatcuA3DM9jQXBrjSPs+WJR8WeOkyJt794lxRQbL/nM7k4F7fUinSOtV999gYTP
 rXPs=
X-Gm-Gg: ASbGnctOjwli2hOVMZWika0satAMBUF0W0pDCqAtIRc+3gwMhYVqUQ0NFZO/ZVZf9kn
 Kt/lnubO7hPn7uppRFLXLuK5ml2U8TrA8sMHVCo0sq4VbP082e4NF9Hp7eRvCcrwPdLfSO66fxh
 N9/lrcMBrRH5J5O981+8Dbd+8UoZ1jUyNUWmQ9NgBSd8bkfZPkPXOEzHSemF9C5di7xZ0+94Tkq
 Pide/jsG2VYflsV5w/YwJG4n7v+Vkznpfi9+pGR2xLJwKO1EN3Pfe55uIYgGGIa7IYn1e8beqxk
 3dtCV4H9Ui7tnVZsOu22RMB83O+C6GWwU88yBt2tppTCxNosbGSjPLww730RmGhpgJzoD8spKeB
 /KixWBPy6e6hpXXZGPA==
X-Google-Smtp-Source: AGHT+IHrufauPryAqPHpMKNLC9moxWIrQrj0ZaUxOcwsyl9rerzX5WVK/43CYbWjCXvV8E6ulqYh7A==
X-Received: by 2002:a05:6a20:6a13:b0:1f5:75a9:5255 with SMTP id
 adf61e73a8af0-2009f79b3fbmr16274060637.39.1743464298871; 
 Mon, 31 Mar 2025 16:38:18 -0700 (PDT)
Received: from res-0346.adl.internal.resolution.systems ([103.211.209.15])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73971091cadsm7577025b3a.126.2025.03.31.16.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 16:38:18 -0700 (PDT)
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
To: buildroot@buildroot.org
Date: Tue,  1 Apr 2025 10:07:26 +1030
Message-ID: <20250331233726.3730509-5-daniel.crowe@maxmine.com.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
References: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20230601.gappssmtp.com; s=20230601; t=1743464299; x=1744069099;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kADnlAAiAkzAlkMMjQ7z1yfk9dJY8MKg62YE4xl6NPA=;
 b=IOJSGIPmrHCdZeULrP1bFFt/Ke2by29bn54fff5yXF6r+fn9e9nfCtzQyG6jpDV3c+
 eeU5ZfdJytBF/R2w7wyeqAn4iN3ua0JqHoPrWYZCAivwSknOVrqkIK53JW4Jxs63Cq1l
 hXYolSqlgps0iw08cfIsuSE3/3xhkDyl5/7zGk2V/E0HcLeQCJZqZ9lKd4cG0gbF2sHL
 wo+uw4gFq+VJWy1Se5i/tqJggvKk1ghnkUHRTcjljcx2UFGomtpgjqNSs/Nc0bbykevc
 XEcGdSA8MROMb8UJ9nq4lGohzSPhToGa3AfJgqU144dP0ydCh0gTXme4o64MDIurutwC
 6Lbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=maxmine-com-au.20230601.gappssmtp.com
 header.i=@maxmine-com-au.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=IOJSGIPm
Subject: [Buildroot] [PATCH 5/5] package/python-pyproj: add version 3.7.1
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

Provides cartographic projections in Python
https://pyproj4.github.io/pyproj/stable/

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
---
 package/Config.in                        |  1 +
 package/python-pyproj/Config.in          |  8 ++++++++
 package/python-pyproj/python-pyproj.hash |  5 +++++
 package/python-pyproj/python-pyproj.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-pyproj/Config.in
 create mode 100644 package/python-pyproj/python-pyproj.hash
 create mode 100644 package/python-pyproj/python-pyproj.mk

diff --git a/package/Config.in b/package/Config.in
index dc042875e8..b82bffd227 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1325,6 +1325,7 @@ menu "External python modules"
 	source "package/python-pyphen/Config.in"
 	source "package/python-pypika-tortoise/Config.in"
 	source "package/python-pypng/Config.in"
+	source "package/python-pyproj/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
 	source "package/python-pyqt5-sip/Config.in"
diff --git a/package/python-pyproj/Config.in b/package/python-pyproj/Config.in
new file mode 100644
index 0000000000..b53b828d5f
--- /dev/null
+++ b/package/python-pyproj/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYPROJ
+	bool "python-pyproj"
+	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	help
+	  Python interface to PROJ (cartographic projections and
+	  coordinate transformations library).
+
+	  https://github.com/pyproj4/pyproj
diff --git a/package/python-pyproj/python-pyproj.hash b/package/python-pyproj/python-pyproj.hash
new file mode 100644
index 0000000000..6d9d4d2a20
--- /dev/null
+++ b/package/python-pyproj/python-pyproj.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyproj/json
+md5  ad62b11249d8e62879778190a3e3ef8c  pyproj-3.7.1.tar.gz
+sha256  60d72facd7b6b79853f19744779abcd3f804c4e0d4fa8815469db20c9f640a47  pyproj-3.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  a652687151814d4c4715445912fcb49e7e58f5b248d47a1a88b859a8815e0822  LICENSE
diff --git a/package/python-pyproj/python-pyproj.mk b/package/python-pyproj/python-pyproj.mk
new file mode 100644
index 0000000000..f94d9218ba
--- /dev/null
+++ b/package/python-pyproj/python-pyproj.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyproj
+#
+################################################################################
+
+PYTHON_PYPROJ_VERSION = 3.7.1
+PYTHON_PYPROJ_SOURCE = pyproj-$(PYTHON_PYPROJ_VERSION).tar.gz
+PYTHON_PYPROJ_SITE = https://files.pythonhosted.org/packages/67/10/a8480ea27ea4bbe896c168808854d00f2a9b49f95c0319ddcbba693c8a90
+PYTHON_PYPROJ_SETUP_TYPE = setuptools
+PYTHON_PYPROJ_LICENSE = MIT
+PYTHON_PYPROJ_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
