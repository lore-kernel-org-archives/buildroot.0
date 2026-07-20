Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23638C44529
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 19:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43B3280D3E;
	Mon, 20 Jul 2026 19:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FNDBJc8oVb9; Mon, 20 Jul 2026 19:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9C6D80D09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784576294;
	bh=vRxt1bbd4ZcskvLIlJwxuKSu+XSIv4H2R3QtMNU0JBY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Bn+37uX7SyzFc2uCeNsofC18h13qv4EgE2sNSC7DDH+q2xPPa4wLYPyy8P5PucK+F
	 qxZ6ofSM15QvxAMtXWL8+S9SUWNwDfEvXiK+iTzQ4vId8F5JopABsLQwKAxgmzsCnf
	 kjLeoNNEwVikedvZ7RO+J0Jpfr+OesCes8bXQDoAVzJvJL8cxZomuuF2WtnZRe1uLc
	 2dUAe2dp2KdSWEWOh+vxjVfhwd15v8FjDgJ1dW2IsTrsgE+OYi8imkHbRIOwrrliMw
	 1uDTmhFTXFCED8Wy87zW/ZHp3Amp7xrayxn4pA2ZL9qUEXTGoaCwe3i8MX4dt36Qhi
	 TETz2IpF/1z7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9C6D80D09;
	Mon, 20 Jul 2026 19:38:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21F6F786
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04E7B40182
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dukm6jjcIZRA for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 19:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33CAD40180
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33CAD40180
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33CAD40180
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:38:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F09D5B0055A;
 Mon, 20 Jul 2026 21:38:07 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Jul 2026 21:38:07 +0200
MIME-Version: 1.0
Date: Mon, 20 Jul 2026 21:38:07 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260720121823.1512301-1-giulio.benetti@benettiengineering.com>
References: <20260720121823.1512301-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <22580fb4bba3b1993295dce3c87bf65c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784576289;
 bh=5hKltvx9a1tUd95BSNnv06Ty51pY/20Jv/lhGVtHJpk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MsXklxCvZJ0QpNwrnQs7e+XCQhbvqq1RMBcyZHnCfLto5jTkNPXCjjnqyGkDPj0WS
 I5MGFN7h+ZE+H6TgjeurK+HZqMezBflBCPvI1lHaGRY1/utF8rIL2jqECc5VvqNYJx
 luCjWv6uRtXXZ7szyroTD+KRKfPePXhFpTmN10HyZdwZooDhvKlyz2mkM0/9V6KoCC
 XO9mS+Dx31jxrb/eRBfhGBYdAYICnC6cMtZLzUdFM3Z0kH+43Jh+tLEi6g5gmKvGak
 9EGXv8PiTsq86AvnxeQWu7mIpUfQVjCvY/Nqn0pLoKuI6Kp4nxmRjRkH/b7tXVFlVK
 BybjPNXEI0XdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MsXklxCv
Subject: Re: [Buildroot] [PATCH] package/dash: bump to version 0.5.13.5
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

On 20/07/2026 14:18, Giulio Benetti wrote:
> For change log, see:
> https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=037bbdfd330017c368caf6242f977974123239b5
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
