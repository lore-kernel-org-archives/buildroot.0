Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC87CD6E5D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 19:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CCF582373;
	Tue,  2 Jun 2026 19:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1S6laS3rvJzV; Tue,  2 Jun 2026 19:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 034F082362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780427108;
	bh=4iOuMjhlhO3LMCO8Znk2J061cEhcb4c+nDm9FGpm2qc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KeUO8yQS2OfkWnjv3gveAOhScubDbOr2iuoj8vdfn+h3Cto1OkWaSyTIFeIadwahH
	 pTQM9b+gW9s9f+3iJ2po+Z/yMzjTVQCFtAGCngZrnwj4BmLOnIozqwgdzLkdEeHbWt
	 KviZOVR85SQmwepKs9/4ZXudrnjMpaJjtAKsJA/nGu+RU4Y52MhtDSm+WQ56UFVKk4
	 vmMU1ocv/BdBQD5smZNooLKJYEzX87zBwn4IVSwXd9nQw/YeKUZfpfYcxRk3OgDgwd
	 Xe8tQr+zikoDEAmn+atrZ9AwZqf5NWdjlbOpadcSHTFBJssQ0wfKJfyTiLcsdcjeYM
	 555luMh1n8nPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 034F082362;
	Tue,  2 Jun 2026 19:05:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE993187
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA81182362
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fl8UgKRplC6V for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 19:05:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D58D98235B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D58D98235B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D58D98235B
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:05:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ef.dip0.t-ipconnect.de [91.58.8.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0FCFFA4C3116
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 21:05:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51668)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUUQ9-000000006ic-0xsx
 for buildroot@buildroot.org; Tue, 02 Jun 2026 19:05:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 21:05:01 +0200
Message-ID: <20260602190501.2038962-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780427102;
 bh=XNTaPAIY7fR5xMCV3CbQ+veR9jOlbruhYRQ48OA7oMA=;
 h=From:To:Subject:Date:From;
 b=nnbWryIMAUrKj1EdX6J/Tl4QnLf1LYa43MVOiI1O1H0IaCs/szIwXhbhg0PNXTiS/
 MrTSM9iijoD2e6b5aJvFpjFlCHlvvCvqlxs50lgK59AloW7jERzV4dGJIOA/edaNge
 niUi/Fe14B3qf/vVWcpoP1NdZ9VReyBaqMkYv4CtVJ6INvso4CqS/PC1lzMiGUP933
 mU+zqw2OpWQgH47New8f9MxhqMkQUZy3mZXs747BmpViBIN2kL6VLuuzbB2ovJ/gHP
 7CULKZLoCN3B8NAWGM9X9imMDIlY8SaTDY5fdaNMTCAgGbsZ5bFoK2mdSkVxEzJSW2
 LTQopIedocsDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nnbWryIM
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
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a39870be7a02354c656773e68e5d1f111e1e0327

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
