Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78A4C021B8
	for <buildroot@archiver.kernel.org>; Tue,  4 Mar 2025 13:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72C0F40C79;
	Tue,  4 Mar 2025 13:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xc9QKWGJH3mY; Tue,  4 Mar 2025 13:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4640A40C85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4640A40C85;
	Tue,  4 Mar 2025 13:28:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A4347D2
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 13:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86CC940AE3
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 13:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AI9wPBES0tAq for <buildroot@buildroot.org>;
 Tue,  4 Mar 2025 13:28:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5EF4440A47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EF4440A47
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EF4440A47
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 13:28:05 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22356471820so89190905ad.0
 for <buildroot@buildroot.org>; Tue, 04 Mar 2025 05:28:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741094884; x=1741699684;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NhxEoVjBpIQQboDVI1AO5Xb6Lj5gpPeQtlUzPTapZ+k=;
 b=exngWdj1hSlO2wWtCf/zpY/Z5DgKASmtROpuptxOAoALc1UCTU6hxkIm/YroGMTObj
 Qr7T2SVmRuTWVNg0VL6zWYNwpgL7pvGdzipFkToIgWPKLu30zLaVfCHkJS0Tcehyu4pA
 3eqKODT1pHUF0dp0Dy8Pa6Smh8maoTVzlCJHHvbTVf4eJpftvAjomWgQ299AFv6LFHU1
 fm6/yfiMLdUIxPdy6eJKQ881VuV0KbWiJjkiLEvVtKOMWp9rr/o+HLlw7aePIM66pT/x
 pphnNznUZ7B1CGx77s3aSonNArKjEelQ/lDQc9H1GScoxZsJeTvc+8sd1m2w/XoIpcFd
 is9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLG6h286pd9m5HgTa80vInaNxpGrwC4+zqROQzEBde2TdGXHfdIkDiA5Ry7uFcIA0E8AO9jCHs36Y=@buildroot.org
X-Gm-Message-State: AOJu0Yy5zrxIlRIzKCO0tjJdC1QfXyaRs1keuVt1kP14HyBAdHPsbRNk
 k4RlTAHKTZkQsbXiFmXb7+C3sHPsHtvghCdpotc+qA+bTj/pY4TI
X-Gm-Gg: ASbGnctMdDVN/cfnUJM/kF6SgcRQJ2ropvdbVw5YpAqOUoSciXPWmnob++KgeIYhFCf
 2ns02rGQwGXGBL8ppT9haDDQD1O1ZAhzBTd/3CHbAmWCYcLt5AiFpqeQaQV2Rg+w3L+XLKUkRZS
 xwRmGLTeC53Dk2kh82TA0tNBZMIVqjPB4MuoX72XO7xNPA3EtoL+vWZ1y18l22CTHiGUAc8kHKe
 RgpjJJ2L7Cll7sYiWNl89u4d/1Pyz26o1bICju+L6B958tXhPli+EtxvsL4YTt/nmS/HfzRFUCK
 hRdw8x3KHl3UDDOLIQQ5TvsQJfQ6cdtODdX1aEzUjr2YTB+ZHMB4ZeMEdhfsDN1A+flkqJEW7qp
 4fBbxDEShHunnTdM3bw==
X-Google-Smtp-Source: AGHT+IFBhuLTyX2N4o6iRnJp4CrNKLpMAkqzMP1zX141OQil3qI4BV935zf3vmvcHRZ+xgTiKJxT8A==
X-Received: by 2002:a05:6a00:188a:b0:730:7499:4043 with SMTP id
 d2e1a72fcca58-734abee5219mr26311851b3a.0.1741094883812; 
 Tue, 04 Mar 2025 05:28:03 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:ba1:6179:d6b3:e95:8cc9?
 ([2600:8802:b00:ba1:6179:d6b3:e95:8cc9])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-734a0040084sm10833036b3a.121.2025.03.04.05.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 05:28:02 -0800 (PST)
Message-ID: <0c66ba0f-9efa-4cc0-8a36-71b54e25979e@gmail.com>
Date: Tue, 4 Mar 2025 05:28:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org, Markus Mayer <mmayer@broadcom.com>
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Alexander Egorenkov <egorenar-dev@posteo.net>, Bernd Kuhls
 <bernd@kuhls.net>, Julien Olivain <ju.o@free.fr>,
 Laurent Vivier <laurent@vivier.eu>, "Wojciech M. Zabolotny"
 <wzab01@gmail.com>, Francis Laniel <flaniel@linux.microsoft.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Qais Yousef <qais.yousef@arm.com>
References: <20250303155310.513886-1-alex.bennee@linaro.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20250303155310.513886-1-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741094884; x=1741699684; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NhxEoVjBpIQQboDVI1AO5Xb6Lj5gpPeQtlUzPTapZ+k=;
 b=EoGt+099oWyF6VdLSoIR+I3plcglaSOy222WOZuTFJimG0O2/MXeX4M5wXi2zabyGw
 IgHPtBekrmDZEfZteKFlMHF4Gr5ZEzi6empJd1XB7sBm1tXJZBsMsFbx4JUADgfi6zO8
 lBQHW4//QpoGBGwLxSVvJP/xSBsmX+ZjJOI8EZwP0883X2azFbsNlCk3/u3sNk6OvwyE
 uTHNSs6zn2h/AhsGGcNaOwVkKciHkkx3XJLfNe85aLCbSiMsIpd8aADUEgwLBCjvWhM6
 AjhT2N9U6ENILj6kaI+SouGxiwCpyP9EgMXSMKc81RF9KWUF9MPndXf5nhzRNqIT4rnQ
 LKNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EoGt+099
Subject: Re: [Buildroot] [PATCH v3] package/elfutils: ensure we have 5.0
 kernel headers for aarch64
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMy8wMy8yMDI1IDA3OjUzLCBBbGV4IEJlbm7DqWUgd3JvdGU6Cj4gU2luY2UgQnVpbGRy
b290IGNvbW1pdCBbMV0gInBhY2thZ2UvZWxmdXRpbHM6IGJ1bXAgdG8gdmVyc2lvbiAwLjE5MiIK
PiBlbGZ1dGlscyBmYWlscyB0byBidWlsZCBvbiBBYXJjaDY0IHdpdGggdG9vbGNoYWluIGluY2x1
ZGluZyBLZXJuZWwgb2xkZXIKPiB0aGFuIHZlcnNpb24gNS4wLiBFcnJvciBzaG93czoKPiAKPiAg
ICAgIGFhcmNoNjRfaW5pdHJlZy5jOiBJbiBmdW5jdGlvbiAnYWFyY2g2NF9zZXRfaW5pdGlhbF9y
ZWdpc3RlcnNfdGlkJzoKPiAgICAgIGFhcmNoNjRfaW5pdHJlZy5jOjYxOjI0OiBlcnJvcjogc3Rv
cmFnZSBzaXplIG9mICdwYWNfbWFzaycgaXNuJ3QKPiAgICAgIGtub3duCj4gICAgICAgICA2MSB8
ICAgc3RydWN0IHVzZXJfcGFjX21hc2sgcGFjX21hc2s7Cj4gICAgICAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn5+fn4KPiAKPiBlbGZ1dGlscyAwLjE5MiBpbnRyb2R1Y2VkIGEg
QWFyY2g2NCBwb2ludGVyIGF1dGhlbnRpY2F0aW9uIHN1cHBvcnQgaW4KPiB1cHN0cmVhbSBjb21t
aXQgWzJdLgo+IAo+IEZvciByZWZlcmVuY2UsIHRoZSB1c2VyX3BhY19tYXNrIHN0cnVjdHVyZSB3
YXMgaW50cm9kdWNlZCBpbiBLZXJuZWwKPiB1cHN0cmVhbSBjb21taXQgWzNdLCBpbmNsdWRlZCBp
biBLZXJuZWwgdjUuMC4KPiAKPiBGaXhlczoKPiAtIGUuZyBodHRwczovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvNTE1NjkwMWE3M2JlNTJjZThmZmJmMTA3MjllNjg1MjQ5OWEzMDBi
ZS8KPiAtIDQvNiBvZiB0aGUgZmFpbHVyZXMgaGVyZTogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm9yZy8/cmVhc29uPWVsZnV0aWxzLTAuMTkyJmFyY2g9YWFyY2g2NAo+IAo+IFsxXSBodHRw
czovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvNWViNzM0NzY2
YjI0ZGU1ZmNlNmU1ODY4OTdjZDQ4MjdmODg1NTQ0Mgo+IFsyXSBodHRwczovL3NvdXJjZXdhcmUu
b3JnL2dpdC8/cD1lbGZ1dGlscy5naXQ7YT1jb21taXRkaWZmO2g9NjRlM2I0NTFhZDJjZWM4ZDQ1
NjYxYjE4MTZlM2QyZGM0NDMxZjNjYQo+IFszXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/aWQ9ZWM2ZTgyMmQx
YTIyZDBlZWYxZDFmYTI2MGRmZjc1MWRiYTlhNDI1OAo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXgg
QmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPiBNZXNzYWdlLUlkOiA8MjAyNTAyMTcx
NDAzMzIuMzEwMzQ3LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZz4KCldhcyB0aGVyZSBhIHBhcnRp
Y3VsYXIgcmVhc29uIHlvdSBkZWNpZGVkIG5vdCB0byB0YWtlIHRoaXMgdXBzdHJlYW0gCnBhdGNo
IGFuZCBqdXN0IHNwdW4gYSB2MzoKCmh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWVsZnV0
aWxzLmdpdDthPWNvbW1pdDtoPTUyYTc0N2EzMTYwNDJlNzBhMjJhY2I0ODlkZjllNTFiZmM2YmYy
ZDUKCi0tIApGbG9yaWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
