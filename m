Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6539FEEA863
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 21:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24DA18421B;
	Thu, 12 Feb 2026 21:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlunvRA0k2LV; Thu, 12 Feb 2026 21:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C565A8420F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770933544;
	bh=14U0MBBml8G6qEV/GwNeYXHlC9k5mCog9qp/vXUGdL8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sg1fUOy1Ei360E6M4XxaPcOf1TkKKZQodp/lcLDkpbC5fuFzKiajA8vUoJEgNebxJ
	 onAdO4naD+6qIDdJviXK8BszIQO+v+aGETDwHQ5eETSiebovxtAN9YTPBpo9A6H1t8
	 4rbpKl2FhGbXReJJlMzPo8ArJgijU+gGCGiO/vDS+0LaOJMEfWQx5aLAtwICZLwmhM
	 8L32CNQwmaYhzAOSzHhFinRRNn5X3P4oYT+YUQfg7X2i/Omht4dVxE1HYVZhKFVBDD
	 TxL6tdvKX7uux7HPHwHKfiQRNDGptQoH/i7DNCAIAvSDKf0xieT0RRHRldwVcW9keO
	 ZUVnY98WWwBKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C565A8420F;
	Thu, 12 Feb 2026 21:59:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24C7D1CA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 21:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 072BD8420F
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 21:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nA_ZnqYXCjSv for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 21:59:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 11DF484204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11DF484204
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11DF484204
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 21:59:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 76B15B0053D;
 Thu, 12 Feb 2026 22:58:56 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Feb 2026 22:58:56 +0100
MIME-Version: 1.0
Date: Thu, 12 Feb 2026 22:58:56 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260212192938.1904947-1-bernd@kuhls.net>
References: <20260212192938.1904947-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <56f375303bb4003f3227acbd81c67162@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770933538;
 bh=qiDAx3BLsHd9R+TupaOx2uUWKwB+SaQseIMyJCEuqds=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=avaeiysPlZxadW2bLKMEdaG1W6LqlB8EEQIKaqB6s/ysr8mV2YwAy72FaphhBLULA
 YE20p9PfhoAIn02wzFQJCVLoqBYLDw/+crfsThGLjQcnv+51ej1UwggFxbQhdoESrP
 8oepq8ocARRyrQfygh6KNeBNjXKIasXRNM9tcUrh9ZEPqsBTm4OnBEL8QbyeuSB6ua
 utx44TclPQiHxCUtGiygSqMW5EsscG1eVRjZBkRfILkM2P2h3BtD6VocBcnScl1Aj1
 JnDZQXTn4DPbjt4e5D5cfJ49NgwbWRW6IjdH4mRthQYR6OyoKSoY6swNbnaCVs/mu3
 15eeOaCx+aglw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=avaeiysP
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.0
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

On 12/02/2026 20:29, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-January/000833.html
> https://lists.freedesktop.org/archives/mesa-announce/2026-January/000835.html
> https://lists.freedesktop.org/archives/mesa-announce/2026-February/000836.html
> https://lists.freedesktop.org/archives/mesa-announce/2026-February/000838.html
> 
> Removed patch 0004 which is included in this release:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/f83e86c29f844d659316f891e55b864a98dcd615
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
