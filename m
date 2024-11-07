Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4FBD5D695
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 23:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8DCE815AD;
	Thu,  7 Nov 2024 23:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EP-qOgU2hyRb; Thu,  7 Nov 2024 23:15:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6715181396
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6715181396;
	Thu,  7 Nov 2024 23:15:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 045D9C1
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 23:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8A2A81395
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 23:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HdsY3BJQmXH for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 23:15:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2505D81396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2505D81396
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2505D81396
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 23:15:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 07704B0055E;
 Fri,  8 Nov 2024 00:15:02 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40704])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Nov 2024 00:15:02 +0100
MIME-Version: 1.0
Date: Fri, 08 Nov 2024 00:15:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241106223806.3101627-1-romain.naour@smile.fr>
References: <20241106223806.3101627-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <6986b824cb7f67740b6e035997783451@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731021304;
 bh=8XgIk9chzzLCpOXvuLPc6iyMR9MlIk9WLe/4MXEduF4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eYTqewDtHA/sUqBw6VfE7QDTBqjL6orE20sn4ayKb2fnnNO/M1eIzxb27YlvThrOu
 2sqikGYlxUvc0A/hX6BofcKLivxRCAjuGwe0xqgjKFR99qs8p0QE1XsE/1yNFMqiPG
 nCJlIjtzQcMGENtGFEmXZXFEGZtJKHULbriEryYZbFrHQty+hJSGWcVtjeVbGVYYxv
 xvGBnlt7jaymjh9cb5a/pl81JyyoVTB5EH2kZ5KviS7X2nwdlwjMVPQ09gMFpIvh8q
 k51HxPWotfsUZEs1xjO/ct3DdJtTXgKP3IkkPSP0b9l2WSxKsOu9rZTl3Ufu7EfSnE
 4Fay+K9ArSO+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eYTqewDt
Subject: Re: [Buildroot] [PATCH] support/testing/{test_edk2, test_grub,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 06/11/2024 23:38, Romain Naour via buildroot wrote:
> All EDK2 releases <= edk2-stable202408 can't be fetched from git
> anymore due to a missing git submodule as reported by [1].
> 
> Usually Buildroot fall-back using https://sources.buildroot.net thanks
> to BR2_BACKUP_SITE where a backup of the generated archive is
> available. But the BRConfigTest remove BR2_BACKUP_SITE default value
> while generating the .config used by runtime tests.
> 
> Replace the BR2_BACKUP_SITE override from BRConfigTest in order to
> continue testing EDK2 package using the usual backup site.
> 
> This workaround needs to be removed with the next EDK2 version bump
> using this commit [2].
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995977 
> (TestGrubX8664EFI)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995962 
> (TestGrubi386EFI)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995455 (TestFwts)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995427 
> (TestIso9660Grub2Hybrid)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995416 
> (TestIso9660Grub2EFI)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8258992621 (TestEdk2)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8258990697 
> (TestGrubAArch64EFI)
> 
> [1] https://github.com/tianocore/edk2/issues/6398
> [2] 
> https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.

> ---
>  support/testing/tests/boot/test_edk2.py    | 22 ++++++++
>  support/testing/tests/boot/test_grub.py    | 66 ++++++++++++++++++++++
>  support/testing/tests/fs/test_iso9660.py   | 44 +++++++++++++++
>  support/testing/tests/package/test_fwts.py | 22 ++++++++
>  4 files changed, 154 insertions(+)
> 
> diff --git a/support/testing/tests/boot/test_edk2.py 
> b/support/testing/tests/boot/test_edk2.py
> index e6b7855284..39d7a4dbcc 100644
> --- a/support/testing/tests/boot/test_edk2.py
> +++ b/support/testing/tests/boot/test_edk2.py
> @@ -35,6 +35,28 @@ class TestEdk2(infra.basetest.BRTest):
>          BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
>          """
> 
> +    def __init__(self, names):
> +        """Setup common test variables."""
> +        super(TestEdk2, self).__init__(names)
> +        """All EDK2 releases <= edk2-stable202408 can't be fetched 
> from git
> +           anymore due to a missing git submodule as reported by [1].
> +
> +           Usually Buildroot fall-back using 
> https://sources.buildroot.net
> +           thanks to BR2_BACKUP_SITE where a backup of the generated 
> archive
> +           is available. But the BRConfigTest remove BR2_BACKUP_SITE 
> default
> +           value while generating the .config used by TestEdk2.
> +
> +           Replace the BR2_BACKUP_SITE override from BRConfigTest in 
> order
> +           to continue testing EDK2 package using the usual backup 
> site.
> +
> +           To be removed with the next EDK2 version bump using this 
> commit
> +           [2].
> +
> +           [1] https://github.com/tianocore/edk2/issues/6398
> +           [2] 
> https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
> +        """
> +        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
> +
>      def test_run(self):
>          hda = os.path.join(self.builddir, "images", "disk.img")
>          flash0 = os.path.join(self.builddir, "images", 
> "SBSA_FLASH0.fd")
> diff --git a/support/testing/tests/boot/test_grub.py 
> b/support/testing/tests/boot/test_grub.py
> index c753a16c34..c6e86f7b71 100644
> --- a/support/testing/tests/boot/test_grub.py
> +++ b/support/testing/tests/boot/test_grub.py
> @@ -58,6 +58,28 @@ class TestGrubi386EFI(infra.basetest.BRTest):
>          BR2_PACKAGE_HOST_DOSFSTOOLS=y
>          
> """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
> 
> +    def __init__(self, names):
> +        """Setup common test variables."""
> +        super(TestGrubi386EFI, self).__init__(names)
> +        """All EDK2 releases <= edk2-stable202408 can't be fetched 
> from git
> +           anymore due to a missing git submodule as reported by [1].
> +
> +           Usually Buildroot fall-back using 
> https://sources.buildroot.net
> +           thanks to BR2_BACKUP_SITE where a backup of the generated 
> archive
> +           is available. But the BRConfigTest remove BR2_BACKUP_SITE 
> default
> +           value while generating the .config used by TestGrubi386EFI.
> +
> +           Replace the BR2_BACKUP_SITE override from BRConfigTest in 
> order
> +           to continue testing EDK2 package using the usual backup 
> site.
> +
> +           To be removed with the next EDK2 version bump using this 
> commit
> +           [2].
> +
> +           [1] https://github.com/tianocore/edk2/issues/6398
> +           [2] 
> https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
> +        """
> +        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
> +
>      def test_run(self):
>          hda = os.path.join(self.builddir, "images", "disk.img")
>          bios = os.path.join(self.builddir, "images", "OVMF.fd")
> @@ -109,6 +131,28 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
>          BR2_PACKAGE_HOST_DOSFSTOOLS=y
>          
> """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
> 
> +    def __init__(self, names):
> +        """Setup common test variables."""
> +        super(TestGrubX8664EFI, self).__init__(names)
> +        """All EDK2 releases <= edk2-stable202408 can't be fetched 
> from git
> +           anymore due to a missing git submodule as reported by [1].
> +
> +           Usually Buildroot fall-back using 
> https://sources.buildroot.net
> +           thanks to BR2_BACKUP_SITE where a backup of the generated 
> archive
> +           is available. But the BRConfigTest remove BR2_BACKUP_SITE 
> default
> +           value while generating the .config used by 
> TestGrubX8664EFI.
> +
> +           Replace the BR2_BACKUP_SITE override from BRConfigTest in 
> order
> +           to continue testing EDK2 package using the usual backup 
> site.
> +
> +           To be removed with the next EDK2 version bump using this 
> commit
> +           [2].
> +
> +           [1] https://github.com/tianocore/edk2/issues/6398
> +           [2] 
> https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
> +        """
> +        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
> +
>      def test_run(self):
>          hda = os.path.join(self.builddir, "images", "disk.img")
>          bios = os.path.join(self.builddir, "images", "OVMF.fd")
> @@ -158,6 +202,28 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
>          
> """.format(post_image=infra.filepath("tests/boot/test_grub/post-image-aarch64-efi.sh"),
>                     
> linux_fragment=infra.filepath("tests/boot/test_grub/linux-aarch64-efi.config"))
> 
> +    def __init__(self, names):
> +        """Setup common test variables."""
> +        super(TestGrubAArch64EFI, self).__init__(names)
> +        """All EDK2 releases <= edk2-stable202408 can't be fetched 
> from git
> +           anymore due to a missing git submodule as reported by [1].
> +
> +           Usually Buildroot fall-back using 
> https://sources.buildroot.net
> +           thanks to BR2_BACKUP_SITE where a backup of the generated 
> archive
> +           is available. But the BRConfigTest remove BR2_BACKUP_SITE 
> default
> +           value while generating the .config used by 
> TestGrubAArch64EFI.
> +
> +           Replace the BR2_BACKUP_SITE override from BRConfigTest in 
> order
> +           to continue testing EDK2 package using the usual backup 
> site.
> +
> +           To be removed with the next EDK2 version bump using this 
> commit
> +           [2].
> +
> +           [1] https://github.com/tianocore/edk2/issues/6398
> +           [2] 
> https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
> +        """
> +        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
> +
>      def test_run(self):
>          hda = os.path.join(self.builddir, "images", "disk.img")
>          bios = os.path.join(self.builddir, "images", "QEMU_EFI.fd")
> diff --git a/support/testing/tests/fs/test_iso9660.py 
> b/support/testing/tests/fs/test_iso9660.py
> index 3d08f2e895..6f8ca06de3 100644
> --- a/support/testing/tests/fs/test_iso9660.py
> +++ b/support/testing/tests/fs/test_iso9660.py
> @@ -135,6 +135,28 @@ class TestIso9660Grub2EFI(infra.basetest.BRTest):
>          """.format(infra.filepath("conf/grub2-efi.cfg"),
>                     infra.filepath("conf/grub2.cfg"))
> 
> +    def __init__(self, names):
> +        """Setup common test variables."""
> +        super(TestIso9660Grub2EFI, self).__init__(names)
> +        """All EDK2 releases <= edk2-stable202408 can't be fetched 
> from git
> +           anymore due to a missing git submodule as reported by [1].
> +
> +           Usually Buildroot fall-back using 
> https://sources.buildroot.net
> +           thanks to BR2_BACKUP_SITE where a backup of the generated 
> archive
> +           is available. But the BRConfigTest remove BR2_BACKUP_SITE 
> default
> +           value while generating the .config used by 
> TestIso9660Grub2EFI.
> +
> +           Replace the BR2_BACKUP_SITE override from BRConfigTest in 
> order
> +           to continue testing EDK2 package using the usual backup 
> site.
> +
> +           To be removed with the next EDK2 version bump using this 
> commit
> +           [2].
> +
> +           [1] https://github.com/tianocore/edk2/issues/6398
> +           [2] 
> https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
> +        """
> +        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
> +
>      def test_run(self):
>          exit_code = test_mount_internal_external(self.emulator,
>                                                   self.builddir, 
> internal=True,
> @@ -163,6 +185,28 @@ class 
> TestIso9660Grub2Hybrid(infra.basetest.BRTest):
>          """.format(infra.filepath("conf/grub2-efi.cfg"),
>                     infra.filepath("conf/grub2.cfg"))
> 
> +    def __init__(self, names):
> +        """Setup common test variables."""
> +        super(TestIso9660Grub2Hybrid, self).__init__(names)
> +        """All EDK2 releases <= edk2-stable202408 can't be fetched 
> from git
> +           anymore due to a missing git submodule as reported by [1].
> +
> +           Usually Buildroot fall-back using 
> https://sources.buildroot.net
> +           thanks to BR2_BACKUP_SITE where a backup of the generated 
> archive
> +           is available. But the BRConfigTest remove BR2_BACKUP_SITE 
> default
> +           value while generating the .config used by 
> TestIso9660Grub2Hybrid.
> +
> +           Replace the BR2_BACKUP_SITE override from BRConfigTest in 
> order
> +           to continue testing EDK2 package using the usual backup 
> site.
> +
> +           To be removed with the next EDK2 version bump using this 
> commit
> +           [2].
> +
> +           [1] https://github.com/tianocore/edk2/issues/6398
> +           [2] 
> https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
> +        """
> +        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
> +
>      def test_run(self):
>          exit_code = test_mount_internal_external(self.emulator,
>                                                   self.builddir, 
> internal=True,
> diff --git a/support/testing/tests/package/test_fwts.py 
> b/support/testing/tests/package/test_fwts.py
> index 5b79a17e33..6e2b6f50ba 100644
> --- a/support/testing/tests/package/test_fwts.py
> +++ b/support/testing/tests/package/test_fwts.py
> @@ -38,6 +38,28 @@ class TestFwts(infra.basetest.BRTest):
>          BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
>          """
> 
> +    def __init__(self, names):
> +        """Setup common test variables."""
> +        super(TestFwts, self).__init__(names)
> +        """All EDK2 releases <= edk2-stable202408 can't be fetched 
> from git
> +           anymore due to a missing git submodule as reported by [1].
> +
> +           Usually Buildroot fall-back using 
> https://sources.buildroot.net
> +           thanks to BR2_BACKUP_SITE where a backup of the generated 
> archive
> +           is available. But the BRConfigTest remove BR2_BACKUP_SITE 
> default
> +           value while generating the .config used by TestFwts.
> +
> +           Replace the BR2_BACKUP_SITE override from BRConfigTest in 
> order
> +           to continue testing EDK2 package using the usual backup 
> site.
> +
> +           To be removed with the next EDK2 version bump using this 
> commit
> +           [2].
> +
> +           [1] https://github.com/tianocore/edk2/issues/6398
> +           [2] 
> https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
> +        """
> +        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
> +
>      def test_run(self):
>          hda = os.path.join(self.builddir, "images", "disk.img")
>          flash0 = os.path.join(self.builddir, "images", 
> "SBSA_FLASH0.fd")
> --
> 2.45.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
