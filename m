Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4816C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 15:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91B3540941;
	Mon, 13 Jul 2026 15:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OnGmIadb2pA; Mon, 13 Jul 2026 15:58:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B705D408FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783958289;
	bh=MtEdi1D3cEnOLTuFHw/M9dQ/bchSuv46Q+bl1bcUcJM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VTsrYfXGa16KHGn1m44gq8jlaVA6CIszw/LNZokn/2SkmjjFSPJEWr/str/DbC8Zh
	 SeF9AIMJTRYZ120oH3E1oXQgAyDqoFZlWaXZwxMfiMAvdMsNdLR8Gw1ou9RlBB2Wll
	 mAj6Ku3mPZqzqeJEu6M89hNUHTcHmeR7PLSV7gc3AUpXo0gP9PIrwfjG92dmh9AByh
	 JSIZubhzf2CA4p4/9t7MrKHV9ZuIe+ZjIET4LvDkiqymuVni1YcBwbO9Im2zSjW1Bu
	 P/j1S3/7EABtPA7TMVQq5MfBGIL+Ye9Dc1igBOdEljg50ii4VhVXAFrOdyVTNB3lQA
	 pl8vVOduPpLqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B705D408FC;
	Mon, 13 Jul 2026 15:58:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E15728D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FCE480F14
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xrz5pSvUpfjy for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 15:58:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 331EF80F12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 331EF80F12
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 331EF80F12
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:58:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B6BE05FFB7;
 Mon, 13 Jul 2026 17:58:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Jul 2026 17:58:03 +0200
MIME-Version: 1.0
Date: Mon, 13 Jul 2026 17:58:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260703194848.3699100-1-bernd@kuhls.net>
References: <20260703194848.3699100-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <0f28a191befddb882ef178e743ebd120@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783958284;
 bh=jlZKzZcqaDv6OrtK7an2kj5v2FDCLkeousx793IGGtc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gFl5X1Lzz6IIX27KVD1MMGX/jlE0lqlUYyvhpzRtSJdK8aZ+683mGd29nGZSf0fTr
 obb4oHFwCeMwKjA5jpl+qHVG3AeUtANYwtj43wYp3S0ua8XsQSx8Flb4DnfMxARoGS
 oiviJ2+lvhaxszHdyYNuzC2EuAO464JGCCu1Z4n66W4oAAj5CNKwslvE8tndVPizF2
 q0Xf07d5yPorrhB7NeO+2cna4yIEgJU4LavSSfxR/fhdoe5gnzwJVVP7dztmHM6O40
 VTZdTPpmvPXfY31/UsgbQ9bgwxNH6fqEpRCmLoZl3ktI6uVDFp92FA5yEv1UOZ9eZQ
 smJk5j+gxg2bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gFl5X1Lz
Subject: Re: [Buildroot] [PATCH 1/1] package/transmission: bump version to
 4.1.3
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

On 03/07/2026 21:48, Bernd Kuhls wrote:
> https://github.com/transmission/transmission/releases/tag/4.1.3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
