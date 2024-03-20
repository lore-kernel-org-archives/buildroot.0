Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418CCC6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 17:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6814415B0;
	Wed, 20 Mar 2024 17:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kOTy3Hh5WuzG; Wed, 20 Mar 2024 17:21:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E895415A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E895415A9;
	Wed, 20 Mar 2024 17:21:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42FB61BF2BA
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 17:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F3FD60BD9
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 17:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Gfg3EP-ea9y for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 17:21:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3868B60860
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3868B60860
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3868B60860
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 17:21:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-413f4cb646dso612645e9.1
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 10:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710955259; x=1711560059;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QieQz/IV3VZy7KsT3sO/H9OpH57pB0+gOZAqGQuVB9E=;
 b=MAijhLNUMAV+KQFifbb+EJoBNFuGbYcdz2RW3dUzqPmhAAiBbclyftKI+6Dq3nqiyh
 UOGPzgwWvFmZ4N/Ede7iYN/KsecRPaOXyPLGzvgRiegWQRgjIvKtzAfGXf/7xnuc+R4M
 3hvHe42MHUkxQRCTbHXh5g5p2c5TJcxIxM9ZB09UOS9i3jB/pxuK8ypGPCR7gKyqGpbC
 VWF3AeWtWfwYbs8a/BQi43JJPcih562Lw5yEkjzVfCXusKQBeyu3ibWcL1eqJRENDJfD
 QqtHRwdwxn1anH3SLmCfNcpWfeZaQpA9KFP5eQufsmWnXCgwuPHH69w8DyPUnWN/MLZ+
 TD5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjZ4OE171M4zOFY3VVvAtBSorf0ILf7tWVZM10/IS9JgXBE+O7V3b/F005S4aJNhw4dwBcloSuIOvuAx+tvlH7oc5bahKKrw==
X-Gm-Message-State: AOJu0Yw4P+f7PJORHqA2ktUOPTP+5k3f5kVGLSDplBxdBjuZtxw3nER+
 AQ7LxGbl0oBdQVvgApkNGS0xzn/TVSdkHPUvM8BYOk7YMjF+vsu++uHUFveMhMA=
X-Google-Smtp-Source: AGHT+IFhJ5L7emPGyVRYg2KcNSMc3ROrfusSan/QZsWSotMg6OjPLZnlkBjgq/+cvTzTWQqhmf44Pg==
X-Received: by 2002:a5d:448e:0:b0:33e:7fcc:53ca with SMTP id
 j14-20020a5d448e000000b0033e7fcc53camr14158780wrq.26.1710955259284; 
 Wed, 20 Mar 2024 10:20:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 q18-20020adff792000000b0033ec9b26b7asm15157301wrp.25.2024.03.20.10.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 10:20:58 -0700 (PDT)
Message-ID: <0609b565-6298-407c-b7b1-2d32424c802b@mind.be>
Date: Wed, 20 Mar 2024 18:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Akhilesh Nema <nemaakhilesh@gmail.com>, buildroot@buildroot.org
References: <CAMV0Ro8PH6Q4FJfv6OUXpxDPHCNEXt4b3N7_sRLP-RpH07s_bg@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAMV0Ro8PH6Q4FJfv6OUXpxDPHCNEXt4b3N7_sRLP-RpH07s_bg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710955259; x=1711560059; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QieQz/IV3VZy7KsT3sO/H9OpH57pB0+gOZAqGQuVB9E=;
 b=UzUcTdvHuVKrn8aGg+VcjVxxiukd7y9Rks5kVuDn/TI+OWer0k5gxMOiR64RtILO/5
 Fu5Zmf4SJ2F7Y3CQqroBpgN4NE79QhfRMq/vb1MDT3AvjlRUvO9V8BnfL62nwRL6+ttk
 xj2JHvLw8svlKGroKvcmWc/98EFLWeIcZefnu4SxRr0F84+x/0emL7p3UTxXiBnwsMCj
 FSD9O91nZ3V96iVGbH3U5J0IY4jTVm07of5LdGn3bxhBMV+ou2ovlcw+KQphCBVObsLu
 wuxqxm2F7ebZ5u7saGP4wo1hiGvv5FwWi3CJnUeezxkuz2yHP/fc1oru6cVyVKdVsNFb
 6t8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UzUcTdvH
Subject: Re: [Buildroot] AUH (auto-upgrade-helper) for the Buildroot
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8wMy8yMDI0IDIyOjAyLCBBa2hpbGVzaCBOZW1hIHdyb3RlOgo+IEhpIEJ1aWxkcm9v
dCBFeHBlcnRzLAo+IAo+IEFyb3VuZCA4MCUgb2YgdGhlIGNvbW1pdHMgb24gdGhlIEJ1aWxkcm9v
dCBpbnZvbHZlIHBhY2thZ2UgdXBncmFkZXMuCj4gKEFzIG9mIE1hcmNoIDE4LCAyMDI0KQo+IFRv
dGFsIG51bWJlciBvZiBjb21taXRzIG9uIHRoZSBiciBtYXN0ZXLCoCDCoCDCoCDCoCDCoC0gNzE1
NTQKPiBUb3RhbCBudW1iZXIgb2YgY29tbWl0cyBvbiB0aGUgcGFja2FnZSBmb2xkZXIgLSA1NzMw
NQo+IAo+IFlvY3RvIGhhcyBhbiBBVUggdG9vbCB0byBwZXJmb3JtIHRyaXZpYWwgdXBncmFkZXMu
CgogIEkgYmVsaWV2ZSBpbiBZb2N0bywgQVVIIGlzIG9ubHkgdXNlZCB0byBoZWxwIHBlb3BsZSBw
cmVwYXJpbmcgcGF0Y2hlcy4gVGhlIAp1cGRhdGUgaXMgbm90IGFjdHVhbGx5IHBlcmZvcm1lZCBh
dXRvbWF0aWNhbGx5LCByaWdodD8gVGhlIG9ubHkgdGhpbmcgdGhhdCAKaGFwcGVucyBhdXRvbWF0
aWNhbGx5IGlzIHRoYXQgdGhlcmUncyBhIHNlcnZlciB0aGF0IHJ1bnMgQVVIICh3ZWVrbHkgSUlS
QykgYW5kIApzZW5kcyB0aGUgcmVzdWx0cyAoaW5jbHVkaW5nIHBhdGNoZXMpIHRvIHRoZSBtYWls
aW5nIGxpc3QuCgogIEZvciBzdXJlLCBpbiBCdWlsZHJvb3QsIHdlIGRvbid0IHdhbnQgZnVsbHkg
YXV0b21hdGljIHBhY2thZ2UgYnVtcHMuIFdlIApkZWZpbml0ZWx5IHdhbnQgYWxsIHBhY2thZ2Ug
YnVtcHMgdG8gYmUgcnVudGltZSB0ZXN0ZWQgYnkgc29tZW9uZSEKCiAgVGhhdCBzYWlkLCBzb21l
dGhpbmcgdGhhdCBoZWxwcyBwcmVwYXJlIGFuIHVwZGF0ZSBpcyBjZXJ0YWlubHkgd2VsY29tZS4K
Cgo+IEl0IHdvdWxkIGJlIGdyZWF0IGlmIEFVSCAoaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9y
Zy9hdXRvLXVwZ3JhZGUtaGVscGVyIAo+IDxodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL2F1
dG8tdXBncmFkZS1oZWxwZXI+KSB3aWxsIGJlIGF2YWlsYWJsZSBmb3IgdGhlIAo+IEJ1aWxkcm9v
dC4gSXMgdGhlcmUgYSBwbGFuIHRvIHN1cHBvcnQgQVVIIG9yIGEgc2ltaWxhciB0b29sIG9uIEJ1
aWxkcm9vdD8KCiAgVGhlIGV4aXN0aW5nIHlvY3RvIHRvb2wgaXMgY2VydGFpbmx5IG5vdCBnb2lu
ZyB0byB3b3JrIGFzIGlzLCBpdCByZWxpZXMgb24gYSAKYnVuY2ggb2YgT3BlbkVtYmVkZGVkIHNw
ZWNpZmljIGZlYXR1cmVzIChsaWtlIGRldnRvb2wpLgoKICBUaGUgd2F5IHRoaXMgc2hvdWxkIHdv
cmsgaW4gQnVpbGRyb290IGNvbnRleHQgaXMgcHJvYmFibHk6CgotIGEgdXRpbCAoaW4gdXRpbHMv
IGRpcmVjdG9yeSkgdGhhdCB1c2VzIHJlbGVhc2UtbW9uaXRvcmluZyB0byBmaW5kIG91dCB0aGUg
CmxhdGVzdCB2ZXJzaW9uIG9mIGEgcGFja2FnZSwgYW5kIHRoYXQgdXBkYXRlcyB0aGUgLm1rIGFu
ZCAuaGFzaCBmaWxlcyAKYWNjb3JkaW5nbHkuIEl0IGNvdWxkIHBlcmhhcHMgYWxzbyB3cml0ZSBh
IGNvbW1pdCBtZXNzYWdlLgoKLSBhIHRvb2wgdGhhdCBjb21wbGV0ZXMgdGhlIHVwZGF0ZSBmbG93
IGZvciBhIChzZXQgb2YpIHBhY2thZ2VzIGJ5IGFsc28gcnVubmluZyAKbWFrZSBsZWdhbC1pbmZv
IG9uIHRoZW0sIGFuZCBydW5uaW5nIGJyLXRlc3QtcGtnIGFuZCBjaGVja3BhY2thZ2UuIElkZWFs
bHkgYWxzbyAKdGhlIHJ1bnRpbWUgdGVzdHMgZm9yIHRoYXQgcGFja2FnZSwgdGhvdWdoIGl0IG1h
eSBiZSBkaWZmaWN1bHQgdG8gZmluZCB0aGVtLiAKTm90ZSB0aGF0IHRoaXMgdG9vbCB3aWxsIHN0
aWxsIG5lZWQgdG8gZ2V0IGEgY29uZmlnIGZyYWdtZW50IGFzIGlucHV0LCBiZWNhdXNlIApici10
ZXN0LXBrZyByZXF1aXJlcyBpdC4KCiAgV2l0aCB0aGF0IGluIHBsYWNlLCB3ZSBjb3VsZCBpbnN0
YWxsIGEgY3JvbiBqb2Igb24gYSBzZXJ2ZXIgc29tZXdoZXJlIHRvIApyZWd1bGFybHkgcGVyZm9y
bSB0aGlzLiBCdXQsIGFzIHNhaWQgYmVmb3JlLCB0aGUgcGF0Y2hlcyB3b3VsZCBzdGlsbCBuZWVk
IHRvIGJlIApydW50aW1lIHRlc3RlZCEKCiAgUmVnYXJkcywKICBBcm5vdXQKCgo+IAo+IFRoZSB1
c2FnZSBvZiBBVUggY2FuIGJlIGZvdW5kIGhlcmUgLSAKPiBodHRwczovL2RvY3MueW9jdG9wcm9q
ZWN0Lm9yZy9kZXYtbWFudWFsL3VwZ3JhZGluZy1yZWNpcGVzLmh0bWwjdXNpbmctdGhlLWF1dG8t
dXBncmFkZS1oZWxwZXItYXVoIDxodHRwczovL2RvY3MueW9jdG9wcm9qZWN0Lm9yZy9kZXYtbWFu
dWFsL3VwZ3JhZGluZy1yZWNpcGVzLmh0bWwjdXNpbmctdGhlLWF1dG8tdXBncmFkZS1oZWxwZXIt
YXVoPgo+IAo+IEJlbmVmaXRzIG9mIHRoaXMgdG9vbCBhcmUgc2VsZiBleHBsYW5hdG9yeS4KPiAK
PiBUaGFua3MKPiBBa2hpbGVzaAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
