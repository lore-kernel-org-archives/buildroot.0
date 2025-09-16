Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8EBCAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 11:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E99B8198D;
	Tue, 16 Sep 2025 11:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ReU4IhSBD-LQ; Tue, 16 Sep 2025 11:42:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C9181970
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42C9181970;
	Tue, 16 Sep 2025 11:42:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DACA22F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 11:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6405760B61
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 11:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lksm93hYg-rR for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 11:41:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BE6E60645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BE6E60645
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BE6E60645
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 11:41:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3eb3f05c35bso1566097f8f.1
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 04:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758022916; x=1758627716;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JqoVnt9OWerxvKhskitTS+OCgD0mVvmieV0mG/FRxMA=;
 b=P/svuJAc7rO4BJvKPOwX9HsSVjXzbG1d+b5AzCBzBjGKYFd3wscccml7WLHoK3QMD6
 Ut94qPxsHGaZBAJ53kMQORSc7bs8KCuiiy1yOzpjfhNBxtJrzVrPTMKKsuXlTwkBlFIw
 uzzVMkgEaWPIjtyX4VDf8neiB4gTrt2FaKKmezle4/LVNcjmPhAZto7vT2GODiwwku5B
 iew8H0ZJktXzPXDygB/MG+VdUxn0qDdv21KDVrwUHsVnNpjpXxj+l8earUNteSnrYwVV
 rCAO53QrznjzkoJU2Y6EMrMs4lEwpfIMuDUaSalRBtQedVUDycftPiRKnj5EDngS0TMO
 GFsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa/W3CStc+0b+xkRMtV14SFf9+qlKePX5xPPdznHNo6YSE5li2+FGODRcF07t3n3gNWg+F/qTLM7A=@buildroot.org
X-Gm-Message-State: AOJu0Yw71lPL3LELqVjTtTr5Y2cJeH5xn49uam7ETGZ5M+mBNXzQFgT5
 oLaBtm69tN9owA39daC3ZVjnab29v7BXPnywi1Gueiz8qQuvkjB3K4RT55GMdPdzKGrEn4WMzAo
 CymCW
X-Gm-Gg: ASbGncvalhV8GsLAeEk+xt3y69GCatjUuqU/gh/f9aRVKIFMa5j75Q3E/7R4lnJJlcb
 b6E9iwL56bz1EeAywbsOBMsa26Vutg/Yg6lW9sV/oG2ysOOVcPmErwBIaB3Ghljl/7iWxfp/Z+v
 yvOUAAxydKkGWUHfr63G3D4VyMfWND3Iv0oWEs1KNMBB8Bc5VdkodeC7iuDfUw2xcZweHWaGPpk
 bWTicFgR8+4Rj2xU2YUI1UfGGK/bnoTkB+jFFa1Wm8+oaLd/ZpVN24zjAtmn24EqtiD9LOgPvNM
 14p2BOl2TWS/FA5lo1RKrIVuobdIiHfVH62I86eeLslYXizXilzC4SYrSi+kASM2CBoOUn1jUxu
 5vlD3UxFr3y8sLzcQ3cgxTQduca7NcruZZHR9SwuSpiEN5qkqmxoWyKsalAdYFqDH/0EJB/L774
 PVjTwXMc02kU2oN6OgnVTXL7/1A72I7OK3t+LskcaiANO1HCDOmJ27nd78mjqT
X-Google-Smtp-Source: AGHT+IEf/bTyfQRNRoL7tvYNDgNYfdeugWMAn7OFLdXh78mJxmUX93S+S1Gns7wGFJjhND+w0g7SWg==
X-Received: by 2002:a05:6000:4023:b0:3eb:4e88:55e with SMTP id
 ffacd0b85a97d-3eb4e88099emr4662530f8f.41.1758022915740; 
 Tue, 16 Sep 2025 04:41:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd329sm21660225f8f.31.2025.09.16.04.41.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 04:41:55 -0700 (PDT)
Message-ID: <bcc3f93b-dfd9-45ea-b668-447b07f3009a@smile.fr>
Date: Tue, 16 Sep 2025 13:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Josss Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org
References: <20250914042054.771446-1-salvador.joseluis@gmail.com>
 <55c98b57-f4be-47b7-a87c-06f5130df8fe@smile.fr>
 <aMh87DWmal5nH0JK@waldemar-brodkorb.de>
Content-Language: fr, en-US
In-Reply-To: <aMh87DWmal5nH0JK@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1758022916; x=1758627716; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JqoVnt9OWerxvKhskitTS+OCgD0mVvmieV0mG/FRxMA=;
 b=PLm5qjKPbMiQayfDecwjy9xnn5Vl/sIsA4EMaPNB/wae64PG7CeIj+0T6VhSZ9KMof
 bqKjh87hZism+686BN5nQTucRNUr63YoWELvGyT3ElECXpHF1HEroUJKzJwy1R3ekiTl
 yESIrp3ZSfSOSejysbpQOiti6cNFrjrRjq23A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=PLm5qjKP
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: remove arc_summary
 from ZFS tests
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

SGVsbG8gV2FsZGVtYXIsIEFsbCwKCkxlIDE1LzA5LzIwMjUgw6AgMjI6NTQsIFdhbGRlbWFyIEJy
b2Rrb3JiIGEgw6ljcml0wqA6Cj4gSGksCj4gUm9tYWluIE5hb3VyIHdyb3RlLAo+IAo+PiBIZWxs
byBKb3PDqSwgQWxsLAo+Pgo+PiBMZSAxNC8wOS8yMDI1IMOgIDA2OjIwLCBKb3PDqSBMdWlzIFNh
bHZhZG9yIFJ1Zm8gYSDDqWNyaXTCoDoKPj4+IFRoaXMgcGF0Y2ggcmVwbGFjZSB0aGUgWzFdIHBh
dGNoLgo+Pj4KPj4+IFRoZSBQeXRob24gMy4xMyBpbnRlcnByZXRlciBpdHNlbGYgc2VnZmF1bHRz
IGF0IHJ1bnRpbWUgd2hlbiBjb21waWxlZAo+Pj4gd2l0aCB1Q2xpYmMgb24gdGhlIGFhcmNoNjQg
cGxhdGZvcm0uCj4+Pgo+Pj4gVG8ga2VlcCBUZXN0WmZzVWNsaWJjLCB0aGUgZXhlY3V0aW9uIG9m
IHRoZSBhcmNfc3VtbWFyeSBjb21tYW5kIGhhcwo+Pj4gYmVlbiByZW1vdmVkIGZyb20gdGhlIFpG
UyB0ZXN0cy4gVGhpcyBjb21tYW5kIG9ubHkgcHJpbnRzIHNvbWUgQVJDCj4+PiBzdGF0cyBhbnl3
YXkuCj4+Pgo+Pj4gRml4ZXM6Cj4+PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9i
dWlsZHJvb3QvLS9qb2JzLzExMjcxMTI0ODU5IChUZXN0WmZzVWNsaWJjKQo+Pj4KPj4+IFsxXSBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDI1LVNlcHRl
bWJlci83ODYzOTYuaHRtbAo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFk
b3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgo+Pj4gLS0tCj4+PiAgc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkgfCAyIC0tCj4+PiAgMSBmaWxlIGNo
YW5nZWQsIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF96ZnMucHkKPj4+IGluZGV4IDFiOTA3YWM0ZGUuLjlmZWFlNDllODYgMTAwNjQ0Cj4+
PiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weQo+Pj4gKysr
IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKPj4+IEBAIC01Niw4
ICs1Niw2IEBAIGNsYXNzIFRlc3RaZnNCYXNlKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4+PiAg
ICAgICAgICAgICAgInpwb29sIHNjcnViIC13IHBvb2wiLAo+Pj4gICAgICAgICAgICAgICJzaGEy
NTZzdW0gLWMgL3RtcC91cmFuZG9tLnNoYTI1NiIsCj4+PiAgICAgICAgICAgICAgInpwb29sIHN0
YXR1cyAtdiIsCj4+PiAtICAgICAgICAgICAgIyBDaGVjayBQeVpGUwo+Pj4gLSAgICAgICAgICAg
ICJhcmNfc3VtbWFyeSIsCj4+Cj4+IEFjdHVhbGx5IHRoZSB0ZXN0IGlzIG5vdCBhYm91dCBBUkMg
c3RhdHMgcmVwb3J0ZWQgYnkgYXJjX3N1bW1hcnkgc2NyaXB0IGJ1dCBhCj4+IGNoZWNrIGlmIFB5
WkZTIGRvZXNuJ3QgdHJpZ2dlciBzb21lIFB5dGhvbiBleGNlcHRpb24gZHVlIHRvIG1pc3Npbmcg
cHl0aG9uCj4+IHJ1bnRpbWUgZGVwZW5kZW5jeSAoaWYgUHlaRlMgaXMgd29ya2luZyBhcyBleHBl
Y3RlZCB3aGVuIHB5dGhvbjMgaXMgZW5hYmxlZCkuCj4+Cj4+IFRoaXMgYWxzbyByZW1vdmUgdGhl
IFB5WkZTIHRlc3QgZm9yIG11c2wgYW5kIEdsaWJjIHRoYXQgYXJlIHdvcmtpbmcgd2VsbC4KPj4K
Pj4gSWYgYXJjX3N1bW1hcnkgaXMgcmVtb3ZlZCBmcm9tIHRoZSB0ZXN0LCB0aGVuIHdlIHNob3Vs
ZCBhbHNvIHJlbW92ZQo+PiBCUjJfUEFDS0FHRV9QWVRIT04zPXkgZnJvbSBUZXN0WmZzQmFzZS4K
Pj4KPj4gVGhlIFRlc3RaZnNCYXNlIGlzIGZpbmUgYXMgaXMsIHdlIHNob3VsZCBub3QgdHJ5IHRv
IHJlbW92ZSBQeVpGUyB0ZXN0IGZvciB0aGUKPj4gc2FrZSBvZiB1Q2xpYmMtbmcuCj4+Cj4+IEFj
dHVhbGx5LCBJJ20gd29ycmllZCBhYm91dCB0aGUgYWFyY2g2NCBwb3J0IG9uIHVDbGliYy1uZy4g
SXQncyBwb3NzaWJsZSB0aGF0Cj4+IHRoZSBpc3N1ZSB3ZSBkaXNjb3ZlciBvbiBweXRob24zIHBh
Y2thZ2UgY2FuIGhhcHBlbiBhdCBydW50aW1lIG9uIG90aGVyIHBhY2thZ2VzLgo+Pgo+PiBJZiB5
b3UgcmVhbGx5IHdhbnQgdG8ga2VlcCBUZXN0WmZzVWNsaWJjLCB0aGUgUHlaRlMgdGVzdCBzaG91
bGQgYmUgb25seSBleGVjdXRlZAo+PiBieSBUZXN0WmZzR2xpYmMgYW5kIFRlc3RaZnNNdXNsLiBJ
J20gbm90IHN1cmUgaXQgd29ydGggdGhlIGVmZm9ydC4gTGV0cyByZW1vdmUKPj4gVGVzdFpmc1Vj
bGliYyBmb3Igbm93IGFuZCBob3BlIHRoZSBpc3N1ZSB3aWxsIGJlIGZpeGVkIGluIHVDbGliYy1u
ZyBpbiB1cGNvbWluZwo+PiByZWxlYXNlcy4gVGhlbiBUZXN0WmZzVWNsaWJjIGNhbiBiZSBhZGRl
ZCBiYWNrLgo+Pgo+PiBUaG91Z2h0cz8KPiAKPiBJIGZvdW5kIHRoZSBidWcgaW4gdUNsaWJjLW5n
IGxkLnNvIGNvZGUgZm9yIGFhcmNoNjQuIEkgd2lsbCBkbyBhCj4gcmVsZWFzZSB0aGlzIHdlZWtl
bmQgd2hlbiBJIGhhdmUgZmluaXNoZWQgdGVzdGluZy4KCk5pY2UsIFRoYW5rcyBmb3IgdGhlIGhl
bHAuCgpBY3R1YWxseSwgSSdtIGhhcHB5IHRvIG1hcmsgdGhpcyBzZXJpZXMgYXMgcmVqZWN0ZWQg
ZnJvbSBwYXRjaHdvcmsuIDopCgpMZXQgdXMga25vdyB3aGVuIHlvdXIgcGF0Y2ggaXMgcmVhZHku
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gYmVzdCByZWdhcmRzCj4gIFdhbGRlbWFyCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
