Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E812ECD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 20:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B67C640639;
	Fri, 12 Jun 2026 20:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uN7IDfA2ap5R; Fri, 12 Jun 2026 20:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0C06407D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781297484;
	bh=kH/8H594NJGXImMzBf1vHjvd30fG8bSQvNh3wSTdWUI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PkTXPWxBd1C95w+a3wItB4QeWQL/LY/9WywiMSYtvDYk/2wBxC92IL7OLQGfJ7WlR
	 vT4an7CG/ouZhyxnUTKjlWooo1VdfVIPxywDX9VkoQZ9cz8RA7BHbVt+L1RSrVX1+7
	 SGzUx1VrBVk8pbPpFS/ts7LlAcHr++GMTo3bbLNwhUt72RiDJvPcm/lG/501W3mnhx
	 gj0IhBwo4A4jjH1ywcSlpCzrUKwKQoonyAZK3yFZ+nsl7/nF2WEMdNT+V1Fe4zLsxY
	 G9Nc63v/zMuXJ8pv7C7my/o853EUHWbytdNZh0CFp0OydYwBhjWhLW8tIOcm7CfmXa
	 KqgeQusQHqmLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0C06407D9;
	Fri, 12 Jun 2026 20:51:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9D51237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D02978415B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tv5Rjcd-UPKN for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 20:51:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93220816EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93220816EE
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93220816EE
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 20:51:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-45fd464d51fso797058f8f.3
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 13:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781297478; x=1781902278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tubF09QNdM4p6UTnMavuBC6iv/yXggglpOm33aeUj98=;
 b=QjdU1/AVNfQDG0cX4KE9Q7wsK5cBUleM5qRSPRRNjnEk0vlDqM6X14PLwrv2xzWNKy
 5UJofBb1MYdEGC6epsd5q15f1hH4I+NrxFd4ArshVg6F3ZeNNNJUM5lhDCIEoioxOBFM
 zDadETp5pFqY8YxP/+FlGRjOG8TU/NxIPs0FmTNuBpRXhjzeqDqkw0g4V18Tr19KKGIK
 Yv8DqlmBcf2Xx++yWrNmaD9LgVerMA40GWZblgrCoHeCpirkL2r6Q5CDKFy/6vMiTwn7
 GPFtQiOnDsvOlF67pq3WW6cpmMPsjBiQoCEL7qzsxZ68O7FN8sURCmdewAcbpD3sQR0k
 qdyQ==
X-Gm-Message-State: AOJu0Yxsr/4WBI9YNP1K0q++f5sMVfNP8j4cELPewSxDe+/Z3mW/dWj3
 PdryKJGypwEEgfKaavkzVioC9gl/FpfSaHtSj8iqPz+G1RAfrQTTCwk3H5CQkpnWt9BlUQBLNis
 Q22WLkA==
X-Gm-Gg: Acq92OEn7loyXmdR74VfaXhv0n/ZT/xIjrEs7RCxVHGhgUduYW2gDedD304sS9eb9Ag
 +hBzHQAjxoAgaEOY/576HU5Q1oIkMkhbpxZtS6K4FTWbGbR6qw8FqAhEZrceBm5+UyCZ7+bcQN8
 55327GBa+o1KAcn6w2TksTa1sqlaHs29gxvHGrBMdbHLJOrC8QB3oE1Z4LWJLTTCb8tLRp3QQvK
 Y/K/kb9HnsI4FDAWYPDdNfYPJspwlMyu74+8IcOXyIR6FhxujHWgov2R7cLCaSYA0Qj0+uYDMOM
 L1SqPLl293EZJ8cJvP+spYvb56jLvYAKBtrMG7gW5yMJi1G00AI6gb2wxpVMbYRdUti8677pbEF
 xrGzqtgupo53aRMFzJyRORXnk9HF9I2u6TkwMTQ7ORqWvYJ8LBaaJMmg7uib5Hcjaqy4Wnx7mIo
 eDnGFmPK5rJkLUkhvFAfIY8/du3Gtv6ZVpmktsHecaHiNX9iHChQ==
X-Received: by 2002:a05:6000:1842:b0:45e:e5d1:8a72 with SMTP id
 ffacd0b85a97d-46076a24946mr894435f8f.28.1781297477420; 
 Fri, 12 Jun 2026 13:51:17 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26434dsm9353447f8f.1.2026.06.12.13.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 13:51:17 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Fri, 12 Jun 2026 22:50:27 +0200
Message-ID: <20260612205029.269642-9-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612205029.269642-1-francois.perrad@gadz.org>
References: <20260612205029.269642-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1781297478; x=1781902278; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tubF09QNdM4p6UTnMavuBC6iv/yXggglpOm33aeUj98=;
 b=NykPbc723JQNCqQHnEeDH/Npw059ZAlThjQXKftkpap/9yKTHt3hUV/qVvcDV+Vao7
 a3crIDzuyDL0K+SLnUDysVuC7+tfWMHPlDB9YHfKaXFeHMA/r5NlIrI/INtQ83lOsmKl
 UomI3rxHPFDqtkbWWSknP85IwGSKPH7hJpbwWOER7CJQCxNd2xD3HGTtC23FGQVVcVZj
 XUrduq70KHDdwgLHNDJeIdK2grvMajjNMZX9kzNA62KPsfEQou9cO0+Eb7rd2KAFbbP9
 B6uSFHwIg72DN33EmllQ1krPx5/OV1IYnHkgOSC/K6r1dmW6edYJHEtBlRVLwrWX0gSw
 K9kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=NykPbc72
Subject: [Buildroot] [RFC PATCH 8/9] package/hare-dbus: new package
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                         |  1 +
 package/hare-dbus/0001-fix-Makefile.patch | 26 +++++++++++++++++++++++
 package/hare-dbus/Config.in               | 10 +++++++++
 package/hare-dbus/hare-dbus.hash          |  3 +++
 package/hare-dbus/hare-dbus.mk            | 15 +++++++++++++
 5 files changed, 55 insertions(+)
 create mode 100644 package/hare-dbus/0001-fix-Makefile.patch
 create mode 100644 package/hare-dbus/Config.in
 create mode 100644 package/hare-dbus/hare-dbus.hash
 create mode 100644 package/hare-dbus/hare-dbus.mk

diff --git a/package/Config.in b/package/Config.in
index 1d0dac96c..aa8818ce7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -511,6 +511,7 @@ endmenu
 	source "package/gpsd/Config.in"
 	source "package/gptfdisk/Config.in"
 	source "package/gvfs/Config.in"
+	source "package/hare-dbus/Config.in"
 	source "package/hddtemp/Config.in"
 	source "package/hdparm/Config.in"
 	source "package/hwdata/Config.in"
diff --git a/package/hare-dbus/0001-fix-Makefile.patch b/package/hare-dbus/0001-fix-Makefile.patch
new file mode 100644
index 000000000..1250d89b0
--- /dev/null
+++ b/package/hare-dbus/0001-fix-Makefile.patch
@@ -0,0 +1,26 @@
+From 93abfa5970937253ae73bc8bcd9e243d890484a9 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Fri, 15 May 2026 11:56:39 +0200
+Subject: [PATCH] fix Makefile
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index a738e6a..8c4fe78 100644
+--- a/Makefile
++++ b/Makefile
+@@ -18,7 +18,7 @@ dbus-introspector:
+ dbus-scanner:
+ 	$(HARE) build $(HAREFLAGS) cmd/dbus-scanner/
+ 
+-install: build
++install:
+ 	install -Dm755 dbus-introspector	${DESTDIR}${BINDIR}/dbus-introspector
+ 	install -Dm755 dbus-scanner		${DESTDIR}${BINDIR}/dbus-scanner
+ 	install -Dm644 dbus/protocol/*.ha -t	$(DESTDIR)$(THIRDPARTYDIR)/dbus/protocol
+-- 
+2.43.0
+
diff --git a/package/hare-dbus/Config.in b/package/hare-dbus/Config.in
new file mode 100644
index 000000000..63f332cbf
--- /dev/null
+++ b/package/hare-dbus/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HARE_DBUS
+	bool "hare-dbus"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_HARE
+	select BR2_PACKAGE_HARE_EV
+	select BR2_PACKAGE_HARE_XML
+	help
+	  D-Bus client implementation for Hare.
+
+	  https://git.sr.ht/~whynothugo/hare-dbus
diff --git a/package/hare-dbus/hare-dbus.hash b/package/hare-dbus/hare-dbus.hash
new file mode 100644
index 000000000..e8abc40e4
--- /dev/null
+++ b/package/hare-dbus/hare-dbus.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  67a3041126f7745e667d570904504a58475ca398acdd679b548d9e0e513092f8  hare-dbus-e9a89f8bc5ce783fa25f0eb67d7d8932db90bcc2-git4.tar.gz
+sha256  7c77ea8fa77851b9ee52d715ec6a3c5f15604bdab5148dd13dbd1dd345752017  LICENCE
diff --git a/package/hare-dbus/hare-dbus.mk b/package/hare-dbus/hare-dbus.mk
new file mode 100644
index 000000000..93d2a688f
--- /dev/null
+++ b/package/hare-dbus/hare-dbus.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# hare-dbus
+#
+################################################################################
+
+HARE_DBUS_VERSION = e9a89f8bc5ce783fa25f0eb67d7d8932db90bcc2
+HARE_DBUS_SITE_METHOD = git
+HARE_DBUS_SITE = https://git.sr.ht/~whynothugo/hare-dbus
+HARE_DBUS_LICENSE = MIT
+HARE_DBUS_LICENSE_FILES = LICENCE
+HARE_DBUS_INSTALL_STAGING = YES
+HARE_DBUS_DEPENDENCIES = hare-ev hare-xml
+
+$(eval $(hare-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
