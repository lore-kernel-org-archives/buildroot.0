Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62834C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 23:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D54CB40B24;
	Sat, 23 Jul 2022 23:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D54CB40B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sp5Su4DhMG3B; Sat, 23 Jul 2022 23:04:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC23140B1D;
	Sat, 23 Jul 2022 23:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC23140B1D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E41E11BF3AD
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 23:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1C5341876
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 23:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1C5341876
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFrfk-mIJnTh for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 23:04:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CABD41847
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CABD41847
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 23:04:11 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id y197so5308842iof.12
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YsSvtBYnNn5uHwufBDIeKUULND9E709Ufr96FmMaBZM=;
 b=73v1rSu6ROs4D369qSo7EwB4aMRwqt8PSBm8pDIq/djEpOBK407niQyaEkIlhI+7E4
 zcZqzVj/gNDNJ6s5XKh+nggXEc9eaQVA0yhBUBbgX8haNuUcYkSvx6eSeMBXdXhgxNDd
 o54VUGIuNGSn7ILik6O1ctPEVq1c5J0XMzXxI5ffwyP1262k17AI/e3HvOzYv/DwtK/E
 JtYXSWu5jO6dpiC+CB1me0jVWYY7afXlMDPNSaMejdG8jS0q3Nejdlr9k9Y1HztiiNbz
 OWT0JurUh3SLXU8dardv4sknbgXjdwetFY3CCcYk68n9jUDIihyvoti7b/e2X/hXwmfg
 H3wA==
X-Gm-Message-State: AJIora9uWlmWgyA6giR5P86lgn7SngXlqJX+9foffznAmHpD4g/eXkDI
 wi0oXBsYVGXhMztCvcGWBrcALmXzsqh3vw==
X-Google-Smtp-Source: AGRyM1t/Br+DJ0okV9EoUsLrdzc/CFU4E5ZQ0T4ADNRb6wtNaS7V9sQZWuWyIcAaQpgyf1/eizoqbw==
X-Received: by 2002:a05:6602:13d5:b0:67c:9149:fe0f with SMTP id
 o21-20020a05660213d500b0067c9149fe0fmr705948iov.114.1658617450237; 
 Sat, 23 Jul 2022 16:04:10 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 f10-20020a056602088a00b0067c05df65aasm3993257ioz.15.2022.07.23.16.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 16:04:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:03:59 -0600
Message-Id: <20220723230400.362946-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YsSvtBYnNn5uHwufBDIeKUULND9E709Ufr96FmMaBZM=;
 b=d/O6RJv7HnzbDpyghOZwiFn2yFwhCsfncnCaaWkkcGLlHZk0meU8K+nEGS8gY/JACv
 8gbkgbXgBoNO6/8Cjo7Q4XKPyoBd6mRTUYiws8dP/a/AsNUCtwHYRPIHS9f4gd78Mrea
 Sf+DeZnW3cO6oayH6iznu3YK9bt+q61y19n+1U0Nz38ax5yNwuipCJizNWJQ/8nNkPuJ
 YKue3N2Fd+Q5IqPD2v/3tOkG5VKCeZ0lxlWakNc/6x9jaedx+WX888sUcgrw/KzFY+bw
 E41nBXWopDB74i6xBy8JdEFj43f6xtIbu16Er+Tph5xvFFGBbR8zY6elM3+M4j6mKgFk
 eeEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d/O6RJv7
Subject: [Buildroot] [PATCH v4 1/2] package/python-maturin: new package
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
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is pep517 pyo3 build backend that's an alternative to
python-setuptools-rust.

Note that maturin itself uses python-setuptools-rust for
bootstrapping.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Graeme Smecher <gsmecher@threespeedlogic.com>
---
Changes v3 -> v4:
  - update to 0.12.20
Changes v2 -> v3:
  - update to 0.12.16
  - migrate to new python-setuptools-rust based bootstrapping
Changes v1 -> v2:
  - update patch comment to backport as it is merged upstream
---
 package/python-maturin/python-maturin.hash |  5 +++++
 package/python-maturin/python-maturin.mk   | 25 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 package/python-maturin/python-maturin.hash
 create mode 100644 package/python-maturin/python-maturin.mk

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
new file mode 100644
index 0000000000..383dbf8737
--- /dev/null
+++ b/package/python-maturin/python-maturin.hash
@@ -0,0 +1,5 @@
+# Locally calculated after vendoring
+sha256  4ea4f6b02cabffc8b56c488956ad572abfabdce935128007dff48a6e95b553d2  maturin-0.12.20.tar.gz
+# Locally computed sha256 checksums
+sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
+sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
new file mode 100644
index 0000000000..3d5ba70391
--- /dev/null
+++ b/package/python-maturin/python-maturin.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# python-maturin
+#
+################################################################################
+
+PYTHON_MATURIN_VERSION = 0.12.20
+PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/39/ba/fec598956393230341def42367c6ad0efbee6ddc899f8858e5b25a7f37a5
+PYTHON_MATURIN_SETUP_TYPE = setuptools
+PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
+PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
+HOST_PYTHON_MATURIN_DEPENDENCIES = \
+	host-python-setuptools-rust \
+	host-python-tomli \
+	host-rustc
+HOST_PYTHON_MATURIN_ENV = \
+	$(HOST_PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+# We need to vendor the Cargo crates at download time
+PYTHON_MATURIN_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_MATURIN_DOWNLOAD_DEPENDENCIES = host-rustc
+HOST_PYTHON_MATURIN_DL_ENV = $(HOST_PKG_CARGO_ENV)
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
