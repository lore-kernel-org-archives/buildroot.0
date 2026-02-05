Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9538AEA794C
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 00:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DCB660AA5;
	Thu,  5 Feb 2026 00:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-0-BtB8afNB; Thu,  5 Feb 2026 00:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F01E60ABC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770252318;
	bh=3+GgQheSpnDJWX+vNEMCAFVzOzJ6PrIlgq/apG8jZtc=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TlVYltxRFG3WyPMH+GVGzNfRhFpw0AaqwbAH9KvmvGBPfMJ8zkJkGHIJ7f7pPfKmC
	 JuXxsZo5IrDO/YZG4uKKF9ZyM1JTB58J0T3D4KgzwuhPlBcGrMGuqKhDfqGuX0+Zby
	 oLeUO5Snq28dOobfbR65XIlLn8I18B2M1HBlRNO9qK8DONmxZ+gDcW/urT+iXCXHh5
	 DJEE+e79l+mZ3g5MHzwtkxwO6K3Y9xKm1x9Ehq/qBFlFi5z91lU+HDS0i5qYYVzO5A
	 4CjCAruGKwFX2Dk5cOtoSqO4W3Vnoy6j942OTY7yuOI2H+U+lToLNwJgjpjSU3MOaE
	 wvVpuKw82cBQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F01E60ABC;
	Thu,  5 Feb 2026 00:45:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71A7D17A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 00:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C48C60ABC
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 00:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ir_Cmu-e3_jn for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 00:45:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B41660AA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B41660AA5
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B41660AA5
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 00:45:16 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-385d9fb297dso3894041fa.2
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 16:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770252313; x=1770857113;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bRMBa4gDVLGUVVwRvus/GaxDNM53OHYh+ACmgNz238U=;
 b=cpckBUgDQRRJSGOwG8cmNbv8lYblcRfhhVFr2RnlpW7zFS/SyDLYRQ14AO0JmwMPht
 w+/fG3tnmr3DW4GX6d40Po7tqJYzyat7M8gDaS4Ljc5T5qJxgkJeo2D+WwzEtJGMss4y
 jslD3gskjYq9zuap3Q9DxtdOdNCsrE8YNzQjP27/e1Y3uGLippNtnQqcZI9KwdF833qk
 ku7wexvOF88MIXVP1aKsQtseehI06WIFnYJQm5FYg40VjlnFHWflxq99hBWFChJL5SJz
 kCPgKSZHbaHm06arHX37lpvdHq0Cdx8LJNseqoeX+xQpXpZit/Lq6bvf8jCTzcGTgc97
 ZVQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYuvmp60zORIdM2FexRCAI6YPy8jmeVtNNkvbtPS36J04eIN+/bW9Nv/SoFlGR+S2wp0DWSVMYgRc=@buildroot.org
X-Gm-Message-State: AOJu0YxTPWpT8eMGHb7H9gdfLhqcJbufWSqqxeLGLLy8cEayMfbDCEQx
 UkJ6rTNUIqo8XnpH9reGBArRvA3qwPr/+cmt9BohnoyNVkzYnUFo6kmNbDES60BodoW517FG87a
 Dl/BFPtAZxA==
X-Gm-Gg: AZuq6aK2VBCNsn1/AJZyHvjL4FdjNQBjiEhQLHZ/Vol9o2viie9Q5JNmKW7HwWrqRRq
 d9ABSR1VT06gsbxi0zV0B9F3Gpjf+nKLIfySpETQodxbg1HhV94Zsv3CA+BGBaS2TBZvlPd3p8i
 G3i3zJ1A65SLnRTcQCV6e4wq2UM/MiwoUDLUnaeU6JK9uiq+qOFSqZMcNjrkkxNoo2Vr9m68qvB
 oLZOQSt4XsTzGQZsMQRvs2y/RmjM5PODI9sU047X5v2oG8a+TCAjpI2tuFI7DFshrZ3ZdU60c3S
 Ijh7kvBGS3RUg++3t/3EgxzNGCGmr1GeEnbAkvYgr+DzKj61DcY6ROc26wYdB/Q8wsCrGNieARC
 fFN55jEtolNFBP5jAI5u8y2eY15Owi/fM+rFsmHu9F26R41TTY5SkiDmhEYQA7V4WCrcXjRIhbi
 SWlCnaDpPqpqSWqj4YCkbjahOD/XVUvvfvcwNx/0LsBMGBOVCFlvY2NQ==
X-Received: by 2002:a05:6512:68b:b0:59e:92e:7d07 with SMTP id
 2adb3069b0e04-59e38c20d4cmr2002176e87.24.1770252313304; 
 Wed, 04 Feb 2026 16:45:13 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e3881b307sm1000044e87.50.2026.02.04.16.45.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 16:45:12 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-385b9be0759so3312171fa.3
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 16:45:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU4NoDUOyugFf2Z2W2WO+TyrcIw7lIWzoSbLouBt01a45seIrkDE1YCAq84ggEotmbuIvN1bar608g=@buildroot.org
X-Received: by 2002:a05:651c:1443:b0:37b:a955:d497 with SMTP id
 38308e7fff4ca-38691cb5883mr14874551fa.17.1770252312415; Wed, 04 Feb 2026
 16:45:12 -0800 (PST)
MIME-Version: 1.0
References: <20251228213710.2591716-1-james.hilliard1@gmail.com>
 <20251228213710.2591716-2-james.hilliard1@gmail.com>
 <CA+h8R2rJFvtnP4DD7qwGx0smh7sgkDeptMUibqhJgSUuUO3Lyw@mail.gmail.com>
 <c8defb4d-4f5f-4bdf-8ff9-4adad5891fcd@mind.be>
 <CADvTj4rGb6KO0BUFyss9TRy9Ctk7oLdJ1PJLg-F3Y59e73XYbA@mail.gmail.com>
 <CA+h8R2oQ71c5rtXO-GB+Bbr2QAyYNczJhZVxAxY0OgXs0zkEUg@mail.gmail.com>
 <CADvTj4p7Y8MWHkRTpBek+ji_PCo0ujknOJA7Y3xeUk7_N+Uuig@mail.gmail.com>
In-Reply-To: <CADvTj4p7Y8MWHkRTpBek+ji_PCo0ujknOJA7Y3xeUk7_N+Uuig@mail.gmail.com>
Date: Wed, 4 Feb 2026 16:45:01 -0800
X-Gmail-Original-Message-ID: <CA+h8R2prYxrG7JoDgg8gVwZFLPxNq-wO7yFOH1Np3M8fQ_aWTw@mail.gmail.com>
X-Gm-Features: AZwV_Qir3wGzXb-E6O23v0Csc5MeELVZa36vKxWCm59tJkdcDyv-Qr6TgwM_G1Y
Message-ID: <CA+h8R2prYxrG7JoDgg8gVwZFLPxNq-wO7yFOH1Np3M8fQ_aWTw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1770252313; x=1770857113; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bRMBa4gDVLGUVVwRvus/GaxDNM53OHYh+ACmgNz238U=;
 b=JbZReF6RSW+59CxfHi35ZvkCXX97SxO+rtMYpE/szNMDIhJRZao6OXg4vgBQzkbFDR
 JPWfj9e+bp65cgNsdmpwImr5/7HRxitJ/3TnLFec0Gh1unexDEkUcEYrB9Gf9HMMBLxe
 LovHRPALoqGH0EyDkqFZARa9G8jO2QM/TjAoT9SIHkxVWEoAGWyLvXnxix/Bu8xcqEGP
 iV2yvGcvjDdnpkTUVimjKHB28Zs6/nCZtANnoGfEex5UEO4k0zr3mv5uUZe6T/ZydYXR
 a1TJqcp5Sqi4rzN7JkeQyUgtZfp8aKm1kfFY5xsDnbTIPo0w5CVlYYRFyJ0McV0SPfn5
 r/AA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=JbZReF6R
Subject: Re: [Buildroot] [PATCH v6 2/3] package/pkg-golang.mk: make GOPROXY
 configurable
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpPbiBXZWQsIEZlYiA0LCAyMDI2IGF0IDQ6NDDigK9QTSBKYW1lcyBIaWxsaWFy
ZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gSSB0aGluayB0YWlsc2NhbGUg
aGFzIHNvbWUga25vd24gdnVsbmVyYWJpbGl0aWVzLCB1bnN1cmUgaWYgYW55IGFyZQo+IGluIHBy
YWN0aWNlIGV4cGxvaXRhYmxlLgo+Cj4gSSBoYXZlbid0IHJlYWxseSBib3RoZXJlZCB3aXRoIHJl
cG9ydGluZyBHT1BST1hZPWRpcmVjdCBpc3N1ZXMKPiB1cHN0cmVhbSByZWNlbnRseSBhcyBpdCdz
IHN1Y2ggYW4gdW5jb21tb24gaXNzdWUgZm9yIGFueW9uZSB0bwo+IGVuY291bnRlciBhbmQgSSBm
ZWVsIGl0J3MgbW9zdGx5IGp1c3QgZ2VuZXJhdGluZyB1bndhbnRlZCBub2lzZSBmb3IKPiB1cHN0
cmVhbSBwcm9qZWN0cy4KClRhaWxzY2FsZSBwcm9tcHRseSBmaXhlZCB0aGUgaXNzdWUgbGFzdCB0
aW1lIHJlcG9ydGVkIGl0IHNvIGl0J3MKaGFyZGx5IHVud2FudGVkIG5vaXNlLgoKV2UgY291bGQg
d3JpdGUgYSBzY3JpcHQgdGhhdCBkZXRlY3RzIHRoaXMgaXNzdWUgYW5kIGdlbmVyYXRlcyBhIC5t
ZApmaWxlIHdpdGggaXNzdWVzIHRvIGZpbGUuCgpJIHdvdWxkIGhhcHBpbHkgZmlsZSB0aGUgaXNz
dWVzIGZyb20gbXkgR2l0SHViIGFjY291bnQgaWYgbmVlZGVkLgoKVGhhbmtzLApDaHJpc3RpYW4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
