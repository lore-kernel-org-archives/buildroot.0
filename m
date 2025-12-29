Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8010AE9273E
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 17:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55AEA60B3F;
	Mon, 29 Dec 2025 17:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3XcycK74Bk7; Mon, 29 Dec 2025 17:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B91560B1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767030910;
	bh=ABSTzy7dSoXhNpVy+JPTwEVFpo+rerPDQ7vhzdxB9N8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IWDZvnLiMCH/9Om2/y89NQc7PI9gQyGvBVgS5lX5kYEgbDpscCvizchMMEc4n4Lmf
	 7ePA35qY61g8ZS0Kf9rnuUy0IafU6U6f7JufrY2GtJVzCHtKr0Nd7kG4N+OQnm6JM/
	 cO9t02FyL3EsRgyM42Smy+Kwig7QG4dGblkL6Pl+PDQXAuFey73YpC4TugGL0L7AlW
	 cSyZSZ0W0vktEwsbJtx/q3SzPX7xAIExaArg+AkdrpRV35+iJsuExE1dU1nDX9ntHn
	 H4SkMafmSkrS17wZBKWWImW9dDbig6uW61arZHwTwO6l34SsQHmo2umdcmFW3dYBuV
	 qp+q2Vc9lIeFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B91560B1E;
	Mon, 29 Dec 2025 17:55:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07B35D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECF62407CF
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWVPFSC2ecMA for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 17:55:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4482C4074C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4482C4074C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4482C4074C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:55:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1E504B00548;
 Mon, 29 Dec 2025 18:55:00 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 18:55:00 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 18:55:00 +0100
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>
In-Reply-To: <20250709-perf_libtraceevent-v2-1-3ea54fbe6b5b@bootlin.com>
References: <20250709-perf_libtraceevent-v2-0-3ea54fbe6b5b@bootlin.com>
 <20250709-perf_libtraceevent-v2-1-3ea54fbe6b5b@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <58ab9bd80f3725f6a6a923c98cde5480@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767030904;
 bh=BdwXgMBu5fuRPJ7/BlcPjFAmurZ9cD9Uz93Q1U55nX0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V6DTiGn+pIZL63pGAWGK6Pz9TNlucSL40LaoQeDtEP74X+eMiEu05vou5HboLn9kG
 QcO/ebbaikqeYOpxfq005FUUuGWN7O1WuxDFTJJ7kidk9HrsbLwo+iNMMwF4sd7OgV
 uAmvp1FbXZeo1tHD4doSktaa4HVIWKlChQPVin/bcj4/+gD0Qaj1c1Mbbh/jmDfofS
 WYi1glJqMpKqAUZEVlC7j0Fqj/lkDtSHSDFVAJR7ApdGZJ3bfbs0/q28+6xuHXAe2u
 UtdGlxp0PeIHeL1m9HIept+R5z0puRiokDBpGg9UCInG4VOcMEMc+t5NnK5nVMayPr
 8z3qtBHxZgVLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V6DTiGn+
Subject: Re: [Buildroot] [PATCH v2 1/2] package/linux-tools: perf: build
 with libtraceevent support when it is selected
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

T24gMDkvMDcvMjAyNSAxNzowNCwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gV2hlbiB0cnlpbmcgdG8gcGVyZm9ybSBhIGN1c3RvbSB1cHJvYmUgcmVjb3JkaW5nIG9uIGEg
dGFyZ2V0IHdpdGggcGVyZgo+IGJ1aWx0IGJ5IGJ1aWxkcm9vdCwgdGhlIHJlY29yZGluZyBzdGVw
IGZhaWxzIGFzIHBlcmYgY2FuIG5vdCByZWNvcmQKPiB1cHJvYmVzIHdpdGhvdXQgbGlidHJhY2Vl
dmVudCBzdXBwb3J0Ogo+IAo+ICAgJCBwZXJmIHByb2JlIC14IGxpbmtlZF9saXN0IGluc2VydF9u
YW1lIGluZGV4Cj4gICBUYXJnZXQgcHJvZ3JhbSBpcyBjb21waWxlZCB3aXRob3V0IG9wdGltaXph
dGlvbi4gU2tpcHBpbmcgcHJvbG9ndWUuCj4gICBQcm9iZSBvbiBhZGRyZXNzIDB4ODA4IHRvIGZv
cmNlIHByb2JpbmcgYXQgdGhlIGZ1bmN0aW9uIGVudHJ5Lgo+IAo+ICAgQWRkZWQgbmV3IGV2ZW50
Ogo+ICAgICBwcm9iZV9saW5rZWRfbGlzdDppbnNlcnRfbmFtZSAob24gaW5zZXJ0X25hbWUgaW4g
Cj4gL3Jvb3QvZ2RiL2xpbmtlZF9saXN0IHdpdGggaW5kZXgpCj4gCj4gICBwZXJmIGlzIG5vdCBs
aW5rZWQgd2l0aCBsaWJ0cmFjZWV2ZW50LCB0byB1c2UgdGhlIG5ldyBwcm9iZSB5b3UgY2FuIAo+
IHVzZSB0cmFjZWZzOgo+IAo+ICAgICAgICAgICBjZCAvc3lzL2tlcm5lbC90cmFjaW5nLwo+ICAg
ICAgICAgICBlY2hvIDEgPiBldmVudHMvcHJvYmVfbGlua2VkX2xpc3QvaW5zZXJ0X25hbWUvZW5h
YmxlCj4gICAgICAgICAgIGVjaG8gMSA+IHRyYWNpbmdfb24KPiAgICAgICAgICAgY2F0IHRyYWNl
X3BpcGUKPiAgICAgICAgICAgQmVmb3JlIHJlbW92aW5nIHRoZSBwcm9iZSwgZWNobyAwID4gCj4g
ZXZlbnRzL3Byb2JlX2xpbmtlZF9saXN0L2luc2VydF9uYW1lL2VuYWJsZQo+ICAgJCBwZXJmIHJl
Y29yZCAtZSBwcm9iZV9saW5rZWRfbGlzdDppbnNlcnRfbmFtZSAuL2xpbmtlZF9saXN0Cj4gICBl
dmVudCBzeW50YXggZXJyb3I6ICdwcm9iZV9saW5rZWRfbGlzdDppbnNlcnRfbmFtZScKPiAgICAg
ICAgICAgICAgICAgICAgICAgIFxfX18gdW5zdXBwb3J0ZWQgdHJhY2Vwb2ludAo+IAo+ICAgbGli
dHJhY2VldmVudCBpcyBuZWNlc3NhcnkgZm9yIHRyYWNlcG9pbnQgc3VwcG9ydAo+ICAgUnVuICdw
ZXJmIGxpc3QnIGZvciBhIGxpc3Qgb2YgdmFsaWQgZXZlbnRzCj4gCj4gICAgVXNhZ2U6IHBlcmYg
cmVjb3JkIFs8b3B0aW9ucz5dIFs8Y29tbWFuZD5dCj4gICAgICAgb3I6IHBlcmYgcmVjb3JkIFs8
b3B0aW9ucz5dIC0tIDxjb21tYW5kPiBbPG9wdGlvbnM+XQo+IAo+ICAgICAgIC1lLCAtLWV2ZW50
IDxldmVudD4gICBldmVudCBzZWxlY3Rvci4gdXNlICdwZXJmIGxpc3QnIHRvIGxpc3QgCj4gYXZh
aWxhYmxlIGV2ZW50cwo+IAo+IGxpYnRyYWNlZXZlbnQgc3VwcG9ydCBmb3IgcGVyZiBoYXMgYmVl
biBkaXNhYmxlZCB3aXRoIGNvbW1pdAo+IGI0YWI0NWE1YzFkYiAoInBhY2thZ2UvbGludXgtdG9v
bHM6IGRpc2FibGUgbGlidHJhY2V2ZW50IGRldGVjdGlvbiIpCj4gYmVjYXVzZSB0aGVyZSB3YXMg
bm8gbGlidHJhY2VldmVudCBwYWNrYWdlIGluIGJ1aWxkcm9vdCB0byByZXBsYWNlIHRoZQo+IGZv
cm1lciBsaWJ0cmFjZWV2ZW50IHJlbW92ZWQgZnJvbSB0aGUga2VybmVsIHNvdXJjZXMuIFNpbmNl
IHRoZW4sIAo+IGNvbW1pdAo+IDE0NzRmMWIzNGIxNyAoInBhY2thZ2UvbGlidHJhY2VldmVudDog
bmV3IHBhY2thZ2UiKSBoYXMgaW50cm9kdWNlZCBhCj4gbGlidHJhY2VldmVudCBwYWNrYWdlLiBX
ZSBjYW4gdGhlbiBleHBvc2UgYWdhaW4gdGhlIHBvc3NpYmlsaXR5IHRvIAo+IGJ1aWxkCj4gcGVy
ZiB3aXRoIGxpYnRyYWNlZXZlbnQgc3VwcG9ydC4KPiAKPiBNYWtlIGJ1aWxkcm9vdCBwZXJmIG1h
a2VmaWxlIGRldGVjdCBpZiBsaWJ0cmFjZWV2ZW50IHBhY2thZ2UgaGFzIGJlZW4KPiBlbmFibGVk
LCBhbmQgaWYgc28sIGFsbG93IHRvIGJ1aWxkIHBlcmYgd2l0aCBsaWJ0cmFjZWV2ZW50IHN1cHBv
cnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBi
b290bGluLmNvbT4KClNlcmllcyBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
