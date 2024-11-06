Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65458D59F7D
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 22:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AF226000A;
	Wed,  6 Nov 2024 22:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQ_P1QDehAUK; Wed,  6 Nov 2024 22:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95E796065F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95E796065F;
	Wed,  6 Nov 2024 22:38:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E19912807
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF5466065F
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tattd111P1o for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 22:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB9356065E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB9356065E
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB9356065E
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:38:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43152b79d25so3010705e9.1
 for <buildroot@buildroot.org>; Wed, 06 Nov 2024 14:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730932690; x=1731537490;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ElO/Xl2yw5S5KS/pMfEVh3eO0Yb00ycz+RSg9gPdOSE=;
 b=l+SG9EQdWCGX1S4ED5EZtUfZAfx9WQJ1rxgsUT4EJfSA4Uh5kVl60pJrKZm2VFeAq4
 /hD0qDLsTMq5TipshLN4eBhKIT6m9Srq72UGFhX1HKNVvW6vg3LgZfDVAZTXPoMZBB7s
 hwsVO23EDeHLo/QJhfKWWFDEQNYpEPxGVYHhMxUcuvKpBe+fc6xRAY+KyGxd0gHG5KhB
 osaybG+rfx/OMWKqxTaxRXozKzln1W9V0FShG8F2q6+vp6GNgvbgBcZHqfVRFF8bT1ZY
 ifAw63sHGwucrd1y9x0G6yWbPu4gSsv0yO8B3Fr7IbZUWT5Dn2OMsmDbMlt+dLcM813V
 80eg==
X-Gm-Message-State: AOJu0YyNPj8d9HrBkd4FZDva9wnmiaNBkr8/F6LqycT4Pg4J7oZ+WXc6
 TadPYkNPVsu9Uh9yBJnGjx3vYMvSJcNbwkPXsFRh24CcOC2y/nMji4FslXRu7VV8zKIj249gUv/
 0
X-Google-Smtp-Source: AGHT+IH7X41mXEBP5+5LZLT9IgJze4vvy2oZsYrVQ7hA8tllxCOAReyhPyCN2rmw8nZEp/wba9IPXA==
X-Received: by 2002:a05:600c:3b9c:b0:431:5ce4:bcf0 with SMTP id
 5b1f17b1804b1-4327b6fd1b9mr203043025e9.15.1730932689690; 
 Wed, 06 Nov 2024 14:38:09 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b053051fsm2001405e9.6.2024.11.06.14.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 14:38:09 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed,  6 Nov 2024 23:38:06 +0100
Message-ID: <20241106223806.3101627-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730932690; x=1731537490; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ElO/Xl2yw5S5KS/pMfEVh3eO0Yb00ycz+RSg9gPdOSE=;
 b=uwH4EdkHye2MHaj6Z2brLD65QKZp178HZpjUukvrQb5wL4RQNrOPSu7UxWUFdsIQJh
 Jk7int5wgBRPY2HaOsQ1yPXbqEdCrGHZ4h+OaOSurB+9qh6dnUUlaw8nEcH/iDVdcnXR
 N+nPUFwnoVza1I7ol+QetdGWBZItVis4VYzIQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=uwH4EdkH
Subject: [Buildroot] [PATCH] support/testing/{test_edk2, test_grub,
 test_iso9660, test_fwts}: fix edk2 download
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

All EDK2 releases <= edk2-stable202408 can't be fetched from git
anymore due to a missing git submodule as reported by [1].

Usually Buildroot fall-back using https://sources.buildroot.net thanks
to BR2_BACKUP_SITE where a backup of the generated archive is
available. But the BRConfigTest remove BR2_BACKUP_SITE default value
while generating the .config used by runtime tests.

Replace the BR2_BACKUP_SITE override from BRConfigTest in order to
continue testing EDK2 package using the usual backup site.

This workaround needs to be removed with the next EDK2 version bump
using this commit [2].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995977 (TestGrubX8664EFI)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995962 (TestGrubi386EFI)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995455 (TestFwts)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995427 (TestIso9660Grub2Hybrid)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995416 (TestIso9660Grub2EFI)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8258992621 (TestEdk2)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8258990697 (TestGrubAArch64EFI)

[1] https://github.com/tianocore/edk2/issues/6398
[2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/boot/test_edk2.py    | 22 ++++++++
 support/testing/tests/boot/test_grub.py    | 66 ++++++++++++++++++++++
 support/testing/tests/fs/test_iso9660.py   | 44 +++++++++++++++
 support/testing/tests/package/test_fwts.py | 22 ++++++++
 4 files changed, 154 insertions(+)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index e6b7855284..39d7a4dbcc 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -35,6 +35,28 @@ class TestEdk2(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
         """
 
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestEdk2, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestEdk2.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         flash0 = os.path.join(self.builddir, "images", "SBSA_FLASH0.fd")
diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index c753a16c34..c6e86f7b71 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -58,6 +58,28 @@ class TestGrubi386EFI(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_DOSFSTOOLS=y
         """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
 
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestGrubi386EFI, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestGrubi386EFI.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "OVMF.fd")
@@ -109,6 +131,28 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_DOSFSTOOLS=y
         """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
 
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestGrubX8664EFI, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestGrubX8664EFI.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "OVMF.fd")
@@ -158,6 +202,28 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
         """.format(post_image=infra.filepath("tests/boot/test_grub/post-image-aarch64-efi.sh"),
                    linux_fragment=infra.filepath("tests/boot/test_grub/linux-aarch64-efi.config"))
 
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestGrubAArch64EFI, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestGrubAArch64EFI.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "QEMU_EFI.fd")
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 3d08f2e895..6f8ca06de3 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -135,6 +135,28 @@ class TestIso9660Grub2EFI(infra.basetest.BRTest):
         """.format(infra.filepath("conf/grub2-efi.cfg"),
                    infra.filepath("conf/grub2.cfg"))
 
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestIso9660Grub2EFI, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestIso9660Grub2EFI.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
     def test_run(self):
         exit_code = test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=True,
@@ -163,6 +185,28 @@ class TestIso9660Grub2Hybrid(infra.basetest.BRTest):
         """.format(infra.filepath("conf/grub2-efi.cfg"),
                    infra.filepath("conf/grub2.cfg"))
 
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestIso9660Grub2Hybrid, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestIso9660Grub2Hybrid.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
     def test_run(self):
         exit_code = test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=True,
diff --git a/support/testing/tests/package/test_fwts.py b/support/testing/tests/package/test_fwts.py
index 5b79a17e33..6e2b6f50ba 100644
--- a/support/testing/tests/package/test_fwts.py
+++ b/support/testing/tests/package/test_fwts.py
@@ -38,6 +38,28 @@ class TestFwts(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
         """
 
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestFwts, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestFwts.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         flash0 = os.path.join(self.builddir, "images", "SBSA_FLASH0.fd")
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
