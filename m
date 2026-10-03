Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D91CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17A6881248;
	Sat,  3 Oct 2026 12:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTz8sEUnpzA5; Sat,  3 Oct 2026 12:35:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2F22380F88
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791030953;
	b=aq0t/TL44eL6gEtyWOGc3jijuKkqr6ih1x8Bk/3qt8hwA5pF/uggYeHbzPcbOi8dKvin
	 KtgXjkQ5CVm77/1EYuHWRyfIEVo7PyO/xmF9iLKktHHtkIsMVmHuuOiEIyBt2zl5y/f/i
	 wkyAAe1Hs6HNGOhaMT8Yt4Slw6d0VKXCHK1ne/eMXAXg8diPqEN+Ol0kB2grpH8BV9drn
	 IYqfK3D1By3HLoKl98braWui3kFVb5elGYXAxryGkRvQNlZKW02RCLf4WuzwKkIIQsd5e
	 VOv+oWJlebDmUpxAaBE6aa1m7frdgPPgi3kvf0GxcItf/xuxXOfZNa7kwh8cdPomqlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791030953;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JCxwACiRKXNqy3h1zs9y54sTqOr17IeBnw7XkEnifUM=;
	b=sy7Jt+32yBCBy6sEP5I4jpDfSEHtSFBXhodyJzYaQTud20i4YCuXjyD4SpMilhxwD+RX
	 Amro0E7w8sV+G9c2o3GYzKe9bRl9yi+JNOaSUp2jh3PwDST4/rj8PkgmGUQKmDm/kQ6Gl
	 q6cmpkqaR/MdC2x/4oSJLeAvpAkv2/Ozk7YiqiOUbAV57NO6tuOmDULyZy7H3kfqkCfVH
	 d9D1b4ef7wITLOmIcSLJLt/6Po5FZYmBMHY7POPDYCTeDIlQd/rnOV8LikPukm/ZCtObU
	 Qax1w7KVBPzjz+nP9xZ3WFIo7sEQ5jrSSfheCi0hwUsQoWDAqLyXNIiA6U26aVLBSPA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791030953;
	bh=JCxwACiRKXNqy3h1zs9y54sTqOr17IeBnw7XkEnifUM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N+t7U3rYYrf4qODX9H/QvuGf2RHDQ000f6f1qRbVvBWFZacGC02V++CA9Pl28br64
	 4gaevk78dzO/i1F/2v7FKvy0Wb1jiUwbVw0HqNOLlFZJlF1IeDeAt5MSHoyn2poU39
	 4SAaz1U0LVqDvpWhu489yTsFBLDcqiDKaGweyeH8rKb7/bu7aQPJOl3i//cw9eRiIQ
	 qiIh/8QwRHPxoAna7qbF2arZIznz+PzMzVSb3y6PrGBnqGIxCgQpXJUQJO1JwBCGCe
	 kehbd6QUzXCEbMgTP47nGNfbwzP87RJ07DZYe6Pwkk/rAyFT/1z+LxyOKW2vQpcykt
	 NCWwR07jHgpYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F22380F88;
	Sat,  3 Oct 2026 12:35:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FB222E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0ED580F88
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86W22ROnnjf8 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:35:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 22A0980F7A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791030951;
 b=asq4oK0cXb9Jc5ez+wAlNDmtN+NTUuke3loquoAACeJzWQhYYoL7KeTgpK6h4pyvBSPf
 kZO9ZGVg0D5G5Liys+lPmmrMqnOYBqO9sPkJUJ+Izo6Gsb0Qw9YCTw6fvnbBKzdq7KzTQ
 Lq6yz1595EGZ0isYVqCQpOOx8fpT9konJbQHMEnToWCu+3Bv7WoCoX0mK2T+xBGZwlifA
 IWhjYfxud6OsbJJcGcQ3TpSxJ6S6RSVjaSnjewTvddtgk8K/4xmXHYff5pgx+smTN7EnU
 x8C1mwrj2FhmASUBV683Azqo59fiaEZHw2EbO4AWwrx5KtDTs+R+CZQgxSQLV8ZepXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791030951;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=9AnNZQAmC8rz5jinVsNNKDJtaGs0oEsbaacI+z/ir2g=;
 b=LeBoLFwflTZIuqkZjShBSXC760kuU0C5X2XY2jQThvr2myVaNQIvgTJsEQxoqD2SQ8QJ
 6cuHM3uOcf7VYcKoFJmRIjBPjQCbKOWCdIuYfuhccLjRiDjm+xXzcy9sxB/O4GR+B8kOQ
 ipJ6x0NkGz5rKQv/ckcic8EC4j9kPNTMyRwWB/7MziMhW0Uvmey+yoriV6Kw5t5tN9TXf
 PnGvKlMcTpMGGlsDiDXaWGx697vfTpJWAWOzpbVqtjU63dSDCK3wY1BTPIRsM+dh2nsaT
 TMymcogATnhnGYztWtySNSxC5gXzmwVrMl+npmqhIWyNeERaYrdmVTz1uMkNjdyfLEw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=tDmhs4sr; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22A0980F7A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E91861A10FC;
 Sat,  3 Oct 2026 12:35:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B7E0A604FF;
 Sat,  3 Oct 2026 12:35:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 010FB10328366; 
 Sat,  3 Oct 2026 14:35:46 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:35:46 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Lionel Flandrin <lionel@svkt.org>
Message-ID: <asD2nlGzcRi-Y2Bg@windsurf>
References: <20261003084453.545653-12-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-12-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gunicorn: bump to
 version 26.2.0
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

On Sat, Oct 03, 2026 at 02:43:57AM -0600, James Hilliard wrote:
> Update license hash due to copyright year update:
> https://github.com/benoitc/gunicorn/commit/95b7ffeeaa75612d24d873f3fedb733c1a51b09a
> 
> Drop the no longer required python-packaging runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
