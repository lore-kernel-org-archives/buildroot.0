Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77AC10987A1
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A655E41E66;
	Fri, 20 Mar 2026 15:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKHj6h9RkSUv; Fri, 20 Mar 2026 15:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58B1941CE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022112;
	bh=dn9e2OkjQjZ61QjFVlRWf3KllI43DBzMjA+bvpThQIA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LWVCzYVkEpns8hpTaEsi0+VPNUpC/k7g/TubYPIX2kvGWQI13Fkx5zWQMQb6Xt+g6
	 2v5MKvQ1i/EQKxs7dV4cqqNbzTFFsq8k3DuBIo400TYk66zsyD04aW7xvG7jG9+bSZ
	 JCzGRimCaWq8DcgsmcaU0ASMQ+FQlePDJDYaTO5EZ0HjLSbbHnTHiQYngBBQBp46Ii
	 Zh2YhukcRQOf1Lq7hfy8v+0UDw0c7SLidovoAzW8MtvY+4L40JzTv9LzhzYNlkmO1G
	 M4aeu1Mhod3QH3oHr8AFiHLzG+O2iIHQjACsZq9kvXiifdAXIe9DSwDxqaBukoEoyV
	 Ig7Ou1t+3S4LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58B1941CE0;
	Fri, 20 Mar 2026 15:55:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9396525C
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7921A61B8A
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjaeJ-lTf2tj for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72E7861B7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E7861B7D
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72E7861B7D
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439c6fc2910so1507259f8f.0
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022105; x=1774626905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u9Rf+hlS1+3TFFpnTSgu3tFly9ylqwxTpMne9dgYkqY=;
 b=Rhq7Tm3Ivxe/ikr9v8kNX2t+y0WJIt7IrEw+aHmMEaI4BmiSond3jUrdlDH5+g/8NC
 VsoNwEh3H1pHS6gRTYEYowoSLclbmI1Bzfty5izkTPunRdWsQJmIz350ZCxZR+Vhp+Z9
 x5iZXJR1h7uvXcRDWvKXV9k4ymxISYV+i+ZyoUvfnhREm36fL2T8MrJlZ4h7BZKeB+vu
 Mm5f8qBRsSuSy/N3aYZuvVVZPioF0wz0qiqhjqpKW57LFp0Cea1G4vdLQnvOLAPIoqcI
 /rwjWeq2fQSzdrkKNw/4qNYx8UuHFXpltzW87lQYwtVXEIZ/rME3moa3Zk2QqgsfLSxi
 y8Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFY2mqaDGE0Gz2nKPiCoHYDClEF7CvGFo2p70f6SfZJEdlpomH4zkJM6R2Ry0/3gfNHjwhH0Ly1AY=@buildroot.org
X-Gm-Message-State: AOJu0YzTkhS9Tl51WJ1674bck0dlK916f9UITl3GYotc0uIgja4eqbxP
 qxe3UQK+2kxvrjHZRqdws2PBzUtBsVJyTh6ZH1RsYUq/x9vZw5YxAcR1D9+yXb034WQ=
X-Gm-Gg: ATEYQzwcjTSVuhGC/l3kTttSVhvwKR3mp7UUIqC6cw5jRBoBo28oaTsxSQJssjorLRe
 vHH+Fgt27G5wyWIO4SolnOdGHnafYVcgofTwxZqTV2q8zkZenv+gjzbs/CG4QK+Eip37R/mr4JD
 Rd8QodYxVMCYzEl4ZB73PSJhzvU6W1L83jUsvD1Wrf+2hCyyK86+fI6CkmYVtbzN1dMreFX67C0
 7vWbejP9MRkI8+KwgTbbldAOUioVEEAq49kTElzqP38D9nEQvnF8Hgi6k9Pe6K6levcVRcnIS3b
 aIxmrwxz/5sDRHKhAvb2+F6x2JsZ2AkezLoEYj7ejwRctvnwjwhx+Cm03Kg4I5JtkLfnok8A3pf
 6r+9UeLG9YiylS2586/YuirNboZ8hrG9c1NABiN9qyGoHiWAU3Ue4U844TVd6X2bkv9mDg3JfQQ
 GDBfymZ6AKdxQgexOX
X-Received: by 2002:a05:6000:1a8d:b0:43b:4592:f91b with SMTP id
 ffacd0b85a97d-43b64242fa4mr6319830f8f.5.1774022105282; 
 Fri, 20 Mar 2026 08:55:05 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b647036e0sm7638534f8f.21.2026.03.20.08.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:04 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:04 +0100
Message-ID: <20260320155504.176574-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223214358.858432-1-ju.o@free.fr>
References: <20260223214358.858432-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022105; x=1774626905; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u9Rf+hlS1+3TFFpnTSgu3tFly9ylqwxTpMne9dgYkqY=;
 b=Q97vbBDCEiMAYJfz6fczKxKiC3Et2FZIyuaeVuqZwwsl91dW15HYZoVrbfmooRL07n
 i5kfGk7kv6N7YepWF8pOpdNYJsPcwNz1q9o3OyJ24bUeeh1I9qrsPZW5PSiT3zKiG9zl
 KgWKkLrjmOEQ5aIzNMZyyWD3EQrxZ/d5NeTHju5njtZtBBo9Vom0G0py3NwdJYJr0S5z
 4mqpGr/pWejQjqEwM8OhLbcDpk04MUxF4Lr6pJrjj2r0lS4gDm1cydJaS9rAdCGvS//o
 lOnNri2TLeE0Gn4iRGMIOVz+YjmsZAG0Qt83jJ1iEFlIvrcntzzOyD637zOpTTEfeSnr
 R0pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q97vbBDC
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_connman: new
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

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  DEVELOPERS                                    |  1 +
>  support/testing/tests/package/test_connman.py | 57 +++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 support/testing/tests/package/test_connman.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9e983ae113..63d1517652 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1874,6 +1874,7 @@ F:	support/testing/tests/package/test_btrfs_progs.py
>  F:	support/testing/tests/package/test_btrfs_progs/
>  F:	support/testing/tests/package/test_bzip2.py
>  F:	support/testing/tests/package/test_compressor_base.py
> +F:	support/testing/tests/package/test_connman.py
>  F:	support/testing/tests/package/test_coremark.py
>  F:	support/testing/tests/package/test_cryptsetup.py
>  F:	support/testing/tests/package/test_cryptsetup/
> diff --git a/support/testing/tests/package/test_connman.py b/support/testing/tests/package/test_connman.py
> new file mode 100644
> index 0000000000..6fef95104c
> --- /dev/null
> +++ b/support/testing/tests/package/test_connman.py
> @@ -0,0 +1,57 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestConnMan(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_CONNMAN=y
> +        BR2_PACKAGE_CONNMAN_CLIENT=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # We check the program can execute.
> +        self.assertRunOk("connmand --version")
> +
> +        # We query the connman state and expect it to be ready.
> +        out, ret = self.emulator.run("connmanctl state")
> +        out_str = "\n".join(out)
> +        self.assertEqual(ret, 0)
> +        self.assertIn("State = ready", out_str)
> +
> +        # We list the technologies and expect to see at least Ethernet
> +        # because the emulator has one interface.
> +        out, ret = self.emulator.run("connmanctl technologies")
> +        out_str = "\n".join(out)
> +        self.assertEqual(ret, 0)
> +        self.assertIn("Type = ethernet", out_str)
> +
> +        # We ping the qemu user networking gateway. The startup
> +        # scripts should have brought up the interface, so the ping
> +        # is expected to succeed.
> +        ping_cmd = "ping -c 3 -i 0.2 -W 2 10.0.2.2"
> +        self.assertRunOk(ping_cmd)
> +
> +        # Now, we ask connman to disable Ethernet. It should stop the
> +        # interface.
> +        self.assertRunOk("connmanctl disable ethernet")
> +
> +        # If we try to ping again the qemu gateway,
> +        # it should now fail.
> +        _, ret = self.emulator.run(ping_cmd)
> +        self.assertNotEqual(ret, 0)
> +
> +        # We ask connman to re-enable Ethernet.
> +        self.assertRunOk("connmanctl enable ethernet")
> +
> +        # We should be able to ping the qemu gateway again.
> +        self.assertRunOk(ping_cmd)
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
