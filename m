Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76691EF5860
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 09:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 117F460882;
	Mon, 16 Feb 2026 09:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GK-oqCweaNYX; Mon, 16 Feb 2026 09:42:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 114B060A69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771234932;
	bh=Ncgdm7DoMOFHUgKjvhN3UJ9DGqaj1GnCFOX0J9MdEtU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LqlRtxg008sRrLK+7ksyDKSpPh9hjFaJZaMGoKlBLgr+igEb54R7z9dHSeTdtlsD0
	 kELABby3t48JQYqh4AJ+ID6mZsQB3HP6xz2vDnxg5xRXnNrlWIboFKXTGXjckvZuKq
	 I70lfrGQK8pZop5nnQ2r1CwMqp+sqlQzzWJtugrKFjfnXLGyegTg498IBKvtl7VbGy
	 OUn/+Lv27pgHejj+IYJWJC/+tMsIqm/3zzJc7+BMk3BDyraCFnKaXYTwK586/1qEm8
	 1LZxE/hdXmq1PuRrhV6es8touFU3hhXNFBZ2SlYojocz1BaZScOTbTfHFNuqGyTPAt
	 HdvKB4y3292UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 114B060A69;
	Mon, 16 Feb 2026 09:42:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31804270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F9C94052F
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPSw_j25zK76 for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 09:42:09 +0000 (UTC)
X-Greylist: delayed 324 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 16 Feb 2026 09:42:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 70416402D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70416402D7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.36.140.176;
 helo=5.mo534.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
Received: from 5.mo534.mail-out.ovh.net (5.mo534.mail-out.ovh.net
 [54.36.140.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70416402D7
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:42:07 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net
 (director2.derp.mail-out.ovh.net [79.137.60.36])
 by mo534.mail-out.ovh.net (Postfix) with ESMTPS id 4fDyMr2X2cz69wh;
 Mon, 16 Feb 2026 09:36:40 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net
 (director2.derp.mail-out.ovh.net. [127.0.0.1])
 by director2.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Mon, 16 Feb 2026 09:36:40 +0000 (UTC)
Received: from mta11.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.0.151])
 by director2.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4fDyMr1Msbz20Yj; Mon, 16 Feb 2026 09:36:40 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.7])
 (Authenticated sender: mooz@blockos.org)
 by mta11.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id BEEAC9A1361;
 Mon, 16 Feb 2026 09:36:39 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Jardin <vjardin@free.fr>, Vincent Cruz <mooz@blockos.org>
Date: Mon, 16 Feb 2026 10:33:29 +0100
Message-ID: <20260216093535.20643-1-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
x-ovh-tracer-id: 16512448034021427989
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEzWXMWOHfkaMWs1NkZwgsZhcgR5CvWDLSSVi1DOFYfyyfzKXqD6E0xwBfUQJ8jp2NjVMG/dqQw2/MYF7zfbQQvwnqwiOzrZmnsxcbL5XjFMH5PqhJCqyzN+foZoSJE0yz+PL3Rq05gKPhxkC3j9OVEx1ce7Av1wCUwO1tB1gNv2HsLhsOFROSt+ju8ExIxS5QG3Hi/fmpobZLXexZVwFhUeT1Xhb1VfmKTMraK7dIve14cCq9Rw1A8dWgSENhQf8gv0S82bC7ptX6jgD+rn4a/7O3th47HFh+tYDvShTpc8UCbc7A9Z3suGguXtAYHJyghGexy5uciTBjwJALOyfgnGawYJobzgMevQFpB0yMmk9v0UB3FY4KowqS0CuVg0s3P4EFL3whNc8J7wfYpQcF47hAEZ9j+ufinlSEzul9nwSaOjN/YpKLfsfXoP2qZKH+aDB/FP+w6GwilLjzTRZ8UFQbW31NKOr7KaXSkvOwXlTBCtAsinqAlVvZFzPWh4fBi5ArE5b6hVDkibajA7Q9GHaKmrf6TvLU6VggZw5mqjCAGSrhd+66XGQkrGFilTKr7ojsdqavBxaDdvV5pz9svGNEX3t6RaXrKZGiyzz4RdWKyCpALQ8y/s2ZiOFPj43aeLhSjlJbvomgk7eJ0MdUVQ+8drYCyaoGNvG6IonmNIg
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006688acb74-3541-42f3-b48a-98f12809ec93,
 B97F932625BD606AA9665C31F29B1DECF885AB65) smtp.auth=mooz@blockos.org
Subject: [Buildroot] [PATCH v3 1/1] package/libnss-ato: new package
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

The libnss_ato module is a set of C library extensions which allows to
map every nss request for unknown user to a single predefined user.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Vincent Cruz <mooz@blockos.org>
---
v2 -> v3:
   - rebased to v0.2.0 tag
     https://github.com/donapieppo/libnss-ato/releases/tag/v0.2.0

v1 -> v2:
  - rebased on top of the latest master branch
  - asked upstream for a release tag:
    https://github.com/donapieppo/libnss-ato/issues/27

v1: https://lists.buildroot.org/pipermail/buildroot/2024-November/767814.html
  - Baruch Siach: add depends on BR2_TOOLCHAIN_USES_GLIBC since other
    C libraries do not provide NSS functionality. (applied)
  - Baruch Siach: questioned why upstream Makefile is not used;
    explained that it avoids patching for a single .c file. Added
    comment in .mk. (applied)
  - Neal Frager: suggested asking upstream to create proper release
    tags instead of using commit SHA for SBOM compliance. (done, see
    above)
  - Neal Frager: suggested sending upstream a PR to fix the Makefile
    for cross-compilation.

Tested with Buildroot gitlab CI (12/12 glibc toolchains pass):
  https://gitlab.com/vjardin/buildroot/-/pipelines/2313074190

 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libnss-ato/Config.in       | 11 +++++++++++
 package/libnss-ato/libnss-ato.hash |  4 ++++
 package/libnss-ato/libnss-ato.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/libnss-ato/Config.in
 create mode 100644 package/libnss-ato/libnss-ato.hash
 create mode 100644 package/libnss-ato/libnss-ato.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..aaf9e78fd5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3358,6 +3358,7 @@ F:	configs/nvidia_bf3_defconfig
 F:	package/bfscripts/
 F:	package/dpdk/
 F:	package/libecoli/
+F:	package/libnss-ato/
 F:	package/libyang-cpp/
 F:	package/sysrepo-cpp/
 
diff --git a/package/Config.in b/package/Config.in
index 371a1c33e1..955bbf47e7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1630,6 +1630,7 @@ menu "Crypto"
 	source "package/libksba/Config.in"
 	source "package/libmd/Config.in"
 	source "package/libnss/Config.in"
+	source "package/libnss-ato/Config.in"
 	source "package/libp11/Config.in"
 	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
diff --git a/package/libnss-ato/Config.in b/package/libnss-ato/Config.in
new file mode 100644
index 0000000000..6c6fc23857
--- /dev/null
+++ b/package/libnss-ato/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBNSS_ATO
+	bool "libnss-ato"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  Library to map every nss request for unknown user to a
+	  single predefined user.
+
+	  https://github.com/donapieppo/libnss-ato
+
+comment "libnss-ato needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libnss-ato/libnss-ato.hash b/package/libnss-ato/libnss-ato.hash
new file mode 100644
index 0000000000..39220f4b03
--- /dev/null
+++ b/package/libnss-ato/libnss-ato.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  7fe56dcfaed74884fa1f9323d000135a4de2a32177a474ee2b9e4a217ae83994  libnss-ato-0.2.0.tar.gz
+sha256  3de3161d298c48e55d7416ad89130e13dd72263b93563f3fb79c899fa8450ce2  copyright
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  lgpl-3.0.txt
diff --git a/package/libnss-ato/libnss-ato.mk b/package/libnss-ato/libnss-ato.mk
new file mode 100644
index 0000000000..a7fb3600f8
--- /dev/null
+++ b/package/libnss-ato/libnss-ato.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# libnss-ato
+#
+################################################################################
+
+LIBNSS_ATO_VERSION = 0.2.0
+LIBNSS_ATO_SITE = $(call github,donapieppo,libnss-ato,v$(LIBNSS_ATO_VERSION))
+LIBNSS_ATO_LICENSE = LGPL-3.0+
+LIBNSS_ATO_LICENSE_FILES = copyright lgpl-3.0.txt
+
+# Skip the default build system (avoid patching Makefile for 1 .c)
+define LIBNSS_ATO_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		-fPIC -Wall -shared -o $(@D)/libnss_ato.so.2 \
+		-Wl,-soname,libnss_ato.so.2 \
+		$(@D)/libnss_ato.c
+endef
+
+define LIBNSS_ATO_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libnss_ato.so.2 $(TARGET_DIR)/lib/libnss_ato.so.2
+	ln -sf libnss_ato.so.2 $(TARGET_DIR)/lib/libnss_ato.so
+	$(INSTALL) -D -m 0644 $(@D)/libnss-ato.conf $(TARGET_DIR)/etc/libnss-ato.conf
+endef
+
+$(eval $(generic-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
