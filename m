Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C54C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 14:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20F1060852;
	Mon,  3 Feb 2025 14:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hvAVI0RJ6KU; Mon,  3 Feb 2025 14:55:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47723608D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47723608D4;
	Mon,  3 Feb 2025 14:55:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DFCD12A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D1FE608E0
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uE0D_TO-sYcn for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 14:55:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F31760852
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F31760852
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F31760852
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:55:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so2341785f8f.1
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 06:55:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738594519; x=1739199319;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/pNPSEwLykNWHclkCiTXLX2DctxN02Qgqb6HSseDMU8=;
 b=k/dNI9Nl3ele3ul40e1CcyllzTrFf+Dg2TWkwkm8L4pKJJRucjq6GGJGh/v8pF6wny
 UrPFMJe3118Qt7ehOzCohdXauFMcFCVpr7mVXsm0Y8OXtmOdOzR2rCex1quuqUGPn1kS
 YPRFpO8Yg+ZGti6a2Yck6W98kJRIsSJ1UcrxyfGxq0Old2Y52n7ybX8d2ZkpzYgZaTLl
 Ais0AC0K8/NZ5M/O2LwrWORRJ86FJiV7NOuPXvzotgyH6ABhtbIdkdXiWmUaUH5c8X9N
 fpTz2DDCyVSvmoNJYfzYy9fE3XTokZ1y2GjOC1JgSccWefwa5IjQX3k55R7bFy3rD7FM
 j0zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbScxMzpfFflkP9eAC5rhChpgQ7gxFIWYlNUlRgpl6+CGwvvIuz3dFY/7isMTgUvP/Xsn4PWP9irY=@buildroot.org
X-Gm-Message-State: AOJu0YzYNYKnv5wmHFes0HlZdXvD80SWxEkDrI5PGpe/6ocZxoWnd0oM
 O4LWkeWA3DzNaCmwaHz3COUN/gdRKUa0BDbPCHVUCAHi3CKO+aR/ASpLysTGTbw42IcE19QvE7/
 y
X-Gm-Gg: ASbGnctGhzQpT138NB9r4j50z7LaJIQZ6GswpaMC7QYjfS/KzOOVmtsVx621h8e2pGG
 ly50dOTmzpGgl/0TXw0l+63eoah6JTPoSfYpyvVZjvLp7oYQ5pt/OR8iJmXvqPbwOIay8ofDvqI
 L+4q2pni6RueTB2uJdUWd+vd+PC//KZa2Ctpz5oYBl2mGw1jSjHTWPrIhl/5wEPSCNfltpG51xN
 sEzfsTuzKLxN4shKUtBErwxt2z47p3Znm6gHuI/+h9KUPvr1J4LjYVk6qiZ2rozdwkSJZ3kaz0+
 pwIJKJqgeFjMtWHlKyRrT1m9BXfOaI+Ab7oH1CQfmzhg/Ow=
X-Google-Smtp-Source: AGHT+IEAJ0TTgYXmFsw/11EADLqrSeyGjyZkh9x/fUALCPKGeFU4ADoeJAOuCfW5e9gsh63rpBVQgA==
X-Received: by 2002:a5d:5311:0:b0:385:f677:8594 with SMTP id
 ffacd0b85a97d-38c51e93021mr14925410f8f.43.1738594519412; 
 Mon, 03 Feb 2025 06:55:19 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c0ecc80sm13247093f8f.16.2025.02.03.06.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 06:55:18 -0800 (PST)
Message-ID: <fcb16aaa-3e20-4eff-bbf5-e5801216b8ce@mind.be>
Date: Mon, 3 Feb 2025 15:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 buildroot@buildroot.org
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250201145129.921266-1-gael.portay+rtone@gmail.com>
 <20250201145129.921266-2-gael.portay+rtone@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250201145129.921266-2-gael.portay+rtone@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738594519; x=1739199319; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/pNPSEwLykNWHclkCiTXLX2DctxN02Qgqb6HSseDMU8=;
 b=PldfWjoQuvYFsYJmpCMGHtQJoUC+Ey9gAWGKet+QQDWy6hW74wUXdja/e9sn1iyLwC
 aM7OefsbTDHRDvEzHlfuPs5egBTpVRWv8pV+ixlH3LwcJtk4h8/s6XbQsi0nXwkm/xUH
 O+V/QhbE5zzz5jj9zr66f7S7KDA18okNeXKNC3dy+TB4U0nf5Jq/QUy8gJt+c0pnYVOU
 vL0XYuLI8g71QMZwa/SvL/3mCEhVuSWcx4GVWOex9zC4TunmMveDM0oKDyhiU8g53ZpW
 wn7vNbt1vHBctdwZhIKfykBF82MpipKjB3gFd03flfaQYIqqJISgjpJWsDW68/VFKFJQ
 uExw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PldfWjoQ
Subject: Re: [Buildroot] [PATCH v3 1/2] DEVELOPERS: add myself as developer
 for raspberrypi
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMS8wMi8yMDI1IDE1OjUxLCBHYcOrbCBQT1JUQVkgd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheStydG9uZUBnbWFpbC5jb20+CgogIEFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgREVWRUxP
UEVSUyB8IDQgKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IDMxODE1YjEyNzIuLjJj
ZDc3NmQ3NGEgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBA
QCAtMTE5NCw2ICsxMTk0LDEwIEBAIE46CUZyYW5rIFZhbmJldmVyIDxmcmFuay52YW5iZXZlckBt
aW5kLmJlPgo+ICAgRjoJcGFja2FnZS9saWJtb2RzZWN1cml0eS8KPiAgIEY6CXBhY2thZ2Uvbmdp
bngtbW9kc2VjdXJpdHkvCj4gICAKPiArTjoJR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheStydG9u
ZUBnbWFpbC5jb20+Cj4gK0Y6CWJvYXJkL3Jhc3BiZXJyeXBpLwo+ICtGOgljb25maWdzL3Jhc3Bi
ZXJyeXBpKgo+ICsKPiAgIE46CUdhbyBYaWFuZyA8aHNpYW5na2FvQGFvbC5jb20+Cj4gICBGOglw
YWNrYWdlL2Vyb2ZzLXV0aWxzLwo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
