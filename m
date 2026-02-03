Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7094CE8784E
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 17:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18BB340BEF;
	Tue,  3 Feb 2026 17:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id No8XBtuNhTiG; Tue,  3 Feb 2026 17:25:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE14F40BDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770139507;
	bh=GXjreOKSSBUMPPyGOLpO39do8p+ifCJowNSKv5K2/hY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c8AjrDG2H2vy2BBcTNc9S3UsgYzuDNfPOR8DNe1OSHOhrWUw56poZwfL+DYhMugo5
	 MFBssU83yVldbKabEVtuf72BLMvSWSVTpBzOAn1g6OoCotFUVbN+OpOMp5lGNIUv7d
	 wYCn72eXIf8r0krNkxC0yeMM0gaXCu/RgCYIpcGJ1kB7Wy7m9YHSJldBem0+pJJnmo
	 0qrj7Aot0dvsqnX0xMW4CxrR3s8RiHZUMUmJcrD+K8zpr2WyEe+DYdcIFXxqje3sn1
	 D2vza9+iQkGWNa/sMcKc2IVykktKS5aifK66NPo8p+VtYvuuoeSeauzfPewH8C29yH
	 hiinCt2lJMymQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE14F40BDD;
	Tue,  3 Feb 2026 17:25:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FD0BF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EB4A404B6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovadTxKSSP99 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 17:25:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1A0D404B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1A0D404B4
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1A0D404B4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:25:04 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-404263bd58fso26475fac.1
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 09:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770139503; cv=none;
 d=google.com; s=arc-20240605;
 b=Jw4dw/dmKmurIk7M2MVhygMR+E6v3muiFdyjvZleet2bdkiM8P0Tdjua0rhtPFeim6
 w+p0OoZZgNPoEsep9Q/W+j/sEIy+pJzTglCkUWJO1Wu8oFPnKGyN6zZ06QLzeR3t40B2
 1vAPUyGigkqjbEw0RHUIOJEsOGnjujiO4gFd5LFJ1PtquWlsKNcm5qCAXrpkBR4arscs
 g0Rcw8r51RHPCNAMSGUYrFkEXMsB9wQlSqX8RE1Pmr8YyHN8qF8fdV93LQqkjNQdoy16
 WIRryxNk71fsmgQTt0U1xnWD0YBDJ9fQq2DwZPtU1N35prLoGIhK53RjJVULVqcb3uSl
 Vtmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=mwZNmuoQKpDJ7o6QqVpcEQRqDOOxpahffZBv65q1im0=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=MCLI/LumyZFuP1sQtGy3zFBsMQPvLGhhbIkuPlB3L53b28e+UxsJGDODCj7JWBXJiA
 t9zOY4S4rQzr6Wo4Vhl60s3zUyL8xzoVB55pytA1UX0Y+DecwvbhljuhmCjDx24WfIc1
 DwYHIvhedv4uxAath4BbGUDQBZV7N7BwYf9XEtFY5CnkSHs1sBaBYPSbdWCKWVNONjha
 p29fl2dsk5cGz3q6ypdkGKUP9ojpGnRWvz5KnWb5CW0NLi2fwr6jCOlSF/hFc5AaUIew
 xieqBxUAW/NvVXSzttseIdFB+1YqxvjqNyDCYLJq5UOm+8VfEQyLeH/F/Lk98lCXNxLY
 mikw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770139503; x=1770744303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mwZNmuoQKpDJ7o6QqVpcEQRqDOOxpahffZBv65q1im0=;
 b=bpH/0997kvTPATjNUpgeUZ2pcQtAF+GZj/KIUjv/zTip5UXvOL67xYToIqy52I7MSM
 6AGyprE1NUO7yh0aqDfjr8+0BkdgHPZx76BxrZsczVE5zLWvksCHZrSwgiqBzLSs2cPT
 qyMcn3Jy4X2a0ULt52fxSWteMcF24Isffo13J+qVJpH5ogGY9VWvQrUnk75T6TDcKlAf
 QlHsJthX+qW4a70KmFvqe23jFKpx+6efNiJqvM2zFN38q0U2OrflIVPfySHtFgax4BZO
 1HcYhiM/QVacQwiNJBtawp77Eo7ef83va/uiBud07zKwGX8659aj0Qrq7BRKjeh4Ad1M
 q0bQ==
X-Gm-Message-State: AOJu0YyWjgX33UXoddR1aHYrMg29I/NrSsOV/l7zRJJDzOUR39wrUq2O
 hunueN3+4KomVIEi7UULUD+gRvuFA2xf+pwCAi7wivD3EhiosYjNSxwO5SQPUW1JEg1HxDfKd9H
 Q9MnZRA+R5lps4Y0SvakvTntIJhytU2gzVmrk
X-Gm-Gg: AZuq6aI92Fk72coYQisgmXXD77gpSW2iso+KW6mqqq7kyjXm5+6c1hjKyexFTKaORAR
 JCpcBdnq9PZ/LAI4KDNzT1SvGzSymu8cp7axTOJPKavGf0eNP6n15YDiB9/d+kI2lkbMU/wTP8W
 olKfJFdIRTgKJ82+gQYnqXQL/RivSVe9raH8B9CDa4hsoj9LtroU1U5cPBGrNpO1HCIZFGSiA4d
 1vhmz2DZIO6+c1/ksNE8lViqjMgnQWaKpbRloNrfUiJSKnvrVKuHKqJDi5XYiyahC89gw==
X-Received: by 2002:a4a:ee98:0:b0:662:f94e:8d53 with SMTP id
 006d021491bc7-668c82933a3mr1511280eaf.20.1770139503456; Tue, 03 Feb 2026
 09:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20251028-concurrent-test-pkg-v3-1-ae014d18e5f5@gmail.com>
 <aYImbY4iyP0uqQUJ@windsurf>
In-Reply-To: <aYImbY4iyP0uqQUJ@windsurf>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 3 Feb 2026 09:24:27 -0800
X-Gm-Features: AZwV_QgS_hpD0Bh9V4W3V1w0QBMT6tXORKvduhOUph2Ho00zeEFC_jLL4eeC0-I
Message-ID: <CAMWSM7gTdL5iiHZJ0USdm5AAb8nYV+8CJowCfBF3ruzb_LZ-Yw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770139503; x=1770744303; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mwZNmuoQKpDJ7o6QqVpcEQRqDOOxpahffZBv65q1im0=;
 b=YP6QsKYoTRLjmXJdG3SZ5on4X+kjPy1oxXgs8ux04xFkBgWm9KHX234CXMglK+ctXK
 BSLxB0fJn+OndjLVTlxl1mR+E+KwWcRcKx4p5dh1ToeSjb0e9ZxdbRIxLm6Nv2DcKRYB
 VxNs4W1rIomkDo6asmjTCOhPdeym8SJdz5qMvyFLVQDqq46hCd4TdeyvOoGuAstbTNwD
 BMY9bcJC0S1CFJoHpSql1468KsxvQ8/KCLX/1thdZLx9bVGqyd9dEU6FMUSIDoAwtl1J
 47/QrL6zlCVXaJKLlt1vm2u6NXj60u5KAAsk51HgWl5TtjBjfsNNxb2dKV3n9EVbG9/G
 8kTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YP6QsKYo
Subject: Re: [Buildroot] [PATCH v3] utils/test-pkg: add concurrency parameter
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

SGVsbG8gVGhvbWFzLAoKT24gVHVlLCBGZWIgMywgMjAyNiBhdCA4OjQ44oCvQU0gVGhvbWFzIFBl
dGF6em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2gsIGFuZCBzb3JyeSBmb3IgdGhlIGRlbGF5IGluIGdldHRpbmcgYmFjayB0
bwo+IHlvdS4gV2UgdG9vayBhZHZhbnRhZ2Ugb2YgdGhlIG9uLWdvaW5nIEJ1aWxkcm9vdCBEZXZl
bG9wZXJzIE1lZXRpbmcgdG8KPiAoZmluYWxseSkgaGF2ZSBhIGRpc2N1c3Npb24gYXJvdW5kIHlv
dXIgY29udHJpYnV0aW9uLiBXZSBiZWxpZXZlIHRoZQo+IGZlYXR1cmUgaXMgZGVmaW5pdGVseSB1
c2VmdWwsIGhvd2V2ZXIgdGhlIGhhbmQtd3JpdHRlbiBpbXBsZW1lbnRhdGlvbgo+IG9mIHRoZSBw
YXJhbGxlbGl6YXRpb24gc2VlbXMgYSBiaXQgdHJpY2t5LiBDYW4geW91IGluc3RlYWQgdXNlCj4g
c29tZXRoaW5nIGxpa2UgR05VIFBhcmFsbGVsIHdoaWNoIGlzIGRlc2lnbmVkIGZvciB0aGF0PwoK
VGhhbmtzIGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gZGlzY3VzcyB0aGlzISBJIG9yaWdpbmFsbHkg
c2VudCBpdCBhcyBhbgpSRkMgYmVjYXVzZSBJIGhhZCBzaW1pbGFyIGNvbmNlcm5zIHJlZ2FyZGlu
ZyB0aGUgaW1wbGVtZW50YXRpb24sIGFuZAp3YW50ZWQgdG8gc3RhcnQgYSBkaXNjdXNzaW9uIGFi
b3V0IHNvbWV0aGluZyBtb3JlIHN1aXRhYmxlLgoKSSBjYW4gc3BpbiBhIEdOVSBwYXJhbGxlbCB2
ZXJzaW9uIGFuZCByZXN1Ym1pdC4KClRoYW5rcywKSm9zZXBoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
