Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92842C61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 03:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0D64416B7;
	Sun, 29 Jan 2023 03:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0D64416B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ye4SWCX-lUAi; Sun, 29 Jan 2023 03:52:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E63041731;
	Sun, 29 Jan 2023 03:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E63041731
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F25B11BF255
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 03:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC05C60E72
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 03:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC05C60E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G28KI4hVolWv for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 03:52:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC8DC60C26
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC8DC60C26
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 03:52:38 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id r6so886532ioj.5
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 19:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lx0K6ZRfCVoO8EhNDZpQQztAp9duLb6wONUuZPu2zpg=;
 b=PYhKNCsUKR1fLHA7OXQDol1exFO6xf+tF/eSu51PmJf9jXBNP8v4DFGonIo4Sgpsq6
 /BNTpuKGdoHZVv1MOpF9/dLAicUI0SFjwSQ3i2Mzm1/6wwEfnKSqcmdHSucHx/cS7mgY
 HNY3qz/6PFCkBnH9ZKM/67wUEMWppW+gbpEGQYbGEAZKauR4iC9oh5wUhAWEwOSTTzJF
 nOZ22LtBfQ3Nk8IqQw2MqRwQ9QWRqoDg83sMRSYjaMY87KTPGJW/knj+adtj5jLZrp5Q
 AMRJjliv9A8Pr1XK4j4sG6MooW+SboQs8Qh60pvq8TzVtRc0260xhTVpAmbqKNGOgh4w
 b3DA==
X-Gm-Message-State: AFqh2kpy1BHE3Lgt6udSKJMIZyF5P6Ds8ZP1oIvu537fTIXmKjwHNWhh
 MXww2qJD+kFOFxiINWuZYBIBNUKt4vodCw==
X-Google-Smtp-Source: AMrXdXvzB6c13CYl365yeG1nHG2dixwitOBfYCwEy6i2ES53gScjwR4sfSyhh5cRi4ZFDgf2JQqIlw==
X-Received: by 2002:a5d:950a:0:b0:704:cf41:8a24 with SMTP id
 d10-20020a5d950a000000b00704cf418a24mr27967518iom.15.1674964357242; 
 Sat, 28 Jan 2023 19:52:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 b21-20020a05660214d500b006f6623df63asm2874352iow.14.2023.01.28.19.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 19:52:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 20:52:27 -0700
Message-Id: <20230129035232.2480871-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129035232.2480871-1-james.hilliard1@gmail.com>
References: <20230129035232.2480871-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lx0K6ZRfCVoO8EhNDZpQQztAp9duLb6wONUuZPu2zpg=;
 b=dlfd7VbetIomQXSJRHQS3lqh3XJeAVzcB6aOHgujS0M+pSPpC35JVKKjwkLQPsHoum
 YBkuDB40TC/EDFuotYzoJfHsyfVeIRyRBw/ag8asq8fJntbzU6uDPvQbqCNsQ0KkrhaO
 HR5/Cbd/aIS94LUUL3C6Iozfkdy1LyeIhhzFoBv3P5XiVqyws5/TDomuaXrXQRIklb8O
 uZEdj/whJW4TEevO5NpkQv2oXqBvcfP/qaDSiVGN15j69CIPl1cGGWB8gLc2iYL5QeUr
 tthYI7ZtZFKETvHP2YeE+VyG02HBFM0+HE4q2886hnlkuPMf0DfGLEE4oqCqEXlFmsDN
 gZYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dlfd7Vbe
Subject: [Buildroot] [PATCH v2 2/7] package/python-sniffio: new package
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
 package/python-sniffio/Config.in           |  6 ++++++
 package/python-sniffio/python-sniffio.hash |  7 +++++++
 package/python-sniffio/python-sniffio.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-sniffio/Config.in
 create mode 100644 package/python-sniffio/python-sniffio.hash
 create mode 100644 package/python-sniffio/python-sniffio.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6cf2b48a8f..608512a4bb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1396,6 +1396,7 @@ F:	package/python-pypa-build/
 F:	package/python-pyphen/
 F:	package/python-rtoml/
 F:	package/python-snappy/
+F:	package/python-sniffio/
 F:	package/python-sockjs/
 F:	package/python-terminaltables/
 F:	package/python-tinycss2/
diff --git a/package/Config.in b/package/Config.in
index dd15467b11..594590a52a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1280,6 +1280,7 @@ menu "External python modules"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-smmap2/Config.in"
 	source "package/python-snappy/Config.in"
+	source "package/python-sniffio/Config.in"
 	source "package/python-socketio/Config.in"
 	source "package/python-sockjs/Config.in"
 	source "package/python-sortedcontainers/Config.in"
diff --git a/package/python-sniffio/Config.in b/package/python-sniffio/Config.in
new file mode 100644
index 0000000000..6f3947afe6
--- /dev/null
+++ b/package/python-sniffio/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SNIFFIO
+	bool "python-sniffio"
+	help
+	  Sniff out which async library your code is running under.
+
+	  https://github.com/python-trio/sniffio
diff --git a/package/python-sniffio/python-sniffio.hash b/package/python-sniffio/python-sniffio.hash
new file mode 100644
index 0000000000..00af7c58bb
--- /dev/null
+++ b/package/python-sniffio/python-sniffio.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/sniffio/json
+md5  abb96bcda81817d6c632915c53ac29c8  sniffio-1.3.0.tar.gz
+sha256  e60305c5e5d314f5389259b7f22aaa33d8f7dee49763119234af3755c55b9101  sniffio-1.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256  652c878488d1456361e08c3f8607fd7ba59892a14103d15cce4ff93c85b5cc8b  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
+sha256  3e6dae555eb92787fc82d1d48355677f454c7f65aeb38d3f9e72bf9a3daf034b  LICENSE.MIT
diff --git a/package/python-sniffio/python-sniffio.mk b/package/python-sniffio/python-sniffio.mk
new file mode 100644
index 0000000000..fa369a0e2f
--- /dev/null
+++ b/package/python-sniffio/python-sniffio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sniffio
+#
+################################################################################
+
+PYTHON_SNIFFIO_VERSION = 1.3.0
+PYTHON_SNIFFIO_SOURCE = sniffio-$(PYTHON_SNIFFIO_VERSION).tar.gz
+PYTHON_SNIFFIO_SITE = https://files.pythonhosted.org/packages/cd/50/d49c388cae4ec10e8109b1b833fd265511840706808576df3ada99ecb0ac
+PYTHON_SNIFFIO_SETUP_TYPE = setuptools
+PYTHON_SNIFFIO_LICENSE = Apache-2.0 or MIT
+PYTHON_SNIFFIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
