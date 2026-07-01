Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C214FC43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 12:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DE8E83AAC;
	Wed,  1 Jul 2026 12:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhVNy6UPc86a; Wed,  1 Jul 2026 12:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A10A583AB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782908393;
	bh=wSp4ptoYhbNmp3DevrvR3Hj12VGter10SOh94jMDiyo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BLKJZdJP6ezBv/6obqo6MVxO0mpjYwL6iQUU8VXBHa3Kcta4mvcxyOM6FRwC6yNFd
	 PpODN0fltmaP/uHkr0DpzjJ1x1BEwpTsIMySOZN7R3NXEx747nUII6zLWOZgcd/U0l
	 8z/yG8HfKngUIJvXZc7cnnAQpTVk24YWw4Y5+nfCHXZGbB4J18m14kjl1VJtv1l2lM
	 qBbygcPeUD//ajQtR28Jeo4zEkvJPsIoxLsgInP6QLZ0NcsxZ7NzonlRbVAn0O01q6
	 ZDHyIQvGxQpBAmj869u+paFR6Nk6aq++UWB83PcxTzZoJrQIIkKLBhzSNT69SZkJMs
	 ETiwqRJW/zydQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A10A583AB8;
	Wed,  1 Jul 2026 12:19:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C3D22D5
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E14540EC9
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l60Dq_XSIDik for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 12:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=nunes.philippe@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D58AD40207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D58AD40207
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D58AD40207
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:19:51 +0000 (UTC)
Received: from pnunes-ThinkPad.proxad.net (unknown
 [IPv6:2a01:e0a:ad7:ca0:5e8f:f9af:2d01:45e3])
 (Authenticated sender: nunes.philippe@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C5D0B2003DA;
 Wed,  1 Jul 2026 14:19:47 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Philippe Nunes <nunes.philippe@free.fr>
Date: Wed,  1 Jul 2026 14:19:35 +0200
Message-ID: <20260701121937.346945-2-nunes.philippe@free.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121937.346945-1-nunes.philippe@free.fr>
References: <20260701121937.346945-1-nunes.philippe@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1782908389;
 bh=9S1UGXMXERePswBTBP3+nQi0UcAKM5L+hXSlBx1RB5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uBurdhIg1wqeC+1Cpwx4+8Wu8g7PwHIABmqU9XI9Xbgbk1esC06BNo82BCcz/GXlx
 qzDahyzdw5pRLOHktXES5GQxujo73n2GtiUPkrmrMQW+M3Qo+WgDtye7FRjTIKT+LB
 rBbGG/fXK3NzolqOPx9VIEBvnJDXcTITxHb5a7txekoKeOl2IefrpEqBVUs4TUcjkd
 RCigu707+V8G3xNv28NQ/6d6fAMjXTzjyNXTheI9aq3aBPGPmT5kjGRvj+xIRRVbnS
 WTVIsfoScgeQXMho11NK5I1TpbYp/4egAod8yIfi3Z8q2guvNpHMCu0Zf4LQkd+ZR8
 ZHFVsaelnvpcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uBurdhIg
Subject: [Buildroot] [PATCH 1/3] package/mcpp: new package
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
From: Philippe Nunes via buildroot <buildroot@buildroot.org>
Reply-To: Philippe Nunes <nunes.philippe@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mcpp (Matsui CPP) is a portable C/C++ preprocessor, implemented as
both a CLI and a reusable library (libmcpp). It is conformant to
ISO/ANSI C90, C99 and C++98 standards and validated against the
official preprocessor test suite.

This Buildroot package builds a host-only flavour of mcpp with
--enable-mcpplib, so that libmcpp.{a,so} and the public header
mcpp_lib.h are available for other host packages to embed
preprocessor functionality in-process (i.e. without forking a
real cpp binary). The standalone mcpp(1) CLI is installed as
well.

Upstream: https://mcpp.sourceforge.net/

Signed-off-by: Philippe Nunes <nunes.philippe@free.fr>
---
 DEVELOPERS                  |  3 +++
 package/Config.in.host      |  1 +
 package/mcpp/Config.in.host |  9 +++++++++
 package/mcpp/mcpp.hash      |  5 +++++
 package/mcpp/mcpp.mk        | 18 ++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/mcpp/Config.in.host
 create mode 100644 package/mcpp/mcpp.hash
 create mode 100644 package/mcpp/mcpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5a09be9bff..03fe739986 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2725,6 +2725,9 @@ F:	package/adsp-ldr/
 N:	Philipp Richter <richterphilipp.pops@gmail.com>
 F:	package/libtorrent-rasterbar/
 
+N:	Philippe Nunes <nunes.philippe@free.fr>
+F:	package/mcpp/
+
 N:	Philippe Proulx <eeppeliteloop@gmail.com>
 F:	package/babeltrace2/
 F:	package/lttng-babeltrace/
diff --git a/package/Config.in.host b/package/Config.in.host
index df57cc0c17..50798d142b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -65,6 +65,7 @@ menu "Host utilities"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/lzma-alone/Config.in.host"
+	source "package/mcpp/Config.in.host"
 	source "package/mender-artifact/Config.in.host"
 	source "package/meson-tools/Config.in.host"
 	source "package/mfgtools/Config.in.host"
diff --git a/package/mcpp/Config.in.host b/package/mcpp/Config.in.host
new file mode 100644
index 0000000000..b5fb6e30c4
--- /dev/null
+++ b/package/mcpp/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_MCPP
+	bool "host mcpp"
+	help
+	  A portable C/C++ preprocessor, implemented as both a library
+	  (libmcpp) and a stand-alone command-line tool. Designed to be
+	  embedded by other tools that need in-process C-preprocessor
+	  expansion without forking gcc -E.
+
+	  http://mcpp.sourceforge.net/
diff --git a/package/mcpp/mcpp.hash b/package/mcpp/mcpp.hash
new file mode 100644
index 0000000000..b61627fb04
--- /dev/null
+++ b/package/mcpp/mcpp.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  3b9b4421888519876c4fc68ade324a3bbd81ceeb7092ecdbbc2055099fcb8864  mcpp-2.7.2.tar.gz
+
+# Locally calculated
+sha256  adcd59c07ccdb072c8e1d40adb5cac670fcf3f51ba3a7fb41d46362bfd883b1b  LICENSE
diff --git a/package/mcpp/mcpp.mk b/package/mcpp/mcpp.mk
new file mode 100644
index 0000000000..18cf99bc66
--- /dev/null
+++ b/package/mcpp/mcpp.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# mcpp
+#
+################################################################################
+
+MCPP_VERSION = 2.7.2
+MCPP_SITE = https://downloads.sourceforge.net/project/mcpp/mcpp/V.$(MCPP_VERSION)
+
+MCPP_LICENSE = BSD-2-Clause
+MCPP_LICENSE_FILES = LICENSE
+
+# --enable-mcpplib builds libmcpp.{a,so} alongside the mcpp CLI. The
+# library is what most consumers embed (libqoriq-rcw, etc.); without
+# this flag only the standalone CLI is built.
+HOST_MCPP_CONF_OPTS = --enable-mcpplib
+
+$(eval $(host-autotools-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
