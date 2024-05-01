Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFDFC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 230D080B8F;
	Wed,  1 May 2024 19:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qzz9WLfk4GUd; Wed,  1 May 2024 19:20:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5770F820B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5770F820B8;
	Wed,  1 May 2024 19:20:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C061F1BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA451820B8
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyUomdmXyKJj for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:20:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 049C580B8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 049C580B8F
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 049C580B8F
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:20:39 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41b4ff362a8so66049305e9.0
 for <buildroot@buildroot.org>; Wed, 01 May 2024 12:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714591238; x=1715196038;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PyeQr0ZyR2LhN0uJ4zlBBrZeDxQTAtiI8RQtD0n8iHA=;
 b=lmAWMYK+8Oza/HCYt2GMJg115HkqNacLmTMGiZuwrM6ZNOwSLSdXBgbmdMvHt+gf8A
 JzHRKIjApfIOp8TsX4sepA7Fbo5m9kG8zk8cI/7QbCno6mUfebKES6AAgAfgNmEZ/48A
 eY6lAZJjWWLiT4aXzTTa3l3GZH0/4NsyvyuDxO9r6aoIZGrKKwhGyEDwCu3jNIrkdzak
 CKPd3zDNDeSfSfhsqcuoA9LOnxIw5iJkYCYKuq4fMTxMpPP0wQO7kefnlxGE/SwLlF1K
 aRZr8RDjO5DYZjQfUhmpql4ntSgC/yYSDuRK4INp1piLGPDM4khjV+i7vI4yfOX5qJ8z
 K3SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBA5/wtOjNOkzTS0c8HdvhSZVqIS0uWDdsvJwGXfQX0aSAbD6C+HiVypKTVDtdXL5QTuUFQJ8+Bio12FSic7ZhzJ0IoTgLyw==
X-Gm-Message-State: AOJu0YzRsQZzp96K7yRv3Jg1/6gsvxO27qJvbKZNt5Q0f/6si0kKNg6v
 sIIBOTu96wDQT+lNAvlz9OlulkAj7hMXaa1EGVHMkB1s3Sj0ME1dDra2U3R3S2w=
X-Google-Smtp-Source: AGHT+IHqp9zRWviSaKT1xRGq3t43u2LARphQ0x8sEHZhbFWcLWHCKmMm20snYN6sQeSIXTL2lyXeTA==
X-Received: by 2002:a05:600c:19cd:b0:419:f911:680a with SMTP id
 u13-20020a05600c19cd00b00419f911680amr3215481wmq.1.1714591237822; 
 Wed, 01 May 2024 12:20:37 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c3b9500b0041a9fc2a6b5sm3081961wms.20.2024.05.01.12.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 12:20:37 -0700 (PDT)
Message-ID: <af7d74ed-24e7-447c-acbf-8fc6b7e1a0fc@smile.fr>
Date: Wed, 1 May 2024 21:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>
References: <20240430-optee-update-v1-0-6f73c4903ec3@ti.com>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240430-optee-update-v1-0-6f73c4903ec3@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714591238; x=1715196038;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PyeQr0ZyR2LhN0uJ4zlBBrZeDxQTAtiI8RQtD0n8iHA=;
 b=uQzNft3eYYALAM+1M7JH7cIbJvj0BsIWwprbEacZ+mC3xCO8WHfNO7BC6wVck0VIoN
 yWvOVsUuiZv1I9dA6iuNNkXooW0ypG3gHRCzzOCA8jPTn4PSMWCtZLh1e8kFU4P4Ema8
 OhdEky3Vu7G/NXIAlQEoSpJDNAwAA99C/+rzXgH4jfhtAb0uK+0vZgwPsW9y4KnuqZrw
 2NaAYNVEBDAfz5nFsiuE94gURylVVsNjLQp5zYoewu7SS2N0ZlLrwOxIoVGTdGFVcLGm
 SrW/Xf1iw5yELvBB7+ln1DBJhJpd6fyUfZd1rrsD8JIzZjNhYuMJy5HDYUvM92mKIRil
 9QYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=uQzNft3e
Subject: Re: [Buildroot] [PATCH 00/11] update bsp binaries for TI SoCs
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Bryan Brattlof via buildroot <buildroot@buildroot.org>,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQnJ5YW4sIEFsbCwKCkxlIDAxLzA1LzIwMjQgw6AgMTc6MjcsIEJyeWFuIEJyYXR0bG9m
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBIZWxsbyBldmVyeW9uZSEKPiAKPiBUaGlzIHNl
cmllcyB1cGRhdGVzIGFsbCB0aGUgYm9vdCBiaW5hcmllcyAoVS1Cb290LCBPUC1URUUsIFRGLUEs
IGFuZCAKPiBMaW51eCkgdG8gdGhlaXIgbGF0ZXN0IHZlcnNpb25zIHRvIHB1bGwgaW4gYWxsIGJ1
ZyBmaXhlcyBhbmQgbmV3IAo+IGZlYXR1cmVzIGFkZGl0aW9ucyBpbiB0aGVzZSBwcm9qZWN0cy4K
PiAKPiBUaGlzIGFsc28gaW5jbHVkZXMgYSBwYXRjaCBJIHNlbmQgb3V0IGEgd2hpbGUgYWdvIGp1
c3QgdG8ga2VlcCB0aGluZ3MgCj4gb3JnYW5pemVkLiAKPiAKPiAgIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2J1aWxkcm9vdC8yMDI0MDQwMjE1MzMyOC4xODU5NjQyLTEtYmJAdGkuY29tLwo+IAo+
IGFuZCBmaW5hbGx5IHNvbWUgcHJvb2YgSSBkaWRuJ3QgY29tcGxldGVseSBicmVhayBzb21ldGhp
bmcgOykKPiAKPiAgIGh0dHBzOi8vcGFzdGUuc3IuaHQvfmJyeWFuYi9iNjY2YWRlZjdkYTQxMmRl
NzZlZmI1ZTRhNjhlNjhlMDY1MWY3OTI4CgpXZSByZWNlaXZlZCBvbmx5IHBhdGNoIFs0LzExXSBi
b290L3RpLWszLWJvb3QtZmlybXdhcmU6IGJ1bXAgdG8gbGF0ZXN0IHZlcnNpb24KCkNhbiB5b3Ug
dHJ5IHRvIHJlc2VuZCB0aGUgc2VyaWVzPwoKTm90ZTogSXQgd291bGQgYmUgYmV0dGVyIHRvIHVz
ZSAiYm9vdC90aS1rMy1ib290LWZpcm13YXJlOiBidW1wIHRvIHZlcnNpb24KMDkuMDIuMDAuMDA5
IgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFRoYW5rcyBmb3IgcmV2aWV3aW5nCj4gfkJy
eWFuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJ5YW4gQnJhdHRsb2YgPGJiQHRpLmNvbT4KPiAtLS0K
PiBCcnlhbiBCcmF0dGxvZiAoMTApOgo+ICAgICAgIGJvb3Qvb3B0ZWUtb3M6IGJ1bXAgdG8gcmVs
ZWFzZSB2NC4yLjAKPiAgICAgICBib290L3Vib290OiBidW1wIHRvIGxhdGVzdCB2MjAyNC4wNCBy
ZWxlYXNlIG9mIFUtQm9vdAo+ICAgICAgIGJvb3QvdGktazMtcjUtbG9hZGVyOiBidW1wIHRvIGxh
dGVzdCBVLUJvb3QgcmVsZWFzZQo+ICAgICAgIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmln
OiB1cGRhdGUgVEZBIHRvIGxhdGVzdCBsdHMgcmVsZWFzZQo+ICAgICAgIGNvbmZpZ3MvdGlfYW02
NHhfc2tfZGVmY29uZmlnOiB1cGRhdGUgVEZBIHRvIGxhdGVzdCBsdHMgcmVsZWFzZQo+ICAgICAg
IGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnOiB1cGRhdGUgdWJvb3QgdG8gbGF0ZXN0IHJl
bGVhc2UKPiAgICAgICBjb25maWdzL3RpX2FtNjR4X3NrX2RlZmNvbmZpZzogdXBkYXRlIHVib290
IHRvIGxhdGVzdCByZWxlYXNlCj4gICAgICAgY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWc6
IHVwZGF0ZSB0byBsYXRlc3Qga2VybmVsCj4gICAgICAgY29uZmlncy90aV9hbTY0eF9za19kZWZj
b25maWc6IHVwZGF0ZSB0byBsYXRlc3Qga2VybmVsCj4gICAgICAgREVWRUxPUEVSUzogYWRkIG15
c2VsZiB0byBUSSdzIHBhY2thZ2VzIGFuZCByZWZlcmVuY2UgYm9hcmRzCj4gCj4gQnJ5YW4gQnJh
dHRsb2YgdmlhIGJ1aWxkcm9vdCAoMSk6Cj4gICAgICAgYm9vdC90aS1rMy1ib290LWZpcm13YXJl
OiBidW1wIHRvIGxhdGVzdCB2ZXJzaW9uCj4gCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA4ICsrKysrKysrCj4gIC4u
Li9wYXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2gg
ICAgICAgfCAyICstCj4gIGJvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFz
aCAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gIC4uLi9wYXRjaGVzL2FybS10cnVzdGVk
LWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2ggICAgICAgfCAyICstCj4gIGJvYXJk
L3RpL2FtNjR4LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFzaCAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstCj4gIGJvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KPiAgYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5o
YXNoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQo+ICBib290
L3RpLWszLWJvb3QtZmlybXdhcmUvdGktazMtYm9vdC1maXJtd2FyZS5oYXNoICAgICAgICAgICAg
ICAgIHwgMiArLQo+ICBib290L3RpLWszLWJvb3QtZmlybXdhcmUvdGktazMtYm9vdC1maXJtd2Fy
ZS5tayAgICAgICAgICAgICAgICAgIHwgNCArLS0tCj4gIGJvb3QvdGktazMtcjUtbG9hZGVyL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KPiAgYm9v
dC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2ggICAgICAgICAgICAgICAgICAg
ICAgICB8IDIgKy0KPiAgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBib290L3Vib290L0NvbmZpZy5pbiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNiArKystLS0KPiAgYm9v
dC91Ym9vdC91Ym9vdC5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDIgKy0KPiAgY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDkgKysrKy0tLS0tCj4gIGNvbmZpZ3MvdGlfYW02NHhf
c2tfZGVmY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA5ICsrKyst
LS0tLQo+ICAxNiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMo
LSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogMzllZDYwMjE2OWVjZjc2NzczMjhkMTM4N2QzMDg2OWJh
ZWIyOGNlYQo+IGNoYW5nZS1pZDogMjAyNDA0MzAtb3B0ZWUtdXBkYXRlLWI5YzFiYzRlOWYyOQo+
IAo+IEJlc3QgcmVnYXJkcywKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
