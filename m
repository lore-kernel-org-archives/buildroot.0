Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834E6C61DD3
	for <buildroot@archiver.kernel.org>; Thu,  3 Sep 2026 23:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E46308113B;
	Thu,  3 Sep 2026 23:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMs-z7Zgyf4n; Thu,  3 Sep 2026 23:25:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B19DA81136
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788477915;
	b=jTLlpV655mqJcOKg/hBdxRQfiUS57KdIlZlNFt0GsPd98bIxJS+9SPf9t7CfzQGoFbjP
	 FPpFgXMtq33vNFYTsR8AawcvzB4VQDzDUlEtwJSu7VutYPt5+d/MHsO2CsQvvntpqL/hU
	 RIeh49117y0xIxjSL0rBk/A+m1ZGqj9XTU0V7XyeCtXEqRpout0vTtehBd1vy4rVmE6W3
	 DOWIYgwCfskPr+oQXoD1NYvmjgNBToFeXj1o0tB3X07jvN1Otmf8y9TqBbg9fPOWaRns+
	 o4RH2f2/sVw7t06nOa5GVZVcfB9/5L5csq3kSvJe3Eg3YgEGpLpGTJ9VEJLkif5FQ5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788477915;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:Date:
	 Message-Id:From:To:X-Mailer:References:In-Reply-To:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g8etW1QCc8jXn2PAkk/6XV0TgkMCKLXz/sOR/jSiz40=;
	b=bF4pZHqJPr2OXFUV3rlWenWlL3GfJQaVUSjtJzr2XWcu7bTKBpm9fALzCXcphonm4MOZ
	 JXVBcY1n4HU0DPYqNgXlzlZyU9mWi0BtxEaIpW7t4ajJx4ObGws/y44hXWPduMPNu5YON
	 89fWy+CG08bHTrAbD1T7BdqnPo8SbvHWsyjfn8Boe0xnrZKID7GR6GHFggOk+ACWPkG5I
	 F6tx18ZWBNldt8hDKfhWURusqDQPCF9X5z1HJAdehLjFyhMf90rYWngtrSSbT6zTdFyxr
	 r4WS/HTOjw78fcWy8BPzJlkjpjg2Me7JRajPP/KI00V4ggVS79541QNNYokfeFWgG2Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OqWwvky+;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788477915;
	bh=g8etW1QCc8jXn2PAkk/6XV0TgkMCKLXz/sOR/jSiz40=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SWuUYhnbRguzetnAXM1RXBMGLl0PWWoWWSn/4e0Lj+Gk5mwQ5uZ42vSOXUkZQFMG3
	 FGQIgUtXEihcYgcf5uYTcXXzRCiDlZUOcmRDkirV12DvgNAtVenn8vppbBeYWfOLkn
	 zJ9jGbLTBIs+mwEg5VWILztM7/RRYjRR0yYkZrUR6a48hzvS1M1eoLFOC9KvZDPLP7
	 h9rK2SJD42B1bwdhS0iYqOv6k8xwwRwCmeGxNaEbs4PTmu37wUDc0n5/J3kOxMKH1k
	 QUUPyCEj8ckF8CeCYJtDabgsAobcYcJr46xLxWp9r98R9AdBNLdbSDc/hFltqNfJsJ
	 6FManzXgdN01g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B19DA81136;
	Thu,  3 Sep 2026 23:25:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A6E73DA
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 23:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FCFE81136
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 23:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V95JLpL2Z90L for <buildroot@buildroot.org>;
 Thu,  3 Sep 2026 23:25:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E5B7D81134
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788477912;
 b=R/JT3EAKHWgWmMK9wHt/A8PeH/ESOrCzJ0fU2Smo9R2UBiwxsyFwFE1+E28rSfhcyuod
 xuw7KNU5Pdz1g78Z+Ii60T85dxoyd3wU74AudvRpHx06RXOMMLBIfkEP42q548eazYXU5
 adp42MNvzqQLjnkQZgZexy7X2Sg7pdte3nE9ageiXF6/QUB8k0zMl/FokFfUSr3PWVCi2
 IM9M8FRlUy6WClI5hMWTvD0Thw/iKzH/7YO/oiEaKG8o9++n9YxkkLU6Fx69HykvFLhVt
 iD6wDVmCdqvUR8p8DoluX8q71horu3PX9zm3EIngVs2Va/uPXf2SUfxUGNtmk/FT8aA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788477912;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
 Subject:From:To:X-Mailer:References:In-Reply-To;
 bh=IDmBPJg7wtL3KkphM2btaDjx1vu/QhszQF3h2j7Uwj0=;
 b=tbqKugmMGa6wY04dIu079yc/UiyFND+xmHEPv1R33lkzY4ykUQpwt6cg4gX7e0BJWv8u
 prjOM9Ew/D7rMVHzctxCfp8/OO0eo0moPposPvvZpbfuaZyWEIOTa51mNqQo9TDT8H5zE
 JHJ0cpHrBaCcFsWnw51G4NnHovgKsi5iy8ML7WruD1VrAedyiD+hEEh1U5aYBvAmhmFYN
 4yRRsxtCqYV41ypQnijTxrAu8uwke67lNRuiKjL8XOMuVHFx0tAGLqtnbhUjWYFblkfCF
 Iw1X8QQ3+j+5Gcm4+lW1I7pt3HB1py3h/jD5SGGI5lh9GnU7Ojm9UQiW+MUlzsP25/Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=OqWwvky+; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fbstachura@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OqWwvky+
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5B7D81134
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 23:25:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49b8eeb3ff2so3866505e9.2
 for <buildroot@buildroot.org>; Thu, 03 Sep 2026 16:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788477909; x=1789082709; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:message-id:date:content-type
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IDmBPJg7wtL3KkphM2btaDjx1vu/QhszQF3h2j7Uwj0=;
 b=OqWwvky+MybnAv0zTTcu/kXXl7ASvm1Q92zBIpvVs8s3cYw3RNrFFMVf6kiC2vOAmq
 eSmDE4mHI5vACp82XyBHDYqjMFpqU63VE2me0eeoT+mXW2wh6hqpUKtLRQ/oTohXOKJ4
 3a5GcBhj7rMpRqWmUCk/ThN15EQ0EniG1qy+SoxJcEn2qdC6HT84Huel3wqiRqtlHB5u
 pb39ug7PH0h5HmqS8L4/QHn40Y5LAUdlhQ3j5WFIDSGP6tvu9JUzJAASRkkhRpzj70ne
 p3ybaUSFIddt8lKzAa/U83CyOGfVG7aA/kcBPcOtPGbORoPEYWuf8DISb7GA9mRGsb53
 lUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788477909; x=1789082709;
 h=in-reply-to:references:to:from:subject:message-id:date:content-type
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IDmBPJg7wtL3KkphM2btaDjx1vu/QhszQF3h2j7Uwj0=;
 b=DcDh8XVvwb92ckD1/sp2OqXWU/gaxivMYyPTD7y348dZZWgQggqQs3U1OWxdtb1KPr
 Sty6qDxiuErbV7vq+Zs1FPeI5YmMQgCbyAJepuDTY34RLFOBB7QSRH9uYQv9hJ4KpgMN
 3Vbbo7kK8T5vDURv82iGBmolVzaFY6YC8+l1TgpR40P1SOsVBsejG5XOR7Yuq/8GoU7D
 fH/+3Eb4/oGHA53tBkM6B7jfe+GRRIfMF9oavLubnN1bjBcfFU1saATQChf6SqpmldK2
 sgkq7tK0GhRI3Tirl36xF8rPT7H9PSQikDdJjhW/AD5+/jSJ/M9HqOYquUNRiORYp3yp
 AypQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzQ6nUAesfQkHobBwayf5QrB9C/2I7okWlrqb3b0vP7/psBquegV0eBppVQHdMtxuADvjRbfNFg5DY=@buildroot.org
X-Gm-Message-State: AFuF++nS11kIDAba0G7FDuafhG2RFvAPfmTi73S9Tg03TweKCEodYXWp
 C6++pUe+ppbEI3RWCOBesr73rf8FAfdqaGZsJ4ez1e6i1qzuZha0Nfo+
X-Gm-Gg: AYBFou3DO3bynY721dp08RL0wIVNeUQsrLQWVH0xW2BJgmkeEV6zVA4YMNCeCCJwd0W
 s5ByQeo3LxcsWFu5inYFzcwQBVJuwbc5dz0I5DR2sT07fwcr+GKZ2NgD/+T0ppmEd8ipCh4/bPH
 TL3peG66ivZcB2qtwx2hlYIww+8hlbE4tc5lqJYtLMyyx7bkXgAVpNwriUh6mMJtu/3RhAU0zxN
 vB9L6gA23IYxM8zWtTysKZqjui45f21SacrhAVH9fY+WKh3m+Okbc4on63grhbXNBkjhJULat0d
 5CGqodfiQXZxDMC2/z48nE5KG5nxxK2L72ZBGOY950dIvzZ4oeuIktcfqmGDDI1ujUGhBQZiWOV
 wPEGPCSqzBbAXeXq3KCpTRGqE/Ks3/VdJm1GoI37CKHjCFcurJyZhksgz137qnXeT7zTDhNpS0j
 kRbSUxMuhaZ6jtVnHbz8pouYNHPQOPeM0lDx+HYDb+456m9c8aY28luqFXaSOgw8bYQcbcU1fsn
 xfPMj0XZH9pR2ESqt0D3QJfd+Li7EplqcdCtxWPoCiWtg4861S1p0FXDQfxi1jPIcXdPbaJB3pl
 wRpAF1k85d2oRaCPCglrgcOuEw==
X-Received: by 2002:a5d:5e90:0:b0:485:8a47:5b90 with SMTP id
 ffacd0b85a97d-4858a475da2mr403638f8f.45.1788477908726; 
 Thu, 03 Sep 2026 16:25:08 -0700 (PDT)
Received: from localhost (aki234.neoplus.adsl.tpnet.pl. [83.26.12.234])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48588391debsm1838048f8f.9.2026.09.03.16.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 16:25:07 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 04 Sep 2026 01:25:06 +0200
Message-Id: <DL62I7P5Y2OM.1U09OJM0MHEZG@gmail.com>
From: "Franciszek Stachura" <fbstachura@gmail.com>
To: "Fiona Klute" <fiona.klute@gmx.de>, "Franciszek Stachura"
 <fbstachura@gmail.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <67aace92.170a0220.17b7b.ae2e@mx.google.com>
 <0804bdd2-df22-4a8a-9a2d-1638db25901f@gmx.de>
 <DL2K0GFIKUAT.T9UIOAD9WKI8@gmail.com>
 <023a4808-11e7-4df8-b3dd-5ea9ea351381@gmx.de>
In-Reply-To: <023a4808-11e7-4df8-b3dd-5ea9ea351381@gmx.de>
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2025-02-10
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

SGVsbG8gRmlvbmEsCgpPbiBGcmkgU2VwIDQsIDIwMjYgYXQgMTI6MjcgQU0gQ0VTVCwgRmlvbmEg
S2x1dGUgd3JvdGU6Cj4gSGkgRnJhbmVrLAo+Cj4gdGhhbmtzIGZvciBsb29raW5nIGludG8gdGhp
cyEKPgo+IEFtIDMwLjA4LjI2IHVtIDIyOjE3IHNjaHJpZWIgRnJhbmNpc3playBTdGFjaHVyYToK
Pj4gSGVsbG8gRmlvbmEsIGV2ZXJ5b25lLAo+PiAKPj4gT24gVGh1IEZlYiAxMywgMjAyNSBhdCA2
OjAzIFBNIENFVCwgRmlvbmEgS2x1dGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4+IEhpIGV2ZXJ5
b25lIQo+Pj4KPj4+IEFtIDExLjAyLjI1IHVtIDA1OjE0IHNjaHJpZWIgQnVpbGRyb290IE5vdGlm
aWNhdGlvbnM6Cj4+Pj4gSGVsbG8sCj4+Pj4KPj4+PiBBdXRvYnVpbGQgc3RhdGlzdGljcyBmb3Ig
MjAyNS0wMi0xMAo+Pj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4+Pj4K
Pj4+PiAgICAgICAgIGJyYW5jaCB8ICBPSyB8IE5PSyB8IFRJTSB8IFRPVCB8Cj4+Pj4gICAgIDIw
MjQuMDIueCAgfCAgMiAgfCAgNCAgfCAgMCAgfCAgNiAgfAo+Pj4+ICAgICAyMDI0LjExLnggIHwg
IDMgIHwgIDQgIHwgIDAgIHwgIDcgIHwKPj4+PiAgICAgICBtYXN0ZXIgICB8IDE5ICB8IDIyNSB8
ICAwICB8IDI0NCB8Cj4+Pj4KPj4+PiBDbGFzc2lmaWNhdGlvbiBvZiBmYWlsdXJlcyBieSByZWFz
b24gZm9yIG1hc3Rlcgo+Pj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4+Pj4KPj4+PiAgICAgICAgICAgICAgICAgICBlbGZ1dGlscy0wLjE5MiB8IDIw
Cj4+Pj4gICAgIGdvYmplY3QtaW50cm9zcGVjdGlvbi0xLjgyLjAgfCAxMAo+Pj4KPj4+IFvigKZd
Cj4+Pgo+Pj4+ICAgICBwb3dlcnBjICAgIHwgIGdvYmplY3QtaW50cm9zcGVjdGlvbi0xLjgyLjAg
IHwgTk9LIHwgaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzQ2YTM2NTQ1
ZmUwYzFjNGM1ZmZiYTg5MjVlZmMxMzg2OGMzYzRiNmEgfCBPUlBICj4+Pj4gICAgICBzaDRhZWIg
ICAgfCAgZ29iamVjdC1pbnRyb3NwZWN0aW9uLTEuODIuMCAgfCBOT0sgfCBodHRwczovL2F1dG9i
dWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvODQyODQ0MGZlOGY4YmRjOWIxNzFlNTE1MjRhMjIz
OGI3M2FhYjQwMSB8IE9SUEgKPj4+PiAgICAgc3BhcmM2NCAgICB8ICBnb2JqZWN0LWludHJvc3Bl
Y3Rpb24tMS44Mi4wICB8IE5PSyB8IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVz
dWx0cy8xZTZiMzQ0NzU3Y2E5ZjdjYTc2ZDQ4MzRkMmVhMTYzMzYzYWU3MjI4IHwgT1JQSAo+Pj4+
ICAgICBhYXJjaDY0ICAgIHwgIGdvYmplY3QtaW50cm9zcGVjdGlvbi0xLjgyLjAgIHwgTk9LIHwg
aHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2JiYjc5YjBhYmI3NWE0YTEz
YmNjM2E3NjAxZGVkMzkyODliZWU5NWMgfCBPUlBICj4+Pj4gICAgIHNwYXJjNjQgICAgfCAgZ29i
amVjdC1pbnRyb3NwZWN0aW9uLTEuODIuMCAgfCBOT0sgfCBodHRwczovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvMWEwNTE5MjJhOTA2NTBlOTM5ZTNjNGI2OWE4ZTY2ZTY1MTBiMTIy
MyB8IE9SUEgKPj4+PiAgICAgc3BhcmM2NCAgICB8ICBnb2JqZWN0LWludHJvc3BlY3Rpb24tMS44
Mi4wICB8IE5PSyB8IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8yNmY3
NzUzNGQ0OGJmOTY4OGI2NDZmODBlYWQ5NWIwMDNmNjhlMDZjIHwgT1JQSAo+Pj4+ICAgICBwb3dl
cnBjICAgIHwgIGdvYmplY3QtaW50cm9zcGVjdGlvbi0xLjgyLjAgIHwgTk9LIHwgaHR0cHM6Ly9h
dXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzRiNDhkNzYyYmRlYmFhMTIyOWRhZjAwMzA3
MDM5ZGI5ZDQ4NmUwOTEgfCBPUlBICj4+Pj4gICAgIHNwYXJjNjQgICAgfCAgZ29iamVjdC1pbnRy
b3NwZWN0aW9uLTEuODIuMCAgfCBOT0sgfCBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3Jn
L3Jlc3VsdHMvNzM4ZjA2ODA1M2Y4NTA2YTMxODBmNWJmMWVlYTU4NmUwYzIyNWE1MyB8IE9SUEgK
Pj4+PiAgICAgc3BhcmM2NCAgICB8ICBnb2JqZWN0LWludHJvc3BlY3Rpb24tMS44Mi4wICB8IE5P
SyB8IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy84YTQ4NWM3MTY5YmEy
YmY3M2QwNjkzYWFkZWFhMmQ1MWQyZWYwNzg3IHwgT1JQSAo+Pj4+ICAgICAgIGk2ODYgICAgIHwg
IGdvYmplY3QtaW50cm9zcGVjdGlvbi0xLjgyLjAgIHwgTk9LIHwgaHR0cHM6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm9yZy9yZXN1bHRzL2YyMGQ2MDRhYmEyYjdmYmNmY2ZmNDE5ZjQ3Yjc3ZTNjYTI0
OWExNzkgfCBPUlBICj4+PiBBbG1vc3QgYWxsIG9mIHRoZXNlIChvbmUgSSdtIG5vdCBzdXJlKSBh
cmUgUWVtdSBicmVha2luZywgd2l0aAo+Pj4gU2VnZmF1bHQvSWxsZWdhbCBJbnN0cnVjdGlvbi9B
Ym9ydCBpbiBnLWlyLXNjYW5uZXItcWVtdXdyYXBwZXIuIEl0J3Mgbm90Cj4+PiBvYnZpb3VzIHRv
IG1lICp3aHkqLCBidXQgImlsbGVnYWwgaW5zdHJ1Y3Rpb24iIGxvb2tzIGxpa2UgYXQgbGVhc3Qg
cGFydAo+Pj4gb2YgdGhlIGlzc3VlIGlzIGEgbWlzbWF0Y2ggYmV0d2VlbiB0YXJnZXQgQ1BVIHZl
cnNpb24gYW5kIHRoZSBDUFUKPj4+IGVtdWxhdGVkIGJ5IFFFTVUuCj4+Pgo+Pj4gQlIyX1BBQ0tB
R0VfSE9TVF9RRU1VX1VTRVJfTU9ERV9BUkdTIHdhcyBvcmlnaW5hbGx5IGFkZGVkIHRvIHNvbHZl
IHN1Y2gKPj4+IGlzc3VlcyAoc2VlIDcwYmFkNjFiNTNjNTA4MDFmYzkxNmY3ODE5NGMwYzRkZWQx
YmI2YjYgInBhY2thZ2UvcWVtdTogYWRkCj4+PiBCUjJfUEFDS0FHRV9IT1NUX1FFTVVfVVNFUl9N
T0RFX0FSR1Mgc3RyaW5nIikuIEJ1dCBleHBlcmltZW50aW5nIHdpdGgKPj4+IGVhY2ggZmFpbGlu
ZyBjb25maWcgdG8gc2VlIHdoYXQgQ1BVIG1pZ2h0IHdvcmsgc2VlbXMgbGlrZSBhIGxvdCBvZgo+
Pj4gdHJvdWJsZSwgSSB3b25kZXIgaWYgdGhlcmUncyBhIGJldHRlciB3YXkgdG8gZGVyaXZlIHRo
ZSBRRU1VIENQVSBmcm9tCj4+PiB0aGUgdGFyZ2V0Lgo+PiAKPj4gSSdtIG5vdCBzdXJlIGlmIHRo
aXMgaGFzbid0IGJlZW4gaW52ZXN0aWdhdGVkIGJlZm9yZSwgYnV0IEkgY291bGRuJ3QKPj4gZmlu
ZCBhbnkgb3RoZXIgcmVsZXZhbnQgZW1haWwgYWJvdXQgdGhpcyBvbiBsb3JlLgo+PiAKPj4gSXQg
c2VlbXMgdGhhdCBnb2JqZWN0LWludHJvc3BlY3Rpb24gZmFpbHVyZXMgb24gaTY4NiBoYXBwZW4g
YmVjYXVzZSBxZW11Cj4+IGRvZXMgbm90IHN1cHBvcnQgQVZYLTUxMiBbMV0uIEkgd2FzIG9ubHkg
YWJsZSB0byByZXByb2R1Y2UgdGhlIGZhaWx1cmVzCj4+IHdoZW4gbWljcm9hcmNoaXRlY3R1cmUg
dmVyc2lvbnMgd2l0aCBBVlgtNTEyIHN1cHBvcnQgd2VyZSBzZWxlY3RlZC4gRm9yCj4+IGV4YW1w
bGUsIG9uIGk2ODYvYnJvYWR3ZWxsIGdvYmplY3QtaW50cm9zcGVjdGlvbiBjb21waWxlcywgYnV0
IG9uCj4+IHNreWxha2UtYXZ4NTEyIGl0IGRvZXMgbm90Lgo+PiAKPj4gSSBtYW5hZ2VkIHRvIGZp
eCB0aGlzIGxvY2FsbHkgYnkgYWRkaW5nIGAtbW5vLWF2eDUxMmZgIHRvCj4+IExJQkdMSUIyX0JP
T1RTVFJBUF9DRkxBR1MgaW4gbGliZ2xpYjItYm9vdHN0cmFwLm1rLAo+PiBHT0JKRUNUX0lOVFJP
U1BFQ1RJT05fQ0ZMQUdTIGFuZAo+PiBDRkxBR1Mgb2YgR09CSkVDVF9JTlRST1NQRUNUSU9OX05J
TkpBX0VOVgo+PiBpbiBnb2JqZWN0LWludHJvc3BlY3Rpb24ubWsuCj4+IAo+PiBJIHdvbmRlciwg
d291bGQgYWRkaW5nIHRoaXMgZmxhZyBpbiB0aGVzZSBwYWNrYWdlcyBpZgo+PiBCUjJfWDg2X0NQ
VV9IQVNfQVZYNTEyPXkgYmUgYSBnb29kIGZpeD8KPgo+IFRoaXMgaXMgYSB0cmlja3kgcXVlc3Rp
b24uIElmIGl0IHdhcyBvbmx5IGdvYmplY3QtaW50cm9zcGVjdGlvbiBhbmQgCj4gbGliZ2xpYjIt
Ym9vdHN0cmFwIEknZCBzYXkgeWVzIChleGNlcHQgdG8gdXNlIHRoZSBtZXNvbiBfQ09ORl9FTlYg
Cj4gaW5zdGVhZCkuIFRoZSBsYXR0ZXIgbmV2ZXIgZW5kcyB1cCBvbiB0aGUgdGFyZ2V0IGFueXdh
eSwgYW5kIEdPSSAKPiBzaG91bGRuJ3QgYmUgYSBjcml0aWNhbCBydW50aW1lIHBhdGguIEJ1dCB5
b3UgbWVudGlvbiBQeXRob24gKHdoaWNoIAo+IHBvdGVudGlhbGx5IG1lYW5zIGl0cyBkZXBlbmRl
bmNpZXMsIGRlcGVuZGluZyBvbiBjb2RlIHBhdGhzIHRha2VuKSAKPiBiZWxvdywgd2hpY2ggbWFr
ZXMgc2Vuc2U6IHBhcnQgb2YgZ2lzY2FubmVyIGlzIGEgY29tcGlsZWQgUHl0aG9uIG1vZHVsZS4K
Pgo+IEkgZ3Vlc3MgaWYgeW91IHdhbnQgYSBidWlsZCB3aXRoIEdPSSwgcG9zc2libHkgZGVncmFk
ZWQgcGVyZm9ybWFuY2UgaXMgCj4gYmV0dGVyIHRoYW4gYnVpbGQgZmFpbHVyZS4gSSdtIG5vdCBz
dXJlIGlmIHRoZXJlJ3MgYSByZWFzb25hYmxlIHdheSB0byAKPiBub3RpZnkgcGVvcGxlIHdpdGgg
dGhhdCBidWlsZCBjb21iaW5hdGlvbi4KCkkgYWN0dWFsbHkgZGlkbid0IGFkZCAtbW5vLWF2eDUx
MmYgdG8gUHl0aG9uIGl0c2VsZiwgYnV0IGl0IG1ha2VzIHNlbnNlLAp0aGF0IGlzIHJlcXVpcmVk
IGZvciBhIHByb3BlciBmaXguIEFub3RoZXIgcHJvYmxlbSBhcmUgYWxsIHRoZSBvdGhlcgpwYWNr
YWdlcyB0aGF0IGRlcGVuZCBvbiBnb2JqZWN0LWludHJvc3BlY3Rpb24uIEkgbGF0ZXIgdHJpZWQg
dG8gYnVpbGQKc29tZSByYW5kb20gcGFja2FnZXMgdGhhdCBkZXBlbmQgb24gZ2kgYW5kLCBmb3Ig
ZXhhbXBsZSwgYXQtc3BpMgpkaWQgbm90IGJ1aWxkLgoKQmVzdCByZWdhcmRzLApGcmFuZWsgU3Rh
Y2h1cmEKCj4gT2YgY291cnNlIHRoZSByZWFsbHkgbmljZSBmaXggd291bGQgYmUgdG8gbWFrZSB0
aGUgZ2lyLXRvb2xzIHdvcmsgCj4gd2l0aG91dCBxZW11LCBidXQgdGhhdCdzIGFub3RoZXIgY2Fu
IG9mIHdvcm1zLiA6RAo+Cj4gT3BpbmlvbnMsIGFueW9uZT8KPgo+IEJlc3QgcmVnYXJkcywKPiBG
aW9uYQo+Cj4+ID09PT09PT09Cj4+IAo+PiBEZXRhaWxzOgo+PiAKPj4gZ29iamVjdC1pbnRyb3Nw
ZWN0aW9uIGhhcyB0byBiZSBidWlsdCB3aXRoIEdJX1NDQU5ORVJfREVCVUc9c2F2ZS10ZW1wcy4K
Pj4gSW4gb3V0cHV0L2J1aWxkL2dvYmplY3QtaW50cm9zcGVjdGlvbi0xLjg2LjAvYnVpbGRyb290
LWJ1aWxkL3RtcC1pbnRyb3NwZWN0Pz8/Pz8/Pz8KPj4gdGhlcmUgc2hvdWxkIGJlIGFuIGV4ZWN1
dGFibGUgY2FsbGVkIEdMaWItMi4wLgo+PiBJdCBsaW5rcyB3aXRoIGxpYmdvYmplY3QtMi4wLnNv
LjAsIGl0IHdpbGwgY3Jhc2ggd2l0aAo+PiAtLWludHJvc3BlY3QtZHVtcD0kKERJUl9XSVRIX0VY
RUNVVEFCTEUpL2Z1bmN0aW9ucy50eHQsYQo+PiAKPj4gUnVubmluZyBpdCBpbiBnZGIgcmV2ZWFs
cyB0aGF0IGl0IGNyYXNoZXMgaW4gY2xvc3VyZV9yZWZfaW50ZXJuYWwgKHBhcnQKPj4gb2YgbGli
Z29iamVjdC0yLjApIG9uIGluc3RydWN0aW9uIHZtb3ZkcXU4LCBlbmNvZGVkIGFzCj4+ICI2MiBm
MSA3ZiAwOCA3ZiA4NSBlNCBmZiBmZiBmZiIuIEkgYmVsaWV2ZSB0aGF0IHRoaXMgaXMgdGhlIEVW
RVgKPj4gZW5jb2RpbmcsIHdoaWNoIGlzIHVzZWQgZm9yIEFWWC01MTIgWzJdLgo+PiAKPj4gQVZY
LTUxMiBpbnN0cnVjdGlvbnMgYWxzbyBjYXVzZSBpc3N1ZXMgaWYgdGhleSBhcHBlYXIgaW4gdGhl
IGV4ZWN1dGFibGUKPj4gaXRzZWxmLCBpbiBnLWlyLWNvbXBpbGVyLCBhbmQgSSB0aGluayBhbHNv
IGluIHRoZSBQeXRob24gbmF0aXZlIGxpYnJhcnksCj4+IHRoYXQncyB3aHkgSSBoYWQgdG8gYWRk
IHRoZSBmbGFnIGluIHRocmVlIGRpZmZlcmVudCBwbGFjZXMuCj4+IAo+PiBBcHBhcmVudGx5IEFW
WC01MTIgaXMgc3VwcG9ydGVkIGluIDMyLWJpdCwgd2l0aCBzb21lIGxpbWl0YXRpb25zLi4uIFsz
XQo+PiAKPj4geDg2XzY0IGNyYXNoZXMgbWF5IGhhdmUgYSBzaW1pbGFyIGNhdXNlLCBJIGRpZG4n
dCBjaGVjay4KPj4gCj4+ID09PT09PT09Cj4+IAo+PiBbMV0gSSBkbyBub3QgaGF2ZSBhIHZlcnkg
Z29vZCBzb3VyY2UgZm9yIHRoYXQsIGJ1dCBxZW11IHdpdGggZm9yIGV4YW1wbGUKPj4gYC1jcHUg
U2FwcGhpcmVSYXBpZHMtdjNgIHByaW50cyBhIGxvdCBvZiB3YXJuaW5ncyBsaWtlOgo+PiAKPj4g
cWVtdS1pMzg2OiB3YXJuaW5nOiBUQ0cgZG9lc24ndCBzdXBwb3J0IHJlcXVlc3RlZCBmZWF0dXJl
OiBDUFVJRC4wN0g6RUJYLmF2eDUxMmYgW2JpdCAxNl0KPj4gcWVtdS1pMzg2OiB3YXJuaW5nOiBU
Q0cgZG9lc24ndCBzdXBwb3J0IHJlcXVlc3RlZCBmZWF0dXJlOiBDUFVJRC4wN0g6RUJYLmF2eDUx
MmRxIFtiaXQgMTddCj4+IHFlbXUtaTM4Njogd2FybmluZzogVENHIGRvZXNuJ3Qgc3VwcG9ydCBy
ZXF1ZXN0ZWQgZmVhdHVyZTogQ1BVSUQuMDdIOkVCWC5hdng1MTJpZm1hIFtiaXQgMjFdCj4+IHFl
bXUtaTM4Njogd2FybmluZzogVENHIGRvZXNuJ3Qgc3VwcG9ydCByZXF1ZXN0ZWQgZmVhdHVyZTog
Q1BVSUQuMDdIOkVCWC5hdng1MTJjZCBbYml0IDI4XQo+PiBxZW11LWkzODY6IHdhcm5pbmc6IFRD
RyBkb2Vzbid0IHN1cHBvcnQgcmVxdWVzdGVkIGZlYXR1cmU6IENQVUlELjA3SDpFQlguYXZ4NTEy
YncgW2JpdCAzMF0KPj4gcWVtdS1pMzg2OiB3YXJuaW5nOiBUQ0cgZG9lc24ndCBzdXBwb3J0IHJl
cXVlc3RlZCBmZWF0dXJlOiBDUFVJRC4wN0g6RUJYLmF2eDUxMnZsIFtiaXQgMzFdCj4+IHFlbXUt
aTM4Njogd2FybmluZzogVENHIGRvZXNuJ3Qgc3VwcG9ydCByZXF1ZXN0ZWQgZmVhdHVyZTogQ1BV
SUQuMDdIOkVDWC5hdng1MTJ2Ym1pIFtiaXQgMV0KPj4gcWVtdS1pMzg2OiB3YXJuaW5nOiBUQ0cg
ZG9lc24ndCBzdXBwb3J0IHJlcXVlc3RlZCBmZWF0dXJlOiBDUFVJRC4wN0g6RUNYLmF2eDUxMnZi
bWkyIFtiaXQgNl0KPj4gCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvODd5
MW14bnZsby5mc2ZAbGluYXJvLm9yZy8KPj4gCj4+IDMgeWVhcnMgYWdvOgo+Pj4gSSBkb24ndCB0
aGluayB0aGVyZSBpcyBjdXJyZW50bHkgYW55IGFjdGl2ZSBlZmZvcnQgdG8gYWRkIEFWWDUxMgo+
Pj4gc3VwcG9ydC4gVGhlcmUgaGF2ZSBiZWVuIHZhcmlvdXMgR1NvQyBwcm9qZWN0cyB0byBpbXBy
b3ZlIHRoZSB4ODYgU0lNRAo+Pj4gZW11bGF0aW9uIGJ1dCBJIGRvbid0IHRoaW5rIHRoZXkgZ290
IG1lcmdlZC4KPj4gCj4+IFsyXSBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9FVkVYX3By
ZWZpeAo+PiAKPj4gWzNdIEkgZGlkIG5vdCBmaW5kIGFueXRoaW5nIGluIEludGVsIG1hbnVhbHMK
Pj4gCj4+IGh0dHBzOi8vZ28uZGV2L3dpa2kvQVZYNTEyI25ldy1yZWdpc3RlcnMKPj4+IEVWRVgt
ZW5hYmxlZCBpbnN0cnVjdGlvbnMgY2FuIGFjY2VzcyBhZGRpdGlvbmFsIDE2IFggKDEyOC1iaXQg
eG1tKSBhbmQKPj4+IFkgKDI1Ni1iaXQgeW1tKSByZWdpc3RlcnMsIHBsdXMgMzIgbmV3IFogKDUx
Mi1iaXQgem1tKSByZWdpc3RlcnMgaW4KPj4+IDY0LWJpdCBtb2RlLiAzMi1iaXQgbW9kZSBvbmx5
IGdldHMgWjAtWjcuCj4+IAo+Pj4gQmVzdCByZWdhcmRzLAo+Pj4gRmlvbmEKPj4gCj4+IEJlc3Qg
cmVnYXJkcywKPj4gRnJhbmVrIFN0YWNodXJhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
