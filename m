Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A257C10D1482
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 21:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2098041100;
	Sat, 28 Mar 2026 21:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qf6BLDaxpf3l; Sat, 28 Mar 2026 21:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E4A540D14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774732550;
	bh=IuzDu9cUytdCAXHhuSHLjjvrBrMtzc6IG4GyTgmhXAQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lXJ9hrDzw84jYasDLqvJOd0IFU7YJGzEZYUhrTsbWUdiel6BuaTn38DfaQ8JkNhQV
	 L/ysfbgB5pIBHKqshV8p1WqNf/s47M4RyVESH0yprxuUVuiZvDPQd0336V/bw7NwQ4
	 k5kXvkHgXyvgix20jJ9E2JUcR8xJThHKEZ4NJxEFxsYItwAfG3Z3z6jwolNx6tcKWH
	 DEnzbc/3cQ+HW0hb2Z3MR4o+tyU4gHahpIwEEbKzoBYgG1hXOfbX880Y9C94QEEnrD
	 Upw10LjGnTULJBYoFL4EZpJyH83ILiYFSNonJqa6ocoQNqK5M3A1gCJbeCAx8DLR7/
	 +IsmZirc3JUEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E4A540D14;
	Sat, 28 Mar 2026 21:15:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE6A610F
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 21:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B05FF4017A
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 21:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2c44khujUd5 for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 21:15:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8EB41400B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EB41400B0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EB41400B0
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 21:15:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5757F78032A;
 Sat, 28 Mar 2026 22:15:43 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Mar 2026 22:15:43 +0100
MIME-Version: 1.0
Date: Sat, 28 Mar 2026 22:15:43 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260328191521.138176-1-bernd@kuhls.net>
References: <20260328191521.138176-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <31f5931a0cc900e59eae98022f60160b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774732545;
 bh=gKBeeMwL+6OG5dAQSJyk9TvUyTCHWgZyAcU+W8iebmQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HpFeCwuiER9K2Ooy+L2LoiPMF5Y81MJh0ioK8HnxCxuxBTbrWxcEnLx2h2N6uyAP9
 WQ0t3oVdPhLxK49Z5+mId26owtp7g9okkZSKodCPTaI6mV/LkOhZyQDtCqQ1Sd9tQj
 Rw/BZqR6C32N7PfDJzEPZvFItvged+/prxV5lKyJcXR/Fdwn9uck09pbp2cRcdmLra
 UWuu0ftf71nggMTf8Nh1U4AevwNBOSiuarYJVXMqEMVmoIml8PyACFWaO92IlGBSCj
 2wtqNmk0LLS8enySNXgNmXGrwpcD9QFAgM2Bpx+A8LFP7TLIM/YZ/1S34S16CE6XZ+
 tYqQIBlejKOwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HpFeCwui
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gnu-efi: bump version to
 4.0.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/03/2026 20:15, Bernd Kuhls wrote:
> https://github.com/ncroxon/gnu-efi/releases/tag/4.0.1
> https://github.com/ncroxon/gnu-efi/releases/tag/4.0.2
> https://github.com/ncroxon/gnu-efi/releases/tag/4.0.3
> https://github.com/ncroxon/gnu-efi/releases/tag/4.0.4
> 
> Removed patch due to upstream commit
> https://github.com/ncroxon/gnu-efi/commit/f3ececb9eba2ad3104b6d39bd33e579091fce888
> which contains a different fix.
> 
> Added patch to fix build errors with syslinux:
> build/syslinux-6.03/com32/lib/exit.c:57:(.text+0x19):
>  undefined reference to `longjmp'
> build/syslinux-6.03/com32/lib/sys/module/exec.c:206:(.text+0xdc):
>  undefined reference to `setjmp'
> 
> LICENSE was claried and new license files were in:
> https://github.com/ncroxon/gnu-efi/commit/71d5d1746ba50378e0e2d563f7d132c421b7b4f8
> 
> licenses/LICENSE.efilib: was updated in:
> https://github.com/ncroxon/gnu-efi/commit/71b05279b196beea0c8ee4398c7dd0c7963d78ab
> 
> This commit reflects those changes by updating _LICENSE_FILES and
> adding the new license hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
