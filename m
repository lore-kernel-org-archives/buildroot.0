Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47344C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 10:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E27824094D;
	Tue, 14 Jul 2026 10:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEO9PCsu4b-F; Tue, 14 Jul 2026 10:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EB23406A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784025480;
	bh=NgrjU+cq1xnV5rCyJvokQOGANKtYgj8Cx2RCeL+C+K8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O8Sb9eWDa3K6PRuzByLPVgN6WgCzcugGYqezxPQDZlNOx/jKLgtTTwmBatrTdlc7H
	 m2cMAMxmWp+g+Ijn00vrponxNA/L+URthG1lg2y7qh10E9MWKT7AORS2WRUOXCd2od
	 sBdWPSAznaMRZcER+HXA1Sw24XGMka0xAtnQDM3z9/xbUm3sE+BVb+ASuT78G/Y31U
	 /QXldrj/m6XdeVk+2LwxG3NLjgYaC38tX6XmZ08Qlp5rJuZ5e5hmdSUfqaXrtb9sWJ
	 B0BF/wvtHyRzHbk/kjTbBUhQj9uZ0nHRFSTejTq9bVEa4nDwxTVp18b7kLfNMjX4Up
	 OMQfE+IkK1ftw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EB23406A8;
	Tue, 14 Jul 2026 10:38:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BED3D96C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A57E2406A8
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4zyxrdbgvnr for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 10:37:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CD534068A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CD534068A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CD534068A
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:37:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B4AD678034E;
 Tue, 14 Jul 2026 12:37:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 12:37:54 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 12:37:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260622071701.50248-1-bernd@kuhls.net>
References: <20260622071701.50248-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <dbb0e4b380811a88b599d25ab7e3cf7b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784025475;
 bh=FChnQXzX4//A99L/JhDvRihuMI+2jzZ7TeuulbDVpZ8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q7BCSHueWWhmkv09aMos8eZaYuBdYIH9ZkQYdnRTCxvy9rNXCy2F1jzWIeJtNHKEB
 Aqv4wPhki27BHjMn7dO9RL3alT5TlY4ZBHu0YQbmuNgHDMk84R5wkoPQh9yGFSjK0K
 /vXKAV9T8ppeEcAN1lMwvyOuJ2pBXLFyUVVjhXO4Y7y1rAyEyQNR9ZS3JpRO4gjUQv
 X5dU9s5QwUJgbm+scMwnJJi/WTfarGdX3P6MJZSfMlAm09Giqt41Y8R/1gcWaUg+tR
 0CHFoXTFSn6zLIxhsGeqAlDN3MaVjnSZwgdMuUH6NFPCSraZBH5cw1vOrSPMt3lvuM
 AFBf5E8ke1Dyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=q7BCSHue
Subject: Re: [Buildroot] [PATCH 1/1] package/jsoncpp: bump version to 1.9.8
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

On 22/06/2026 09:17, Bernd Kuhls wrote:
> https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.8
> 
> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
