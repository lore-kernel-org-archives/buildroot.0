Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC0DC61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9665E60D65;
	Fri,  4 Sep 2026 12:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBd0TwmtZIeH; Fri,  4 Sep 2026 12:18:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6E05160D8A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524313;
	b=O0VtBmAPtmr4TaOdJZeS1fw+mhjHxRkLfaAw0zYGEl04u+01CKW5Of98rzinnaLoRtDL
	 F0sCZpgm0AQ/qPlNmcPyLPd3OhXF9vZFVjVyw7CGaPT6V5Iv51hQAxKFFRINUWYz906Ht
	 ovGhWaIVXIlvfr4PQqPUF+ZaetgrQCtSecOOQIMCgmWzFvYQIE0nx0Y2U+kuPd9gMP4Zj
	 VMgj4UvjdIARUYSz6/C4VQdgunOB0cTegDi33jwafNYB2RggtU/o6C1w2sXLLgCXUDtqk
	 udMm2p2yM085eLd5BpHwwiE0a/uJJEHWDoScpyB4JmPNIYbxtbyVWt71/PQsZHn+DEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524313;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GYXwz5bagsdWOd1CZkmjUa9H4FeKJwnRdqFON9qzwVw=;
	b=ZtjmB/cguIZmmm7xEI/DzFlSCte2VTMrTBzbHSEJTH8juq4pVfOKFIpFER8GnPjsp7Lj
	 TbK6qsYx+bAfEmJAgkFxzp3JLxF9DBvaQKymJdj73cJYu5zwKeMm3t04tV9dacjelvrvM
	 XQjpC0F4Qe1NeLt5DEbfZ2F2sbFZM7O3zXcSglfXcqDeNx903yw+uZgEYjQtZk5aFB07t
	 F5IwmLEKKdxHNm5qt2l5P7pggd/kjruvL8bEfCH9iakQJK5LDXlb1ldFOCeh/ZFucyzFi
	 JreImpKS6CoKsdtZW0ISt7D0KA2kGVYjCbQ8H0Oi8DBYRHlBQfcVx0gW7TxtCsmq9nA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524313;
	bh=GYXwz5bagsdWOd1CZkmjUa9H4FeKJwnRdqFON9qzwVw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cFg38zyvldSV/mfGjv8TyZVnPHM4jdTe6CXbQGFr+6qyQoEq6ox4qiRIAslRPXvUW
	 dESBrSmNBGWrnBbN230d1H/qR4fJP8OtjUEobM9W6mB+6n393O3zbEua8Shpya3JcT
	 GfKBFXXhbQa3GBzLC1PBTLOnwkhFzyjQXcTNJG8PN4O1TUl+kRbkgu8hDSAumqgLG6
	 gAqQ2fOW2ZzGJR6xqeXzU86+kvAfnxYp6NifGz4GfA41171Xq8hYyTjIWvGAMZOkBk
	 wlRiOP7KBUbKrq/7gFeKm23T4MXD5nyx34EHl/GU4Pol7b34pK/v9C9T5lx3fi9iuE
	 wic8qvfg9pIMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E05160D8A;
	Fri,  4 Sep 2026 12:18:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 374ABF14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F050D80F20
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eqxyq3jCKCMq for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EBAD580F24
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524307;
 b=R1pInz9mVCbBl55zg2U3cfIdeanmt4Oq3xIQ2ZCK2/cOipitrDdisVppM5ze/GEcGZwq
 /kpql1ze7RA+mszDzbpf0WZIXER2LTsb1FaMDVjvsdhTWkYp6139JXcOgYp5RAJo0CjOt
 pk7k4J8xyo3VBoJO9s98aREjnY26owj7QrMfennC4PVyAnhg/g5u4olEhV8YmIGukIUjy
 ISlJPTVpVz/y8RLEA4Qt/Aqbpbh2dlIi+xR31jPk52fNO1G0W/yqb0KJza6Mv+QnyLEYQ
 PKq9PZTewIOLCfnG8xP+nm02y6WMiJ+w1wPU8pvQoxA/k08boFcu5xyDQDFkRGJN2QA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524307;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=eT3iBXtimU1NODtELbOQPJ6UROOMQ7Zpb9uC1wj8TzA=;
 b=E6xr+0NJxB2wkKoaaahtiYTCE5wY7IsPGK6MbozjhkI6AizxfU3tubXQJaF+K/io6BbR
 MGWK5WTzBGYGGWrPUBQS+c4XSI9VbOXdXisTFrlzYFL1uU0zNwJFSrTRFERK4kFyefBLK
 yvV9NC3by2IHh4ag3smA5R7bcbhjeuWIj+Fdxtq0nL4lg3whx6f9nBC0VrgNBsB3i1uLv
 wxKGm/GCbBQt6c1tiv2bGte8LO3BGzkr5/SxDbsdeQMu/IwnqDnBmUsSSQlnUmml7mhtH
 YFnq304VjXftugFp3rcI5/MipgT0yDTGPqMG5h7w0FUg5+lzS1jDtRmC/g+1oKU0sNA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=gP9vQTmH; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBAD580F24
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49b8687630fso8694095e9.3
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524304; x=1789129104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eT3iBXtimU1NODtELbOQPJ6UROOMQ7Zpb9uC1wj8TzA=;
 b=Q0XWWtXffbQjLd8H/QePdT2LeWf2q3Th3UC61KCzi2+A/euOftW1nkr+8sCGbQ7Vz4
 Q1iR3z2MMBlxRvX4dJ5vsRDn3+0kzJhuMoiXAO+sFPR6Gy5ba5zOZbi/U327BDYLzez+
 a8wY6kq4V7a1OQnHIUFXAgZuBQDPsNloCquZMzP2uL474vpVV7corWvufT2HuaXvq+Q6
 keZFY4oVF2rfovcyCfZI93gn5rtZJMecTJWtPqIk9vWNo0OAmP7rAWXMuZPEFobe0qNS
 s3zIzHMh7M1e0nSfbaflJ9qKU5lMULW7bQxtA8p0cH5dtsElGGsV49lAHoWAHj1elIeO
 fgSw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxDV6aAwBubUhT2H28yBjngSHLcYwOngy+IZ4ZLZsdN9cV8d32WNIfNJO/VNYwrxJn8f1Mh69NtdXg=@buildroot.org
X-Gm-Message-State: AFuF++mnVVJtyUBYWmyb+2L1cVSh2TyMZY3IO3SWHtidwSwohUxOL2En
 6St44Lom+J6PwwGOka8fOZ6QQTln3pMGUMcHO9S/GNNHvtVEr/pifD6oJoYb9BCon5qgw4T7LP6
 4MDin
X-Gm-Gg: AYBFou3DPs/AckfKiJQPQ/XLOWHfPTb49+f+OjMhLQHsM9FQndXk3Sw3GYAir74yBVQ
 NkzIvLl+ozhMM1ZOGVs5D4owADUOyKRtvcrUd7gvMRPlfTRUouI8bVcFz11KH4KUF4fBT5NxFDI
 eNHF4OpPyRdjSpRz2HPxsO/cYLIESwrZqVHVUIWrjhYIvPYyXvY/H2gsO+xNDYaGtiowPMyI7j/
 peepev8vdzJP3D4zlfCaCtIuob/M7zPkU/MOZ4VVx4olrP2s3uDLUQK/FlWapNxV9aAq/GgZbjG
 RiwkI1GvuIu/fHl9Hh2uMxpaBeQOAAI+Qo2jJGh1Q9zV5cODtMBc3s34yaeLSaMOgP807rhyIKf
 KS+QvhZJVztdCCBfenurtPnjdqEpalW1Hf3qJrX+FZvdjl6l6LlbqtBmwOUIz/OaKOcknXLuEpI
 EPUuUdZXUMha21Lh4O6qjlscd2JSEGBEV0TTN23VatFjFzyZ00V/+jFw==
X-Received: by 2002:a05:600c:474c:b0:49c:f4e1:4c2d with SMTP id
 5b1f17b1804b1-49cf828cd70mr50803925e9.16.1788524304457; 
 Fri, 04 Sep 2026 05:18:24 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883a9b49sm5187072f8f.17.2026.09.04.05.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:23 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:23 +0200
Message-ID: <20260904121823.405189-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815130430.1016271-1-ju.o@free.fr>
References: <20260815130430.1016271-1-ju.o@free.fr>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: fs: new cramfs runtime
 test
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

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/15915576004
> ---
>  DEVELOPERS                                    |  2 +
>  support/testing/tests/fs/test_cramfs.py       | 42 +++++++++++++++++++
>  .../fs/test_cramfs/linux-cramfs.fragment      |  1 +
>  3 files changed, 45 insertions(+)
>  create mode 100644 support/testing/tests/fs/test_cramfs.py
>  create mode 100644 support/testing/tests/fs/test_cramfs/linux-cramfs.fragment
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 4460523447..586407a200 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1856,6 +1856,8 @@ F:	support/testing/tests/boot/test_optee_os.py
>  F:	support/testing/tests/boot/test_optee_os/
>  F:	support/testing/tests/fs/test_btrfs.py
>  F:	support/testing/tests/fs/test_btrfs/
> +F:	support/testing/tests/fs/test_cramfs.py
> +F:	support/testing/tests/fs/test_cramfs/
>  F:	support/testing/tests/fs/test_erofs.py
>  F:	support/testing/tests/fs/test_erofs/
>  F:	support/testing/tests/fs/test_xfs.py
> diff --git a/support/testing/tests/fs/test_cramfs.py b/support/testing/tests/fs/test_cramfs.py
> new file mode 100644
> index 0000000000..8beb27f4ab
> --- /dev/null
> +++ b/support/testing/tests/fs/test_cramfs.py
> @@ -0,0 +1,42 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestCramfs(infra.basetest.BRTest):
> +    kern_frag = \
> +        infra.filepath("tests/fs/test_cramfs/linux-cramfs.fragment")
> +    config = \
> +        f"""
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.44"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_CRAMFS=y
> +        BR2_TARGET_ROOTFS_CRAMFS=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        disk = os.path.join(self.builddir, "images", "rootfs.cramfs")
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
> +        # We check our root filesystem is in cramfs format.
> +        cmd = "mount | grep '/dev/root on / type cramfs'"
> +        self.assertRunOk(cmd)
> +
> +        # We run cramfsck on the filesystem.
> +        self.assertRunOk("cramfsck -v /dev/vda")
> diff --git a/support/testing/tests/fs/test_cramfs/linux-cramfs.fragment b/support/testing/tests/fs/test_cramfs/linux-cramfs.fragment
> new file mode 100644
> index 0000000000..91bc54bed3
> --- /dev/null
> +++ b/support/testing/tests/fs/test_cramfs/linux-cramfs.fragment
> @@ -0,0 +1 @@
> +CONFIG_CRAMFS=y
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
