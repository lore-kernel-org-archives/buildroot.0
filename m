Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DC8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:01:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D6A60F4B
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64D6A60F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3670F8177A;
	Mon, 11 Oct 2021 21:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRBHk5BO-cMP; Mon, 11 Oct 2021 21:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67E2D817B5;
	Mon, 11 Oct 2021 21:01:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A91FF1BF279
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9859B403BD
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6Wpel5FznS1 for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:01:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E44594024E
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:01:05 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id u69so13843320oie.3
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKiN5vexxoKgGjFnoEqLqluQ1L6on7kq+FUIIUX2Txk=;
 b=OXOaYq4d7Y8W+2TH68jz9VbWB6kIVnfcvFfyb7vyhNRkRMONbk6/iJhCE5X+85kFwr
 LqsbMNhQNywUYd2KXlVtc+hbaEAjfIjx+oBY+g6dtNXyJVZGS/WtU8LbGPXQfMD1rcZV
 XwipIpMzVONZ1Ps0UjYoRnlsbErO4/TgcFt9/L4UL3Ahj09rdqw2WFtvVuJoR2or8pdr
 i3h1HJQbiqqUEh+AlsXzXGugozKR1rxzfxIuBNSWbHc/IADanCwKCfP6JpBUVSFbqkUy
 TvebvPFy2tRXWtefauP+mDe0+nBUkM46cMBwDxKls1xUkzumVO8A7jC19+mtBJtqfqV/
 B9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKiN5vexxoKgGjFnoEqLqluQ1L6on7kq+FUIIUX2Txk=;
 b=kDd3n0rL4er8MeTlaoCqMSt5UkGWsOHOAEZ4yjjw664+HRJwXnGzPwnmuBxDNGrs2o
 Zg3tNb+wiaRGvKF0Myl6oxulLN6WeafgFYrx5i/UpZ9t7RwAiQSskrLlyusNxjXXbGA2
 ZDdfEAmLLv0UTCgR9Ub+4MnFsGqmIDSdxj4YPDAQ1+IcwtZOA8Z0bjEbSW5Yx/DUbuV9
 kQqjXTwYFYDWBJn4wQpdPS25pJg/nMx4WiLSLKKirxUAGLoPlloCRJOpa3yzfhC/5yvx
 GA+G0adYGvglqjNds8P/Hqnjcvsu/oLJDz60obIYJKfZd3Bq+GIZLt1y3VLjCjqM8/zr
 2N/Q==
X-Gm-Message-State: AOAM533bMLbXgIEeg1/HEQCRnQtvEO3XhR1CrLRHvWxETaDMpC0khapi
 C1QMgwxEClAErZYmDtTtL153P6hJLt35sgZ9
X-Google-Smtp-Source: ABdhPJyqsZ6YPoiaedvuZ9x80mwJmvnOzBpeK6iY1+9Nr2jkgBeDOFCm9FpPAhU8w5/FK+inMQG2Kw==
X-Received: by 2002:aca:6246:: with SMTP id w67mr957354oib.44.1633986064580;
 Mon, 11 Oct 2021 14:01:04 -0700 (PDT)
Received: from localhost ([189.174.209.191])
 by smtp.gmail.com with UTF8SMTPSA id k8sm499783otp.6.2021.10.11.14.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:01:04 -0700 (PDT)
From: Gleb Mazovetskiy <glex.spb@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 22:00:44 +0100
Message-Id: <20211011210045.395407-1-glex.spb@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211010170906.388594-1-glex.spb@gmail.com>
References: <20211010170906.388594-1-glex.spb@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package: add smpq and stormlib
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SMPQ is a utility for working with Blizzard MPQ archives and StormLib is
the library for doing this that it depends on.

SMPQ/StormLib is a runtime and/or build-time dependency of several
source ports / reimplementations of Blizzard games, such as DevilutionX.

These packages are already available in other distros, such as Debian.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>

---
Changes v1 -> v2 (Sugested by Yann E. MORIN):

  - Converted sed substitutions to patch files.
  - Re-ordered mk variables per the suggested ordered.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/Config.in              |  2 ++
 package/smpq/Config.in         | 11 +++++++++++
 package/smpq/smpq.hash         |  3 +++
 package/smpq/smpq.mk           | 19 +++++++++++++++++++
 package/stormlib/Config.in     |  8 ++++++++
 package/stormlib/stormlib.hash |  3 +++
 package/stormlib/stormlib.mk   | 16 ++++++++++++++++
 7 files changed, 62 insertions(+)
 create mode 100644 package/smpq/Config.in
 create mode 100644 package/smpq/smpq.hash
 create mode 100644 package/smpq/smpq.mk
 create mode 100644 package/stormlib/Config.in
 create mode 100644 package/stormlib/stormlib.hash
 create mode 100644 package/stormlib/stormlib.mk

diff --git a/package/Config.in b/package/Config.in
index 9fed0ab4cb..890a6be135 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -74,6 +74,7 @@ menu "Compressors and decompressors"
 	source "package/p7zip/Config.in"
 	source "package/pigz/Config.in"
 	source "package/pixz/Config.in"
+	source "package/smpq/Config.in"
 	source "package/unrar/Config.in"
 	source "package/unzip/Config.in"
 	source "package/xz/Config.in"
@@ -1360,6 +1361,7 @@ menu "Compression and decompression"
 	source "package/lzo/Config.in"
 	source "package/minizip/Config.in"
 	source "package/snappy/Config.in"
+	source "package/stormlib/Config.in"
 	source "package/szip/Config.in"
 	source "package/zlib/Config.in"
 	source "package/zziplib/Config.in"
diff --git a/package/smpq/Config.in b/package/smpq/Config.in
new file mode 100644
index 0000000000..589f5cf834
--- /dev/null
+++ b/package/smpq/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SMPQ
+	bool "smpq"
+	select BR2_PACKAGE_SMPQ
+	help
+	  StormLib MPQ archiving utility
+
+	  This utility manipulates Blizzard MPQ archives.
+	  It supports extracting, appending, renaming and deleting files
+	  in MPQ archives, and creating new MPQ archives.
+
+	  https://launchpad.net/smpq
diff --git a/package/smpq/smpq.hash b/package/smpq/smpq.hash
new file mode 100644
index 0000000000..f14eaef49b
--- /dev/null
+++ b/package/smpq/smpq.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b5d2dc8a5de8629b71ee5d3612b6e84d88418b86c5cd39ba315e9eb0462f18cb  smpq_1.6.orig.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/smpq/smpq.mk b/package/smpq/smpq.mk
new file mode 100644
index 0000000000..34f87f7f45
--- /dev/null
+++ b/package/smpq/smpq.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# smpq
+#
+################################################################################
+
+SMPQ_VERSION = 1.6
+SMPQ_SOURCE = smpq_$(SMPQ_VERSION).orig.tar.gz
+SMPQ_SITE = https://launchpad.net/smpq/trunk/$(SMPQ_VERSION)/+download
+SMPQ_LICENSE = GPL-3.0+
+SMPQ_LICENSE_FILES = LICENSE
+SMPQ_DEPENDENCIES = stormlib
+HOST_SMPQ_DEPENDENCIES = host-stormlib
+SMPQ_CONF_OPTS += -DWITH_KDE=OFF
+HOST_SMPQ_CONF_OPTS += -DWITH_KDE=OFF
+SMPQ_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
diff --git a/package/stormlib/Config.in b/package/stormlib/Config.in
new file mode 100644
index 0000000000..b2e4df3c62
--- /dev/null
+++ b/package/stormlib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_STORMLIB
+	bool "stormlib"
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_ZLIB
+	help
+	  StormLib is a library that reads and writes Blizzard MPQ archives.
+
+	  https://github.com/ladislav-zezula/StormLib
diff --git a/package/stormlib/stormlib.hash b/package/stormlib/stormlib.hash
new file mode 100644
index 0000000000..dc5370b03d
--- /dev/null
+++ b/package/stormlib/stormlib.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  53b8befda3855a922e57a27f78c36feba7e9a32804da4b6592a3670c4e9cec98  stormlib-5ab093b7a57b8779dff06a08fac19d46c40b3329.tar.gz
+sha256  50b128e6750ed9d887e7a5748a6021238bb2f3bf34a5dd2768c410d932069e35  LICENSE
diff --git a/package/stormlib/stormlib.mk b/package/stormlib/stormlib.mk
new file mode 100644
index 0000000000..f2f7522002
--- /dev/null
+++ b/package/stormlib/stormlib.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# stormlib
+#
+################################################################################
+
+STORMLIB_VERSION = 5ab093b7a57b8779dff06a08fac19d46c40b3329
+STORMLIB_SITE = $(call github,ladislav-zezula,StormLib,$(STORMLIB_VERSION))
+STORMLIB_LICENSE = MIT
+STORMLIB_LICENSE_FILES = LICENSE
+STORMLIB_DEPENDENCIES = zlib bzip2
+HOST_STORMLIB_DEPENDENCIES = host-zlib host-bzip2
+STORMLIB_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
