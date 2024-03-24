Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661CBC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04F5C40620;
	Sun, 24 Mar 2024 15:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVs8NCaXY2Bj; Sun, 24 Mar 2024 15:11:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8928D40650
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8928D40650;
	Sun, 24 Mar 2024 15:11:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7389F1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60C0A606D4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etXmORNvE-jl for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:11:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85A2A605BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85A2A605BB
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85A2A605BB
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:11:00 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3417a3151c4so3212819f8f.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711293058; x=1711897858;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4b0DvowxAmlDgs8KWGoQVpiYBXNGfZsG7rNfkvHsEfg=;
 b=nzCchiMoOpa0+s25a2x8tJaf5q6SaFw4MmPlJQHTdkNW+qDneuxcq6VhMCPlGTx+2y
 ZKTmBJQXEk/55n20XfAkKq3CLIx8kYAiKFgCIUaFE5o0YQdut8SqlARy/cLyqMKyJOQH
 P1FHkMxxW3HC9QLFQXn8XNTR51V2HEolLtPMAm4ehSUq6nPc+JbKcw6XQ6yq3qdlJ+/0
 lZcLgRb5pmGg1PQWXzdORjBae61OTejv0bPnT7wsxtBBOibZ+PcuTV5zI+vt+KvLuQMb
 Vy4Gmvl6rPws8SaLFMycl7T5Gp3p6zwMVy+58IEfaRbXLk886hXOiaYipz6XE1ZlVUHY
 +SMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0TJ2GvuRRBsa1zIGrjzKavhleOyhtODjo/Pcn6wh1HK3tqeEKZ+ETZEX6GddlO0lRrvYPlKMP5BLfQ1KtWK0JgKmg5QvjYg==
X-Gm-Message-State: AOJu0YwYBZlrL76SnuFsQ+n75yh0ynLyBFzqfe7l9VuhWaVRDIQUOdsZ
 hBO7AZPY49AFu+mfA7nHWMjOOjMBEzTuWw21nZu/xJhVoF9iZ2KVLf8WD4YDwsKew4ISqubVQMX
 x
X-Google-Smtp-Source: AGHT+IGR7b+tsGZfsnWHyf/oO3Iqt/AULJn4wbTRfTBxWwFhsBO5oxosmctEFA5Dd0ul4B6wYZDyNg==
X-Received: by 2002:a05:6000:194a:b0:33e:7a1c:788e with SMTP id
 e10-20020a056000194a00b0033e7a1c788emr3585382wry.6.1711293058661; 
 Sun, 24 Mar 2024 08:10:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 x18-20020adfffd2000000b0034181bea3b0sm7035705wrs.3.2024.03.24.08.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:10:58 -0700 (PDT)
Message-ID: <df83084d-b353-4091-a958-4b970b2f5bd8@mind.be>
Date: Sun, 24 Mar 2024 16:10:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240323203516.19205-1-ju.o@free.fr>
In-Reply-To: <20240323203516.19205-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711293058; x=1711897858; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4b0DvowxAmlDgs8KWGoQVpiYBXNGfZsG7rNfkvHsEfg=;
 b=LS/+DAImUMFsJGB2shfS16vocnXkYTx9nXDlGBoEbgBB9xih+Q4KQRu776Fw/rdFF4
 DQah8x9tmoBT5savUWdVZyOQr5Xi+U0IOoeFi4xv9pfHtn4CGWOFaXkA8byrP47TlQG1
 cqzD8oAxGJHMvpO7bH7hwEzpljtW+CgUrs//ZH7LBsAxO64jqPFq3fhvVzjoMl9Yhm29
 d3WoLNT0uuieTeXsjuwj492SY2iNB1I0n7FmpUnEGV4tZFRLtuwuE9+VjlpQFKJV/Y0S
 LVOcHKjAFtSvldDW6HmAcKLndFQ2+o3hOZCGw3Roah+Exj1lgtev5Btr6xoVa6RTGCQn
 Gqzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LS/+DAIm
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add iptables runtime
 test
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



On 23/03/2024 21:35, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS                                    |  1 +
>   .../testing/tests/package/test_iptables.py    | 78 +++++++++++++++++++
>   2 files changed, 79 insertions(+)
>   create mode 100644 support/testing/tests/package/test_iptables.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a6364cdd441..328c654faed 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1797,6 +1797,7 @@ F:	support/testing/tests/package/test_highway.py
>   F:	support/testing/tests/package/test_hwloc.py
>   F:	support/testing/tests/package/test_iozone.py
>   F:	support/testing/tests/package/test_iperf3.py
> +F:	support/testing/tests/package/test_iptables.py
>   F:	support/testing/tests/package/test_jailhouse.py
>   F:	support/testing/tests/package/test_jq.py
>   F:	support/testing/tests/package/test_jq/
> diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
> new file mode 100644
> index 00000000000..ee57b315589
> --- /dev/null
> +++ b/support/testing/tests/package/test_iptables.py
> @@ -0,0 +1,78 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestIptables(infra.basetest.BRTest):
> +    # The iptables package has _LINUX_CONFIG_FIXUPS, so we cannot use
> +    # the runtime test pre-built Kernel. We need to compile a Kernel
> +    # to make sure it will include the required configuration.
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.82"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_IPTABLES=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=["console=ttyAMA0"],
> +                           options=["-M", "virt",
> +                                    "-cpu", "cortex-a57",
> +                                    "-m", "256M",
> +                                    "-initrd", img])
> +        self.emulator.login()
> +
> +        # We check the program can execute.
> +        self.assertRunOk("iptables --version")
> +
> +        # We delete all rules in all chains. We also set default
> +        # policies to ACCEPT for INPUT and OUPUT chains. This should
> +        # already be the case (default Kernel config). This makes sure
> +        # this test starts from a known state and also those common
> +        # command invocations works.
> +        self.assertRunOk("iptables --flush")
> +        self.assertRunOk("iptables --policy INPUT ACCEPT")
> +        self.assertRunOk("iptables --policy OUTPUT ACCEPT")
> +
> +        # We add a filter rule to drop all the ICMP protocol to the
> +        # IPv4 destination 127.0.0.2, in the INPUT chain. This should
> +        # block all pings (icmp echo-requests).
> +        cmd = "iptables --append INPUT"
> +        cmd += " --protocol icmp --destination 127.0.0.2 --jump DROP"
> +        self.assertRunOk(cmd)
> +
> +        # We check we can list rules.
> +        self.assertRunOk("iptables --list")
> +
> +        # A ping to 127.0.0.1 is expected to work, because it's not
> +        # matching our rule. We expect 3 replies (-c), with 0.5s
> +        # internal (-i), and set a maximum timeout of 2s.
> +        ping_cmd_prefix = "ping -c 3 -i 0.5 -W 2 "
> +        self.assertRunOk(ping_cmd_prefix + "127.0.0.1")
> +
> +        # A ping to 127.0.0.2 is expected to fail, because our rule is
> +        # supposed to drop it.
> +        ping_test_cmd = ping_cmd_prefix + "127.0.0.2"
> +        _, exit_code = self.emulator.run(ping_test_cmd)
> +        self.assertNotEqual(exit_code, 0)
> +
> +        # We delete our only rule #1 in the INPUT chain.
> +        self.assertRunOk("iptables --delete INPUT 1")
> +
> +        # Since we deleted the rule, the ping test command which was
> +        # supposed to fail earlier is now supposed to succeed.
> +        self.assertRunOk(ping_test_cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
