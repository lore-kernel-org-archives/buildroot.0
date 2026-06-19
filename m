Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B65CD98F2
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65EA66F601;
	Fri, 19 Jun 2026 09:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CnNPuJDxHxNH; Fri, 19 Jun 2026 09:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 612FE6F602
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781860829;
	bh=1r6nL1L19cL7a0FRpcy/iF8zaCgis00soNPtLkm3UXE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=brqFRcZVG2DWgWM9f8VkDZYafCTo6moDaak7U1AHg305d/78mEB/4d7Iwv0krmh9u
	 IeLUqPN96zrk8oMhVUJX/Q/5AI+z85WypN5u//s79B+qzCJ1MCuwxcP5CO1Sg23nCA
	 0iZtk4uITxww6qH4LB54QiMLAD83VX8wJ1ZK75M1vvzxN9VgXE0GImjk1Mmu3n6/HL
	 xSrqiMtLWn6ZynzQrJELmTXa2BjyJ0G075lwD43xi1O4pbfgMFVmZ2eFlVEUJO85Fa
	 C49tXw0J4sSDutU1oz+kCX90zrleeBIEqOiO4zKyaNsCddvkirxRjDJJOsz/+yvS5F
	 tyYVZKs7qGC6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 612FE6F602;
	Fri, 19 Jun 2026 09:20:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E4E1367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 645F36F602
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wy74Mgn8FDtL for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:20:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1899A6F601
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1899A6F601
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1899A6F601
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:20:26 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -530246013; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 19 Jun 2026 09:20:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waVOg-0000000DFaa-47pL;
 Fri, 19 Jun 2026 11:20:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:20:03 +0200
Message-ID: <20260619092004.3158146-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=VU4FOsSRbZFLVnlj8cFY1zlPQSmyLz50zg6l2erknb5Z3/JRq9qOOSTnzkhOj9pOeSI4dJkwjpwvQM5oyEZbOs44KyPy81M96KGwOslCsPvJLl9+wOal1QzZePWbjcLv/9zKSJvXLM4RIF/uWu78AsBRX5L5pQRzrDLy3pxbqFw29NPJJ+n8WCOJF+EjL7QJTo0P03G8wA3NRcX/Ga7H6K2T/oEm4NpgaDHEmeIQyQO+1khC5if9uRWRJhwoGTQ0zLDV4DaimL8tzB60ipaysc4kRSB1e0fWmws72rTO3OEBrkhlqOiaS0b49znVCLVluhAlMVPRy58+SuIpcz70wQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=9XqFQ5N4hdZvTmCxXvj7LJzz3/WM8Q7zyyoumoQhe9o=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=VU4FOsSR
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH v2] package/agec: new package
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

Encryption is silently broken for files <35 bytes, so add a patch submitted
upstream to fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
Changes since v1:
- Add patch submitted upstream fixing encryption of files <35 bytes
- Add runtime test

 DEVELOPERS                                    |  2 +
 package/Config.in                             |  1 +
 ...mor-do-not-set-eof-for-35-byte-files.patch | 35 +++++++++++
 package/agec/Config.in                        | 10 +++
 package/agec/agec.hash                        |  3 +
 package/agec/agec.mk                          | 24 ++++++++
 support/testing/tests/package/test_agec.py    | 61 +++++++++++++++++++
 7 files changed, 136 insertions(+)
 create mode 100644 package/agec/0001-io.c-isarmor-do-not-set-eof-for-35-byte-files.patch
 create mode 100644 package/agec/Config.in
 create mode 100644 package/agec/agec.hash
 create mode 100644 package/agec/agec.mk
 create mode 100644 support/testing/tests/package/test_agec.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d591c62805..7bc4768ca7 100644
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
@@ -2681,6 +2682,7 @@ F:	package/triggerhappy/
 F:	package/ugetty/
 F:	package/wireguard-linux-compat/
 F:	package/wireguard-tools/
+F:	support/testing/tests/package/test_agec.py
 F:	support/testing/tests/package/test_docker_compose.py
 F:	support/testing/tests/package/test_python_hid.py
 
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
diff --git a/package/agec/0001-io.c-isarmor-do-not-set-eof-for-35-byte-files.patch b/package/agec/0001-io.c-isarmor-do-not-set-eof-for-35-byte-files.patch
new file mode 100644
index 0000000000..fa4af2a9c0
--- /dev/null
+++ b/package/agec/0001-io.c-isarmor-do-not-set-eof-for-35-byte-files.patch
@@ -0,0 +1,35 @@
+From eb8ccfe5bb32273226d80236caab7a9386d71071 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Thu, 18 Jun 2026 15:12:38 +0200
+Subject: [PATCH] io.c: isarmor(): do not set eof for <35 byte files
+
+Encryption is silently broken for <35 byte files since commit b374d8de5a
+("stop reading after first EOF"), as readall() sets the eof flag when it was
+unable to read the entire 35 bytes in isarmor(), causing bread() to return
+EOF and ignore the <35 bytes already read.
+
+Fix it by only setting the eof flag in isarmor() if nothing could be read.
+
+Upstream: mailed to amin@firemail.cc
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ io.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/io.c b/io.c
+index 15ed4f7..2773022 100644
+--- a/io.c
++++ b/io.c
+@@ -128,8 +128,7 @@ isarmor(Ibuf *b)
+ 	nr = readall(b->fd, b->buf, sizeof(armorfirst) - 1, &b->eof);
+ 	if(nr == -1)
+ 		return -1;
+-	if(nr == 0)
+-		b->eof = 1;
++	b->eof = (nr == 0);
+ 	b->size = nr;
+ 	if((usize)nr < sizeof(armorfirst) - 1)
+ 		return 0;
+-- 
+2.47.3
+
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
diff --git a/support/testing/tests/package/test_agec.py b/support/testing/tests/package/test_agec.py
new file mode 100644
index 0000000000..7f43e60b1f
--- /dev/null
+++ b/support/testing/tests/package/test_agec.py
@@ -0,0 +1,61 @@
+import os
+
+import infra.basetest
+
+
+class TestAgec(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
+    BR2_PACKAGE_AGEC=y
+    BR2_TARGET_ROOTFS_CPIO=y
+    """
+
+    # generate keypair in file and return pubkey
+    def generate_keypair(self, filename):
+        self.assertRunOk(f"agec-keygen > {filename}")
+
+        output, exit_code = self.emulator.run(f"agec-keygen -y < {filename}")
+        self.assertEqual(exit_code, 0)
+        pubkey = output[0].strip()
+        self.assertNotEqual(pubkey, "")
+        return pubkey
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We define two keypairs
+        key1 = "/tmp/key1.txt"
+        key2 = "/tmp/key2.txt"
+
+        # And files to work on
+        orig_file = "/bin/busybox"
+        decrypted_file = "/tmp/busybox"
+        encrypted_file = decrypted_file + ".age"
+
+        # should output a valid looking keypair to stdout
+        output, exit_code = self.emulator.run("agec-keygen")
+        self.assertEqual(exit_code, 0)
+        self.assertIn("public key:", output[0])
+        self.assertIn("AGE-SECRET-KEY-", output[1])
+
+        # generate keypairs and extract pubkeys
+        pubkey1 = self.generate_keypair(key1)
+        pubkey2 = self.generate_keypair(key2)
+
+        # encrypt file
+        self.assertRunOk(f"agec -r {pubkey1} {orig_file} > {encrypted_file}")
+
+        # should be encrypted
+        self.assertRunNotOk(f"cmp {orig_file} {encrypted_file}")
+
+        # should be decryptable with key1
+        self.assertRunOk(f"agec -d -i {key1} {encrypted_file} > {decrypted_file}")
+
+        # and equal to original
+        self.assertRunOk(f"cmp {orig_file} {decrypted_file} ")
+
+        # should NOT be decryptable with key2
+        self.assertRunNotOk(f"agec -d -i {key2} {encrypted_file} > {decrypted_file}")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
