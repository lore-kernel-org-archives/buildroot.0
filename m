Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E83E7719B
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0550980F80;
	Wed,  8 Jan 2025 22:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxEIReracZs2; Wed,  8 Jan 2025 22:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE8D080F8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE8D080F8C;
	Wed,  8 Jan 2025 22:43:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B3227AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDFAB80F7E
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpHxs6oxCOGm for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:43:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C18C480F6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C18C480F6E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C18C480F6E
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:43:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2F2E81BF204;
 Wed,  8 Jan 2025 22:43:22 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  8 Jan 2025 23:43:14 +0100
Message-ID: <20250108224320.2241826-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108224320.2241826-1-thomas.petazzoni@bootlin.com>
References: <20250108224320.2241826-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736376202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OIch9qqSJ6dtAYU2+qyiaYnbgjepmPjepvWtA5wadLI=;
 b=bPnby4JgZQPTFb268gK8F2pJ3gp5I1OSgAiXFBiZ/kXxpg2QBPkbM4Qjd/7pulnKgkmRuj
 blmVTQcWjBwmu9ESm7o+UjAKoOoOANJt3hlv1rsxjbNkIHPe6TOi1EjrMo/yMy1RupRo0u
 +f8LXhxVZ6sPa54P9nVqIzTVFuUtzB8jj5yocyR72TSTsLaStSElj/oLPIwxKxIYc5wbU0
 BiOUHJVkmR9VC2S7TpsPmxFe5F6Uxhwl2PYKJ0Myl/QzlRWnHgp3v4oETnhznabXWv14Ki
 YKgmillrHVoGfb+hRdbekOj9L7fOMWbWmt85JfIF886nVJV/S9lrxZzEVKgTxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bPnby4Jg
Subject: [Buildroot] [PATCH 1/4] package/cross-ldd: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit introduces a new cross-ldd package which installs the
cross ldd implementation that comes from Crosstool-NG, and which can
be used like ldd, but when cross-compiling. We intend to use it as a
replacement of host-prelink-cross for our dracut package.

The cross-ldd from Crosstool-NG is in fact even recommended by the
Dracut documentation, in its docs/README.cross document:

   To support cross-compiled binaries, a different ldd variant is needed that
   works on those binaries. One such ldd script is found at
   https://gist.github.com/jerome-pouiller/c403786c1394f53f44a3b61214489e6f

This Github Gist in fact contains the xldd.in code from Crosstool-NG.

Our package downloads the full tarball of Crosstool-NG. We tried to
download only the script and the license file, but we couldn't figure
out a way of downloading them *and* have the version in the filename
to make sure that when doing an upgrade to a newer version, we
wouldn't have a clash between old/new files having the same name (and
causing conflicts with the hash verification). So in the end, we opted
for download the whole tarball.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  1 +
 package/cross-ldd/cross-ldd.hash |  4 ++++
 package/cross-ldd/cross-ldd.mk   | 37 ++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 package/cross-ldd/cross-ldd.hash
 create mode 100644 package/cross-ldd/cross-ldd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 16b72eee08..1174100014 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3145,6 +3145,7 @@ F:	package/cifs-utils/
 F:	package/cloop/
 F:	package/cmake/
 F:	package/cramfs/
+F:	package/cross-ldd/
 F:	package/dmidecode/
 F:	package/double-conversion/
 F:	package/flashrom/
diff --git a/package/cross-ldd/cross-ldd.hash b/package/cross-ldd/cross-ldd.hash
new file mode 100644
index 0000000000..b179aec5e0
--- /dev/null
+++ b/package/cross-ldd/cross-ldd.hash
@@ -0,0 +1,4 @@
+# From http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.26.0.tar.xz.sha512
+sha512  7834184ae5792fd347455f9f48fee826248dcb82d271954ed4304b1a18f63995ff8a2c3b817564dcf147ac7e16e02d779195b26d97eb57db27f1118a1837002a  crosstool-ng-1.26.0.tar.xz
+# Locally calculated
+sha256  07bc0ccd386469c748c4cf6c8faca5667fbf8c4400386714287fa233acfd68ba  COPYING
diff --git a/package/cross-ldd/cross-ldd.mk b/package/cross-ldd/cross-ldd.mk
new file mode 100644
index 0000000000..357133cdd2
--- /dev/null
+++ b/package/cross-ldd/cross-ldd.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# cross-ldd
+#
+################################################################################
+
+CROSS_LDD_VERSION = 1.26.0
+CROSS_LDD_SITE = http://crosstool-ng.org/download/crosstool-ng
+CROSS_LDD_SOURCE = crosstool-ng-$(CROSS_LDD_VERSION).tar.xz
+CROSS_LDD_LICENSE = GPL-2.0
+CROSS_LDD_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_ARCH_IS_64),y)
+CROSS_LDD_BITNESS = 64
+else
+CROSS_LDD_BITNESS = 32
+endif
+
+CROSS_LDD_TOOLS_PREFIX = $(patsubst %-,%,$(TARGET_CROSS))
+
+define HOST_CROSS_LDD_CONFIGURE_CMDS
+	sed \
+		-e "s%@@CT_bash@@%/usr/bin/env bash%" \
+		-e "s%@@CT_VERSION@@%$(CROSS_LDD_VERSION)%" \
+		-e "s%@@CT_BITS@@%$(CROSS_LDD_BITNESS)%" \
+		-e "s%@@CT_sed@@%sed%" \
+		-e "s%@@CT_grep@@%grep%" \
+		-e "s%^prefix=.*%prefix=$(CROSS_LDD_TOOLS_PREFIX)%" \
+		$(@D)/scripts/xldd.in > \
+		$(@D)/scripts/xldd
+endef
+
+define HOST_CROSS_LDD_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/scripts/xldd $(TARGET_CROSS)xldd
+endef
+
+$(eval $(host-generic-package))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
