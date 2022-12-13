Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB6BC4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 01:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F404405A7;
	Tue, 13 Dec 2022 01:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F404405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dvvfp8JYdvhX; Tue, 13 Dec 2022 01:50:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 989EB408EC;
	Tue, 13 Dec 2022 01:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 989EB408EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A43701BF2FB
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 01:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FA5240605
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 01:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FA5240605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Rn3xyj2xY8H for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 01:50:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76F27405A7
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76F27405A7
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 01:50:19 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id s16so4358454iln.4
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 17:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SVVAMvomM3cfJ85VBKcx7G8OCF9RN6am9Rc83bMKw9E=;
 b=NMd+ETSJ+eFs3wDzgpfPFOwgzXQ/maPiq16ZUs7AxkxBap/Dyg4Vlzu7HgTD9k0R1E
 3CN5BFCZJGTNpBy8zZJG8bsXhyX7Xa6JvZgpJdB61lMhTcWmZsW7h7OIyCt/lrZY4r3l
 DGNBUKXRHxfnTMYN+TaAkebQo9MTBcYJ7eyIcPcjDAqRzcLwZR9/zXrfczuxIYfyhu4h
 I7siSvYqDAxEHv37y6XtzQN2zPV8r5Y1BEKRaKlQi8bFoyiENrAdjDkzKBhd+Gb60NAt
 H5UPiL+FiAK1fcT+TupmLf9ygDTMy7anIHl/cnAUyV73gOEndNVuk/Aevs+VOgT3fHfb
 HbVA==
X-Gm-Message-State: ANoB5pno16hcdeyAO/OBpFmke9s0yPIWpuFq2pcyGl9VhG5t2b2aYCmv
 KWFQHklgcGPL/EJPGaATR1yj1UEbBRq6lw==
X-Google-Smtp-Source: AA0mqf5x2rBbtTDmZtDJZzCm0ddB1mFg5OXJ5hMtT2OskOFhBC1Iv3VBThX8gQRY+MrAf5e27+xypQ==
X-Received: by 2002:a92:c98e:0:b0:302:fa94:c741 with SMTP id
 y14-20020a92c98e000000b00302fa94c741mr10628544iln.3.1670896218221; 
 Mon, 12 Dec 2022 17:50:18 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y18-20020a027312000000b003760a908bfasm413354jab.169.2022.12.12.17.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 17:50:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 18:49:58 -0700
Message-Id: <20221213015001.4175808-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213015001.4175808-1-james.hilliard1@gmail.com>
References: <20221213015001.4175808-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVVAMvomM3cfJ85VBKcx7G8OCF9RN6am9Rc83bMKw9E=;
 b=CRAoehNw3ZriFXHd1SC+1g5zeDreuj/QrijnEmG4RRbOGN88tkASRybLbbqUlYTyk6
 fkAAez0g7wSDWFp4EY0JFLmg5E1EpKjWSY1QPt7N0zpUtnDDUo2IlC6Bdfb/YdPTu2Qa
 sfCOTw2+nDlXCD2hqV4xxhOsPK7m23O2WQfWK/UwkKvLGzk19SD8rwRMFCMtSvVFJ4D7
 mqAZF3DMlXc0a80Lhjh1/ZE9DYefW90OK2wIKzTCjhqcL1OsLWEznewv3A6WjxsbJ8KU
 FCDU0OZTG4zl41HKe4UWNnjfjrXfY9i0QsEqIHn6HWHrXw0IJmQBC9SEr+ZqI7TNdizi
 GkhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CRAoehNw
Subject: [Buildroot] [PATCH 4/7] package/python-trio: new package
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
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-trio/Config.in        | 12 ++++++++++++
 package/python-trio/python-trio.hash |  7 +++++++
 package/python-trio/python-trio.mk   | 14 ++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/python-trio/Config.in
 create mode 100644 package/python-trio/python-trio.hash
 create mode 100644 package/python-trio/python-trio.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f25ef3094a..769cde7155 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1397,6 +1397,7 @@ F:	package/python-sockjs/
 F:	package/python-terminaltables/
 F:	package/python-tinycss2/
 F:	package/python-tomli/
+F:	package/python-trio/
 F:	package/python-typeguard/
 F:	package/python-typing-inspect/
 F:	package/python-weasyprint/
diff --git a/package/Config.in b/package/Config.in
index 877a205366..dbf705bbdd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1302,6 +1302,7 @@ menu "External python modules"
 	source "package/python-tqdm/Config.in"
 	source "package/python-traitlets/Config.in"
 	source "package/python-treq/Config.in"
+	source "package/python-trio/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
 	source "package/python-txdbus/Config.in"
diff --git a/package/python-trio/Config.in b/package/python-trio/Config.in
new file mode 100644
index 0000000000..0aa53c90ca
--- /dev/null
+++ b/package/python-trio/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_TRIO
+	bool "python-trio"
+	select BR2_PACKAGE_PYTHON_ASYNC_GENERATOR # runtime
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_OUTCOME # runtime
+	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
+	select BR2_PACKAGE_PYTHON_SORTEDCONTAINERS # runtime
+	help
+	  A friendly Python library for async concurrency and I/O.
+
+	  https://github.com/python-trio/trio
diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
new file mode 100644
index 0000000000..487194662e
--- /dev/null
+++ b/package/python-trio/python-trio.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/trio/json
+md5  f7dbfa6a8722065f09da188641d8ed93  trio-0.22.0.tar.gz
+sha256  ce68f1c5400a47b137c5a4de72c7c901bd4e7a24fbdebfe9b41de8c6c04eaacf  trio-0.22.0.tar.gz
+# Locally computed sha256 checksums
+sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
+sha256  faa301d72dcc023b432bd77dc08a773ca3449e5c27440b9d66eb46fb8500b430  LICENSE.MIT
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
new file mode 100644
index 0000000000..80da203c15
--- /dev/null
+++ b/package/python-trio/python-trio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-trio
+#
+################################################################################
+
+PYTHON_TRIO_VERSION = 0.22.0
+PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/0b/b8/1b81d2149c3e2c25900d40b8e6c8d3ca502a3cc844b90c962b0854aaf3f3
+PYTHON_TRIO_SETUP_TYPE = setuptools
+PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
+PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
