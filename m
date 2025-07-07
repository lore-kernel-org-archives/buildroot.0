Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DC7C83F07
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 09:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 190FC81BF5;
	Mon,  7 Jul 2025 09:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmJ3tYDMjdJd; Mon,  7 Jul 2025 09:59:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3364A80F46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3364A80F46;
	Mon,  7 Jul 2025 09:59:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6AB515F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 09:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C00EB80D4C
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 09:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_ZFvHv0jO_K for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 09:59:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.152;
 helo=fhigh-b1-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4B5D80F46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4B5D80F46
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4B5D80F46
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 09:59:48 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 88D267A021C;
 Mon,  7 Jul 2025 05:59:47 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-06.internal (MEProxy); Mon, 07 Jul 2025 05:59:47 -0400
X-ME-Sender: <xms:k5praNRwcAMMHrqkND0Km_hoDwN7RqrtP4btcSBank3tzcKrUatQRw>
 <xme:k5praGyepJ-YX1BFfBMjZRVdCCDr2fbljg7ur1NE1538MBrEit9vl7DLTooEfKDTq
 OReUmV31Cb6EyMX_iQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefudehtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvffkjghfufgtgfesthhqredtre
 dtjeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeegudfgueeugeeijefgle
 eggeeuvdeuvdejhfevhfefudelveekhfeglefgueeikeenucffohhmrghinhepsghuihhl
 ughrohhothdrohhrghdpghhithhlrggsrdgtohhmpdhgnhhurdhorhhgnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtph
 houhhtpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdp
 rhgtphhtthhopehjuhdrohesfhhrvggvrdhfrh
X-ME-Proxy: <xmx:k5praOebAwKO0k2Rd1MyRra7WuM9UcG_XJ0BddjnFDzWAR5-aFrzmQ>
 <xmx:k5praIbh11iGSPGfqhAa2GFJXgjIX3qtccGLRZlacIf9D1lyhtBqSQ>
 <xmx:k5praBWz6wu8W-pnDrTkyBQxoX0Uk3Y3HWVioMkqIwgK0hEOf6QRrg>
 <xmx:k5praKibYg0XZKX7fXN6a9Wl1Af0thZrx51Zc2EaJZQ1ONoWB1nSZw>
 <xmx:k5praP_Tpp1-7kawMdcjn7At7viPgodb6r42CXX0CSDJOiPlDTvVvanF>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 136ED2CE0072; Mon,  7 Jul 2025 05:59:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T5e3e57e7825b9be3
Date: Mon, 07 Jul 2025 10:59:26 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Julien Olivain" <ju.o@free.fr>, buildroot@buildroot.org
Message-Id: <0c6f450a-fda3-400a-a10c-09bab951e23a@app.fastmail.com>
In-Reply-To: <20250706105859.292908-1-ju.o@free.fr>
References: <20250706105859.292908-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1751882387;
 x=1751968787; bh=qsPII8VorbPqCCNUaD2ABWKJHEYTWnPt/B/POtPeRX0=; b=
 Sb8vJfe+TD2PYS9kh6wJ/b79RTqLRFkfWGU9ueapYK2UyD8DPdofzhfm0kjOFelT
 VZKSahh0AfcRqxAJyoJHLi6mccEn8MXum+H4FD3loQrNOX0a4qiF09yq5VSZL307
 CgSixUhWT/HBiwXB8wqZUt7GT1+gKYor20+ax+eMdPp/td/XcOpr/rzcM0L0gG5R
 UXqxQNeUSrsKcUI+9vu7jxolkTwNI6wK8qlnnU2FDIjT4M/u5J0box2ENg8/R5TK
 lJFoRCAK15Pj0yPNY2hzWxR/XfTJpRLgXgh56rpv6+50Fev3zFM+PKLpeBii9Wx4
 naClBzyyJNS23CfXJ0a/Tw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1751882387; x=1751968787; bh=q
 sPII8VorbPqCCNUaD2ABWKJHEYTWnPt/B/POtPeRX0=; b=Ly/mFPpcLtSjp0xEj
 PqYSIaG/EJb53klzsOFu+b/W1nLvPXfRrepnt2J/dwuaZvdkLm2oMRL9+frBfJZC
 Y8nRiOdDAkLU/5USyaJWICeEO9B6mOmFIT1SlMpVYy/Ad8ER+WxblF0I+yghkRlK
 qKWU6RR1WcJ7UsWQ6dawhdY10qx6GsimXzUlTpdaIzjrqhl3o/VW5zuEMwzavN8p
 eCSXLnBDBo6nJvhnaWnwsg9LFT9Lq3kPLMN675zX4C41L5j9OusAzs58rWSy4Scm
 cRYmvkQGBJOlkzJxaqBDV6rjiJCNEpsARQsKCbqu6uaRYKPbP/oId07bfP2cRIEn
 oKkbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=Sb8vJfe+; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Ly/mFPpc
Subject: Re: [Buildroot] [PATCH 1/1] arch/loongarch: add lsx/lasx SIMD
 dependency on fpu64
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgrlnKgyMDI15bm0N+aciDbml6Xlkajml6Ug5LiK5Y2IMTE6NTjvvIxKdWxpZW4gT2xpdmFpbuWG
memBk++8mgo+IFNpbmNlIHRoZSBMb29uZ0FyY2g2NCBpbnRyb2R1Y3Rpb24gaW4gY29tbWl0IFsx
XSwgdGhlIEtjb25maWcgbWVudXMKPiBhbGxvd3Mgc2VsZWN0aW5nIGxzeCBhbmQgbGFzeCBTSU1E
IG9wdGlvbnMgaW5kZXBlbmRlbnRseSBvZiB0aGUgRlBVCj4gY29uZmlndXJhdGlvbi4KPgo+IFdo
ZW4gbHN4IG9yIGxhc3ggU0lNRCBpcyBzZWxlY3RlZCBhbmQgRlBVIGlzICJub25lIiwgaG9zdC1n
Y2MtaW5pdGlhbAo+IGlzIGZhaWxpbmcgYXQgY29uZmlndXJhdGlvbiB0aW1lLCB3aXRoIGVycm9y
Ogo+Cj4gICAgIC0td2l0aC1zaW1kPWxhc3ggY29uZmxpY3RzIHdpdGggLS13aXRoLWZwdT1ub25l
Cj4KPiBBY2NvcmRpbmcgdG8gdGhlIGdjYyBjb25maWd1cmF0aW9uIHNjcmlwdCBbMl0sIGxzeCBh
bmQgbGFzeCB2YWx1ZXMKPiBhcmUgdmFsaWQgb25seSBpZiBGUFUgaXMgNjQuCj4KPiBUaGlzIGNv
bW1pdCBhZGRzIHRoZSBtaXNzaW5nICJkZXBlbmRzIG9uIEJSMl9MT09OR0FSQ0hfRlBVXzY0IiBm
b3IKPiBCUjJfTE9PTkdBUkNIX1NJTURfTFNYIGFuZCBCUjJfTE9PTkdBUkNIX1NJTURfTEFTWCBv
cHRpb25zLgo+Cj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1
bHRzL2QxNTk2NDVkYWI5MjA2ZGQ0NmY0NWU3OTI0MWZjOGE5NTBiZDAzMjYvCj4KPiBbMV0gCj4g
aHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzU0ODk1
ZGI5YzEwYTI2MjgzYjI1YTM5M2NiNmM4NzJkNzJjMjQ1ZDEKPiBbMl0gCj4gaHR0cHM6Ly9nY2Mu
Z251Lm9yZy9naXQvP3A9Z2NjLmdpdDthPWJsb2I7Zj1nY2MvY29uZmlnLmdjYztoPWE2ZjZlZmVj
NGUxMDMzMDEyMjVlZjc0YzJkMTE1OTkzM2QxYzljZjg7aGI9MTc1N2MzMjBiYWRjOTJjMDYyOGVh
ZmNkMDdkNTQ1ODU2NTk2OTJlZCNsNTE2Mwo+Cj4gQ2M6IEppYXh1biBZYW5nIDxqaWF4dW4ueWFu
Z0BmbHlnb2F0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVl
LmZyPgoKUmV2aWV3ZWQtYnk6IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT4K
PiAtLS0KPiBOb3RlOiB3aGlsZSB0aGlzIHBhdGNoIGFkZHMgdGhlIG1pc3NpbmcgZGVwZW5kZW5j
aWVzLCBpdCBhbHNvIHJldmVhbHMKPiBhIG5ldyBpc3N1ZS4gRm9yIExvb25nQXJjaCwgR2NjIGlu
ZmVycyBBQkkgZnJvbSB0aGUgdGFyZ2V0IHRyaXBsZXQKPiBhbmQgc2VlbXMgdG8gaWdub3JlIC0t
d2l0aC1hYmkgdmFsdWVzLiBFdmVuIGlmIHdpdGggdGhpcyBwYXRjaCwgdGhlCj4gS2NvbmZpZyB2
YWx1ZXMgYXJlIGNvcnJlY3QgKEFCSS9GUFUvU0lNRCksIGdjYyBjb25maWd1cmF0aW9uIGlzIHN0
aWxsCj4gZmFpbGluZyB3aXRoIGEgbmV3IGVycm9yOgo+Cj4gICAgIGxwNjRkL2Jhc2UgQUJJIGNh
bm5vdCBiZSBpbXBsZW1lbnRlZCB3aXRoIC0td2l0aC1mcHU9bm9uZS4KPgo+IFRoaXMgaXMgYmVj
YXVzZSB0aGUgdGFyZ2V0IHRyaXBsZXQgaXMgbG9vbmdhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdu
dQo+IHdoaWNoIHdpbGwgc2VsZWN0IHRoZSBscDY0ZCBBQkkuIFNlZToKPiBodHRwczovL2djYy5n
bnUub3JnL2dpdC8/cD1nY2MuZ2l0O2E9YmxvYjtmPWdjYy9jb25maWcuZ2NjO2g9YTZmNmVmZWM0
ZTEwMzMwMTIyNWVmNzRjMmQxMTU5OTMzZDFjOWNmODtoYj0xNzU3YzMyMGJhZGM5MmMwNjI4ZWFm
Y2QwN2Q1NDU4NTY1OTY5MmVkI2w1MTAyCj4KPiBKaWF4dW4sIGNvdWxkIHlvdSBoYXZlIGEgbG9v
ayBvbiBob3cgdG8gYWRqdXN0IHRoaXMgdGFyZ2V0IHRyaXBsZXQKPiBhbmQgQUJJLCBwbGVhc2U/
ICBBbm90aGVyIG9wdGlvbiBjb3VsZCBiZSB0byByZW1vdmUgc3VwcG9ydCBmb3IKPiBscDY0cyBh
bmQgbHA2NGYgQUJJcy4KClN1cmUhIFdpbGwgc2hvb3QgYSBwYXRjaC4KClRoYW5rcwoKPiAtLS0K
PiAgYXJjaC9Db25maWcuaW4ubG9vbmdhcmNoIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcuaW4ubG9vbmdhcmNoIGIv
YXJjaC9Db25maWcuaW4ubG9vbmdhcmNoCj4gaW5kZXggY2YyYTEyY2U0Mi4uMWYzMDIzNjRiMSAx
MDA2NDQKPiAtLS0gYS9hcmNoL0NvbmZpZy5pbi5sb29uZ2FyY2gKPiArKysgYi9hcmNoL0NvbmZp
Zy5pbi5sb29uZ2FyY2gKPiBAQCAtNTksMTIgKzU5LDE0IEBAIGNvbmZpZyBCUjJfTE9PTkdBUkNI
X1NJTURfTk9ORQo+IAo+ICBjb25maWcgQlIyX0xPT05HQVJDSF9TSU1EX0xTWAo+ICAJYm9vbCAi
TFNYIgo+ICsJZGVwZW5kcyBvbiBCUjJfTE9PTkdBUkNIX0ZQVV82NAo+ICAJaGVscAo+ICAJICBF
bmFibGUgZ2VuZXJhdGluZyBpbnN0cnVjdGlvbnMgZnJvbSB0aGUgMTI4LWJpdCBMb29uZ0FyY2gg
U0lNRAo+ICAJICBFeHRlbnNpb24gKExTWCkuCj4gCj4gIGNvbmZpZyBCUjJfTE9PTkdBUkNIX1NJ
TURfTEFTWAo+ICAJYm9vbCAiTEFTWCIKPiArCWRlcGVuZHMgb24gQlIyX0xPT05HQVJDSF9GUFVf
NjQKPiAgCWhlbHAKPiAgCSAgRW5hYmxlIGdlbmVyYXRpbmcgaW5zdHJ1Y3Rpb25zIGZyb20gdGhl
IDI1Ni1iaXQgTG9vbmdBcmNoCj4gIAkgIEFkdmFuY2VkIFNJTUQgRXh0ZW5zaW9uIChMQVNYKSBh
bmQgdGhlIDEyOC1iaXQgTG9vbmdBcmNoCj4gLS0gCj4gMi41MC4wCgotLSAKLSBKaWF4dW4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
