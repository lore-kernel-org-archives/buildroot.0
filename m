Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C8ED5B161
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6074D408CE;
	Sat, 13 Dec 2025 20:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UB1DFyVgy4Ll; Sat, 13 Dec 2025 20:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9161B408D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765659555;
	bh=xyVoleEhnC4G1+P/SsbH1iXisx1WIEFB8ZyFEGueUlQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r8+fYgN4OM83UCK9L+kYmZAn0tACZrcNb4huF8uxNUWkMpKU6dACjPVVFSEHc1rUE
	 r97u135yUjW1IUjPWPa+fsT7iooHwZ+Hw+C3SFcdRnRH9hJrhnpuJzk/y2QV1Q5XVW
	 cuq1p1uIZuN0VQ8+owLesuzddygdmRIHVTfNBLenHyRvvW3y5940SEaTe5Ud1A5KDV
	 LnydBloMRQ3Fs/yD3ax4MmOrKMJO0dhg1p9ea2NnTcUN7PGd5+JuKNO9ZQ7AGJkUVR
	 JvLWJS82nR8VXi/NT7+IGocF2+Fk9L0pPMTfYdRM5DfoEIn+8e4fxB/Mr7Wr0QH9G+
	 IV6xAIcwHwIPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9161B408D2;
	Sat, 13 Dec 2025 20:59:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE3BF2C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBD0F408D2
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3lV8s_cFS6p for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 20:59:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D17A7408CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D17A7408CE
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D17A7408CE
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:59:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4E9992003C3;
 Sat, 13 Dec 2025 21:59:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 21:59:09 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 21:59:09 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251213201427.1347221-1-bernd@kuhls.net>
References: <20251213201427.1347221-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <6ceb5c00ea7ca98de447ea15ef0f9eff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765659550;
 bh=BLz5WU6y2/WgAUEMAw9eXTDR2mgcDtWojp52V2EanQE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F30EvAKtGzqtsX5p11U9ocNsGs1xi9GJy863ZEVRqG1TOAzgKlo1c//quveVNbsy5
 FsjBlyWDfbp7SX2BcwCMsD7qLHFjsC/n4F1ZXbDEQ6xlCgquIt8i+4SWGQn7RbdLmd
 yzs/iOfk7I0+fACIDJ8VsTOVlqSdJADlfMXpjiZCzE4FcddtH2jyNCGBJrMUFbMdLx
 iZ98TfvnDoX2qT1oSlttXt0mCfjYyL8qVSBFrakHo/kTIaRMFDuELOuLcTwBxNk8Hm
 8VJBQ0sufW/pGj6PMRj3YGjOPlSZU9zEpH9EetcXoiGGofo4mNNzoNRbKrYxirCl2a
 HT3R6m0ukT1kA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F30EvAKt
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libdrm: bump version to
 2.4.131
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

On 13/12/2025 21:14, Bernd Kuhls wrote:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2025-December/003646.html
> https://lists.x.org/archives/xorg-announce/2025-December/003647.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
