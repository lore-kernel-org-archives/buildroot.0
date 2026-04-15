Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69877F428DA
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 20:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E284940166;
	Wed, 15 Apr 2026 20:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBkwG3Vud-OE; Wed, 15 Apr 2026 20:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 387BF4014B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776285977;
	bh=AGLx+1TCaIwfAJm/WjxMeyu3s2nRif3Nr2EQPIExPS8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HBrw1z8kl0Sspz+oUD64MSTeGWwzgx4NQ/G+fBbERnJmYMtkRo5rUdRBGYpusGaxF
	 oKek9a9Qc2VT9QemZeSjh8RaJHwUdAmVXdXx327KpWPRiBRy7Yi+tHiQaIIvvzy7ne
	 Tc3lb/50YmwWQoNjxgOvDnlvNl62r2/4K7kgLyDS//RGY/OB8yfLE3g6y79495wugo
	 HjnnpSoPBBsSi6d+4FkDQ7pYFIdaTa5SRUG01oroJzYh3LMCkycn/47EHTP2VTAqFN
	 FQ16BXVdzc4Q4PEN5qgb4xjDrJPlTbreesq9MoPsP45lMyR1azEdslEQMhAcfCEnHa
	 /FnCvbNT+lxGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387BF4014B;
	Wed, 15 Apr 2026 20:46:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2536283
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A413F600C9
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-3UQmYIUBiG for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 20:46:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF2CE600C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF2CE600C6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF2CE600C6
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:46:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B20C52003C8;
 Wed, 15 Apr 2026 22:46:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Apr 2026 22:46:10 +0200
MIME-Version: 1.0
Date: Wed, 15 Apr 2026 22:46:10 +0200
To: Michael Walle <mwalle@kernel.org>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>
In-Reply-To: <20260414132732.2866884-1-mwalle@kernel.org>
References: <20260414132732.2866884-1-mwalle@kernel.org>
User-Agent: Webmail Free/1.6.14
Message-ID: <f485fcbb94e4b8b4606f9734e8fbd371@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776285972;
 bh=LfotdfT7CLv95ihT/LNTum8+BXGgrDD+IPuwaP3BzcM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k+4CygdMxET/cMVH4N0uLz80bj78gDNZISC9HbBmont66O4Qx7AhX+LbqmnZPIcoS
 4lp40ADZmtDNG32GcYBX0qKujQ9CNlpYtRBIfYAqq8Gz8QHpYmXVGdUpNOG9mVatPB
 kOQqtTyJt0bYKdXrg6EO9N4UgkBXagXZsPWg8xrUQSJk7wi17Y8Tuuv5qFdLKgWDtN
 3ur8hzOgRLNNqO44S/6K2ReW4r05bJXB/T1tq8kpMAfeCzeCK6WE0ecQGApX0G/Gl3
 rz02xt/VNGGvPM6RRj72ztsqwYQmm4atqgCrl9feufc4zxB7ORzYTV0Ent0Ce7Vl4M
 0P3Zdz+bMd1rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=k+4CygdM
Subject: Re: [Buildroot] [PATCH] configs/kontron_smarc_sal28: bump u-boot
 and linux
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

Hi Michael,

On 14/04/2026 15:27, Michael Walle via buildroot wrote:
> The old u-boot version doesn't build anymore because of the following
> error:
> 
>   ModuleNotFoundError: No module named 'pkg_resources'
> 
> Bump it to the latest version 2026.04. While at it, also bump linux to
> the latest LTS kernel (6.18). The new kernel grew in size, thus we also
> have to enlarge the rootfs image.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/13858936681
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Applied to master, thanks.

Could you consider, in a followup patch, updating this defconfig
to switch to external Bootlin stable toolchain, please?
See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/47f4e3810c981e8cee19d8a411b38c771ebd2381

Could you also consider enabling hash check, please?
See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/b71d7eae59f82683e547b60f06538c4a2af8c5d3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
