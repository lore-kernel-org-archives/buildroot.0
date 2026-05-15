Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5ADCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 21:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 284FC847DA;
	Fri, 15 May 2026 21:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jce41rhSE-20; Fri, 15 May 2026 21:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BDB1847D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778878930;
	bh=ZR+6RExfk0R8lTvjJ6DVDDn+ckVw9VJFZ16DRvUf8i4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=grZEVWqcIH9+Bm+QtIoODxj8FS+cg5iwZDbUFFFOTYBLRxnS65AmcB2RoS7SItbA6
	 JUeuvxIOFqb9b/gqpgegPP04F6CSpAdkn4qAAFuEIVkXosKbjixDqHg8UVcUfkcwjK
	 VEbWnb9d6w1YJE8QtVFizefPDHjdaPr03qwRUGuzZLTSZZHPqj2js6GehpNDkRIdER
	 UjC+fTNdCBe3tB99TrewTuZvbr3bFlgS/G93kNdzggQPz2CR6DSNK7/qiOUMSI2EuL
	 4Sy76l8Yal/aHKIZ3VHDmIFVKOJ0CL2dAthvEUNhpnGH14Q4pkMMtPXZJudLnEZfTp
	 ceEXyNh+1aBug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BDB1847D7;
	Fri, 15 May 2026 21:02:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 026BB206
 for <buildroot@buildroot.org>; Fri, 15 May 2026 21:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFEE041DDE
 for <buildroot@buildroot.org>; Fri, 15 May 2026 21:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZEfqATLUtUFO for <buildroot@buildroot.org>;
 Fri, 15 May 2026 21:02:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 36A7941DDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36A7941DDD
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36A7941DDD
 for <buildroot@buildroot.org>; Fri, 15 May 2026 21:02:06 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so1127095e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778878925; x=1779483725;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UpPcsf5i/y/8x6d5ROjdXH+IcN2e63YhOB2I9p1zBfo=;
 b=DMsDXdb4S8pRUR9bKL5vCgz9uTUXhfbCjG1rPLubsQvAMY3YytTgVhjHwqy2iDxjVV
 Qp+EmMvBbzbnG1p+fK4afTXUdHqs6tRYFBOQ/u91MeigNSncR8wZ5JTlkSTfK6HQ5xRZ
 Yjh4BGX5Q58TB0q0UOe5alRnA8peRuV9tHhm+pQbIMNlBvXf1MScORO/7WgNLa0nl0Kl
 1tp1HpU6WFk1IzgqpbNyNPElpILNJabo1pBnKG00KaM9dvGxeMyBoiWCLhknB55+E4TU
 vFlM4HCTqLoj4uV26Rx6VW+DEn6B+M4vXRcPJV9DMbCOhXh7zfRj3Df8S0LU0GxRZKeu
 Bnmg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/i0SUqeOaeai40mdNPQyknXBw/2svIyy4EEXKY98bmw1gudoM8jDN83CqiIcntAZ7k5GkL4ggRdZw=@buildroot.org
X-Gm-Message-State: AOJu0YyGcN4IUps82nNaolmy7Fw3IDZgqXAbEILc0TwlKgfMzfVSg+sz
 qo1ByQhCBD4WzaezO87mBeFrHPG9w/82IkxBhqW76HNJxqYROpW9tvVOxA5K9XWePSYVFqqIIGz
 Cd7Y+RyY=
X-Gm-Gg: Acq92OGlv+hoLEjFTgk+yLEY9ZreUbJUzGzvdCpNQkRKpTkoReGmv5Ubv2lcAEIQX3h
 fo/BEiL0ptJ69FPr7fZnDEQPlKpZwr/Dnmx4o9xJXhfHoQyyewjeAukZSz22NVXbdIw/W4agdq4
 om/2LajLZhyM2pl8r8xDLQTfwMsXvLvYLzhxwfic+oXmHb116Phk+ElRyPCobYr6tth9IR3hUVb
 GnfBqh9m408eJAYLNpsAG7uIl1Y4DKoCT9RJs6VXyW8BMUgEZ0xW3HNjwpX2D6yPamI3ruxq7uD
 cySy18UAiG08P85f5jy5ICWPfGyVDjjoNlFh1+kqXRUjJCbQHojmUhQ9oElQSOn16kfbJwxEO4r
 SYf00q+qTnASQuN++e2+HWCWNS9X5aMcpQgCyM/W714wI5laS2EUM3AzyA3DbF/s+P1RoK7PHlj
 /YnQE2JtiIoFLSYktDpsDR0wB/IpVQYMd2CK0weebm3DCgDGyrVkhuGfTMChrZLTtyN/q8CxW2F
 4HBH2QTxhM516kxzkUda9chX57wVRjpJP7+2UjNEd2//m52NQGmoKVd+MMvrGj5tGX2IA4gTz/n
X-Received: by 2002:a05:600c:3e1b:b0:486:fd5c:2b35 with SMTP id
 5b1f17b1804b1-48fe60eccc3mr74329765e9.13.1778878924756; 
 Fri, 15 May 2026 14:02:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feaa2a878sm37768955e9.1.2026.05.15.14.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 14:02:04 -0700 (PDT)
Message-ID: <9589262d-c47b-40e6-8bfa-1c49820dc2df@smile.fr>
Date: Fri, 15 May 2026 23:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Will Newton <will.newton@gmail.com>
References: <20260427201525.3447689-1-bernd@kuhls.net>
Content-Language: fr, en-US
In-Reply-To: <20260427201525.3447689-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778878925; x=1779483725; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UpPcsf5i/y/8x6d5ROjdXH+IcN2e63YhOB2I9p1zBfo=;
 b=hmwt5ukVE+yB4VgsQqrjZZH0Ws+/qeC/aIcxLO8N/WCoImKX3pHtabCKFnh1Eis3l7
 ryAKVSy5RXuf1iALMYDUR6S0t7yINA8KL4HGCwZRxdTY1RGwW7LQhtauqBQ1vrVV3eG3
 pxqXCVeySzwfFjrPYjjs9/V4snqLxWEbf5KVo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=hmwt5ukV
Subject: Re: [Buildroot] [PATCH 1/1] package/libmicrohttpd: fix build
 without pkgconf
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQmVybmQsIEFsbCwKCkxlIDI3LzA0LzIwMjYgw6AgMjI6MTUsIEJlcm5kIEt1aGxzIGEg
w6ljcml0wqA6Cj4gQnVpbGRyb290IGNvbW1pdCA3MTIxMjEzMjZmODRlMjUwOGFiMTYxMDUzYzJi
MDRlNDU1MTFjNzlmIGJ1bXBlZCB0aGUKPiBwYWNrYWdlIHRvIDEuMC41IHdoaWNoIGluY2x1ZGVz
IHVwc3RyZWFtIGNvbW1pdAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9LYXJsc29uMmsvbGlibWljcm9o
dHRwZC9jb21taXQvYTFmOTM3NDIyNjU4ZDNjNmQ1Mzg1M2M1ODdiYzAyNTI3NGFmYWM0ZAo+IHRo
YXQgYnJlYWtzIHRoZSBidWlsZCBpZiBwa2djb25mIHdhcyBub3QgZm91bmQ6Cj4gaHR0cHM6Ly9n
aXRodWIuY29tL0thcmxzb24yay9saWJtaWNyb2h0dHBkL2JsYW1lL21hc3Rlci9tNC9wa2cubTQj
TDg0Cj4gCj4gQWRkZWQgUEtHX0NPTkZJRz10cnVlIHRvIF9DT05GX0VOViB0byBmaXggdGhlIHBy
b2JsZW0uCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1
bHRzL2UzZS9lM2UyNTc1M2M2NzBiNWQ4NmQwNDJkODUwNTgyZTJlMWUwZWVkY2E1Lwo+IAo+IFNp
Z25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gLS0tCj4gIHBhY2th
Z2UvbGlibWljcm9odHRwZC9saWJtaWNyb2h0dHBkLm1rIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm1pY3JvaHR0cGQv
bGlibWljcm9odHRwZC5tayBiL3BhY2thZ2UvbGlibWljcm9odHRwZC9saWJtaWNyb2h0dHBkLm1r
Cj4gaW5kZXggN2EyNDNiNDJjZi4uMDFkOGQ1ZjExZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xp
Ym1pY3JvaHR0cGQvbGlibWljcm9odHRwZC5tawo+ICsrKyBiL3BhY2thZ2UvbGlibWljcm9odHRw
ZC9saWJtaWNyb2h0dHBkLm1rCj4gQEAgLTIwLDYgKzIwLDcgQEAgTElCTUlDUk9IVFRQRF9ERVBF
TkRFTkNJRVMgKz0gaG9zdC1wa2djb25mIGdudXRscwo+ICBMSUJNSUNST0hUVFBEX0NPTkZfT1BU
UyArPSAtLWVuYWJsZS1odHRwcyAtLXdpdGgtZ251dGxzPSQoU1RBR0lOR19ESVIpL3Vzcgo+ICBl
bHNlCj4gIExJQk1JQ1JPSFRUUERfTElDRU5TRSA9IExHUEwtMi4xKyBvciBlQ29zCj4gK0xJQk1J
Q1JPSFRUUERfQ09ORl9FTlYgKz0gUEtHX0NPTkZJRz10cnVlCgpJIHRoaW5rIGhvc3QtcGtnY29u
ZiBkZXBlbmRlbmN5IHNob3VsZCBiZSBhZGRlZCB0byBsaWJtaWNyb2h0dHBkIHVuY29uZGl0aW9u
YWxseQppbnN0ZWFkIG9mIGZha2UgaXQuCgpJdCBkb2Vzbid0IHRha2VzIGEgbG90IG9mIHRpbWUg
dG8gYnVpbGQgYW5kIG1heSBiZSBmdXR1cmUgcHJvb2YgaWYgdGhlcmUgaXMgYW55CmxhdGVyIHVw
c3RyZWFtIGNoYW5nZXMgdXNpbmcgaXQuCgpUaGlzIGFsc28gZml4ZXMgc29tZSBnaXRsYWItY2kg
ZmFpbHVyZXM6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9q
b2JzLzE0Mzg2MzUxODI2CihUZXN0SW5pdFN5c3RlbVN5c3RlbWRSb0Z1bGxPdmVybGF5ZnNWYXJC
YWNraW5nTW91bnRVbml0KQoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290Ly0vam9icy8xNDM4NjM1MTg3MgooVGVzdEluaXRTeXN0ZW1TeXN0ZW1kUndGdWxsKQoKaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xNDM4NjM1MTgy
NAooVGVzdEluaXRTeXN0ZW1TeXN0ZW1kUm9GdWxsT3ZlcmxheWZzVmFyQmFja2luZ0ZzdGFiKQoK
aHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xNDM4NjM1
MTgwNQooVGVzdEluaXRTeXN0ZW1TeXN0ZW1kUm9GdWxsT3ZlcmxheWZzKQoKaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xNDM4NjM1MTc5OQooVGVzdElu
aXRTeXN0ZW1TeXN0ZW1kUm9GdWxsRmFjdG9yeSkKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTQzODYzNTE3OTcKKFRlc3RJbml0U3lzdGVtU3lzdGVt
ZFJvRnVsbCkKCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+ICBMSUJNSUNST0hUVFBEX0NPTkZfT1BU
UyArPSAtLWRpc2FibGUtaHR0cHMKPiAgZW5kaWYKPiAgCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
