Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3218C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 16:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10C6D6076B;
	Sat, 13 Jul 2024 16:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bd7dILPrqPfn; Sat, 13 Jul 2024 16:08:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D96C56078A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D96C56078A;
	Sat, 13 Jul 2024 16:08:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E16D11BF3FB
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA64C4018E
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id caahuSM2uUSl for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 16:08:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A01D40096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A01D40096
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A01D40096
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 16:08:06 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52e9fe05354so4220938e87.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720886885; x=1721491685;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p8bUkW7WJALhWtt5pho23MAYxhJoWKSJ4XSnb92dX3I=;
 b=uO52x+FUMYZeDMl3Qsv1es2aMw/MmQGypV8MrjDze7yOP98UaIpeeoCpvwyLauCVZd
 gOo4wc6tXvS1OtW1a5jMyf567KsZCNQfYwR7y8kz+2MOMHmdZJ8xLbkuYIhBxda+pJou
 rYr7eC2W7KDqY854b+EZkPjGQaqlUeHeisfosDJB6180XXlrGp9STwYuxbei2u+qdRtg
 /SaGsWFpoKrxXE4CfHvWW0Mq9BBolG1ddnaJ+x5Jp0OwtyYgdVvJUlCsdprqP7fPgez2
 HOtg6ixVld043x6bPV26z65eJCwj9Os/XvtY7XCxyRwC5FRXoqY2dgc9kgLoNxpzsHvY
 i3Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmTFODHBd9hDh8gAUngWrEm1/bz11bGvtS5vqYzYFvUPYs5t/EvnhmlmCFrCUG3FUNMh9m7lX2FJG0hB+cj10sOmT6rVoNJQ==
X-Gm-Message-State: AOJu0YwiXLksZ8+7glK24jjCFxw8iVLGNYdd+IGZAJD77nrYba1KbOiq
 q42/dZ86aoNEDB40+XVMipcizY1veifpFI8IIWWRAfG2CjCM2y4g5Ntbv78VMGa/uF+LoHMUUKN
 sMRo=
X-Google-Smtp-Source: AGHT+IGCKON9opO0Fgw8ynPk9+L7uQSslXjmSqBfA3TLGQovewLMkRjnIjTdZU+0O6BVf2j5KSj6Ew==
X-Received: by 2002:a19:8c5a:0:b0:52e:76bb:c906 with SMTP id
 2adb3069b0e04-52eb99d5f20mr8649111e87.61.1720886884616; 
 Sat, 13 Jul 2024 09:08:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f239876sm60689715e9.3.2024.07.13.09.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 09:08:04 -0700 (PDT)
Message-ID: <7d46feba-19c0-4cb4-aeb9-898e863691a3@smile.fr>
Date: Sat, 13 Jul 2024 18:08:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240701-versal-xsa-support-prebuilt-v3-1-3d3e9318d181@collins.com>
Content-Language: fr
In-Reply-To: <20240701-versal-xsa-support-prebuilt-v3-1-3d3e9318d181@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720886885; x=1721491685; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p8bUkW7WJALhWtt5pho23MAYxhJoWKSJ4XSnb92dX3I=;
 b=bZMB+MR7p7fYDrvC1HQC+tn0QtAR0aNctW2yQ+2VUujUzkRK7el5ONcOioRsns5uwE
 ocoOV3VWYQ3oBC8pt9G7jUS3nJkDUeJe7Sq6zzepgNs+V6tC6hGOJas9QqsDy0g16R+N
 GmmwvkIKHctTuhpgVIcz6aqTK4Q7qYzcizIiM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=bZMB+MR7
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

SGVsbG8gQnJhbmRvbiwgQWxsLAoKTGUgMDEvMDcvMjAyNCDDoCAxODo0OCwgQnJhbmRvbiBNYWll
ciB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gVGhlIHhpbGlueC1wcmVidWlsdCBwYWNrYWdl
IG9ubHkgc3VwcG9ydHMgZGV2ZWxvcG1lbnQgYm9hcmRzIHRoYXQgWGlsaW54Cj4gaGFzIHB1Ymxp
c2hlZCBmaXJtd2FyZSBmb3IuIEN1c3RvbSBkZXNpZ25zIGJhc2VkIG9uIHRoZSBYaWxpbnggcGxh
dGZvcm0KPiBtdXN0IGdlbmVyYXRlIHRoZWlyIG93biBmaXJtd2FyZSB1c2luZyB0aGUgQU1EIFZp
dmFkbyBEZXNpZ24gU3VpdGUuCj4gCj4gVml2YWRvIHByb2R1Y2VzIGFuIFhTQSBmaWxlLCB3aGlj
aCBpcyBhIFppcCBmaWxlIGNvbnRhaW5pbmcgYWxsIHRoZQo+IGZpcm13YXJlIG5lZWRlZCBieSB4
aWxpbngtcHJlYnVpbHQuIFdlIGV4dGVuZCB4aWxpbngtcHJlYnVpbHQgdG8KPiBkb3dubG9hZCBj
dXN0b20gWFNBIGZpbGVzIGFuZCBleHRyYWN0IHRoZWlyIGNvbnRlbnRzLgo+IAo+IFJldmlld2Vk
LWJ5OiBOZWFsIEZyYWdlciA8bmVhbC5mcmFnZXJAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBC
cmFuZG9uIE1haWVyIDxicmFuZG9uLm1haWVyQGNvbGxpbnMuY29tPgo+IC0tLQo+IENoYW5nZXMg
aW4gdjM6Cj4gLSBSZWJhc2Ugb24gdXBzdHJlYW0gY2hhbmdlcyB0byBib290L3hpbGlueC1wcmVi
dWlsdAo+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDYyNi12
ZXJzYWwteHNhLXN1cHBvcnQtcHJlYnVpbHQtdjItMS03MjRiMDBjNDU5NmRAY29sbGlucy5jb20K
PiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gRml4IGhlbHAgdGV4dCB0byBzYXkgWFNBIGlzIGNyZWF0
ZWQgYnkgVml2YWRvIFtOZWFsXQo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI0MDYyNS12ZXJzYWwteHNhLXN1cHBvcnQtcHJlYnVpbHQtdjEtMS1mNjRhN2EzOTZh
MzRAY29sbGlucy5jb20KPiAtLS0KPiAgYm9vdC94aWxpbngtcHJlYnVpbHQvQ29uZmlnLmluICAg
ICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGJvb3QveGlsaW54LXByZWJ1
aWx0L3hpbGlueC1wcmVidWlsdC5tayB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2Jvb3QveGlsaW54LXByZWJ1aWx0L0NvbmZpZy5pbiBiL2Jvb3QveGlsaW54
LXByZWJ1aWx0L0NvbmZpZy5pbgo+IGluZGV4IGQzZGYxYzA2ZTcuLjk0ZWYzZGQxMTEgMTAwNjQ0
Cj4gLS0tIGEvYm9vdC94aWxpbngtcHJlYnVpbHQvQ29uZmlnLmluCj4gKysrIGIvYm9vdC94aWxp
bngtcHJlYnVpbHQvQ29uZmlnLmluCj4gQEAgLTMxLDYgKzMxLDMwIEBAIGNvbmZpZyBCUjJfVEFS
R0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUwKPiAgCj4gIGVuZGNob2ljZQo+ICAKPiArY29uZmln
IEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNBTF9YU0EKPiArCWJvb2wgImRvd25sb2Fk
IGEgcHJlYnVpbHQgVmVyc2FsIFhTQSIKPiArCWRlcGVuZHMgb24gQlIyX1RBUkdFVF9YSUxJTlhf
UFJFQlVJTFRfVkVSU0FMCj4gKwloZWxwCj4gKwkgIFRoZSBYaWxpbnggU3VwcG9ydCBBcmNoaXZl
IChYU0EpIHByb3ZpZGVzIGN1c3RvbSBYaWxpbngKPiArCSAgZmlybXdhcmUgZmlsZXMgZ2VuZXJh
dGVkIGJ5IHRoZSBBTUQgVml2YWRvIERlc2lnbiBTdWl0ZS4KPiArCj4gKwkgIGh0dHBzOi8vZG9j
cy5hbWQuY29tL3IvZW4tVVMvdWcxNDAwLXZpdGlzLWVtYmVkZGVkL0NyZWF0aW5nLWEtSGFyZHdh
cmUtRGVzaWduLVhTQS1GaWxlCj4gKwo+ICtpZiBCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9W
RVJTQUxfWFNBCj4gKwo+ICtjb25maWcgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FM
X1hTQV9MT0NBVElPTgo+ICsJc3RyaW5nICJVUkwgb2YgY3VzdG9tIFhTQSIKPiArCWhlbHAKPiAr
CSAgVGhpcyBvcHRpb24gYWxsb3dzIHRvIHNwZWNpZnkgYSBVUkwgcG9pbnRpbmcgdG8gYW4gWFNB
IHNvdXJjZQo+ICsJICBmaWxlLiBUaGlzIFVSTCBjYW4gdXNlIGFueSBwcm90b2NvbCByZWNvZ25p
emVkIGJ5IEJ1aWxkcm9vdCwKPiArCSAgbGlrZSBodHRwOi8vLCBmdHA6Ly8sIGZpbGU6Ly8gb3Ig
c2NwOi8vLgo+ICsKPiArCSAgV2hlbiBwb2ludGluZyB0byBhIGxvY2FsIFhTQSB1c2luZyBmaWxl
Oi8vLCB5b3UgbWF5IHdhbnQgdG8KPiArCSAgdXNlIGEgbWFrZSB2YXJpYWJsZSBsaWtlICQoVE9Q
RElSKSB0byByZWZlcmVuY2UgdGhlIHJvb3Qgb2YKPiArCSAgdGhlIEJ1aWxkcm9vdCB0cmVlLgo+
ICsKPiArZW5kaWYgIyBCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUxfWFNBCj4gKwo+
ICBjb25maWcgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfRkFNSUxZCj4gIAlzdHJpbmcKPiAg
CWRlZmF1bHQgInp5bnFtcCIgaWYgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfWllOUU1QCj4g
ZGlmZiAtLWdpdCBhL2Jvb3QveGlsaW54LXByZWJ1aWx0L3hpbGlueC1wcmVidWlsdC5tayBiL2Jv
b3QveGlsaW54LXByZWJ1aWx0L3hpbGlueC1wcmVidWlsdC5tawo+IGluZGV4IGQwOWY0YjEzZTIu
LmMzMDAwYjdlNDUgMTAwNjQ0Cj4gLS0tIGEvYm9vdC94aWxpbngtcHJlYnVpbHQveGlsaW54LXBy
ZWJ1aWx0Lm1rCj4gKysrIGIvYm9vdC94aWxpbngtcHJlYnVpbHQveGlsaW54LXByZWJ1aWx0Lm1r
Cj4gQEAgLTUsOSArNSwyMCBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAgWElM
SU5YX1BSRUJVSUxUX1ZFUlNJT04gPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9YSUxJTlhf
UFJFQlVJTFRfVkVSU0lPTikpCj4gKwo+ICtpZmVxICgkKEJSMl9UQVJHRVRfWElMSU5YX1BSRUJV
SUxUX1ZFUlNBTF9YU0EpLHkpCj4gK1hJTElOWF9QUkVCVUlMVF9GSUxFID0gJChjYWxsIHFzdHJp
cCwkKEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNBTF9YU0FfTE9DQVRJT04pKQo+ICtY
SUxJTlhfUFJFQlVJTFRfU0lURSA9ICQocGF0c3Vic3QgJS8sJSwkKGRpciAkKFhJTElOWF9QUkVC
VUlMVF9GSUxFKSkpCj4gK1hJTElOWF9QUkVCVUlMVF9TT1VSQ0UgPSAkKG5vdGRpciAkKFhJTElO
WF9QUkVCVUlMVF9GSUxFKSkKPiArZGVmaW5lIFhJTElOWF9QUkVCVUlMVF9FWFRSQUNUX0NNRFMK
PiArCSQoVU5aSVApICQoWElMSU5YX1BSRUJVSUxUX0RMX0RJUikvJChYSUxJTlhfUFJFQlVJTFRf
U09VUkNFKSAtZCAkKEBEKQo+ICtlbmRlZgo+ICtlbHNlICMgQlIyX1RBUkdFVF9YSUxJTlhfUFJF
QlVJTFRfVkVSU0FMX1hTQQo+ICBYSUxJTlhfUFJFQlVJTFRfU0lURSA9ICQoY2FsbCBnaXRodWIs
WGlsaW54LHNvYy1wcmVidWlsdC1maXJtd2FyZSwkKFhJTElOWF9QUkVCVUlMVF9WRVJTSU9OKSkK
PiAgWElMSU5YX1BSRUJVSUxUX0xJQ0VOU0UgPSBNSVQKPiAgWElMSU5YX1BSRUJVSUxUX0xJQ0VO
U0VfRklMRVMgPSBMSUNFTlNFCj4gK2VuZGlmICMgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRf
VkVSU0FMX1hTQQo+ICsKPiAgWElMSU5YX1BSRUJVSUxUX0lOU1RBTExfVEFSR0VUID0gTk8KPiAg
WElMSU5YX1BSRUJVSUxUX0lOU1RBTExfSU1BR0VTID0gWUVTCj4gIAo+IEBAIC0yMCwxMiArMzEs
MjIgQEAgaWZlcSAoJChCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUwpLHkpCj4gICMg
V2UgbmVlZCB0aGUgKi5wZGkgZ2xvYiwgYmVjYXVzZSB0aGUgZmlsZSBoYXMgZGlmZmVyZW50IG5h
bWVzIGZvciB0aGUKPiAgIyBkaWZmZXJlbnQgYm9hcmRzLCBidXQgdGhlcmUgaXMgb25seSBvbmUs
IGFuZCBpdCBoYXMgdG8gYmUgbmFtZWQKPiAgIyB2cGxfZ2VuX2ZpeGVkLnBkaSB3aGVuIGluc3Rh
bGxlZC4KPiAraWZlcSAoJChCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUxfWFNBKSx5
KQo+ICtYSUxJTlhfUFJFQlVJTFRfUExNID0gJChARCkvcGRpX2ZpbGVzL2dlbl9maWxlcy9wbG0u
ZWxmCj4gK1hJTElOWF9QUkVCVUlMVF9QU01GVyA9ICQoQEQpL3BkaV9maWxlcy9zdGF0aWNfZmls
ZXMvcHNtX2Z3LmVsZgoKaXMgJ18nIGNoYXJhY3RlciBpbnRlbmRlZCBpbiAicHNtX2Z3LmVsZiIg
ZmlsZSBuYW1lIGluc3RlYWQgb2YgInBzbWZ3LmVsZiIgYXMKZm9yIFhpbGlueCBkZXYgYm9hcmRz
PwoKPiArWElMSU5YX1BSRUJVSUxUX1BESSA9ICQoQEQpLyoucGRpCj4gK2Vsc2UgIyBCUjJfVEFS
R0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUxfWFNBCj4gK1hJTElOWF9QUkVCVUlMVF9QTE0gPSAk
KFhJTElOWF9QUkVCVUlMVF9CT0FSRF9ESVIpL3BsbS5lbGYKPiArWElMSU5YX1BSRUJVSUxUX1BT
TUZXID0gJChYSUxJTlhfUFJFQlVJTFRfQk9BUkRfRElSKS9wc21mdy5lbGYKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl4KCkJl
c3QgcmVnYXJkcywKUm9tYWluCgoKPiArWElMSU5YX1BSRUJVSUxUX1BESSA9ICQoWElMSU5YX1BS
RUJVSUxUX0JPQVJEX0RJUikvKi5wZGkKPiArZW5kaWYgIyBCUjJfVEFSR0VUX1hJTElOWF9QUkVC
VUlMVF9WRVJTQUxfWFNBCj4gKwo+ICBkZWZpbmUgWElMSU5YX1BSRUJVSUxUX0lOU1RBTEwKPiAt
CSQoSU5TVEFMTCkgLUQgLW0gMDc1NSAkKFhJTElOWF9QUkVCVUlMVF9CT0FSRF9ESVIpL3BsbS5l
bGYgXAo+ICsJJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoWElMSU5YX1BSRUJVSUxUX1BMTSkgXAo+
ICAJCSQoQklOQVJJRVNfRElSKS9wbG0uZWxmCj4gLQkkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChY
SUxJTlhfUFJFQlVJTFRfQk9BUkRfRElSKS9wc21mdy5lbGYgXAo+ICsJJChJTlNUQUxMKSAtRCAt
bSAwNzU1ICQoWElMSU5YX1BSRUJVSUxUX1BTTUZXKSBcCj4gIAkJJChCSU5BUklFU19ESVIpL3Bz
bWZ3LmVsZgo+IC0JJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoWElMSU5YX1BSRUJVSUxUX0JPQVJE
X0RJUikvKi5wZGkgXAo+ICsJJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoWElMSU5YX1BSRUJVSUxU
X1BESSkgXAo+ICAJCSQoQklOQVJJRVNfRElSKS92cGxfZ2VuX2ZpeGVkLnBkaQo+ICBlbmRlZgo+
ICBlbHNlICMgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMCj4gCj4gLS0tCj4gYmFz
ZS1jb21taXQ6IDU1YzhjMjMyOGU3MzcyNWU5YWI0MWM4ZGM1NjZiMDlmNDlmMmFhZDUKPiBjaGFu
Z2UtaWQ6IDIwMjQwNjIxLXZlcnNhbC14c2Etc3VwcG9ydC1wcmVidWlsdC05YzVhZWQ1YmU2ODcK
PiAKPiBCZXN0IHJlZ2FyZHMsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
