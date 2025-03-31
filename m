Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2535C3600C
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 23:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C219A40C84;
	Mon, 31 Mar 2025 23:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8F3OIMEkSRPc; Mon, 31 Mar 2025 23:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7D7740C93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7D7740C93;
	Mon, 31 Mar 2025 23:38:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19842121
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09965401B1
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqDpqJNIn9rc for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 23:38:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 436314014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 436314014E
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 436314014E
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:17 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-22548a28d0cso134144985ad.3
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 16:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743464296; x=1744069096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+CTpBxlEEaPTnZhLyoo73gWXiXi8ys0xn8XirW7OLsQ=;
 b=ZCaESvgvJTrAotpwQ1hcD7MdDhF2y1GT5aDhdtpfGuXc65VO7jm2h1E2A+lBfZSfVN
 Hb21K44Zln2Ahj62Zv/K9vvcVRHpEr3Wd7SVFDuzwjrmowMBE2eRGSZ/tOvn1rV2iMzO
 BpHLZekWjPSbaAd7slj84bxEhZLnZe+6FunqtN8IHFAGAPzZgIF5fcZ8ZAe042zV6lJo
 YhKBQG8cS5hZEUgkFiKC267N54vnM0CQDPgSZYNd9jtTvDzmEW8vbb6fM7w5fLaTKQyQ
 Ai6SfIWOkrGomVJTZV7vDFA55Ls+YVcZven2FWwXVfzXWEKaNehCnUoHkSJM4rj3xR8K
 +uXw==
X-Gm-Message-State: AOJu0Yy//JmJsYponP+vRy0HbuxjMYjUEkLfMUB2e4jRK9UPbuepavrV
 66RAdu9U3JpTtBSYOJMnLty0OiZtPe8wB6f1HNnhBDZRak96fPVhPaH6KbLS1mgSe4G09tarxZ2
 FRVc=
X-Gm-Gg: ASbGncvZ5FvQNPIPEQ7JZqHJlfld5Kert1GKcHro25eadp0syr72eg29Pt8x3pjnC2k
 9RkoBG8ggFysxjrjmCQ6qcoxyOZpXyKKGMJ2GpQNmbUNZrdD7gRn/BU324z7PNAVELtf5WdL2ii
 26xLduav8ztPPqZknRLAfSvPUFf5Ytzrvzf1patvXkLqitdVWg8dX8hNClesqDOB3CvBTiQ9/v/
 UxYGh/KmBmfY0NYbpfeJ67lAoBy/N7JYBRshRcjNr+7IUdpmtL7BzSE2i45vWM/ERr80fvhV58H
 ec5ERGp2Gs1vhF2s1hiYsOgWoOrC6zuQRIba9FwzTlEsyfrkDmkDKoxOx+SMydaYHoXJoLTJv3J
 XD2nKxz/4u7BNJaQAbQ==
X-Google-Smtp-Source: AGHT+IFpN/vtFuZvBstzeAgvYIDYESXa9CokKsBuQYps3QB15X+uedytnXfFTo0+U8i+e55VipDVTQ==
X-Received: by 2002:a05:6a00:1152:b0:736:ab21:8a69 with SMTP id
 d2e1a72fcca58-73980011f9emr16226475b3a.0.1743464296183; 
 Mon, 31 Mar 2025 16:38:16 -0700 (PDT)
Received: from res-0346.adl.internal.resolution.systems ([103.211.209.15])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73971091cadsm7577025b3a.126.2025.03.31.16.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 16:38:15 -0700 (PDT)
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
To: buildroot@buildroot.org
Date: Tue,  1 Apr 2025 10:07:25 +1030
Message-ID: <20250331233726.3730509-4-daniel.crowe@maxmine.com.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
References: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20230601.gappssmtp.com; s=20230601; t=1743464296; x=1744069096;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+CTpBxlEEaPTnZhLyoo73gWXiXi8ys0xn8XirW7OLsQ=;
 b=XTt5LFWzSLIN6is8UIqt0JvRHrcfKFP4zNODpPq5GssiPWjyweh9KZ3vaXbKDfQOys
 k+SXa3WeHIEnC46z/HtWGYpd2ZnT74lv1Bef/m7bzfuUFN7vTdPGly4Jd0RP6J27IsHF
 AhWpLBdREcSovUY6tyW5Wqo8VMcLGNhcR23UipFhSdQNjDwD5tC0vripLrJ4W/bav2uw
 gkOfiF8Zn9QfTn30fxPMlEKLGwg0njlvu7+4bS2lunxm6KJeIPdksR0DDO9UgKQW5nas
 x1yN6tfm3ShEqMdWnf2+wH/5sx5SA+kfpS4ltvcqTktw0nunjVprmFZDukFTrnNMG0PR
 qfRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maxmine-com-au.20230601.gappssmtp.com
 header.i=@maxmine-com-au.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=XTt5LFWz
Subject: [Buildroot] [PATCH 4/5] package/python-flask-restx: add version
 1.3.0
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

Support REST APIs with Flask applications
https://flask-restx.readthedocs.io/en/latest/

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
---
 package/Config.in                                  |  1 +
 package/python-flask-restx/Config.in               | 13 +++++++++++++
 package/python-flask-restx/python-flask-restx.hash |  5 +++++
 package/python-flask-restx/python-flask-restx.mk   | 14 ++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/python-flask-restx/Config.in
 create mode 100644 package/python-flask-restx/python-flask-restx.hash
 create mode 100644 package/python-flask-restx/python-flask-restx.mk

diff --git a/package/Config.in b/package/Config.in
index f15f5c76d8..dc042875e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1121,6 +1121,7 @@ menu "External python modules"
 	source "package/python-flask-expects-json/Config.in"
 	source "package/python-flask-jsonrpc/Config.in"
 	source "package/python-flask-login/Config.in"
+	source "package/python-flask-restx/Config.in"
 	source "package/python-flask-smorest/Config.in"
 	source "package/python-flask-sqlalchemy/Config.in"
 	source "package/python-flask-wtf/Config.in"
diff --git a/package/python-flask-restx/Config.in b/package/python-flask-restx/Config.in
new file mode 100644
index 0000000000..cdbe509891
--- /dev/null
+++ b/package/python-flask-restx/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_FLASK_RESTX
+	bool "python-flask-restx"
+	select BR2_PACKAGE_PYTHON_ANISO8601 # runtime
+	select BR2_PACKAGE_PYTHON_FLASK # runtime
+	select BR2_PACKAGE_PYTHON_IMPORTLIB_RESOURCES # runtime
+	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
+	help
+	  Fully featured framework for fast, easy and documented API
+	  development with Flask.
+
+	  https://github.com/python-restx/flask-restx
diff --git a/package/python-flask-restx/python-flask-restx.hash b/package/python-flask-restx/python-flask-restx.hash
new file mode 100644
index 0000000000..f90601cdc1
--- /dev/null
+++ b/package/python-flask-restx/python-flask-restx.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/flask-restx/json
+md5  262984a0c902db0b6f4afb86a69ea40e  flask-restx-1.3.0.tar.gz
+sha256  4f3d3fa7b6191fcc715b18c201a12cd875176f92ba4acc61626ccfd571ee1728  flask-restx-1.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256  d736fc20d979831ab5c380973d01542de97857d975b60a4cf03efbd9e4e38997  LICENSE
diff --git a/package/python-flask-restx/python-flask-restx.mk b/package/python-flask-restx/python-flask-restx.mk
new file mode 100644
index 0000000000..23596f23d4
--- /dev/null
+++ b/package/python-flask-restx/python-flask-restx.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-flask-restx
+#
+################################################################################
+
+PYTHON_FLASK_RESTX_VERSION = 1.3.0
+PYTHON_FLASK_RESTX_SOURCE = flask-restx-$(PYTHON_FLASK_RESTX_VERSION).tar.gz
+PYTHON_FLASK_RESTX_SITE = https://files.pythonhosted.org/packages/45/4c/2e7d84e2b406b47cf3bf730f521efe474977b404ee170d8ea68dc37e6733
+PYTHON_FLASK_RESTX_SETUP_TYPE = setuptools
+PYTHON_FLASK_RESTX_LICENSE = BSD-3-Clause
+PYTHON_FLASK_RESTX_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
