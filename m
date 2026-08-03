Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6D1C55184
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 07:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AC0B60712;
	Mon,  3 Aug 2026 07:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odD3teX0oVzI; Mon,  3 Aug 2026 07:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A50560725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785740405;
	bh=Jl1dJ/sif+koeUQ+ke28LUsp+wErPVM4GQCvOHbv6rI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YDLC3rhzvd7PwsgFtg57OcD3YnlPyBkxpl+uBNph2jOuRcRV7HwVvEdAvULBfp93K
	 S8WTczvydm+jqyik725+8u5PnkP2iqyTqiqb0C6WFAA4LFLGpBVHjqbkWOUoZLsPcv
	 McHwvJyYUVhwotdVyfGFVVcs0/f6hmprhcV1OWRmi2HreJXCpuosphMtQ9xnTebDyt
	 FF7g0scUqksYyKWurFh5vkcz8MfFrp2tGvCiivQJcJ9xDLWl+hOkTTQOcJVf1DpTFV
	 IfbvIp1XowbC4uX/aGHeiHk7gfTcXxxoiKkWBBcyajJO8zYQqlBhsqkJtOPyNxYTsQ
	 LWCGpMCnkr+Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A50560725;
	Mon,  3 Aug 2026 07:00:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E788026C
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9D1C80C98
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ezuDhaZCV_J for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 06:59:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AEA0480C9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEA0480C9A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEA0480C9A
 for <buildroot@busybox.net>; Mon,  3 Aug 2026 06:59:56 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so17338565e9.2
 for <buildroot@busybox.net>; Sun, 02 Aug 2026 23:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785740395; x=1786345195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OcEbrham67O+YdzdaE8IiWMUcM+0oaHBrLCcKdqBgqo=;
 b=jWH0aqSg17hHv5IFuASLY0OBXiWK4quc3e/p4PqEiJEAyyomGKLFjj7zjtnI2vz8Xp
 5MW5kXMFIuXaHo5h+sEp/zKerRD75LB5sshM7SnWz3MWAw1h6WaVgOjbP6h+RELFnG3n
 NeCgHSctbSUr23DT/25S4yz1edk50Mxerjp3BA9qd1C+I2djtOv77GOvQmQqIwR6Iqdl
 mB3RsUWHS5UYzycWmlXG1VAgcBN1JLL47Nvc430XzD1sPe/bHdURWBdcPrglYLPNx3JO
 tUgGpsw23WtljyijCN/3XG74uK1nOf/ke2ZVLn+hSUawEUsmLhnvZlR2AJEYgbtwpv6l
 d/Dw==
X-Gm-Message-State: AOJu0Yws/WovBQREhDOrwRkbUMB720fnFwthUe1K4PKicKMjJWe4jryl
 95ip0QZ3Gz6Wf/MtD3SharvNBrJoajJ5+b7aVTavOjb0YAyUQoHImlZjXnOCDQ==
X-Gm-Gg: AR+sD12KFJ3bdd22FZQrkzETzn9VYpgYrZB9knPqHRT1UjvFv6zrTwjXddq2GoJCPmp
 oQ4F+fVnkQHRjQHsQ4RmiSLhb4ZkUJl6+DXZg0XFwNsy1v1hXhUe5WnhNFLtAEswXauPxCc4rkH
 A65+rrbP2OB2DVRq8Lxr5iEfEcy4JwzqJjCZso9SzmUXO3xzjje/osbx7MpquQXelKBZEwW5AAE
 N8pUK6339GNPBb+VXdWelholpfjkcT+/ceb/roKVyYQ7rSTJjkbxjKAdArpGacgtcoQBmGeBPzU
 tD6K/ia9oC8CJMraYexXdX/W14YXq0QAk3WTmQ0bQ8F93hQ5Mf5qvOBWZ1a4sgfZ8NHMpPj/TFX
 8U0dXTNvDSIZtsEQWXEzZ9oxTgnMxP1L5IAVd+RIk5xJloAEpUosoinYlmkEi+joNpVCbn5OPd6
 D+PlEGYtFDfWMU7E7MHHCzl/5T9h59EuEi28YFdh2TVUKjBIuwgvFZGDLnx3atZzjgXFUyl79il
 XvOqtsk0cqVJt2cHTYQRmLmwnKMEYiA
X-Received: by 2002:a05:600c:4453:b0:495:6274:56c2 with SMTP id
 5b1f17b1804b1-4980c649c6emr179599305e9.2.1785740394436; 
 Sun, 02 Aug 2026 23:59:54 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b5b4a2sm234639805e9.1.2026.08.02.23.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 23:59:54 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon,  3 Aug 2026 08:59:39 +0200
Message-ID: <20260803065940.224429-9-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803065940.224429-1-francois.perrad.86@gmail.com>
References: <20260803065940.224429-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785740395; x=1786345195; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OcEbrham67O+YdzdaE8IiWMUcM+0oaHBrLCcKdqBgqo=;
 b=k45nWtWSM1KxFauFA2NVfOeJRg8E5pyPAkDA9JnbgS6DN0JtMgSQguxhR7PTB6HMOp
 YxPfTWAwmGzZiTBpEbC2W/S4eGoGNCb6lNHX55JaDvMXxvvaoWBXukcNl0i7XSMFEpUw
 qFoSZbe3VqbuJaHx7aVJ7AQ9Qh9p7IPlf/q7AWOMyGr1bvR8oRiq8Qw0jZFIygqUPubM
 FMARFHC2JZRA4WzoLWK1HOicZ6pLd6gNF/SpOtgXT/8tKv07PxG79Hr6a0obO2Bje3ME
 Hykpjs6az8AB3h/mvE3Fq24yOIrlU+wX7ss+iFrz8pvzHDGDt509MjKKsZfBHM/4rxb/
 SZhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=k45nWtWS
Subject: [Buildroot] [PATCH v4 8/8] package/hare-dbus: new package
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
 package/hare-dbus/0001-fix-Makefile.patch | 27 +++++++++++++++++++++++
 package/hare-dbus/Config.in               | 10 +++++++++
 package/hare-dbus/hare-dbus.hash          |  3 +++
 package/hare-dbus/hare-dbus.mk            | 15 +++++++++++++
 5 files changed, 56 insertions(+)
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
index 000000000..0f106e27f
--- /dev/null
+++ b/package/hare-dbus/0001-fix-Makefile.patch
@@ -0,0 +1,27 @@
+From 93abfa5970937253ae73bc8bcd9e243d890484a9 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Fri, 15 May 2026 11:56:39 +0200
+Subject: [PATCH] fix Makefile
+
+Upstream: N/A specific for Buildroot build
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
