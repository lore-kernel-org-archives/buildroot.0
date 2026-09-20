Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEAEC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0319540D1A;
	Sun, 20 Sep 2026 13:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXN3cGl4g8Lv; Sun, 20 Sep 2026 13:43:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A145B40B2C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789911831;
	b=H/UFXyp5784hysV9DBftoIGpi7L+2FaQa7TDby1igirpg3XspLxnS270qesVXxYzUzkx
	 +ntzNf/fqPUyIBiYG/Dh/uNECA9RLlS3/KTOwLYavMAc+94asvlCnDA5pFGGLxqunMBLe
	 fkJxQE4H/9JWZLZbin+yWi4hyR1pAju8vCTOZxgXtGqGP31lpOxmrSPX53zT0UYjiT/9B
	 GpviijcACgiC4lxIVHiMxhXKySql3en2GTx53l2xVuPSZJzeKd3sU3MsF4w61brn1VS0n
	 QFv1FI7cOS0MRA3AQOZIXF2QDBnXwqFlbo1StIozN6XKP8dbxMaYnbsxlKqwfooBZUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789911831;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=h6kWJg/xxRNv9B6L8PUWAzpFIbbhv3BHwjrzDPvIjJ0=;
	b=La2lujBhZqmgEQUQMIkDh21z5IqCelHjBUuyrjcZkAfT4aewCAurjwwDQd+06CgAbvo2
	 6eWhyxpxwBfDvxrXX4OJ2Xl/o77geRzOD3i/lDsgq7HXxUeBiuV5+xm2JCbg8xvuXVr+6
	 hW89nUBpLEOGZZYm8pHL50KLFSsPRYRQzak92BlsAtziHHXHVoTOVhSBJlHRUktIDpOQr
	 5QJvTGGdGs/P+okxV9yFrOL5+0GMrawRFUN40qppSButn6JJbuQ+hIEX9l2a1fMMnQ+pH
	 2t90BBbgj0Yob8aIxvkNO/WUiDdDsCSoIoOxCMz8+vD6d6MTNZ9LHdS06HeSZW5tgLQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789911831;
	bh=h6kWJg/xxRNv9B6L8PUWAzpFIbbhv3BHwjrzDPvIjJ0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QLuAEJOS0Fy93KvRzPXNMasmLmIfJ8iBcfQ1bI5tlSwbGiFJTmb8kLl/je2y08b26
	 hx2d4Mh6E6aw/r/R7UoUCfojagq4CGy3e9NvRY7bMV/TLRmqnTjIOlETtoGYRdxNUn
	 ZFD4Q7CwzNqQcSTRvCtBzQS4CH4xkYyfhPrZJLK0Mp7LB3bESYxJgmVuM/uX0wMXfO
	 92ubTDj4HGI8qKWaGlniysWYq57NFstXP+RZawKL/6hoOcnE+DEKWPc0RjUHJP3N2Q
	 dpk1wWLiD9HyqXGor0h15tEUAChizD7/uwEsl8CMH6hzNzk9lXE0EjK/FqyOd4Ued/
	 gxr+b/b+G8Vtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A145B40B2C;
	Sun, 20 Sep 2026 13:43:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 143733AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDB9D80D1A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4rjLMqBo_bo for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:43:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E0CD680BD7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789911829;
 b=Hvv9hXTRYwe0es30D6uM4BFX4JGmGAA2cXpTcKJ8lJ7rkec1UdfKx/xliPgYQqKgjesK
 UplrcbpBUN0o0/t5ZYB2twH55cWLYh/PLb9lRPOTlozDA133xm2AjckA2kg7e/epIbhgN
 cMTF06mGGzYQxjWSKauUQ9LSw7GJI0jr3aPuWrblPzkUQvoXWh0t4YNHHbqA9NvhACcEN
 xgkfI4/0nVna1R6Lp6+M4FswOiuKsn30Vh3FPcBZ3Hxrhtij6yMYxfMXn4mhwrmaDQ58Y
 o8Dp/77Gh4wDf7ilwuJEXfZecDMMRn9AU4+1ZEfKbQI7LAPgkW0l8cpcF29/JTmVrfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789911829;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=lWhYrE7GU97ctBnDYXy+EVBp6tJRTV5SZGbyvznI8VI=;
 b=B23zynZ0+FB7SY9d6tz439EjSCL7X4hZCcnINJM14DYKjmy534l5fr6/gpXcn1zV6IXn
 hy3RMsjPY1VAg47P1rMhbi6mP5/qu04dQYhyb7c7nKfNTtzbrUm6wBrVgiQMr0hd3EohH
 /OAfX9W3gcf11CkrXAiU5uoXUKuJyIW2ezwJ9OFS/TJ30kTTqY6QRvcQERHjp85lBCget
 lZ5UWeTsJpP1i7XYVW5qEE/QXP8eXWj6oD9EfT/h/rzg1Xbj2fcI5zp6BM7AOC+MT8Ik3
 sfS8JIsKI6u5J3lz5pAxxpUazISY9QY6CJePN+Wxlgwlffcnqy34AkXr7EUm9rmxdGA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Ac3vcShj; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0CD680BD7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:43:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B0684C63455
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:44:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E3BEA6033F;
 Sun, 20 Sep 2026 13:43:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9AA7A103286A4; 
 Sun, 20 Sep 2026 15:43:44 +0200 (CEST)
Date: Sun, 20 Sep 2026 15:43:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alex Suykov <alex.suykov@gmail.com>
Message-ID: <aq_jCw8MOh0iVagJ@windsurf>
References: <20260912201718.1667470-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260912201718.1667470-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/vboot-utils: Fix build with
 OpenSSL >= 3.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBTZXAgMTIsIDIwMjYgYXQgMTA6MTc6MThQTSArMDIwMCwgQmVybmQgS3VobHMgd3Jv
dGU6Cj4gUmVtb3ZlIC1XZXJyb3IgZnJvbSBDRkxBR1MgdG8gcHJldmVudCBidWlsZCBlcnJvcnMg
ZHVlIHRvIHdhcm5pbmdzIG9mCj4gZGVwcmVjYXRlZCBmdW5jdGlvbnM6Cj4gCj4gZnV0aWxpdHkv
Y21kX2NyZWF0ZS5jOiBJbiBmdW5jdGlvbiDigJh2YjFfbWFrZV9rZXlwYWly4oCZOgo+IGZ1dGls
aXR5L2NtZF9jcmVhdGUuYzo5Njo5OiBlcnJvcjog4oCYUEVNX3JlYWRfUlNBUHJpdmF0ZUtleeKA
mSBpcyBkZXByZWNhdGVkOgo+ICBTaW5jZSBPcGVuU1NMIDMuMCBbLVdlcnJvcj1kZXByZWNhdGVk
LWRlY2xhcmF0aW9uc10KPiAgICA5NiB8ICAgICAgICAgcnNhX2tleSA9IFBFTV9yZWFkX1JTQVBy
aXZhdGVLZXkoZnAsIE5VTEwsIE5VTEwsIE5VTEwpOwo+IAo+IGZ1dGlsaXR5L2NtZF9jcmVhdGUu
YzoxNTU6OTogZXJyb3I6IOKAmFJTQV9mcmVl4oCZIGlzIGRlcHJlY2F0ZWQ6Cj4gIFNpbmNlIE9w
ZW5TU0wgMy4wIFstV2Vycm9yPWRlcHJlY2F0ZWQtZGVjbGFyYXRpb25zXQo+ICAgMTU1IHwgICAg
ICAgICBSU0FfZnJlZShyc2Ffa2V5KTsKPiAKPiBmdXRpbGl0eS9jbWRfY3JlYXRlLmM6MTkxOjE3
OiBlcnJvcjog4oCYUEVNX3JlYWRfUlNBX1BVQktFWeKAmSBpcyBkZXByZWNhdGVkOgo+ICBTaW5j
ZSBPcGVuU1NMIDMuMCBbLVdlcnJvcj1kZXByZWNhdGVkLWRlY2xhcmF0aW9uc10KPiAgIDE5MSB8
ICAgICAgICAgICAgICAgICByc2Ffa2V5ID0gUEVNX3JlYWRfUlNBX1BVQktFWShmcCwgTlVMTCwg
TlVMTCwgTlVMTCk7Cj4gCj4gZnV0aWxpdHkvY21kX2NyZWF0ZS5jOjE5OTo5OiBlcnJvcjog4oCY
UlNBX2dldDBfa2V54oCZIGlzIGRlcHJlY2F0ZWQ6Cj4gIFNpbmNlIE9wZW5TU0wgMy4wIFstV2Vy
cm9yPWRlcHJlY2F0ZWQtZGVjbGFyYXRpb25zXQo+ICAgMTk5IHwgICAgICAgICBSU0FfZ2V0MF9r
ZXkocnNhX2tleSwgTlVMTCwgTlVMTCwgJnJzYV9kKTsKPiAKPiBjYzE6IGFsbCB3YXJuaW5ncyBi
ZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+IAo+IFRoZSBvbGRlc3QgYnVpbGQgZXJyb3IgZGF0ZXMg
YmFjayB0byAyMDI0IHNvIGEgYmFja3BvcnQgdG8gTFRTIGJyYW5jaGVzCj4gc2hvdWxkIGJlIGNv
bnNpZGVyZWQuCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9y
ZXN1bHRzLzM3NS8zNzU1NGM1Y2U3ODQ4MzVhMzZmMDA2OGQ5YTBjMWNkOTMxMjEyYjQ0Lwo+IGh0
dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8xZmEvMWZhYmNhMTFjNzgzOWQy
ZDdlZDgwOWYzMDQ4MjU5NTcxOWEyOWM5Mi8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhs
cyA8YmVybmRAa3VobHMubmV0PgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcyEKCkJlc3QgcmVn
YXJkcywKClRob21hcyBQZXRhenpvbmkKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFu
ZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQg
dHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
