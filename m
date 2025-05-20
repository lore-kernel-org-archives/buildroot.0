Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FF7C3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 556C840931;
	Tue, 20 May 2025 17:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kO1US3OpBk3H; Tue, 20 May 2025 17:38:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DB6F407CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DB6F407CC;
	Tue, 20 May 2025 17:38:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4B56DE
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6A4581CAF
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXGuS3u6HpuV for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:38:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E94988063A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E94988063A
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E94988063A
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:38:14 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so6003394b3a.3
 for <buildroot@buildroot.org>; Tue, 20 May 2025 10:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747762694; x=1748367494;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fjkTZcOSUqv4tHov00rVpQnrS+CW9vOPfB8no00vsDQ=;
 b=OORnTg2/WO36Xh7d45Fl82qIs7J7K+8af5hTYrPmUDDLuGDA3WTOqsvzbfu6gbo8vl
 P5iayqQUlMLwDI2Dxf3RAzbQZPKtepTxr5V+x1E12PMeyT0maTcRjVc5qyoRuH6B4NYc
 eSaH7ClatjQyXeB2/VwQx11SAujb3H4P6SHB/1WeQXmKIi9ewAXqKV9w8Obq/U3JoDU3
 r703g1CTI/d3rJqHaGkYNwQ7OpOZiWYLlqL9cNNjYLrtGxqfdat9MfXorwqjaMeet6/x
 c4aYPpclu3JZ9o15kZDVNTUtrqCXtIhab7+VZ1TtWGqH4gc5CjmkKnTZOjKa/R9kc+6e
 sigg==
X-Gm-Message-State: AOJu0Yy2btBq9gsI29D3g+iLSLfVgCOmwA+26J6RaV+xoBx75wECsLZy
 dLVXEnGfvslKCMNItRR1A9utn89kDunBESXLSxgxhOHQZ/VNNAJrBCgdcdC/aZY3
X-Gm-Gg: ASbGncvLSeVlRp3RRzNAnzrMvLgsoSki8JntYGrLQrDm4rOV1DBr294QAaEmkqCikmw
 n10kPRwQckeZWyuMxD5SyhacnJhy/8tln+jfER0ID//SwIAvD3H5xJZctdVOYCM6Q1CrAJNlFfB
 KRLILbtAqvrGVJRM5OsTWJ4+D2dAV8Pl8ecpcttmaG3BISqRBsRYf9nE6R0MymllRUwlpeeyRsy
 ruoplj7BEpB/8Qdr4vCESkbrL52WSzAmvInYEMSYkyep58UmMZHiRoPHRkiI0TiwkgzEzleauXT
 Ni1Xp1Z1iuo79WPozxwfwGjzJLq1tBjtPWcMeOu2dYSzDXGWDle137icN49M6BCp
X-Google-Smtp-Source: AGHT+IF6vu08dtIn7wyN59ZZWZo5bqZeCjCHnaJo3nHaU+WPVwkcpT/c390iPQFtSRRKhpMseHry3w==
X-Received: by 2002:a17:90a:d407:b0:30e:823f:ef25 with SMTP id
 98e67ed59e1d1-30e823fefedmr26877408a91.28.1747762693938; 
 Tue, 20 May 2025 10:38:13 -0700 (PDT)
Received: from [10.0.0.72] ([76.8.199.226]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30f364fff8asm1991519a91.39.2025.05.20.10.38.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 10:38:13 -0700 (PDT)
Message-ID: <d24b62e8-42bf-44ca-9b51-36ba697267b3@gmail.com>
Date: Tue, 20 May 2025 11:38:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250516205547.2826778-1-peter@korsgaard.com>
 <87jz6ffunh.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <87jz6ffunh.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747762694; x=1748367494; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fjkTZcOSUqv4tHov00rVpQnrS+CW9vOPfB8no00vsDQ=;
 b=T+oWGzCLQ6afRoUkFIK65dXNk6MX5acikD3uiOhAta5c/6sR3Yyoy38Enf/Pm1QIKN
 4ZseKpt5P51Xljcf6M6OcZtqOaRFMtVFuMD3T1gtnEWnUBBFIhSoXoQArXkL/SxQPtXS
 Yvy/r7O32pyYLTJ0UEJehYed5cabmYKf3cws4iNDZjd/gTojBkLAV5irm7KmjBcZ7QOq
 6dREORIc58ir4QQwYHOxAqCQnBofijyDIez3XCN1mPeOboxhGzmfsFMhQ0D9P7Vl7sNd
 kTJKiPeGtcFYL5qOJTMXsWSLROUXsMuawCqnYdn/Uj5K/WMEGdx2XE1izL+UsH9fM2Af
 ZRrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T+oWGzCL
Subject: Re: [Buildroot] [PATCH] package/pkg-autotools.mk:
 LIBTOOL_PATCH_HOOK: also handle libtool 2.5.x
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

Q291bGQgdGhpcyBtYWtlIGl0cyB3YXkgdG8gdGhlIDIwMjUuMDIueCBicmFuY2ggYXMgd2VsbD/C
oCBPcGVuVlBOIG9uIAoyMDI1LjAyLjMgc3RpbGwgd2FudHMgdG8gY29tcGxhaW4gd2hlbiBjb21w
aWxpbmcgZm9yIHg4Nl82NCB0YXJnZXQgKGJ1dCAKbm90IGFhcmNoNjQgZm9yIHdoYXRldmVyIHJl
YXNvbikuCgp0aGFua3MhCkxhbmNlIEZyZWRyaWNrc29uCgpPbiA1LzE3LzIwMjUgMzozNCBBTSwg
UGV0ZXIgS29yc2dhYXJkIHdyb3RlOgo+Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQg
PHBldGVyQGtvcnNnYWFyZC5jb20+IHdyaXRlczoKPiAgID4gRml4ZXM6Cj4gICA+IGh0dHBzOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9hYzYwZDI5ZmJjZDlmYjhkZGIyMWI3NmIz
YjE4NWU0NWU1ODBjMDA2Lwo+Cj4gICA+IExpYnRvb2wgMi41LnggaGFzIGJlZW4gcmVsZWFzZWQg
YW5kIGlzIHN0YXJ0aW5nIHRvIGJlIHVzZWQgYnkgdXBzdHJlYW1zIHdoZW4KPiAgID4gZ2VuZXJh
dGluZyByZWxlYXNlIHRhcmJhbGxzIChFLkcuIG9wZW52cG4tMi42LjE0KS4KPgo+ICAgPiBodHRw
czovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL2F1dG90b29scy1hbm5vdW5jZS8yMDI0LTA5
L21zZzAwMDAwLmh0bWwKPgo+ICAgPiBJdCBuZWVkcyB0byBiZSBwYXRjaGVkIHNpbWlsYXIgdG8g
ZWFybGllciB2ZXJzaW9ucywgYW5kIHRoZSBleGlzdGluZyB2Mi40LjQKPiAgID4gcGF0Y2ggbHVj
a2lseSBzdGlsbCBhcHBsaWVzLCBzbyBleHRlbmQgTElCVE9PTF9QQVRDSF9IT09LIHRvIGFsc28g
cGF0Y2gKPiAgID4gMi41LnggdmVyc2lvbnMgd2l0aCB0aGF0Lgo+Cj4gICA+IFNpZ25lZC1vZmYt
Ynk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KPgo+IENvbW1pdHRlZCwg
dGhhbmtzLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
