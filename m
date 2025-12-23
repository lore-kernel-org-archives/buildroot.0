Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D72BE6F085
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 17:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46C71813CC;
	Tue, 23 Dec 2025 17:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfk1_SABScFe; Tue, 23 Dec 2025 17:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DB07812F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766512049;
	bh=X1u/l+imiV++la0lQDNUOqBM1VD8iOY8gSVAgmMZjXc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kOFdKGgOKawplkruOohCGDefTF1Czjkc/UAE+m6IKLdugJFMdhyu/LdENzN3/Hx4J
	 t9x07WKj+NLWoz7YoZ5lYNvPuSQW41vK3EN+9N+NQXCnDj5u6ehrUkCIdqGCaO9sAZ
	 6PnMb8saXFTUV3eBGkMehFGpvbL2dZ96QEIuY3SSdPdz6lDqzQA5tSoTpCmHTFfBtD
	 4ExuvkMWwNFb6v9A0CxmfhC/nNfgRHZQwxwcUW23q6Wh2I1et93HVWqDdl783ylGuX
	 SK0BPHD6qCqysLxCIwu0zdFB2vJFy7/m5JG1HApFRCoiAY1pBCTZiEiD5zuGnxuJd4
	 pt3fBGmJA5UJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DB07812F7;
	Tue, 23 Dec 2025 17:47:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AED625A
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 17:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DB1B4060F
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 17:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDtjucQaiLi8 for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 17:47:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B6FFC405FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6FFC405FF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6FFC405FF
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 17:47:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2FE652003C1;
 Tue, 23 Dec 2025 18:47:23 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 23 Dec 2025 18:47:23 +0100
MIME-Version: 1.0
Date: Tue, 23 Dec 2025 18:47:23 +0100
To: Viacheslav Bocharov <adeep@lexina.in>
Cc: buildroot@buildroot.org
In-Reply-To: <20251223084436.984227-1-adeep@lexina.in>
References: <20251223084436.984227-1-adeep@lexina.in>
User-Agent: Webmail Free/1.6.12
Message-ID: <0dbd696ce43b8020bfeae8d68a3cae0e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766512044;
 bh=j4N+tWQHsogSjrFw6/WyUyHfPY24M1gbYGOGSjs0CL4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BAoh4etfUD26h+FpmOdGPPvk4NtPxsYDt/2n9AgxCRccCNo7HFSKK63D7xdt3WJ1A
 tWvFl6myRw+v5RFl2cMCRiuK8R0YrShG+fkJnOZit1UmUmDnTHA8/3qafoElsHg567
 cJph/tv+K/wzMJ7BRgKGGADAovJuwkk6Qm19RIYhfk1lMIzUynQGnbW0egAmsg9HAT
 Nbp6uUIm1+z+P0I6GaB6g/kXOVWMT7A/wi3LVaM+JPw0LDLGg6oA3xnMDmCWr5Z78P
 TSPxUyDdz/IKZrqLtN7bVNRMzIe/XTJitvf+kFZ/neRiSZ3wdBXDUNLNFh9hKkDS3Q
 3EPkAuu/PjmSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BAoh4etf
Subject: Re: [Buildroot] [PATCH] [RESEND] package/rtl8822cs bump driver
 version to latest with support kernel 6.18
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

On 23/12/2025 09:15, Viacheslav Bocharov via buildroot wrote:
> Update rtl8822cs driver for Kernel 6.17/6.18
> Fixes: 
> https://autobuild.buildroot.org/results/bafd5af112e49359201580ece3a12bc8724914fe/
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
