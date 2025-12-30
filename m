Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A00EE498E
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 17:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E00660714;
	Tue, 30 Dec 2025 17:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYLMuKXcItWS; Tue, 30 Dec 2025 17:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66ECE608EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767115325;
	bh=6z96oWhJIA9xIezAPN6s6OdyO5bKTH/SRIa+Ev7yndY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WDJs2o8EoCQBMELGvwrSxiUoDxxofnNbEoOJI7kEXKZFKPqHxtenlxaOL/vw4Zx/U
	 rW78GvjDU6voSl3eBpvhzhxqgTA4iwAD5Sqn0yQT/gpiD9ccsQDXI4c0X1wLUinYjj
	 AbcrnchHeuIDYjsH4THfZ/+3dRvn/kOz9Ux0oYfjc/I7/MVZTMHqX7u9nqkdDr4XNI
	 gp20LfZI+eIPS1QqkqV6c36dgFVc79lbfZ9GW8Flc2UzKgyabTdu5L12rcGqlo/Ebd
	 Kb9n5xo/EnA1vnTlc8nCic0ma5rAT8XMcvUTV5NcoYxe37ZD2vopzGrEUVo5Jz1Nn0
	 2MHG240YSFIXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66ECE608EB;
	Tue, 30 Dec 2025 17:22:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52DC9D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 448224035C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fQGZ2XumSzE for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 17:22:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3D4FC400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D4FC400DA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D4FC400DA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:22:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 59F922003C8;
 Tue, 30 Dec 2025 18:21:55 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 30 Dec 2025 18:21:55 +0100
MIME-Version: 1.0
Date: Tue, 30 Dec 2025 18:21:55 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: brvs2022@outlook.com, buildroot@buildroot.org, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20251230141201.33e6e44f@windsurf>
References: <MA4P292MB00676659A30D80724F77DB70CBA1A@MA4P292MB0067.ESPP292.PROD.OUTLOOK.COM>
 <20251230141201.33e6e44f@windsurf>
User-Agent: Webmail Free/1.6.12
Message-ID: <70c64c2ca980b0d4b9b1bb5fe74d0675@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767115318;
 bh=uyEJwa3OrufqwLmxJhw1Fxs1QGOVw0Fexmm1wyvHMKs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iXtnZ0qaj0LABf07ThL0WCe++pO5+4zkKj0NXlfgl3CJH9Ek5T+1JDzZeOKH+4XeR
 /PR9RHKctkj+miC9+UIjkMvck8GwOf/RD5DhXCPMirN8vDErLFGHF837bgwXvH6Y8T
 L8YpygMCLxcOEPVcmy7YNXxf5SoigytjAd13mM0ArIxtNofNJK1ziugSVg4pfzmiDU
 4t+3Ib9G4rFxZPGE5nJTmvhfy4iipbgSlmD2t1Xng9KMKwb9pdbiKzKp6XqUEV012j
 qX40Dhk3v2/hwbbCf6B7u0nLhm1R/H5mVLrckk3KAbhAZHhIelyqmwdpYG35wkR+vn
 uu1VjeQntiQLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iXtnZ0qa
Subject: Re: [Buildroot] [PATCH] arch/x86: add support for x86_64 x32 ABI
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

Hi Thomas,

On 30/12/2025 14:12, Thomas Petazzoni via buildroot wrote:
> Hello Trevor,
> 
> Thanks for your patch!
> 
> On Thu, 11 Dec 2025 09:58:29 +0000
> "brvs2022@outlook.com" <brvs2022@outlook.com> wrote:
[...]
>> Add support for the x86_64 x32 ABI, which uses the 64-bit x86
>> instruction set while keeping 32-bit pointers and size types.
> 
> Is this still maintained/support in upstream gcc/glibc? I have vague
> memories of discussions about dropping support for x32, but maybe my
> memory is wrong.

You may refer to this lkml thread [1] from December 2018.
Kernel CONFIG_X86_X32_ABI is apparently still there, as of
v6.18.2 [2]. It also seems Kernel and glibc are still receiving
patches for x32 from time to time (e.g. [3] [4]).

So even if it's a "niche" use-case, I believe it can still be a
candidate to be included in Buildroot (because x32 is still supported
in current and upcoming versions of upstream kernel/gcc/libc).

Best regards,

Julien.

[1] 
https://lore.kernel.org/lkml/CALCETrXoRAibsbWa9nfbDrt0iEuebMnCMhSFg-d9W-J2g8mDjw@mail.gmail.com/
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/x86/Kconfig?h=v6.18.2#n3140
[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=2883f01ec37dd8668e7222dfdb5980c86fdfe277
[4] 
https://sourceware.org/git/?p=glibc.git;a=history;f=sysdeps/unix/sysv/linux/x86_64/x32
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
