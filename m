Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE09DC87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 17:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C65A60C0E;
	Sat,  9 Aug 2025 17:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mhjmUxZEiJD; Sat,  9 Aug 2025 17:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4E2960A44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4E2960A44;
	Sat,  9 Aug 2025 17:18:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5050C1D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36C1C405F5
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nuuEEEKRsIq for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 17:18:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5604D407FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5604D407FC
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5604D407FC
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:18:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-459e39ee7ccso30263215e9.2
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 10:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754759880; x=1755364680;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VWFggot0rZG4a7wZyYiuSiCjz2jWeJq9pG4QIcJ8w6U=;
 b=nQzlWDqSZyMWqyv6oPj/oLE8MAKejiTesU3OWyH1eylsX0Arne6zrTWTK/TcXvWpAw
 IJpegeFQ4rECS5Mmg15FS+xTlzFaAfz034Ory4QPKdNsSB5YqDoUBmcYj4h8j8osMGRE
 wiQIraVbHZt6h63rkJGNrDhoEdYUDBcm1qBEeGABDLrrcBb3vTBf5yJkFJTbei+O5BlH
 5JPic3iJghYmfduxyxdaiGRMgNavXVpVJyE8AMOcGHORpkL4YQHletmRo66QLTxH3hbZ
 zp3KmS7vechLUTHLRz5qCkqhmhld7F+yCz3s/TCHonp93ps5NAkXoYqbgoTsMtxqj6gm
 qmGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVDZzYOGZpWiYjyJd39EutY7YUmjynHxLiPCvf37yK8ukISiUPMYmVucxw46GqlXlFrJMJ4CDXORE=@buildroot.org
X-Gm-Message-State: AOJu0Yz42mhNdSwZGnRPzwK1wqrtQix+Q3sCz+ScGvVeIb9331wNXC8q
 VF3k0xi1m8N8Ysd4PD2Qh4rWWiHLxst4RWzKICDEy8h6N17nvrF1jFFiagZRwxcI000=
X-Gm-Gg: ASbGncujjKqq5WxbaW+CnN1G3BdLhlK6bLT1sq2mSEcwAjfwAozYlFW2WZrSzOlSsaw
 hsJv+cGXuZwBbez73MjI+fCR+WiCs3Fu2zQ2aPNR/aa//1z0I+Lh9rFhl2GIm0i7/rPNaVotdfp
 Oc6k9qIVTfSP20RKfs0OvOZvrIHZwLYAVgrKNPPaxl7Vhgr43n3MEeEQmAxOd2cBILzJ21/oDtK
 n8Qi7X2G8oIT8mj68A1ZwGWyPHrmJ/mIrYyU8OtPp9zaae/ESUm1xLhw5YjVRgMhNxcQSOiljbw
 5lKknYUIbI3FhL0tseQQmqr8K/FYCRk0mNBWc6F2019G2N373q/a7CN2duhxYQz7/m9Nm4ZaZou
 +FoJr3wUjblVfoDQmKbndJNlHovJg9LbsXNpz72LRebEHkEdF688Cay98no0Yp5Pe8RZBBPljec
 F2dwl8BIOQ+nyZkRntA0AfnvLaML1G/hp9Ef2nkEcmL5MW4Yagw1xykO24evX6ax+lH/eLGxo=
X-Google-Smtp-Source: AGHT+IHXaIGq/DCbFBT5tci/gENyl4iZqzY2ieAcjIz6udHWcgmgashLBibv/0iYU0+1RqFsMnlTGA==
X-Received: by 2002:a05:600c:1c98:b0:456:eab:633e with SMTP id
 5b1f17b1804b1-459fb4fb214mr42284955e9.17.1754759880309; 
 Sat, 09 Aug 2025 10:18:00 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459fbd203eesm40534245e9.6.2025.08.09.10.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 10:17:59 -0700 (PDT)
Message-ID: <456abf09-1223-4607-b50e-570978daa6d9@smile.fr>
Date: Sat, 9 Aug 2025 19:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>, buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 James Knight <git@jdknight.me>
References: <20250703145955.1863056-1-elmehdi.younes@smile.fr>
Content-Language: fr
In-Reply-To: <20250703145955.1863056-1-elmehdi.younes@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754759880; x=1755364680; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VWFggot0rZG4a7wZyYiuSiCjz2jWeJq9pG4QIcJ8w6U=;
 b=UVN85++HHxctJ/t4N/8rZptkfGzMKubRyRVBr/HlOgEBKaa+4YrxtkgJzk/G6ZmGzz
 igFqEclH1V30kkQpG7RID5ewRpkb92/oAfmPCTkmJoKB6Yj6yWCziEFWbCv7hISE5DGW
 Ws/Y4hi+yPy1+hUcoLq1Iqpk27PlNXN0NOSk0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=UVN85++H
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: fix
 gcc-install-dir in clang
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

SGVsbG8gTWVoZGksCgpMZSAwMy8wNy8yMDI1IMOgIDE2OjU5LCBFbCBNZWhkaSBZT1VORVMgdmlh
IGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IFRoZSBwcmV2aW91cyBtZXRob2QgdXNlZCB0byBkZXRl
cm1pbmUgdGhlIC0tZ2NjLWluc3RhbGwtZGlyIHJlbGllZCBvbgo+ICdscycgb3ZlciB0aGUgZ2Nj
IGluc3RhbGxhdGlvbiBwYXRoLCB3aGljaCB3YXMgZnJhZ2lsZSBhbmQgZmFpbGVkIGluCj4gY2Fz
ZXMgd2hlcmUgdGhlIGV4dGVybmFsIHRvb2xjaGFpbiBjb250YWluZWQgbXVsdGlwbGUgZ2NjIHZl
cnNpb25zIG9yCj4gcGF0aHMgWzFdLgo+IAo+IFdlIHJlcGxhY2UgaXQgYSBtb3JlIHJlbGlhYmxl
IGFwcHJvYWNoIHVzaW5nOgo+ICQoVEFSR0VUX0NDKSAtcHJpbnQtc2VhcmNoLWRpcnMKPiAKPiBU
aGlzIGhlbHBzIHNldHVwIHRvIHJlZ2lzdGVyIHRoZSBkZXNpcmVkIEdDQyBhcmNoaXRlY3R1cmUg
aWYgYQo+IGdpdmVuIHRvb2xjaGFpbiBwYWNrYWdlcyBpbmNsdWRlcyBtdWx0aXBsZSBHQ0MgYXJj
aGl0ZWN0dXJlCj4gaW5zdGFsbGF0aW9ucy4gV2hpY2ggaXNuJ3QgcG9zc2libGUgdXNpbmcgdGhl
IGFjdHVhbCBtZXRob2QgdXNpbmcgJ2xzJy4KPiAKPiBGb3IgZXhhbXBsZSBmcm9tIEphbWVzJ3Mg
cmVwb3J0Ogo+IAo+ICAgICDilJTilIDilIAgL29wdC9jb250YWluZXIvbXktdG9vbGNoYWluLTIw
MjUuMDEuMDEuMTIzNDUvbGliL2djYy8KPiAgICAgICAgIOKUnOKUgOKUgCBhYXJjaDY0LWV4YW1w
bGUtbGludXgtZ251Lwo+ICAgICAgICAg4pSCICAg4pSU4pSA4pSAIC4uLgo+ICAgICAgICAg4pSc
4pSA4pSAIGk2ODYtZXhhbXBsZS1saW51eC1nbnUvCj4gICAgICAgICDilIIgICDilJTilIDilIAg
Li4uCj4gICAgICAgICDilJTilIDilIAgeDg2XzY0LWV4YW1wbGUtbGludXgtZ251Lwo+ICAgICAg
ICAgICAgIOKUlOKUgOKUgCAuLi4KPiAKPiBUaGFua3MgdG8gUm9tYWluIE5hb3VyIGZvciBzdWdn
ZXN0aW5nIHRoaXMgaW1wcm92ZWQgbWV0aG9kLgo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9idWlsZHJvb3QvZDFjNzczZGMtODM0Ni00MDc3LTk0NmEtMGQzYjRlMzBhNmM4QHNtaWxl
LmZyL1QvI3QKPiAKPiBSZXBvcnRlZCBieTogSmFtZXMgS25pZ2h0IDxnaXRAamRrbmlnaHQubWU+
Cj4gU2lnbmVkLW9mZi1ieTogRWwgTWVoZGkgWU9VTkVTIDxlbG1laGRpLnlvdW5lc0BzbWlsZS5m
cj4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4g
LS0tCj4gUm9tYWluIHN1Z2dlc3RlZCB1c2luZyBzZWQsIGJ1dCB3ZSBjaGFuZ2VkIGl0IHRvIGF3
ayBmb3IgYmV0dGVyIGNsYXJpdHkuCj4gLS0tCj4gIHBhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5n
L2NsYW5nLm1rIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xsdm0tcHJvamVjdC9jbGFuZy9j
bGFuZy5tayBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nL2NsYW5nLm1rCj4gaW5kZXggYTVj
OGI5OTBhYS4uMmYxN2EwNGVmYyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xsdm0tcHJvamVjdC9j
bGFuZy9jbGFuZy5tawo+ICsrKyBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nL2NsYW5nLm1r
Cj4gQEAgLTExNSw4ICsxMTUsNyBAQCBDTEFOR19DT05GX09QVFMgKz0gLURMTFZNX0RZTElCX0NP
TVBPTkVOVFM9YWxsCj4gIGlmZXEgKCQoQlIyX1RPT0xDSEFJTl9FWFRFUk5BTCkseSkKPiAgZGVm
aW5lIEhPU1RfQ0xBTkdfSU5TVEFMTF9DT05GSUdfRklMRQo+ICAJbWtkaXIgLXAgJChIT1NUX0RJ
UikvbGliL2NsYW5nLyQoQ0xBTkdfVkVSU0lPTl9NQUpPUikKPiAtCXRvdWNoICQoSE9TVF9ESVIp
L2xpYi9jbGFuZy8kKENMQU5HX1ZFUlNJT05fTUFKT1IpLyQoR05VX1RBUkdFVF9OQU1FKS5jZmcK
PiAtCWVjaG8gIi0tZ2NjLWluc3RhbGwtZGlyPSQoVE9PTENIQUlOX0VYVEVSTkFMX0lOU1RBTExf
RElSKS9saWIvZ2NjLyQkKGxzICQoVE9PTENIQUlOX0VYVEVSTkFMX0lOU1RBTExfRElSKS9saWIv
Z2NjLykvJCQobHMgJChUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9ESVIpL2xpYi9nY2MvJCQo
bHMgJChUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9ESVIpL2xpYi9nY2MvKS8pIiA+ICQoSE9T
VF9ESVIpL2xpYi9jbGFuZy8kKENMQU5HX1ZFUlNJT05fTUFKT1IpLyQoR05VX1RBUkdFVF9OQU1F
KS5jZmcKPiArCWVjaG8gIi0tZ2NjLWluc3RhbGwtZGlyPSQkKCQoVEFSR0VUX0NDKSAtcHJpbnQt
c2VhcmNoLWRpcnMgfCBhd2sgLUYgJzogJyAnJCQxPT0iaW5zdGFsbCIge3ByaW50ICQkMn0nKSIg
PiAkKEhPU1RfRElSKS9saWIvY2xhbmcvJChDTEFOR19WRVJTSU9OX01BSk9SKS8kKEdOVV9UQVJH
RVRfTkFNRSkuY2ZnCj4gIAllY2hvICItLXRhcmdldD0kKEdOVV9UQVJHRVRfTkFNRSkiID4+ICQo
SE9TVF9ESVIpL2xpYi9jbGFuZy8kKENMQU5HX1ZFUlNJT05fTUFKT1IpLyQoR05VX1RBUkdFVF9O
QU1FKS5jZmcKPiAgZW5kZWYKPiAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
