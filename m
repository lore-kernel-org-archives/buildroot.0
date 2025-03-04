Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38003C021B8
	for <buildroot@archiver.kernel.org>; Tue,  4 Mar 2025 14:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF863407E3;
	Tue,  4 Mar 2025 14:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8d16wj6DE9k; Tue,  4 Mar 2025 14:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68EFB4082B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68EFB4082B;
	Tue,  4 Mar 2025 14:30:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AE7EB55
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 14:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A74260D67
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 14:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JXfwwJq6oXr for <buildroot@buildroot.org>;
 Tue,  4 Mar 2025 14:30:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C7C760D63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C7C760D63
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C7C760D63
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 14:30:10 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-390edaee0cfso3210227f8f.2
 for <buildroot@buildroot.org>; Tue, 04 Mar 2025 06:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741098609; x=1741703409;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GXOfaZUFj+Z/BHaMjmK5JlU/2RhvOxHjyUU7eEdlupQ=;
 b=OPr7xcFnA6Iad8hUugn2pGNltc7g+v5l1c5sIUyxDRBfyCX8SxAZjshUXAV+7iHh7r
 aoU2ifEq8Sh2+J29h+k5SsLKVdFPba98wWKYCHqjpZ2u7lnDQ5YQmnR1/QnlaykyAgYs
 L27oO1DKQsSB2vCqNpeYowSRAH3kx496dZ40BrNy0bs7c9C49KxYl8W7XciVbWpfg/OP
 caz0DOafY9aeLisa3CXcZiP7Y9PeMvt7P/380zjPjD0k6HNkaD8DxkPoMVygRzsImPgg
 QxE4LPzYpVxEEkGeZsAoefBGVXHXW6P9QodElwWu/8boGZGk0rJs+QU0k9/hIyYUy/Yh
 sbuA==
X-Gm-Message-State: AOJu0Ywa+OwbZ/u5HgoVN9YwkVkg3jratSJHhvOP6ndIwaX3GpF0SP6B
 /te/yWeCHR8GcYtecdmHnI8Nc6IApb8otmaCU9hf6qDNuKrFRWYzP0qaiKp1tvA=
X-Gm-Gg: ASbGncudtsXX51aPfUZCmY/2OFBG/IYaWp42VB7Fv8I4NXTJmyDGaRonE6H7C6yhkqT
 rYQBnGzCoqmNK8VmalfsvbpJNO6Hr2czH3ysR9YHdZ6etN87Tp6CTyHJsVo2vgMESBXDpbD37xO
 Z860qxWQdnJle2Rt+PW5csn4TSKQC9ISicVsCb3sRuRJ9S+xuJupNZ2TKHc+m8jVkcuqwZOmruW
 8vgX1VY7weJRqVjYZSjkfktU1AKb4GqeP7EyE3VyeMMUB9K1D4Nof4c3V0R2Y8GCIYiuU6vhLb+
 RqlZwOFpoRmZBJqQe1p8OWAosch+LxQOiuWCviuTcg/6K50=
X-Google-Smtp-Source: AGHT+IHwJRzZMiJG47JrUmMpNke6LnIJPDfvwGULe79ubLIWDs4AuNa3bl5pa/M5BIRmtBj0mrl6PQ==
X-Received: by 2002:a5d:598f:0:b0:390:d76b:fbbf with SMTP id
 ffacd0b85a97d-390ec7c607dmr12292791f8f.4.1741098608848; 
 Tue, 04 Mar 2025 06:30:08 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a5b96sm17734629f8f.29.2025.03.04.06.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 06:30:08 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8E1F55F93C;
 Tue,  4 Mar 2025 14:30:07 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: buildroot@buildroot.org,  Markus Mayer <mmayer@broadcom.com>,  Jugurtha
 BELKALEM <jugurtha.belkalem@smile.fr>,  Alexander Egorenkov
 <egorenar-dev@posteo.net>,  Bernd Kuhls <bernd@kuhls.net>,  Julien Olivain
 <ju.o@free.fr>,  Laurent Vivier <laurent@vivier.eu>,  "Wojciech M.
 Zabolotny" <wzab01@gmail.com>,  Francis Laniel
 <flaniel@linux.microsoft.com>,  James Hilliard
 <james.hilliard1@gmail.com>,  Romain Naour <romain.naour@gmail.com>,  Qais
 Yousef <qais.yousef@arm.com>
In-Reply-To: <0c66ba0f-9efa-4cc0-8a36-71b54e25979e@gmail.com> (Florian
 Fainelli's message of "Tue, 4 Mar 2025 05:28:02 -0800")
References: <20250303155310.513886-1-alex.bennee@linaro.org>
 <0c66ba0f-9efa-4cc0-8a36-71b54e25979e@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 04 Mar 2025 14:30:07 +0000
Message-ID: <871pvc6f80.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741098609; x=1741703409; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GXOfaZUFj+Z/BHaMjmK5JlU/2RhvOxHjyUU7eEdlupQ=;
 b=bRley+j61yVQxfgWFMuWswDM92CatjlAsE8JjCEufC4xhCruzAwvyO0VhKkChyLBtp
 1xUEqEwWVqIFgozwsIBQ3FMRXlcaBR7Q4AseRXopBD+ShAUrKwhhnhOKw6W98sYjsz9q
 BpTuOVsddZpFKAGJkHD8kH6TIPTqe9NbAtv0TYad2OBfMqMNbRe6mei98LgWOCAD/eI2
 GbQCXTOmL0ohStFwoKVdYLwx3KYKzzpldE5ktKLMHArPTMZbP9Oj5JXvqwOqO1ckQ0S8
 HzKWQb7gkzho481yMFGQYbA66R3TuhkhdNozeiYhI2PISJFsBx8vUKNg32BcEwjfLWmm
 2daQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bRley+j6
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+IHdyaXRlczoKCj4gT24gMDMv
MDMvMjAyNSAwNzo1MywgQWxleCBCZW5uw6llIHdyb3RlOgo+PiBTaW5jZSBCdWlsZHJvb3QgY29t
bWl0IFsxXSAicGFja2FnZS9lbGZ1dGlsczogYnVtcCB0byB2ZXJzaW9uIDAuMTkyIgo+PiBlbGZ1
dGlscyBmYWlscyB0byBidWlsZCBvbiBBYXJjaDY0IHdpdGggdG9vbGNoYWluIGluY2x1ZGluZyBL
ZXJuZWwgb2xkZXIKPj4gdGhhbiB2ZXJzaW9uIDUuMC4gRXJyb3Igc2hvd3M6Cj4+ICAgICAgYWFy
Y2g2NF9pbml0cmVnLmM6IEluIGZ1bmN0aW9uCj4+ICdhYXJjaDY0X3NldF9pbml0aWFsX3JlZ2lz
dGVyc190aWQnOgo+PiAgICAgIGFhcmNoNjRfaW5pdHJlZy5jOjYxOjI0OiBlcnJvcjogc3RvcmFn
ZSBzaXplIG9mICdwYWNfbWFzaycgaXNuJ3QKPj4gICAgICBrbm93bgo+PiAgICAgICAgIDYxIHwg
ICBzdHJ1Y3QgdXNlcl9wYWNfbWFzayBwYWNfbWFzazsKPj4gICAgICAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn5+fn4KPj4gZWxmdXRpbHMgMC4xOTIgaW50cm9kdWNlZCBhIEFh
cmNoNjQgcG9pbnRlciBhdXRoZW50aWNhdGlvbiBzdXBwb3J0Cj4+IGluCj4+IHVwc3RyZWFtIGNv
bW1pdCBbMl0uCj4+IEZvciByZWZlcmVuY2UsIHRoZSB1c2VyX3BhY19tYXNrIHN0cnVjdHVyZSB3
YXMgaW50cm9kdWNlZCBpbiBLZXJuZWwKPj4gdXBzdHJlYW0gY29tbWl0IFszXSwgaW5jbHVkZWQg
aW4gS2VybmVsIHY1LjAuCj4+IEZpeGVzOgo+PiAtIGUuZyBodHRwczovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvNTE1NjkwMWE3M2JlNTJjZThmZmJmMTA3MjllNjg1MjQ5OWEzMDBi
ZS8KPj4gLSA0LzYgb2YgdGhlIGZhaWx1cmVzIGhlcmU6IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5vcmcvP3JlYXNvbj1lbGZ1dGlscy0wLjE5MiZhcmNoPWFhcmNoNjQKPj4gWzFdCj4+IGh0
dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC81ZWI3MzQ3
NjZiMjRkZTVmY2U2ZTU4Njg5N2NkNDgyN2Y4ODU1NDQyCj4+IFsyXSBodHRwczovL3NvdXJjZXdh
cmUub3JnL2dpdC8/cD1lbGZ1dGlscy5naXQ7YT1jb21taXRkaWZmO2g9NjRlM2I0NTFhZDJjZWM4
ZDQ1NjYxYjE4MTZlM2QyZGM0NDMxZjNjYQo+PiBbM10gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lkPWVjNmU4
MjJkMWEyMmQwZWVmMWQxZmEyNjBkZmY3NTFkYmE5YTQyNTgKPj4gU2lnbmVkLW9mZi1ieTogQWxl
eCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+PiBNZXNzYWdlLUlkOiA8MjAyNTAy
MTcxNDAzMzIuMzEwMzQ3LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPgo+IFdhcyB0aGVyZSBh
IHBhcnRpY3VsYXIgcmVhc29uIHlvdSBkZWNpZGVkIG5vdCB0byB0YWtlIHRoaXMgdXBzdHJlYW0K
PiBwYXRjaCBhbmQganVzdCBzcHVuIGEgdjM6Cj4KPiBodHRwczovL3NvdXJjZXdhcmUub3JnL2dp
dC8/cD1lbGZ1dGlscy5naXQ7YT1jb21taXQ7aD01MmE3NDdhMzE2MDQyZTcwYTIyYWNiNDg5ZGY5
ZTUxYmZjNmJmMmQ1CgpTb3JyeSBJIGRpZG4ndCBzZWUgdGhhdCBiZWZvcmUgSSdkIHJlc3B1bi4g
CgotLSAKQWxleCBCZW5uw6llClZpcnR1YWxpc2F0aW9uIFRlY2ggTGVhZCBAIExpbmFybwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
