Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E37C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 00:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B956382145;
	Thu,  2 May 2024 00:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZFhFAocT_I1n; Thu,  2 May 2024 00:27:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9251282147
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9251282147;
	Thu,  2 May 2024 00:27:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52DCE1BF98E
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 00:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F39940156
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 00:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Wiajg8cZ98Q for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 00:27:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com;
 envelope-from=wilfred.opensource@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 136834011A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 136834011A
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 136834011A
 for <buildroot@buildroot.org>; Thu,  2 May 2024 00:27:21 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2ac9b225a91so5644987a91.2
 for <buildroot@buildroot.org>; Wed, 01 May 2024 17:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714609641; x=1715214441;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qD5oHW9ocOrgfOhSp+ketRY28sl2zbk5U0NOjxaDzWg=;
 b=ruhuXKcNmTPK1gmDNJBtjZi8TexSwFeOdb4su09PHskOQp1NAXEF4GzFloGwASS0/0
 16liMAySlq91F4aPmo7+eKuiXgKG5NVwYzQA+02HIXH79dCMDzf4AIb9HShSCYgVC+zK
 zGvVbFJ1INznpt+E9luPn10bWaVRWyhM1U/LUxFr+WjxFEYktokuAJwBHXr/drC7Nj6S
 a4x/D51CZegPkKTCXj7FQSH9dVQB7LL6/fO6JHrIVWgwGnTNpyKZ8rFfEZYny1gVJ1gb
 x7lHy2cMOp/zerDKUY+usbDfHiF/seFvc6gRtoZS6kH0YE176LpnF/Ou9m5Zz/A7BSgq
 tiBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWesFnNXLBTIM8fcuyvVGRGelHmPwDgqZaHM9YYLXkQZGEpG/IC9T8VYM08UxmMy7z+k42FCqSi0USwhSmftaGXdBOSESahnw==
X-Gm-Message-State: AOJu0YwlcgoCHeNLwM3cDvGVFzKnUiLb6V5os9gSlQwISuv/v/sc70BC
 Lmh+wmmau0yVLVbJnlrSB8wu4urTi8LW+rzDLhxkl4TIl6Y1wSej
X-Google-Smtp-Source: AGHT+IG+uhyo0OKhCd7kpSnT8SzOh45JWC+yru0L+xyBWq2U2woha2ilpplK3H+DzJ9Af5d5IHAZSw==
X-Received: by 2002:a17:90a:e38c:b0:2b3:463d:992b with SMTP id
 b12-20020a17090ae38c00b002b3463d992bmr490751pjz.42.1714609640732; 
 Wed, 01 May 2024 17:27:20 -0700 (PDT)
Received: from [192.168.0.247] ([159.196.15.10])
 by smtp.gmail.com with ESMTPSA id
 sj16-20020a17090b2d9000b002b27eb61901sm1932227pjb.21.2024.05.01.17.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 17:27:20 -0700 (PDT)
Message-ID: <cdd1ab4633deb5d7c23618f59da49455d14b58ec.camel@gmail.com>
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>, buildroot@buildroot.org
Date: Thu, 02 May 2024 10:27:16 +1000
In-Reply-To: <20240402035140.71770-2-wilfred.mallawa@wdc.com>
References: <20240402035140.71770-2-wilfred.mallawa@wdc.com>
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714609641; x=1715214441; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qD5oHW9ocOrgfOhSp+ketRY28sl2zbk5U0NOjxaDzWg=;
 b=Z1ZD4OI9ngFOi6YGd8ChxLobRehKag2PiSxtAIeLyL/i5svRnKyxSBFlYY3g+6wys9
 /4AY6osZ3ieTbM/cd9PvrOce144PB2FbdHlJArmD4xYDlEiFEKB4m4AQosXNw+/Vlu0Q
 sv0/aQlYIOqklpW3vF0IgC+uVxUN+8qwBakfrkQResofjUuSOb9l0ZahFx0SNzwt6Zub
 UBdKLGMSD27C9cvqBja3GgQiMDS0/nOGvLIqKd6lfs/u3HvldTqYU6aEtVfCYqGDBS+c
 UBkK58SQIGUm8DbaOGqqKq6qHtZ1pMUG4ogFp2vZ6QWLm6paus0vawphxz7GFciEIvsY
 GWCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z1ZD4OI9
Subject: Re: [Buildroot] [PATCH v2 1/1] package/spdm-utils: new package
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
Cc: alistair.francis@wdc.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cGluZyEKCk9uIFR1ZSwgMjAyNC0wNC0wMiBhdCAxMzo1MSArMTAwMCwgV2lsZnJlZCBNYWxsYXdh
IHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8
YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdpbGZyZWQgTWFsbGF3
YSA8d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiBWMjrCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIAo+IMKgwqDCoMKgwqDCoMKgIC0g
QWRkZWQgcmVxdWlyZWQgcHl0aG9uMyBkZXBlbmRlbmNpZXMKPiDCoMKgwqDCoMKgwqDCoCAtIE5v
dyBkZXBlbmRzIG9uIGB1ZGV2YCBpbnN0ZWFkIG9mIHNlbGVjdGluZyBgZXVkZXZgCj4gwqDCoMKg
wqDCoMKgwqAgLSBOb3cgZGVwZW5kcyBvbiBgbGlic3BkbWAKPiDCoMKgwqDCoMKgwqDCoCAtIEhv
b2sgZGVmaW5lIG1vdmVkIGJlbG93IHRoZSBob29rLCBzdHlsaXN0aWNhbGx5IHNpbWlsYXIgdG8K
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG90aGVyIHBhY2thZ2VzCj4gwqDCoMKgwqDCoMKgwqAg
LSBSZW1vdmVkIGNhcmdvIHBhY2thZ2UgcmUtdmVuZG9yaW5nIGFzIHdlIGFyZW4ndCBwYXRjaGlu
Zwo+IMKgwqDCoMKgwqDCoMKgIC0gQ2hhbmdlZCBjZXJ0aWZpY2F0ZS9tYW5pZmVzdCBpbnN0YWxs
YXRpb24gcGF0aCB0byBiZSBzeXN0ZW0KPiB3aWRlLgo+IAo+IMKgcGFja2FnZS9Db25maWcuaW7C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsKPiDCoHBhY2thZ2Uvc3Bk
bS11dGlscy9Db25maWcuaW7CoMKgwqDCoMKgwqAgfCAyNCArKysrKysrKysrKysrKysrKysrKwo+
IMKgcGFja2FnZS9zcGRtLXV0aWxzL3NwZG0tdXRpbHMuaGFzaCB8wqAgMiArKwo+IMKgcGFja2Fn
ZS9zcGRtLXV0aWxzL3NwZG0tdXRpbHMubWvCoMKgIHwgMzYKPiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiDCoDQgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQo+IMKgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc3BkbS11dGlscy9Db25maWcuaW4KPiDCoGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3NwZG0tdXRpbHMvc3BkbS11dGlscy5oYXNoCj4gwqBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9zcGRtLXV0aWxzL3NwZG0tdXRpbHMubWsKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IDQxMGZl
MGY0OTMuLjk1NzJhODg0ZTcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysg
Yi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBAIC0yNjk4LDYgKzI2OTgsNyBAQCBjb21tZW50ICJVdGls
aXRpZXMiCj4gwqAJc291cmNlICJwYWNrYWdlL3NjcmVlbi9Db25maWcuaW4iCj4gwqAJc291cmNl
ICJwYWNrYWdlL3NjcmVlbmZldGNoL0NvbmZpZy5pbiIKPiDCoAlzb3VyY2UgInBhY2thZ2Uvc2V4
cGVjdC9Db25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2Uvc3BkbS11dGlscy9Db25maWcuaW4i
Cj4gwqAJc291cmNlICJwYWNrYWdlL3N1ZG8vQ29uZmlnLmluIgo+IMKgCXNvdXJjZSAicGFja2Fn
ZS90ZXJtaW5vbG9neS9Db25maWcuaW4iCj4gwqAJc291cmNlICJwYWNrYWdlL3RpbWUvQ29uZmln
LmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3NwZG0tdXRpbHMvQ29uZmlnLmluIGIvcGFja2Fn
ZS9zcGRtLQo+IHV0aWxzL0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMDAwMC4uYjk2MzY1NDUxZgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3Nw
ZG0tdXRpbHMvQ29uZmlnLmluCj4gQEAgLTAsMCArMSwyNCBAQAo+ICtjb25maWcgQlIyX1BBQ0tB
R0VfU1BETV9VVElMUwo+ICsJYm9vbCAic3BkbS11dGlscyIKPiArCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUwo+ICsJZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0hBU19USFJFQURTICMgcHl0aG9uMwo+ICsJZGVwZW5kcyBvbiBCUjJfVVNFX1dD
SEFSICMgZXVkZXYKPiArCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUwo+ICsJZGVwZW5kcyBv
biBCUjJfVVNFX01NVSAjIGV1ZGV2Cj4gKwlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlPCoCAj
IHB5dGhvbjMKPiArCWRlcGVuZHMgb24gQlIyX1VTRV9NTVXCoCAjIGV1ZGV2LCBweXRob24zCj4g
KwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19VREVWCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNL
QUdFX0xJQlNQRE0KPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDCj4gKwlzZWxlY3Qg
QlIyX1BBQ0tBR0VfT1BFTlNTTAo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1BDSVVUSUxTCj4gKwlz
ZWxlY3QgQlIyX1BBQ0tBR0VfRVVERVYKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT04zCj4g
KwloZWxwCj4gKwnCoCBTUERNLVV0aWxzIGlzIGEgTGludXggYXBwbGljYXRpb24gZGVzaWduZWQg
dG8gc3VwcG9ydCwKPiArCcKgIHRlc3QgYW5kIGRldmVsb3AgU1BETSByZXF1ZXN0ZXJzIGFuZCBy
ZXNwb25kZXJzLgo+ICsJwqAgU1BETS1VdGlscyB1c2VzIGxpYnNwZG0gYXMgdGhlIGJhY2tlbmQg
dG8gcGVyZm9ybSBTUERNCj4gKwnCoCBjb21tdW5pY2F0aW9uLiBTUERNLVV0aWxzIGN1cnJlbnRs
eSBzdXBwb3J0cyB0aGUKPiArCcKgIFBDSWUgRGF0YSBPYmplY3QgRXhjaGFuZ2UgKERPRSkgQ2Fw
YWJpbGl0eS4KPiArCj4gKwnCoCBodHRwczovL2dpdGh1Yi5jb20vd2VzdGVybmRpZ2l0YWxjb3Jw
b3JhdGlvbi9zcGRtLXV0aWxzCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3BkbS11dGlscy9zcGRt
LXV0aWxzLmhhc2ggYi9wYWNrYWdlL3NwZG0tCj4gdXRpbHMvc3BkbS11dGlscy5oYXNoCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5hYWEyNDMzMTVlCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2Uvc3BkbS11dGlscy9zcGRtLXV0aWxzLmhhc2gKPiBAQCAt
MCwwICsxLDIgQEAKPiArIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2wqAKPiAzZjA2ZjA4
NzIyMGIxMjYyNjJhMmJlY2Y2OGM5ZTA2YTU5ZDhkNjEzODE2ZjgyYTE2OGM4MTA5M2RlMDg3ZDFh
wqAKPiBzcGRtLXV0aWxzLTAuMy4wLnRhci5nego+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3NwZG0t
dXRpbHMvc3BkbS11dGlscy5tayBiL3BhY2thZ2Uvc3BkbS0KPiB1dGlscy9zcGRtLXV0aWxzLm1r
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi40MTc2ZjYxODcxCj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2Uvc3BkbS11dGlscy9zcGRtLXV0aWxzLm1rCj4g
QEAgLTAsMCArMSwzNiBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICMjIyMjIyMjIyMjIwo+ICsjCj4gKyMg
c3BkbS11dGlscwo+ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIyMjIyMjIyMjIyMjCj4gKwo+ICtTUERN
X1VUSUxTX1ZFUlNJT04gPSAwLjMuMAo+ICtTUERNX1VUSUxTX1NJVEUgPSAkKGNhbGwgZ2l0aHVi
LHdlc3Rlcm5kaWdpdGFsY29ycG9yYXRpb24sc3BkbS0KPiB1dGlscyx2JChTUERNX1VUSUxTX1ZF
UlNJT04pKQo+ICtTUERNX1VUSUxTX0xJQ0VOU0UgPSBBcGFjaGUtMi4wIG9yIE1JVAo+ICtTUERN
X1VUSUxTX0RFUEVOREVOQ0lFUyArPSBwY2l1dGlscyBsaWJzcGRtIG9wZW5zc2wgdWRldgo+ICsK
PiArIyBOb3RlIHRoYXQgd2UgYWxzbyBjb3B5IGBzZXR1cF9jZXJ0cy5zaGAgYW5kIGBnZW5lcmF0
ZV9jZXJ0cy5zaGAuCj4gKyMgYHNldHVwX2NlcnRzLnNoYCBzaGFsbCBiZSB1c2VkIGJ5IGEgcmVz
cG9uZGVyIHRvIHJlZ2VuZXJhdGUgaXQncwo+IG11dGFibGUKPiArIyBjZXJ0aWZpY2F0ZSBjaGFp
bi4gYGdlbmVyYXRlX2NlcnRzLnNoYCBjYW4gYmUgdXNlZCB0byBnZW5lcmF0ZSBhCj4gbmV3Cj4g
KyMgY2VydGlmaWNhdGUgY2hhaW4sIHdoaWNoIG1heWJlIHVzZWZ1bCBpbiB0ZXN0aW5nIGFuZCBk
ZXZlbG9wbWVudC4KPiArZGVmaW5lIFNQRE1fVVRJTFNfSU5TVEFMTF9DRVJUUwo+ICsJJChJTlNU
QUxMKSAtZCAtbSAwNzU1ICQoVEFSR0VUX0RJUikvdXNyL2xvY2FsL3NwZG1fY2VydHMKPiArCWNw
IC1yICQoQEQpL2NlcnRzL2dlbmVyYXRlX2NlcnRzLnNoCj4gJChUQVJHRVRfRElSKS91c3IvbG9j
YWwvc3BkbV9jZXJ0cwo+ICsJY3AgLXIgJChARCkvY2VydHMvb3BlbnNzbC5jbmYKPiAkKFRBUkdF
VF9ESVIpL3Vzci9sb2NhbC9zcGRtX2NlcnRzCj4gKwljcCAtciAkKEBEKS9jZXJ0cy9zZXR1cF9j
ZXJ0cy5zaAo+ICQoVEFSR0VUX0RJUikvdXNyL2xvY2FsL3NwZG1fY2VydHMKPiArCj4gKwkkKElO
U1RBTEwpIC1kIC1tIDA3NTUKPiAkKFRBUkdFVF9ESVIpL3Vzci9sb2NhbC9zcGRtX2NlcnRzL3Ns
b3QwCj4gKwljcCAkKEBEKS9jZXJ0cy9zbG90MC9pbW11dGFibGUuZGVyCj4gJChUQVJHRVRfRElS
KS91c3IvbG9jYWwvc3BkbV9jZXJ0cy9zbG90MAo+ICsJY3AgJChARCkvY2VydHMvc2xvdDAvZGV2
aWNlLmNlcnQuZGVyCj4gJChUQVJHRVRfRElSKS91c3IvbG9jYWwvc3BkbV9jZXJ0cy9zbG90MAo+
ICsJY3AgJChARCkvY2VydHMvc2xvdDAvZGV2aWNlLmRlcgo+ICQoVEFSR0VUX0RJUikvdXNyL2xv
Y2FsL3NwZG1fY2VydHMvc2xvdDAKPiArCWNwICQoQEQpL2NlcnRzL3Nsb3QwL2RldmljZS5rZXkK
PiAkKFRBUkdFVF9ESVIpL3Vzci9sb2NhbC9zcGRtX2NlcnRzL3Nsb3QwCj4gKwljcCAkKEBEKS9j
ZXJ0cy9zbG90MC9wYXJhbS5wZW0KPiAkKFRBUkdFVF9ESVIpL3Vzci9sb2NhbC9zcGRtX2NlcnRz
L3Nsb3QwCj4gKwljcCAkKEBEKS9jZXJ0cy9zbG90MC9idW5kbGVfcmVzcG9uZGVyLmNlcnRjaGFp
bi5kZXIKPiAkKFRBUkdFVF9ESVIpL3Vzci9sb2NhbC9zcGRtX2NlcnRzL3Nsb3QwCj4gKwo+ICsJ
JChJTlNUQUxMKSAtZCAtbSAwNzU1ICQoVEFSR0VUX0RJUikvdXNyL2xvY2FsL3NwZG1fbWFuaWZl
c3QvCj4gKwljcCAkKEBEKS9tYW5pZmVzdC9tYW5pZmVzdC5vdXQuY2Jvcgo+ICQoVEFSR0VUX0RJ
UikvdXNyL2xvY2FsL3NwZG1fbWFuaWZlc3QvCj4gK2VuZGVmCj4gKwo+ICtTUERNX1VUSUxTX1BP
U1RfSU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0gU1BETV9VVElMU19JTlNUQUxMX0NFUlRTCj4gKwo+
ICskKGV2YWwgJChjYXJnby1wYWNrYWdlKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
