Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F12C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E7B4811AE;
	Fri, 25 Sep 2026 14:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOeg_KTswnDW; Fri, 25 Sep 2026 14:43:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 90A91811E1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347417;
	b=lTE5RH3iL/uYc8SUFWjmrdC6QTgqkzQc+u7D4e0LKiYxJ+Lq9CXgPRX8dN6Hacdz7qWR
	 ef9mlyq/zbPONhtqP0dcemGqoBlYh1jt4sDuSS6x/O8uIhbjguWTCnMUjqUgwUwWHT9dl
	 CyI4Ofs50Jp4Ra4jnRyd5nF5GgfgzVC8trZUv/O5C3g3e0uGjvAH8Ug4FuBGraMTokAmT
	 Olf/LYQMX+7nC1SYYn6Ulv66VDC8icHIm0CHAEgQgjBf1FzqggigweLhlAu9i7ttY/xnG
	 Z/VkGJ+YbD978B77YZ11QWrjLoF+OGsq7u9Ryr1HXSlmtCtG8NUy2HHxZ/rGkOyIzSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347417;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=m+SBIXA4+96SDwN5yw2Jeo7H/9vC27lwoa+NveAvXFY=;
	b=HOv5vY0xhXL5CNer8SErQTpr0RTNya9kGRC9pOLGAnld7Z7fkQtEE0LMdM4K9O3/cJgK
	 r1UQj582OYDveE5v2sqtwLtPeRTYZzVAuipeB8ylmEXTSFmSGLxYOZdZRO+M7hQwr1wLR
	 4wBZ49yAgC6r2sFZROfAEO6QRIcXIxdbsb+If4Aa7f63N2bjGxBAboPP/eWXEn7aaS4Lx
	 4mv6+ux57NaSMGVE3RwS5LmJWeXUJcVnxifTWYTM7u34YG87fm8cCKwpTSp34jRO46dTw
	 VeELYRxVhIpSUhjrLomVcWAzxlxPlV9ercn37paW3358ZmRR8Y2hAOK0uFq4ipkmjCQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347417;
	bh=m+SBIXA4+96SDwN5yw2Jeo7H/9vC27lwoa+NveAvXFY=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=VLBNnMiy9hTHaMotZtgfP0qAVg2iynFubM/CQg+H6AvvWt2SQ0MHAvd5qagfaDeUz
	 c65i9hWiS2KDxpLBW4wrqbkkJixMxkjUArpmHJK4r9BDSJKn1mmfDtNM7VndJQg3l6
	 8VfXzwV2J/6PCGWWHHy2v3knkT+KyvU2u+uMOVh2jVxEbXR4AEST6+ToPELMBGXjPh
	 XgnmueKLiQjgwItSho2ThBaaqoo/CoxTInUfh+fKSIHz+yrtNZHblMD5li2Lzr6tp0
	 k7ipa/NL8ydl4i4+Oh/E4cliKYd+vqS0aO2/Uolxni9/qcHH11/bofRaMrr0gjHU4I
	 laO1s0bWv2HHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90A91811E1;
	Fri, 25 Sep 2026 14:43:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C8A6332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52E5460D90
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tg6LUBj7UbQq for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:43:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 48F4560D8F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347415;
 b=jT8HE0nWOmxhNCltx5gXHa0GeWslCWuuZjsQIMMq+0RqFhY8iWS7jrXZJiLAQZKe9p3O
 ynn10CG24BuoJ2VwWsphlxQtfKq9B0FDel/ljLh+0WbJoeNMXuE3ZIwxwsDvemSvqQytA
 BotYyvCmMoHHBWEi87D6TwwHILBO/dgJAHNSKVGktUwKj3OUdmP6lP2BuQJlNUKhOBF7G
 DPpV+gbUkYK+voSzO777okm77BfAMlX7Ehy7YQYD/HgvWXQu0trmgUI8ctpUL3VxBHBue
 vYAIZRAEdFBKRo6KooIsopyQCyIC8pQZTe6NWDUzRkLtgVR1V1HiXD6SNKqome/Asog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347415;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=W2dmVlRdcLvfWS8t9h6XcA5FSIhvhU9Nby/ZZFYJ3lU=;
 b=VtDGeMdlyGMG2BmHiTMyQWEJCeKrowedrK4S7Zg4+j48ysEGlrc+gtcCwQQHGBcVx+6W
 aFWRo3AETyY0pH9XKk8oQ4d/Q5Pu+TjHNrCWeETrDvWXrKmJFL33m+kW0XH6ssRkXpMI3
 MfWONDdRlfgCgFe6ZOgETWBXMp9jg5TfEkD3Uk3gR3C6xuzmULaAYhCIwAxfUoZYoBpsg
 g7t9N++tKWlAb9S6gHf/TyV8VEu8Nkq9ag/q0t7i7i7vLly9kIdsS/bl0JrbdIE95Qfl3
 c+750ZNtegfaOrpTLmp0sPwM81yRY+nJsI3RT5rcx/jk4o3RfP1pZaMLzFFVW2/FSBQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KOSh072K; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48F4560D8F
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:35 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e71cdb22bso7336685e9.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347413; x=1790952213;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=W2dmVlRdcLvfWS8t9h6XcA5FSIhvhU9Nby/ZZFYJ3lU=;
 b=1rZJuHYJt1AFeC148NA7ek6u9L7a20RNx1DamstBoQX02mmynnw1SIL/t5NaokfIbH
 0TftEGWf44Fs41lqwfgGbEhyNjCX4uawKA/FYBIM9bGxho0qvnDc9ZM9hus8UYi226+g
 Zp3SNNt6pMzvWQM0KYYZrb6KLcqZEN7quV05xy9cZqbGFhi8wbOl+GTV3xjG5kej138i
 DxsvU2d7pkZ6icBtzyMp14+RCsPJ1yA5xJMOh8iN0mRuUXdjoHOhnHruNGphnDgPY6O6
 kl9K/es6PYW3E6TZRvBxpCB3w+bOYmc7laeftf2XttwA22FXEchIPjkk4sjNb5vN1lIt
 xHyA==
X-Gm-Message-State: AFuF++n+6XTtwP3y6wBsKfzlfOwRd0Nupl2o7iZglsJsHu/X9RRLrAeX
 /XwIkQbz4T3bOTt+CgjXQT4iugo+5VnFBmTHByn8/CLykoOD35R+4P/1r1p7PhLzABWFMIUQCEt
 o2o4u1uPPPA==
X-Gm-Gg: AYBFou1CdrpGvclmaqU0E+vnwjmt4fNMI7sx/q7kprT882Pmk/V3q3WYhGxi2pDyNPw
 Dt9nUk/ae1piCNbPuAaKYKodvPtO7LVyb1JzXi/1l4NGt9m6tzciQLbjYol0HAWOAj3jWY3uP5W
 9970B85a8sEhh95t6s3YyUkpq+aiUKc0SM6DQsiR4P25Y1fzuO6QquYghh0bhKEde7FTxxZuwty
 jV26ZVeMujASmyWV6Z0Ciq1LCFqQ0IiCn0muezgLx0Zg5Dfql/fCa0tG7EkFBNWk56HNdfEO3sd
 zfJqFkdkmoj3NxtgvRB07VQqA3CP5l55bFmfmyrjdt/9NiNEntoU7Om7CyGpwFniw+8QighXAtY
 iZMAyaeMZgIOHRB9/vWSXquhGV4ZkYHP3sT9tF7b6ireZZqsdvjKykVshPPgjUTe2H5zio72MLP
 dze87ODY/WobkCogGgB6cNd2zOdKpZ7hkXYgNwDibIHXzbvap3PS3Hf65GUa7CV79ssgX1Q31Fy
 Y+yYRyj4xGb1gXrC7PgKCXvLkNZauWcYu1WYdHhVl5oYlRNGCk7
X-Received: by 2002:a05:600c:4f4f:b0:49e:69f8:e846 with SMTP id
 5b1f17b1804b1-49fe66cbb70mr117940105e9.9.1790347413118; 
 Fri, 25 Sep 2026 07:43:33 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fef60da94sm52485985e9.4.2026.09.25.07.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:43:32 -0700 (PDT)
To: buildroot@buildroot.org,
 =?utf-8?b?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:43:25 +0200
Message-ID: <20260925144331.4094714-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260820105705.1502630-1-raphael.melotte@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/fcft: use release tarball
 instead of archive
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gQ29kZWJlcmcgaGFzIGNoYW5nZWQgdGhlIHdheSBpdCBnZW5lcmF0ZSBo
YXNoZXMgZm9yIGF0IGxlYXN0IHNvbWUgb2YKPiB0aGUgZ2VuZXJhdGVkIHRhcmJhbGxzIChzZWUg
WzFdKS4KPiAKPiBUaGlzIGNoYW5nZSBhZmZlY3RzIHRhcmJhbGxzIGdlbmVyYXRlZCBieSBDb2Rl
YmVyZywgYnV0IG5vdCByZWxlYXNlCj4gYXJ0aWZhY3RzLgo+IGZjZnQgdHVybnMgb3V0IHRvIGhh
dmUgYSBwcm9wZXIgcmVsZWFzZSBhdmFpbGFibGUsIHNvIHVzZSBpdC4KPiAKPiBbMV06IGh0dHBz
Oi8vY29kZWJlcmcub3JnL0NvZGViZXJnL0NvbW11bml0eS9pc3N1ZXMvMjg2MQo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KCkFw
cGxpZWQgdG8gMjAyNi4wOC54LiBUaGFua3MKCj4gLS0tCj4gIHBhY2thZ2UvZmNmdC9mY2Z0Lmhh
c2ggfCAyICstCj4gIHBhY2thZ2UvZmNmdC9mY2Z0Lm1rICAgfCAzICstLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9mY2Z0L2ZjZnQuaGFzaCBiL3BhY2thZ2UvZmNmdC9mY2Z0Lmhhc2gKPiBpbmRleCBm
NWE0OTllZGNjLi4wYTRjNjMzZjI0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZmNmdC9mY2Z0Lmhh
c2gKPiArKysgYi9wYWNrYWdlL2ZjZnQvZmNmdC5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gICMg
TG9jYWxseSBjb21wdXRlZAo+IC1zaGEyNTYgIDc5ZTUyYWFhZmMwYjU3ZmEyYjY4ZWQ2MTI3ZGUx
M2U5ODMxODA1MDM5OWE5Mzk2OTFiOGNhMzBkNDRkNDg1OTEgIDMuMy4yLnRhci5nego+ICtzaGEy
NTYgIDhkZmZlNzUwMDI3NjE4ZTAxZGQ0ZTZiYzlhYTljODg5MDMzYzdhYmU0YTY2MWU5Mjk0MTky
YjU4YjQ1NTYyNjQgIGZjZnQtMy4zLjIudGFyLmd6Cj4gIHNoYTI1NiAgZDUzNGEyM2EzMTUwMGEw
YWM5NThkOTYzNGI4NGY1MzJiZDczZmYxYWNhMWJiOGY3ZGViYmNiZWJjMTZmZjM5YSAgTElDRU5T
RQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2ZjZnQvZmNmdC5tayBiL3BhY2thZ2UvZmNmdC9mY2Z0
Lm1rCj4gaW5kZXggYjljZTQzYjQ1NC4uNDBiMmQ0NWE4ZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L2ZjZnQvZmNmdC5tawo+ICsrKyBiL3BhY2thZ2UvZmNmdC9mY2Z0Lm1rCj4gQEAgLTUsOCArNSw3
IEBACj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+ICBGQ0ZUX1ZFUlNJT04gPSAzLjMu
Mgo+IC1GQ0ZUX1NPVVJDRSA9ICQoRkNGVF9WRVJTSU9OKS50YXIuZ3oKPiAtRkNGVF9TSVRFID0g
aHR0cHM6Ly9jb2RlYmVyZy5vcmcvZG5rbC9mY2Z0L2FyY2hpdmUKPiArRkNGVF9TSVRFID0gaHR0
cHM6Ly9jb2RlYmVyZy5vcmcvZG5rbC9mY2Z0L3JlbGVhc2VzL2Rvd25sb2FkLyQoRkNGVF9WRVJT
SU9OKQo+ICBGQ0ZUX0xJQ0VOU0UgPSBNSVQKPiAgRkNGVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5T
RQo+ICBGQ0ZUX0lOU1RBTExfU1RBR0lORyA9IFlFUwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
