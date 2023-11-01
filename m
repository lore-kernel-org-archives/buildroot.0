Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61862C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 02:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06B2E457F9;
	Wed,  1 Nov 2023 02:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06B2E457F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 65UVkL_Mi1kk; Wed,  1 Nov 2023 02:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B23484595C;
	Wed,  1 Nov 2023 02:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B23484595C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFB951BF277
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 02:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5B6A83934
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 02:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5B6A83934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUGSO8bAWBjt for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 02:26:23 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5A8D82B21
 for <buildroot@busybox.net>; Wed,  1 Nov 2023 02:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5A8D82B21
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c50cd16f3bso86753441fa.2
 for <buildroot@busybox.net>; Tue, 31 Oct 2023 19:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698805580; x=1699410380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8bEMJ5jR7bY+WAZKIL7ZMq2z/Tdx6JLtogACNDF8dGI=;
 b=Y1nYDuOzpcTRcOP8KeKemeQF0y2vmj+6pnv0qhidIrT5aRBEOzAK6wBd7K3qZkVdsV
 /ci2zNLi7hgwOi0fsRECkWu32AJ7GgNAkYvKWIP8d3u4ACBZ6Y6wVUpRcpVWz++y6HPe
 ft+mpev2csJwuW7y8lUMmU+L5v5wVSH6PRwuaNkxH1ZkgcbgCYe+pjgCo0Dd0GbDFiBG
 KNIdleCRJOSPbUinfptRgut62zow7iDK3n5D1fkO5GuZ69QAfl+u/XrYAhGojZPSPUS6
 J8G4w5vsPvnr7JxAallcwFoo4Kr5svONxdyc54JeQ+Nsk6S0UHLHojnEd8iUOsib26KJ
 09Gg==
X-Gm-Message-State: AOJu0YyN/m6WV43KETE0OBybnQDLVqqc9BW+Ysqea6TxVj+hNXO9XLGx
 tjxJUN+K84BT7oovb1CffqbJdeSRbyoBZrCsWSw=
X-Google-Smtp-Source: AGHT+IGr9h9AYbOWanOxu4aGJmYWiuxr8nU+bL4cHcOcBb5Dw3PnoeFq/Cg9YDlpyf0J6PNGxaEqNMkQlkDgArrNTmU=
X-Received: by 2002:a2e:350e:0:b0:2c4:feef:84d with SMTP id
 z14-20020a2e350e000000b002c4feef084dmr12141214ljz.43.1698805580187; Tue, 31
 Oct 2023 19:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230308085047.126406-1-francois.perrad@gadz.org>
 <20230312095503.267aa7c8@windsurf>
In-Reply-To: <20230312095503.267aa7c8@windsurf>
From: Scott Fan <fancp2007@gmail.com>
Date: Wed, 1 Nov 2023 10:26:08 +0800
Message-ID: <CAFkzVZYh9kmNDoQOm4CMZhWuEeKFwxBd4mme==Kjjb=qf0JaRw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698805580; x=1699410380; darn=busybox.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8bEMJ5jR7bY+WAZKIL7ZMq2z/Tdx6JLtogACNDF8dGI=;
 b=DpyI3qjOK6KxbiUVdf7VlmaFfbTSIb0rsw/0Z303Z/uyMFGZM6w5forpBvEhn62P8a
 ng5+SP+DEL13021JAyLeIe3btLER7MOmgtzSajf9CDgQuvu/Z9dSPbhFgMxut1m1c366
 DqsAhNEAwMbMtQvszdQ8GfpHyV+DNBIi+oeUdsuZxcNkeNQvMqdwrgPpWbhFCl3Lz4QY
 DJKw7T7zQroZGYzdAbtmcM0V1ILcePq2gUogCQHexQXrr0p6mQ1xJ4yvetlJ7tpdOY+9
 el5IoBkDRusJWRN1Wo8kJLHYg4P/ugGgDmxl+Uj4f8SA6EDxBkhqBX7N4dWG/iL44wCx
 kiFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DpyI3qjO
Subject: Re: [Buildroot] [PATCH] package/htop: bump to version 3.2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net, Francois Perrad <fperrad@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGxlYXNlIGFwcGx5IHRoaXMgcGF0Y2ggdG8gMjAyMy4wMi54IExUUywgdGhhbmtzLgoKU2NvdHQg
RmFuCgpPbiBTdW4sIE1hciAxMiwgMjAyMyBhdCA0OjU14oCvUE0gVGhvbWFzIFBldGF6em9uaSB2
aWEgYnVpbGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQs
ICA4IE1hciAyMDIzIDA5OjUwOjQ3ICswMTAwCj4gRnJhbmNvaXMgUGVycmFkIDxmcGVycmFkQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJh
bmNvaXMucGVycmFkQGdhZHoub3JnPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9odG9wL2h0b3AuaGFz
aCB8IDQgKystLQo+ID4gIHBhY2thZ2UvaHRvcC9odG9wLm1rICAgfCAyICstCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBBcHBsaWVkIHRv
IG5leHQsIHRoYW5rcy4KPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBC
b290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHBzOi8v
Ym9vdGxpbi5jb20KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
