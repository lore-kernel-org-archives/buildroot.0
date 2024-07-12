Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50911C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B591C84787;
	Fri, 12 Jul 2024 19:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZZmEXuhOrcN; Fri, 12 Jul 2024 19:08:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AEC784759
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AEC784759;
	Fri, 12 Jul 2024 19:08:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0D6F1BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9922284759
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fidMByhDgI2K for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:08:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46D3E84757
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46D3E84757
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46D3E84757
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:08:08 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so31905361fa.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720811286; x=1721416086;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g9/MaPo06m20y3zyD/eOEESQBWLuOA5sgCjhbFJvfuQ=;
 b=Lv63X8en4Q+rQaOrT3m14JyeaSx1by3iwJidEB4er67DO2Dm8/DoxhVl9lEnzu3kSW
 ASEaknyCoeomp9NtDPesp5GUu86/kxpL2/fktemPLO8hnDK0DjUeROMhY1vQ6d91LUeA
 MZ8S9vkzCQo4yoyuFCg1WipxEn0HKDRcdpotggLgW1u2efmqvGjlfnKYkJh2wOWeWE06
 vuzAnL6+0zJvb3c2/+2labQyYsV+21MU0rv8LdLSsyMJPC2ALJppTk53DNYgBHuA0iTi
 4pjJXKJZ6uhD309qFSM897AA7q2Ff1Mxd/eVCQEJ7pHNCAFqJ+1giw13Jhw72j8y9M7Y
 HDIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi48yrpyDJKdbAEE9evEM4DkaswWzZrDn8Uqn7a9mVXEhtoq0+Vm4Af2UGr4jzt7sw6OGXC2l0QNvSUX2MJh8d1RDqK9S+Og==
X-Gm-Message-State: AOJu0YwhZPf73JjQcdFKh5AmUTp0xn9sKDdRQXGv60njYlCqA12dg4N+
 wMgHzOc8RPfdkUoUQCdPEuElaBJXGCjpCubTjusSZztkAl9Ltz5Iz1VFBJUdPvM=
X-Google-Smtp-Source: AGHT+IFKOY3In9rzo27qPyIK8VNUOhlkpIvkVuOLJc87vwNbwJPRcumxwsHVaXX4BkAGARCsoZGZsA==
X-Received: by 2002:a05:651c:509:b0:2ee:8d07:3d5e with SMTP id
 38308e7fff4ca-2eeb30ba031mr96615311fa.9.1720811285837; 
 Fri, 12 Jul 2024 12:08:05 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23999csm31949805e9.8.2024.07.12.12.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 12:08:05 -0700 (PDT)
Message-ID: <e0c35138-a12c-42e3-9c7e-1eb9113b001e@smile.fr>
Date: Fri, 12 Jul 2024 21:08:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Paresh Bhagat <p-bhagat@ti.com>, buildroot@buildroot.org
References: <20240711060531.4067193-1-p-bhagat@ti.com>
Content-Language: en-US
In-Reply-To: <20240711060531.4067193-1-p-bhagat@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720811286; x=1721416086; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g9/MaPo06m20y3zyD/eOEESQBWLuOA5sgCjhbFJvfuQ=;
 b=noyvwjXsxrtLWj1JO0OU9z0ztHAw4AvIy58qd2RJ723PbGOK0JaU1qac63pmdPm945
 VReNzwPMqWstjC1/lRrsOp7IkGjb6jVIfLeIincHONb84v0AzHqCrzklHdk8ug+oXTy+
 uEj/hEl0ADoYaoCZCTO84lZGAOXwURATQXkNA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=noyvwjXs
Subject: Re: [Buildroot] [PATCH v4] boot/ti-k3-boot-firmware: Add config
 option to specify version
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Gyan Gupta <g-gupta@ti.com>, Anand Gadiyar <gadiyar@ti.com>,
 Chirag Shilwant <c-shilwant@ti.com>, Syed Mohammed Khasim <khasim@ti.com>,
 Sai Sree Kartheek Adivi <s-adivi@ti.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGFyZXNoLCBBbGwsCgpMZSAxMS8wNy8yMDI0IMOgIDA4OjA1LCBQYXJlc2ggQmhhZ2F0
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBQcmV2aW91c2x5IHRoZSB2ZXJzaW9uIG9mIHRp
LWszLWJvb3QtZmlybXdhcmUgKFRJX0szX0JPT1RfRklSTVdBUkVfVkVSU0lPTikgd2FzCj4gZml4
ZWQgaW4gbWsgZmlsZS4gSW50cm9kdWNlIGEgbmV3IGNvbmZpZyBvcHRpb24gQlIyX1RBUkdFVF9U
SV9LM19CT09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OCj4gc28gdGhhdCB1c2VyIGNhbiBjaGFu
Z2UgdGhlIHZlcnNpb24gZm9yIHRpLWszLWJvb3QtZmlybXdhcmUgdXNpbmcgbWVudWNvbmZpZy4K
PiAKPiBUaGlzIHByb3ZpZGVzIGdyZWF0ZXIgZmxleGliaWxpdHkgZm9yIHVzZXJzIHRvIHNlbGVj
dCBkaWZmZXJlbnQgdmVyc2lvbnMgb2YKPiB0aS1rMy1ib290LWZpcm13YXJlIHdpdGhvdXQgbW9k
aWZ5aW5nIHRoZSBidWlsZCBzY3JpcHQgZGlyZWN0bHkuCgpJcyB0aGUgbWFpbiByZWFzb24gdG8g
YWRkIGFuIG9wdGlvbiB0byBzcGVjaWZ5IHRoZSB0aS1rMy1ib290LWZpcm13YXJlIHZlcnNpb24K
aXMgYmVjYXVzZSBpdCBtdXN0IG1hdGNoIGV4YWN0bHkgd2l0aCB0aGUgc2VsZWN0ZWQgdS1ib290
IG9yIHRpLWszLXI1LWxvYWRlcgp2ZXJzaW9uIGR1ZSB0byB0aGUgVEktU0NJIHByb3RvY29sIGFu
ZCB0aGUgRE1TQyBwcmVidWlsdCBmaXJtd2FyZSBiaW5hcnkKKHByb3ZpZGVkIGJ5IFRJKSAoRE1T
QyBpcyB0aGUgU2VjdXJpdHkgTWFuYWdlciBDb3JlIGluIHRoZSBTb0MpPwoKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBQYXJlc2ggQmhhZ2F0IDxwLWJoYWdhdEB0aS5jb20+Cj4gCj4gLS0tCj4gQ2hhbmdl
cyB2MyAtPiB2NDoKPiAgIC0gVGkgazMgLT4gVEkgSzMgKFN1Z2dlc3RlZCBieSBBbmRyZWFzIERh
bm5lbmJlcmcpCj4gICAtIGdpdC50aS5vcmcgLT4gZ2l0LnRpLmNvbSAoU3VnZ2VzdGVkIGJ5IEFu
ZHJlYXMgRGFubmVuYmVyZykKPiAKPiBDaGFuZ2VzIHYyIC0+IHYzOgo+ICAgLSBmbGV4aWJpbHR5
IC0+IGZsZXhpYmlsaXR5IChTdWdnZXN0ZWQgYnkgQ2hpcmFnIFNoaWx3YW50KQo+IAo+IENoYW5n
ZXMgdjEgLT4gdjI6Cj4gICAtIEZpeCB3aGl0ZXNwYWNlcy9pbmRlbnRhdGlvbiBpbiBDb25maWcu
aW4gZmlsZSAoU3VnZ2VzdGVkIGJ5IEJyeWFuIEJyYXR0bG9mKQo+IAo+IC0tLQo+ICBib290L3Rp
LWszLWJvb3QtZmlybXdhcmUvQ29uZmlnLmluICAgICAgICAgICAgfCAzMCArKysrKysrKysrKysr
KysrKysrCj4gIC4uLi90aS1rMy1ib290LWZpcm13YXJlLm1rICAgICAgICAgICAgICAgICAgICB8
ICAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLWJvb3QtZmlybXdhcmUvQ29uZmlnLmluIGIv
Ym9vdC90aS1rMy1ib290LWZpcm13YXJlL0NvbmZpZy5pbgo+IGluZGV4IGQ4MGJiNGJkYjMuLjU4
MWVjMGMzYjkgMTAwNjQ0Cj4gLS0tIGEvYm9vdC90aS1rMy1ib290LWZpcm13YXJlL0NvbmZpZy5p
bgo+ICsrKyBiL2Jvb3QvdGktazMtYm9vdC1maXJtd2FyZS9Db25maWcuaW4KPiBAQCAtNSwzICs1
LDMzIEBAIGNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkUKPiAgCSAgVGhpcyBw
YWNrYWdlIGRvd25sb2FkcyBhbmQgaW5zdGFsbHMgdGhlIFRJLXNwZWNpZmljIHRpLXN5c2Z3Cj4g
IAkgIGFuZCB0aS1kbSBmaXJtd2FyZSBuZWVkZWQgdG8gYm9vdCBUSSBLMyBwbGF0Zm9ybXMgKHdo
aWNoCj4gIAkgIGluY2x1ZGUgQU02MngsIEFNNjR4LCBBTTY1eCBhbmQgbW9yZSkuCj4gKwo+ICtp
ZiBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkUKPiArY2hvaWNlCj4gKwlwcm9tcHQgInRp
LWszLWJvb3QtZmlybXdhcmUgdmVyc2lvbiIKPiArCWRlZmF1bHQgQlIyX1RBUkdFVF9USV9LM19C
T09UX0ZJUk1XQVJFX0xBVEVTVF9WRVJTSU9OCj4gKwloZWxwCj4gKwkgIFNlbGVjdCB0aGUgdmVy
c2lvbiBvZiBUSSBLMyBib290IGZpcm13YXJlIHlvdSB3YW50IHRvIHVzZS4KPiArCj4gK2NvbmZp
ZyBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfTEFURVNUX1ZFUlNJT04KPiArCWJvb2wg
IjA5LjAyLjAwLjAwOSIKPiArCj4gK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdB
UkVfQ1VTVE9NX1ZFUlNJT04KPiArCWJvb2wgIkN1c3RvbSB2ZXJzaW9uIgo+ICsJaGVscAo+ICsJ
ICBUaGlzIG9wdGlvbiBhbGxvd3MgdG8gdXNlIGEgc3BlY2lmaWMgb2ZmaWNpYWwgdmVyc2lvbiBm
cm9tCj4gKwkgIGdpdC50aS5jb20uCgpXaGVuIHlvdSB1c2UgdGhpcyBvcHRpb24sIHlvdSBuZWVk
IHRvIGRpc2FibGUgdGhlIGhhc2ggY2hlY2tpbmcgd2l0aDoKCkJSX05PX0NIRUNLX0hBU0hfRk9S
ICs9ICQoVElfSzNfQk9PVF9GSVJNV0FSRV9TT1VSQ0UpCgpPdGhlcndpc2UgeW91IGdldDoKCkVS
Uk9SOiBObyBoYXNoIGZvdW5kIGZvciB0aS1saW51eC1maXJtd2FyZS0xMC4wMC4wNS50YXIueHoK
ClNlZSBob3cgaXQncyBkb25lIGZvciB0aS1rMy1yNS1sb2FkZXI6CgppZmVxICgkKEJSMl9UQVJH
RVRfVElfSzNfUjVfTE9BREVSKSQoQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfTEFURVNUX1ZF
UlNJT04pLHkpCkJSX05PX0NIRUNLX0hBU0hfRk9SICs9ICQoVElfSzNfUjVfTE9BREVSX1NPVVJD
RSkKZW5kaWYKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiArCj4gK2VuZGNob2ljZQo+ICsKPiAr
Y29uZmlnIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTl9WQUxV
RQo+ICsJc3RyaW5nICJDdXN0b20gdGktazMtYm9vdC1maXJtd2FyZSB2ZXJzaW9uIgo+ICsJZGVw
ZW5kcyBvbiBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT04KPiAr
Cj4gK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfVkVSU0lPTgo+ICsJc3Ry
aW5nCj4gKwlkZWZhdWx0ICIwOS4wMi4wMC4wMDkiICAgICBpZiBCUjJfVEFSR0VUX1RJX0szX0JP
T1RfRklSTVdBUkVfTEFURVNUX1ZFUlNJT04KPiArCWRlZmF1bHQgQlIyX1RBUkdFVF9USV9LM19C
T09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFIFwKPiArCQkJCWlmIEJSMl9UQVJHRVRf
VElfSzNfQk9PVF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTgo+ICsKPiArZW5kaWYKPiBkaWZmIC0t
Z2l0IGEvYm9vdC90aS1rMy1ib290LWZpcm13YXJlL3RpLWszLWJvb3QtZmlybXdhcmUubWsgYi9i
b290L3RpLWszLWJvb3QtZmlybXdhcmUvdGktazMtYm9vdC1maXJtd2FyZS5tawo+IGluZGV4IDkz
MzI3MzJhZDQuLjM1MDM4MWViYmUgMTAwNjQ0Cj4gLS0tIGEvYm9vdC90aS1rMy1ib290LWZpcm13
YXJlL3RpLWszLWJvb3QtZmlybXdhcmUubWsKPiArKysgYi9ib290L3RpLWszLWJvb3QtZmlybXdh
cmUvdGktazMtYm9vdC1maXJtd2FyZS5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1USV9LM19CT09UX0ZJUk1XQVJFX1ZFUlNJT04gPSAw
OS4wMi4wMC4wMDkKPiArVElfSzNfQk9PVF9GSVJNV0FSRV9WRVJTSU9OID0gJChjYWxsIHFzdHJp
cCwkKEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9WRVJTSU9OKSkKPiAgVElfSzNfQk9P
VF9GSVJNV0FSRV9TSVRFID0gaHR0cHM6Ly9naXQudGkuY29tL2NnaXQvcHJvY2Vzc29yLWZpcm13
YXJlL3RpLWxpbnV4LWZpcm13YXJlL3NuYXBzaG90Cj4gIFRJX0szX0JPT1RfRklSTVdBUkVfU09V
UkNFID0gdGktbGludXgtZmlybXdhcmUtJChUSV9LM19CT09UX0ZJUk1XQVJFX1ZFUlNJT04pLnRh
ci54ego+ICBUSV9LM19CT09UX0ZJUk1XQVJFX0lOU1RBTExfSU1BR0VTID0gWUVTCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
