Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B142C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 19:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2638B40940;
	Sat,  4 Jul 2026 19:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fSIswqEl29PH; Sat,  4 Jul 2026 19:56:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE395408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783194963;
	bh=FpHSzssOpc3hSDzNVsSNrTJQujM8vmTvtf6rmpSMnFU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LF2UFIXHZqTVkljjYNnD28Xw5h8nzTKrk9Nf0aSYxlbRySzGeBCgNDQkJ3ag5tr4m
	 FYQK20wk7589nTLm0DrbU86zNibcZES+DvTr3kC8xE2UgSvFeSvuWzONMrbtqyJd1z
	 LCU9wYnymYsQddO3g9rR9ShSyAakKjTLI2XzMhpdCTYnmTI8GXydmjSZj8DQ2n+GR5
	 jSOb4WWs3G1ZzgBOpcHTiaZSuda/ysX4uIXROOPw0zU5fn8P/niRenxyXOZ+5X57D1
	 Ho7FnTetA7sWdoNAb0jgBGrAkOnGi6x883fXlHYO2S3k/4GoZk95PXMAHq7KgVylwQ
	 tU310E5qvyNJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE395408B2;
	Sat,  4 Jul 2026 19:56:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC6FD316
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE4A840144
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3b1gpTxSDbqs for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 19:56:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36A7340076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36A7340076
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36A7340076
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:56:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9D05378034E;
 Sat,  4 Jul 2026 21:55:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jul 2026 21:55:58 +0200
MIME-Version: 1.0
Date: Sat, 04 Jul 2026 21:55:58 +0200
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260630132544.1937-1-cp0613@linux.alibaba.com>
References: <20260630132544.1937-1-cp0613@linux.alibaba.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <6322e59bf036508a6674b073d3765354@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783194959;
 bh=PAxUKB1n6g7Si0ssq5pCDJk1aI2xZ604Dzx4nTNtvwc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J5SY4wkBNgDMGKuIZDkGaa0N3wpoz1hyeVpUiuV2NONQI6wtN9wlZTV4JIZOwGRlg
 /QDTgN2yiu3RQORaaX/Zje8fzf8v71tM+b5CztITJBIl1mMlCZMbBswRgJKY4vKzZ/
 ldo9e5siNVe2+LqtzZtnZqKtmTCoqW73fADG9fYrNvM1VGjo0DeL35Bo5/z/9HvT2N
 JrcrlFeyWDtkzVM19PVg9YPUx3e4LefaohtvLfvM1ihzmYnd9qRlHbewruCVtk27xq
 9ObCON+n4FkhVcPyUowHnw02+v2oex/xWb3vnrCKKpsk6TNncUO3FAX+goqbvY+b2l
 LW8iaJrnUIsjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J5SY4wkB
Subject: Re: [Buildroot] [PATCH] package/ndctl: bump to version 85
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

On 30/06/2026 15:25, Chen Pei wrote:
> Upstream v85 no longer requires the -Dfwctl=enabled / 
> -Dkeyutils=enabled
> workaround, so drop both options along with the stale comment.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
