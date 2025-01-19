Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D982FC02183
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 14:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 721F783EDA;
	Sun, 19 Jan 2025 14:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFeBToHAX3qy; Sun, 19 Jan 2025 14:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85F5483EF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85F5483EF8;
	Sun, 19 Jan 2025 14:11:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D3DA69
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 14:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AB9940CEB
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 14:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EH6XwUTuHYFe for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 14:11:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D59C40EC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D59C40EC1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D59C40EC1
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 14:11:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CD55978034D;
 Sun, 19 Jan 2025 15:11:03 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36708])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Jan 2025 15:11:03 +0100
MIME-Version: 1.0
Date: Sun, 19 Jan 2025 15:11:03 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250118195454.905387-1-nemaakhilesh@gmail.com>
References: <20250118195454.905387-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8f24a2fbb5a0517bf5348a1ed5c0500a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737295865;
 bh=NM6+vu05RlvwnqQfhpIGEf/CksnSiU3+HmPf05sszw0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IySKWEopUtZCDrZ2KnDqECcmoA4GLqYtuG5hiRHjTfTgKmbGLvSMGHLKSOWSMTSuW
 OFe2fCl6hUl7B1CaVGKdFNaH/z1dI/Wl15a3NLu37PeuAnGGtjuQ6dIkIT7/j8Jz4C
 v0lmbIzMvEEVdY8I8cZtVkEEWPCeVfsEUtjZNeLZN/R2ZSKKyPGcPLWyz2QGOHhb8u
 PnIszhGi4QtVSS/DNE1Iw0XWuyoP600QCMnadZ+XVNLqxZPO6huWHKteNAI3++wdDD
 vSksh6h0UlnW8w1u5IiPRcxTGYSFvsEpChx5lHGjJW8OO8ATjQvAB54Hl4oa8rMx9H
 /Z2Ct65sgL4ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IySKWEop
Subject: Re: [Buildroot] [PATCH 1/1] package/coreutils: bump to version 9.6
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

Hi Akhilesh,

Thanks for the patch.

It generates few build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1631566160

It seems to be related to Year-2038 issues. For the details,
see for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/11ae90b0011abe3ad01d9953c7d41d444e689f5c

Could you investigate those issues, please?

On 18/01/2025 20:54, Akhilesh Nema wrote:
> Release notes:
> https://lists.gnu.org/archive/html/coreutils-announce/2025-01/msg00000.html
> 
> Drop upstream patch 0001-coreutils-mcel-port-to-uClibc-ng.patch
> https://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commit;h=9765bc796b3e6ceaa7a10ba07c9c2f1e272a4249
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

[...]

> diff --git a/package/coreutils/coreutils.hash 
> b/package/coreutils/coreutils.hash
> index 3455c95c58..1f477cb749 100644
> --- a/package/coreutils/coreutils.hash
> +++ b/package/coreutils/coreutils.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature

Since the release note contains SHA256 hashes. Could you update the 
comment to:
# From 
https://lists.gnu.org/archive/html/coreutils-announce/2025-01/msg00000.html

> -sha256  
> cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a  
> coreutils-9.5.tar.xz
> +sha256  
> 7a0124327b398fd9eb1a6abde583389821422c744ffa10734b24f557610d3283  
> coreutils-9.6.tar.xz
>  # Locally computed
>  sha256  
> 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  
> COPYING

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
