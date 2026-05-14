Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2C5CD4F25
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 10:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 423BB40ECE;
	Thu, 14 May 2026 10:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSQyC4DrYyY6; Thu, 14 May 2026 10:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72ABD40DD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778753443;
	bh=8Ox/VFC41iZqJGv0b+J+4cI3He3r2kmZcOU5fNPd35Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a0aOlj864XybFAmxRaY4aed8lFx+4KcWPJaqlkF5iU7jFZzPhDShxcYfUoZljBGvm
	 VZQyBtjAjYW2qc0Tm0M/wa5QXVkf8fkq8+tSBCDT6dtu5S20KT3N8Y/OuKFYp6l/tr
	 XiKwPJev0jJZb54RYpruk287sAyQwr6iWqJX6MN24oGv/9Wg39Byha7rd3rJLen0Mf
	 Rv1USbydKclwJDrdPRRu/I67XYSy/mPbJOmNYEf2ntQBMgQ5YfluDQKtVVTRtsJ3F9
	 0YftoPEfbZHlHIlWhQVWj/Wcy+4W9P02Wrr+bLsemhCZVoo4XTODzKHwVPuqy012+H
	 HFBM1kKiEc1gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72ABD40DD5;
	Thu, 14 May 2026 10:10:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6152E37D
 for <buildroot@buildroot.org>; Thu, 14 May 2026 10:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 473EA81DF0
 for <buildroot@buildroot.org>; Thu, 14 May 2026 10:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQowkNwuU6ov for <buildroot@buildroot.org>;
 Thu, 14 May 2026 10:10:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21BEB81DCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21BEB81DCA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21BEB81DCA
 for <buildroot@buildroot.org>; Thu, 14 May 2026 10:10:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CBE0813F8A9;
 Thu, 14 May 2026 12:10:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 14 May 2026 12:10:37 +0200
MIME-Version: 1.0
Date: Thu, 14 May 2026 12:10:37 +0200
To: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260513013919.1028509-1-salvador.joseluis@gmail.com>
References: <20260513013919.1028509-1-salvador.joseluis@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <8a63d66164b1d761112338202dc4cb81@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778753438;
 bh=35aglGvdU4RohWOojO6DllnZ0kxWi7y1XW70bD/tOko=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZBSyJCFjDr6ak+m+cRjTS3/SFVh7NMoi7rOSwi6D8ayuj0SwmUSLsSFxubjCOt0FL
 /6lR4x3g9zO1+VleJGACwEw3C097glprH6ab2ZmDSZPyZJzxLPLKNkkleAGfRy7Aj5
 61FFc4fPcwhtn3ZCuMcIHQJy++QnV/uN/bz60yosdzJD5ryY/GvhIpdJ3DehR4H0vX
 WobzpIsXXKiCS9DjbovYvH8eXsjLZQNx1NOHkRpT5pFzfk9UCwTf6F0BNqBNDOXLMk
 8b0eAcX0zEz9LHNKZPijydW9jOvYdS65ZElYWxN+U1W4XyOqIZ/aryjQD3A2ALoXey
 E3xWAkx0fzSEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZBSyJCFj
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.4.2
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

T24gMTMvMDUvMjAyNiAwMzozOSwgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIHdyb3RlOgo+IEZv
ciByZWxlYXNlIG5vdGUsIHNlZToKPiBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVs
ZWFzZXMvdGFnL3pmcy0yLjQuMgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFk
b3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgoKQXBwbGllZCB0byBuZXh0LCB0
aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
