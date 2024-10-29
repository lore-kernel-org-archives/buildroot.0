Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74DCD2AB20
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 11:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4225740558;
	Tue, 29 Oct 2024 11:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JE8CHAZ3wLEn; Tue, 29 Oct 2024 11:19:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC17C405B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC17C405B3;
	Tue, 29 Oct 2024 11:19:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC2A9112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C806405B3
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1D5irbZ0eKAe for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 11:19:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4ECC64055D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ECC64055D
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4ECC64055D
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:19:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37ed3bd6114so3424427f8f.2
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 04:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730200767; x=1730805567;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BVr7/Dne9lIM21UBjHXKwxuIb7Dbq6Eee6t9k3oMel8=;
 b=Vmt6ABLC/RdLkTeo0NzI5feAeh1KYGNEyOd4E+J4HS5O3qbi5hqKoAIi+8dBpwaeob
 CR6zu8eqVsJBMEKZ+3pEte342ptyAATBNLNP1w6rh+2kCmWavetmxTkG5dTv1Yh1dVM0
 f8wAOEeCfcGxvBZ0xvDwDVH4IWBqR/vCzh7h0369v40d903/LWbCz5ijQjq49VYiSR88
 4UOsMbjUq3VBJNZRyrf9e9fUKuxxrGg8KHcspIWhqWiFwb6sqpGhB2FYWqygisAmU+uc
 dBZG9jhQyL7ES04HPkWJR1bJAIdm+tkI/Gr4TRkCAUDAtGg9P+HGfeCSVdNpVLsgPj5h
 OfOg==
X-Gm-Message-State: AOJu0Yw+/u4g8euq1EGGYBsLp1AaRFyTB6ZjVrdAGndJKXcy32POz7Nm
 Lxjqn2SF9TySrwgMTpMeeL4I+3dFZpaJ8nVbBj4I86O+pg1rwhhQImf2fg==
X-Google-Smtp-Source: AGHT+IFtZzBk2Lpb+ZSS1OsPsX7FSc153srhxhqaoog86lcuNR8BX7VqOxADZDWGE9N+BeskKBcNIA==
X-Received: by 2002:adf:a348:0:b0:37d:4e20:9be0 with SMTP id
 ffacd0b85a97d-380611f5e23mr7573044f8f.51.1730200766951; 
 Tue, 29 Oct 2024 04:19:26 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b47952sm12116173f8f.48.2024.10.29.04.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 04:19:26 -0700 (PDT)
Message-ID: <7673095e-2d11-44c3-9181-2029edb95eb9@gmail.com>
Date: Tue, 29 Oct 2024 12:19:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
To: buildroot@buildroot.org
References: <20241017-master-v2-1-7cf8d42d5d81@gmail.com>
Content-Language: en-US, fr
In-Reply-To: <20241017-master-v2-1-7cf8d42d5d81@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730200767; x=1730805567; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BVr7/Dne9lIM21UBjHXKwxuIb7Dbq6Eee6t9k3oMel8=;
 b=ik0fdfAFbMCKPp9/G6m9aeJSXjSiePYmtKMCHe93v69/68tKmI9FmcifGv7ajPozNY
 SLimnlKUR5cje9RfYAaRX+9SZDljyWsbgtyyW21AvdC8src336yq0QdRIkNNmwtg2Isz
 69Rda9W8qw/tTkFRWWO8w+gtbhF5IjapC8+GMGmXhvya1F/RsWBGYX8PoiAb5DVUbpp9
 cde1I2TZKXeioiusIU1VGzQUEMf5V9wxKA8T6YAneIWpGzmzXmvj9KFbTgWq2eVjJeEV
 Ge6OZo1ndI2Ex4qpfZs4xWY+Vn5qP7MNQBqTvfvm9pomVvql7h+RmX4O4ZMdb/AZ4eDo
 rJDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ik0fdfAF
Subject: Re: [Buildroot] [PATCH v2] configs/stm32mp135f-dk: new defconfig
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpMZSAxNy8xMC8yMDI0IMOgIDIzOjI4LCBSYXBoYWVsIEdhbGxhaXMtUG91IGEgw6ljcml0wqA6
Cj4gQWRkIG5ldyBkZWZjb25maWcgZm9yIFNUTWljcm9lbGVjdHJvbmljcyBib2FyZCBTVE0zMk1Q
MTM1Ri1ESy4KPiAKPiBTVE0zMk1QMTM1Ri1ESyBmZWF0dXJlcyBjYW4gYmUgZm91bmQgaGVyZToK
PiAgICBodHRwczovL3d3dy5zdC5jb20vZW4vZXZhbHVhdGlvbi10b29scy9zdG0zMm1wMTM1Zi1k
ay5odG1sCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmdhbGxhaXNw
b3VAZ21haWwuY29tPgo+IC0tLQo+IFRoaXMgY29tbWl0IHNlcmllcyBpcyBhIGZpcnN0IGF0dGVt
cHQgdG8gaW1wcm92ZSB0aGUgb3JnYW5pemF0aW9uIGFuZAo+IGZ1bmN0aW9uYWxpdHkgb2YgdGhl
IFNUTTMyIHBsYXRmb3JtIGluIEJ1aWxkcm9vdC4gSXQgY29tZXMgd2l0aCB0d28KPiBwYXRjaGVz
Ogo+IAo+IDEuIFJlb3JkZXIgY29tbW9uIFNUIGZvbGRlcjoKPiAgICAgLSBSZW5hbWUgdGhlIGNv
bW1vbiBTVCBmb2xkZXIgZnJvbSBzdG0zMm1wMTU3IHRvIHN0bTMybXAxeHguCj4gICAgIC0gVXBk
YXRlIHJlZmVyZW5jZXMgYW5kIHBhdGhzIGluIHJlbGF0ZWQgY29uZmlndXJhdGlvbiBmaWxlcy4K
PiAgICAgLSBQcmVwYXJlIHRvIHJlY2VpdmUgbmV3IHN0bTMybXAxMyBib2FyZC4KPiAKPiAyLiBB
ZGQgbmV3IGRlZmNvbmZpZyBmb3IgU1RNMzJNUDEzOgo+ICAgICAtIEludHJvZHVjZSBhIG5ldyBk
ZWZjb25maWcgZmlsZSAoc3RtMzJtcDEzX2RrKS4KPiAgICAgLSBCb290IGZvbGxvd2luZyB0aGUg
VEYtQS9PUC1URUUvVS1Cb290L0xpbnV4IGNoYWluLgo+ICAgICB2MToKPiAgICAgLSBJbmNsdWRl
IGdlbmVyaWMgIm11bHRpX3Y3IiBkZWZjb25maWcgZm9yIExpbnV4IGNvbmZpZ3VyYXRpb24uCj4g
ICAgIHYyOgo+ICAgICAtIEluY2x1ZGUgYSBtaW5pbWFsaXN0aWMgZGVmY29uZmlnIGZvciBMaW51
eCBjb25maWd1cmF0aW9uLgo+IAo+IFNpbmNlIHRoaXMgaXMgYSBSRkMsIHBsZWFzZSBmZWVsIGZy
ZWUgdG8gZGlzY3VzcyBob3cgdGhvc2UgY2hhbmdlcyBjYW4KPiBiZSBpbXByb3ZlZC4KPiAtLS0K
PiBDaGFuZ2VzIGluIHYyOgo+IC0gUmVtb3ZlZCBtZXJnZWQgcGF0Y2g6Cj4gaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2YyMWRiMmJkODNiZjMwNzNh
NTBiOGJjZDc5YWY2ZTdhZWQ2ZmIwMDAKPiAtIEluY2x1ZGUgYSBtaW5pbWFsaXN0aWMgZGVmY29u
ZmlnIGZvciBMaW51eCBjb25maWd1cmF0aW9uCj4gLSBSZW1vdmVkIEJSMl9QQUNLQUdFX0hPU1Rf
Qk1BUF9UT09MUyBvcHRpb24uCj4gLSBNb3ZlIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9P
UEVOU1NMIHRvIHRoZSBhY2NvcmRpbmcgc2VjdGlvbi4KPiAtIEhhcmRjb2RlIE9QLVRFRSB2ZXJz
aW9uIHVzaW5nIHRhcmJhbGwgbGluay4KPiAtIFVzZSBCUjJfR0xPQkFMX1BBVENIX0RJUiBhbmQg
YWRkIE9QLVRFRSBoYXNoIHRvIGNvbW1vbiBmb2xkZXIuCj4gLSBMaW5rIHRvIHYxOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjQwODE0LW1hc3Rlci12MS0wLTc4MzRmM2RlZGRjYkBnbWFp
bC5jb20KCkhpLAoKSnVzdCBhIGdlbnRsZSBwaW5nIG9uIHRoaXMgdjIuIDotKQoKVGhhbmtzIGZv
ciB5b3VyIHRpbWUsCgo+IAo+IEJlc3QgcmVnYXJkcywKClJhcGhhw6tsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
