Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352B7103E16C
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 12:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C29A780E73;
	Wed, 18 Mar 2026 12:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qx6MUze8XrWV; Wed, 18 Mar 2026 12:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3711880D64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773836500;
	bh=/1GMvuhAF7OIQdot0erd1Cy4N+2H1RrDLZ0UzkzHuc0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l/hxcvxyT0QPAIektCns9qcuqJ2Cj3NmmYT7n4i81sGsISrlQ9HjNun5FlKFYLhrz
	 MnjCCeWIjnsiRZtJEIUL2iN8F27TZZ5tijxNE4vWnB1M0aiDmeXZzzEI2h6dFWWV28
	 is+bT5K4Qj3fNjm4tN42DVJJ13zQ4afk8ffhju0bX2N/cTMDAcC4kTgIvoZx+BYdxe
	 QsIX5BaguMYe6B36nKG2wSG0GH5YmeRz/66U2W2hUIVMbEWQyVRg5V2Gn3Du1sXcwo
	 EwQHM09gRmQNmkl/wneFMXfJGCjBRfeQ5SiJq7B3ibdyY86l/XNvfgn6OdiREGqdNP
	 7cJoRCbltHTqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3711880D64;
	Wed, 18 Mar 2026 12:21:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BCA181BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A17BF403B0
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-JqaTBRy7LE for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 12:21:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CBA58403A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBA58403A4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBA58403A4
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:21:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 86EF419F59C;
 Wed, 18 Mar 2026 13:21:33 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Mar 2026 13:21:33 +0100
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 13:21:33 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Jesse Taube <Mr.Bossman075@gmail.com>
In-Reply-To: <20260317184810.3143452-1-giulio.benetti@benettiengineering.com>
References: <20260317184810.3143452-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <34ebb5ebcf442bf74d0ddf9ad092cfc5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773836495;
 bh=Bmdkkt1hUZklDOWbqZG/qZZHQ4GhthNVukdormLMCNg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eyApQg6aWWqJikD+3HBoHeD9ZSpPTI/+VaYyvRWzG/Iu3iROOhaKFIG+QZY05I8Mn
 CEyjC8Fn2GMtxv+6k0o3K0thPrIvNGFYdEwFIIkdYLckDq6g8DTfCWPNnHiAQYP3Wz
 Hory7Yh9kFzJzcuzpxEdSveXeLa6s81WiqvOT1DdmfOWSy/AXfHOwAOTgVmWub2yDE
 em1+DkVGSLOAO4OA8jQd1Qorryg18VTLXg5stw7OSpLOXsaVAWryw7jgGWpptdy0sr
 Ae9nvLFhjdPY48WSsGqUzvR+Zq/U28lXuWqZMXWUning2JV0KVkjVEBwv7BKEsHWST
 ZPPsFpuutA+8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eyApQg6a
Subject: Re: [Buildroot] [PATCH v2] configs/imxrt1050-evk_defconfig: bump
 u-boot to fix the build and bump linux too
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

On 17/03/2026 19:48, Giulio Benetti wrote:
> Python setuptools has removed the obsolete pkg_resources python module 
> in
> v82.0.0. This module is used by the binman command in U-Boot until
> v2025.10.
> Since the python-setuptools package has been updated to v82.0.0 in
> Buildroot, the iot-gate-imx8_ebbr_defconfig (using U-Boot v2025.07 and
> binman) fails to build with the following error [1]:
> 
>   ModuleNotFoundError: No module named 'pkg_resources'
> 
> Update the defconfig to use a more recent U-Boot v2026.01, to fix the
> build and at the same time bump Linux to version 6.18.18.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/13476922027
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
