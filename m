Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2983FCC07D
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 22:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BFBE41D19;
	Fri,  6 Mar 2026 22:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbKS8kP7LpZg; Fri,  6 Mar 2026 22:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74CA941BEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772834593;
	bh=sRVFJYaDpPsaz7JLjYECM9Juc88DdmqQ28sFJURB5jI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bl9XZHnJEQ4OFBv9lIHQ1frY868ar5pOR+922l8X8UmAxJLCHwF59vUO2G5FPeMSg
	 FEMF+Z8vsANHKpXnBqGCvG+JHO8bgc7dUVm1WTPpPI33nCqQkRNYvYbkHEx/uN4dg9
	 KnI5GPqBUN4CwIVkowDdhV9NOfDRkMeMu5mC7HVlUxOmTKtd4jzYP47E51Wz9zNzyn
	 jBptfVkyZwTVxtAJph3krUYGTwH7/m4Md4V5cjrF32e0tNmIqWuwg/RUovS8j4plXy
	 NMIY5pnYRk0nPsJAughR7fyFk0WLBGE8Bimp6DZNPIhQF+1fxwtX+Z3Vo4KelpXJS7
	 1OY78pQkySm2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74CA941BEB;
	Fri,  6 Mar 2026 22:03:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1708F169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 22:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0855483BD4
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 22:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27T2EidU06dJ for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 22:03:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 53D2483BCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53D2483BCA
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53D2483BCA
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 22:03:11 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7d18a9d2b1aso9778448a34.2
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 14:03:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772834590; cv=none;
 d=google.com; s=arc-20240605;
 b=PGFgHmUIoJ4Ri5iTtMZL3fl+7jg5H+pyRolwS+uIAI29Kpvsiri2bq+8oCejzViQsA
 hW69R999lNSjTuGcU2kUSt/gKsBtyHlXuImfPrD+/wKsuiFcKuSwmqU7l1S+L+WHy1L4
 eYU3xSwHIhTd8jR7SnHpeUlyVkkdbCJSTwStV6fUSRWKPLgnpdNYLKsAtfQLnQJjyeTM
 QmF26iPF0Ou0a6qMgtGoqb/Jd1yzP128W91r7nXHaxrla4QRopmBJWyukhMfqmVgya1H
 qCDQKG3QgQdHqGQLS5LGEZp/GbngF+S2fiD929q14L9Gu3XufOhl1XqMvTQJhEmVmY3F
 m4CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gOQ9hc6lYoz9JXzvqDXMnoayVMQHcqa/ZroitMQbNkw=;
 fh=t109lWVKkCtWRxFZrah/iuXaqNyg9EGqwBxGKsSJvEI=;
 b=gDkTSH0329pE9tsTjevM+Xl3mxHADiGe/m5AN68dJ78Gr4xvpFOAjgZPLBWpL8YS3e
 r19ewmMIX2fzGokpiA3coVk6Dl0zTha8SxuJDUI3djPn9EYjOit2d58c+HE9H95KwGX8
 ENgrNy285TeIZSbpJ98ODk2rj3CqPaFOVraClmKZn6FWho90janXC6Tnda4uGERH02uU
 HWgBUHnWilgWxr9hXlZAVoYGgasOjTativGu7+dGlgKbWcbAI/nv9b+fH4NVq5h3KsJp
 MDFoweTR81hGw+c+tymCZgphwW4kEx+FcugHquad9094ZW14j8FpCCpjBjWHhM99xdIX
 z3PQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772834590; x=1773439390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gOQ9hc6lYoz9JXzvqDXMnoayVMQHcqa/ZroitMQbNkw=;
 b=Zx+JYYJgbwffGYXNvMQbuJt6IAjFTax7uPH24ucozb7Fu2CaImcgKFYtnDkHp51T/W
 y9BFykzc9Q7oOeUIVkKHxRioBUy4EK3kXd6uG3I0Bhw9qT2tnXQfimkJVj09T6LPxR87
 bLLo6qKfVZ9wg1JLT5E7g7DmM+ibKW7Yp4hrNpI5QBePBrM4t/cBoEbofd/jMFav8Qx1
 Pg48s2YoYz7Aj2hFIsge/hF3pJIacS11H+Xlsy6ioABt0z+i+b1LmyoT+HJA+KlGtS/U
 mcbPrXZAR+8GRHa50uUAUJa6JdjAlkBW1918OKjgzxcUj+oax0rsN85+8nsxfC5w4SdY
 SfBQ==
X-Gm-Message-State: AOJu0Yyn5XHIdLMImOpfLdVOXBTTDidWrtl5eUpnAMYgpvNzL2dCvZBS
 MspTmf2OtA38P4CE4kqGzya2fP5Jpv+7ZRjoIgVH1I49BLMQMLZHeGQv7aG4H57ieuUAv7Ulg+N
 hL9Lzp1HHoZPcAT4RgD71ulhF37+Yiv/b4PyJGUc=
X-Gm-Gg: ATEYQzyOpUojn//K7rwhWKujBXlKmyMSuQ1s6xQJqU+jKigz21zaGwpkRcdGDcp8ifq
 66iCjKyGa627yuu4fJHTseKYXMYOu2qCxFLtWHiPZ9gV/pbPmVxVc6Z+OVGFreb9DsSxwuRGroz
 IEVtr3LJjf8bL2a6rvwbLWby98kV5hcmj33EZr1J3L1kzRcHLT/GU9gWJhDAkWrSiPbHLNxWqhB
 dY42SHcBXNhS7js6DxbPxxk+Tvy+v/edCUXO4wSvOIZNpTaNyriMAq9RHUkpZ6QFTBfUKHu94NR
 KUSFgw==
X-Received: by 2002:a05:6820:178a:b0:66f:75e5:e886 with SMTP id
 006d021491bc7-67b9bd78afbmr2643857eaf.66.1772834590003; Fri, 06 Mar 2026
 14:03:10 -0800 (PST)
MIME-Version: 1.0
References: <20260222134120.1893854-1-chakrabortyshubham66@gmail.com>
 <20260305094946.344077-1-chakrabortyshubham66@gmail.com>
In-Reply-To: <20260305094946.344077-1-chakrabortyshubham66@gmail.com>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 6 Mar 2026 14:02:34 -0800
X-Gm-Features: AaiRm52FAxund6wNmRb5jk-18iAJ4iMPtkX6wxx4OzCiSXV9ug0JQ1S50QM7sIk
Message-ID: <CAMWSM7jB7EZydwK-ppDxPLbivaoH=SvFKMMEFtUcg_4abQ-Ckw@mail.gmail.com>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org, andrew.smirnov@gmail.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772834590; x=1773439390; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOQ9hc6lYoz9JXzvqDXMnoayVMQHcqa/ZroitMQbNkw=;
 b=jEAlzEX//je6bjARkREExz8E6QFDxmZptetMqV/GzrOcfJID8Ji286zjitxIpHqPPy
 VSnwNU0n+1IMev+05rK5aXMOi7Nu96vEThKpSCKT94nFVmK73hgy7k010iW1PDN271LG
 nCm/FNkMAejSz8RRqQGv5gVjS8PtGa2wWnbHRLwiQMSupK8UcqmElCZbYI51ZvBlJjwd
 UdfRLFRFv2BAINVMn3O+MEpcd+ObRiIqSnXlcPjClqmmkxoel/b9Zxf2zldZs6oSZGMe
 vcu575EQCZbuEqPnyeW+ibZw7qUE7pBmlSk25QksmjXxz4AK6B9mqsyqvN62VDjw26iB
 6XRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jEAlzEX/
Subject: Re: [Buildroot] [PATCH v2] package/zstd: add pzstd support
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

SGVsbG8gU2h1YmhhbSwKCgpPbiBUaHUsIE1hciA1LCAyMDI2IGF0IDE6NTDigK9BTSBTaHViaGFt
IENoYWtyYWJvcnR5CjxjaGFrcmFib3J0eXNodWJoYW02NkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4g
QWRkIHN1cHBvcnQgZm9yIHB6c3RkLCB0aGUgbXVsdGktdGhyZWFkZWQgaW1wbGVtZW50YXRpb24g
b2YgenN0ZC4KPgo+IFRoZSBwenN0ZCBidWlsZCByZXF1aXJlcyBDKysgYW5kIHRocmVhZHMgc3Vw
cG9ydC4gT24gc29tZSBhcmNoaXRlY3R1cmVzCj4gKGUuZy4sIE1pY3JvYmxhemUsIFNQQVJDKSwg
aXQgYWxzbyByZXF1aXJlcyBsaW5raW5nIGFnYWluc3QgbGliYXRvbWljCj4gZHVlIHRvIHRoZSB1
c2Ugb2YgYXRvbWljIG9wZXJhdGlvbnMuCj4KPiBFbnN1cmUgdGhhdCAtbGF0b21pYyBpcyBwYXNz
ZWQgaW4gTERGTEFHUyBkdXJpbmcgYm90aCB0aGUgYnVpbGQgYW5kCj4gaW5zdGFsbCBwaGFzZXMu
IENvbnNpc3RlbnRseSBwYXNzaW5nIExERkxBR1MgaXMgbmVjZXNzYXJ5IGJlY2F1c2UgdGhlCj4g
cHpzdGQgTWFrZWZpbGUgcmUtbGlua3MgdGhlIGJpbmFyeSBkdXJpbmcgdGhlICdpbnN0YWxsJyB0
YXJnZXQgZHVlIHRvCj4gaXRzIGRlcGVuZGVuY3kgb24gdGhlIHN0YXRpYyBsaWJyYXJ5Lgo+Cj4g
Rml4ZXMgYnVpbGQgZmFpbHVyZXMgcmVwb3J0ZWQgd2l0aCBib290bGluLW1pY3JvYmxhemVlbC11
Y2xpYmMgYW5kCj4gYm9vdGxpbi1zcGFyYy11Y2xpYmMgdG9vbGNoYWluczoKPiBQenN0ZC5jcHA6
KC50ZXh0KzB4MTdlOCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gJ19fYXRvbWljX2NvbXBhcmVf
ZXhjaGFuZ2VfMScKPiBQenN0ZC5jcHA6KC50ZXh0Ll9aTjVwenN0ZDE1QnVmZmVyV29ya1F1ZXVl
M3BvcEVSTlNfNkJ1ZmZlckUpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvICdfX2F0b21pY19mZXRj
aF9zdWJfNCcKPgo+IFNpZ25lZC1vZmYtYnk6IFNodWJoYW0gQ2hha3JhYm9ydHkgPGNoYWtyYWJv
cnR5c2h1YmhhbTY2QGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBKb3NlcGggS29ndXQgPGpvc2Vw
aC5rb2d1dEBnbWFpbC5jb20+ClRlc3RlZC1ieTogSm9zZXBoIEtvZ3V0IDxqb3NlcGgua29ndXRA
Z21haWwuY29tPgoKQnVpbGRzIGZvciBhbGwgbm9uLXNraXBwZWQgdG9vbGNoYWlucyB1c2VkIGJ5
IHRlc3QtcGtnLgoKMzIgYnVpbGRzLCAyIHNraXBwZWQsIDAgYnVpbGQgZmFpbGVkLCAwIGxlZ2Fs
LWluZm8gZmFpbGVkLCAwIHNob3ctaW5mbyBmYWlsZWQKClRlc3RlZCBjb21wcmVzc2luZyBhIGZp
bGUgb24geDg2LTY0LgoKQmVzdCByZWdhcmRzLApKb3NlcGgKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
