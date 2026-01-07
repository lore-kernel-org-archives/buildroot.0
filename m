Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA0DD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3AAD80782;
	Wed,  7 Jan 2026 17:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70gGpPd0W-pJ; Wed,  7 Jan 2026 17:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFC57822A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808245;
	bh=F7nHCeTCXWuCtiyYnc3+L4lV1rfeUlWHv2ZnAN823Lc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FxNI7vXMo7cwRf2GRc5fTXD9zSDulWDdbO4sm6aK09unnLB4fqsTNNMWCRDXL8664
	 DwqvlX4kwaICPkjc8gPlGuf+bVDhdEgYAtpppg5akv4sHW32JiTI0O6rvTQEfiR4eX
	 9/l+Fce2f63LUp5dlPPJhSjU9LIbObs8txhunpms+x+DDS7++1X7hRMaV4FLIPuJ9W
	 g7CbHnU8Gxj90FUXVCoMYor6ELWDpYakLp6ghY/7AFgQro9I/0c1kGllw0QwZXRlPZ
	 r1CRslgddRDGrIKdbc4nT8QLBZm6d3BUJ5t4KNjC7OaquIvWu1yVVp+CcqwWURaS0Q
	 UFATpclIX6yWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFC57822A9;
	Wed,  7 Jan 2026 17:50:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F7059ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7621840E3E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tgk7pa5NRs6s for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F3D140E41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F3D140E41
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F3D140E41
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3BA19B97A192; Wed,  7 Jan 2026 18:50:41 +0100 (CET)
To: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:38 +0100
Message-ID: <20260107175038.226765-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221115708.256386-3-ju.o@free.fr>
References: <20251221115708.256386-3-ju.o@free.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808241; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=wwn+IKhRIdKdIK/RZSCF7U214A936ng6B+6mFtbjCGA=;
 b=a+kt5JnGhGpCXQDv5Ih17d9GJX2rzfD4MUecNvk7oRXBsnDcp7MZpb33c7HvOZzyeLwgJm
 XsLR/TYxHN3dC27MVHb8rLv9715YElOF4WTBOl9UEXuMJnB78PaXwkvm4Dr8Q6v7NOJWWg
 nv9UqPO3Ob+gVIQlDKxLe29C6rqnb907oMjTeGfoi7UltcRICyOcOpzeExaDUPCPT5oKQ6
 m2nL0TCX8K5nehkLPWENllInd34a9GD0kyJijfZ0Chh/fkrnsxm5uZwqOIcMyDJ8XAxa2G
 bjBUPYd5lMK4ATPyNvuarw1PUk0+3VKmSU+FeYmlrXee3PjNzerf5Q1ZLKXWdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=a+kt5JnG
Subject: Re: [Buildroot] [PATCH 3/3] support/testing: add tio runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> Patch series tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/12509867607
> ---
>  DEVELOPERS                                |  1 +
>  support/testing/tests/package/test_tio.py | 74 +++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 support/testing/tests/package/test_tio.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1b27df9beb..fe9fbf5154 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2014,6 +2014,7 @@ F:	support/testing/tests/package/test_tcl.py
>  F:	support/testing/tests/package/test_tcl/
>  F:	support/testing/tests/package/test_tcpdump.py
>  F:	support/testing/tests/package/test_tesseract_ocr.py
> +F:	support/testing/tests/package/test_tio.py
>  F:	support/testing/tests/package/test_trace_cmd.py
>  F:	support/testing/tests/package/test_trace_cmd/
>  F:	support/testing/tests/package/test_tree.py
> diff --git a/support/testing/tests/package/test_tio.py b/support/testing/tests/package/test_tio.py
> new file mode 100644
> index 0000000000..f7d612b9dd
> --- /dev/null
> +++ b/support/testing/tests/package/test_tio.py
> @@ -0,0 +1,74 @@
> +import os
> +import time
> +
> +import infra.basetest
> +
> +
> +class TestTio(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_LUA=y
> +        BR2_PACKAGE_SOCAT=y
> +        BR2_PACKAGE_TIO=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def get_tty_name(self):
> +        out, ret = self.emulator.run("tty")
> +        self.assertEqual(ret, 0)
> +        return out[0]
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # We check the program can run
> +        self.assertRunOk("tio --version")
> +
> +        # We save our tty name for later.
> +        initial_tty = self.get_tty_name()
> +
> +        # We define two arbitrary pseudo-terminals, for our test.
> +        pty1 = "pty1_getty"
> +        pty2 = "pty2_tio"
> +
> +        # We create our 2 PTYs with socat and connect them together.
> +        cmd = "( socat"
> +        for pty in [pty1, pty2]:
> +            cmd += f" PTY,link=/dev/{pty},rawer,b115200"
> +        cmd += " &> /dev/null & )"
> +        self.assertRunOk(cmd)
> +
> +        # We wait for socat to be ready...
> +        for attempt in range(3 * self.timeout_multiplier):
> +            time.sleep(1)
> +            cmd = f"test -e /dev/{pty1} -a -e /dev/{pty2}"
> +            _, ret = self.emulator.run(cmd)
> +            if ret == 0:
> +                break
> +        else:
> +            self.fail("Timeout while waiting for socat.")
> +
> +        # We start getty on our first PTY.
> +        self.assertRunOk(f"setsid getty {pty1} 115200 vt100")
> +
> +        # We start tio on our second PTY and send a new line.
> +        # We wait for tio to be ready then send a new line.
> +        # After that, we expect to see a new login.
> +        self.emulator.qemu.sendline(f"tio /dev/{pty2}")
> +        self.emulator.qemu.expect(f"Connected to /dev/{pty2}")
> +        self.emulator.qemu.sendline()
> +
> +        # We try to re-login, in tio this time.
> +        self.emulator.login()
> +
> +        # We get again our tty name.
> +        tio_tty = self.get_tty_name()
> +
> +        # We check our second login TTY name is different from the one
> +        # in the first login.
> +        self.assertNotEqual(initial_tty, tio_tty)
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
