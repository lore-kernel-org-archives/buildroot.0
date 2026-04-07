Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C6FFF512F
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 17:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB32360DDB;
	Tue,  7 Apr 2026 17:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OnULlKlnfFsC; Tue,  7 Apr 2026 17:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB05B60DCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775583444;
	bh=nk3hps9IXuUfHDOJsNZR2kvQA2E2Wj+lcFqPXloTbaU=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dxw2HPcKGLutRs1M/eH/+l9q4LNhNoptKPJUMwrqnkm6zThhgRSwRFrg3WeJ3hHcx
	 e0W4tAVDKAda0Ffuc/L3HZM5tVNpKTTWbe3XSrSB2ATT+z98rP4Z5bSbwDt123SEXp
	 pBC9In17CAt9AuA7YpQLWUswZNAnz9ywuVo7NSI/ME20EqUAsmWoq4Aw3eC4dVXbqs
	 Yg/H/YAW4t8MgMIZVDWyRubwNsFysDjDtWmdtLbL0JuCKXm4XBXqUsHYEJRr3GutFi
	 5n1m9ys+vcJCwUAb3PGX2Ez0prwOCr1vd7m7t19Tv8LBqWyzZAVfD5qQFEMeWgxqFC
	 aSDTKMUh3JXgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB05B60DCB;
	Tue,  7 Apr 2026 17:37:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EC8C237
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84D8940C21
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPccKjjfCNt8 for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 17:37:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.10;
 helo=smtp-bc0a.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4804B40583
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4804B40583
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch
 [45.157.188.10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4804B40583
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:37:18 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fqtgJ2CJMz9VF;
 Tue,  7 Apr 2026 19:37:16 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fqtgH55KGzxpd; Tue,  7 Apr 2026 19:37:15 +0200 (CEST)
Date: Tue, 07 Apr 2026 19:37:09 +0200
MIME-Version: 1.0
Message-Id: <20260407-generate-cyclonedx-br-v1-3-03c45ccba2ed@cherry.de>
References: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
In-Reply-To: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>, Martin Bark <martin@barkynet.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1775583436;
 bh=rx+MXtVijcKc7+GL0k1pc95BUavReMmv+pTLUPfQMVk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Zq/I6sN0Ranqv2rfgLOdD1XVL/VtFEy1tSz3xFCWSCbya6r0d2NVNFzCQegx6GK+M
 +X3ALKDgY8dxRUyCWWZIK1h5G9oKmpEOkZjN7Nad+u/YVobALSXHYAFR46rXWc9nPU
 zV82Rr2IniVQdZB+J4Uzof1ft7e9v+nltdJLRVj2Yq2cq9/47TLB+REG/ltcxT8QU4
 saHzg62Hne1E5+EjeRIHJKe6sUfLAN5ZnoB+KeA707Abh6Oo6+mr/s8NzESLKif/gr
 Dx/JAFDCKnJDoB/mUKSBrj1PxRV0GA98tGrWmwNWPMt4bk0YWASuwdTE+vz8XaZNev
 6ux2RmLZ4WDUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=Zq/I6sN0
Subject: [Buildroot] [PATCH 3/4] package/ca-certificates: enable host
 package variant
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

The host ca-certificates is needed to download the SPDX schema on
CycloneDX's GitHub when using Buildroot's host Python, see
urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH) in
utils/generate-cyclonedx.

Note that unlike the target package which uses a _TARGET_FINALIZE_HOOKS
since commit 2bc8e72bafed ("package/ca-certificates: create the bundle
as target-finalize hook"), the host package doesn't have this option as
there's no such hook for host packages. Therefore, the target's
CA_CERTIFICATES_INSTALL_TARGET_CMDS and CA_CERTIFICATES_GEN_BUNDLE are
merged and adapted into HOST_CA_CERTIFICATES_INSTALL_CMDS.
This of course has the same shortcomings as the target package had
before commit 2bc8e72bafed ("package/ca-certificates: create the bundle
as target-finalize hook").
The adaptations were:
- replaced $(TARGET_MAKE_ENV) with $(HOST_MAKE_ENV)
- replaced $(TARGET_DIR) to $(HOST_DIR)
- replaced $(HOST_DIR)/usr with $(HOST_DIR)
- replaced find usr/share/ca-certificates with find share/ca-certificates
  (since it's done from within $(HOST_DIR)

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/Config.in.host                     |  1 +
 package/ca-certificates/Config.in.host     | 12 ++++++++++++
 package/ca-certificates/ca-certificates.mk | 30 ++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index b990ce8b14..5365eddd5c 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -14,6 +14,7 @@ menu "Host utilities"
 	source "package/bmap-writer/Config.in.host"
 	source "package/bootgen/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
+	source "package/ca-certificates/Config.in.host"
 	source "package/casync-nano/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
diff --git a/package/ca-certificates/Config.in.host b/package/ca-certificates/Config.in.host
new file mode 100644
index 0000000000..950f5854dc
--- /dev/null
+++ b/package/ca-certificates/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_CA_CERTIFICATES
+	bool "Host CA Certificates"
+	help
+	  This package includes PEM files of CA certificates to allow
+	  SSL-based applications to check for the authenticity of SSL
+	  connections on the host.
+
+	  It includes, among others, certificate authorities used by the
+	  Debian infrastructure and those shipped with Mozilla's
+	  browsers.
+
+	  https://salsa.debian.org/debian/ca-certificates
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index b1903f6166..bcf645b767 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -8,6 +8,7 @@ CA_CERTIFICATES_VERSION = 20250419
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
 CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20250419T084132Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
+HOST_CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
@@ -43,4 +44,33 @@ define CA_CERTIFICATES_GEN_BUNDLE
 endef
 CA_CERTIFICATES_TARGET_FINALIZE_HOOKS += CA_CERTIFICATES_GEN_BUNDLE
 
+define HOST_CA_CERTIFICATES_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) clean all
+endef
+
+define HOST_CA_CERTIFICATES_INSTALL_CMDS
+	$(INSTALL) -d -m 0755 $(HOST_DIR)/share/ca-certificates
+	$(INSTALL) -d -m 0755 $(HOST_DIR)/etc/ssl/certs
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(HOST_DIR)
+	rm -f $(HOST_DIR)/sbin/update-ca-certificates
+	# Remove any existing certificates under /etc/ssl/certs
+	rm -f $(HOST_DIR)/etc/ssl/certs/*
+
+	# Create symlinks to certificates under /etc/ssl/certs
+	# and generate the bundle
+	cd $(HOST_DIR) ;\
+	for i in `find share/ca-certificates -name "*.crt" | LC_COLLATE=C sort` ; do \
+		ln -sf ../../../$$i etc/ssl/certs/`basename $${i} .crt`.pem ;\
+		cat $$i ;\
+	done >$(BUILD_DIR)/ca-certificates.crt
+
+	# Create symlinks to the certificates by their hash values
+	$(HOST_DIR)/bin/c_rehash $(HOST_DIR)/etc/ssl/certs
+
+	# Install the certificates bundle
+	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
+		$(HOST_DIR)/etc/ssl/certs/ca-certificates.crt
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
