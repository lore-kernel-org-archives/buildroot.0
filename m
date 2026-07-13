Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16231C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 13:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF1A240821;
	Mon, 13 Jul 2026 13:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziNBvEQOpcTH; Mon, 13 Jul 2026 13:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D48A140812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783948930;
	bh=JYeSlLOqJboKPZzsXydDMgTOUQ63iOnUM9ZHkshbSGo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TA6HuYuFJ6eoMi07OR26rkY+5/XqRofHcqLY+BNSs3s/Qdu2pdNy1LhJBm4FAr5sO
	 oPmMu6oc1Hw0MKkI91EljcG6PAdnEoOUJuOAOOkrIeeoPJyHRBxr+PyyyGU3rPXzNC
	 EGgmzyszxZ+FSzn/Mlxxc3r9cv8FMeWc79/SwBKAIG/M49jHha1HIQeD/I9fjZ9zE1
	 mz6bOOcW/v3jz6qjjpprePK8s8XxwZt36erRk9OKZLpvcJz1l0srJr7V9ZcLtJ00MK
	 6/TsNpA+/uU197N5E6dzbmZL7xTE/aS+Jvx4/gNFxaKsnRLsJFUO4bIuDk9cY2akyI
	 9bvyWGHeX3T/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D48A140812;
	Mon, 13 Jul 2026 13:22:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 61D99128
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 13:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5351440743
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 13:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUlwY9ysxGbr for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 13:22:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51E4840663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51E4840663
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51E4840663
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 13:22:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C678F7804FD;
 Mon, 13 Jul 2026 15:21:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Jul 2026 15:21:44 +0200
MIME-Version: 1.0
Date: Mon, 13 Jul 2026 15:21:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret
 <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>, Graeme Smecher
 <gsmecher@threespeedlogic.com>, Torben Voltmer <mail@t-voltmer.net>, James
 Hilliard <james.hilliard1@gmail.com>, Manuel Diener
 <manuel.diener@oss.othermo.de>, Alexander Shirokov
 <shirokovalexs@gmail.com>, Sam Voss <sam.voss@gmail.com>, Saeed Kazemi
 <kazemi.ms@gmail.com>, Alex Michel <alex.michel@wiedemann-group.com>, Leo
 Yu-Chi Liang <ycliang@andestech.com>, Christopher Obbard
 <obbardc@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
In-Reply-To: <20260712095239.1525717-1-bernd@kuhls.net>
References: <20260712095239.1525717-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <d42716972e6b6ace9bdf41fa164a2e16@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783948925;
 bh=yfoE304YsOSCUp5xMYUgtjuDwzDmYfcwUlROyl9YGTM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GQ87jOQxIEpEvJkBLfVApuKY0qX/A2NrMWlCU6nh+46rHpkia4w8Z0cQXxg3YHiYF
 Vv7VpN7GgA1vM+xglWSZDg5GS6Ls74h8ptCzlZhFBgeYCu/bUpVTmHeeYoIOofxBmM
 alBdeV7COwiiAf+caLSwL+e2F3YqIYCpJiJ5FeXagbLfaDxR6Bw/zTT6e0cYbzAPK/
 V61thi8BbfkdAirXDeyYppbCYM2XxP97NBoRo9e5gNMFeuy8VGrkzZs0V5CXNcvR+3
 7m4+wgtwppIvmUcmZfw//OSshdbbefaEKcUJ0PD8i8Mt0nzKL9PWeda2XYwcKUgFYv
 mXwdX1MRkyXWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GQ87jOQx
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump version to 1.97.0
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

Hi Bernd,

On 12/07/2026 11:52, Bernd Kuhls wrote:
> https://blog.rust-lang.org/2026/07/09/Rust-1.97.0/
> 
> Rust received a change in Cargo's vendoring logic which produces
> different vendor directory contents:
> 
>   Add $comment to .cargo-checksum.json to clarify this file is not
>   a security mechanism.
>   https://github.com/rust-lang/cargo/pull/16967
> 
> Therefore the hashes of all Cargo-fetched packages need to be
> updated. This commit changes the suffix of Cargo packages from
> -cargo5 to -cargo6, and updates all hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

When we change the cargo archive format, we usually add a small note
in the "migrating to next Buildroot version" section of the manual.
See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/b0a62a96543065086a6ad7b44f4da39dfa42b9da
You could record the same explanation and reference in this section.

Could you send a small followup patch adding that, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
