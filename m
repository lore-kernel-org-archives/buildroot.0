Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05301C61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA65560DA4;
	Fri,  4 Sep 2026 12:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOeuZPlpekRM; Fri,  4 Sep 2026 12:19:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8446D60DA8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524367;
	b=gkr0YAke+0BCNu1Ex1D3IUW+Duri4I6oZ0kf/nb2xibYzaVPH6M0c4kg5JGIfdfZrQEp
	 PNdYIOYkNJFOWf82SokavSivwgInJNgewUIv0kdBeI21Eme2SyXUpA/1rXoR/ylsnN/wU
	 FZL1Zac/oq9p3PgCW74S2WBiaNY9bqvuGiKyuXbMlx4YhB12fulYQpyo3/bXa34FxBqJR
	 V7HQzt67eG8XBIFGmCW6x2IvjEEFxToAuYba3xSJFnAaEUHiio3dMMUjKpxoXaxJikEO2
	 wSYjt6yno29bRNlemc8inDFr7SyIC3QWC2oGUaNH4Z8RZ2tItDgQbX3rh1V4miK2jJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524367;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NyMAQhd8YnTsJPbUA9LXsiIHvKYTsKTrZ9RDQ/B7rZs=;
	b=jnAnI+14iZNlCgnypIJC2HBVwE7Lz/vM3mjgelyWI3rlF9KAYy9sWHSHTk76Ty9T6poc
	 xO1LPeo1UjXC2RoEXFCUxuLm9sjNgXJsERfnmIqjq3HX9QVofupHo9c/Hr/2+wWyQmK/l
	 QUNaaD8xYQt7H4XDzVWjhKl5Baf14j3J8EyVAD/K5YSNjLcu3jE2z0bMrOw42FRii1LUs
	 gJeuqpj6CfllE8ZPgSCG070vZO2XpZ96rWqyH5T8s3v8UWYGaeNqE2dOeJL71pvNBct2s
	 jj2+3olyVbwMEEHjJe8PmLoO164hdYFpX7TJ4OHrINrX+qrKSrQDZmqmIE7FXZgYDSA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524367;
	bh=NyMAQhd8YnTsJPbUA9LXsiIHvKYTsKTrZ9RDQ/B7rZs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ecptZ6wofoeRJ5bSul174MyvMgkC09l+bj2YusaB2Bu8I/mFLLdNqqDq/NTNeG1Hi
	 XJ/Q0ZUAx9VBkuQDHlg6+2p6xd0Mlrky7osxHQeEdVWtkCVo2p/tth9RhZi/bNQw98
	 ZeusdeNidYZH98fUO7DeHp2ppTxNEU93F5UijQzX+7stcRb6M2iwrw2A7xnE7P+zAt
	 ryHupl2Xe1GtzkNLV4NetTA8V8J0iN+2yxDPrd8FWm+PZ6Om1aDxu1XFskqWQJti43
	 nRn0NGhjGxh+EXyCAfraXcEdcaJN2HCggyOhkzo4W8SlZ6K9RIcvVneHR1ofvk1hH4
	 HkXBfNMaSDNYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8446D60DA8;
	Fri,  4 Sep 2026 12:19:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9506110E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 648CF60E1B
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qceNOrASoo4U for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:19:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6539D60C0D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524349;
 b=eiymxPs803NspgrvG9ECUXF52uY0J6KcF5DgM6MGFZFNhStfUIE5VurSl2L0rbUnY8c5
 0LOaHBg5OL+NDr6ufAMAzNsD0fTF7xCHNNhwyaMt8FgxW0zN4kjxBe7eypf0oZyOSEtY7
 Q6H+ufj1r+qEg3uyPhnASosRIEb0xgWWd/y64NQGxYSwlw6xA+yd/MICMb4AAJE9UTkCS
 JbVN2oYq0yqOaWVcywOvwYX8f/3ZK311iG2Kh39r+LItRRYv+1S8O2o/lTwGGz5cEG81+
 OFr9eA1054p5SUn55WFFdM2btypoCnuVilTxiZY4BwNPTXC0PudPoW/G1oUGHCOu5Pg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524349;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=xAA9RjDhFBRkUk8Bzz1oh1fw/6QSGPPGcfEQqcisNDE=;
 b=ooBl5NHZqNTkDGoViOSUGRqipQvaX8Mb+wvnf8zl8LXR2ObTBki19iQxd/Ywbwq7s22h
 0KJjlUhs7aX5AZv8LKAQMS+2FK1lbSLI1FaHk9/wOHjP7HYHB5W5QpXSv4svHqsmRB58m
 CE8qoyqRKP9GhLAsEWF1BeagPlofo0WooyIc2ApC+/r23khxgQv5XueBAlcSlLY+u8Mby
 DDgsBgS1IIySdg3R8hfVKkFZeENLZZvrgff1LJqsKse77ateKihnar3aekpTWtKQMcdUT
 Y8Zx8AZ8AgvRj4snai1be8Ft8OZ0vYn2TQ270fLB5dncamVH491Y6EZ6fDUbletG0Ig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BBKS5sEB; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6539D60C0D
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:08 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-482e067e908so843245f8f.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524347; x=1789129147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xAA9RjDhFBRkUk8Bzz1oh1fw/6QSGPPGcfEQqcisNDE=;
 b=GPbQcm+UGGlZSfZIAIRhbjcHd2CNlwoc9R1Ss/I7wguJ6y8MCFHAvyIZpOvvq5kEqL
 IcoG7DZsAIaGNCjiqW9XCVY2OSXsLJIl03F3d3b8D5KzXsAjtTMCaN784dP50F1VlOfb
 7kCsNVrO9QacFBhEQsdT1VKahsRLehfp6vTkjWqrR2CEUsCVVAkjBoqnkfFUuHmSXoBc
 /umkTrJj7yi21RoEwVouqnrKOURxfWIlNm00FZQsnreEvQ2Nip55tGwMvKLzsfL4MzxZ
 Xi2DZFf74zqRutn0C6xFLaUyk7dW09GOgO99gvPPTbF96DUscG9PIXYB7Ysa9r4kzPHh
 AGGA==
X-Forwarded-Encrypted: i=1;
 AKwUvByFGMiOFwJqZW0dvXnGL9RWsoY5CT6CrONqGFNo5folSOJJxTbjZ2kGq2vLos577Mha5+X97bytCNY=@buildroot.org
X-Gm-Message-State: AFuF++m4oE03agV7xjs0CgPgyiWwVf0YznSOuAJqQ8vopgCgvSMtNuVb
 ON3WaJZVklfC76MbX5R6U61CdzIAySDNcHWphovE2VZkfuUeCXZBmHx1fsV6FbRCdzITP8Waa5g
 rrgcG
X-Gm-Gg: AYBFou3YLpVCx4rsHHyXLj1Ge0Sv7vMH/fu/sXI/JgqCdqWPtA4HRYt2RT2nTLPEQEw
 B5aZaoIc2QaYRZMYqzhG8nnvmTTgyHDRxvmz+JU9ClvQHqnXqjul35ZTlGw1Fp2+0m4+K6atSRi
 z3r6tFOuCcVdRfdrKvhGuWIkov5dRfAgIFrFohoYxqx697vcNHgxBavMESoFap6de+Whidq69xa
 PaqNPnkIXclvaVvCSDsef5zKZqmRirl87+qjxmc8KjrAm4g15767oKsBcj0HVP4ISM775ehbVEM
 h7JNxA5+M5BouurGY1CBpRBkbQ3ahHBKnXJRJhhLBN0XB0ODWsIPztJcCbAK3wiRMTSNnMkt3hi
 OPQXLRTsa76ikW9ZKeBlhee7mcBNhM00JolYP3vuANkbHtq9lJMoC6PiPnY5mNB4cJQXRNceXi9
 0P90zLxFUtnExsEzyUrpMAoEA6SffI7Wh/9+O9DrxNs6w713y//dpNbQ==
X-Received: by 2002:a5d:64cc:0:b0:485:8a46:7058 with SMTP id
 ffacd0b85a97d-4858a467268mr4287440f8f.42.1788524346726; 
 Fri, 04 Sep 2026 05:19:06 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858791bddasm6438741f8f.0.2026.09.04.05.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:19:06 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:19:06 +0200
Message-ID: <20260904121906.406574-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827095520.1049186-3-thomas.petazzoni@bootlin.com>
References: <20260827095520.1049186-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] support/testing: add bpftrace test
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
> This commit adds a simple bpftrace test that ensures that not only it
> builds fine, but it also runs properly on a minimal test scenario.
> 
> Assisted-by: GPT-5.6
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  DEVELOPERS                                    |  2 +
>  .../testing/tests/package/test_bpftrace.py    | 66 +++++++++++++++++++
>  .../test_bpftrace/linux-bpftrace.fragment     |  4 ++
>  3 files changed, 72 insertions(+)
>  create mode 100644 support/testing/tests/package/test_bpftrace.py
>  create mode 100644 support/testing/tests/package/test_bpftrace/linux-bpftrace.fragment
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5eb438906f..080aaac5e0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3297,6 +3297,8 @@ F:	support/testing/tests/package/sample_python_flask_expects_json.py
>  F:	support/testing/tests/package/sample_python_git.py
>  F:	support/testing/tests/package/sample_python_pyudev.py
>  F:	support/testing/tests/package/sample_python_unittest_xml_reporting.py
> +F:	support/testing/tests/package/test_bpftrace.py
> +F:	support/testing/tests/package/test_bpftrace/linux-bpftrace.fragment
>  F:	support/testing/tests/package/test_nodejs.py
>  F:	support/testing/tests/package/test_python_augeas.py
>  F:	support/testing/tests/package/test_python_crccheck.py
> diff --git a/support/testing/tests/package/test_bpftrace.py b/support/testing/tests/package/test_bpftrace.py
> new file mode 100644
> index 0000000000..70ccfe8b20
> --- /dev/null
> +++ b/support/testing/tests/package/test_bpftrace.py
> @@ -0,0 +1,66 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +# gitlab-runner: 2xlarge
> +class TestBpftrace(infra.basetest.BRTest):
> +    kern_fragment = infra.filepath(
> +        "tests/package/test_bpftrace/linux-bpftrace.fragment"
> +    )
> +    config = f"""
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_fragment}"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +        BR2_PACKAGE_BPFTRACE=y
> +        BR2_PACKAGE_TAR=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        self.emulator.boot(
> +            arch="aarch64",
> +            kernel=kern,
> +            kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
> +            options=[
> +                "-M",
> +                "virt",
> +                "-cpu",
> +                "cortex-a57",
> +                "-m",
> +                "256M",
> +                "-drive",
> +                f"file={drive},if=virtio,format=raw",
> +            ],
> +        )
> +        self.emulator.login()
> +
> +        self.assertRunOk("mount -t debugfs none /sys/kernel/debug/")
> +
> +        # Check that bpftrace can find a syscall tracepoint.
> +        self.assertRunOk("bpftrace -l 'tracepoint:syscalls:sys_enter_execve'")
> +
> +        # Compile and attach a tracepoint program, then trigger it with the
> +        # command executed by bpftrace. The marker avoids matching volatile
> +        # fields such as PIDs or command names.
> +        cmd = (
> +            "bpftrace -e 'tracepoint:syscalls:sys_enter_execve "
> +            '{ printf("buildroot-bpftrace-test\\n"); exit(); }\' '
> +            "-c /bin/true"
> +        )
> +        output, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        self.assertIn("buildroot-bpftrace-test", "\n".join(output))
> diff --git a/support/testing/tests/package/test_bpftrace/linux-bpftrace.fragment b/support/testing/tests/package/test_bpftrace/linux-bpftrace.fragment
> new file mode 100644
> index 0000000000..35359b08f6
> --- /dev/null
> +++ b/support/testing/tests/package/test_bpftrace/linux-bpftrace.fragment
> @@ -0,0 +1,4 @@
> +CONFIG_FTRACE=y
> +CONFIG_FTRACE_SYSCALLS=y
> +CONFIG_FUNCTION_TRACER=y
> +CONFIG_KPROBES=y
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
