Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A7ECD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37CD3806DD;
	Fri,  5 Jun 2026 12:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RB-OCcyuakWW; Fri,  5 Jun 2026 12:50:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58E1680702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663855;
	bh=6EUFwOTv/WSuih/LmYwIZKrD7USlaCdQ6+gGNfDC3EE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BXAE4Flbc+7MwcnJEgXIFDkcgwHRXOBakjQ3/4Vedi1jrGxZnHoP0bjQ7SlULXDcp
	 GMWv42HijpdCGghSH++s15UAx4I67iJnmH1rRZz6uCTSKrdSxji2HGLn4sjzaJ8+z7
	 kTgu7lgw8O01Pj2HaeYAx4mWntrlKQMi65x/NSwVOCEbddND95wyhGUnMizdgFVcWq
	 49BGV350QIRoE41kv4tZpEpKYvLzqKEy079/IgcrqHWHE6r7BkHVixML9OAdrZAs0a
	 bXRHoudfwvDbIjQidfBhmKWcEHOGhtzN/ker4JE86ljftYZaLnsJ7w5RSHYqKzyuIb
	 djuw4KFPK1Htg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58E1680702;
	Fri,  5 Jun 2026 12:50:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A305F388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61C91805F5
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuGnda_JL13J for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82A3982E9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A3982E9D
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82A3982E9D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:52 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-45ef616daf6so1684362f8f.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663850; x=1781268650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/dpBDKKqBtt0FPAJe/3eYqjO013koKFw1xPCtxv3wsM=;
 b=mFWxSC12nqrX4P1MXSjimucptn0edAe4ClH/7gtFldqT6Lj9RquU16uyiuOGt7PXQV
 lD1NWYVhrn/2qg9rYpKHhhqFHROpTceXGPyGPrWHxJc7+s8UxTADf6pYhy1sd19fn9+H
 0VU6YaPc1Mrzi1aqOe9jXTx8Xu2ukfD3MUl9kwZnjbEZTVYzhEZDJ9NI8SaL6RLOimQ1
 /wV9h98uggQ0KBcaCzP2agKT0oeVTXoVh5BmFz8YRInhR4tZBFXUtPYIXRSuJNJY1f86
 RPMWRaNxm2Q2z7h0Oe4ZYzc4aq7iLlEfvUjpqeEQTqR1vNp5wzM9bTHX/2iGuSqh0D67
 vdfg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8P6J5g+3PO0TXPAd34CAzHRtKInqpsRLgdHJHw2U51p3JUYRu2YhuJS7aiCn9/xmYbbCTnUME+kzg=@buildroot.org
X-Gm-Message-State: AOJu0YxD+JYBN5LDhEOxqTwIB4X2x5Bg8rWjisFKD7jewLQ7h9ZlUPZX
 MtqY3oKGN7lI+4dcxlW25QA1A86Vof60ztWVX1C2W+NiEMorVCEghHDSHxAch6Nw4Jcs9xVKIE+
 H1UTW
X-Gm-Gg: Acq92OHOjI9lMAgtWPqHz15GQIkFBCI1qgBpqj6gcHluDEadJNgksTisDGUotg/W5LK
 aCX9pTDwlhcsfSUTESQhpyx62XW1XP6kbzUkqwXoitV9bRjavliM7JahXUfAPBgVr2LvIVo8zZx
 yTTvtMyHDvLu6bSLTpInlGPP/gforhrh0HDw+IF6Gi0Jx8hjgiKbQFOf6g2V8WmjYSS2t/Y7zXo
 exi73KzpB31/ufX16LYQttdrsBkDtRpUfinWcLMZbVuOQ841PODE9LHhsS3EjnLTGCYg7cM1BQR
 0608gbeMdUkS1bO/35wzQstZE6HFl7SfjY4dAssJeQxJRQx+VngJN+hCvemfZdITab0TrryfvQS
 FqFqDPKPXYhzkeAWrd+c9qirGb9iFAHQYXGOgtZgwa2NmEom6piUIGHvy8Vc5ellGkdmZhiM0E4
 V4cQnDasyTlZysmIeQjHtE5tq41dtnpmST1AN0
X-Received: by 2002:a05:600c:529b:b0:490:5380:f2cb with SMTP id
 5b1f17b1804b1-490c2528b6amr56678525e9.0.1780663850586; 
 Fri, 05 Jun 2026 05:50:50 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f360bd6sm27471964f8f.36.2026.06.05.05.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:50 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:47 +0200
Message-ID: <20260605125049.274450-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527210017.3567220-2-bernd@kuhls.net>
References: <20260527210017.3567220-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663850; x=1781268650; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/dpBDKKqBtt0FPAJe/3eYqjO013koKFw1xPCtxv3wsM=;
 b=RuJLTbzYS2t5irfk+NuhfWVIPb6Z1/uCylW9/nbjDMOXNW2ali+LKq31aZk/S/+D10
 vURVXV9NdKd5S8AU3KCtvxz3IcrzeCDtE/KQhG4fi9D8fn8cFzS2j8CRxYlgPAQP0z+2
 7GUG/FViiYVLRrE2PXAmOLZcTzmHKu4WbZGoGToOG6JZ1u8vH10VeMeYz4fIw7+6ZMBw
 4bPxog6yMdJPSDtO3mgWy1+Cqnsdapb7bJbiyvpLxZmSQSGYL++CA3Te6n158SRrhMkk
 cl9Aj656eDOrBYIPhbqebKxgfEqPNQLy4r1dYrz0pYku2xjUud/KjmrUbQ13lHX4iHfw
 GLjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RuJLTbzY
Subject: Re: [Buildroot] [PATCH 2/3] package/odhcp6c: needs gcc >= 10
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gRml4ZXMgYnVpbGQgZXJyb3JzIHNlZW4gd2l0aCBHaXRsYWIgcGlwZWxp
bmUgYW5kIHRoaXMgZGVmY29uZmlnOgo+IHN1cHBvcnQvY29uZmlnLWZyYWdtZW50cy9hdXRvYnVp
bGQvYm9vdGxpbi1hYXJjaDY0LWdsaWJjLW9sZC5jb25maWcKPiAKPiBodHRwczovL2dpdGxhYi5j
b20vYmt1aGxzL2J1aWxkcm9vdC8tL2pvYnMvMTQ1NzAwODA0NTUKPiAKPiBhYXJjaDY0LWxpbnV4
LWdjYy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQgbGluZSBvcHRpb24KPiAg
4oCYLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD014oCZOyBkaWQgeW91IG1lYW4g4oCYLVduby1mYWxs
dGhyb3VnaOKAmT8KPiBhYXJjaDY0LWxpbnV4LWdjYy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25p
emVkIGNvbW1hbmQgbGluZSBvcHRpb24KPiAg4oCYLVdzaGFkb3c9bG9jYWzigJk7IGRpZCB5b3Ug
bWVhbiDigJgtV3NoYWRvdy1pdmFy4oCZPwo+IAo+IFJlbW92aW5nIGFsbCB0aGUgdW5yZWNvZ25p
emVkIGNvbW1hbmQgbGluZSBvcHRpb25zIGZyb20gQ01ha2VMaXN0cy50eHQKPiBzaG93ZWQgbW9y
ZSBidWlsZCBlcnJvcnMgZHVyaW5nIGNvbXBpbGU6Cj4gCj4gb3V0cHV0L2J1aWxkL29kaGNwNmMt
MjQ0ODViYjRiMzVhYjg0YzE3YzJlODdiZDU2MWQwMjZkNGMxNWMwMC9zcmMvb2RoY3A2Yy5oOjQ3
OjQ2Ogo+ICBlcnJvcjogZXhwZWN0ZWQg4oCYKeKAmSBiZWZvcmUg4oCYX19WQV9PUFRfX+KAmQo+
ICAjZGVmaW5lIGVycm9yKGZtdCwgLi4uKSBfX2lmbG9nKExPR19FUlIsIGZtdCBfX1ZBX09QVF9f
KCwgKSBfX1ZBX0FSR1NfXykKPiAKPiBBbm90aGVyIHBpcGVsaW5lIHdpdGggZ2NjIDkgc2hvd2Vk
IG90aGVyIGVycm9yczoKPiBodHRwczovL2dpdGxhYi5jb20vYmt1aGxzL2J1aWxkcm9vdC8tL2pv
YnMvMTQ1NzAwODA0NzkKPiAKPiAvYnVpbGRzL2JrdWhscy9idWlsZHJvb3QvYnItdGVzdC1wa2cv
YnItYXJtLWJhc2ljL2J1aWxkL29kaGNwNmMtMjQ0ODViYjRiMzVhYjg0YzE3YzJlODdiZDU2MWQw
MjZkNGMxNWMwMC9zcmMvZGhjcHY2LmM6MTEyNjo0Ogo+ICBlcnJvcjogYSBsYWJlbCBjYW4gb25s
eSBiZSBwYXJ0IG9mIGEgc3RhdGVtZW50IGFuZCBhIGRlY2xhcmF0aW9uIGlzIG5vdCBhIHN0YXRl
bWVudAo+ICAxMTI2IHwgICAgc3RydWN0IGRoY3B2Nl9hdXRoICpyID0gKHZvaWQqKSZvZGF0YVst
REhDUFY2X09QVF9IRFJfU0laRV07Cj4gCj4gc28gd2UgcmFpc2UgdGhlIG1pbmltdW0gZ2NjIHZl
cnNpb24gdG8gMTAuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxz
Lm5ldD4KCkFwcGxpZWQgdG8gMjAyNS4wMi54ICYgMjAyNi4wMi54LiBUaGFua3MKCj4gLS0tCj4g
U2VyaWVzIHBhc3NlZCBHaXRsYWIgcGlwZWxpbmU6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2JrdWhs
cy9idWlsZHJvb3QvLS9waXBlbGluZXMvMjU1NzIyMzU1MQo+IAo+ICBwYWNrYWdlL29kaGNwNmMv
Q29uZmlnLmluIHwgNSArKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29kaGNwNmMvQ29uZmlnLmlu
IGIvcGFja2FnZS9vZGhjcDZjL0NvbmZpZy5pbgo+IGluZGV4IDgzYjM4NzU1YzMuLjBhY2FmZjdm
ZWQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9vZGhjcDZjL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2th
Z2Uvb2RoY3A2Yy9Db25maWcuaW4KPiBAQCAtMiw2ICsyLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdF
X09ESENQNkMKPiAgCWJvb2wgIm9kaGNwNmMiCj4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMg
Zm9yaygpCj4gIAlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBsaWJ1Ym94Cj4gKwlkZXBl
bmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzEwCj4gIAlkZXBlbmRzIG9uIEJSMl9U
T09MQ0hBSU5fSEFTX1NZTkNfNCAjIGxpYnVib3ggLT4ganNvbi1jCj4gIAlzZWxlY3QgQlIyX1BB
Q0tBR0VfTElCVUJPWAo+ICAJaGVscAo+IEBAIC0xMCw3ICsxMSw3IEBAIGNvbmZpZyBCUjJfUEFD
S0FHRV9PREhDUDZDCj4gIAo+ICAJICBodHRwczovL2dpdC5vcGVud3J0Lm9yZy9wcm9qZWN0L29k
aGNwNmMuZ2l0Cj4gIAo+IC1jb21tZW50ICJvZGhjcDZjIG5lZWRzIGEgdG9vbGNoYWluIHcvIGR5
bmFtaWMgbGlicmFyeSIKPiArY29tbWVudCAib2RoY3A2YyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBk
eW5hbWljIGxpYnJhcnksIGdjYyA+PSAxMCIKPiAgCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKPiAt
CWRlcGVuZHMgb24gQlIyX1NUQVRJQ19MSUJTCj4gKwlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElC
UyB8fCAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTAKPiAgCWRlcGVuZHMgb24gQlIyX1RP
T0xDSEFJTl9IQVNfU1lOQ180Cj4gLS0gCj4gMi40Ny4zCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
