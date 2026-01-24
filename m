Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE05AD715C7
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 08:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E12840AA5;
	Sat, 24 Jan 2026 08:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQrdihcfhcaP; Sat, 24 Jan 2026 08:43:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9149340AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769244208;
	bh=18Nxc+oKZ23urXTFl+2TWl4QNOB3uEV6pipeTGihY4c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YDQDcKcVSfvLI7os2nKauZsGhUnmtjdj+9rWuqNVJQNhPkfrffRrd4+wzgQrtStVi
	 aM88a8Yf/QFUea0eKkuRpKd+48jnqqshtWm3zi8wtnWXuTX/Gy5NxX9phnZLZDsihj
	 8I/hM+pJ9K57zUruM7XSqgJPksl7Ty0lkF8v4VJs54hI9W/AKTZfSIvwyb865324sC
	 kQBUFQSMatAq7dReDjDgS9Dv/ZUpv1ynu09OwW1XmlEjc/uusUtSWWmdxv5es2Kxpp
	 SzoFl1qi/E28KFD7UF8qMOuiDgtV1iKfKOjFppv6l3ga0E27doHZgH0mAma1E4eaP4
	 lItn6yQ45PoyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9149340AA1;
	Sat, 24 Jan 2026 08:43:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92B83358
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 08:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E55060866
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 08:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIx9v_9uaMuf for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 08:43:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA1BE6085A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA1BE6085A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA1BE6085A
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 08:43:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b95e.dip0.t-ipconnect.de [84.161.185.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ACCCCA4C492C
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 09:43:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58346)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vjZEp-000000003aS-2ujj
 for buildroot@buildroot.org; Sat, 24 Jan 2026 08:43:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Jan 2026 09:43:23 +0100
Message-ID: <20260124084323.1068962-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769244203;
 bh=jcxHyQ7XEC5Rwix2hVWpdiO3OrcVTetFaSEAdHp86K0=;
 h=From:To:Subject:Date:From;
 b=liKIyqdcKkS6bz+zFiGCu5AqcFErN09T+cG8ug3Zl/8sDX9dBgiwdUZi8IC25NyYJ
 llZiAM/ahSt4Tr+Q+SLK53opeTAsDiqMtXz+wyM4tEdrhyX7JHqPE9tfz7xfoE0F0r
 MLHQGV92/HHVzEPzapWd45TME/XsSoShP5dX7g/4ZkI3exRXoWXuJ42p6s0RJdUaN6
 Q0wzpkG0FELH6HVwBJ6oDdGIk3vkQDSSNan4rnqqfMlppGdzs96bbgp4amVGEItaPH
 OjQk4cBOGtfkbW1bpLq2pP5wpYyuQPuhKXTeffQWcbE3cnvfJc0i2DHtOtGHlZ58JU
 LbBo6mB/hbSQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=liKIyqdc
Subject: [Buildroot] [PATCH 1/1] package/linux-tools: fix pcitest
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

Buildroot commit 74d33f6f817f14f05c8e1600df3399d4d96c6320 bumped
BR2_LINUX_KERNEL_LATEST_VERSION to 6.14 series that includes upstream
commit https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=392188bb0f6ec5162edf457c062929a6abfa369a
which moved tools/pci/ to tools/testing/selftests/pci_endpoint/.

Use INSTALL_PATH instead of DESTDIR in PCI_INSTALL_TARGET_CMDS for these
kernels due to upstream commit
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=392188bb0f6ec5162edf457c062929a6abfa369a
that uses common makefile ../lib.mk which forces the use of INSTALL_PATH:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/tools/testing/selftests/lib.mk#n178

Fixes:
https://autobuild.buildroot.net/results/c4d/c4d08bd1dbaf448d8e2d0c8b252b233c85e92396/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/linux-tools/linux-tool-pci.mk.in | 31 ++++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
index 17246f5d7e..51f816fdc3 100644
--- a/package/linux-tools/linux-tool-pci.mk.in
+++ b/package/linux-tools/linux-tool-pci.mk.in
@@ -9,19 +9,34 @@ LINUX_TOOLS += pci
 PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
 
 define PCI_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
+	$(Q)if test -f $(LINUX_DIR)/tools/testing/selftests/pci_endpoint/Makefile ; then \
+		PCI_SUBDIR=tools/testing/selftests/pci_endpoint \
+		TEST_GEN_PROGS="TEST_GEN_PROGS=pci_endpoint_test"; \
+	elif grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
+		PCI_SUBDIR=tools/pci; \
+	else \
 		echo "Your kernel version is too old and does not have install section in the pci tools." ; \
 		echo "At least kernel 4.20 must be used." ; \
 		exit 1 ; \
-	fi
-
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/pci \
-		$(PCI_MAKE_OPTS)
+	fi ; \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/$${PCI_SUBDIR} \
+		$(PCI_MAKE_OPTS) $${TEST_GEN_PROGS}
 endef
 
+# For install no need to recheck both cases: we know at least one
+# exists, because that was checked at build time already; we just
+# need to find which of the two: if not one, then the other.
 define PCI_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/pci \
-		$(PCI_MAKE_OPTS) \
-		DESTDIR=$(TARGET_DIR) \
+	$(Q)if test -f $(LINUX_DIR)/tools/testing/selftests/pci_endpoint/Makefile ; then \
+		PCI_INSTALL_OPT="INSTALL_PATH=$(TARGET_DIR)" \
+		PCI_SUBDIR=tools/testing/selftests/pci_endpoint \
+		TEST_GEN_PROGS="TEST_GEN_PROGS=pci_endpoint_test"; \
+	else \
+		PCI_INSTALL_OPT="DESTDIR=$(TARGET_DIR)" \
+		PCI_SUBDIR=tools/pci; \
+	fi ; \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/$${PCI_SUBDIR} \
+		$(PCI_MAKE_OPTS) $${TEST_GEN_PROGS} \
+		$${PCI_INSTALL_OPT} \
 		install
 endef
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
