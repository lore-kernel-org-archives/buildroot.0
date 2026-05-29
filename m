Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD53CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 20:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBF08848FE;
	Fri, 29 May 2026 20:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4_5KEPu71Dd; Fri, 29 May 2026 20:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C49A3848F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780087378;
	bh=2S3RJ/0qLv3q34lcguwptgI4EJQx6rKbkYvNBhAbSfo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LTn6k7WoVi+L+dzgi0BJ/T/tE8O5LL0Y1KEZfz5Eu77JmwaTQi9fMhN0fWldH+JSC
	 F/YzGhOG98q1xkq3dzp5/Jf1zKbnAvvklNGm7bnDY5+yzCqE/cMnIQSfzwOGt/4vQz
	 GQi+o+L2YU446yZnhW1pAfjw18xMcL1GAvUsiEl9/dhmt6QpQg+8bh46hTQ/SzQBuy
	 vyQqWXD6F5kN3sO+FjKtwb+D03A0USFlbbUJGYCy8SS1OM/SVkoyT0GjY10dn81IQ4
	 WgZNVtFTUuH5Q0CK9bhezHdXnf7B6Q2txSXFvWGjYG/aLME+LYaW0aajrcj267TJju
	 2ntrcahQk6U5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C49A3848F9;
	Fri, 29 May 2026 20:42:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4853DF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36ED5848F7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxvqXR5qAYoA for <buildroot@buildroot.org>;
 Fri, 29 May 2026 20:42:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D3202848F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3202848F3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3202848F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:42:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5B26E5FFAF;
 Fri, 29 May 2026 22:42:52 +0200 (CEST)
Received: from 2a01:e0a:1015:b940:caf0:d340:4af7:8ed3
 via 2a01:e0a:1015:b940:caf0:d340:4af7:8ed3 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 29 May 2026 22:42:52 +0200
MIME-Version: 1.0
Date: Fri, 29 May 2026 22:42:52 +0200
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260529170641.4981-1-vincent.stehle@laposte.net>
References: <20260529170641.4981-1-vincent.stehle@laposte.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <d926036fc5415600e37ae9ec1395d653@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780087373;
 bh=Rt8rnjSO9WB5nMBL49EziEmBPrtd10sCBc42XfD/IEU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rdmivLnCosRdx0Mtr2CvtrbGs2GYZs4i/WA/uqjaQa6qQtT9+HnD7Cz2GhfH6WRjs
 d3f0A7rm784RQMuJellAy9xyFMkEt4gtvh2p8pr/e6mK7kIeiY1jIWIgP2dYPA2wo9
 euFShLFgji41pzKu5aK++JU3yqsRC04uxgOm8ITWlWbSlCXDxgvThcYcHrBt4ZtPAV
 324/wgftdUnQDfYV70XV8koPPRxArSjLT2U6WI79Ppf9lqJH/57ub1dI7SIucHEflD
 Nzhi441XjAbQDkTVB/sCBCzb5hO9B5a5DM4JKA/mwbDooq8N1wvF63Z0+wkJKOrRzo
 AheDeb8MUeSfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rdmivLnC
Subject: Re: [Buildroot] [PATCH next] boot/palo: bump to 2.29
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjkvMDUvMjAyNiAxOTowNiwgVmluY2VudCBTdGVobMOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gQ2hhbmdlbG9nOgo+ICogcHNjX21pc2M6IEFkZCBmdW5jdGlvbiB0byBnZXQgUERDIGZpcm13
YXJlIHZlcnNpb24KPiAqIGlwbDogRml4IG1mZyBtb2RlIG9uIEM4MDAwLCBycDM0eDAgYW5kIHJw
NDR4MAo+IAo+IFRoaXMgaGFzIGJlZW4gdGVzdGVkIG9uIGhwIDcxMiwgYm9vdGluZyBmcm9tIG5l
dHdvcmsgYW5kIGZyb20gZGlzay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kg
PHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgoKQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
