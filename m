Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9323C67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 11:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4AB4402E5;
	Tue,  9 Apr 2024 11:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UALtOjlW7a3; Tue,  9 Apr 2024 11:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEAF540972
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEAF540972;
	Tue,  9 Apr 2024 11:36:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 759281BF3BB
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 11:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FA3340972
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 11:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8CSI5IMXKlr4 for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 11:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D611C402E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D611C402E5
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D611C402E5
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 11:36:44 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4168a5d7564so9987355e9.3
 for <buildroot@buildroot.org>; Tue, 09 Apr 2024 04:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712662602; x=1713267402;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D/9fZzFhI4HK8krnkhPW0px/5ccQaDsAKHG0vEi2ijk=;
 b=IL2TXLUUkRcN6gCE7IphvcSUWqbDzD8iiEX+hHrqGJ+g5SDdOf5YYOvvv/oKYF3MiR
 5y0rjHSE8qg1V5EiWYFZHdi/erR6zo/JrdSoPeuyLiM/oZHeUADpLYd8PlaCHRG13ggY
 8EueIhoL6aO9d1nTz1+aUJzyyYZAztt+yKhjUeLTZKYdJF1Rnfh8wx0WMBsDxpSyPXUX
 FZ0UUN0GwinqyBNKzoz9JgfUi2uN642wgiLu2thxEfju1PDs9r/TG14hEfB9bHUwiysQ
 P4AP7UBo55hecBJaqQmLHDIT+IEmVBKNt7s+4AjfbGWpfm+kYM6GehQCHUJc4cRoGROq
 yBHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/huqAMY7L38rmZLMPguPS2aexVB3Nmsf4UDT2LQJ//HrFz3Zctm4OjIeZcVSZblmrhPhCQjEqMJYPcf2qEJBNvybqr8xNkQ==
X-Gm-Message-State: AOJu0YwoKDmLj3q35KI4TXASNNb10sFfOGUVKRRFGY5sfVMl9b46SCmA
 Cggc9k1TuLDv7xPQWblWzkxk7uDuOCkADrgqUJc/4z+D+01JYVgeSnzFOywge5w=
X-Google-Smtp-Source: AGHT+IEdVWvDbaJh/NUSHJT1bh0maFmjSSlxgUp5/1C5DJSwD+Hdcit12yq4H6D0gapXM58+/DG/qw==
X-Received: by 2002:a05:600c:1e1e:b0:416:950b:6aee with SMTP id
 ay30-20020a05600c1e1e00b00416950b6aeemr2072077wmb.9.1712662602547; 
 Tue, 09 Apr 2024 04:36:42 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c1d8900b004167ab33e5fsm6450040wms.26.2024.04.09.04.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 04:36:42 -0700 (PDT)
Message-ID: <04a19ed9-70e5-442c-914f-4b5cd1bc9d30@smile.fr>
Date: Tue, 9 Apr 2024 13:36:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-8-romain.naour@smile.fr>
 <452821da-0cdd-41af-bf8f-7c78297878d6@mind.be>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <452821da-0cdd-41af-bf8f-7c78297878d6@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712662602; x=1713267402;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D/9fZzFhI4HK8krnkhPW0px/5ccQaDsAKHG0vEi2ijk=;
 b=FjHgkb2uD5DU3OLh/x2BuLk7hbHf4MNScSyAh0LqzsjpDbQOhpjBc2rvnxtsztWFMv
 VjSn9HKVB1K8UXzRcey8SGo26V29f4RlRummFczgQK2E7RikwANDGLFNBARzaeru6CT4
 wHBNNQs8JsSPINKArSpm/nJS4N8MbTax6CQSeXefoboXv0PHTQY7TU3sFUqFtNNZBWwx
 0Ie4p4RYx7kHLsQFvUvLhUA85/1sStKYYmbrIyXPQ+ek7fTUf7GqfPJPXK9+ootG8WSy
 y76AuUumdF6CMcgTTwPO6DPgeZu8e4Mfqe5AISVtwR52BfD3E5WKFVwzWD9pFP/b2XUO
 dA9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=FjHgkb2u
Subject: Re: [Buildroot] [PATCH v12 07/16] configs/ti_am62x_sk_defconfig:
 bump U-Boot version to 2024.01
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LAoKTGUgMDgvMDQvMjAyNCDDoCAxNTowMCwgQXJub3V0IFZhbmRlY2FwcGVs
bGUgYSDDqWNyaXTCoDoKPiAKPiAKPiBPbiAwNy8wNC8yMDI0IDEyOjM1LCBSb21haW4gTmFvdXIg
d3JvdGU6Cj4+IEZyb206IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29s
dXRpb25zLmNvbT4KPj4KPj4gVGhlIDIwMjQuMDEgdmVyc2lvbiBvZiBVLUJvb3QgZm9yIHRoZSBh
bTYyeC1zayBib2FyZCBoYXMgaW50cm9kdWNlZCB0d28KPj4gbWFqb3IgY2hhbmdlczoKPj4gLSBU
aGUgZGV2aWNlIHRyZWUgazMtYW02MjUtc2suZHRiIGlzIG5vIGxvbmdlciBzZWFyY2hlZCBpbiAv
Ym9vdCwgYnV0IGluCj4+IMKgwqAgL2Jvb3QvZHRiL3RpLiBIZW5jZSwgdGhlIGRpc2FibGluZyBv
ZiBCUjJfTElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUCj4+IMKgwqAgYW5kIHRoZSB1c2Ugb2Yg
ZXh0bGludXguY29uZiBmb3IgdGhlIHByb3BlciBsb2FkaW5nIG9mIHRoZSBkZXZpY2UgdHJlZS4K
Pj4gwqDCoCBGdXJ0aGVybW9yZSwgdGhlIHBhcmFtZXRlciBCUjJfUk9PVEZTX1BPU1RfU0NSSVBU
X0FSR1Mgd2FzIHVzZWQgdG8KPj4gwqDCoCBhdXRvLWdlbmVyYXRlIHRoZSBleHRsaW51eC5jb25m
IGZpbGUgc28gdGhhdCBkZXZlbG9wZXJzIGNhbiBjaGFuZ2UgdGhlCj4+IMKgwqAga2VybmVsIGxv
YWRpbmcgb3B0aW9ucyBieSBtb2RpZnlpbmcgdGhlIC5jb25maWcuCj4+IC0gVS1Cb290IGlzIGNh
cGFibGUgb2YgYnVpbGRpbmcgdGlib290My5iaW4gdXNpbmcgQmlubWFuLiBTbyBpdCdzIG5vIGxv
bmdlcgo+PiDCoMKgIG5lY2Vzc2FyeSB0byB1c2UgY3VzdG9tIHRvb2xzIGxpa2UgdGktazMtaW1h
Z2UtZ2VuLgo+PiAtIFVzZSBhIGN1c3RvbSB0aWJvb3QzLmJpbiBzaW5jZSB0aGUgZGVmYXVsdCBp
cyAiaHMtZnMiLAo+PiDCoMKgIGJ1dCB0aGUgdGlfYW02Mnhfc2tfZGVmY29uZmlnIGV4cGVjdCB0
aGUgImdwIiBvbmUKPj4KPj4gVGVzdGVkIG9uIFNLLUFNNjJCLVAxLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+
IAo+IFtzbmlwXQo+PiArY2F0IDw8LV9fSEVBREVSX0VPRiA+ICIke0JJTkFSSUVTX0RJUn0vZXh0
bGludXguY29uZiIKPj4gK8KgwqDCoCBsYWJlbCBhbTYyeC1zay1idWlsZHJvb3QKPj4gK8KgwqDC
oMKgwqAga2VybmVsIC9JbWFnZQo+PiArwqDCoMKgwqDCoCBmZHRkaXIgLwo+PiArwqDCoMKgwqDC
oCBkZXZpY2V0cmVlIC8ke0RFVklDRVRSRUV9Cj4+ICvCoMKgwqDCoMKgIGFwcGVuZCAke2FwcGVu
ZH0KPiAKPiDCoEkgd29uZGVyIGlmIGl0J3MgcmVhbGx5IHVzZWZ1bCB0byBoYXZlIHRoaXMgY3Vz
dG9tIGV4dGxpbnV4LmNvbmYuLi4gV2UgY291bGQKPiBhbHNvIGdpdmUgdGhlIGRldmljZXRyZWUg
YSBjb21tb24gbmFtZSwgYW5kIG1vdmUgdGhlIGFwcGVuZCBsaW5lIGludG8gdGhlIGRldmljZQo+
IHRyZWUgaXRzZWxmLgo+IAoKSSBiZWxpZXZlIGl0J3MgdG8gYXZvaWQgdXNpbmcgVEkgdS1ib290
IGVudmlyb25tZW50IHRoYXQgZXhwZWN0IGEgdW51c3VhbApwYXRoIC9ib290L2R0Yi90aSBmb3Ig
c2VhcmNoaW5nIGZvciBkZXZpY2V0cmVlLgoKU2VlIGJvYXJkL3RpL2o3MjFlLXNrL3Bvc3QtYnVp
bGQuc2ggZnJvbToKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3Qv
MjAyNC1GZWJydWFyeS82ODU2NzIuaHRtbAoKPiDCoEJ1dCB0aGlzIHBhdGNoIGhhcyBoYWQgZW5v
dWdoIGl0ZXJhdGlvbnMsIGxldCdzIGp1c3Qga2VlcCBpdCBhcyBpcyA6LSkKCkluZGVlZC4KCkJl
c3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBbc25pcF0KPj4gLUJSMl9UQVJHRVRfVElfSzNfUjVf
TE9BREVSX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIyLjEwIgo+PiArQlIyX1RBUkdFVF9USV9L
M19SNV9MT0FERVJfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjQuMDEiCj4gCj4gwqBUaGUgaGFz
aCBmb3IgMjAyNC4wMSBpcyBjdXJyZW50bHkgaW4gYm9vdC91Ym9vdC91Ym9vdC5oYXNoLCBidXQg
YXMgc29vbiBhcyB3ZQo+IHVwZGF0ZSB0aGUgVS1Cb290IHZlcnNpb24sIGl0IHdpbGwgbm8gbG9u
Z2VyIGJlLiBTbyB0byBiZSBmdXR1cmUgc2FmZSwgd2Ugc2hvdWxkCj4gYWRkIGEgbG9jYWwgb3Zl
cnJpZGUgb2YgdGhlIHVib290IGhhc2ggZmlsZSBhcyB3ZWxsICh3aGljaCBpcyBzaW1wbHkgaWRl
bnRpY2FsCj4gdG8gdWJvb3QuaGFzaCkuCj4gCj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4gCj4+
IMKgIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0JPQVJEX0RFRkNPTkZJRz0iYW02MnhfZXZt
X3I1Igo+PiArQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVElCT09UM19CSU49InRpYm9vdDMt
YW02MngtZ3AtZXZtLmJpbiIKPj4gK0JSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5N
QU49eQo+PiDCoCBCUjJfVEFSR0VUX1VCT09UPXkKPj4gwqAgQlIyX1RBUkdFVF9VQk9PVF9CVUlM
RF9TWVNURU1fS0NPTkZJRz15Cj4+IMKgIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT049
eQo+PiAtQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMi4xMCIKPj4g
K0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjQuMDEiCj4+IMKgIEJS
Ml9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJhbTYyeF9ldm1fYTUzIgo+PiDCoCBCUjJf
VEFSR0VUX1VCT09UX05FRURTX0RUQz15Cj4+IMKgIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BF
TlNTTD15Cj4+IMKgIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzE9eQo+PiDCoCBCUjJf
VEFSR0VUX1VCT09UX05FRURTX1RJX0szX0JPT1RfRklSTVdBUkU9eQo+PiArQlIyX1RBUkdFVF9V
Qk9PVF9VU0VfQklOTUFOPXkKPj4gwqAgIyBCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9CSU4gaXMg
bm90IHNldAo+PiDCoCBCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9JTUc9eQo+PiDCoCBCUjJfVEFS
R0VUX1VCT09UX1NQTD15CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
