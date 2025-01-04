Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C568DE77188
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 18:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38F58607BC;
	Sat,  4 Jan 2025 18:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXwfVCHIqGqC; Sat,  4 Jan 2025 18:00:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C56056074D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C56056074D;
	Sat,  4 Jan 2025 18:00:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3229F27
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84C1B810C6
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tb8h23Xr7TI2 for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 17:59:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0193A80EC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0193A80EC3
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0193A80EC3
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:52 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so148943685e9.1
 for <buildroot@buildroot.org>; Sat, 04 Jan 2025 09:59:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736013591; x=1736618391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ppEmm6eXKsgi7CU3JkvnS6LFBBXPF3XA/YQAqtABwKs=;
 b=PlBAh73OgG6mFu3yRmnLTgdvNwC9mMUnV38VlGGLExqkuR1Lt2ENXMU7tUmcSNIfgq
 1qwnLwimLUUsGEfIUiO9zg4uwEHuBkTO3qG1U7PgIdWfJ7KCF1jC/LgWV47zZFDt+VJ+
 47dzb2QgqXAWQKGgZsqizsXXtQu2n4CfJKtqcwKTE8mm1NFhznz+12D+FkOui+yAJrR5
 s62JyRlANs93Os/gRU79HTJHnLmmX98WFXWEFQjyUwZIPwCdB6zGTjWaMa9x2DEPOQx6
 5mcgwNsj5XeDtStNAIts7mRD5FdR9qFSTczomxGeuDbklEuO4c/X9qr72FLHqdEzTa0h
 CkFA==
X-Gm-Message-State: AOJu0YynRGvJjkpPbL+yL9ScuDhNFhzh65K0bBpfgg0rSs3yasZou62k
 x46pF0qiZGtKMOCPq/O13EmtzHj8A/HwWbamOywwUKwIZD6Q4fJfoxIQ/VkjZB0z2phJP0tzLRQ
 e
X-Gm-Gg: ASbGnctv0uYd2S/cWY+P/Bw6BWQjNtD7boqj4YLYBA/pjFY6RpbGqIoCldklFqRsLVX
 cWZB7ieDeEVrE2uMyGBwyRtVQAn/OMuYjYq+kgO4GmGNFClIR2zQ6Jo1xlVSgi7xmLOR9wSJzrA
 VwWmD1o63lDO1+nE+66+v/nRcoIwBNAyjuRDOTwlFaHMF7QfPRaQ9qvMyClWHy45v6T4T6+shQw
 fEmAMA31KSRRSjcRsZVm4cnNsHoyxZqkxQjCfHQOT6VVA2SU6Fm/62jc92SHD2kCGDYGUiLYoQu
 22mowOA9xQKYAvnl+HMDYUsKYdvVRC33hmdQqRmEC9alB24dALxsLA==
X-Google-Smtp-Source: AGHT+IHsXHE6MjxDdLBWzRL6PblTKcyqFSV4x79PjznB2MUkUPI5Yj+520dmaIllUuPw5uAO9IZggw==
X-Received: by 2002:a5d:584f:0:b0:385:ea2b:12cc with SMTP id
 ffacd0b85a97d-38a221ea286mr44016709f8f.13.1736013590882; 
 Sat, 04 Jan 2025 09:59:50 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828bd3sm43030487f8f.10.2025.01.04.09.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2025 09:59:50 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sat,  4 Jan 2025 18:59:45 +0100
Message-ID: <20250104175945.916723-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104175945.916723-1-romain.naour@smile.fr>
References: <20250104175945.916723-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736013591; x=1736618391; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ppEmm6eXKsgi7CU3JkvnS6LFBBXPF3XA/YQAqtABwKs=;
 b=W7DRqLThokiv24vxFc3yra/yPRQ/ldJwgSIFq7dzVcksKp7H82AGacUYwwaseUx7XN
 r6Rh1U+RQwN/MR3g6PSL2cn2mzUPik7OjU+A9PqqWQFseZLeFs2Vrpn5cdwvZ8vI9X8A
 GnJdkvbYl3vSf9+oquBfFLZvDaLyVGCGp82wk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=W7DRqLTh
Subject: [Buildroot] [PATCH 5/5] support/testing/{test_edk2, test_grub,
 test_iso9660, test_fwts}: remove edk2 download fix
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove the download fix introcuded by [1] now the edk2 git repository
has been fixed in version stable202411 [2].

[1] 47fc9e5509837260310cd7e41335fade29b587b1.
[2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/boot/test_edk2.py    | 22 ------
 support/testing/tests/boot/test_grub.py    | 88 ----------------------
 support/testing/tests/fs/test_iso9660.py   | 44 -----------
 support/testing/tests/package/test_fwts.py | 22 ------
 4 files changed, 176 deletions(-)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 6403aaa653..90583b56fe 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -36,28 +36,6 @@ class TestEdk2(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
         """
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestEdk2, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestEdk2.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         flash0 = os.path.join(self.builddir, "images", "SBSA_FLASH0.fd")
diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 5cbc7fd22b..37b7c06143 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -58,28 +58,6 @@ class TestGrubi386EFI(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_DOSFSTOOLS=y
         """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestGrubi386EFI, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestGrubi386EFI.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "OVMF.fd")
@@ -131,28 +109,6 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_DOSFSTOOLS=y
         """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestGrubX8664EFI, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestGrubX8664EFI.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "OVMF.fd")
@@ -202,28 +158,6 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
         """.format(post_image=infra.filepath("tests/boot/test_grub/post-image-aarch64-efi.sh"),
                    linux_fragment=infra.filepath("tests/boot/test_grub/linux-aarch64-efi.config"))
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestGrubAArch64EFI, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestGrubAArch64EFI.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "QEMU_EFI.fd")
@@ -270,28 +204,6 @@ class TestGrubRiscV64EFI(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
         """
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestGrubRiscV64EFI, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestGrubAArch64EFI.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         disk = os.path.join(self.builddir, "images", "disk.img")
         flash0 = os.path.join(self.builddir, "images", "RISCV_VIRT_CODE.fd")
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 6f8ca06de3..3d08f2e895 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -135,28 +135,6 @@ class TestIso9660Grub2EFI(infra.basetest.BRTest):
         """.format(infra.filepath("conf/grub2-efi.cfg"),
                    infra.filepath("conf/grub2.cfg"))
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestIso9660Grub2EFI, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestIso9660Grub2EFI.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         exit_code = test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=True,
@@ -185,28 +163,6 @@ class TestIso9660Grub2Hybrid(infra.basetest.BRTest):
         """.format(infra.filepath("conf/grub2-efi.cfg"),
                    infra.filepath("conf/grub2.cfg"))
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestIso9660Grub2Hybrid, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestIso9660Grub2Hybrid.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         exit_code = test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=True,
diff --git a/support/testing/tests/package/test_fwts.py b/support/testing/tests/package/test_fwts.py
index 4a9c412d94..e33adcaea4 100644
--- a/support/testing/tests/package/test_fwts.py
+++ b/support/testing/tests/package/test_fwts.py
@@ -39,28 +39,6 @@ class TestFwts(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
         """
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestFwts, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestFwts.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         flash0 = os.path.join(self.builddir, "images", "SBSA_FLASH0.fd")
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
