Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE07AE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 11:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F2F48115D;
	Wed, 11 Dec 2024 11:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OdW0R973Pjr; Wed, 11 Dec 2024 11:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 434A881BB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 434A881BB0;
	Wed, 11 Dec 2024 11:34:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8F88962
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 11:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B90A881BB0
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 11:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcGoTyectFW4 for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 11:34:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4835D8115D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4835D8115D
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4835D8115D
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 11:34:19 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 3D161C0160;
 Wed, 11 Dec 2024 12:34:16 +0100 (CET)
Message-ID: <dcfe20ba-9a00-4faf-9cd8-9e800c566d12@grenoble.cnrs.fr>
Date: Wed, 11 Dec 2024 12:34:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: buildroot@buildroot.org, Chris Packham <judge.packham@gmail.com>
References: <20241208214748.524923-1-geomatsi@gmail.com>
 <dcbd3f77-e737-41a2-9f23-87141d0bdf9b@grenoble.cnrs.fr>
 <Z1in3yM7ddVMYEqq@curiosity>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <Z1in3yM7ddVMYEqq@curiosity>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1733916856;
 bh=WclzdAcboZGu0AuPeS4w2QDK06eN08bFb6K+KSiPF6M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W1vB0eyfbwi4DpbFOJyo4eQXOcdnMYXDrPBz16Be3UofsU9wSi2GiMXtIv2izD0XT
 lRIY/JsYt+cWMs7Sm8nK9SelGSjpmFvs2NrZrJH2uDbU03RLXmXPnthXTTdhm4UKH8
 Em2PhaOvlj34I9X2LShNF2DP2gYQvgLJPYQ7MnMg1FCbGTcyMN14pO3Ezsfh1Ha4Et
 JHIicZFVxE8bjCgEkDEh6Kx4ohOPYwj/5jcnA5St8S3ZubYE43ruRCGL783yCeVXhF
 ybl2L+er/z2RtKErF0FYNjfR4bYCRsRnbjAxK5N9kmkNmN6qWf754Ie5q2pT3H+4gY
 8Tqnq+FLTHUKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=W1vB0eyf
Subject: Re: [Buildroot] [PATCH 0/3] {linux,
 linux-headers}: add support for 6.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

About the incompatibility between Linux 6.12 and
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH, Sergey Matyukevich wrote:
> IIUC at the moment Buildroot includes the following configurations
> that make use of BR2_LINUX_KERNEL_CUSTOM_DTS_PATH: [only 5 of them]

Oh, I hadn't noticed there were so few of them!

> Adding new v6.12 kernel is not going to break any of those boards
> right away. However if the build rule for drop-in dtbs will not be
> re-enabled (which seems likely), migration to new kernels will be a
> problem for those boards.

Indeed, this is my concern: I maintain the defconfigs of the Acqua
boards (acmesystems_acqua_a5_*), and I would like to upgrade them to
Linux 6.12 before the Buildroot 2025.02 release.

However, this issue will also affect users that build (or customize)
their own configurations with `make nconfig` or similar. If they select

    [x] Linux Kernel
    [x] Build a Device Tree Blob (DTB)
    (some_file) Out-of-tree Device Tree Source file paths

and leave `Kernel version' to its default (which is "Latest version"),
they would end up with a non-functional configuration.

> I don't see how BR2_LINUX_KERNEL_CUSTOM_DTS_PATH can be supported in
> this case w/o patching new kernels. Probably it makes sense to convert
> those out-of-tree dts files into proper kernel patches ?

I see two options for patching the kernel:

 1. Use Chris Packham's patch "kbuild: Restore the ability to build out
    of tree dtbs".[1] This works for me: if I drop the patch into
    board/acmesystems/acqua-a5/patches/linux/, I can change the kernel
    version to 6.12.4 and it just works. It seems like the path of least
    resistance for individual defconfigs, but I don't see this becoming
    Buildroot's blessed way of supporting custom DTSes.

 2. Create a patch that adds the DTS to the kernel tree _and_ the DTB
    target to the relevant Makefile. I guess this is what you are
    suggesting.

If we go for the second option, then we would be saying that a kernel
patch is the canonical way of providing a custom DTS. The
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH option would then have to be deprecated
and eventually removed, which would be a breaking change for some users.

I would persoanlly prefer updating the implementation of
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH in order to make it compatible with
6.12+ kernels. Maybe Buildroot could, in addition to copying the DTS to
the kernel tree, add the relevant target to the Makefile. Basically do
what the patch in method 2 is supposed to do.

I could try to implement this approach, but it can take me some time
(the `make' language is not my cup of tea). In the meantime, I suggest
that, in your patch series, you update the help text of
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH in order to warn about this option
being incompatible with kernels 6.12 and up.

Regards,

Edgar.

[1] https://lore.kernel.org/all/20241015212830.3899891-1-chris.packham@alliedtelesis.co.nz/T/#u
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
