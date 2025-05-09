Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4B3C3ABBE
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 01:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E662B610FE;
	Fri,  9 May 2025 01:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JNtvTXBv2qR; Fri,  9 May 2025 01:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7EBA610F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7EBA610F6;
	Fri,  9 May 2025 01:16:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A44EE2
 for <buildroot@buildroot.org>; Fri,  9 May 2025 01:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 103D061083
 for <buildroot@buildroot.org>; Fri,  9 May 2025 01:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Jvd1ZH_sEDe for <buildroot@buildroot.org>;
 Fri,  9 May 2025 01:16:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97EC26102B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97EC26102B
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97EC26102B
 for <buildroot@buildroot.org>; Fri,  9 May 2025 01:16:09 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-af91fc1fa90so1298115a12.0
 for <buildroot@buildroot.org>; Thu, 08 May 2025 18:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746753368; x=1747358168;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t1Y2Rncg38M+KtAoR1K7ms98YM7GfscNDdpnJPhIeH0=;
 b=X3u8dAfNJfj9nPg2j+TOSDWgt3L89LI68g3vpFqcuTPwu31hViREMdrNJWHxrTOC0i
 E7ABZT/Sx/zD1258fpMwhQETpnaxPsWUXFALvKP+GXOeqZwlzjAZAeToGVPfSfgnBTNT
 PH1SzFezbdKpuZQubNzL9JD5TSm7qVgkIG6K4SImNNtklcFD1rPtSz3bX1BA26B1NCFR
 iLs/CnVY9r4aQHry6xA6nU/KAXEGsJr4lY4nDuX+F9yAPTmzX8b/r+bYDpcA0trjLH3I
 FSHxLpD4FlPfNzPqa9lwyLNXW4hjUEFXYfOfYKfwtguVldIINgdhJTJfgRq2ZnoeZLJ9
 aq2Q==
X-Gm-Message-State: AOJu0Yw9cd8nSwz43NeZQjccqHkZ2ukJ9ESBYp/sSC+wvEmWoWJNRW3/
 X7pYXZ0WlgTahhkWCziRUGfFd0O4eReNz1UsWHq86TTQrcB8mt12fJW2yF8/ChDP4ABcZtSBMs8
 lGvA=
X-Gm-Gg: ASbGnctHqTCofEd2eGsxaYzrqpYzxGguBxYLdk0TIVj8beY3wdhIaDl014JyzLYdjGs
 wmOFnPt24NftnYy4K+spjT2t9Wra7d23l3Zabv+s6jLAE4Mv42vLgwiqbzaTjBBs9qc5ON9ibVc
 tWb7rwr8kCMUfoJYNWhF2z7JFHbU32BbOeMoLNd2uUlJ8t4zsquiJ7sbkrXgrsreADaag8ETCSW
 huONOI7K1d1HPgwfsULaTsHAv5FgPKjJEOLPGiJufc/2zNTgpk6KY0oTlOF941T5qb0+FkIkkfg
 wJkKXm2FPxZt64Pyem/0YgOID7jw6KdljU478aoY2GYaN+KUPfmKaKI24CsI88DAnr+1N6z+MPL
 JWVAx1H1TTg3VyA==
X-Google-Smtp-Source: AGHT+IFmmn9XznzN7SCZh5gEZkfjoYJoMhbjk0UZM57d5n52J83QH66MXf04FU0k7SAkLzWeO1AFvQ==
X-Received: by 2002:a17:902:f609:b0:22e:50e1:31fd with SMTP id
 d9443c01a7336-22fc89404a2mr26469495ad.0.1746753367835; 
 Thu, 08 May 2025 18:16:07 -0700 (PDT)
Received: from res-0346.adl.internal.resolution.systems ([103.211.209.15])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30c39dd4334sm704994a91.13.2025.05.08.18.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 18:16:07 -0700 (PDT)
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
To: buildroot@buildroot.org
Date: Fri,  9 May 2025 10:45:29 +0930
Message-ID: <20250509011530.202963-1-daniel.crowe@maxmine.com.au>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20230601.gappssmtp.com; s=20230601; t=1746753368; x=1747358168;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t1Y2Rncg38M+KtAoR1K7ms98YM7GfscNDdpnJPhIeH0=;
 b=AAdLWcxs38DTzGIVp773zBEL+dfZ/ToEPVNU9RJqnN1Pw9vXxVGQ7++UM2uhgpiM7U
 2CyNRESfZfBpPnR92IKkun80R+FzpOV/ULMT3vJOACaU5q4wdXB+4FSo37jFzG1eCdBL
 Hw+c1SU3n4J/YySgpPufXynvOLBx5ixbwytpkZtKxRkPEu0zfYkonN1kMJR1kLrrFKtt
 NqhXIfAKRtcWHiB/F8ZZOPAgE3CGGHpQNTRmEd7WEh3iCUJo8X7N7/kPw3stHWwJx2h6
 l6EGF5nIdgUM0MSO4hfgsIYDSm+CGY330fudBWXhXcYz+bSn18XzDt/vbu1ocTB1fxvu
 Y5nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maxmine-com-au.20230601.gappssmtp.com
 header.i=@maxmine-com-au.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=AAdLWcxs
Subject: [Buildroot] [PATCH 1/2] package/python-flask-restx: add version
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Crowe <daniel.crowe@maxmine.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support REST APIs with Flask applications
https://flask-restx.readthedocs.io/en/latest/

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-flask-restx/Config.in               | 12 ++++++++++++
 package/python-flask-restx/python-flask-restx.hash |  5 +++++
 package/python-flask-restx/python-flask-restx.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/python-flask-restx/Config.in
 create mode 100644 package/python-flask-restx/python-flask-restx.hash
 create mode 100644 package/python-flask-restx/python-flask-restx.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d314be7946..36bf42da32 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -728,6 +728,7 @@ N:	Daniel Crowe <daniel.crowe@maxmine.com.au>
 F:	package/python-aniso8601/
 F:	package/python-cachelib/
 F:	package/python-flask-caching/
+F:	package/python-flask-restx/
 
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
diff --git a/package/Config.in b/package/Config.in
index 59ac4ad070..9e4b0ea167 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1128,6 +1128,7 @@ menu "External python modules"
 	source "package/python-flask-expects-json/Config.in"
 	source "package/python-flask-jsonrpc/Config.in"
 	source "package/python-flask-login/Config.in"
+	source "package/python-flask-restx/Config.in"
 	source "package/python-flask-smorest/Config.in"
 	source "package/python-flask-sqlalchemy/Config.in"
 	source "package/python-flask-wtf/Config.in"
diff --git a/package/python-flask-restx/Config.in b/package/python-flask-restx/Config.in
new file mode 100644
index 0000000000..4906869a38
--- /dev/null
+++ b/package/python-flask-restx/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_FLASK_RESTX
+	bool "python-flask-restx"
+	select BR2_PACKAGE_PYTHON_ANISO8601 # runtime
+	select BR2_PACKAGE_PYTHON_FLASK # runtime
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
