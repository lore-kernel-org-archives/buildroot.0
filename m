Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31558CCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 11:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D690780C13;
	Fri, 17 Oct 2025 11:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdZneQ2uK1Yn; Fri, 17 Oct 2025 11:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EBF380C14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EBF380C14;
	Fri, 17 Oct 2025 11:21:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6C10972
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 11:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7A6740937
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 11:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDvacXuGawb7 for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 11:21:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=bartosz.bilas@grinn-global.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA260407A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA260407A2
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA260407A2
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 11:20:59 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b3e234fcd4bso303384466b.3
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 04:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760700057; x=1761304857;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QRDi8xwMKKebqdCmRYqz1Xnk+17bxUIxl6ytykABbUQ=;
 b=lDPQfAS7GGyHjk3Y0FId/2Mudq5IPOjjfnnQcmSkuyX8HeSmYtFLwD5EWezin2PH+L
 BG1oPmYm4Bhy/mfMteLEerunz9JgtV8XTCf0W1CWlEfLb9KNdpJxGWOfql/37hL4bZt3
 2Ova5hTFdNS456sDRNNgHicDgIFLqmSFpmBUxtTCAJTY7107Ei/6BQ9h8a23zI+MSZhq
 jI1nb/AWJyr/P0Xcau5uNiPSFVPADlWain/NoXMhOiKvykx53MDO17ty7ljvFJQblzS4
 hfclLsX2zLlMPpuT+uuKZOhM4YUHuv+an57F87nEfh7d3QQPm4ZMg1uArYUCATklp8mF
 d9AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv7AerXlMzRUCN7P40ps5usjkjQ8d4seVlooWQT/3STmMQEzKSje4FIop+FaRJ4neFmJSkeFwcmv0=@buildroot.org
X-Gm-Message-State: AOJu0YxcDLEZ+O6N27ORmQ8WfbyLchaMUPgJ26J2q6hKNt76e21G85Y7
 ayIrosYcNROLV3qUwl6C9r8KrVvv4EepoC9H/5alk0gIn+B8scMGn4Q2kP+iRxLrIsSH
X-Gm-Gg: ASbGncuC0tT12bQFXiRZKqMjQiNWNTmrtY9qiZJavDHKHnp5abEGZz5vuUq2LrwPVHJ
 ah2juc1McbIQynZTqLExMD084UUS8ENIQgrAWe2vdQhbiv24ipYjpw4qu5rEwFy+cuS0e5J27D3
 c08ne6Q87fE8TXXf3oB53OoAa/sRFpbPIbNV2Ksf7Dz0WAUd7xlX+STvkCKIekyNaie7I/Ggjmw
 1dn9O9Wf1I60zFVG9lPGdLtWPmP1HT6Agq8zhRseQZ5hgAq7+Fp5UIl8RYsqj58AR/YeMc6oAJv
 e4WGc4XiUbphIww27EXlpfna3OOJ1zbN8R/Ka//HKJA4E0k/Y2HSgfje7AGnfDSStRQqJXgC+Q2
 ZUk6Zft3ChIaHZ90uRFSaOjQ9OlpzUYxGTLVqgNGVPYbBYYr0zMGABioV+eYtPXlAj77elTLtcO
 hd/rH4YEv/KcdVa0i/X6Pf/b8AG+clMG+zWQ==
X-Google-Smtp-Source: AGHT+IF3M+vdvPmS42a3U6lZhuXyXUvUVUGl0v2gWDhE3+q+RcF5oG40NcTyt8bJfvpP3l9Oeu6mJQ==
X-Received: by 2002:a17:907:8691:b0:b3c:6093:679b with SMTP id
 a640c23a62f3a-b6473952198mr344675666b.36.1760700056211; 
 Fri, 17 Oct 2025 04:20:56 -0700 (PDT)
Received: from [192.168.10.54] (ip-194.4.60.197.edial.pl. [194.4.60.197])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cba06a5b3sm798412966b.29.2025.10.17.04.20.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 04:20:55 -0700 (PDT)
From: Bartosz Bilas <bartosz.bilas@grinn-global.com>
X-Google-Original-From: Bartosz Bilas <b.bilas@grinn-global.com>
Message-ID: <96b063f0-7e79-4783-9f99-581809183f1f@grinn-global.com>
Date: Fri, 17 Oct 2025 13:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251012182016.2711834-1-bernd@kuhls.net>
 <20251012182016.2711834-21-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20251012182016.2711834-21-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grinn-global-com.20230601.gappssmtp.com; s=20230601; t=1760700057;
 x=1761304857; darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QRDi8xwMKKebqdCmRYqz1Xnk+17bxUIxl6ytykABbUQ=;
 b=RVedXOE52mAFzcjgU9rfVfhRSpgYRqGmBRg0FuzpcyBpl8XhHH02ZkCTljYRKyUEhL
 SVFKND1djwavL0waW4VXjFMsLFu/+F8TrZnqYXfshboZLjGDScl1kFGrIbKiLTSgIVJd
 AYJAdLj7lNNJ2aJLokAPr9PUROk12gKWz/luSNT0/u9SgpVLsE7WWip+dJ4SVdtzc8KO
 lwt4cEJf67YrG1uRrBbSxWr35uTzlnhzivIwTgUr4KoObtIDlAHPpF0l6gOfK1ohcT3J
 0+ZVRIrmYCHtdsExFboLz/8bupWIKTn7fu62DztTEQZKqwRXoc3h2hXy2mPDJkfkXAuH
 BMgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grinn-global-com.20230601.gappssmtp.com
 header.i=@grinn-global-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=RVedXOE5
Subject: Re: [Buildroot] [PATCH 21/21] package/python-esptool: bump version
 to 5.1.0
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
Cc: Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmVybmQsCgpJdCB3b24ndCB3b3JrIHdpdGhvdXQgdGhlIG5ldyByZXF1aXJlZCBydW50aW1l
IGRlcGVuZGVuY2llcy4gU2VlIApodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
YnVpbGRyb290L2xpc3QvP3Nlcmllcz00NjY5NDAKCkJlc3QgcmVnYXJkcwpCYXJ0b3N6IEJpxYJh
cwoKT24gMTAvMTIvMjUgMjA6MjAsIEJlcm5kIEt1aGxzIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6
IEJlcm5kIEt1aGxzPGJlcm5kQGt1aGxzLm5ldD4KPiAtLS0KPiAgIHBhY2thZ2UvcHl0aG9uLWVz
cHRvb2wvcHl0aG9uLWVzcHRvb2wuaGFzaCB8IDQgKystLQo+ICAgcGFja2FnZS9weXRob24tZXNw
dG9vbC9weXRob24tZXNwdG9vbC5tayAgIHwgNCArKy0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5
dGhvbi1lc3B0b29sL3B5dGhvbi1lc3B0b29sLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1lc3B0b29s
L3B5dGhvbi1lc3B0b29sLmhhc2gKPiBpbmRleCA2ZWFiNzkwOTAxLi5hZjUxN2UwODQ0IDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWVzcHRvb2wvcHl0aG9uLWVzcHRvb2wuaGFzaAo+ICsr
KyBiL3BhY2thZ2UvcHl0aG9uLWVzcHRvb2wvcHl0aG9uLWVzcHRvb2wuaGFzaAo+IEBAIC0xLDUg
KzEsNSBAQAo+ICAgIyBtZDUsIHNoYTI1NiBmcm9taHR0cHM6Ly9weXBpLm9yZy9weXBpL2VzcHRv
b2wvanNvbgo+IC1tZDUgIGM3ZDQxZDRjODlmZmEwZmEwYTlkNDkwNDM5MzU4YjI3ICBlc3B0b29s
LTQuOC4xLnRhci5nego+IC1zaGEyNTYgIGRjNGVmMjZiNjU5ZTFhOGRjYjAxOTE0N2MwZWE2ZDk0
OTgwYjM0ZGU5OWZiZTA5MTIxYzc5NDFjOGIyNTQ1MzEgIGVzcHRvb2wtNC44LjEudGFyLmd6Cj4g
K21kNSAgZmM5Y2VhNDkxMGVjZmI2ZmJiYjI5NDJlNDRjODM1YmQgIGVzcHRvb2wtNS4xLjAudGFy
Lmd6Cj4gK3NoYTI1NiAgMmVhOWJjZDdlYjI2M2QzODBhNGZlMDE3MDg1NmExMGU0YzY1ZTNmMzhj
NzU3ZWJkYzczNTg0YzhkZDgzMjJkYSAgZXNwdG9vbC01LjEuMC50YXIuZ3oKPiAgICMgTG9jYWxs
eSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gICBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZk
ZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIExJQ0VOU0UK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZXNwdG9vbC9weXRob24tZXNwdG9vbC5tayBi
L3BhY2thZ2UvcHl0aG9uLWVzcHRvb2wvcHl0aG9uLWVzcHRvb2wubWsKPiBpbmRleCBhNDkyMmMx
ZTViLi5lZGE5ZDAyNGM2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWVzcHRvb2wvcHl0
aG9uLWVzcHRvb2wubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1lc3B0b29sL3B5dGhvbi1lc3B0
b29sLm1rCj4gQEAgLTQsOSArNCw5IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+ICAgCj4gLVBZVEhPTl9FU1BUT09MX1ZFUlNJT04gPSA0LjguMQo+ICtQWVRIT05fRVNQVE9P
TF9WRVJTSU9OID0gNS4xLjAKPiAgIFBZVEhPTl9FU1BUT09MX1NPVVJDRSA9IGVzcHRvb2wtJChQ
WVRIT05fRVNQVE9PTF9WRVJTSU9OKS50YXIuZ3oKPiAtUFlUSE9OX0VTUFRPT0xfU0lURSA9aHR0
cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzVjLzZiLzNjZTliYjdmMzZiZGVm
M2Q2YWU3MTY0NmExZDNiN2Q1OTgyNmE0NzhmM2VkOGE3ODNhOTNhMmY4ZjUzNwo+ICtQWVRIT05f
RVNQVE9PTF9TSVRFID1odHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvYzIv
MDMvZDdkNzlhNzdkZDc4N2RiZTYwMjk4MDljNWY4MWFkODg5MTIzNDBhMTMxYzg4MDc1MTg5ZjQw
ZGYzYWJhCj4gICBQWVRIT05fRVNQVE9PTF9TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+ICAgUFlU
SE9OX0VTUFRPT0xfTElDRU5TRSA9IEdQTC0yLjArCj4gICBQWVRIT05fRVNQVE9PTF9MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRQotLSAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
