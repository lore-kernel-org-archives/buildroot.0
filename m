Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F0CFCA186
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 20:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5BE541CF9;
	Mon,  9 Mar 2026 20:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6PuFMll-_Z3; Mon,  9 Mar 2026 20:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BA3F41CCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773087862;
	bh=sCIyPLeGjWxDx6jK2t652hQPQPzn6YGhiMeQ8R7cy8U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xh2Ivi783mGdg3iEm+NBrIiBlp8d74KgLxbgUEJRzO5txgHsqvSH468ZwkntyhKDb
	 dxxUjiRkgSWMcpVZZynlYlj5NkEoxc9ZsNM9zaLVD/0vNLZsMLHg8iPVrKj/GlLMGu
	 78MqXtfaU/T8G+7A5G7EtIALDlM3FqGxxIBGqSaynafqVOe/p4gH3oQyQQxkzL0TjW
	 DUpx1EszHIxl5Mr3YJ51sEA9bbuKCqLg7qk2DcuhRoSZSX3OP+z9Ca73XLNOgT3RJY
	 2G81s80MgfN42Paw/6BEaeRg17ZADzLz5opR2bscBpT+zcq66y5azZLyqbfhEF69UW
	 j3ldgF7W20j9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BA3F41CCD;
	Mon,  9 Mar 2026 20:24:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6338B8
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D77EF404D6
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIuDU4lCIf_P for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 20:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA5A74044B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA5A74044B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA5A74044B
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:24:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BD7285FFB4;
 Mon,  9 Mar 2026 21:24:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Mar 2026 21:24:15 +0100
MIME-Version: 1.0
Date: Mon, 09 Mar 2026 21:24:15 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260308101915.1697719-1-bernd@kuhls.net>
References: <20260308101915.1697719-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <780178c51f158a64c4c62004d05ee33e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773087858;
 bh=oITw0/uuGGrGpBEuKTfTlOg7HmzxV3QU5a2Rd7f63Hw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c28mJLePegIlX+6+DUXYugZZGo/j8yyZNL5wPHV7RzJ9dFP+6sSrR/WhuNgGlHRHI
 G5M5k2hNT8jm0HLahiupUA9NuvVlW1SfZGMWN07p3Ot0JW1umQPbszz/F1aDcCB4HY
 +17XrTCyN80nRUz1V7qvf1TCUx/HGJ05hIkMa4kskqy5Ut8RCgNMsN0tH90lLx+Ona
 GlM9WWOBM0I/B/h3CG/zReb+KaJwkKxD0ru8AWkEvoKktfWeTHKcBZN+KcPsnmPxSM
 AafCCSNCCRW/UP+Qupc+91mj4uJfliM3YgnqwPASt5tpakuyxm7DRU8+SvyybXT4wd
 Lv7sYm5mOaCDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c28mJLeP
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: bump version to 13.0.1
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

On 08/03/2026 11:19, Bernd Kuhls wrote:
> https://github.com/harfbuzz/harfbuzz/blob/13.0.1/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
