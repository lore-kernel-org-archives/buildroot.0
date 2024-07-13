Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ED3C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 16:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FB3A403AF;
	Sat, 13 Jul 2024 16:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZ4iefYm_9S3; Sat, 13 Jul 2024 16:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9ED8403B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9ED8403B4;
	Sat, 13 Jul 2024 16:46:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C1C51BF2FA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84421403B4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vl6-26xgAsJS for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 16:46:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A3DA403AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A3DA403AF
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A3DA403AF
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 16:46:20 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eea7e2b073so37359481fa.0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720889178; x=1721493978;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gq7g0Sf1zsy+VFjgn7mtCTOksvait2MFAFkf0NS5II4=;
 b=EnKUhjgXYjiLQ8/QYw27SZtBnv1sZsw/kExCfcYPBc/6SJ9qv7uIV+uL/6Ux2BnXv4
 Vg6gXp9tAERrGIX9jGESj4/2defIJOn8tE8MAKdEA/Hp7Tzn2PWguC8fUJR3M4RJWyWP
 HTrn9FoeecP3UIzjxDQ4sXKLiBkobdkRwwMxdbQ9Ae9mIYeg5cROrLYHUPg0orxgbLac
 tjTrgCQKOUNM9pxPqzt5ecTV60c2xbp7Kw60oyQS5+g+cBHG/eeQacmTyN6tZIi2T0j+
 DFsUnpwaDJkjQzNx/sooeC8ljiBfsW1RhWrosRcTpJEd+gx7ceUsgtz8RKka+qvSUNsE
 A/Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9zxALahJosN7tS+vjU/s87bj72yGwEtwDafeFRydwNS5SGP/z7qtaWvP8fSKziIH/nj9yR8lo02GXFdWjDzMd5TF6CjT+Gw==
X-Gm-Message-State: AOJu0Yx4k6pt/uY4MwR38Q3Y1+9xkLb2iMlqRrf9W5tu9Ox7Urs/borN
 YqqGOMBfiZPC1NJKOioLRKCa1GrH/02VJ7dBnS+yAigBBrrCl7wgDj1zxRkfWn8=
X-Google-Smtp-Source: AGHT+IE918Q0veh7Wrigl7AJmSV1P8WpNx0kwjfC47N6DJXwkJ144Uycn36P8K2P6tIVoohh3OvG3A==
X-Received: by 2002:a05:651c:200f:b0:2ee:8555:4742 with SMTP id
 38308e7fff4ca-2eeb30fe842mr84456841fa.27.1720889177477; 
 Sat, 13 Jul 2024 09:46:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5ef44a9sm26837305e9.40.2024.07.13.09.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 09:46:17 -0700 (PDT)
Message-ID: <29dbb9d5-e35d-4ea5-bfda-cb4edac504d9@smile.fr>
Date: Sat, 13 Jul 2024 18:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240701-versal-xsa-support-prebuilt-v3-1-3d3e9318d181@collins.com>
 <7d46feba-19c0-4cb4-aeb9-898e863691a3@smile.fr>
 <D2OJRRC9Z5XN.3I6WU5HEIZB24@collins.com>
Content-Language: fr
In-Reply-To: <D2OJRRC9Z5XN.3I6WU5HEIZB24@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720889178; x=1721493978; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gq7g0Sf1zsy+VFjgn7mtCTOksvait2MFAFkf0NS5II4=;
 b=MC+h8UY0cl7iv3GoS+/0Pq+Hh4//q9WVfmQTXQ57ZTbgxoNduiWxHy0td+1ocKaX0/
 14kLD0qhW08F3FPrDk2jXRj+VgliT7h2w68jDca+mrZOsVmdwLGBnmWshti4YxZH9JPE
 sBDQakBwzWfsoZ61GkQw/ishnC5H40VyETK0Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=MC+h8UY0
Subject: Re: [Buildroot] [PATCH v3] boot/xilinx-prebuilt: support custom
 boards using XSA
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQnJhbmRvbiwKCkxlIDEzLzA3LzIwMjQgw6AgMTg6MjEsIEJyYW5kb24gTWFpZXIgYSDD
qWNyaXTCoDoKPiBPbiBTYXQgSnVsIDEzLCAyMDI0IGF0IDQ6MDggUE0gVVRDLCBSb21haW4gTmFv
dXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4gSGVsbG8gQnJhbmRvbiwgQWxsLAo+Pgo+PiBMZSAw
MS8wNy8yMDI0IMOgIDE4OjQ4LCBCcmFuZG9uIE1haWVyIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTC
oDoKPj4+IFRoZSB4aWxpbngtcHJlYnVpbHQgcGFja2FnZSBvbmx5IHN1cHBvcnRzIGRldmVsb3Bt
ZW50IGJvYXJkcyB0aGF0IFhpbGlueAo+Pj4gaGFzIHB1Ymxpc2hlZCBmaXJtd2FyZSBmb3IuIEN1
c3RvbSBkZXNpZ25zIGJhc2VkIG9uIHRoZSBYaWxpbnggcGxhdGZvcm0KPj4+IG11c3QgZ2VuZXJh
dGUgdGhlaXIgb3duIGZpcm13YXJlIHVzaW5nIHRoZSBBTUQgVml2YWRvIERlc2lnbiBTdWl0ZS4K
Pj4+Cj4+PiBWaXZhZG8gcHJvZHVjZXMgYW4gWFNBIGZpbGUsIHdoaWNoIGlzIGEgWmlwIGZpbGUg
Y29udGFpbmluZyBhbGwgdGhlCj4+PiBmaXJtd2FyZSBuZWVkZWQgYnkgeGlsaW54LXByZWJ1aWx0
LiBXZSBleHRlbmQgeGlsaW54LXByZWJ1aWx0IHRvCj4+PiBkb3dubG9hZCBjdXN0b20gWFNBIGZp
bGVzIGFuZCBleHRyYWN0IHRoZWlyIGNvbnRlbnRzLgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBOZWFs
IEZyYWdlciA8bmVhbC5mcmFnZXJAYW1kLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEJyYW5kb24g
TWFpZXIgPGJyYW5kb24ubWFpZXJAY29sbGlucy5jb20+Cj4+PiAtLS0KPj4+IENoYW5nZXMgaW4g
djM6Cj4+PiAtIFJlYmFzZSBvbiB1cHN0cmVhbSBjaGFuZ2VzIHRvIGJvb3QveGlsaW54LXByZWJ1
aWx0Cj4+PiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA2MjYt
dmVyc2FsLXhzYS1zdXBwb3J0LXByZWJ1aWx0LXYyLTEtNzI0YjAwYzQ1OTZkQGNvbGxpbnMuY29t
Cj4+Pgo+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+IC0gRml4IGhlbHAgdGV4dCB0byBzYXkgWFNBIGlz
IGNyZWF0ZWQgYnkgVml2YWRvIFtOZWFsXQo+Pj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjQwNjI1LXZlcnNhbC14c2Etc3VwcG9ydC1wcmVidWlsdC12MS0xLWY2
NGE3YTM5NmEzNEBjb2xsaW5zLmNvbQo+Pj4gLS0tCj4+PiAgYm9vdC94aWxpbngtcHJlYnVpbHQv
Q29uZmlnLmluICAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCj4+PiAgYm9v
dC94aWxpbngtcHJlYnVpbHQveGlsaW54LXByZWJ1aWx0Lm1rIHwgMjcgKysrKysrKysrKysrKysr
KysrKysrKysrLS0tCj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9ib290L3hpbGlueC1wcmVidWlsdC9Db25m
aWcuaW4gYi9ib290L3hpbGlueC1wcmVidWlsdC9Db25maWcuaW4KPj4+IGluZGV4IGQzZGYxYzA2
ZTcuLjk0ZWYzZGQxMTEgMTAwNjQ0Cj4+PiAtLS0gYS9ib290L3hpbGlueC1wcmVidWlsdC9Db25m
aWcuaW4KPj4+ICsrKyBiL2Jvb3QveGlsaW54LXByZWJ1aWx0L0NvbmZpZy5pbgo+Pj4gQEAgLTMx
LDYgKzMxLDMwIEBAIGNvbmZpZyBCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUwKPj4+
Cj4+PiAgZW5kY2hvaWNlCj4+Pgo+Pj4gK2NvbmZpZyBCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlM
VF9WRVJTQUxfWFNBCj4+PiArCWJvb2wgImRvd25sb2FkIGEgcHJlYnVpbHQgVmVyc2FsIFhTQSIK
Pj4+ICsJZGVwZW5kcyBvbiBCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUwKPj4+ICsJ
aGVscAo+Pj4gKwkgIFRoZSBYaWxpbnggU3VwcG9ydCBBcmNoaXZlIChYU0EpIHByb3ZpZGVzIGN1
c3RvbSBYaWxpbngKPj4+ICsJICBmaXJtd2FyZSBmaWxlcyBnZW5lcmF0ZWQgYnkgdGhlIEFNRCBW
aXZhZG8gRGVzaWduIFN1aXRlLgo+Pj4gKwo+Pj4gKwkgIGh0dHBzOi8vZG9jcy5hbWQuY29tL3Iv
ZW4tVVMvdWcxNDAwLXZpdGlzLWVtYmVkZGVkL0NyZWF0aW5nLWEtSGFyZHdhcmUtRGVzaWduLVhT
QS1GaWxlCj4+PiArCj4+PiAraWYgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMX1hT
QQo+Pj4gKwo+Pj4gK2NvbmZpZyBCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUxfWFNB
X0xPQ0FUSU9OCj4+PiArCXN0cmluZyAiVVJMIG9mIGN1c3RvbSBYU0EiCj4+PiArCWhlbHAKPj4+
ICsJICBUaGlzIG9wdGlvbiBhbGxvd3MgdG8gc3BlY2lmeSBhIFVSTCBwb2ludGluZyB0byBhbiBY
U0Egc291cmNlCj4+PiArCSAgZmlsZS4gVGhpcyBVUkwgY2FuIHVzZSBhbnkgcHJvdG9jb2wgcmVj
b2duaXplZCBieSBCdWlsZHJvb3QsCj4+PiArCSAgbGlrZSBodHRwOi8vLCBmdHA6Ly8sIGZpbGU6
Ly8gb3Igc2NwOi8vLgo+Pj4gKwo+Pj4gKwkgIFdoZW4gcG9pbnRpbmcgdG8gYSBsb2NhbCBYU0Eg
dXNpbmcgZmlsZTovLywgeW91IG1heSB3YW50IHRvCj4+PiArCSAgdXNlIGEgbWFrZSB2YXJpYWJs
ZSBsaWtlICQoVE9QRElSKSB0byByZWZlcmVuY2UgdGhlIHJvb3Qgb2YKPj4+ICsJICB0aGUgQnVp
bGRyb290IHRyZWUuCj4+PiArCj4+PiArZW5kaWYgIyBCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlM
VF9WRVJTQUxfWFNBCj4+PiArCj4+PiAgY29uZmlnIEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxU
X0ZBTUlMWQo+Pj4gIAlzdHJpbmcKPj4+ICAJZGVmYXVsdCAienlucW1wIiBpZiBCUjJfVEFSR0VU
X1hJTElOWF9QUkVCVUlMVF9aWU5RTVAKPj4+IGRpZmYgLS1naXQgYS9ib290L3hpbGlueC1wcmVi
dWlsdC94aWxpbngtcHJlYnVpbHQubWsgYi9ib290L3hpbGlueC1wcmVidWlsdC94aWxpbngtcHJl
YnVpbHQubWsKPj4+IGluZGV4IGQwOWY0YjEzZTIuLmMzMDAwYjdlNDUgMTAwNjQ0Cj4+PiAtLS0g
YS9ib290L3hpbGlueC1wcmVidWlsdC94aWxpbngtcHJlYnVpbHQubWsKPj4+ICsrKyBiL2Jvb3Qv
eGlsaW54LXByZWJ1aWx0L3hpbGlueC1wcmVidWlsdC5tawo+Pj4gQEAgLTUsOSArNSwyMCBAQAo+
Pj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+Pgo+Pj4gIFhJTElOWF9QUkVCVUlMVF9WRVJT
SU9OID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNJT04p
KQo+Pj4gKwo+Pj4gK2lmZXEgKCQoQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMX1hT
QSkseSkKPj4+ICtYSUxJTlhfUFJFQlVJTFRfRklMRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFS
R0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUxfWFNBX0xPQ0FUSU9OKSkKPj4+ICtYSUxJTlhfUFJF
QlVJTFRfU0lURSA9ICQocGF0c3Vic3QgJS8sJSwkKGRpciAkKFhJTElOWF9QUkVCVUlMVF9GSUxF
KSkpCj4+PiArWElMSU5YX1BSRUJVSUxUX1NPVVJDRSA9ICQobm90ZGlyICQoWElMSU5YX1BSRUJV
SUxUX0ZJTEUpKQo+Pj4gK2RlZmluZSBYSUxJTlhfUFJFQlVJTFRfRVhUUkFDVF9DTURTCj4+PiAr
CSQoVU5aSVApICQoWElMSU5YX1BSRUJVSUxUX0RMX0RJUikvJChYSUxJTlhfUFJFQlVJTFRfU09V
UkNFKSAtZCAkKEBEKQo+Pj4gK2VuZGVmCj4+PiArZWxzZSAjIEJSMl9UQVJHRVRfWElMSU5YX1BS
RUJVSUxUX1ZFUlNBTF9YU0EKPj4+ICBYSUxJTlhfUFJFQlVJTFRfU0lURSA9ICQoY2FsbCBnaXRo
dWIsWGlsaW54LHNvYy1wcmVidWlsdC1maXJtd2FyZSwkKFhJTElOWF9QUkVCVUlMVF9WRVJTSU9O
KSkKPj4+ICBYSUxJTlhfUFJFQlVJTFRfTElDRU5TRSA9IE1JVAo+Pj4gIFhJTElOWF9QUkVCVUlM
VF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+Pj4gK2VuZGlmICMgQlIyX1RBUkdFVF9YSUxJTlhf
UFJFQlVJTFRfVkVSU0FMX1hTQQo+Pj4gKwo+Pj4gIFhJTElOWF9QUkVCVUlMVF9JTlNUQUxMX1RB
UkdFVCA9IE5PCj4+PiAgWElMSU5YX1BSRUJVSUxUX0lOU1RBTExfSU1BR0VTID0gWUVTCj4+Pgo+
Pj4gQEAgLTIwLDEyICszMSwyMiBAQCBpZmVxICgkKEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxU
X1ZFUlNBTCkseSkKPj4+ICAjIFdlIG5lZWQgdGhlICoucGRpIGdsb2IsIGJlY2F1c2UgdGhlIGZp
bGUgaGFzIGRpZmZlcmVudCBuYW1lcyBmb3IgdGhlCj4+PiAgIyBkaWZmZXJlbnQgYm9hcmRzLCBi
dXQgdGhlcmUgaXMgb25seSBvbmUsIGFuZCBpdCBoYXMgdG8gYmUgbmFtZWQKPj4+ICAjIHZwbF9n
ZW5fZml4ZWQucGRpIHdoZW4gaW5zdGFsbGVkLgo+Pj4gK2lmZXEgKCQoQlIyX1RBUkdFVF9YSUxJ
TlhfUFJFQlVJTFRfVkVSU0FMX1hTQSkseSkKPj4+ICtYSUxJTlhfUFJFQlVJTFRfUExNID0gJChA
RCkvcGRpX2ZpbGVzL2dlbl9maWxlcy9wbG0uZWxmCj4+PiArWElMSU5YX1BSRUJVSUxUX1BTTUZX
ID0gJChARCkvcGRpX2ZpbGVzL3N0YXRpY19maWxlcy9wc21fZncuZWxmCj4+Cj4+IGlzICdfJyBj
aGFyYWN0ZXIgaW50ZW5kZWQgaW4gInBzbV9mdy5lbGYiIGZpbGUgbmFtZSBpbnN0ZWFkIG9mICJw
c21mdy5lbGYiIGFzCj4+IGZvciBYaWxpbnggZGV2IGJvYXJkcz8KPiAKPiBJIGhhZCBub3Qgbm90
aWNlZCB0aGF0LiBJIGRvdWJsZS1jaGVja2VkIGFuZCB0aGUgZmlsZSBkb2VzIGhhdmUgJ18nCj4g
aW5zaWRlIHRoZSBYU0EsIGJ1dCBkb2VzIG5vdCBpbiB0aGUgWGlsaW54IHByZWJ1aWx0IHJlcG8u
IEl0IGlzIHN0cmFuZ2UsCj4gYnV0IHRoaXMgZG9lcyB3b3JrIGFzIGludGVuZGVkLgoKT2ssIHRo
YXQgaXMgc3RyYW5nZSBpbmRlZWQuCgpNYXliZSBhIGNvbW1lbnQgYWJvdXQgdGhhdCBpbiB0aGUg
Lm1rIHdvdWxkIGJlIHVzZWZ1bD8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IFRoYW5rcyBm
b3Igc3BvdHRpbmcgdGhhdCwKPiBCcmFuZG9uCj4gCj4+Cj4+PiArWElMSU5YX1BSRUJVSUxUX1BE
SSA9ICQoQEQpLyoucGRpCj4+PiArZWxzZSAjIEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZF
UlNBTF9YU0EKPj4+ICtYSUxJTlhfUFJFQlVJTFRfUExNID0gJChYSUxJTlhfUFJFQlVJTFRfQk9B
UkRfRElSKS9wbG0uZWxmCj4+PiArWElMSU5YX1BSRUJVSUxUX1BTTUZXID0gJChYSUxJTlhfUFJF
QlVJTFRfQk9BUkRfRElSKS9wc21mdy5lbGYKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl4KPj4KPj4gQmVzdCByZWdhcmRz
LAo+PiBSb21haW4KPj4KPj4KPj4+ICtYSUxJTlhfUFJFQlVJTFRfUERJID0gJChYSUxJTlhfUFJF
QlVJTFRfQk9BUkRfRElSKS8qLnBkaQo+Pj4gK2VuZGlmICMgQlIyX1RBUkdFVF9YSUxJTlhfUFJF
QlVJTFRfVkVSU0FMX1hTQQo+Pj4gKwo+Pj4gIGRlZmluZSBYSUxJTlhfUFJFQlVJTFRfSU5TVEFM
TAo+Pj4gLQkkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChYSUxJTlhfUFJFQlVJTFRfQk9BUkRfRElS
KS9wbG0uZWxmIFwKPj4+ICsJJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoWElMSU5YX1BSRUJVSUxU
X1BMTSkgXAo+Pj4gIAkJJChCSU5BUklFU19ESVIpL3BsbS5lbGYKPj4+IC0JJChJTlNUQUxMKSAt
RCAtbSAwNzU1ICQoWElMSU5YX1BSRUJVSUxUX0JPQVJEX0RJUikvcHNtZncuZWxmIFwKPj4+ICsJ
JChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoWElMSU5YX1BSRUJVSUxUX1BTTUZXKSBcCj4+PiAgCQkk
KEJJTkFSSUVTX0RJUikvcHNtZncuZWxmCj4+PiAtCSQoSU5TVEFMTCkgLUQgLW0gMDc1NSAkKFhJ
TElOWF9QUkVCVUlMVF9CT0FSRF9ESVIpLyoucGRpIFwKPj4+ICsJJChJTlNUQUxMKSAtRCAtbSAw
NzU1ICQoWElMSU5YX1BSRUJVSUxUX1BESSkgXAo+Pj4gIAkJJChCSU5BUklFU19ESVIpL3ZwbF9n
ZW5fZml4ZWQucGRpCj4+PiAgZW5kZWYKPj4+ICBlbHNlICMgQlIyX1RBUkdFVF9YSUxJTlhfUFJF
QlVJTFRfVkVSU0FMCj4+Pgo+Pj4gLS0tCj4+PiBiYXNlLWNvbW1pdDogNTVjOGMyMzI4ZTczNzI1
ZTlhYjQxYzhkYzU2NmIwOWY0OWYyYWFkNQo+Pj4gY2hhbmdlLWlkOiAyMDI0MDYyMS12ZXJzYWwt
eHNhLXN1cHBvcnQtcHJlYnVpbHQtOWM1YWVkNWJlNjg3Cj4+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+
Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
