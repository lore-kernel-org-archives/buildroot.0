Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2B3C83F21
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 09:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E89448385D;
	Tue, 15 Jul 2025 09:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHwi0OazRlTy; Tue, 15 Jul 2025 09:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E17F2832D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E17F2832D8;
	Tue, 15 Jul 2025 09:19:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 364F5DF
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 09:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CB906106F
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 09:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSuK8YBXi6Bo for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 09:19:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E6F766106A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6F766106A
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6F766106A
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 09:19:42 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ae0e0271d82so941007866b.3
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 02:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752571180; x=1753175980;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PlEhw7AfkRg8ZvjUH8AmbYFo3TTXexijrSQ8HF24p/Y=;
 b=LLyhvsmBuBKEjNNKM/gmdR2gVZebAyLrnFVW+1RyaBk2YAyrGoLcsaW4n3OUPoVJaX
 gZsi22iumPbBeA3laQkth50xsG9PF1+1Bny1i1I7Z7DvYnI/yET8puYAJ1bt9UEin4zQ
 fQdUaLP4xlrdPS9d0lBu/p520h7UAjrHvm2oFpgUy/WbXMvH3uXI6xj8mkHvYyeGVmPy
 5gl0N/DZppDGuSfDyfOT27Hf31itrK9LZFRZeWIJRM8JBj9l2JXmZCPAtHe3whIm5GMU
 AQAMdeo5LFKae6UoYIBBjG9vO0G9fVVmAf/KRkaLxz2uuqhuwFMUAZRoX76le6bX1CDk
 PxGQ==
X-Gm-Message-State: AOJu0Yyapx5MUJveAJrWBYjJkqd4zhbMHi8Usn6PxrwcRuheqNkDR7iq
 Vni+ZcnQLF+k/pjni+QXpzUHzIF9UhcvgLDQJN4L5WpWvxUFjhEX1Eq1czyvcRNfST8z3GZodVb
 juNhc
X-Gm-Gg: ASbGncu/FtDZduBzaD9I1CyJYacF8pU3xbpp/r/SMAk7I0jb2Qz6re+v7kYU2Trmh1N
 5/ipoR23pnJ6odSchcxIfbkjrzrp1fVPZvLGoqUER2ZTl/02wRa2NV7UC3/CzSdGhFSoX9/qGr0
 P4zjfuBGX1a3O+315VeDftLlRO5aOfPjxFDxyB7CrpU3xciNxQ3Yv+cLMdBtz5T3sPF405zs9P/
 DPRCXOtslpHZyaybDySqkZHO6AtmU7L/osoVQ2fnDASc6iGPvxgeU3zASOuaFl66Yq1g6HwnjnY
 iip8B1nzw3+3gGOGBAypppE86DhR1wb3R5LjeaZz90sU8luaH0zCvN3wmgp6z1xr+z9HCOthEUw
 nIeAejHjs5FXTuPQZowDqNEo=
X-Google-Smtp-Source: AGHT+IFABcdBG26iDl0BqPfjvzAqsKc4LCqpbuF52/PkZvm6wPhizobtwKbUsNUolHHVfFhHgVr/lw==
X-Received: by 2002:a17:906:9f8c:b0:ae0:9363:4d5d with SMTP id
 a640c23a62f3a-ae6fbc13b3emr1734536166b.2.1752571179932; 
 Tue, 15 Jul 2025 02:19:39 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8294013sm967851166b.118.2025.07.15.02.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 02:19:39 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5D86A5F867;
 Tue, 15 Jul 2025 10:19:38 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <huth@tuxfamily.org>
Cc: buildroot@buildroot.org,  Cyril Bur <cyrilbur@gmail.com>
In-Reply-To: <20250712083447.109f690b@tpx1> (Thomas Huth's message of "Sat, 12
 Jul 2025 08:34:47 +0200")
References: <20250711164407.799041-1-alex.bennee@linaro.org>
 <20250711164407.799041-4-alex.bennee@linaro.org>
 <20250712083447.109f690b@tpx1>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Tue, 15 Jul 2025 10:19:38 +0100
Message-ID: <8734ax24lx.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752571180; x=1753175980; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PlEhw7AfkRg8ZvjUH8AmbYFo3TTXexijrSQ8HF24p/Y=;
 b=lXFkw4WaBp7zvMt1MgGRSa2urGJJP432uycuZNZW6lrJIHx0QKpfCQewPI9VpUeSvi
 k3rrRnSZKn8gpWE+x/DIsdGj0dA3ge/86rlCGdXzGjM0dOZ5W3e/av8KhAlykWO2p3I5
 3zcw3ddiyHr2DOfZBPZ1JL9O4LdLfaoBfUexodvCujZ9Z4tiq2vJ9Xd8TQKLO6ysapW9
 4c8WVyUdL8GmGzxg+Lh3EbiZ22HASKGxpocP7Wu+wZl4rDb0WCug9nJo1VwJ03eMkJnr
 LPaM1QC2PSUJaaZ/ZAgVLJ3ShV6Oj4jViUnGZwWqCtfwt2MF97Qwrb3atKLwqpolNNcu
 2BcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lXFkw4Wa
Subject: Re: [Buildroot] [RFC PATCH v2 3/7] package/kvm-unit-tests: update
 dependencies
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzIEh1dGggPGh1dGhAdHV4ZmFtaWx5Lm9yZz4gd3JpdGVzOgoKPiBBbSBGcmksIDExIEp1
bCAyMDI1IDE3OjQ0OjAxICswMTAwCj4gc2NocmllYiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVl
QGxpbmFyby5vcmc+Ogo+Cj4+IFRvIHJ1biB0aGUgdGVzdHMgd2UgbmVlZCBhIHN5c3RlbSBRRU1V
LCB0aW1lb3V0LCBnZXRjb25mIGFuZCBubWFwLW5jYXQKPj4gc28gdXBkYXRlIHRoZSBzZWxlY3Qv
ZGVwZW5kcyBmb3IgdGhlbS4gQXMgd2UgbmVlZCBhdCBsZWFzdCBHQ0MgOCB3ZQo+PiBjYW4gZHJv
cCB0aGUgc3BlY2lmaWMgcmVxdWlyZW1lbnQgZm9yIG9sZCB4ODYtNjQgdGVzdHMuCj4+IAo+PiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4+IAo+
PiAtLS0KPj4gdjIKPj4gICAtIHJlbW92ZSBvbGQgZ2NjIG5vdGVzIGFzIHdlIG5lZWQgYXQgbGVh
c3QgOCBhbnl3YXkKPj4gICAtIHNlbGVjdCBRRU1VIGFuZCBvdGhlciBydW50aW1lIGRlcHMKPj4g
ICAtIG1lbnRpb24gdGhlIHJ1bnRpbWUgZGVwcwo+PiAgIC0gYWRkIHN1cHBvcnQgZm9yIGdldGNv
bmYgZnJvbSBleHRlcm5hbCB0b29sY2hhaW4KPj4gICAtIHVwZGF0ZSBjb21tZW50IGZhbGxiYWNr
Cj4+IC0tLQo+PiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4gfCAyNCArKysrKysr
KysrKysrKysrKy0tLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMv
Q29uZmlnLmluIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4KPj4gaW5kZXggODdi
MDc1YzRiOS4uNzc1YjI1MGQ1ZiAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0
cy9Db25maWcuaW4KPj4gKysrIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4KPj4g
QEAgLTE0LDEyICsxNCwxOSBAQCBjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQVJD
SF9TVVBQT1JUUwo+PiAgCj4+ICBjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFMKPj4g
IAlib29sICJrdm0tdW5pdC10ZXN0cyIKPj4gLQlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0tWTV9V
TklUX1RFU1RTX0FSQ0hfU1VQUE9SVFMKPj4gLQkjIG9uIGkzODYgYW5kIHg4Ni02NCwgX19idWls
dGluX3JlYWNoYWJsZSBpcyB1c2VkLCBzbyB3ZSBuZWVkCj4+IC0JIyBnY2MgNC41IGF0IGxlYXN0
LiBvbiBpMzg2LCB3ZSB1c2UgdGhlIHRhcmdldCBnY2MsIHdoaWxlIG9uCj4+IC0JIyB4ODYtNjQg
d2UgdXNlIHRoZSBob3N0IGdjYyAoc2VlIC5tayBmaWxlIGZvciBkZXRhaWxzKQo+PiAtCWRlcGVu
ZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF81IHx8ICFCUjJfaTM4Ngo+PiAgCWRl
cGVuZHMgb24gQlIyX0hPU1RBUkNIID0gIng4Nl82NCIgfHwgIUJSMl94ODZfNjQKPj4gKwlkZXBl
bmRzIG9uIEJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTX0FSQ0hfU1VQUE9SVFMKPj4gKwlkZXBl
bmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzggIyBxZW11Cj4+ICsJZGVwZW5kcyBv
biBCUjJfUEFDS0FHRV9RRU1VX0FSQ0hfU1VQUE9SVFNfVEFSR0VUCj4+ICsJZGVwZW5kcyBvbiAo
QlIyX1BBQ0tBR0VfR0xJQkNfVVRJTFMgfHwgXAo+PiArCQkgICAgQlIyX1VDTElCQ19JTlNUQUxM
X1VUSUxTIHx8IFwKPj4gKwkJICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfTElCQ19VVElMU19D
T1BZKSAjIHJ1bnRpbWUgZ2V0Y29uZgo+PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VCj4+ICsJ
c2VsZWN0IEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNICMgcnVudGltZSBmb3IgcWVtdS1zeXN0ZW0t
JEFSQ0gKPgo+IEFGQUlLIGt2bS11bml0LXRlc3RzIGNhbiBiZSB1c2VkIHdpdGgga3ZtdG9vbCBp
bnN0ZWFkIG9mIFFFTVUsIHRvbyAuLi4gc28KPiBoYXJkLWNvZGluZyBRRU1VIGhpZ2ggbWlnaHQg
bm90IGJlIHRoZSBiZXN0IHNvbHV0aW9uIGZvciB0aGUgdXNlcj8KClRoZSBjdXJyZW50IGJ1aWxk
IGRvZXNuJ3Qgc3VwcG9ydCBrdm10b29sIGJ1dCBtYXliZSBzb21ldGhpbmcgbGlrZSB0aGlzCmFz
IGEgZm9sbG93LW9uIHBhdGNoOgoKLS04PC0tLS0tLS0tLS0tLS0tLWN1dCBoZXJlLS0tLS0tLS0t
LS0tLS0tc3RhcnQtLS0tLS0tLS0tLS0tPjgtLS0KbW9kaWZpZWQgICBwYWNrYWdlL2t2bS11bml0
LXRlc3RzL0NvbmZpZy5pbgpAQCAtMjEsOCArMjEsOCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfS1ZN
X1VOSVRfVEVTVFMKIAlkZXBlbmRzIG9uIChCUjJfUEFDS0FHRV9HTElCQ19VVElMUyB8fCBcCiAJ
CSAgICBCUjJfVUNMSUJDX0lOU1RBTExfVVRJTFMgfHwgXAogCQkgICAgQlIyX1RPT0xDSEFJTl9F
WFRFUk5BTF9MSUJDX1VUSUxTX0NPUFkpICMgcnVudGltZSBnZXRjb25mCi0Jc2VsZWN0IEJSMl9Q
QUNLQUdFX1FFTVUKLQlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0gIyBydW50aW1lIGZv
ciBxZW11LXN5c3RlbS0kQVJDSAorCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VIGlmICFCUjJfUEFD
S0FHRV9LVk1UT09MCisJc2VsZWN0IEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNIGlmICFCUjJfUEFD
S0FHRV9LVk1UT09MICMgcnVudGltZSBmb3IgcWVtdS1zeXN0ZW0tJEFSQ0gKIAlzZWxlY3QgQlIy
X1BBQ0tBR0VfQ09SRVVUSUxTICMgcnVudGltZSBmb3IgdGltZW91dAogCXNlbGVjdCBCUjJfUEFD
S0FHRV9CQVNIICMgcnVudGltZQogCXNlbGVjdCBCUjJfUEFDS0FHRV9OTUFQCm1vZGlmaWVkICAg
cGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tawpAQCAtMzYsNiArMzYsMTMg
QEAgS1ZNX1VOSVRfVEVTVFNfQ09ORl9PUFRTID1cCiAJLS1wcm9jZXNzb3I9IiQoR0NDX1RBUkdF
VF9DUFUpIiBcCiAJLS1lbmRpYW49IiQoS1ZNX1VOSVRfVEVTVFNfRU5ESUFOKSIKIAorIyBUaGUg
ZGVmYXVsdCBydW5uZXIgaXMgUUVNVSBidXQga3ZtdG9vbCBjYW4gYmUgdXNlZAoraWZlcSAoJChC
UjJfUEFDS0FHRV9RRU1VX1NZU1RFTSkseSkKK0tWTV9VTklUX1RFU1RTX0NPTkZfT1BUUyArPSAt
LXRhcmdldD1xZW11CitlbHNlIGlmZXEgKCQoQlIyX1BBQ0tBR0VfS1ZNVE9PTCkseSkKK0tWTV9V
TklUX1RFU1RTX0NPTkZfT1BUUyArPSAtLXRhcmdldD1rdm10b29sCitlbmRpZgorCiBpZmVxICgk
KEJSMl9BUk02NF9QQUdFX1NJWkVfNEspLHkpCiBLVk1fVU5JVF9URVNUU19DT05GX09QVFMgKz0g
LS1wYWdlLXNpemU9NGsKIGVsc2UgaWZlcSAoJChCUjJfQVJNNjRfUEFHRV9TSVpFXzE2SykseSkK
LS04PC0tLS0tLS0tLS0tLS0tLWN1dCBoZXJlLS0tLS0tLS0tLS0tLS0tZW5kLS0tLS0tLS0tLS0t
LS0tPjgtLS0KCldoYXQgZG8geW91IHRoaW5rPwoKPgo+ICBUaG9tYXMKCi0tIApBbGV4IEJlbm7D
qWUKVmlydHVhbGlzYXRpb24gVGVjaCBMZWFkIEAgTGluYXJvCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
