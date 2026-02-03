Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DD9E8B36D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F84C40441;
	Tue,  3 Feb 2026 22:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pmi7jbqX1o13; Tue,  3 Feb 2026 22:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ECE440931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770157350;
	bh=Ap5i3mA0IBXLXT9cwF0CjI2VK5D146G920J0AIP/dEM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=o9IJa5mmtDlmk7IYlSqMGffk3aWnxXGskNPgpURsOLDrq1C1q3gBVa8TRm5MGc47z
	 SBXPrDSKfuHafICK1iPljkUgYwU/+N3R6PHovu1x906Wh43tL9xew1dYBTKJkThUH9
	 Ecn6DHOrSgzxL2GTcWC+w3s3APckf6+7dyTn8HryHWhfm7CRpHDq0ZE7Aw+mQivLgH
	 5d7iTGDSpbxHuShW9p4T3DmHLmcQPO0wlyxDQsERbfer5Vnw0kqmYqbVh6mNJCcGes
	 sBRFoN1yzxoDEbWGlTCasxVEuzfESNOCltNecPLK3Z2bgzxuiCPuzFkfV/cv2tidkh
	 0myrn26g21V8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ECE440931;
	Tue,  3 Feb 2026 22:22:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DA9013D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5555183D6E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRcUwYC2XaMy for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:22:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1FEE883D6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FEE883D6D
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FEE883D6D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:22:27 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso51003175e9.2
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 14:22:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770157346; x=1770762146;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dE5oFj9oeQMmXG3AQxdF5/KgH0cxtUV5m5oL7cQH8mk=;
 b=xPLkFAp/3w9hL1sltXBh7HZV2ZfJVSJHXG16oqbZEK/GildWl8Z0me5Zh8Glxje92f
 fGLOlq47hKSECXRU8uQ6gypwclm/roRZ/QS9Q5VAMsx05wgomL+kuyLwJXj7RxNT18Ib
 Ea4AqTM4ruevo3EzOqjM4HcUfTV6PECvra6nXfCiqdCz8O/zsqZb3N+H0mAGD+62pNc1
 jwBcTWuDfFPNVA7b0+BtZgKhpCrEbJ9rLIGJ9ZYkKAkvvSCNakzkY5/zQs2Tnp5674nT
 2/fme9rdTm3Rm0eia9b5NXzcewWDBbxMSUU/KEBs7DcYtXLjKrUYqltmYmBhWwV3XIiR
 EzQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEGGrPaQrzvFpsH4XgLuP1yJayzR7P7dgIkzlbCabFyd1r2I6lLMcFmdbSyH2RKa592oauebh6m50=@buildroot.org
X-Gm-Message-State: AOJu0YwHmx9GL2Ztnc0CcRbvyqn47pLg9sHE5ohpIn7rkhp7Bh2qBX6T
 SrPPNKiNEbhhedXbY97oRzCm9LlAsGwq1sAMka5Eir0gfMuGdNFrS4S7YNmtfbsDGTY=
X-Gm-Gg: AZuq6aJ/aewTN0wjfM/kph174jszMeLQCpjbuaBWPuDzN/xcRCOIlKluFLt4Mwf76ht
 SuCwhiS3y+iHB7d11EaKzJCrvIaCpq5xBnHj1WXBBEC2xKAP9iCZn6kFjjkYwjpKnLju7dKFj76
 dx16YD0mmrrF6wOb2PldrePrNTfyfh9Cyt/mVG03/d2uxxUYNmjLbQJS/tydJI/vwjIPxeFjEyT
 jbQHybYPuU78p1HcZ1Gs1tohlwKVnU9UvHaU4wN7PxDadTh/+AmbTzXS2528GPJmvH94BzST1YT
 cUFsYxMRKthnbkSzAk3JHjbFcZlTz8s/MzMlGswFKedHVUXUE64yXa4vv1KkVOTmAqsSZENcvVw
 RPPcXby1SALbLid1hFQbsarqbFr7Kf9A8MtWrGD5gB/a8k3NYnPOSbYcia6KiAQBrS6RJ0roIgk
 n/cdG9aRVlX45GqovDj+6DjZLj9YAOh0/0GNe3yD/kQf0=
X-Received: by 2002:a05:600c:350e:b0:471:700:f281 with SMTP id
 5b1f17b1804b1-4830e973685mr15078095e9.25.1770157345929; 
 Tue, 03 Feb 2026 14:22:25 -0800 (PST)
Received: from [192.168.24.75] (124.127.92.92.rev.sfr.net. [92.92.127.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830fe9ddcasm3139045e9.12.2026.02.03.14.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 14:22:25 -0800 (PST)
Message-ID: <ea887719-ada5-4163-a8a3-fd5a3045c9cf@smile.fr>
Date: Tue, 3 Feb 2026 23:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Jardin <vjardin@free.fr>, buildroot@buildroot.org
References: <20260107180630.2471280-1-vjardin@free.fr>
 <20260107180630.2471280-2-vjardin@free.fr>
Content-Language: fr
In-Reply-To: <20260107180630.2471280-2-vjardin@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770157346; x=1770762146; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dE5oFj9oeQMmXG3AQxdF5/KgH0cxtUV5m5oL7cQH8mk=;
 b=Ko2crMeBMnr2TpKKykuL/WW5pXrAAn4OCMmn4iy7X++3vslZ2/v89fmcQ7+jewwC1i
 aLVnmVYnPZb+IS7BLZcef6eHgsD9iFUsKBqfN0Rt3oH6BDkRwsOodsPG53X/0i6AX0Bz
 zePnsX3jJXDqetLsyrpUjmvgR+G4v4gaP06VI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Ko2crMeB
Subject: Re: [Buildroot] [PATCH v1 1/1] package/rpmsg-echo-test: new package
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

SGVsbG8gVmluY2VudCwgQWxsLAoKTGUgMDcvMDEvMjAyNiDDoCAxOTowNiwgVmluY2VudCBKYXJk
aW4gdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IExpbnV4IHVzZXJzcGFjZSBSUE1zZyBlY2hv
X3Rlc3QgZGVtbyBmcm9tIHRoZSBPcGVuQU1QIHN5c3RlbQo+IHJlZmVyZW5jZSBleGFtcGxlcy4g
VGhpcyBhcHBsaWNhdGlvbiB1c2VzIHRoZSBMaW51eCBrZXJuZWwgUlBNc2cKPiBmcmFtZXdvcmsg
dG8gc2VuZCBidWZmZXJzIHRvIGEgcmVtb3RlIHByb2Nlc3NvciBhbmQgdmVyaWZ5IHRoZQo+IGVj
aG9lZCBkYXRhLgo+IAo+IFJlcXVpcmVzIGtlcm5lbCBoZWFkZXJzID49IDQuMTEgZm9yIGxpbnV4
L3JwbXNnLmguCgpTaW5jZSB0aGlzIHBhY2thZ2UgaXMgYSBkZW1vIHBhY2thZ2UgZm9yIHRlc3Rp
bmcgYSBiYXNpYyBleGFtcGxlIG9mIE9wZW5BTVAKcnBtc2csIGl0IGNvdWxkIGJlIG1vdmVkIGlu
dG8gc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvPG9wZW5hbXA+IGRpcmVjdG9yeQphbmQg
dXNlZCBieSBhIHJ1bnRpbWUgdGVzdC4KCklzIHRoaXMgcGFja2FnZSBjYW4gYmUgcmVhbGx5IHVz
ZWQgb3RoZXIgdGhhbiB0ZXN0aW5nIE9wZW5BTVA/Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNl
bnQgSmFyZGluIDx2amFyZGluQGZyZWUuZnI+Cj4gLS0tCj4gIERFVkVMT1BFUlMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9ycG1zZy1lY2hvLXRlc3Qv
Q29uZmlnLmluICAgICAgICAgICAgfCAxNyArKysrKysrKysrCj4gIHBhY2thZ2UvcnBtc2ctZWNo
by10ZXN0L3JwbXNnLWVjaG8tdGVzdC5oYXNoIHwgIDMgKysKPiAgcGFja2FnZS9ycG1zZy1lY2hv
LXRlc3QvcnBtc2ctZWNoby10ZXN0Lm1rICAgfCAzNSArKysrKysrKysrKysrKysrKysrKwo+ICA1
IGZpbGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvcnBtc2ctZWNoby10ZXN0L0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9ycG1zZy1lY2hvLXRlc3QvcnBtc2ctZWNoby10ZXN0Lmhhc2gKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvcnBtc2ctZWNoby10ZXN0L3JwbXNnLWVjaG8tdGVzdC5tawo+IAo+IGRp
ZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IGY5ODJlMzEyM2EuLjVk
OTY4Y2U5MTcgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBA
QCAtMzM1OSw2ICszMzU5LDcgQEAgRjoJcGFja2FnZS9iZnNjcmlwdHMvCj4gIEY6CXBhY2thZ2Uv
ZHBkay8KPiAgRjoJcGFja2FnZS9saWJlY29saS8KPiAgRjoJcGFja2FnZS9saWJ5YW5nLWNwcC8K
PiArRjoJcGFja2FnZS9ycG1zZy1lY2hvLXRlc3QvCj4gIEY6CXBhY2thZ2Uvc3lzcmVwby1jcHAv
Cj4gIAo+ICBOOglWaW5jZW50IFByaW5jZSA8dmluY2VudC5wcmluY2UuZnJAZ21haWwuY29tPgo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5k
ZXggZGVmM2RiMGU1MC4uYTdiOGVlNjhlZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5p
bgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTU4OSw2ICs1ODksNyBAQCBlbmRtZW51
Cj4gIAlzb3VyY2UgInBhY2thZ2Uvcm5nLXRvb2xzL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFj
a2FnZS9yb2NrY2hpcC1tYWxpL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9yb2NrY2hp
cC1ya2Jpbi9Db25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2UvcnBtc2ctZWNoby10ZXN0L0Nv
bmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9yczQ4NWNvbmYvQ29uZmlnLmluIgo+ICAJc291
cmNlICJwYWNrYWdlL3J0Yy10b29scy9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcnRs
ODE4OGV1L0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycG1zZy1lY2hvLXRlc3Qv
Q29uZmlnLmluIGIvcGFja2FnZS9ycG1zZy1lY2hvLXRlc3QvQ29uZmlnLmluCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4zMmYzZDM3MTU2Cj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL3BhY2thZ2UvcnBtc2ctZWNoby10ZXN0L0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEs
MTcgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1JQTVNHX0VDSE9fVEVTVAo+ICsJYm9vbCAicnBt
c2ctZWNoby10ZXN0Igo+ICsJZGVwZW5kcyBvbiBCUjJfVVNFX01NVSAjIExpbnV4IHVzZXJzcGFj
ZSBvbmx5Cj4gKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF80XzEx
ICMgbGludXgvcnBtc2cuaAo+ICsJaGVscAo+ICsJICBMaW51eCB1c2Vyc3BhY2UgUlBNc2cgZWNo
b190ZXN0IGRlbW8gZnJvbSB0aGUgT3BlbkFNUAo+ICsJICBzeXN0ZW0gcmVmZXJlbmNlIGV4YW1w
bGVzLgo+ICsKPiArCSAgVGhpcyBhcHBsaWNhdGlvbiB1c2VzIHRoZSBMaW51eCBrZXJuZWwgUlBN
c2cgZnJhbWV3b3JrCj4gKwkgIHRvIHNlbmQgYnVmZmVycyB0byBhIHJlbW90ZSBwcm9jZXNzb3Ig
YW5kIHZlcmlmeSB0aGUKPiArCSAgZWNob2VkIGRhdGEgKHNlZSAiZWNob190ZXN0IiBkZW1vIGlu
IHRoZSBPcGVuQU1QIGRvY3MpLgo+ICsKPiArCSAgaHR0cHM6Ly9naXRodWIuY29tL09wZW5BTVAv
b3BlbmFtcC1zeXN0ZW0tcmVmZXJlbmNlCj4gKwo+ICtjb21tZW50ICJycG1zZy1lY2hvLXRlc3Qg
bmVlZHMgYSB0b29sY2hhaW4gdy8ga2VybmVsIGhlYWRlcnMgPj0gNC4xMSIKPiArCWRlcGVuZHMg
b24gQlIyX1VTRV9NTVUKPiArCWRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9M
RUFTVF80XzExCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnBtc2ctZWNoby10ZXN0L3JwbXNnLWVj
aG8tdGVzdC5oYXNoIGIvcGFja2FnZS9ycG1zZy1lY2hvLXRlc3QvcnBtc2ctZWNoby10ZXN0Lmhh
c2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjQxZjhjYTRiZjgK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9ycG1zZy1lY2hvLXRlc3QvcnBtc2ctZWNo
by10ZXN0Lmhhc2gKPiBAQCAtMCwwICsxLDMgQEAKPiArIyBMb2NhbGx5IGNvbXB1dGVkCj4gK3No
YTI1NiAgODA1OWZiZGU3NGY3MjZlZmQ3NzhmMTM5M2U3NWY1YjU1NDg3MWVhOGE5ZjUxMjc4OTEy
ODM4ZWE0MTQwMzFjYSAgcnBtc2ctZWNoby10ZXN0LXYyMDI1LjA0LjAudGFyLmd6Cj4gK3NoYTI1
NiAgNjIzNDU3ODhhMDE5NTk2MzYwYzdmNGU0MDI2Mjc4Y2M4NDc1NGRlNmJlYWZhYzgyZWEwZGUw
NjQ3YjIzYzZlZCAgTElDRU5TRS5tZAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3JwbXNnLWVjaG8t
dGVzdC9ycG1zZy1lY2hvLXRlc3QubWsgYi9wYWNrYWdlL3JwbXNnLWVjaG8tdGVzdC9ycG1zZy1l
Y2hvLXRlc3QubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjNm
OThhZWE3YzQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9ycG1zZy1lY2hvLXRlc3Qv
cnBtc2ctZWNoby10ZXN0Lm1rCj4gQEAgLTAsMCArMSwzNSBAQAo+ICsjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+ICsjCj4gKyMgcnBtc2ctZWNoby10ZXN0Cj4gKyMKPiArIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPiArCj4gK1JQTVNHX0VDSE9fVEVTVF9WRVJTSU9OID0gdjIwMjUuMDQuMAo+ICtS
UE1TR19FQ0hPX1RFU1RfU0lURSA9ICQoY2FsbCBnaXRodWIsT3BlbkFNUCxvcGVuYW1wLXN5c3Rl
bS1yZWZlcmVuY2UsJChSUE1TR19FQ0hPX1RFU1RfVkVSU0lPTikpCj4gK1JQTVNHX0VDSE9fVEVT
VF9TVUJESVIgPSBleGFtcGxlcy9saW51eC9ycG1zZy1lY2hvLXRlc3QKClRoaXMgaXMgdGhlIHNh
bWUgc291cmNlcyBhcyBycG1zZy11dGlscyBbMV0sIGNhbiB5b3UgY2hlY2sgaWYgaXQgd291bGQg
YmUKcG9zc2libGUgdG8gc2hhcmUgdGhlIHNhbWUgcGFja2FnZSBmb3IgcnBtc2ctdXRpbHMgYW5k
IHJwbXNnLWVjaG8tdGVzdCA/CgpbMV0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI2MDEwNzE4MDQ0MS4yNDcwOTQ0LTItdmphcmRpbkBmcmVl
LmZyLwoKPiArCj4gK1JQTVNHX0VDSE9fVEVTVF9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCj4gK1JQ
TVNHX0VDSE9fVEVTVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS5tZAo+ICsKPiArZGVmaW5lIFJQ
TVNHX0VDSE9fVEVTVF9CVUlMRF9DTURTCj4gKwkkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSAt
QyAkKEBEKS8kKFJQTVNHX0VDSE9fVEVTVF9TVUJESVIpIFwKPiArCQlDQz0iJChUQVJHRVRfQ0Mp
IiBcCj4gKwkJTEQ9IiQoVEFSR0VUX0xEKSIgXAo+ICsJCUNGTEFHUz0iJChUQVJHRVRfQ0ZMQUdT
KSIgXAo+ICsJCUxERkxBR1M9IiQoVEFSR0VUX0xERkxBR1MpIgo+ICtlbmRlZgo+ICsKPiArZGVm
aW5lIFJQTVNHX0VDSE9fVEVTVF9JTlNUQUxMX1RBUkdFVF9DTURTCj4gKwkkKElOU1RBTEwpIC1E
IC1tIDA3NTUgXAo+ICsJCSQoQEQpLyQoUlBNU0dfRUNIT19URVNUX1NVQkRJUikvZWNob190ZXN0
IFwKPiArCQkkKFRBUkdFVF9ESVIpL3Vzci9iaW4vZWNob190ZXN0CgpJdCdzIHByb21pc2luZywg
dGhlIG5leHQgc3RlcCBpcyB0byB1c2UgaXQgZnJvbSBhIHJ1bnRpbWUgdGVzdC4KCkJlc3QgcmVn
YXJkcywKUm9tYWluCgoKPiArZW5kZWYKPiArCj4gK2RlZmluZSBSUE1TR19FQ0hPX1RFU1RfTElO
VVhfQ09ORklHX0ZJWFVQUwo+ICsJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfUlBN
U0cpCj4gKwkkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19SUE1TR19DSEFSKQo+ICsJ
JChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfUlBNU0dfQ1RSTCkKPiArCSQoY2FsbCBL
Q09ORklHX0VOQUJMRV9PUFQsQ09ORklHX1JQTVNHX1ZJUlRJTykKPiArZW5kZWYKPiArCj4gKyQo
ZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
