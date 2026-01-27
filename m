Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CA4D2FED9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jan 2026 21:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70F376112D;
	Tue, 27 Jan 2026 21:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoUnoyKyfwpE; Tue, 27 Jan 2026 21:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE2EF60DAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769548314;
	bh=JDnRCbn+q0qPo2LO5P3BmPrfiGDpJI9A3g6Cul66prc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XXZ6oO6NOlieHBFLOOrmxsenAOvHbtUrkedZ2LoGl3WLc+HVB4TvuHG7RAaHLBu9b
	 LvYW9v+V1HVpQ5bbHYZ77Ahp5hRupU7iaIMnYrsEKFeZ78w7JcH/P67X5YvyTXoPAd
	 kTYEz9wOJBtVHGcyzVEGL7w6E8d2p9hGRpl4bjba59H0T8+cd1i1gYXBlXOYH7x+Ki
	 HijVWpfKfIAhvIdgIp9b6VZGpbRWdO/OmrYe8o66yFc1wE/zV1pwHm6BR4W1qOPczs
	 Dx6I7invMNSONVbVi9xEMWUFVL9nzG8b02uzPn2c774OGUJ2OOtOQEFzwSopZuyUJg
	 Yyl9jx1Gyayeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE2EF60DAB;
	Tue, 27 Jan 2026 21:11:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED9F118
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 21:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F247481302
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 21:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZB2C7ZQHo_m for <buildroot@buildroot.org>;
 Tue, 27 Jan 2026 21:11:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=judge.packham@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F1E23812FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1E23812FF
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1E23812FF
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 21:11:51 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-79088484065so55460867b3.1
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 13:11:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769548310; cv=none;
 d=google.com; s=arc-20240605;
 b=gMAORulwxbDQfG8Gb0dMTiSP0Sqb9WKFIlgbiAeGhnI+YLvrGOgXeF9Y8qKn6VaY+8
 kn6lg3b35/lsDIt4KwAnzE4Ju+2k9m6XHnL+5tqyaubc2xQBJuZPcIztJd7e8I+pZ+RB
 40vgfJRNGncpB3Bd9hbSEYot1lPqustcZiMjnr9/piMj/7RioppIRcDv1I/6pZkhDHmg
 1WcSpDxwaOtPOrviHFPz8UfVGlmB8k6bySac5XOqvr08tojIq5aKB+51cFOa3vbLlpk3
 k72jK+r+aom7l7YQo6nnskT20fqmqrKdIICowwwlBaKQCtTYCIy4ASJ8D+4IjFQfNkLv
 8uUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=WHRWQyG7OPUfPSXYKr88+wmcTCjmOtlX2en+egjA1F0=;
 fh=BJkhCjj1o2z0axLE/WnDBdfkLTE23ubUtQn+/XG7TvY=;
 b=ehbuV5W0RRWLI9QEMdPUCfPGCeTkLYKo3bPhuGTd4lVUQnuiSNb7BfyvpQC6wYT9A4
 u1SJx6/9pQxDKKZyehHNUVzM9kKnzZwRwfd72PBNi62xGb7VjOF8bqhPXoOhz+LA9sF7
 TxKSalnKVnbZd37e3frXACjcy/05e6rCHji1368Q6PxbjW1hX0HoqIsAP3aw4ghlbMQS
 VUi87feC2NIiIRtP0nl2EVoUxdxNK8OUijfmb4s2NdjUpIp28w/VnFwJ5H3cQ1YMfnhn
 LyVXHt9nn1VmdMZRR3OlW8hF8yR5gnl/Tb/pChf2apLfLxs8TMMNokcp57sFg+lv+wuZ
 c5cA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769548310; x=1770153110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WHRWQyG7OPUfPSXYKr88+wmcTCjmOtlX2en+egjA1F0=;
 b=lcTY/SG893hHZira37u6IXpslLEHeqaC1Fr08tyPxHUefd6ttyaYd3xaijWBm7naUz
 Ti6lX6+pGYCzHc5+xUDjx5fQ1oD0OAgK1mRpT0f4vDZBqcnuEccC00+yjfZT9we05vhm
 Ly9rTRluGrCK/8R202ZwHeeMt3krsYP1fOapKwDYFu9SQ6j2dFEZ2YXTypW/0Dyehh+W
 dq6OlL5PTAokYAIzBNbvL+tHZry58FqDbQSz1uqUI2URx+wPAZUzzUDfhnqeLKfF9ExB
 kT215z8zQp1Tf3dkaKkwHeyxzl+clqAyXSn98/W0uhWtJ1Y0UTIpbuxiLR4ztzaRMR4Z
 0lwQ==
X-Gm-Message-State: AOJu0YzTpA0NZMwfEm0eTIpOIU3s+9F0FK2ExkT7fLkZpyM00TLonG72
 ysm353oMWQrkgolHOxS4SCj5/C23BHOL2TnnD4mvHWAddJtmC5IO1pIynuFq2yBmANjVMdA4Rd3
 ap8oFmwvZqTfeyWzJK3XmJNlF1krqM/5SpFG2
X-Gm-Gg: AZuq6aIN8+TPm4AatQXKVSF5xeTUAx0SJa1DNGqxuPTLZZhkocrjA7IbRI9Z+s65N6R
 l0SiQw9XVWFq13UoF6JivU2U7nNoQe+3IMoSUO8Oc02xnPFKR8OdWOCh0/he4wigmnJnx/HT0Gl
 a9oVs5myaT3CuweC06siWDFtkJJZMduCz4zMOQWcq1J4w8Ikn7uRsop6QIrCHpO99dTA6GRMMOi
 LXjB4vs0T4fGBW0ocPMfk2kZsOZBRdxjuEQQoR448YnZ/+8Fa6bUGj8BBtuxT9h48Graw==
X-Received: by 2002:a05:690c:9:b0:794:7b2f:5870 with SMTP id
 00721157ae682-7947b2f6f8bmr52923517b3.53.1769548310461; Tue, 27 Jan 2026
 13:11:50 -0800 (PST)
MIME-Version: 1.0
References: <CAFOYHZAeKaF89C8hGkiWz_qBT0Kq4n3bM=tmmSThhV2gBs75Qg@mail.gmail.com>
 <aXknYlAq4sBVhAv2@waldemar-brodkorb.de>
In-Reply-To: <aXknYlAq4sBVhAv2@waldemar-brodkorb.de>
From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 28 Jan 2026 10:11:39 +1300
X-Gm-Features: AZwV_Qh7ag4dtZqAovcvBtIcKu5QyY6C3yJaTXYys8LD1JxizQO2OX3FyngoFaY
Message-ID: <CAFOYHZD9MLCF=w0H6F39WGwwypfXrD4=zJ75wiVfdAnZ0J-niA@mail.gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769548310; x=1770153110; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WHRWQyG7OPUfPSXYKr88+wmcTCjmOtlX2en+egjA1F0=;
 b=B2YG8D9MmNEbb6i04JGMP4NzGUjWO9Phd2xe9gtzN81DuZuMjyV8LXOEpp2/CKU0Ou
 PJeB1O51aoEdhxV/UvZxSxZnteskZjUM1Ooz+d2xe2rDeFk8tVFiPCfNyGw2sQAFB1nL
 r68WwJrZ9Qzfay+WcOEfH3L8UNfxJZVN9cC3MarG743znELlB+5UX52FWFLWok1fI6qT
 7O4FGWaqa6eCwYx+yn9PCeot7LoCNt6lGPVpDKJX/hc0c/VF0f4FsuK2DQ6vPcjEK4bx
 AgFZFxYgubZbLR5EwvV50pPelkym3MyF4qHQlpym0PRDKNipUgufwe1vwp5vV7jzgdOr
 yAtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=B2YG8D9M
Subject: Re: [Buildroot] crosstool-ng piggy packing off sources.buildroot.net
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

SGkgV2FsZGVtYXIsCgpPbiBXZWQsIEphbiAyOCwgMjAyNiBhdCAxMDowMOKAr0FNIFdhbGRlbWFy
IEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+IHdyb3RlOgo+Cj4gSGkgQ2hyaXMsCj4gQ2hyaXMg
UGFja2hhbSB3cm90ZSwKPgo+ID4gSGkgQnVpbGRyb290LAo+ID4KPiA+IFNvbWUgb2YgeW91IG1h
eSBoYXZlIG5vdGljZWQgdGhhdCB1Y2xpYmMtbmcub3JnIGlzIGRvd24uIFByb2JhYmx5IHlldAo+
ID4gYW5vdGhlciB2aWN0aW0gb2YgdGhlIHBsYWd1ZSBvZiB3ZWIgc2NyYXBlcnMgQUkgaGFzIHVu
bGVhc2hlZCBvbiB0aGUKPiA+IHdvcmxkIChvciBqdXN0IHBlb3BsZSB0cmF2ZWxsaW5nIHRvIEZP
RFNFTSBhbmQgbm90IG5vdGljaW5nKS4KPiA+Cj4gPiBPdmVyIGF0IGNyb3NzdG9vbC1uZyBvdXIg
YnVpbGRzIGhhdmUgaGl0IGRvd25sb2FkIGlzc3VlcyBkdWUgdG8gdGhpcwo+ID4gKG91ciBidWls
ZHMgcHJvYmFibHkgZG9uJ3QgaGVscCB0aGUgc2l0dWF0aW9uLCBJJ3ZlIHRyaWVkIHRvIGdldCB0
aGUKPiA+IGdpdGh1YiBjYWNoaW5nIHRvIGJlaGF2ZSBidXQgaXQgc2VlbXMgc3R1YmJvcm5seSB1
bmFibGUgdG8gdXBkYXRlCj4gPiB0aGluZ3Mgd2hlbiBzb21ldGhpbmcgY2hhbmdlcykuCj4gPgo+
ID4gSSB3YXMgd29uZGVyaW5nIGlmIGl0IHdvdWxkIGJlIE9LIGlmIEkgaW5jbHVkZWQgc291cmNl
cy5idWlsZHJvb3QubmV0Cj4gPiBhcyBhIG1pcnJvciBmb3Igc29tZSBvZiB0aGUgcGFja2FnZXMg
d2UgaGF2ZSBpbiBjb21tb24/IHVjbGliYy1uZyBpcwo+ID4gdGhlIG9uZSB0aGF0IGlzIGNhdXNp
bmcgcHJvYmxlbXMgcmlnaHQgbm93IGJ1dCBJIGltYWdpbmUgdGhlcmUgYXJlCj4gPiBvdGhlcnMu
Cj4KPiBUaGUgc2VydmVyIGlzIG5vdCBkb3duLiBCdXQgSSBzdG9wcGVkIGFwYWNoZTIgYmVjYXVz
ZSBJIGdldCBhIHZlcnkKPiBoaWdoIGxvYWQgKDI4MCkgZnJvbSB3ZWIgc2NyYXBlcnMgdXNpbmcg
bXkgZ2l0IHZpYSBodHRwcy4KPgo+IEkgaGF2ZSBpbnN0YWxsZWQgYSByb2JvdHMudHh0LCBidXQg
aXQgc2VlbXMgdG8gYmUgaWdub3JlZC4KClllYWggd2UgaGF2ZSBleGFjdGx5IHRoZSBzYW1lIHBy
b2JsZW0gb24gY3Jvc3N0b29sLW5nLm9yZy4gSSdtIHByZXR0eQpjbG9zZSB0byB0dXJuaW5nIG9m
ZiBvdXIgaGcvZ2l0IGludGVyZmFjZSwgaXQncyBvbmx5IGhpc3RvcmljIHNvCnRoZXJlJ3MgYWN0
dWFsbHkgbm90aGluZyBuZXcgdGhlcmUgKHRoYXQgZG9lc24ndCBzZWVtIHRvIHN0b3AgdGhlCmJv
dHMpLiBJdCdzIGEgc2hhbWUgdGhhdCB0aGUgc2lkZSBlZmZlY3Qgb2YgYWxsIG9mIHRoaXMgc2Ny
YXBpbmcgaXMKZm9yY2luZyBwZW9wbGUgdG8gY2VudHJhbGlzZSB0aGVpciBzb3VyY2UgY29kZSBo
b3N0aW5nLgoKPiBBbnkgaWRlYXMgYXJlIHdlbGNvbWUhCgpJJ20gd2FpdGluZyBmb3IgdGhlIEFJ
IGJ1YmJsZSB0byBidXJzdCBzbyB3ZSBjYW4gZ28gYmFjayB0byB1c2luZyBvdXIKR1BVcyBmb3Ig
Yml0Y29pbiBtaW5pbmcgOlAuCgo+IEkganVzdCBzdGFydGVkIHRoZSB3ZWJzZXJ2ZXIgYWdhaW4u
CgpUaGFua3MsIEkgc3RpbGwgdGhpbmsgcGlnZ3kgcGFja2luZyBvZmYgdGhlIGJ1aWxkcm9vdCBt
aXJyb3Igd291bGQgYXQKbGVhc3QgbGVzc2VuIGFueSBsb2FkIG91ciBidWlsZHMgYXJlIHB1dHRp
bmcgb24geW91ciBzZXJ2ZXJzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
