Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FB2C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 21:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E75383B34;
	Fri, 21 Jun 2024 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMwayNF4Ub_G; Fri, 21 Jun 2024 21:09:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66FA783B45
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66FA783B45;
	Fri, 21 Jun 2024 21:09:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDE7A1BF834
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAA23401E1
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNmLgaHL2qr1 for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 21:09:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61D5E40153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61D5E40153
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61D5E40153
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 21:09:49 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so14605075e9.1
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 14:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719004187; x=1719608987;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bSZtzbmiD5IQFqrOu9sdZ2+HF+1TamHA1ZjJ/pG8/nU=;
 b=LGGUj4XOCLzxXmgY0OcJE8llY7WmhwDroLeJIrED/bk5mU58g7Ter3VJSL4MwP9RBq
 xCGjjI5cM0GDOXiqe8k1RuWFTlu47oxnjd/V2v+oBg2nCYi2Yui9UnGBp/jiDaOghd3y
 TLD0JSC12paw0wzMthK0jGCMGYL2/Qqn9IqLtBnVqu9jEX2WHwW6Q2KVJ2KTSlzSGvCy
 SVgR+UZ1BrnOQyM+qQs4OV+XpTZ+7kHbWtNFTqoufS8ZgRh549d9e5leSxLkRpxpxPCQ
 f+j8Jpm4+R11AJwzRMDI4rsILT84OaZb5pyt7qiZFhMuG3Msx3udycOhPJZoI+lh1kBJ
 aHLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+h51CifKTyungxyoOUBranH4ao7DzXgklthijJy8edGhvgJvFUf2lInxooeZ3/jemfGqCb9Q9QYpNhTcxi0HyZzuEdWB19w==
X-Gm-Message-State: AOJu0Yw73jcg9F6RzzE87jZUo3Gj3sFoquUQsB8RdMzpuYnNHGJsqSN9
 mGm8q6as/GfZu/cvBExweD0C2QDzGutcxdDuQgLojfu7WPHqXw+SEgLnGA4dAoU=
X-Google-Smtp-Source: AGHT+IFV2/bc467XTl7XsqXRTx1QpezRqVRb2BsNM5J/4EWaV5VWzHdawbBktXSgePRWNQ22pMD8ew==
X-Received: by 2002:a05:600c:45d0:b0:421:741d:5c31 with SMTP id
 5b1f17b1804b1-42486346458mr6677495e9.15.1719004187325; 
 Fri, 21 Jun 2024 14:09:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0bea05sm79666815e9.18.2024.06.21.14.09.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jun 2024 14:09:46 -0700 (PDT)
Message-ID: <e72e7d50-c1a1-41a6-aa10-36bddaaac66b@mind.be>
Date: Fri, 21 Jun 2024 23:09:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 buildroot@buildroot.org
References: <20240522144211.464748-1-vincent.stehle@arm.com>
Content-Language: en-GB
In-Reply-To: <20240522144211.464748-1-vincent.stehle@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719004187; x=1719608987; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bSZtzbmiD5IQFqrOu9sdZ2+HF+1TamHA1ZjJ/pG8/nU=;
 b=cSwzmCRWpDB8+4QpqdN/fPRDpY8OtWJaOTh0Gi+WfLDwTtjJZcsfdUSoltKrutTb0D
 rRuuvxYiJ+1JuRDpnrBY7oODP7Ipx9mlRqUen/9AQJTV9ez3KeE2bGOsZIv6dceFdcQc
 CHiqnjUqZYqwh0WxoxQhMdnka0nT283IKA3sUgpSoGmK72I8rJVmQMakEoRD0Npck1qW
 sE+Nb8xmgRsd9C+CAs5R3kSFhKSbxU7InKUPEd5D99eG9tQh6otlwc3S9203spljyYGF
 Slf/Hl6pV5Jg2hc2exNSRUnapIUl4icR6nPJ4Dwwm04w4Joz4p8Ro6Ul1DpdRXJ/KKn9
 qYLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cSwzmCRW
Subject: Re: [Buildroot] [PATCH] configs/arm_foundationv8_defconfig: bump to
 Linux 6.8.10
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMi8wNS8yMDI0IDE2OjQyLCBWaW5jZW50IFN0ZWhsw6kgd3JvdGU6Cj4gLSBCdW1wIExp
bnV4IGtlcm5lbCB0byB2Ni44LjEwLgo+IC0gQnVtcCB0aGUgRlZQIGluIHRoZSByZWFkbWUgdG8g
dmVyc2lvbiAxMS4yNSBidWlsZCAxNS4KCiAgQ291bGQgeW91IHBsZWFzZSBhbHNvIGFkZCBhIGhh
c2ggZmlsZSBmb3IgdGhlIGN1c3RvbSBrZXJuZWwgdmVyc2lvbj8gWW91IGNhbiAKdXNlIHV0aWxz
L2FkZC1jdXN0b20taGFzaGVzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gQ2M6IE1hc2Fo
aXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+Cj4gLS0tCj4gICBib2Fy
ZC9hcm0vZm91bmRhdGlvbi12OC9yZWFkbWUudHh0IHwgMiArLQo+ICAgY29uZmlncy9hcm1fZm91
bmRhdGlvbnY4X2RlZmNvbmZpZyB8IDYgKysrLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvYXJtL2Zv
dW5kYXRpb24tdjgvcmVhZG1lLnR4dCBiL2JvYXJkL2FybS9mb3VuZGF0aW9uLXY4L3JlYWRtZS50
eHQKPiBpbmRleCBjYjBmZTA4Yjg3Li43MDFjZjNjZWIwIDEwMDY0NAo+IC0tLSBhL2JvYXJkL2Fy
bS9mb3VuZGF0aW9uLXY4L3JlYWRtZS50eHQKPiArKysgYi9ib2FyZC9hcm0vZm91bmRhdGlvbi12
OC9yZWFkbWUudHh0Cj4gQEAgLTMsNyArMyw3IEBAIEFSTSBzb2Z0d2FyZSBzaW11bGF0b3Igb2Yg
dGhlIEFBcmNoNjQgYXJjaGl0ZWN0dXJlLgo+ICAgCj4gICBGaXJzdCwgb25lIGhhcyB0byBkb3du
bG9hZCB0aGUgQUFyY2g2NCBzb2Z0d2FyZSBzaW11bGF0b3IgZnJvbToKPiAgIAo+IC0gIGh0dHBz
Oi8vYXJta2VpbC5ibG9iLmNvcmUud2luZG93cy5uZXQvZGV2ZWxvcGVyL0ZpbGVzL2Rvd25sb2Fk
cy9lY29zeXN0ZW0tbW9kZWxzL0ZvdW5kYXRpb25fUGxhdGZvcm1fMTEuMjBfMTVfTGludXg2NC50
Z3oKPiArICBodHRwczovL2RldmVsb3Blci5hcm0uY29tLy0vbWVkaWEvRmlsZXMvZG93bmxvYWRz
L2Vjb3N5c3RlbS1tb2RlbHMvRk1fMTFfMjUvRm91bmRhdGlvbl9QbGF0Zm9ybV8xMS4yNV8xNV9M
aW51eDY0LnRnego+ICAgCj4gICBUaGVuLCB1c2UgdGhlIGFybV9mb3VuZGF0aW9udjhfZGVmY29u
ZmlnIGNvbmZpZ3VyYXRpb24gdG8gYnVpbGQgeW91cgo+ICAgQnVpbGRyb290IHN5c3RlbS4KPiBk
aWZmIC0tZ2l0IGEvY29uZmlncy9hcm1fZm91bmRhdGlvbnY4X2RlZmNvbmZpZyBiL2NvbmZpZ3Mv
YXJtX2ZvdW5kYXRpb252OF9kZWZjb25maWcKPiBpbmRleCAxMDJmZThmZDA5Li5kNTM5ZDBiNzMx
IDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3MvYXJtX2ZvdW5kYXRpb252OF9kZWZjb25maWcKPiArKysg
Yi9jb25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnCj4gQEAgLTEsMTAgKzEsMTAgQEAK
PiAgIEJSMl9hYXJjaDY0PXkKPiAtIyBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCBhIDYu
MSBzZXJpZXMKPiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzE9eQo+
ICsjIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEgNi44IHNlcmllcwo+ICtCUjJfUEFD
S0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfOD15Cj4gICBCUjJfVEFSR0VUX0dFTkVS
SUNfR0VUVFlfUE9SVD0idHR5QU1BMCIKPiAgIEJSMl9MSU5VWF9LRVJORUw9eQo+ICAgQlIyX0xJ
TlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Cj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZF
UlNJT05fVkFMVUU9IjYuMS4xMyIKPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iNi44LjEwIgo+ICAgQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJ
Rz15Cj4gICBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKPiAgIEJSMl9MSU5VWF9LRVJO
RUxfSU5UUkVFX0RUU19OQU1FPSJhcm0vZm91bmRhdGlvbi12OC1naWN2My1wc2NpIgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
