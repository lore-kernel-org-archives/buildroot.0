Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E579C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 16:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 556C783BCB;
	Thu, 14 Dec 2023 16:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 556C783BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mAyFDzxPEb61; Thu, 14 Dec 2023 16:55:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80FE7817BD;
	Thu, 14 Dec 2023 16:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80FE7817BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 628FC1BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C58183CC9
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C58183CC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id opQR23zUq1rY for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 16:54:51 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D8CB83C14
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 16:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D8CB83C14
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7b72d574399so387827639f.0
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 08:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702572890; x=1703177690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IqdW/NBkVxHjniF6YBjJio+X5YIgUWzRt5G9MtYbLR8=;
 b=HFtZGomENCOM1OcJKLpSqMxkWZMLmEaRez3BIEs4X/BmjBdYF9JvY11HVN3oxaI0Wi
 ZWszNIGaFrOZQrlPmMjkgPK8N4PRiIbKfqm3m5OPFXO2elSw0pIdIiIiDo1r+C9oYFXv
 Sr/DUcI+Q4zheTj+FcCS0E9IAlo8sS7vlMeohnbf0kNYGTYRFKuREB9kIUfkS2EWc7HG
 Se0okepCfc9xRBVqz1F5MjjKoYQnezCjl8Y52veGwrRnAyb/IXDOdlCDGBmVlYN2zYiv
 pL9RcJqINpnJWdk3uIG9ts5c+TtSuSqHRTXXVLUrC6eF9K8MgAbtcFHQMsRPlBce7IxV
 0nlw==
X-Gm-Message-State: AOJu0YyxYgNZ8F7nbbYuTHBO2C8xaeC8CYbXx1kr+01RM7nnpqeJt0nc
 kYQCrHBqzsV6OlNXCsoE05s4VBzvv5EWTg==
X-Google-Smtp-Source: AGHT+IFJekd/cDFxZj7Ov1IZYJOcPJxnUGxD7iAWrUj5r7jIXNkCeu+6XatfpVj2sWdnoREv2z5vTQ==
X-Received: by 2002:a6b:5b0f:0:b0:7b4:28f8:52b with SMTP id
 v15-20020a6b5b0f000000b007b428f8052bmr12349364ioh.43.1702572889833; 
 Thu, 14 Dec 2023 08:54:49 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 u16-20020a6b4910000000b007b7372af699sm2912178iob.9.2023.12.14.08.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 08:54:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 09:54:18 -0700
Message-Id: <20231214165420.181703-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214165420.181703-1-james.hilliard1@gmail.com>
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702572890; x=1703177690; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IqdW/NBkVxHjniF6YBjJio+X5YIgUWzRt5G9MtYbLR8=;
 b=VjR9Smk/0XxLpDPW1WhZx8q1LhhRlWADzI4w+2j9kUI4n5v08WKfplauX67fWYBeUh
 kMk9ELj4EXwvzD9G1LZD+07LBkZjpcWaaKAe+QJjyHrzh/NL4UQQtAcGuWt1wwHtVwXH
 +ByYddhfYJkCl+nQ/90sEd3gBM5ISd7apgQ44xDYFtwuGa2ccMPjOTEWpfcWD8jIK+dv
 4Z+pxUHgzeH+t1hWotrZygu5G3awCwp2YXgJ+pEDh9b6SH+P1k8MxxcZcxAGNcpnbPJM
 IT1vSk+vWALXcPx+Ojas8N3TdxC3zg5JhJn3wFQ08CbAhNGQv5GSQHd744sAj24BfMdi
 oD4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VjR9Smk/
Subject: [Buildroot] [PATCH v3 6/8] package/python-fastapi-sessions: new
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-fastapi-sessions/Config.in          | 10 ++++++++++
 .../python-fastapi-sessions.hash                   |  5 +++++
 .../python-fastapi-sessions.mk                     | 14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-fastapi-sessions/Config.in
 create mode 100644 package/python-fastapi-sessions/python-fastapi-sessions.hash
 create mode 100644 package/python-fastapi-sessions/python-fastapi-sessions.mk

diff --git a/package/Config.in b/package/Config.in
index cf530b1355..a0134fa724 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1074,6 +1074,7 @@ menu "External python modules"
 	source "package/python-executing/Config.in"
 	source "package/python-falcon/Config.in"
 	source "package/python-fastapi/Config.in"
+	source "package/python-fastapi-sessions/Config.in"
 	source "package/python-filelock/Config.in"
 	source "package/python-fire/Config.in"
 	source "package/python-flask/Config.in"
diff --git a/package/python-fastapi-sessions/Config.in b/package/python-fastapi-sessions/Config.in
new file mode 100644
index 0000000000..a54b072f09
--- /dev/null
+++ b/package/python-fastapi-sessions/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_FASTAPI_SESSIONS
+	bool "python-fastapi-sessions"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_FASTAPI # runtime
+	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
+	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	help
+	  Ready-to-use session library for FastAPI.
+
+	  https://github.com/jordanisaacs/fastapi-sessions
diff --git a/package/python-fastapi-sessions/python-fastapi-sessions.hash b/package/python-fastapi-sessions/python-fastapi-sessions.hash
new file mode 100644
index 0000000000..dd5e224bde
--- /dev/null
+++ b/package/python-fastapi-sessions/python-fastapi-sessions.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/fastapi-sessions/json
+md5  397ee37291bdbb7330ef8f4af378cd28  fastapi-sessions-0.3.2.tar.gz
+sha256  5159023fd548f8a9c198a966cf1086a73a43038cf3b9b79175fe33129f15e64c  fastapi-sessions-0.3.2.tar.gz
+# Locally computed sha256 checksums
+sha256  4962ee6d7777ff7d2f96ad81424c2e78d73ea7f6282d368afa14a7500c2d223e  LICENSE
diff --git a/package/python-fastapi-sessions/python-fastapi-sessions.mk b/package/python-fastapi-sessions/python-fastapi-sessions.mk
new file mode 100644
index 0000000000..abfb41b5b6
--- /dev/null
+++ b/package/python-fastapi-sessions/python-fastapi-sessions.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-fastapi-sessions
+#
+################################################################################
+
+PYTHON_FASTAPI_SESSIONS_VERSION = 0.3.2
+PYTHON_FASTAPI_SESSIONS_SOURCE = fastapi-sessions-$(PYTHON_FASTAPI_SESSIONS_VERSION).tar.gz
+PYTHON_FASTAPI_SESSIONS_SITE = https://files.pythonhosted.org/packages/1d/89/da83ba47bd70101e14eca0ac57c7f300b055b70104446badfdc1dcbe813f
+PYTHON_FASTAPI_SESSIONS_SETUP_TYPE = setuptools
+PYTHON_FASTAPI_SESSIONS_LICENSE = MIT
+PYTHON_FASTAPI_SESSIONS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
