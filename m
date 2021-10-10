Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CC9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:43:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D56F60F24
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D56F60F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44CE4606B4;
	Sun, 10 Oct 2021 17:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pLoay_iJVJyW; Sun, 10 Oct 2021 17:43:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A2B760669;
	Sun, 10 Oct 2021 17:43:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC87E1BF3C2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A812640438
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uaZs5WVTffib for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 17:43:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A074A40437
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 17:43:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:74c0:e1ec:fabc:9152])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 85C7219F4EA;
 Sun, 10 Oct 2021 19:43:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633887797;
 bh=PD1ljbx9MPkQ31CUdTbpYqPEQInDlk7Lglbu/6HvTf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uku9oW8jf/jonNQw7VBNbYZ7CTMZit7CrclA/i7WDA93+CKM0z+Huovboytk1UNns
 2Z6fM/1PsPqTsKSc1am1s83yyGWCS1jPOd3EynR1qgfZihSWGcz7x/ihAjtDePo9SV
 IKuQ17AT8nXmXnPYyrLMPc4fcl+yO1vLgMShjqZ36hsNuKL6CkkDl0aSvXCw6OuLn6
 d1iuG+4WQYQNeh2WjC1IK3fk0MABmSAEcaDXYX8K2dU7iawK0LZtUyqMXnTwB2RysV
 t0X1LttUl0j6T67e297NBHMxvYTYWIXTyXRJEMxkiuU1aeNImylZrKmkRPGiCxL8Th
 Hsq8gP7aqLV8g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 10 Oct 2021 19:43:09 +0200
Date: Sun, 10 Oct 2021 19:43:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211010174309.GO2081069@scaer>
References: <20211009191646.1076266-1-thomas.petazzoni@bootlin.com>
 <20211009191646.1076266-6-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211009191646.1076266-6-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 5/5] support/testing: add suite of tests for
 gdb
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Michael Fischer <mf@go-sys.de>, Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-10-09 21:16 +0200, Thomas Petazzoni spake thusly:
> The list of tests is as follows:
> 
> TestGdbHostOnlyDefault: build just minimal host-gdb, default version
> 
> TestGdbHostOnlyAllFeatures: build host-gdb, default version, with all
> features enabled (TUI, Python, simulator)
> 
> TestGdbserverOnly: build just target gdbserver, default version
> 
> TestGdbFullTarget: build just target gdb, default version
> 
> TestGdbHostOnly9x: build minimal host-gdb, 9.x version
> 
> TestGdbHostGdbserver9x: build minimal host-gdb 9.x + gdbserver
> 
> TestGdbHostGdbTarget9x: build minimal host-gdb 9.x + full gdb
> 
> TestGdbHostOnly11x: build minimal host-gdb, 11.x version
> 
> TestGdbHostGdbserver11x: build minimal host-gdb 11.x + gdbserver
> 
> TestGdbHostGdbTarget11x: build minimal host-gdb 11.x + gdb
> 
> TestGdbArc: build minimal host-gdb + gdb + gdbserver, for the special
> ARC architecture version
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/test_gdb.py | 215 ++++++++++++++++++++++
>  1 file changed, 215 insertions(+)
>  create mode 100644 support/testing/tests/package/test_gdb.py
> 
> diff --git a/support/testing/tests/package/test_gdb.py b/support/testing/tests/package/test_gdb.py
> new file mode 100644
> index 0000000000..a7b0870644
> --- /dev/null
> +++ b/support/testing/tests/package/test_gdb.py
> @@ -0,0 +1,215 @@
> +import os
> +import infra.basetest
> +
> +
> +class BaseGdb(infra.basetest.BRTest):
> +    def verify_host_gdb(self, prefix="arm-linux"):
> +        cmd = ["host/bin/%s-gdb" % prefix, "--version"]
> +        # We don't check the return value, as it automatically raises
> +        # an exception if the command returns with a non-zero value
> +        infra.run_cmd_on_host(self.builddir, cmd)
> +
> +    def boot(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", img,
> +                                    "-net", "nic",
> +                                    "-net", "user"])
> +        self.emulator.login()
> +
> +    def verify_gdbserver(self):
> +        cmd = "gdbserver --version"
> +        self.assertRunOk(cmd)
> +
> +    def verify_gdb(self):
> +        cmd = "gdb --version"
> +        self.assertRunOk(cmd)
> +
> +
> +class TestGdbHostOnlyDefault(BaseGdb):
> +    config = \
> +        infra.basetest.MINIMAL_CONFIG + \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_PACKAGE_HOST_GDB=y
> +        """
> +
> +    def test_run(self):
> +        self.verify_host_gdb()
> +
> +
> +class TestGdbHostOnlyAllFeatures(BaseGdb):
> +    config = \
> +        infra.basetest.MINIMAL_CONFIG + \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_PACKAGE_HOST_GDB=y
> +        BR2_PACKAGE_HOST_GDB_TUI=y
> +        BR2_PACKAGE_HOST_GDB_PYTHON3=y
> +        BR2_PACKAGE_HOST_GDB_SIM=y
> +        """
> +
> +    def test_run(self):
> +        self.verify_host_gdb()
> +
> +
> +class TestGdbserverOnly(BaseGdb):
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_PACKAGE_GDB=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        self.boot()
> +        self.verify_gdbserver()
> +
> +
> +class TestGdbFullTarget(BaseGdb):
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_PACKAGE_GDB=y
> +        BR2_PACKAGE_GDB_DEBUGGER=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        self.boot()
> +        self.verify_gdb()
> +
> +
> +class TestGdbHostOnly9x(BaseGdb):
> +    config = \
> +        infra.basetest.MINIMAL_CONFIG + \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_PACKAGE_HOST_GDB=y
> +        BR2_GDB_VERSION_9_2=y
> +        """
> +
> +    def test_run(self):
> +        self.verify_host_gdb()
> +
> +
> +class TestGdbHostGdbserver9x(BaseGdb):
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_PACKAGE_HOST_GDB=y
> +        BR2_GDB_VERSION_9_2=y
> +        BR2_PACKAGE_GDB=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        self.verify_host_gdb()
> +        self.boot()
> +        self.verify_gdbserver()
> +
> +
> +class TestGdbHostGdbTarget9x(BaseGdb):
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_PACKAGE_HOST_GDB=y
> +        BR2_GDB_VERSION_9_2=y
> +        BR2_PACKAGE_GDB=y
> +        BR2_PACKAGE_GDB_DEBUGGER=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        self.verify_host_gdb()
> +        self.boot()
> +        self.verify_gdb()
> +
> +
> +class TestGdbHostOnly11x(BaseGdb):
> +    config = \
> +        infra.basetest.MINIMAL_CONFIG + \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_PACKAGE_HOST_GDB=y
> +        BR2_GDB_VERSION_11=y
> +        """
> +
> +    def test_run(self):
> +        self.verify_host_gdb()
> +
> +
> +class TestGdbHostGdbserver11x(BaseGdb):
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_PACKAGE_HOST_GDB=y
> +        BR2_GDB_VERSION_11=y
> +        BR2_PACKAGE_GDB=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        self.verify_host_gdb()
> +        self.boot()
> +        self.verify_gdbserver()
> +
> +
> +class TestGdbHostGdbTarget11x(BaseGdb):
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_PACKAGE_HOST_GDB=y
> +        BR2_GDB_VERSION_11=y
> +        BR2_PACKAGE_GDB=y
> +        BR2_PACKAGE_GDB_DEBUGGER=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        self.verify_host_gdb()
> +        self.boot()
> +        self.verify_gdb()
> +
> +
> +class TestGdbArc(BaseGdb):
> +    config = \
> +        """
> +        BR2_arcle=y
> +        BR2_archs4x_rel31=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_PACKAGE_HOST_GDB=y
> +        BR2_PACKAGE_GDB=y
> +        BR2_PACKAGE_GDB_SERVER=y
> +        BR2_PACKAGE_GDB_DEBUGGER=y
> +        """
> +
> +    def test_run(self):
> +        self.verify_host_gdb("arc-linux")
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
