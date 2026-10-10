Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39ED4CA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06CAD40960;
	Sat, 10 Oct 2026 09:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HoOxFqsbC-5c; Sat, 10 Oct 2026 09:23:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EEE9440968
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624201;
	b=r9bPHV0vYxr6RL7g2hOTi8h6v+H4nksPtr6P+dE2Mbf+ByDlGRQ6bgm7FhRC1zimSu+Q
	 xuFIu7pulU1eoL4CFfmW7yT7dxvn6y4JuOL/iX7YdVidYIwDwOFw6K9JSR82pf8zLdmeG
	 J+ZUwa5XPoF67jI0LWwVTSZ8THdPAjicdHuSC9sGDLOKe52ev+lvFY0VbuAFuQo2Bj+RM
	 0LaTpyWmJFZkNNydjMl80du2flUILcHO0kTI+OEZp9v6VLCRU0/jPbIX8Y4wulhg9JDz8
	 zoXOL794XoouRwL9SwM3Qypp9VsFOYoVrySmF+3df+8iBRCK8b0Nql9o4ujhiLl85Vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624201;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0j+O9ThQ/duCcKK3p1kA1O/GgvexkVgoNownLmAXd5k=;
	b=IlrIhLNj9ZvAxwY+1Yn77FFGAnIjI7SDj7J0fefUmWSRVVRWPfVmjLDWh4YnSGIBvmIA
	 frPBa1oIc2bnjZTIcexYqM/qracRAQlkRWnWwE/SsY5Cf292MVoqaa6V15pxS2qxkW5Ek
	 ilX4LQDb3zTHced73xmvNfK2qnzZQQsAvWiv3xpCcsNhvppN7iqq5+AbqQxB2OecrHvzC
	 105oU5siyMzKRKftjqp58dcLXufvoprI9CZlPTgXImaPps7kBe9X8FabN1V3tOIc96wr6
	 sUTAZ3UESVZQReVbhKRG4y81d4jvfyGxIoO3JotgP10f505Oc1oVzYHbDlIqBc3IkKg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624201;
	bh=0j+O9ThQ/duCcKK3p1kA1O/GgvexkVgoNownLmAXd5k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=re8T6Ua+5gUD2LB6cf711LV92QxuIRJel0zCPmm5cO+vA8E0MF0JjxHI1ndrp+Hpv
	 WU3sNq/aLvutNjhHmlNvfbtoBBW2i/qOfV0jdjl79/Gqoz50Dt3luQ100y4ixYHnFQ
	 tUkKPsh34XGSumw4SyIBaeCQiHzTc94ATm7qPoZzeZEVOc1sAlqsPBlvJdFiCFo2gu
	 tv/UVZ4o4TUA7CId0gaYxq1l5VsOIZP5Afq9E5bPb7d4kD+wr7U6BkeQeZicguUet/
	 ujM0gGtub1GgTEIykDinhRUhAbgyy7EK1a1HMv0kajU/F7CKbVNSXRV2Co33BJZ9Pr
	 XL8SqqW8wbXJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEE9440968;
	Sat, 10 Oct 2026 09:23:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ADEE356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 707D081208
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLrf55yDQGDU for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2C0C7811DA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624194;
 b=AJx3Nd4wAUQLvn90CfXJhFi7P/oP/x7vaP06B0NCgWOG63zL9TnW1bQZVsMYuS8Pita/
 BGGqxUFmoEIDiz109U8zm9uRJoWJ6FvE91AP7G4PwnojWFKK0Mxoouup9WroKIySidrDP
 CrSaIvztnio5FXjb4M4v45OJc974dzZP3GNRIFToH8uTwmFGUJVSwW+SCO+gpobk4jyID
 xq6AZKREpCeO2/e3TC7gb6/caAh0F06dq5J/b9ciVj+0h7f3N3HVj+kWsZ7bmpDCZiKBK
 LVNhhIKWUtdD3pvmcHn1GZUif2GV1CRzsCDj8HXhZ/KseCT/BwECdStkX1aRIi6oxDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624194;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=hscOrVo6r2P1ukXLv2jrVmlNCn8lt1kgWPfCtbpnOIs=;
 b=dIjTOdVle4+bbXLTa+W7PjRYojjJwnhQOkUpPXH6Hu4ui2s+dGFT4MAyKxZNJhhQpwHm
 /UG5lgDMb+3iiAPdBpZ2nzxbJUuuqlZmCTKeKtOaujCCE/YKp4ej/MvlnP1tgacCFu3qi
 w6ph2OkWTGIYXoWAxEONftASLE0C/hQ0bh3gFj4cBLm+5htu13FbyuX2MIgr8r91MJGcu
 OwjcTEQv8q/pOmQe3ed8svptJQZ6f+rE9fPSHDgg1U+K350z73psJsSHrW93WVs1NdBa0
 O4EkF1dFRuCFIdBHwjCnwA9CX/PsO5GDqxy8SW4+8x5dspCiHoZicMdNzaEqf/YvTFg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ez5azsts; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C0C7811DA
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:13 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so4435825e9.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624192; x=1792228992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hscOrVo6r2P1ukXLv2jrVmlNCn8lt1kgWPfCtbpnOIs=;
 b=ixlpGPTF7dn7D42+Me1WIsVL8qfwOkMGK9YqEWNjyGf2qunAaadWJEh6wn+TiP7pHF
 bzpZwHXRxRyNFiWMDMhA06M8A+IA+CzAe/Q/wOiubJ2PS4PH2G8q2Kq5L0lpUmjDNB1o
 6M9XhVDDG5pUhhBi8IsU+F99zIcsf6KKfC4YSqeg4RColeLwzP4JlusdEaAOJFISxQsw
 fjGuo5n1h2yOcTEAbI8ZDHyTzWrKa2xDCJNSlF9Jb+7oH4RfX76S3l7zAP2G+XNX8zjK
 lh86eXt+7U9KI0kCvD3QQL9lz0SiLCATJPgK1E0DC7AK8VpAlJ3EHxX5TFmri5j7m25V
 ZeJg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzc9vidS/PSwvJfPS60nVgpc+iv2NnuycbR7DFMcvkx40FXIuD/k+z8wvL6WlaDCMb8xzrGXhj0ES4=@buildroot.org
X-Gm-Message-State: AFq9FYKr/DyAjEe30oKxWnrzkpVOXWLbfHVackQMj2+i+JX+djF4G1qE
 pnPMajwRLmhLiszjEm4zl1zmAldp+SuldiGEYS8PvM/ttFMteaFbeY6NQff2Q0bViL1H5mNu1Wd
 VrTpl+mE=
X-Gm-Gg: AYBFou2blulpK0sTEgVoZabkky92chTIHYWwYQMe0oOYK0Nuff3HDc1sf1QJMSO4Jr8
 vo0KmoOVeQsXRuEnfUJP65uXsou+D3cxV8gyOhvQlZ6+gFmvc+ZtODfUo2f7mzMXdQ9CyMZxPFU
 Dbm+zEVsgaUDyenCeCE0ReREjA4bGoTtXAxsaKT89HBX0ruBUcOcqgr7rNG0BrUxtIKhxausMut
 XhTcjCa+mU40Wh7VfJG83qzbI2lgbTdPdjXtIVjbWrJX5pJM4E7YE07mRXtF1E0T6BaoI8XiHez
 FlO5/WUUAWABUfuYDjv3yIe6QO3/QqttsC361mqmcO7J7eJ7fYgh9cHREeuFw7GSnSaHiTxzdUG
 kRgfSCn/qshPBDw/1OMEQTUnt6rKqo+0CfapsYZZX7Ol1AEUwttqsCbvLNupH0IyU01jtbsnSCh
 Gl/5hLgDJ6xEJxmVdxpVV/2jYyWjTHqppWrPHVbi8dig0WNQsYuL9vx/XGUdo+51flKWn01gh+d
 GLXYIbUnZhFJZBcDLIM1C405jLmFlIZqXWY6aNQSZTDw4WPwPRrCoho
X-Received: by 2002:a05:600c:4685:b0:4a0:27eb:49b with SMTP id
 5b1f17b1804b1-4a18e4ae6fcmr89949265e9.30.1791624191675; 
 Sat, 10 Oct 2026 02:23:11 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a192d3efb6sm50774695e9.1.2026.10.10.02.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:11 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:10 +0200
Message-ID: <20261010092310.139234-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925192402.2559326-1-ju.o@free.fr>
References: <20260925192402.2559326-1-ju.o@free.fr>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: bubblewrap: new
 runtime test
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  DEVELOPERS                                    |   1 +
>  .../testing/tests/package/test_bubblewrap.py  | 127 ++++++++++++++++++
>  2 files changed, 128 insertions(+)
>  create mode 100644 support/testing/tests/package/test_bubblewrap.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f4b746290e..d62bfaafb3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1899,6 +1899,7 @@ F:	support/testing/tests/package/test_bitcoin.py
>  F:	support/testing/tests/package/test_brotli.py
>  F:	support/testing/tests/package/test_btrfs_progs.py
>  F:	support/testing/tests/package/test_btrfs_progs/
> +F:	support/testing/tests/package/test_bubblewrap.py
>  F:	support/testing/tests/package/test_bzip2.py
>  F:	support/testing/tests/package/test_compressor_base.py
>  F:	support/testing/tests/package/test_connman.py
> diff --git a/support/testing/tests/package/test_bubblewrap.py b/support/testing/tests/package/test_bubblewrap.py
> new file mode 100644
> index 0000000000..624b331e5e
> --- /dev/null
> +++ b/support/testing/tests/package/test_bubblewrap.py
> @@ -0,0 +1,127 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestBubblewrap(infra.basetest.BRTest):
> +    # Bubblewrap uses mount_setattr(2) introduced in Kernel 5.12:
> +    # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=2a1867219c7b27f928e2545782b86daaf9ad50bd
> +    # The Buildroot prebuilt Kernel is 5.10. To avoid testing
> +    # Bubblewrap with its fallback code, we build a newer kernel.
> +    # https://github.com/containers/bubblewrap/blob/v0.13.0/bind-mount.c#L27-L31
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.53"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_BUBBLEWRAP=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        disk = os.path.join(self.builddir, "images", "rootfs.ext4")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        bootargs = ["root=/dev/vda"]
> +        qemu_opts = ["-M", "virt", "-cpu", "cortex-a57", "-m", "512M",
> +                     "-drive", f"file={disk},if=virtio,format=raw"]
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=bootargs,
> +                           options=qemu_opts)
> +        self.emulator.login()
> +
> +        # Check the program can execute
> +        self.assertRunOk("bwrap --version")
> +
> +        # We set an arbitrary message used as test data.
> +        msg = "Hello Buildroot!"
> +
> +        # We create three files to test the sandbox functionality.
> +        # One fully hidden to the sandbox, one passed as read-only and
> +        # one passed as fully read-write.
> +        dirs = ["hidden", "read-only", "read-write"]
> +        for d in dirs:
> +            self.assertRunOk(f"mkdir -p /mnt/{d}")
> +            self.assertRunOk(f"echo {d} > /mnt/{d}/file.txt")
> +
> +        # We start the sandbox.
> +        cmd = [
> +            "bwrap",
> +            "--ro-bind /bin /bin",
> +            "--ro-bind /lib /lib",
> +            "--symlink lib /lib64",
> +            "--ro-bind /usr /usr",
> +            "--ro-bind /mnt/read-only /mnt/read-only",
> +            "--bind /mnt/read-write /mnt/read-write",
> +            "--proc /proc",
> +            "--dev /dev",
> +            "--unshare-pid",
> +            "--new-session",
> +            "sh"
> +        ]
> +        self.assertRunOk(" ".join(cmd))
> +
> +        # The "--unshare-pid" option creates a new PID namespace.
> +        # In this new namespace, Bubblewrap act as the PID-1 process.
> +        # We check the PID-1 executable is bwrap.
> +        out, ret = self.emulator.run("readlink -f /proc/1/exe")
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], "/usr/bin/bwrap")
> +
> +        # Inside the sandbox, we should not see the /root home
> +        # directory.
> +        self.assertRunOk("test ! -d /root")
> +
> +        # Inside the sandbox, we should not be able to remove a file
> +        # from /bin, even as the root user.
> +        self.assertRunNotOk("rm -f /bin/ls")
> +
> +        # We check the hidden file is not visible.
> +        self.assertRunNotOk("cat /mnt/hidden/file.txt")
> +
> +        # We check the read-only file is readable.
> +        out, ret = self.emulator.run("cat /mnt/read-only/file.txt")
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], "read-only")
> +
> +        # We also check the read-only file cannot be written.
> +        cmd = f"echo '{msg}' > /mnt/read-only/file.txt"
> +        self.assertRunNotOk(cmd)
> +
> +        # We check the read-write file is readable.
> +        cmd = "cat /mnt/read-write/file.txt"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], "read-write")
> +
> +        # We check the read-write file is also writable.
> +        cmd = f"echo '{msg}' > /mnt/read-write/file.txt"
> +        _, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +
> +        # We exit from the sandbox.
> +        self.assertRunOk("exit")
> +
> +        # Since we exited the sandbox, we check the PID-1
> +        # is no longer bwrap.
> +        out, ret = self.emulator.run("readlink -f /proc/1/exe")
> +        self.assertEqual(ret, 0)
> +        self.assertNotEqual(out[0], "/usr/bin/bwrap")
> +
> +        # We should now be able to read the hidden file.
> +        out, ret = self.emulator.run("cat /mnt/hidden/file.txt")
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], "hidden")
> +
> +        # We check the writable file now contains our test message.
> +        cmd = "cat /mnt/read-write/file.txt"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], msg)
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
