Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E68DE9537E
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 11:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9E8140B1F;
	Wed,  4 Feb 2026 11:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mTqFOI-iQPQ; Wed,  4 Feb 2026 11:07:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE32440B46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770203234;
	bh=IkPoh2Q2J2Q9twNn1ebJ66yX0ED3W3ZV7cFZ70Lll2s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c2HBeZaBFgQEDGFn+22Oexuzrh2wJeJYP+u/B7BO7ETmg+wo08j4Zp6IxUf9zBv92
	 YPig4MegsD5b5bw95UKQm2CfkXn2eLGBdNkMjZvEc3iLc17wifYLyz405UQkGMPFds
	 5R2gqqHX4/intiGrF7ytgh8utlZxgTrasNDKOlrWvxOnKJtSld1zVHoFAnWm6VZ0KO
	 qjz56Q7PcjvTeeQ0idDZf7DSQHpChvUX8NRG8Na3/Fc6dl/zr0ku3oadlLAg1iJ/LW
	 qhO80FYNZl2tXqtQI63fOVrx2byDICKxms/Js0U3TAiQ8QMeFV73TpjnDUkZ48fI5O
	 0gqQ7zLQ+DgNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE32440B46;
	Wed,  4 Feb 2026 11:07:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04462F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E640160AA4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fo0tZxEmxSkI for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 11:07:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2F1360AA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2F1360AA0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2F1360AA0
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48068ed1eccso62284525e9.2
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 03:07:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770203231; x=1770808031;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eo9C6FU+wPYqmrnUbD12vQ/ahwrL5yPr/eI94CWwcIY=;
 b=Q/GQ9f7RRq5kZamU0nXdpfgh/p7uAGWWKv+En4RJKxJ1LdyBaDzKrRTCinV3CyfSez
 g4LEIpZtKAO4+a8qB2qLPgMkmWBF+12x6UuOK/tFvoW2XSTx6F8eUi5UVZ8LR7DZ9Kps
 7Z1HEaVbrHS4Q/GaWH/yhSdPyEjRBUiePhm/OwaE3INrU/TlH0HyvKTsiQ0V/Ju6RXhA
 HU1dAyTayaurbeZYnYDLrPuEwkd2ow8QXAP0ARfFqc/+4absNzioUXVXe3aLt6EXMmaW
 PthytL+0gU3tRAAQUNkvA1ABK7/cSq2qzD9kvslHBg6NTTWhsrGP8WK+flPSx4vuUoGN
 iH1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm+FjRMVZCI3PRLlgyLFBHlnldCbq99c0GNvKaJKuOOOKz5+Pv/GNmR5ebUU1FKW21U7N3NG5U3VU=@buildroot.org
X-Gm-Message-State: AOJu0YyOzMm4PQfREzrERkESW//CrSVCXJdzkyS5yLLnKOKKwXFReLLE
 ro3UKeNjd7KJa6poKfPxGbf/TRv+1jKglnqiK4+AuNdzuEFuB2xYwuTvQV250KzTMAQ=
X-Gm-Gg: AZuq6aLUiAx60g4Ttx4V5pVfSOjn8AoTmJfL8lVDM7sNQ0QWOGoei2/Xr4jhzaslzUf
 y7H0nmI9CQEuHzR8l5nQ2ZdbzMoTSN7CyWiWHAysfiEmnCoDzCdO42JDY8xIJt4RJLliL6Z+lYo
 /PyPPjgz8EcydabVVzffqluSmFSGb531EhKuam6xI3MbxZZtN5VdQTWAica6u56s/ycpY+Dxu59
 gflEQNgTYQKbY4cZKD4nDVZeJL7zlWr+bHmzo2l9WGvLjsoInrW7SY69bfRGQczuQsx2D1t4Tp9
 oVt3uwM0nsVOg0w8L1qlT2IWIdRc68PC4x0MYsOTyTniZmi8UjT3x9vtbke5hJ6r5PJuPcTIVsP
 jcyn0u4hGCxhGbHkBVtYnsFzjHL2NAQ+4LW+riT5x5zxs4Am6l+6jCV1ELzROfPbJVBciaNwgH9
 0GQp3krfwST8dtAxIiRQXLFxgXQAoXtawzZ0b+QoeMDyYGxGHSwcXW
X-Received: by 2002:a05:600c:1394:b0:46e:35a0:3587 with SMTP id
 5b1f17b1804b1-4830e98a9e3mr37719155e9.27.1770203230745; 
 Wed, 04 Feb 2026 03:07:10 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436180647aasm5135010f8f.41.2026.02.04.03.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 03:07:09 -0800 (PST)
Message-ID: <a07d3fbf-0fc2-45b2-a211-bd2d89222502@smile.fr>
Date: Wed, 4 Feb 2026 12:07:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jamie Gibbons <jamie.gibbons@microchip.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Cyril Jean <cyril.jean@microchip.com>
References: <20260113112621.347651-1-jamie.gibbons@microchip.com>
Content-Language: fr
In-Reply-To: <20260113112621.347651-1-jamie.gibbons@microchip.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770203231; x=1770808031; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eo9C6FU+wPYqmrnUbD12vQ/ahwrL5yPr/eI94CWwcIY=;
 b=tsQrcSPZDkHAaBDCSda51i4LwQI3VqNF95Fex6K6Tswfs+FAFruJ9d7uTyxul1ACg0
 HRAdm38CxBC2fY46CdvgfR+nTbx1C4JvjzX65FVHFoRverA+GPF4JcEoKYqe2hvHCbwG
 0ogfK5XpJg+9sDgE3vxLfVckYuX3SU1nICcMk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=tsQrcSPZ
Subject: Re: [Buildroot] [PATCH 0/5] Bump MPFS Components
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

SGVsbG8gSmFtaWUsIEFsbCwKCkxlIDEzLzAxLzIwMjYgw6AgMTI6MjYsIEphbWllIEdpYmJvbnMg
dmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IEhpIGFsbCwKPiAKPiBUaGUgZm9sbG93aW5nIHNl
cmllcyBidW1wcyBVLUJvb3QgYW5kIExpbnV4IGNvbXBvbmVudHMgZm9yIHRoZSBCZWFnbGVWIEZp
cmUgYW5kCj4gTWljcm9jaGlwJ3MgTVBGUyBJY2ljbGUga2l0LCBtYWludGFpbmluZyB0aGVpciBy
ZWxldmFudCBoYXNoIGZpbGVzLiBUaGUgc2VyaWVzCj4gYWxzbyBpbmNsdWRlcyBhIG9uZSBsaW5l
IHJlbW92YWwgZnJvbSB0aGUgQmVhZ2xlViBGaXJlIFUtQm9vdCBib290IHNjcmlwdCB0bwo+IHJl
bW92ZSBhIHJlZHVuZGFudCBjb21tYW5kLiBGb3IgbW9yZSBpbmZvcm1hdGlvbiBvbiB0aGVzZSBj
aGFuZ2VzIHBsZWFzZSBzZWUKPiBpbmRpdmlkdWFsIHBhdGNoZXMsIGhvd2V2ZXIgdGhlc2UgYXJl
IGFsbCBzdHJhaWdodCBmb3J3YXJkIGNoYW5nZXMuCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtz
LgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFRoYW5rcywKPiBKYW1pZQo+IAo+IEphbWll
IEdpYmJvbnMgKDUpOgo+ICAgY29uZmlncy9taWNyb2NoaXBfbXBmc19pY2ljbGU6IEJ1bXAgVS1C
b290Cj4gICBjb25maWdzL21pY3JvY2hpcF9tcGZzX2ljaWNsZTogQnVtcCBMaW51eAo+ICAgY29u
Zmlncy9iZWFnbGV2X2ZpcmU6IEJ1bXAgVS1Cb290Cj4gICBjb25maWdzL2JlYWdsZXZfZmlyZTog
QnVtcCBMaW51eAo+ICAgYmVhZ2xldl9maXJlOiByZW1vdmUgZmR0IHNldCBmcm9tIGJvb3Qgc2Ny
aXB0Cj4gCj4gIGJvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZS9ib290LmNtZCAgICAgICAg
ICAgICAgICAgfCAxIC0KPiAgYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL3BhdGNoZXMv
bGludXgvbGludXguaGFzaCB8IDIgKy0KPiAgYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJl
L3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaCB8IDIgKy0KPiAgYm9hcmQvbWljcm9jaGlwL21wZnNf
aWNpY2xlL3BhdGNoZXMvbGludXgvbGludXguaGFzaCAgICB8IDIgKy0KPiAgYm9hcmQvbWljcm9j
aGlwL21wZnNfaWNpY2xlL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaCAgICB8IDIgKy0KPiAgY29u
Zmlncy9iZWFnbGV2X2ZpcmVfZGVmY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYg
KysrLS0tCj4gIGNvbmZpZ3MvbWljcm9jaGlwX21wZnNfaWNpY2xlX2RlZmNvbmZpZyAgICAgICAg
ICAgICAgICAgfCA0ICsrLS0KPiAgNyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
