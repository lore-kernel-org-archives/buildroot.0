Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7456C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 12:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2151840B77;
	Fri, 18 Sep 2026 12:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mXumIoWnPPE; Fri, 18 Sep 2026 12:08:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4CDFC40A30
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789733290;
	b=nT5UDUAJEiwsdewEoclFqvIe9MQr5uoJ9wEIDiZr9CKU4GIRgNDEv+TQ9APxMOzQF+qV
	 MHksz7tUwHlJxfM6o5u62Kagj87kPIekzEZcp1Vl2FSny4K4tncCFA8DQXvvOEU/WkAZB
	 m5Rr/sxr9AtqlwM+BAF6jGdrm68vZrwZ/biokOqK0CDTe56QlZqeJwysvA6zGW4cmsE7l
	 M0wU3JNqq8NtcJn8xgY8X54RcVT5zxinOvcquJJJmjUy4AjhSpEYltGGXjCqHeWzGBD+H
	 nNrhyTKPpbxHRGclBqDMCgcpB6geqXl8uhw1oBKu0YgBrywQ4FiE7igp1C1xjJR7+lw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789733290;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ANP15I7iAOoTInLireiyNFJMDGYu5LSRPhR0ml5pGV0=;
	b=pnRGJhasN6aDhfFv46/MnzPckfEpyIAzp2+XHGtZHd13LvHbhpJN6+9bFFMGbF0lrR/6
	 uQ0wQIamqWBZ+xT0ta4ihMoLOFKMSaX4fMuD6ZOcYqO6XYTXNCjgzedM5FL1VENyEusVZ
	 MokVtIoGLwoeC900cRqFTtteMj06JGXVeUbboGTzQzT2QCbyOYFN4hfekYJHBOEbAmCtu
	 Kl4o0RXMrjzxGniYgrca20XzrKe3AGtTBFlBGcIs+mzZ9lOPYoDoj0I5mSqH+pHTwWF6J
	 Mfpn+ViNNAav8lXxpLLqzRPe+OX4sSCNiB1QFW2Q6PIcL+TiZacJlnDrXxbBR273cGA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789733290;
	bh=ANP15I7iAOoTInLireiyNFJMDGYu5LSRPhR0ml5pGV0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FEp/3G+FoqATOfFC2fULbtWO0ErbiICrrhZY4g1Hx6U0JdrOhiHowEbgzeX7TqBuS
	 zBmmqfBMXidWs6k1yfr/OZlod08kp/+MQ2M8E6m3BEb2V/fp236TUBDFYeNJWU+uOn
	 KGoRZ8xjz99hUBvBRHVAtHAuHY2gLYIyfTFf+Gjj5z0mpLbkR7PA0KGkN0GtBtV3zK
	 QrP2XFsMY0LcCraGSg9Za9R7GGoGAz60FWPlCXBcnTGHj/0UqAY/9STmT9iM2WesH3
	 DLWUGmK1spB3LKqVzdxYzbMKJnWR9KbDJNk/ZHFSrbMl1DPddU5e/SuiVTE7jRrcGK
	 wyaiuknh3tZXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CDFC40A30;
	Fri, 18 Sep 2026 12:08:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C18C93B6
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B330A80CC3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLQgCWyWrca4 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 12:08:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F2AA180CBA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789733287;
 b=Rge2VNiUJ/V26dM9FvWCC+LDgDlKJbgFkfSYqv0Ab9XeB9WcxnYntTzjLGJMv2T18iq9
 Pru0DM3CkKEXWXywJV98/RqbQxZlMpvJ7mViu9zciE5PK8y+8AuhBGRByQLNrnGWx7nUB
 IJpnOTBdknrbil8EhDw+oz7yxrsbmaaCIrbsqgp3vVQ4icEUpCoWFr06MZGlT8jjn3DXm
 1enldI+Ewc3zE8htRkBdX8JThkbOi89fneea1kcnXoKOoJt17W2N5U2y6XgYID8bhkuDu
 mel526x/rTsPAgB9c/4l9ctBFBm6lNLeVXkjvvvfzJqfJ/DvHrs4Kq1fxtD/3v0yQQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789733287;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wjMKAxVofAU9ndWUMKnTIGoObDzgLkTMLC2Mgj6n07w=;
 b=dS20aI923DzoytMMxxzvOYSO/dAyoZBkdTEYMxZPXxkvjmG042+EFys8CkXNiA+3SRxa
 z56fBpnBy+20ZkqCCWIPV+mg8ToVNYbxfFG4QlWW41VsPemYuUK1tG2i6ptEOw0+HJ/kf
 EdsJU9QtCdIz+qU3smquKpNkd34eKhKdw5sbqnVn6grNId1W/6d80G92jtn9sY6XKL5OZ
 goWc90n35Yoz7TZB5vuvxfjmt1bgL8KuziIGxXuAzfx4L3CQbpFXGXICkOqmaC1m3Ao5R
 WM9MVGVVC/dy4sqsBlyGsC16os8ZHb800o7MZ7iPgqWKB6ibDiPqP/xDEhj65uSw7hw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Xxa3nh18; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2AA180CBA
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:08:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4CBBC19F5A5;
 Fri, 18 Sep 2026 14:08:01 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 14:08:01 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 14:08:01 +0200
To: Laszlo Ersek <laszlo.ersek@arm.com>
Cc: Arnout Vandecappelle <arnout@mind.be>, Oleg Lyovin
 <ovlevin@sberdevices.ru>, buildroot@buildroot.org
In-Reply-To: <20260730180627.1224385-1-laszlo.ersek@arm.com>
References: <20260730180627.1224385-1-laszlo.ersek@arm.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <3c80e022a71738fa9db898b80a64dfa2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] linux/linux.mk: forcibly (re)enable Make
 jobserver
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

SGkgTGFzemxvLAoKT24gMzAvMDcvMjAyNiAyMDowNiwgTGFzemxvIEVyc2VrIHdyb3RlOgo+IENv
bW1pdCAwYjllZmM5OTFmOGEgKMKrbGludXg6IHVzZSBCUjJfTUFLRcK7LCAyMDIzLTA0LTEwKSBy
ZXBsYWNlZCAKPiAkKE1BS0UpCj4gd2l0aCAkKEJSMl9NQUtFKSBpbiBhIG51bWJlciBvZiByZWNp
cGVzLiBBcyBhIGNvbnNlcXVlbmNlLCB0aGUgY2hpbGQgCj4gbWFrZQo+IGlzIHVuYWJsZSB0byBk
aXNjb3ZlciB0aGUgam9iIHNlcnZlciwgYW5kIHdlIGdldCBhIHdhcm5pbmcgc3VjaCBhcwo+IAo+
PiB3YXJuaW5nOiBqb2JzZXJ2ZXIgdW5hdmFpbGFibGU6IHVzaW5nIC1qMS4gQWRkIGArJyB0byBw
YXJlbnQgbWFrZSAKPj4gcnVsZS4KPiAKPiBodHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL21h
a2UvbWFudWFsL2h0bWxfbm9kZS9FcnJvci1NZXNzYWdlcy5odG1sCj4gaHR0cHM6Ly93d3cuZ251
Lm9yZy9zb2Z0d2FyZS9tYWtlL21hbnVhbC9odG1sX25vZGUvTUFLRS1WYXJpYWJsZS5odG1sCj4g
Cj4gSW5mb3JtIHRoZSBwYXJlbnQgTWFrZSwgYnkgcHJlZml4aW5nIHRoZSByZWNpcGUgd2l0aCAi
KyIsIHRoYXQgCj4gJChCUjJfTUFLRSkKPiBjYW4gZGVhbCB3aXRoIHRoZSBqb2Igc2VydmVyLgo+
IAo+IENjOiBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+Cj4gQ2M6IE9sZWcg
THlvdmluIDxvdmxldmluQHNiZXJkZXZpY2VzLnJ1Pgo+IENjOiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IFNpZ25lZC1vZmYtYnk6IExhc3psbyBFcnNlayA8bGFzemxvLmVyc2VrQGFybS5jb20+
CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKSSBpbml0aWFsbHkgaGFkIHRoZSBzYW1lIGlu
dGVycm9nYXRpb25zIGFzIEFybm91dC4KU28gSSBkdWcgYSBiaXQgbW9yZSBpbiB0aGlzIGlzc3Vl
LCB0byBoYXZlIG1pbmltYWwgY29uZmlndXJhdGlvbgp0byByZXByb2R1Y2UgaXQuIEkgZW5kZWQg
dXAgbG9nZ2luZyBhbGwgdGhpcyBpbmZvIGJ5IGV4dGVuZGluZwp0aGUgY29tbWl0IGxvZy4gU2Vl
OgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvODZh
NTZkY2MxN2NjNTQwYzA4Y2M0NzYwYWY5NDgxNjM2MDE2NTUwZAoKV2hpbGUgdGhpcyBjb21taXQg
YWxvbmUgaXMgdXNlZnVsLCBJIGJlbGlldmUgdGhlcmUgaXMgYW5vdGhlcgppc3N1ZTogYmFzaWNh
bGx5LCB3aGVuIGJ1aWxkaW5nIGFuIGluaXRyYW1mcyBlbWJlZGRlZCBpbiB0aGUKa2VybmVsIGFu
ZCBwZXItcGFja2FnZSBkaXJlY3RvcmllcyBpcyB1c2VkLCB0aGUgaW5pcmFtZnMKaW50ZWdyYXRp
b24gbWlnaHQgcmVidWlsZCB0aGUga2VybmVsLiBUaGlzIGNhbiBiZSBpbnZlc3RpZ2F0ZWQKc2Vw
YXJhdGVseS4KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
