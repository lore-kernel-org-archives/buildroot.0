Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DA3C44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 19:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6499180D09;
	Mon, 20 Jul 2026 19:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id piUZkvyzCbTK; Mon, 20 Jul 2026 19:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97B6E80C10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784577296;
	bh=N3UxvTyDmmL1iQKYpZxNt97ORe0LHGsto2HpeuFuin8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OY9EIWlszp19uJJzSjwklkrbosRCKdLeFHitVPcIGopyNVvSzO9gsZZH7zLoSlyNa
	 r9X6vPIo6eZjLypUmGdPtRkF7ZWauAxMXHXtOzc62RAyds94mSnCU1QNmsRtZhebkm
	 gITsxuSxQOGSmoq+LpLbwqBCD5etMt4f7zX6qh3k/iYwKvcK74J9Ll747Pte8pZEBp
	 lXbkIhJNZFVLAC1T+iY2tA585blsshEY7qnd2/wIPoG/wlJnpeGCtn9rQidpvNKiVE
	 Njve7BCDPRTCRjVHxQcbVJucmc08AYPeZlMdUPwl1jpJnAzvOBTkDK7zz1aqO5O0zl
	 QeUdyzlfGt/Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97B6E80C10;
	Mon, 20 Jul 2026 19:54:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 208441142
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D91F80C10
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PaneQz7y8vtl for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 19:54:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 301D580BDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 301D580BDF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 301D580BDF
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:54:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 18F292003C3;
 Mon, 20 Jul 2026 21:54:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Jul 2026 21:54:48 +0200
MIME-Version: 1.0
Date: Mon, 20 Jul 2026 21:54:48 +0200
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260720-python-scp-update-v1-1-e88245777950@bootlin.com>
References: <20260720-python-scp-update-v1-1-e88245777950@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <eb7e75d03b96fcaea43ab191981a5890@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784577291;
 bh=MH9ZcM4Dva/7DSwZpRh1u0wmaiEZD3OhWeeH6MaQplk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NfTyRxnLatK5pCcCq7EJax3QnR9eOy8KPR8UNf1pVGDzQJ2MKq2CvmR+4kxYqoJlb
 2wsBMXocppJBCM8SNPpTa7B1x19iUt3nDXdqZglp214OcAnemXhyQIKC4i/woojYhY
 km4zgvaY5lRggNHynGS80McmGZFEn7YxkfiSoeolYHccWlFS09xAEij4qNQzn7LKo4
 MxXQzJEfU3mYHVFkiU5SidGs4SKExZ0BlWuH3lIqttn6ceUFGls9N0valPUEyfVsiV
 MGNSt3kldy4W+GJRBjHZM6J+PsehjUS1L2BBJMXgyCdu2IXIb0TJO5/8HPD7Y7/Esp
 fnGk8yxrR0fag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NfTyRxnL
Subject: Re: [Buildroot] [PATCH] package/python-scp: bump version to 0.16.0
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

T24gMjAvMDcvMjAyNiAxMDo1NiwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gQ2hhbmdlbG9nIHVwZGF0ZToKPiBodHRwczovL2dpdGh1Yi5jb20vamJhcmRpbi9zY3AucHkv
Y29tbWl0LzY5ZTUwNDBjZGYwYjNkMTVkN2YyYTYyZTEwMjQ3YjAwNWM5MTU3MTQKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgoK
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
