Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E7EC0218D
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 00:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27138405E6;
	Mon, 27 Jan 2025 00:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-OMBSe536C3; Mon, 27 Jan 2025 00:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF9D3405DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF9D3405DF;
	Mon, 27 Jan 2025 00:10:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64CB971F
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 00:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CB5F405FB
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 00:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsGNt6j7jB5K for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 00:10:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5EBD840204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EBD840204
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EBD840204
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 00:10:05 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2166f1e589cso99402015ad.3
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 16:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737936604; x=1738541404;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qaaKhnMKJ4OJJUvK/jAOnO1I9MpNrQwQRUMs5IHlUuw=;
 b=CSSOzEbvF0q01RtTmhGPe6cJbCkOOwnXJCoRWtUe11KgPYC5NLGy49ge9G+wbhlbU3
 Z58FTri/ozjUxHV8S/d86i/FAGd0M0HktwcUB23gTAPnCwpwZERqT/Rn7GHzf15mPx4+
 /oYGSvC5d0Nhze09cxz0X4xaMoTVv7F37VN6k9t+/B9dFbls7Pi10YStY3LkU9zfk936
 QcJbKtsBaSFZsU7wQ5aa25mEisLU+evGJyc4E++A/ej3NqHM/x0tHa+Z69Fyc2eJEmhA
 jcaphxII7ox36Xsirj8OWD6C2/9y4DVWswJc8xcq3ikHN2uPkhX+SKSLOMEtVmxU2EN5
 TnHA==
X-Gm-Message-State: AOJu0YwK/9jqJbd8Ve3AKQGk6UWndZadXrs0DigIk/4HFCDXk809hRdt
 34Dy2nsxm2fWn+3pAVNFlxTOmVPrlEPn1IHMVHvAAeHzT4h/+XzM//DV0w==
X-Gm-Gg: ASbGncux8IcrJZUvZsh0HJLaQxX6WNffBwQEwUZfzniNEXuXkQKegd0vUUMU+Jd7ieI
 tVy/wBryRDYTIU48Afrz9pTXaEnIzE0tDX0Zxf4cm4kMN0HR8xsFzqsct70TjtX78zYks8/7Y6u
 qKFT89J/rGk1APP4E5fGMYrJgyCHlH3ULr9m+4GmWOuKb7v+fJkjHVgwVcmH/qDa4AjtNq088vm
 BYR3sEa7+QTYomDdCvNnEcBRjXlwoycAcuYQB0mAxR1lKPKSEdnSGHh3DGVLtxt6WIGiP73BmA8
 3TTyTOuP7BcaYvqKwvexCUQL
X-Google-Smtp-Source: AGHT+IG9WarORnC2yXZdGfr3MYxj6Es5znDZ7UygR+zabgpEctRhU5VqeSzf02ZKJu1oHGy43kRtcg==
X-Received: by 2002:a17:903:2291:b0:215:6816:6345 with SMTP id
 d9443c01a7336-21c355c4292mr603533595ad.16.1737936603850; 
 Sun, 26 Jan 2025 16:10:03 -0800 (PST)
Received: from [192.168.10.205] ([199.119.84.5])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac496bbd9e7sm5076684a12.65.2025.01.26.16.10.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 16:10:03 -0800 (PST)
Message-ID: <c76fd0e7-b375-43b5-813f-f7e78b180447@gmail.com>
Date: Sun, 26 Jan 2025 17:10:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20250126225438.856283-1-tobias@waldekranz.com>
From: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <20250126225438.856283-1-tobias@waldekranz.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737936604; x=1738541404; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qaaKhnMKJ4OJJUvK/jAOnO1I9MpNrQwQRUMs5IHlUuw=;
 b=cIcnjPHJK/19n4v2SHgYh5Tof8n5m+oJMIM2Cdem90sM5kwGD7+mAhl6YqMiGj8Kwt
 mNXkWNnXsS2+n+BhQ8/M9mlP7R6sy4hy6+HCraWYSToxxRG8MvOEJ81bo9MrRFJt6643
 Bs6fMt7mhcm0NgLU8eN7Vvnt4qat3HbOaUsUaMl2gELqTkuqFo7la5ylUcLcNMCZTQGO
 ay7LJF/7Cn5hUwjyx/Pb4EFNqzi0LQzPUBD15kzLvN2Dejy5Bs6O/LcDu8roknCAE86V
 w38kYUWqSuZfvTjPOEI+6kp9Vyrzlqf/0KjQrbjyFPBYaMU2vXgUNXquBNAb7MaGbhGA
 vX0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cIcnjPHJ
Subject: Re: [Buildroot] [PATCH] support/scripts/fix-rpath: Reduce overhead
 of parallelization
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

VGhpcyBsb29rcyBuaWZ0eS4gV2FzIHRoZXJlIGEgY2hhbmdlIHByZWNlZGluZyB0aGlzIHRoYXQg
Y2F1c2VkIGl0IHRvIAp0YWtlIGxvbmdlcj/CoCBJIHdhcyBub3RpY2luZyB0aGlzIHBhcnQgb2Yg
dGhlIHByb2Nlc3MgdGFrZXMgYSBtaW51dGUgb3IgCnR3byBmb3IgbXkgcHJvamVjdC4KCkxhbmNl
CgpPbiAxLzI2LzIwMjUgMzo1MyBQTSwgVG9iaWFzIFdhbGRla3Jhbnogd3JvdGU6Cj4gUmF0aGVy
IHRoYW4gZm9yaytleGVjOmluZyBhIHdob2xlIGJhc2ggcHJvY2VzcyBmb3IgZXZlcnkgZmlsZSBv
Zgo+IGludGVyZXN0LCBzcGxpdCB1cCB0aGUgd29yayBpbnRvICR7UEFSQUxMRUxfSk9CU30gc2Vw
YXJhdGUgZmlsZSBsaXN0cywKPiBhbmQgdGhlbiBmb3JrIG9mZiBhIHNpbmdsZSB3b3JrZXIgcGVy
IGxpc3QuCj4KPiBTaW5jZSB3b3JrZXJzIG5vdyBydW4gaW4gYSBmb3JrLCB3ZSBhbHNvIGRvbid0
IGhhdmUgdG8gcmUtcGFyc2UgdGhlCj4gYXJndW1lbnRzIG9uIGV2ZXJ5IGNhbGwgdG8gcGF0Y2hf
ZmlsZSgpLgo+Cj4gSW4gdGhlIHdvcmtlciwgd2UgYWxzbyBhZGQgYSBsb3ctb3ZlcmhlYWQgY2hl
Y2sgZm9yIHRoZSBFTEYgbWFnaWMsCj4gd2hpY2ggYWxsb3dzIHVzIHRvIHNraXAgYWxsIG5vbi1F
TEZzIHdpdGhvdXQgaGF2aW5nIHRvIGZvcmsgb2ZmCj4gYWRkaXRpb25hbCBwcm9jZXNzZXMuIElu
IHRoZSBldmVudCB0aGF0IHdlIGVuY291bnRlciBhbiBpbnZhbGlkIEVMRiwKPiB0aGF0IGlzIHN0
aWxsIHRha2VuIGNhcmUgb2YgYnkgdGhlIGV4aXN0aW5nIGV4aXRjb2RlLXRlc3QgaW4KPiBwYXRj
aF9maWxlKCkuCj4KPiBPbiBhIDQtY29yZS84LXRocmVhZCBib3gsIHRoaXMgY3V0cyBkb3duIHRo
ZSB0aW1lIGl0IHRha2VzIHRvIGZpeCB0aGUKPiBSUEFUSFMgaW4gdGhlIGhvc3QgZGlyZWN0b3J5
IGZyb20gYXJvdW5kIDI1cyB0byAxLjVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogVG9iaWFzIFdhbGRl
a3JhbnogPHRvYmlhc0B3YWxkZWtyYW56LmNvbT4KPiAtLS0KPiAgIHN1cHBvcnQvc2NyaXB0cy9m
aXgtcnBhdGggfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9zdXBwb3J0L3NjcmlwdHMvZml4LXJwYXRoIGIvc3VwcG9ydC9zY3JpcHRzL2Zp
eC1ycGF0aAo+IGluZGV4IGQzNDIxNTA0YTUuLjA2YTM2Mzc0NDAgMTAwNzU1Cj4gLS0tIGEvc3Vw
cG9ydC9zY3JpcHRzL2ZpeC1ycGF0aAo+ICsrKyBiL3N1cHBvcnQvc2NyaXB0cy9maXgtcnBhdGgK
PiBAQCAtNjAsMTUgKzYwLDExIEBAIEhPU1RfRVhDTFVERVBBVEhTPSIvc2hhcmUvdGVybWluZm8i
Cj4gICBTVEFHSU5HX0VYQ0xVREVQQVRIUz0iL3Vzci9pbmNsdWRlIC91c3Ivc2hhcmUvdGVybWlu
Zm8iCj4gICBUQVJHRVRfRVhDTFVERVBBVEhTPSIvbGliL2Zpcm13YXJlIgo+ICAgCj4gLXBhdGNo
X2ZpbGUoKSB7Cj4gLSAgICBsb2NhbCBQQVRDSEVMRiByb290ZGlyIGZpbGUKPiAtICAgIGxvY2Fs
IC1hIHNhbml0aXplX2V4dHJhX2FyZ3MKPiArZGVjbGFyZSAtYSBzYW5pdGl6ZV9leHRyYV9hcmdz
Cj4gK3Jvb3RkaXI9Cj4gICAKPiAtICAgIFBBVENIRUxGPSIkezF9Igo+IC0gICAgcm9vdGRpcj0i
JHsyfSIKPiAtICAgIGZpbGU9IiR7M30iCj4gLSAgICBzaGlmdCAzCj4gLSAgICBzYW5pdGl6ZV9l
eHRyYV9hcmdzPSgiJHtAfSIpCj4gK3BhdGNoX2ZpbGUoKSB7Cj4gKyAgICBsb2NhbCBmaWxlPSIk
ezF9Igo+ICAgCj4gICAgICAgIyBjaGVjayBpZiBpdCdzIGFuIEVMRiBmaWxlCj4gICAgICAgcnBh
dGg9IiQoIiR7UEFUQ0hFTEZ9IiAtLXByaW50LXJwYXRoICIke2ZpbGV9IiAyPiYxKSIKPiBAQCAt
OTcsOSArOTMsMjEgQEAgcGF0Y2hfZmlsZSgpIHsKPiAgICAgICB0ZXN0ICIke2NoYW5nZWR9IiAh
PSAiIiAmJiBjaG1vZCB1LXcgIiR7ZmlsZX0iCj4gICB9Cj4gICAKPiArcGF0Y2hfZmlsZXMoKSB7
Cj4gKyAgICB3aGlsZSByZWFkIC1kICQnXDAnIGZpbGU7IGRvCj4gKwkjIGZvciBwZXJmb3JtYW5j
ZSByZWFzb25zLCB3ZSB3YW50IHRvIGRvIGFzIGxpdHRsZSB3b3JrIGFzCj4gKwkjIHBvc3NpYmxl
IG9uIG5vbi1FTEYgZmlsZXMuIHRoZXJlZm9yZSwgbWFrZSBzdXJlIHRoYXQgdGhlCj4gKwkjIGZp
bGUgYXQgbGVhc3Qgc3RhcnRzIHdpdGggdGhlIEVMRiBtYWdpYyBiZWZvcmUgaGFuZGluZyBpdCBv
Zgo+ICsJIyB0byBwYXRjaGVsZiwgd2hpY2ggd2lsbCB0aGVuIHBlcmZvcm0gdGhlIHByb3BlciB2
YWxpZGF0aW9uLgo+ICsJcmVhZCAtbjQgbWFnaWMgPCIke2ZpbGV9IiAmJiB0ZXN0ICIke21hZ2lj
fSIgIT0gJCdceDdmRUxGJyAmJiBjb250aW51ZQo+ICsKPiArCXBhdGNoX2ZpbGUgIiR7ZmlsZX0i
Cj4gKyAgICBkb25lCj4gK30KPiArCj4gICBtYWluKCkgewo+IC0gICAgbG9jYWwgcm9vdGRpciB0
cmVlCj4gLSAgICBsb2NhbCAtYSBmaW5kX2FyZ3Mgc2FuaXRpemVfZXh0cmFfYXJncwo+ICsgICAg
bG9jYWwgdHJlZQo+ICsgICAgbG9jYWwgLWEgZmluZF9hcmdzCj4gICAKPiAgICAgICB0cmVlPSIk
ezF9Igo+ICAgCj4gQEAgLTE2MiwxNCArMTcwLDE4IEBAIG1haW4oKSB7Cj4gICAgICAgICAgICAg
ICA7Owo+ICAgICAgIGVzYWMKPiAgIAo+IC0gICAgZmluZF9hcmdzKz0oICItdHlwZSIgImYiICIt
cHJpbnQwIiApCj4gKyAgICB3b3JrPSQobWt0ZW1wIC0tdG1wZGlyIC1kIGZpeC1ycGF0aC5YWFhY
WFhYWCkKPiAgIAo+IC0gICAgZXhwb3J0IC1mIHBhdGNoX2ZpbGUKPiAtICAgICMgTGltaXQgdGhl
IG51bWJlciBvZiBjb3JlcyB1c2VkCj4gLSAgICAjIHNoZWxsY2hlY2sgZGlzYWJsZT1TQzIwMTYg
ICMgJHtAfSBoYXMgdG8gYmUgZXhwYW5kZWQgaW4gdGhlIHN1Yi1zaGVsbC4KPiArICAgIGZpbmRf
YXJncys9KCAiLXR5cGUiICJmIiAiLXByaW50MCIgKQo+ICAgICAgIGZpbmQgIiR7cm9vdGRpcn0i
ICIke2ZpbmRfYXJnc1tAXX0iIFwKPiAtICAgIHwgeGFyZ3MgLTAgLXIgLVAgIiR7UEFSQUxMRUxf
Sk9CUzotMX0iIC1JIHt9IFwKPiAtICAgICAgICAgICAgYmFzaCAtYyAncGF0Y2hfZmlsZSAiJHtA
fSInIF8gIiR7UEFUQ0hFTEZ9IiAiJHtyb290ZGlyfSIge30gIiR7c2FuaXRpemVfZXh0cmFfYXJn
c1tAXX0iCj4gKyAgICB8IHNwbGl0IC10ICdcMCcgLWE0IC1kIC1uICJyLyR7UEFSQUxMRUxfSk9C
UzotMX0iICItIiAiJHt3b3JrfS9wYXJ0Igo+ICsKPiArICAgIGZvciBwYXJ0IGluICIke3dvcmt9
L3BhcnQiKjsgZG8KPiArCXBhdGNoX2ZpbGVzIDwiJHtwYXJ0fSIgJgo+ICsgICAgZG9uZQo+ICsg
ICAgd2FpdAo+ICsKPiArICAgIHJtIC1yZiAiJHt3b3JrfSIKPiAgIAo+ICAgICAgICMgUmVzdG9y
ZSBwYXRjaGVkIHBhdGNoZWxmIHV0aWxpdHkKPiAgICAgICB0ZXN0ICIke3RyZWV9IiA9ICJob3N0
IiAmJiBtdiAiJHtQQVRDSEVMRn0uX190b19iZV9wYXRjaGVkIiAiJHtQQVRDSEVMRn0iCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
