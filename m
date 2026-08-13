Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D6BC5CFDB
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 19:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74E3440CC6;
	Thu, 13 Aug 2026 19:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBREhwxt1aQP; Thu, 13 Aug 2026 19:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7BB140CAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786649330;
	bh=5ibo3JS+XWxGI3l1+GOXFLAS7qnYtV2Gx8c0zXYxBlo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n6TzYDlq5xmk3Di5dB1N/pxwCEVdot/o0GkshK/CUZq4PCj/K5atpCxiPV/aXKPfC
	 TCjVQsupPNa8lcJRcG8Ms8PstcQ4HPiCnHTXlUpNvsohOmiV1dCGEmTKUvoBc6iCU/
	 NfVnFihpKvPpi4E8KhgPHwEOQ6T/El7vc0zMYbnx+Uo8M1/K06snY93JXMUIJmXu3X
	 3LraInuZB/15pmGAENlINXiJIQYfYOWcm6bh9noGgBDQi57egiRm1tJ68rBeb3AYNR
	 ubDZKOfBu/1Fcz3UQB6VGBYOFPLL7KB+tAqjE6JgW+wd9yJUYfBDhzLgrkaj0m7zhD
	 y8kltnHiKzJNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7BB140CAA;
	Thu, 13 Aug 2026 19:28:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D39912B2
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C53D580DD3
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnSgsZooUv9m for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 19:28:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDDEB813A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDDEB813A3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDDEB813A3
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:28:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 22F1478034D;
 Thu, 13 Aug 2026 21:28:43 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 13 Aug 2026 21:28:43 +0200
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 21:28:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260812191243.3735751-1-bernd@kuhls.net>
References: <20260812191243.3735751-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <e0bcf1b649e9d9ab7fc0de3a3b4d90eb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump
 version to 3.8.9
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

On 12/08/2026 21:12, Bernd Kuhls wrote:
> https://github.com/libarchive/libarchive/releases/tag/v3.8.9
> "Libarchive 3.8.9 is a security, bugfix and minor feature release."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
