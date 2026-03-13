Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63615107BCE2
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDE0181206;
	Fri, 13 Mar 2026 20:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p__U14Q0mvd6; Fri, 13 Mar 2026 20:57:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7DFB80DCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773435445;
	bh=kO5WRbSiOC97m03bej4uKJq4inFMjH0YnfgUcUo1cGQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f8QaqCCyHQEsePZiqikz9nmxsitBD1AYgRmDOxXoYmJ2reRH+hIZS7Gj9GKhMyjlh
	 ao4hz62QrhCulEjRA8gf2dJ5VYSgScsdIra+hQYkngBEf0lDb/tHfZA6tadKUzzX3V
	 fo3Q6om3Q6oDmF25+rc8g1L+EJpLP2aDAAdooNTk4fXloLfp9zcBWCjf4+xja3Yqa4
	 4tG5Q8yhjuHApGUCsbMQMVa/H2P57YOfmU+oabQ+Qw54KFATyrQtaUxZykcIqVBky/
	 522fThZxFnU1FKz2USgwfhA4VSaVytK7vVI8K7Hw6+czanIkkn4E826Gr4/KrIbMf8
	 8R4p58ijR975w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7DFB80DCD;
	Fri, 13 Mar 2026 20:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 82DE6201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7443D80DCD
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2B0wu0id_I8L for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 38B1080C66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38B1080C66
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38B1080C66
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:57:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A72AF780333;
 Fri, 13 Mar 2026 21:57:18 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Mar 2026 21:57:18 +0100
MIME-Version: 1.0
Date: Fri, 13 Mar 2026 21:57:18 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260303202708.2065406-1-ju.o@free.fr>
References: <20260303202708.2065406-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.13
Message-ID: <d90763e9dec2c5032dc847cf586ca4f4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773435440;
 bh=yZa0vrLGejzL652s/+yAnVlYZY+2MbB2DWiktuNjS+Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YjJoEU4bekOgiwcC4xTFAD0eiX5izmNqlav/RzDD3e2DN9aMFpsiP9R2BmYDBy2gl
 NisMmPv4rly2zRA0f+rN9sFbzikgjSQj8ydwFb3G+4iuc9dle4bzVj2IgT24RivgC2
 XTpy5CwvhMF5VN8Z9wZpdBes9utRRtk1y0zyKohJhnQWB9I6iqAv0RczxF5B83OsVl
 mthdlKiMFYM37lRk/jzZuU39z8Xjzb3BjUdSpedNZJLJxfg+TUPVKQDaSX7P1u+SZ/
 kiHr0JOvUcECqe5NHTRnvAgxk0wFqKEum+18aIR4MsO5USeNK90ZWboY81zGXYeoOx
 xnWz5uTbS7FIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YjJoEU4b
Subject: Re: [Buildroot] [PATCH next 1/4] arch/arm: add the Neoverse-V1 core
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

On 03/03/2026 21:27, Julien Olivain via buildroot wrote:
> This commit adds the Neoverse-V1 core, which is an armv8.4a ISA.
> See: [1] [2].
> 
> This CPU support was added in GCC 11. See [3] [4] [5].
> 
> This CPU supports Aarch64 at all exception levels (EL0 to EL3).
> It also supports Aarch32 only in EL0 (user-space). This means it's
> technically possible to compile Aarch32 code. GCC has the support
> to do so. Since Buildroot recompiles a full system (ATF, Kernel,
> user-space) this support has limited value. This is why this
> CPU is limited to 64bit builds only.
> 
> Qemu added neoverse-v1 support in upstream commit [6], first included
> in v8.1.0.
> 
> [1] https://developer.arm.com/Processors/Neoverse%20V1
> [2] 
> https://developer.arm.com/documentation/101427/0102/Functional-description/Introduction/About-the-core
> [3] https://gcc.gnu.org/gcc-11/changes.html#arm-targets
> [4] 
> https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-11.1.0#l141
> [5] 
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=c9d56eb777552ac5ee0c281e1f6e34b6fe929b77
> [6] 
> https://gitlab.com/qemu-project/qemu/-/commit/c74138c6c040b62e941326a4fbb25a93fdd35b72
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Series applied to master.
For the record, I added a note in the commit log about the binutils
support for Neoverse V2/V3.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
