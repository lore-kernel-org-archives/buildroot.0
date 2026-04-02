Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BC8D6AAF8
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 19:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BE7741184;
	Thu,  2 Apr 2026 19:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EhbJC0_seccN; Thu,  2 Apr 2026 19:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C26924117D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775158076;
	bh=z/kzl6sK3OnNwQk5v0LXoyXmnRVJ/19xP6niVsKw0/k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B9qdfY6MCnmhsUE4hwxFMOUXhP7KSZfPdiDxNVB6dDPKjNydOs7SuUSaQFfzmJp0B
	 vIbsXpkNQknOy9BL5OlD9W31VT+Oweok88gYvXF2rwYTnRX/nueKo9us7JI6DidsRB
	 YYptmlRVAW+KN1ZIFRtu2+3wPbRfbCJD2wNLdrVMgiPzAVwcjU8k+nw8AxMi4cgPrw
	 xTWk6SRtHEmXHqh1rofSts5c4geidFAU98bAKxWTYdi8jC+SJSgT+9B/bJoSxjCfIX
	 MIEXanc5mY/VmbbN8sjmpVVEzJiJGrwX+0EcVjm65ymEcERRskiXpyk9l2OnAAAe5S
	 LiXmMhZBFKvyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C26924117D;
	Thu,  2 Apr 2026 19:27:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE6CC2A2
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3D99401E0
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYwXLdXuA7OB for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 19:27:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ADAFF400B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADAFF400B3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADAFF400B3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:27:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 649ED78035E;
 Thu,  2 Apr 2026 21:27:51 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 02 Apr 2026 21:27:51 +0200
MIME-Version: 1.0
Date: Thu, 02 Apr 2026 21:27:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260402180355.2779992-1-bernd@kuhls.net>
References: <20260402180355.2779992-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <63f5c89bf54cc64600618757345547f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775158072;
 bh=vf5XWLjy3DdWIT/UCvks8QwwVjt+IRSS18okMyMKRPw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZpJFZDkPERude5tR89XVPIVECiQ1VlYeIuKZnK1BavSbxPiL5CrSMJ7LPbji3Q4JC
 dpIpgk0u6V+N7WWJ4L1RpZu3+kh6XQ0k4FaTeqoi4VUFJTooNe7TeDnj8ET+aDcMiy
 IbcRRqjOfShgSDxOO7JFuPbWrl2h792////6nVaeJzScy6JdijhpyhHLYXP2MaraUe
 pnlEqPPsNBEjT9dot9fwKkkTcsZkp5fF+TIadDV84sR6uwP/1dTrpUuSixFtFd9KHR
 oRaO32BsSeIXhkrK2oUUPr7/NHMEdrQHN5CbEpU9SdVOZJS4H05KcaCk2zaPbSwMzn
 I3+0tLrUBa20Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZpJFZDkP
Subject: Re: [Buildroot] [PATCH 1/1] package/libinput: security bump version
 to 1.31.1
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

On 02/04/2026 20:03, Bernd Kuhls wrote:
> https://lore.freedesktop.org/wayland-devel/ac3BI2BjKx53LqmH@quokka/T/#u
> 
> Fixes CVE-2026-35093 & CVE-2026-35094.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
