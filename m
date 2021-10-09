Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67FCC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:57:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E73960F5A
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E73960F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47E84406F1;
	Sat,  9 Oct 2021 20:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QHvVo7Kf4N3T; Sat,  9 Oct 2021 20:57:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5CB240712;
	Sat,  9 Oct 2021 20:57:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17CB31BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF115827DE
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zymhL9NRP1-z for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A9A58239A
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:36 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso7929305pjb.1
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSv6FZZPa/iTMhqlvc/UPCcd5x9KekW1mPo982wVdkg=;
 b=CilZ9GDwTj5QIXLItWjGoaV5/uHNQ69yXH/J18ABiCx8iZutBZZsTuhkGIU4RWvad+
 v6YsHGE3NbGK3CYSpcvqu41lB42ojNEjQDLHUa5p+JmxTu2AfwV4aEHzBUkbNX5VETsE
 dCd66CYIn9+kUOPjZHLefcKT6CaHJuHD0x4xMXDKf6HPIeOxiwiu30t6nOyInx9WP2g7
 He6aFW8YiMgbwQ5FNBIgJur75q1alJ7Z3E3WBc7Z1zVKIs5y+m99bRGkNR51AH3ROZdl
 GI8y4tsHq92ToloEcJKzAQnyJnLB6omKlpI85RR6a+/hXJswKq2kepYCCiE61ggIUrU9
 nU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSv6FZZPa/iTMhqlvc/UPCcd5x9KekW1mPo982wVdkg=;
 b=CenHYx3uNuq4gjy4ooQIu3sQMWxcsRiSZFGgjGDgM9ElBTR9su2QMZKxCZ8ERLSKky
 5JoIACBXgZWQAGC3bTCh1ivzNsT+UQGdhVbSL18Q/IBa7RdHHr2Vzj79hqwH0CRtflhP
 tRa1CSBxZR3e2HRvbJA+GPvSvBGKQx5Kn0q78VN/CmaWENO2EeB0C2oEzdVXvb6fWuhs
 ttFavFncewnw5WYpa/aE4ePOJB/c5DtWmA4/3QS5N1/+q1L2/zYyUs6EQq2hiuucYaix
 XGL3kKp+BggsCUqNxoTzAMz69KoGhdCkmo0cP64yJJKn0OQT6U08Ob8PldzjB8dXOH8o
 WeFg==
X-Gm-Message-State: AOAM531g+jqPgohccGkA/iKHsVI/fBu2ZIEPW9hH+sCPZ1GbmNjpLwJn
 Gyr2MwW7w0QD3mio/UYl4f0Bg64GVQQr3A==
X-Google-Smtp-Source: ABdhPJyKaP1W8QTeN/UK53/feAaU3AGpvc9G0TAU1cV3PVuecmKonjFUGM8zh+KoLNHQmbrt2U3Kcw==
X-Received: by 2002:a17:902:9a43:b0:13e:6386:d720 with SMTP id
 x3-20020a1709029a4300b0013e6386d720mr16222537plv.29.1633812936308; 
 Sat, 09 Oct 2021 13:55:36 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:36 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:12 -0700
Message-Id: <20211009205523.3137859-10-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 09/20] package/python-dataclasses: new package
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-pydantic 1.8.2 depends on this package.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-dataclasses/Config.in               |  6 ++++++
 package/python-dataclasses/python-dataclasses.hash |  5 +++++
 package/python-dataclasses/python-dataclasses.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-dataclasses/Config.in
 create mode 100644 package/python-dataclasses/python-dataclasses.hash
 create mode 100644 package/python-dataclasses/python-dataclasses.mk

diff --git a/package/Config.in b/package/Config.in
index 9fed0ab4cb..b4164734c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -969,6 +969,7 @@ menu "External python modules"
 	source "package/python-daemon/Config.in"
 	source "package/python-daemonize/Config.in"
 	source "package/python-daphne/Config.in"
+	source "package/python-dataclasses/Config.in"
 	source "package/python-dataproperty/Config.in"
 	source "package/python-dateutil/Config.in"
 	source "package/python-dbus-next/Config.in"
diff --git a/package/python-dataclasses/Config.in b/package/python-dataclasses/Config.in
new file mode 100644
index 0000000000..dae4343d8a
--- /dev/null
+++ b/package/python-dataclasses/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_DATACLASSES
+	bool "python-dataclasses"
+	help
+	  A backport of the dataclasses module for Python 3.6.
+
+	  https://github.com/ericvsmith/dataclasses
diff --git a/package/python-dataclasses/python-dataclasses.hash b/package/python-dataclasses/python-dataclasses.hash
new file mode 100644
index 0000000000..2228cb5d39
--- /dev/null
+++ b/package/python-dataclasses/python-dataclasses.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dataclasses/json
+md5  c9a52e322ada1406bfde9ebe3cdbbcca  dataclasses-0.8.tar.gz
+sha256  8479067f342acf957dc82ec415d355ab5edb7e7646b90dc6e2fd1d96ad084c97  dataclasses-0.8.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-dataclasses/python-dataclasses.mk b/package/python-dataclasses/python-dataclasses.mk
new file mode 100644
index 0000000000..a12bab2a0d
--- /dev/null
+++ b/package/python-dataclasses/python-dataclasses.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-dataclasses
+#
+################################################################################
+
+PYTHON_DATACLASSES_VERSION = 0.8
+PYTHON_DATACLASSES_SOURCE = dataclasses-$(PYTHON_DATACLASSES_VERSION).tar.gz
+PYTHON_DATACLASSES_SITE = https://files.pythonhosted.org/packages/1f/12/7919c5d8b9c497f9180db15ea8ead6499812ea8264a6ae18766d93c59fe5
+PYTHON_DATACLASSES_SETUP_TYPE = setuptools
+PYTHON_DATACLASSES_LICENSE = Apache-2.0
+PYTHON_DATACLASSES_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
