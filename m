Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF93C0219E
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B607427AE;
	Sat,  8 Feb 2025 14:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYdJW0jyWZ6x; Sat,  8 Feb 2025 14:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE0C1427BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE0C1427BA;
	Sat,  8 Feb 2025 14:42:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 926956C
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80FE76075F
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veU54nwMTFxW for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:42:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5062F60756
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5062F60756
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5062F60756
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:42:57 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38dc9eba8a1so1307708f8f.1
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 06:42:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739025775; x=1739630575;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BB2j+YCVGCjw6S9T9yjJnWsCGL00nhZJAjLxQVkUj/I=;
 b=FOB2VgSDfusoVH752bKUGLQZPM9jXqhrAsTAHjD+CD43oLvO+npchO0eDLMy9nRDYO
 56NJ9cwUKZbrtV4rg7Cb9EQEQVUVJaf5tKSzvOwJnCjeYudlzWLH5ePrLkoRApdBIFoa
 QCfOfvHgjbhgq55KWD1aYm/JDCekkmBXkNa+2ux3txbtFSqhrGU7qYh6EzqJY3Buk8ab
 3Iud6e9GNCvpVxaMzW2i+RxvBCexMcvfungvX9X50vgq0l0OUsMIUoaD3N4EvIzeoZ+G
 gdES+G/Z1LvxxvR8sFrNvBz2A5Nj+mUlkG8r9zJBxexwV1xJTdiwVD1zZX94AXF4d//P
 F73Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRUmcxrWxB8lP8SQMbPe5iZu52qmpgyu1s5ko+6Fz3w5hemxXO/t/bqGXH+KPIAsBnjmiVzwIGQnM=@buildroot.org
X-Gm-Message-State: AOJu0YxL/a51VlOFm1Muou1xTh7uI+Pzq5BX69/XQaSDd0bVtqjAcDSz
 j4bLySndHPDa/+oYe9yzdAQBngfmH7NWtzrD04WsZOColso3QKnf+0n6VL6W0fQq0o+oV9HaegW
 z
X-Gm-Gg: ASbGncs6+/d+Z5N2lIKtwdWjdhF1diPhvDFccuVeJEHf7zRs+OXao9iZhvGSno22I+2
 Fc4gazyTiJ5omqa2JRI7TrF+3Crm6mrazj9AWs1fRAeOadQGAx7SUnc+LmNRPFZsCJoTb3JaXDs
 tHXnk5n9gOcAtDyI6QqR/DMUDjRleZSwdy5yNNSwnQw7Dnge6KUIQTB6FsfDE6WkTcsAqh5bWxr
 7WEI/OvKBA0fja2aRq1k+kTdudyQALagTTQ/UjgeGdhjoADFrA10VEdHB18n8vlAACWbQbeHwc7
 vmRqZCnhF4CDjqzMt+wP1XJce2hYm7XCXlC2naq7gXoNAmpgcfxbBvTfy//wMlJazaNdDliIOkr
 DeIO/r9aPnnZn3eoZe+b/HvK8HYNQpi5DIFYIlmTZQEVYxFNptHI=
X-Google-Smtp-Source: AGHT+IFR/eMVva8k/Qxc9DOSTPBuaG214OJ+3mwNxNRV5IGIVwSbwt63jrxVGVpFtPJIcL8WG7lgkQ==
X-Received: by 2002:a5d:6c66:0:b0:38c:2745:2dd8 with SMTP id
 ffacd0b85a97d-38dc9138771mr4678222f8f.37.1739025775242; 
 Sat, 08 Feb 2025 06:42:55 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcd8213f2sm4032178f8f.67.2025.02.08.06.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Feb 2025 06:42:55 -0800 (PST)
Message-ID: <64102577-a1d6-487c-ad3d-38731674d22f@smile.fr>
Date: Sat, 8 Feb 2025 15:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexander Shirokov <shirokovalexs@gmail.com>, buildroot@buildroot.org
References: <20241208134004.143901-1-shirokovalexs@gmail.com>
 <20250208140129.166061-1-shirokovalexs@gmail.com>
Content-Language: en-US
In-Reply-To: <20250208140129.166061-1-shirokovalexs@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739025775; x=1739630575; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BB2j+YCVGCjw6S9T9yjJnWsCGL00nhZJAjLxQVkUj/I=;
 b=dQpfN5svjX4ewLsqhche2DUdRPPcV2Mepo+0lDczvZoQkDF9Vt9qOUirm7FwuV/3dy
 BZcGdY1OE5jVN/JSPApwe8/vf+Q0V8lsK373ZlGu03FwPrNivoOTUfZOv5VI/c1v2yyo
 06TCrMw5V+BiaNBK0mSkmWYbgMPSnRnCF2tek=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=dQpfN5sv
Subject: Re: [Buildroot] [PATCH 1/1] package/rust-coreutils:new package
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

SGVsbG8gQWxleGFuZGVyLCBBbGwsCgpMZSAwOC8wMi8yMDI1IMOgIDE1OjAxLCBBbGV4YW5kZXIg
U2hpcm9rb3YgYSDDqWNyaXTCoDoKPiBIZWxsbyBSb21haW4sCj4gCj4gVGhhbmsgeW91IGZvciB5
b3VyIGFuc3dlcgo+IAo+PiBUaGVyZSB3YXMgYSBwcmV2aW91cyBhdHRlbXB0IGxhc3QgeWVhciB0
byBpbnRyb2R1Y2UgdXV0aWxzLWNvcmV1dGlscyBwYWNrYWdlCj4+IGJ1dCBUaG9tYXMgcmVwb3J0
ZWQgc29tZSBpc3N1ZXMgb24gQVJNIHRhcmdldHMgWzFdLiBDYW4geW91IGNoZWNrIGlmIHRoZXkg
d2VyZQo+PiBmaXhlZCBzaW5jZSB0aGVuPwo+IAo+IFN1cmUsIEknbGwgdGFrZSBhIGxvb2sgYXQg
dGhlIHByZXZpb3VzIGF0dGVtcHQgYW5kIHRyeSB0byBidWlsZCBmb3IgQVJNIHRhcmdldHMuCj4g
QW55IHNwZWNpZmljIHJlY29tbWVuZGF0aW9ucyBvbiB3aGljaCB0YXJnZXRzIHRvIGNoZWNrPwo+
IAo+IEEgZmV3IG1vcmUgd29yZHMgYWJvdXQgdGhlIEFSTSBidWlsZDogSSB1c2VkICd0ZXN0LXBr
ZycgZm9yIGEgcXVpY2sgdGVzdCBvZiBteQo+IGNoYW5nZXMKPiAKPiAuL3V0aWxzL3Rlc3QtcGtn
ICAtcCBydXN0LWNvcmV1dGlscwo+ICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1hcm12NS11
Y2xpYmMgWzEvNl06IFNLSVBQRUQKPiAgICAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY3
LWdsaWJjIFsyLzZdOiBPSwo+ICAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY3bS11Y2xp
YmMgWzMvNl06IFNLSVBQRUQKPiAgICAgICAgICAgICAgICAgICAgICBib290bGluLXg4Ni02NC1t
dXNsIFs0LzZdOiBPSwo+ICAgICAgICAgICAgICAgICAgICAgICBici1hcm0tZnVsbC1zdGF0aWMg
WzUvNl06IFNLSVBQRUQKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFybS1hYXJjaDY0
IFs2LzZdOiBPSwo+IDYgYnVpbGRzLCAzIHNraXBwZWQsIDAgYnVpbGQgZmFpbGVkLCAwIGxlZ2Fs
LWluZm8gZmFpbGVkLCAwIHNob3ctaW5mbyBmYWlsZWQKPiAKPiBhcm12NyBhbmQgYWFyY2g2NCBz
ZWVtIGZpbmUuIGFybXY1IHdhcyBza2lwcGVkLCBidXQgSSBjYW4gdHJ5IGl0IGFzIHdlbGwKCldo
ZW4gSSBzYXcgeW91ciBjb250cmlidXRpb24sIEkgcmVtZW1iZXJlZCB0aGUgYnVpbGQgaXNzdWUg
cmVwb3J0ZWQgYnkgVGhvbWFzCnNvbWUgdGltZSBhZ28uCkkgZG9uJ3QgcmVtZW1iZXIgdGhlIGRl
dGFpbHMgYnV0IGl0IHdvdWxkIGJlIGdyZWF0IHRvIGNoZWNrIGlmIHRoZSBpc3N1ZSBjYW4gYmUK
cmVwcm9kdWNlZCBvciBub3QuCgo+IAo+PiBOb3RlOiBXZSB0cnkgdG8ga2VlcCB0aGUgdXBzdHJl
YW0gcHJvamVjdCBuYW1lIHRvIG5hbWUgdGhlIEJ1aWxkcm9vdCBwYWNrYWdlCj4gCj4gSSBhbHNv
IGhhZCBzb21lIGRvdWJ0cyBhYm91dCB0aGUgbmFtaW5nIDopIEknbGwgZml4LiBUaGFuayB5b3Uu
Cj4gCj4+IEFsc28gd2Ugc2hvdWxkIHRha2UgY2FyZSB3aGVuIHNldmVyYWwgImNvcmV1dGlscyIg
cHJvdmlkZXIgaXMgc2VsZWN0ZWQgdG8KPj4gYXZvaWQgYW55IGJpbmFyaWVzIG92ZXJyaWRlLgo+
IAo+IEFncmVlLiBCdXQgbXkgaW5pdGlhbCBpZGVhIGhlcmUgd2FzIHRvIGFkZCB1dXRpbHMtY29y
ZXV0aWxzIGluIHNldmVyYWwgc3RlcHMuCj4gCj4gVGhlIGZpcnN0IHN0ZXAgaXMgdG8gYWRkIGEg
c2luZ2xlIGJpbmFyeSAocG9zc2libHkgd2l0aCBhIHJlbmFtZSwgZm9yIGV4YW1wbGUsCj4gdXVf
Y29yZXV0aWxzKS4gVGhpcyB3aWxsIGFsbG93IHVzIHRvIGRlbGl2ZXIsIGRlYnVnLCBhbmQgY29t
cGFyZQo+IHV1dGlscy1jb3JldXRpbHMgd2l0aCBvdGhlciBpbXBsZW1lbnRhdGlvbnMgd2l0aCBu
byBvciBtaW5pbWFsIGNvbmZsaWN0cy4gVGhpcwo+IHN0ZXAgaXMgbW9zdGx5IGZvciBkZXZlbG9w
bWVudCwgY29sbGVjdGluZyBzdGF0aXN0aWNzLCBhbmQgaW1wcm92aW5nCj4gdXV0aWxzLWNvcmV1
dGlscy4KPiAKPiBUaGUgc2Vjb25kIHN0ZXAgaXMgYWRkaW5nIHRoZSBhYmlsaXR5IHRvIHJlcGxh
Y2UgY29yZXV0aWxzIHdpdGgKPiB1dXRpbHMtY29yZXV0aWxzLiBUaGlzIGlzIGEgZ29vZCBwbGFj
ZSB0byBhZGQgcHJvdmlkZXJzLCBmbGFncyBmb3Igc3dpdGNoaW5nCj4gYmV0d2VlbiBzaW5nbGUv
bXVsdGkgYmluYXJpZXMsIGFuZCBzbyBvbi4KPiAKPiBBbnl3YXksIGl0J3MganVzdCBteSBpbml0
aWFsIGlkZWEuIElmIGEgYmV0dGVyIG9uZSBleGlzdHMsIHdlIGNhbiBkaXNjdXNzIGl0IGFuZAo+
IGNvbnNpZGVyIGFub3RoZXIgc29sdXRpb24uCgpUaGlzIGRlc2VydmUgYW4gZXhwbGFuYXRpb24g
aW4gdGhlIGNvbW1pdCBsb2cgSSBndWVzcy4gQnV0IHVzZXJzIHNlbGVjdGluZyB0aGlzCnBhY2th
Z2Ugd2lsbCBleHBlY3QgdGhhdCB0aGUgcnVzdCB2YXJpYW50IGlzIHVzZWQgYnkgZGVmYXVsdC4K
ClNlZSBzaW1pbGFyIGhhbmRsaW5nIGJldHdlZW4gYnVzeWJveCBhbmQgY29yZXV0aWxzLgoKPiAK
Pj4gQ2FuIHlvdSBhZG9wdCB0aGUgcGF0Y2ggWzFdIGFuZCBhZGRyZXNzIHRoZSByZW1haW5pbmcg
aXNzdWVzPwo+IAo+IFN1cmUuIEknbGwgdGFrZSBhIGxvb2sgYXQgWzFdIGFuZCB0aGUgcmVtYWlu
aW5nIGlzc3Vlcy4KClRoYW5rcyEKCj4gCj4+IEFsc28gaGF2aW5nIGEgcnVudGltZSB0ZXN0IHdv
dWxkIGJlIGdyZWF0Lgo+IAo+IFJvbWFpbiwgc29ycnksIEknbSBub3Qgc3VyZSBJIGZ1bGx5IHVu
ZGVyc3RhbmQgeW91LiBDb3VsZCB5b3UgcGxlYXNlIGNsYXJpZnkKPiB3aGF0IHlvdSBtZWFuIGJ5
ICJoYXZpbmcgYSBydW50aW1lIHRlc3QiPwo+IAo+IEFyZSB5b3UgcmVmZXJyaW5nIHRvIHJ1bm5p
bmcgdXV0aWxzLWNvcmV1dGlscyBvbiB0YXJnZXQgZGV2aWNlcz8gT3IgYWRkaW5nIHRoZQo+IGFi
aWxpdHkgdG8gaW5jbHVkZSB1bml0IHRlc3RzIGluIGFuIGltYWdlIHRvIHJ1biBvbiB0YXJnZXQg
ZGV2aWNlcz8gT3Igc29tZXRoaW5nCj4gZWxzZT8KCkJ1aWxkcm9vdCB1c2VzIGEgdGVzdHN1aXRl
IHRvIHBlcmZvcm0gc29tZSBydW50aW1lIHRlc3RpbmcgdXNpbmcgUWVtdS4KClNlZToKaHR0cHM6
Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjX3VzaW5nX3RoZV9y
dW50aW1lX3Rlc3RzX2ZyYW1ld29yawoKSGVyZSBhbiBleGFtcGxlIG9mIHRoZSB0ZXN0c3VpdGUg
cmVzdWx0OgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9waXBl
bGluZXMvMTY1MjMyMDE4My9mYWlsdXJlcwoKKHRlc3RzLnBhY2thZ2UudGVzdF9ydXN0LlRlc3RS
dXN0VmVuZG9yaW5nKQpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9qb2JzLzkwMTkxNzM4MjIKCkl0J3Mgbm90IG1hbmRhdG9yeSBidXQgaGlnaGx5IHJlY29tbWVu
ZGVkLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFRoYW5rIHlvdQo+IAo+IEJlc3QgcmVn
YXJkcywKPiBBbGV4YW5kZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
