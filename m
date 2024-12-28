Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96767E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 18:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3346040234;
	Sat, 28 Dec 2024 18:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcnR1ypuh7_R; Sat, 28 Dec 2024 18:33:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF8BA40259
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF8BA40259;
	Sat, 28 Dec 2024 18:33:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9235DE0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 18:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D10A606C2
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 18:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xnigp4AFLnB for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 18:33:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E37A60748
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E37A60748
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E37A60748
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 18:33:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 173B713F8CE;
 Sat, 28 Dec 2024 19:33:08 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44580])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Dec 2024 19:33:08 +0100
MIME-Version: 1.0
Date: Sat, 28 Dec 2024 19:33:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: buildroot@buildroot.org, mark@dibsco.co.uk, alistair@alistair23.me
In-Reply-To: <2761179.mvXUDI8C0e@kilian-laptop>
References: <4632342.LvFx2qVVIh@kilian-laptop>
 <3f1890a6dce4859431fb9b8d0e4747e9@free.fr>
 <2761179.mvXUDI8C0e@kilian-laptop>
User-Agent: Webmail Free/1.6.9
Message-ID: <ead4cfe5eaae652ae308c78b6b23e66b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735410791;
 bh=zVcFpbq//wAoNBoZWGXxJhCeWErvhzlYsixIGaeQq1A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MpERNhvlrWs7V97PdtiLwdv8LzJyBpLo08nSOU6Yr8in81oODRV/mKXrkiPwPMO6I
 P2pKNcLzSxXwa+GI0WMmaPYHzYBn3GsyUVbGPgsgEaUF+Pf79IBMKLuSP98B4iRU93
 m/BRCnNnqYdMWOCXejTbpqrcL8w95TJzsqHi5qUT6JafdXaH8rABRMSNwyUxrkACli
 PiLOm7HZqO2pWz4OG8ULBt42uXG9nTFnWvZYm81O9aPqzNCFjQeZc82lfY31TXrRt+
 VrfFmY/IxsFniGqfdDKGLvKHZDz8/xUGB1OCRdrww/KqMhzA95uV0epFn65jWQ3crh
 W7xAo9dk/ssAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MpERNhvl
Subject: Re: [Buildroot] [Help] How to bump a package, e.g., OpenSBI?
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

Hi Kilian,

On 27/12/2024 19:31, Kilian Zinnecker via buildroot wrote:
> Hello Julien, hello Mark, hello Alistair,
> 
> Mark and Alistair, I added you, because you are listed in the 
> DEVELOPERS file
> for qemu_riscv64_virt_defconfig / OpenSBI - hope its ok ;)
> 
> [--SNIP--]
>> This is correct. You can have a look how the previous versions
>> were updated, for details. For example, see [3].
>> This will update only the default "latest" OpenSBI version. Usually,
>> defconfigs in Buildroot are using a specific, fixed custom version.
> 
> Thanks Julien! I locally adjusted the OpenSBI version number and the 
> package's
> hash. Then I adjusted the used version of OpenSBI in the
> qemu_riscv64_virt_defconfig and started a build: The build was 
> successfull,
> hence also the build of OpenSBI v1.6 worked. However, when I try to run
> output/images/start_qemu.sh I get the error, that ROM regions do 
> overlap:
> 
> The following two regions overlap (in the memory address space):
>   fw_jump.elf ELF program header segment 1 (addresses 
> 0x0000000000000000 -
> 0x00000000000271e0)
>   mrom.reset (addresses 0x0000000000001000 - 0x0000000000001028)
> 
> I guess, that the OpenSBI image had a different starting address in the 
> past,
> leaving some space for mrom.reset? I double checked, and when building
> qemu_riscv64_virt_defconfig without modifying its OpenSBI version, it 
> still
> works, so the problem must come from my changes. I am not so familiar 
> with
> OpenSBI and also not with Qemu and hence was not able to find a 
> solution to the
> problem yet.

I was able to reproduce this issue.

I was also able to work around it by replacing "fw_jump.elf" by
"fw_jump.bin" in [1]. See also [2].

So, to summarize: it is OK to bump the default opensbi version to 1.6
in a commit (without touching the defconfigs) since we are able to
make it work in qemu with a workaround. IT might be a good idea to
add a reference to [2] in the commit log.

Since we learned that opensbi 1.6 no longer start our qemu defconfigs,
we could update those qemu_riscv{32,64}_virt_defconfigin in separate 
commits
to use opensbi 1.6, and also the corresponding
updating board/qemu/riscv{32,64}-virt/readme.txt which is used to 
generate
the output/images/start_qemu.sh script.

> I also tried building qemu_riscv64_virt_efi_defconfig, but that board 
> seems to
> need a github login to fetch some package. I didn't look into this in 
> much
> detail yet (e.g., whether it was my fault for some reason), but I am 
> planning
> to have another look at that and then maybe sent a separate email for 
> this
> issue.

This is a known issue. See [3] for some details.

> Thanks and best regards,
> Kilian

Best regards,

Julien.

[1] 
https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11/board/qemu/riscv64-virt/readme.txt?ref_type=tags&plain=1#L3
[2] https://github.com/riscv-software-src/opensbi/issues/372
[3] 
https://gitlab.com/buildroot.org/buildroot/-/commit/47fc9e5509837260310cd7e41335fade29b587b1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
