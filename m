Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FA9EE57C2
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD51560BA8;
	Tue, 30 Dec 2025 22:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3P5e2cp37vC; Tue, 30 Dec 2025 22:27:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BEC1608DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133658;
	bh=42HUHGrq4O3xKJBmZbTj3Pp9vHcBwgMubpOi5uKYBX0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RW8q41C6yJSkd7J+8UwLrg6Hv6ykbUKJM3qG/HyqfGZ/lYiWvPHwrocb6tkB5t0zD
	 y4YKdDFSDy9ONCwzr4RfW2dWQ44/hYxuWGlK3XdWigqy7Z1LigjxhNG11eLhZFJZVJ
	 +Oseqikbt0KWc/Wm2sXzhLNjMCrc0jJLO4T56fUVer4DrrzsB0B34jfwysg/ct2kbL
	 s8Ytdm1XfAI2Q8iO00lQ3AFT7tWi/ied7xVsgyIQh6f4r3HD9sNXJcl067935PIBjt
	 mmITApdP/7NAz48t8xD4EZhPUwyFUIpkNsIseEm4d5cGTAU5wCqjAhXp1jmEP3XN+e
	 KjtbfkqCKrzfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BEC1608DC;
	Tue, 30 Dec 2025 22:27:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A59AE277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97247608DC
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzEGNXCHqoDm for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:27:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 965636080C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 965636080C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 965636080C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:27:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9A4595FFB1;
 Tue, 30 Dec 2025 23:27:27 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 30 Dec 2025 23:27:27 +0100
MIME-Version: 1.0
Date: Tue, 30 Dec 2025 23:27:27 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>, =?UTF-8?Q?Ga=C3=ABl_PORTAY?=
 <gael.portay+rtone@gmail.com>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>, Martin Bark <martin@barkynet.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>
In-Reply-To: <20251215224952.1253359-2-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
 <20251215224952.1253359-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <4082420fd5af84a6531c3925d5da49af@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767133654;
 bh=/LgxyDjQVmYALSTLw5IDMyebqa0PHtn+/pQU0+UilpM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XQlIELurzzUL3u92z581DeuwoqsugqPT04egDZCOoSFyvu1nR/NJDhR0vbHN+X5Cv
 5dKrKSJc4JpeWWXrdBRVWSlEHGlOEjIPALwd9gV6dGhNTVCWz2W9PgsN+xjmEXLSad
 U1UE6MP769zm8wMtDUZ0if86PqJuUbm+Rc2a/EBxgKhAxOWVgWkgO4KOUdDAlv3Gln
 llq4anUnUVg89dGeq1vXgXgw3hWX565Q3NEp42ggPnVC/Uq1TDLaPi68Z4yVxCNhiA
 tvkPrbgSdWWAAt2Of3WJ2QP3F0JCZCi+UcWMES1iBLu3HHtbKD/n1VxmBhoxWeZj6U
 hvnjbvd4FhuAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XQlIELur
Subject: Re: [Buildroot] [PATCH 01/13] package/rpi-firmware: drop support
 for vcdbg
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

T24gMTUvMTIvMjAyNSAyMzo0OSwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IFRoaXMgdG9vbCBoYXMgYmVlbiByZW1vdmVkIGZyb20gdXBzdHJlYW0gcnBpLWZpcm13YXJl
LCBzbyBkcm9wIHRoZQo+IGNvcnJlc3BvbmRpbmcgb3B0aW9uIGFuZCBsb2dpYyBpbiBycGktZmly
bXdhcmUubWsuCj4gCj4gVGhlIHRvb2wgaGFzIGJlZW4gcmVtb3ZlZCBieSB1cHN0cmVhbSBjb21t
aXQKPiBkMWZjYzI2MDM4MTg2YWVjYzE1MDFhMGI3NDk4MzMzMDBhZmJhODAxICgib3B0OiBSZW1v
dmUgYnVpbGRzIG9mCj4gZGVwcmVjdGF0ZWQgdXNlcmxhbmQgdG9vbHMiKS4KPiAKPiBJdCBpcyBC
dWlsZG9yb3QgY29tbWl0Cj4gMjhlNjk1M2JhODRkMzlhNjA3NGFlZTQzOWE2NGVmODZiMTA5ZGNm
MCAoInBhY2thZ2UvcnBpLWZpcm13YXJlOiBidW1wCj4gdmVyc2lvbiB0byA1NDc2NzIwIikgdGhh
dCBkaWQgYSBidW1wIHRvIGEgdmVyc2lvbiBvZiBycGktZmlybXdhcmUgdGhhdAo+IG5vIGxvbmdl
ciBwcm92aWRlZCB2Y2RiZy4KPiAKPiBDYzogS8O2cnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRA
Ym9vdGxpbi5jb20+Cj4gQ2M6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+Cj4g
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGlu
LmNvbT4KClNlcmllcyBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
