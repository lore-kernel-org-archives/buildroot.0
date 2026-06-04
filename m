Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367C2CD6E6D
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 05:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E97EB6F49A;
	Thu,  4 Jun 2026 05:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lUrXPR6PAcDv; Thu,  4 Jun 2026 05:12:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6359961CF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780549939;
	bh=iSUw6L/goF4NJ6jN0LkB9VDkUPKiFJAPPe/HDStwWfg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sZ3B3dk5LF5Fo63YiosZqaEy6pkIWAx7kyLR3ye5mUuZ6WOuKw8W6UcLqKYFZcVl8
	 8MgxQkLHrg0XoDBB0xpEAwNdg4PRkndEJV4B+vmIKg2RT4+jkM14MOHX75wRRfzMpC
	 z8gc2icllOd9G1I8te/QomDoK6Q1/ohxAPeAA8mhh9MX7Z/K/CmGOF0pURk9VTbyBm
	 zoDq4U13kAcMgfc9J7+GV5/65uT41HOat/vD5cs+uxzmxVLd6GnLP95W+g/hKtPLSC
	 0bHZPJ+k5o7pYxmKoQpQzIt9xQZc0ohd0izKJ3Rd0CqNrL4DwekQ89AJDAYgu6xYxx
	 HnqP0i/pDadTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6359961CF7;
	Thu,  4 Jun 2026 05:12:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27A80DE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 05:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 187C684DF5
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 05:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCdZH7KAiTip for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 05:12:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C34DB84DED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C34DB84DED
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C34DB84DED
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 05:12:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28F8D20650;
 Thu,  4 Jun 2026 05:12:14 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Thu,  4 Jun 2026 07:12:13 +0200
Message-Id: <20260604051213.317097-1-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTFKTUjZkq1i5mAZkwTlm1Ak+tv2Be+5vHZWiX+EuA9VT2KvWLQXKpDo+QTwWlSpA/80c61qej5xMVOknDM5ShGfrgr0elXaltcp5FNDQj6LJQyizl0K5PeYIPdEKTzGFexFo+e12/1UQunXbRgLbzBDueaOIID8ug7ns2mkusQKg0TIqSha8y7RyepQhSN/FJwKtM7OCJQI/2TZ10yzw3EZjQlIYjj9wqEUGnWTBALR92fiVX+UgnPhn+POJyzJRqnEbtiqtezY4qLiAll8RlRYjxkDw8kiUV25gxdwUygfBJnag1OxWUeWHS+0pTlXJHmjxD5TyLfDxGPR0VYE89DaKryrow4FDgQt9L35QFxU5gEz6TMmrsSTThSmSkTCL12juGWj3sVa6OEGmSl3V/kA4Q3NuhsTux0dMEQQEMdJ4FIH5PzzMI6P7+czpyFMCX+jlHSHrcfQA3ybLCPTBJ+rPDlNBMzKMW8yT1K2UpLjoRYXIqoEb12W1PyfcMWXaNBPHWLYtbA5A3oljSL+7okoQDswwVCi5FsyrNljooKWcYqziZPTTuIvkqXv4+9uGuim+r48Y3QFqknKwQup/+XW3azq8OxWiTB/ryRyjPoC81opMYfzH2ix8uMdlWHcraleEAqSDh6bazfw6vgI0fLrazFOcXIzxCi12/nljQ/84g
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780549934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=94bpm/Lisk7Uba3GKh06ikodNXTb9FY4Uik+xY4W0Cg=;
 b=cWuMy7rDB22xw5RxEWFzsTBvomYCKj+fEzj35Lpzjpn/CzggSDAUinCRPbGDpsqAouKTXh
 E+hPAtO/AuT1jEJC7WWflBFBVuorTdQOh1MQ3XrsvLPjbPhvFz0caoXOoBOVkZjkXFpc+9
 lgULGuhdbD6UjgJxOA0v4l/FzKlKXMS67A1b2GpFyPSZIx82//XD4c92hGauvfcnJMye5k
 PHsCzwCOfZXEg0uZHXpx8xurZhGQLrhrIrB2jtbWnZRvo2ZYZs1Usb0rbHrhJVgkdxy39G
 95bGswaMil7KG5zBdy27pJNbw77jy8tIFUUksEdgy5eh3RUECAAGkQGBTWsOIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=cWuMy7rD
Subject: [Buildroot] [PATCH] package/mawk: provide the awk symlink
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
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Ismael Luceno <ismael@iodev.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Many scripts and Makefiles expect 'awk' to be available in PATH. When
mawk is installed, create an 'awk' symlink pointing to it, mirroring
what the gawk package already does.

The target directory is populated in alphabetical (not dependency)
order, so build order alone cannot decide which package wins the 'awk'
name when both gawk and mawk are selected. Follow the BusyBox model
instead: add mawk to BUSYBOX_DEPENDENCIES so it is installed before
BusyBox (which already avoids overwriting existing tools), build gawk
after mawk, and make gawk skip its 'awk' symlink when one is already
installed. This makes mawk win deterministically, matching the
maintainers' preference.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Previously sent as patch 10/11 of the "Add ColdFire MCF5441x (m68k)
support" series. Resent standalone since it is independent of the
ColdFire work, and reworked to follow the BusyBox model per Arnout's
review: build gawk after mawk and have gawk skip the awk symlink when
one is already installed, instead of relying on the install order.

 package/busybox/busybox.mk | 1 +
 package/gawk/gawk.mk       | 9 ++++++++-
 package/mawk/mawk.mk       | 6 ++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ebe169cdb9..34c15837e8 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -56,6 +56,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_KMOD),kmod) \
 	$(if $(BR2_PACKAGE_LESS),less) \
 	$(if $(BR2_PACKAGE_LSOF),lsof) \
+	$(if $(BR2_PACKAGE_MAWK),mawk) \
 	$(if $(BR2_PACKAGE_MTD),mtd) \
 	$(if $(BR2_PACKAGE_NET_TOOLS),net-tools) \
 	$(if $(BR2_PACKAGE_NETCAT),netcat) \
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 10ca336844..436b022b10 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -33,8 +33,15 @@ endif
 
 HOST_GAWK_CONF_OPTS = --without-readline --without-mpfr
 
+# When mawk is also selected, build it before gawk and let mawk provide
+# the 'awk' symlink: do not overwrite an awk already installed by another
+# package, mirroring what BusyBox does.
+ifeq ($(BR2_PACKAGE_MAWK),y)
+GAWK_DEPENDENCIES += mawk
+endif
+
 define GAWK_CREATE_SYMLINK
-	ln -sf gawk $(TARGET_DIR)/usr/bin/awk
+	test -e $(TARGET_DIR)/usr/bin/awk || ln -sf gawk $(TARGET_DIR)/usr/bin/awk
 endef
 
 GAWK_POST_INSTALL_TARGET_HOOKS += GAWK_CREATE_SYMLINK
diff --git a/package/mawk/mawk.mk b/package/mawk/mawk.mk
index f9f0623904..b21ac16742 100644
--- a/package/mawk/mawk.mk
+++ b/package/mawk/mawk.mk
@@ -10,4 +10,10 @@ MAWK_SOURCE = mawk-$(MAWK_VERSION).tgz
 MAWK_LICENSE = GPL-2.0
 MAWK_LICENSE_FILES = COPYING
 
+define MAWK_CREATE_SYMLINK
+	ln -sf mawk $(TARGET_DIR)/usr/bin/awk
+endef
+
+MAWK_POST_INSTALL_TARGET_HOOKS += MAWK_CREATE_SYMLINK
+
 $(eval $(autotools-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
