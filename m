Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B4FC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 17:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCB7B40B23;
	Mon,  8 Jul 2024 17:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHCm8XZ16M0b; Mon,  8 Jul 2024 17:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BEA140148
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BEA140148;
	Mon,  8 Jul 2024 17:24:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CB831BF348
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 17:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A19480D09
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 17:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eA1iYm4FXpPF for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 17:24:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0DFC80C2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0DFC80C2C
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0DFC80C2C
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 17:24:11 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52caebc6137so2831419e87.0
 for <buildroot@buildroot.org>; Mon, 08 Jul 2024 10:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720459449; x=1721064249;
 h=content-transfer-encoding:subject:to:content-language:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aj7qJH68DL17ZAfM8gAWmNxowjV9TjMaa/oE1Nsucio=;
 b=dAxULLk//mF2ZRNh2HoUFEjb+R8fxp0Xftuixb6crEwPlI/uIUSxVnkoQxlGyjIfSd
 8T5fhoBvz0IG7w4UH/pSQpFSWkD2TQAxuQSrAWCKVCFxnDVdSyoHoxX3hInooooVcKO2
 nukiaEdagRNJZVV4l2XXUglFwIUWgdfwZdUqRSPoKPfyyiCSmXc9UzyHZA7g33UYyg+a
 7G2iWqtSiCEduH4B5m7/0EzpBE8/ncZD1umQIpIJChWH6xeGD/4lIXCp0kPOsAOXD41P
 CDjBgu2TNirlsdThmNlLFNHQOzU9KMxDjttUjw2w/WT/UU4Ct0arOJdIwzMCY7vHkpY/
 FAOA==
X-Gm-Message-State: AOJu0YwdDReRfaovp1YLQcRc6rwpYJbjSa4mDQPn8ZnTAptoiatQALIG
 Mn+1fwfgiwPdKPeWAcGcuTwE82nAC/TRzZxlPYkyJ8aVIwmsM3Nud27yVBkal2/CrqH7SQtZ+7j
 k
X-Google-Smtp-Source: AGHT+IFXbXwSJsbXjqpsBR4YIH5VtnPRlU8B8RxtUF0rYveEWhPCiMDWblSYHM5H79r+omQXHAcb/A==
X-Received: by 2002:ac2:498d:0:b0:52b:c14d:733c with SMTP id
 2adb3069b0e04-52ea06f48efmr7244231e87.68.1720459449329; 
 Mon, 08 Jul 2024 10:24:09 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6f1182sm6115565e9.14.2024.07.08.10.24.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 10:24:08 -0700 (PDT)
Message-ID: <541495c8-6ebf-4161-81d2-217f2165efa5@mind.be>
Date: Mon, 8 Jul 2024 19:24:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720459449; x=1721064249; darn=buildroot.org;
 h=content-transfer-encoding:subject:to:content-language:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aj7qJH68DL17ZAfM8gAWmNxowjV9TjMaa/oE1Nsucio=;
 b=T3y394v2VNmoNP1CJRAkz9XVpE9bFoeVKdYV3CGMptj5kC0l3xECd/dQD2H6KSExpO
 C9KlYySRp+jWLIBvlNTlhi0yzkkSI2St4uyNUQfWOD+AnrIAJ+VhvLstVdi0PQOYTvlW
 J9TGQiIL/QgbVCoSbWfZCR+8L24il8AZh8VFm7I5x77YMQJIjj+lRur7RpJ7YWip+q5I
 uHZqvLpv9T5szfSIhGVXgVGvQ5NJtg3moY39wT0ewh1oC6zJY4z09/naUhOgxr47g6P8
 eZGPG3a0gqdLLWzu3/Fjh4IEq5fRBtw/FLgR0uk9zlP/LZ/Slv1cZTliB9BQed3z71lV
 dUuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=T3y394v2
Subject: [Buildroot] Buildroot hackaton coming weekend (12-15 July 2024)
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

IMKgSGkgYWxsLAoKIMKgV2UncmUgZ29pbmcgdG8gaGF2ZSBhIG1haW50YWluZXIgaGFja2F0b24g
dGhlIGNvbWluZyB3ZWVrZW5kLCB3aGVyZSB3ZSdyZSAKZ29pbmcgdG8gdHJ5IHRvIG1ha2UgYSBz
aWduaWZpY2FudCByZWR1Y3Rpb24gb2YgdGhlIHBhdGNod29yayBiYWNrbG9nLgoKIMKgWW91IGNh
biBoZWxwIGJ5IHNlbGVjdGluZyB5b3VyIG93biBwYXRjaGVzIGFuZCBwYXRjaCBzZXJpZXMgYW5k
IGZlZWRpbmcgdGhlbSAKdG8gdXMsIGluIHBhcnRpY3VsYXI6CgotIFBhdGNoZXMgd2hlcmUgeW91
IGNhbiBkbyBhIHJlc3BpbiBkdXJpbmcgdGhlIHdlZWtlbmQuIFdlJ2xsIG1ha2Ugc3VyZSB0byAK
cmV2aWV3IHRoZXNlIGZpcnN0LiBJZiBhIHJlc3BpbiBpcyBuZWVkZWQgYW5kIHlvdSBjYW4gZG8g
aXQgZHVyaW5nIHRoZSB3ZWVrZW5kLCAKdGhlbiB3ZSBjYW4gc3RpbGwgYXBwbHkgdGhlbSBkdXJp
bmcgdGhlIGhhY2thdG9uLiBJZiBubyByZXNwaW4gaXMgbmVlZGVkIHdlJ2xsIApvZiBjb3Vyc2Ug
YXBwbHkgdGhlbSBkaXJlY3RseS4KCi0gUGF0Y2hlcyB3aGVyZSB5b3UgY2FuIGRvIGEgcmVzcGlu
LCBidXQgb25seSBhZnRlciB0aGUgd2Vla2VuZC4gVHlwaWNhbGx5LCB3aGVuIApyZXZpZXdpbmcg
YSBwYXRjaCwgd2UgdHJ5IHRvIG1ha2UgbmVjZXNzYXJ5IGNoYW5nZXMgcmlnaHQgYXdheSBhbmQg
YXBwbHkgCmRpcmVjdGx5LiBIb3dldmVyLCB0aGlzIHRha2VzIGV4dHJhIHRpbWUuIFNvIGlmIHlv
dSBrbm93IHlvdSdsbCBiZSBhYmxlIHRvIApyZXN1Ym1pdCBzb29uLCB3ZSBjYW4gc2tpcCB0aGF0
IGFuZCBjb25jZW50cmF0ZSBvbiBqdXN0IHdyaXRpbmcgYSByZXZpZXcuIFRoaXMgCndheSwgd2Ug
Y2FuIGhhbmRsZSBtb3JlIHBhdGNoZXMgZHVyaW5nIHRoZSBoYWNrYXRvbi4gTWVyZ2luZyB0aGUg
dXBkYXRlZCBzZXJpZXMgCmFmdGVyIHRoZSBoYWNrYXRvbiBzaG91bGQgZ28gcXVpY2tlci4KCiDC
oFlvdSBjYW4gZmlsbCBpbiB0aGVzZSBzZXJpZXMgb24gdGhlIGZyYW1hcGFkOiAKaHR0cHM6Ly9t
eXBhZHMyLmZyYW1hcGFkLm9yZy9teXBhZHMvPy9teXBhZHMvZ3JvdXAvYnVpbGRyb290LWVqM2du
dDloZi9wYWQvdmlldy9idWlsZHJvb3QtaGFja2F0b24tMjAyNC0wNy0xNjl6cDk4dAoKIMKgSWYg
eW91IGRvbid0IGhhdmUgdGltZSB0byBjb21wbGV0ZSBhIHJlc3BpbiBkdXJpbmcgdGhlIHdlZWtl
bmQsIGJ1dCB5b3UgY2FuIGJlIAphdmFpbGFibGUgb24gdGhlIElSQyBjaGFubmVsIHRvIGFuc3dl
ciBxdWVzdGlvbnMsIHRoYXQgY2FuIGFsc28gZml0IGluIHRoaXMgCmNhdGVnb3J5LgoKIMKgSWYg
eW91IGhhdmUgYSBzZXJpZXMgcGVuZGluZyBmb3Igd2hpY2ggeW91IGFscmVhZHkga25vdyB0aGF0
IGEgbmV3IHZlcnNpb24gCndpbGwgYmUgbmVlZGVkLCB5b3UgY2FuIHRha2UgdGhlIGZvbGxvd2lu
ZyBhY3Rpb25zOgoKLSBNYXJrIGl0IGFzIENoYW5nZXMgUmVxdWVzdGVkIGluIHBhdGNod29yay4K
Ci0gSWYgeW91IHN0aWxsIHdvdWxkIGxpa2UgYSByZXZpZXcgYmVmb3JlIHlvdSBkbyB5b3VyIHJl
c3BpbiwgcHV0IGl0IGluIHRoZSAKY29ycmVzcG9uZGluZyBzZWN0aW9uIGluIHRoZSBmcmFtYXBh
ZCBsaW5rZWQgYWJvdmUuCgotIElkZWFsbHksIHlvdSBjYW4gZmluaXNoIHRoZSByZXNwaW4gYmVm
b3JlIHRoZSB3ZWVrZW5kLCBzbyB0aGVyZSdzIGEgY2hhbmNlIHdlIApjYW4gc3RpbGwgYXBwbHkg
aXQuCgogwqBJZiB5b3UgaGF2ZSBhIHJlbGF0aXZlbHkgb2xkIHBhdGNoIChzZXJpZXMpIHBlbmRp
bmcsIGl0IGFsc28gaGVscHMgYSBsb3QgaWYgCnlvdSBjYW4gcmViYXNlLCByZXRlc3QgYW5kIHJl
c2VuZCBpdCBiZWZvcmUgdGhlIHdlZWtlbmQuIEl0IGNhbiB0YWtlIGEgYml0IG9mIAp0aW1lIHRv
IHJlZnJlc2ggb2xkIHBhdGNoZXMgdGhhdCB3ZSd2ZSBsZWZ0IHRvIGJpdHJvdCBmb3IgdG9vIGxv
bmcuIEl0J3MgYWxzbyAKdXNlZnVsIHRvIGRvIHRoaXMgZm9yIHBhdGNoIHNlcmllcyB0aGF0IGFy
ZSBub3QgeW91ciBvd24gYnV0IHRoYXQgeW91IGhhdmUgYW4gCmludGVyZXN0IGluIChiZWNhdXNl
IHlvdSBjYW4gcHJvYmFibHkgZG8gYmV0dGVyIHRlc3RpbmcgdGhhbiB3ZSBjYW4sIGlmIHlvdSBo
YXZlIAphIHNwZWNpZmljIGludGVyZXN0IGluIHRoZSBmZWF0dXJlKS4KCgogwqBQbGVhc2UgcGF5
IGF0dGVudGlvbiB0aGF0IHlvdXIgc2VyaWVzIHBhc3NlcyBjaGVjay1wYWNrYWdlLiBBbHNvLCBy
dW4gYW55IApydW50aW1lIHRlc3RzIHRoYXQgYXJlIHJlbGF0ZWQgdG8gaXQgKGl0J3MgdmVyeSB1
c2VmdWwgdG8gcmVwb3J0IHRoZSBsYXR0ZXIgaW4gCnlvdXIgY29tbWl0IG1lc3NhZ2UsIGJlbG93
IC0tLSkuCgoKIMKgSXQgYWxzbyBoZWxwcywgYXMgYWx3YXlzLCBpZiB5b3UgY2FuIHJldmlldyBh
bmQvb3IgdGVzdCBvdGhlciBwZW9wbGUncyAKcGF0Y2hlcy4gRXNwZWNpYWxseSB0aGUgbW9yZSBj
b21wbGV4IG9yIGNvbnRyb3ZlcnNpYWwgb25lcyBhcmUgaW50ZXJlc3RpbmcsIG9yIAp0aGUgb25j
ZSB3aGljaCBoYXZlIGEgbG9uZyBidWlsZCB0aW1lLiBQYXRjaGVzIHdoaWNoIGhhdmUgYSBSZXZp
ZXdlZC1ieSwgClRlc3RlZC1ieSwgLi4uIHRhZyBnZXQgcHJpb3JpdHkuCgogwqBSZWdhcmRzLAog
wqBBcm5vdXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
