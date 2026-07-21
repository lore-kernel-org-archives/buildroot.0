Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C7DC4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 09:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C278C408AA;
	Tue, 21 Jul 2026 09:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fB2NhekNULcE; Tue, 21 Jul 2026 09:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC1A2408BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784626799;
	bh=20dYESnqk3G+kbKeVe3ySM/+yh5Xlz54ZbJ0FuPObaU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QGSc0Qls+9JdP68FbY2YJ5WmbdPPEbnUfZG86SZ77cdpTcegLRyRx1iVjF1LGkP1c
	 nEqMVfZx+IlpMaH1DPLbCjqhnTivPQJyI+HNRYowlc1kvZJaDHaURVf1atnfXTb34S
	 OuJ6ohDQ4x+t6s3oBCJpOl+VD+1Bc3gJWj4KgGzndPHQT/Ef7YEcoZAD+b00AIQ7aX
	 2riDC6X+UGwMH+ZfrORZRxA7xzhbSb/hUm1Y0L6BlHy32q3ankYanoD+svTRstWajY
	 Nc+Qa9Rcc13UHtVBphjbGPj/Cw/K/DAS0Xe2bMjGDM/OEY6/q6dKanlonODo3RBIc+
	 Q49YQ/3C5umVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC1A2408BA;
	Tue, 21 Jul 2026 09:39:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 228D042A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 202D880C0C
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJ81k8I3teTI for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 09:39:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1601780B5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1601780B5C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1601780B5C
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 09:39:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49547fc63a0so19599425e9.2
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 02:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784626787; x=1785231587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4dcxNce8frXxN03IHeHWStt/SLEcdsZe663W5n1i9/4=;
 b=QYEsqp/20LW0fdxyHFxYKVF6ju9FQhcg4c8CfWGZhTL8wnDwms6BEamI66exxAe/pW
 IIH81J1wQ0IM1xZ3qscgOYj0CHEePEh+rRXENudEYvp6o6rP2GkqZ5hA7TLKDREq9xc8
 LCCYZPFaWEzVk8gmCkOReOqU1Lu/aEIxE7fBEvdoMfBuOtKi6R6Ua34UXGiXgNU7txK0
 1cu1lNK2JEEN/hgPpROS7flHK1K5kMC3P6Gk7v8bO2lymsID9ub2XVRtSHhkRf2rROxr
 CQqGlhkopvhqlOQSZNqvf/5aR9eJkcR+qz6RRWmU1BY3wrGDLAREb8QEDumf+M5jWaAJ
 DmkQ==
X-Gm-Message-State: AOJu0YwUb1LpSYMIPuguLRuDc2nRIhqfWsyo2CXA1U222cr9gpdqxUZB
 d2zSCB6TXSq5UY7+RcAXMXjVgLyYMInSGS5NJvbuv6QUPOcaEgefNNgVl+KTBA==
X-Gm-Gg: AfdE7ckGWUMth2TVZrrgrAHh/cKUyHAYDOomRSnVVcZdr/7Gh7XPWjSGlZZ1r0rE4FI
 8oEN6N/VlrcEhrkmjYVWQcLpHrAsDDDKIXvSpxY9t6dDIs9dFna9o6KaM29LZj+F6mlCRa+/88v
 J7gP8hOxy5uDngUNF9Ixgf0/aGt7FY6RSRXVpNRiDHuV/tjRud7M9VZm5H3Xc9T9vxDRgYstbHc
 5Ac5odnk+12Ga0n6pB7Pf8iIk1SO+4eD4QV131zyUSS3A7eN55Jw5pEoh+aG5Q0mrFjD8zltGd2
 gBQSSn4UHRvi2Uxmet7MXGs/PvK+yVUkiBkhk3OngpKPS4cmMC1qlt0yClazBg6ds08eIJQaJYG
 8J+Otd0LG2l1w7VqoSG8oKksiFNAMwo3herQoJqDprc9OWoslxF/gBiBr8qiIUMa1oJdXWT9ZTn
 RUeA8IstUQv2pL4i0RGyOlc6ewAMRAMRhOQg==
X-Received: by 2002:a05:600c:190b:b0:493:c77c:108a with SMTP id
 5b1f17b1804b1-4954aa1a10amr189072075e9.36.1784626786925; 
 Tue, 21 Jul 2026 02:39:46 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956546db7bsm56227655e9.3.2026.07.21.02.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 02:39:46 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 21 Jul 2026 11:39:32 +0200
Message-ID: <20260721093932.282565-9-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721093932.282565-1-francois.perrad.86@gmail.com>
References: <20260721093932.282565-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784626787; x=1785231587; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4dcxNce8frXxN03IHeHWStt/SLEcdsZe663W5n1i9/4=;
 b=CFPP2PoPz0A5kHdM0yxKL4mq4TaKRSIUiT5QgXcyZH9tXcbQ7Rv2kgarAquuGp3ypd
 +b3Oea2IoxYmZhWfr/7ecRc3VBiE1iPXr5GuHhQyUhnNEoIZwGC8kl94eNzg1EBvncUt
 oBpkBy1PsDF5HicVZppwIkesQg5TGKnQ+pX2UZtGQ2SV8y6Lp/8T6fYmXE4X3/SthoHW
 b0h7g3pF2ew8lXDscwQG9xt6HnWQpCFLEiuoESyx0yCN1MX+Z+RM4EjxYoDEZyWSmaHr
 fwXfKlMQH1n6WuIjHsFcjghZUdqQIWwSHgfArf4RDfrEWEExiwnQzqM/UTnx2d4ml1g3
 /OnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=CFPP2PoP
Subject: [Buildroot] [PATCH v3 8/8] package/hare-dbus: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
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
