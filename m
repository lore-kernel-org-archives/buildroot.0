Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B1DC05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 03:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B44060E72;
	Sun, 29 Jan 2023 03:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B44060E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IyZnV0RkKSqU; Sun, 29 Jan 2023 03:53:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9644B60EF2;
	Sun, 29 Jan 2023 03:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9644B60EF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 814261BF255
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 03:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B689818EC
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 03:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B689818EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lbq4SNofEYJT for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 03:52:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CF7F81836
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CF7F81836
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 03:52:39 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id k3so1812416ioc.10
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 19:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZpCIkUsnVi/C0PEwCmu++yiUcIJ5OYag7uhT2+MfD44=;
 b=jVm0ivdC0HU4mWZrfRMiMG9DPnrC3dykTxOeEgWC/a2D7Jazfgk37zA7+jFrBhWe56
 HM7PeNxZA8E8rT7hIYwpINX/pYJkghBcGmpw1s2vb5GhwueFvHii5GSccH18tAUTOSge
 wn/FJA07LB22B/qKRu4IqH0ODX/SzGNNH3GEhK4sqGbimNjapxbieL5cBRmxUvET1Ame
 ZlB28BeL+88iLekujE0yiEGxbG01TDI4SOrsxN9av/OI+jgqOKq9Y42LIIeXkhfv/Y38
 dXQTZDFPN5jak5bJmezS6u5mXT5yzuolg2KGExz0CjPT227QGTrA6a0iu+NkyA5tisgb
 q4xA==
X-Gm-Message-State: AO0yUKXx+LNnfm5hQYzd+wDlRUvpS0WdcJ+ta4yJJBRw1sO5jlka/7Op
 22nGoWueesBHyphDpglWhUYfUjLjptkG5g==
X-Google-Smtp-Source: AK7set8JMti6GL7XSBYMrh8mBmCgS2leVZZBl6JB3iG3wAbkwrsyhquqbjEaM4ghsp9zQqOPgEiQcQ==
X-Received: by 2002:a5d:9ed8:0:b0:713:bd7a:8f93 with SMTP id
 a24-20020a5d9ed8000000b00713bd7a8f93mr4020371ioe.10.1674964358054; 
 Sat, 28 Jan 2023 19:52:38 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 b21-20020a05660214d500b006f6623df63asm2874352iow.14.2023.01.28.19.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 19:52:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 20:52:28 -0700
Message-Id: <20230129035232.2480871-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129035232.2480871-1-james.hilliard1@gmail.com>
References: <20230129035232.2480871-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZpCIkUsnVi/C0PEwCmu++yiUcIJ5OYag7uhT2+MfD44=;
 b=MXrMzfbpKbqS+UmJFwCL2sSs4pHbaP+pMVF+tVYb53S9EuOPxN93STnlVDWkKfzVYf
 E0nBQJbhY9mJivdHTIyuwgG70vjdXqCzXH9zpK6ISvvxl8Y7tmtckajPYBYnTKQDuC4w
 D3KLb0UIvb/BkPXsCgchD4y/y1LGwWxdrD4Mg5TLxNjsTBE9LEpFmzya7BstfYNmxT7J
 9jf5zHXOW+fW0cHNAVNtVXKpGLBlj6v3xBj6VX5WwBxQq+MF8yfhYf2/LXpk+/+HqtgN
 DE1CmVDqVesbLe7DMAaixX3Zlvkrhbk4fEYvSeVWqdIXc4DINXJXwEspgD8gq4FiMqng
 k9EQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MXrMzfbp
Subject: [Buildroot] [PATCH v2 3/7] package/python-outcome: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-outcome/Config.in           |  7 +++++++
 package/python-outcome/python-outcome.hash |  7 +++++++
 package/python-outcome/python-outcome.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-outcome/Config.in
 create mode 100644 package/python-outcome/python-outcome.hash
 create mode 100644 package/python-outcome/python-outcome.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 608512a4bb..b686dbd87a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1388,6 +1388,7 @@ F:	package/python-logstash/
 F:	package/python-maturin/
 F:	package/python-multidict/
 F:	package/python-mypy-extensions/
+F:	package/python-outcome/
 F:	package/python-pathspec/
 F:	package/python-pep517/
 F:	package/python-pycares/
diff --git a/package/Config.in b/package/Config.in
index 594590a52a..195398b844 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1148,6 +1148,7 @@ menu "External python modules"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
 	source "package/python-orjson/Config.in"
+	source "package/python-outcome/Config.in"
 	source "package/python-packaging/Config.in"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-paramiko/Config.in"
diff --git a/package/python-outcome/Config.in b/package/python-outcome/Config.in
new file mode 100644
index 0000000000..bd51f3daea
--- /dev/null
+++ b/package/python-outcome/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_OUTCOME
+	bool "python-outcome"
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	help
+	  Capture the outcome of Python function calls.
+
+	  https://github.com/python-trio/outcome
diff --git a/package/python-outcome/python-outcome.hash b/package/python-outcome/python-outcome.hash
new file mode 100644
index 0000000000..43796e89ac
--- /dev/null
+++ b/package/python-outcome/python-outcome.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/outcome/json
+md5  58612ee4407901985f85ad3869dd83b8  outcome-1.2.0.tar.gz
+sha256  6f82bd3de45da303cf1f771ecafa1633750a358436a8bb60e06a1ceb745d2672  outcome-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  652c878488d1456361e08c3f8607fd7ba59892a14103d15cce4ff93c85b5cc8b  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
+sha256  3e6dae555eb92787fc82d1d48355677f454c7f65aeb38d3f9e72bf9a3daf034b  LICENSE.MIT
diff --git a/package/python-outcome/python-outcome.mk b/package/python-outcome/python-outcome.mk
new file mode 100644
index 0000000000..27d7fdede3
--- /dev/null
+++ b/package/python-outcome/python-outcome.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-outcome
+#
+################################################################################
+
+PYTHON_OUTCOME_VERSION = 1.2.0
+PYTHON_OUTCOME_SOURCE = outcome-$(PYTHON_OUTCOME_VERSION).tar.gz
+PYTHON_OUTCOME_SITE = https://files.pythonhosted.org/packages/dd/91/741e1626e89fdc3664169e16300c59eefa4b23540cc6d6c70450f885098f
+PYTHON_OUTCOME_SETUP_TYPE = setuptools
+PYTHON_OUTCOME_LICENSE = Apache-2.0 or MIT
+PYTHON_OUTCOME_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
