Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FE8CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3C680FAA;
	Sat,  3 Oct 2026 16:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RsR9Zu6wa4SV; Sat,  3 Oct 2026 16:25:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 501FC80F8C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791044732;
	b=PtbDRm6Sv9ea4Vb1sLKFqnATbsrRVLgoq7QuZx544G+Cvn4E9lw8OdrA+ocxyhwE34Eo
	 K2ip69hs5J6Yruy7p0kqwyrxmnLfts/fyOeZNz5ZPXRwt5wEPx7sqraYBLxFBFA9BDfWz
	 Ai7+wKq9RmFdlez+ms4p9DSKQ9+QqzICu3CwKTzyhO7TK2Vuc2qZHraNTkc9kbDBYG1lP
	 ISaR3osHTk7YCMhoet1FCbpgam1EoiPg9H+PPUdCN6AsLTQWQo4AUln1qWHm3LprTKqlz
	 CTq7A3+V3P6+zZErR1+o2FNo4qqON23KxKuU+IIqurjLRKPY3GGHdbo9kZNGKKjLdiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791044732;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=02t2YUDvyL8fUrNToJaBDoiLjkj7t7bcTJD3uhLNbEI=;
	b=PLfy/o+/QdtL4Ey/PdEdgsMnZLDegxVWMq5irSoN7h0/ihr/7Xm0jVNt2VaK6QQldsxI
	 rpmS7EE90dajQy6Ep4hdxRgQwy0V+mqirfls9Xkja6Kb06+4NEiCEhutiPWwdwHjWAyC7
	 Crwmf3l9SEpazNcONpPipSdtz2+JgCDta0qzMrkxh8RQ+9SgxtZsp8jTpMb3RmN/BVA+4
	 WOEKr4HLEyn+RmGEOnwsocRwMaVBvAvCLTzrIChRUlzpUT5yuZjmVG7xl4b3lp3scSEnF
	 UMPKsOj3iyVeBPm/rNBSEkzjlqP4cEAXadzkbX9v+2sIEMYduPiJ68mH+1XmBTH4eVg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791044732;
	bh=02t2YUDvyL8fUrNToJaBDoiLjkj7t7bcTJD3uhLNbEI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i6CwIjc1dRAGTWQWUWV0AxJeGntnqw2pLuiQ5GAu10D+ZNq3iS3tmwF6f6zsoV95W
	 9xi3P/JAgyXy71odxsIrzlo69EJpwrhn/yR7CSoDetCs/GL+DxUTa2D+9w5pp2s+6s
	 szvJHnT0++vZLY0JbBdZgDKZ/F2G4giw3yyNRqUBWSUdnQX2XSsmFZi1YVRrFkkHyf
	 LZmrGKd/CXvZqKanDJybVwVzEFlbJMaoapB1CMzHFN4DIPVOF9HMlGmV5XQ2g7SJFN
	 I8WkwryTItRV+awSIf8QLez1HDrID3l46WvdYhokV+GWjdMpZTRi0TRbPGjHtHbqyG
	 AaKLLIgLyoLhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 501FC80F8C;
	Sat,  3 Oct 2026 16:25:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6864335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B810780F85
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvqVUqBi5sx9 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:25:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D42D680F7B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791044730;
 b=AG39oh+X2gkU9pkKnBUgowMqmcCJKM5UCxcqn2qid/6WONHFhsoVsSjUSW27xA7iDP1+
 uSacKLgQ8vvvoxA2p9xaKM6Pn9RluDJa8lUvgxiEOmv+0RWqqn68LdUAlIb9qlJBS9Rnh
 vNLbEc4ir2Dtwx+ZcnDM5a/FKC2n34SJrYTbMalVzX+6ia4tLrR0VZANLEAKdxBtvas0x
 jy8D7KFeP2ose/jdg1WrJfWbmB9G79eZvzKvyocyT2ZbnXlb9dXKUVt8qg3gdkYdL7N0z
 Vd0lQgF7UOb9LfDR1tSsrwQQcANDFp+yxC3pTv+agQ3UkO6Bgar6sNixMPBVDv1iDUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791044730;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=wx8UUQJdCigUyw89yHgSUAfGXjGjTWfQQtmsU3bVufQ=;
 b=VVw7HxE6M9iRLYC7ZLLTqlI3H4RPiNe5v6LX0cBc3vEDXviykRjJn8tWSVhJnieVpQKT
 DFX7eyy5kkdq8rvBm3908+Oon0C1doTQU3fOThp9nLmd7MREhPQv3GBugO7i09XyUTit6
 JYe0m/iGgn3skP+EyFWDXh74B3kRrMHDbtUSdXTss+2L5QybaE6SxutAylGHdbEyVSpS3
 zPLS5XYuoxoIl/wz7h8yxYcGmqZQrXzDf9X9/uaaYrh7ah/52rXGa8BDP3G2X3qVlOxE0
 N6t5xeM1zR14j73YgQNkFo6fOgP5pRNHuKKvmOzIT94EQxING7UUNWCQe+cGBoOr7jw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=eTXrlx0F; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D42D680F7B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:25:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9D0554E41134
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:25:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6AA97604FF;
 Sat,  3 Oct 2026 16:25:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9EEB510328170; 
 Sat,  3 Oct 2026 18:25:26 +0200 (CEST)
Date: Sat, 3 Oct 2026 18:25:26 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
Message-ID: <asEscegw-3KeLSwG@windsurf>
References: <20260926195844.2092685-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260926195844.2092685-1-ps.report@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v1] package/coreutils: bump version to 6.12
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Sep 26, 2026 at 09:58:44PM +0200, Peter Seiderer via buildroot wrote:
> - bump version to 6.12 (for details see [1] and [2])
> - remove 'utils_cv_localtime_cache' configure option as removed with
>   upstream commit [3]
> 
> [1] https://lists.gnu.org/archive/html/coreutils-announce/2026-04/msg00000.html
> [2] https://lists.gnu.org/archive/html/coreutils-announce/2026-09/msg00000.html
> [3] https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=b64f9bfe4fd4ce5d276626fd149af2a625b6d434
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
