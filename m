Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A308DC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F8BA60633;
	Sun, 28 Apr 2024 18:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XV1nn3yekMxG; Sun, 28 Apr 2024 18:26:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 063E660635
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 063E660635;
	Sun, 28 Apr 2024 18:26:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 838421BF344
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F9B660635
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7f-qp3vrcGR for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:26:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C58EC60633
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C58EC60633
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C58EC60633
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:26:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41a1d2a7b81so26256935e9.0
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714328770; x=1714933570;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oZRXSYvTBYID84HD8HPWHEnS1u93yav970LQLvqtET8=;
 b=C1GLswC61HhJhfziESuaeCh0lsEcL7jqqKqeBmOFQ+8L9EuQjIGsbdwLKoZD3stqjg
 S3uPrdGH3qZjPx7np0i/EBTW1Z/cEuKY2gLvXfiFWYVCrZn4iDCLnQrf0iNGcyFSw2Ei
 6gOX+QkMi7OU+EUAIY5vMU98QDywokJ6nO0zHKQiRtRQwrGf3nB3XGE3d6WDPHxYNx1J
 aSVSoggTMc8oIMJoMXcf0hiWU/z4fQxsXJ5NVWbwfWcgW/8WxlZqBXnMHLiyuYnH6mtf
 sBdyZWx0U4uRJdghCHDx2gLb5FuT+0HO44mFotV/zgrr6EhOX7eDkqr/4W6rkJ59zug5
 6xzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnjdUBsDpJWr46xikWXw3MtMk3tCW2b1w9jKIfE7O2HeyH4nIsn5xqM8Uwu3lpMZoYW86PKlBqj1Xepw7sHh7sZ2bvWNtxDg==
X-Gm-Message-State: AOJu0YyUISM5HWBeFM/L2yasd3zGhEKFUnhDg2yEQJW+juXtY+dmu0RA
 gDWQlQsw3MaXLMrlliY6TFx3gHqe1XekvPpR/YaOeQ9jNwD5C5zQ9+yDXB0ZGB0=
X-Google-Smtp-Source: AGHT+IE/vsfbyz3pZab6vppnryXc4B4GNY0YS8JwipqVT7w0D/OzAOTCzELr4yVbuHmDFsOF4iGsEw==
X-Received: by 2002:a05:600c:4506:b0:41c:66:18c2 with SMTP id
 t6-20020a05600c450600b0041c006618c2mr2368078wmo.4.1714328770145; 
 Sun, 28 Apr 2024 11:26:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c314d00b0041ac4aafd3dsm20234016wmo.12.2024.04.28.11.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 11:26:09 -0700 (PDT)
Message-ID: <837e232e-5f0e-47e6-af31-f5c0d34e25eb@mind.be>
Date: Sun, 28 Apr 2024 20:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240414214204.1038212-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240414214204.1038212-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714328770; x=1714933570; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oZRXSYvTBYID84HD8HPWHEnS1u93yav970LQLvqtET8=;
 b=DMsYd2anyXAcO7TFrqdxqtpIr/E28iOpkHV9PBgJqNoPfae/XrRgvZ/s1qr9f7pA+T
 oQxMCovqC5qOD0j3rPJFx8k/3atHrDRnEvqDvIOD9dNhu8C+aqjncy+tLZnj6is615sE
 WHPIehgujd4RF0kQgy844DgvhWLBEPNU185sYwmz33U+XU/XS/AkIRZa3iA7+6fz1ICS
 czSVowYiSYCeRX0yvqSDQe4xXxk25eLrXhqt7Vt03o9+h/ytGS1g9X/RRtYVo+LCbu15
 +0aKHGXgsVWTkTO7ChHwgxtQ5SZKFOYLK/hgsarBwe7y45VXK+xFUMiMf3fHkdBlJxV8
 qSAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DMsYd2an
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add wine runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/04/2024 23:42, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS                                 |  1 +
>   support/testing/tests/package/test_wine.py | 88 ++++++++++++++++++++++
>   2 files changed, 89 insertions(+)
>   create mode 100644 support/testing/tests/package/test_wine.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 399b2931ff3..b8beb1bd565 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1872,6 +1872,7 @@ F:	support/testing/tests/package/test_usbutils.py
>   F:	support/testing/tests/package/test_usbutils/
>   F:	support/testing/tests/package/test_weston.py
>   F:	support/testing/tests/package/test_weston/
> +F:	support/testing/tests/package/test_wine.py
>   F:	support/testing/tests/package/test_xz.py
>   F:	support/testing/tests/package/test_z3.py
>   F:	support/testing/tests/package/test_z3/
> diff --git a/support/testing/tests/package/test_wine.py b/support/testing/tests/package/test_wine.py
> new file mode 100644
> index 00000000000..4e5b4a8b111
> --- /dev/null
> +++ b/support/testing/tests/package/test_wine.py
> @@ -0,0 +1,88 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestWine(infra.basetest.BRTest):
> +    # Wine depends on i386 architecture. The pre-build runtime test
> +    # Kernel (for armv5) cannot be used. The config also uses a ext4
> +    # rootfs due to the larger Wine footprint. We also enable NLS,
> +    # which is required for cmd.exe shell to work.
> +    config = \
> +        """
> +        BR2_i386=y
> +        BR2_x86_pentium4=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> +        BR2_PACKAGE_WINE=y
> +        BR2_SYSTEM_ENABLE_NLS=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
> +        kern = os.path.join(self.builddir, "images", "bzImage")
> +        self.emulator.boot(arch="i386",
> +                           kernel=kern,
> +                           kernel_cmdline=["root=/dev/vda console=ttyS0"],
> +                           options=["-M", "pc", "-m", "256M",
> +                                    "-drive", f"file={drive},if=virtio,format=raw"])
> +        self.emulator.login()
> +
> +        # Check the program can run.
> +        self.assertRunOk("wine --version")
> +
> +        # Remove the Wine directory to make this test idempotent. This
> +        # is because we use a persistent storage. This is useful only
> +        # when the run-tests script is used with the "-k" option.
> +        self.assertRunOk("rm -rf ~/.wine")
> +
> +        # Wine usually prints lots of debug messages. We disable all
> +        # logs for this test. For debugging, this line can be
> +        # commented, or extra log can also be added. "WINEDEBUG=+all"
> +        # enable all logs and generates a lot of messages.
> +        # See: https://wiki.winehq.org/Debug_Channels
> +        self.assertRunOk("export WINEDEBUG=-all")
> +
> +        # We force the initialization of the WINEPREFIX
> +        # directory. This operation can take some time. This will make
> +        # subsequent wine invocation execution time more stable.
> +        self.assertRunOk("wineboot --init", timeout=45)
> +
> +        # We check we can list files in the Windows OS directory.
> +        cmd = "wine cmd.exe /C 'DIR C:\\WINDOWS\\'"
> +        self.assertRunOk(cmd, timeout=10)
> +
> +        # We check we can read a Windows OS specific environment
> +        # variable. We use "assertIn" rather than "assertEqual"
> +        # because the cmd.exe shell write extra control characters.
> +        cmd = "wine cmd.exe /C 'ECHO %OS%'"
> +        out, ret = self.emulator.run(cmd, timeout=10)
> +        self.assertEqual(ret, 0)
> +        self.assertIn("Windows_NT", out[0])
> +
> +        # We check we can print an arbitrary string with the
> +        # cmd.exe shell.
> +        string = "Hello Buildroot !"
> +        cmd = f"wine cmd.exe /C 'ECHO {string}'"
> +        out, ret = self.emulator.run(cmd, timeout=10)
> +        self.assertEqual(ret, 0)
> +        self.assertIn(string, out[0])
> +
> +        # We check the VER command reports a Windows OS version.
> +        cmd = "wine cmd.exe /C 'VER'"
> +        out, ret = self.emulator.run(cmd, timeout=10)
> +        self.assertEqual(ret, 0)
> +        self.assertIn("Microsoft Windows", "\n".join(out))
> +
> +        # We run the ping.exe command.
> +        self.assertRunOk("wine ping.exe 127.0.0.1", timeout=10)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
