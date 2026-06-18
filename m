Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98A3CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 11:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C7B583BF5;
	Thu, 18 Jun 2026 11:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ur7dk1fV_gMq; Thu, 18 Jun 2026 11:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA74083BEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781782101;
	bh=rqyP/+Q3kwrAU0EkXlUJTMxkAKbl0wkG9UmngrDS9RA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=iKM7ytx1tBlirNx240bm8GDLQyVn10ZX9HOFdi0qPOfCxweCTFA4PsNyU636XSNEG
	 vYM21KGPffGyjoskk9Da4UM4df9s9n+XGPtpg8v7PIgY38K4lHWk06XlticEfR8bxe
	 6a3ix77cP3kaJzOaOygDyrcDx0rq36NqJgzjeV63IitTL6MysUMVpqdOkwntdpmQsO
	 VtojQ31TBAj1ZZayzsCg3nFn35o9uUrLHxSbdjHILnT5AsVyMZYgSBNPpUdB5GqLIM
	 dRuCTCDLDjLbC8EbYZuSUUN9lLqkbsJSKsA/bXhdvErq3QxvTYuGE2w+1TD4Pz4I5x
	 KXYgrHlF0MA2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA74083BEE;
	Thu, 18 Jun 2026 11:28:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FFF9131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 11:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05FEF83BE7
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 11:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UpM7dLa-mLx5 for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 11:28:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64E2483BE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64E2483BE6
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64E2483BE6
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 11:28:18 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1752647974; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 11:28:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waAuq-0000000CD5b-1OdT;
 Thu, 18 Jun 2026 13:28:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 13:28:09 +0200
Message-ID: <20260618112810.2910199-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mWlS9OIOU/so0XwezE8QWJ+mJ/Hlzya7uTduW53af/bwVVyysQr/d11eGKepfJ881PNq/UZ5fxiMBwzcjlzE/s0HGLw9BcnDDRTe1+yjnJzPSbA57emLY6pa0J105Ssxvzu4qdpt/M8Y6k5n94qGKEHlw38I0ogglQ3Hv9Qb7GDdFcqJRreP/nmlQQbtTTt4Q8TJxd6767Kj8+Wpb/sHnWHOtq4+/OBOhi/qwCkn9hiYysQYinNH7q/F8dsP5/niwws8l+Tn3xHAZV8gyy6NbBtJwjCRdhJdV76wRVpIWVbCXuBhPNv2WNeYD0UZhshkuyNIGih8H1/dVt2bh0bCpw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=PfS0fVTTeVVTTZmr1tdVaXNjxp5k87pCn6S+CoKibL8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=mWlS9OIO
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/agec: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Agec is a simple file encryption tool that implements the
age format in C with minimal dependencies. The tool supports
asymmetric encryption based on X25519, and a passphrase
encryption based on scrypt.

https://git.sr.ht/~min/agec
https://age-encryption.org

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/agec/Config.in | 10 ++++++++++
 package/agec/agec.hash |  3 +++
 package/agec/agec.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/agec/Config.in
 create mode 100644 package/agec/agec.hash
 create mode 100644 package/agec/agec.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d591c62805..7e101c1eb1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2647,6 +2647,7 @@ F:	configs/orangepi_pc_defconfig
 F:	configs/orangepi_r1_defconfig
 F:	configs/sheevaplug_defconfig
 F:	configs/visionfive_defconfig
+F:	package/agec/
 F:	package/bats-core/
 F:	package/dfu-programmer/
 F:	package/docker-compose/
diff --git a/package/Config.in b/package/Config.in
index 96e113e226..b8374fbab5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2728,6 +2728,7 @@ comment "Shells"
 	source "package/nushell/Config.in"
 	source "package/zsh/Config.in"
 comment "Utilities"
+	source "package/agec/Config.in"
 	source "package/apg/Config.in"
 	source "package/at/Config.in"
 	source "package/bash-completion/Config.in"
diff --git a/package/agec/Config.in b/package/agec/Config.in
new file mode 100644
index 0000000000..8ca9240917
--- /dev/null
+++ b/package/agec/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_AGEC
+	bool "agec"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Agec is a simple file encryption tool that implements the
+	  age format in C with minimal dependencies. The tool supports
+	  asymmetric encryption based on X25519, and a passphrase
+	  encryption based on scrypt.
+
+	  https://git.sr.ht/~min/agec
diff --git a/package/agec/agec.hash b/package/agec/agec.hash
new file mode 100644
index 0000000000..0b6982f913
--- /dev/null
+++ b/package/agec/agec.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  97958ff82eaa6aa89328f4319d585e362130168c478cf6a85ba3f4d05e453669  0.1.0.tar.gz
+sha256  f7f37a8bb7d993825b10f5ce2838c1c452d902eda63cd180fdabc7c3a5dd0341  LICENSE
diff --git a/package/agec/agec.mk b/package/agec/agec.mk
new file mode 100644
index 0000000000..b19eac94a4
--- /dev/null
+++ b/package/agec/agec.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# agec
+#
+################################################################################
+
+AGEC_VERSION = 0.1.0
+AGEC_SOURCE = $(AGEC_VERSION).tar.gz
+AGEC_SITE = https://git.sr.ht/~min/agec/archive
+AGEC_LICENSE = BSD-0-Clause
+AGEC_LICENSE_FILES = LICENSE
+AGEC_DEPENDENCIES = host-pkgconf openssl
+
+define AGEC_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
+endef
+
+define AGEC_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		PREFIX=$(TARGET_DIR)/usr install
+endef
+
+$(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
