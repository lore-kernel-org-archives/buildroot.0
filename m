Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7876C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 14:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82E9582FBE;
	Fri, 27 Jan 2023 14:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82E9582FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eBnH9q5mA0H7; Fri, 27 Jan 2023 14:12:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCB3982F4A;
	Fri, 27 Jan 2023 14:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCB3982F4A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B732B1BF39E
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92522408A5
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92522408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TD4hUxraA4Rd for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 14:11:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D3AA40A71
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D3AA40A71
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 14:11:05 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id y69so1950617iof.3
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 06:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AsvmJIKbPGU+BGaJFjJLe6oUehN5dmNEJLbP3jKT89I=;
 b=rub4FaXDv/DMHO8GsBZA3VYSg/nkW0ICMdNXog91UGZt8L2eeXdSRPNnGwVnNzoqTw
 zJmEEbZU/YwaZc4Cnilz3LQonIiSM2z/stgQPRIbr+6jHmttNgth8EvuwQQX8jNNZHeo
 A9fDTYjlJLewjQmwkfg05pTOuZeZvnyS64GDyYejHO0X2tECNkCLChXyBEVQcTfHQKDt
 EE4GRGmHf7/l3nUZz/dSUzafQXUL0JRp8GwYUd76qs/7uxDvi2vEDCo/n9+5V53ysOiZ
 nwgragK9RsiLF2hKw5smqVQro0vONzT47Q4COqG48BRMiZLmyflncD85oF74AtxI0W2D
 6I+Q==
X-Gm-Message-State: AO0yUKUFhQAQ1RSvHpw6MKyVXopbdFTLUHalpvDMVzEbnl1WejdTXEve
 xQtukz//d2253T+YZ/dXcvUkK/QH18DLZQ==
X-Google-Smtp-Source: AK7set8e5xA+tyUeIQkFUyAZIB/hrzAk625ZemZwy2f+KG4j592nr74NM7wPRk/8JLoh2qAzX+/EGA==
X-Received: by 2002:a05:6602:483:b0:707:dcd8:2aea with SMTP id
 y3-20020a056602048300b00707dcd82aeamr5772369iov.19.1674828664307; 
 Fri, 27 Jan 2023 06:11:04 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 n2-20020a6bed02000000b006d8b7bcaa6esm1290806iog.4.2023.01.27.06.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 06:11:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 07:10:51 -0700
Message-Id: <20230127141058.2180747-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127141058.2180747-1-james.hilliard1@gmail.com>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AsvmJIKbPGU+BGaJFjJLe6oUehN5dmNEJLbP3jKT89I=;
 b=kqRUywPtElrdBipNqhLOwQRkR4/FzBVSADxK27MG5ohLZGhZCkQr97HYcDu6tE91uA
 k/nzwQfbKMEoPg+j9H3UeFe3UAhrsXcJnwSlSfLIvfPCjZ16MDukWfKCT8ue6FalGAeE
 LXrs/XeuC/9AJ7pc6s+PlPA4Vu3wmpMiRejAOKb9pqAPeJA6hjsLrNm5xzZRJ5lvPUYe
 8WROB5WNOd2G1YKfZYBFhng8JJ3GTupte8SNdLaQhMHtSMWLoxy+8/2eyeLakzHeOMgo
 eEIOE5jji3GnF9dNfxNJJ6DYuJFs8O+ZvwrsYQQH2whkMaqIbLC1eAG20vLcoUvdprxl
 NuJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kqRUywPt
Subject: [Buildroot] [PATCH v4 06/13] package/fxdiv: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/fxdiv/Config.in  |  7 +++++++
 package/fxdiv/fxdiv.hash |  4 ++++
 package/fxdiv/fxdiv.mk   | 17 +++++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/fxdiv/Config.in
 create mode 100644 package/fxdiv/fxdiv.hash
 create mode 100644 package/fxdiv/fxdiv.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a711f9f1ee..b600c2914e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2703,6 +2703,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/fxdiv/
 F:	package/gemmlowp/
 F:	package/neon-2-sse/
 F:	package/ruy/
diff --git a/package/Config.in b/package/Config.in
index 6377ddd2e5..e393760b6a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2007,6 +2007,7 @@ menu "Other"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
 	source "package/flatcc/Config.in"
+	source "package/fxdiv/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gdal/Config.in"
 	source "package/gemmlowp/Config.in"
diff --git a/package/fxdiv/Config.in b/package/fxdiv/Config.in
new file mode 100644
index 0000000000..5aa714e44a
--- /dev/null
+++ b/package/fxdiv/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FXDIV
+	bool "fxdiv"
+	help
+	  Header-only library for division via fixed-point
+	  multiplication by inverse.
+
+	  https://github.com/Maratyszcza/FXdiv
diff --git a/package/fxdiv/fxdiv.hash b/package/fxdiv/fxdiv.hash
new file mode 100644
index 0000000000..2142d84e09
--- /dev/null
+++ b/package/fxdiv/fxdiv.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  ec74d882a0a47cfd9c0f95bc4fae9901a4ade802a96a3b76e02671bb7340a4c5  fxdiv-63058eff77e11aa15bf531df5dd34395ec3017c8.tar.gz
+# License files, locally calculated
+sha256  7cac00006125b1486a27e4801ed66357236e984c540bd323945ab7b66b078ec3  LICENSE
diff --git a/package/fxdiv/fxdiv.mk b/package/fxdiv/fxdiv.mk
new file mode 100644
index 0000000000..56aaf11f88
--- /dev/null
+++ b/package/fxdiv/fxdiv.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# fxdiv
+#
+################################################################################
+
+FXDIV_VERSION = 63058eff77e11aa15bf531df5dd34395ec3017c8
+FXDIV_SITE = $(call github,Maratyszcza,FXdiv,$(FXDIV_VERSION))
+FXDIV_LICENSE = MIT
+FXDIV_LICENSE_FILES = LICENSE
+FXDIV_INSTALL_STAGING = YES
+FXDIV_INSTALL_TARGET = NO
+FXDIV_CONF_OPTS = \
+	-DFXDIV_BUILD_TESTS=OFF \
+	-DFXDIV_BUILD_BENCHMARKS=OFF
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
