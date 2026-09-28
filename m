Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770DAC9833E
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 10:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AC3C6069D;
	Mon, 28 Sep 2026 10:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYXkJ6TNgBLc; Mon, 28 Sep 2026 10:14:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BBBDE60681
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790590452;
	b=sfpTD3OEZBQw46arvnMpqlRpjduHcNUXzyUgkwroVcRUNyjAKi3WzxMu/tlbl4oDB+eL
	 YqT7QNUemwaj6RbB+ZI4l2iypNfFUUZ4DB45WO0uZSnYN4ULkq2/PwSASjfAZ86+oZTqE
	 eRzC4ew3SDHvXsYvlIt27CjdxbC/IqfYJ8RIirj5NPeN5z1YA74rWurzCbrIh6Yi4VzJL
	 +FB6d/EEtnTDSaRUoxIc0nqIIwG+yKaGIXUlfTY9FQOUSD6Yp6QmvTS5HHvxyZVujfKbE
	 Hix+Q7QCNVGuMfDashbe0Dl/LEZL6C5Zh4Uuy6hZsY+T7/3e3MKG2wy2vShU5GrJ32w==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790590452;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tDlVNO1pfbghNjmPTrnyQPzgnIX/HZURd6LwmNV17JM=;
	b=dWdYZOhdVGZgJbR02P/Rka1fmc/JsB4DTPJJls7KTNbKu5d2X0JLvdsf0wiyNksys1RB
	 1BM5pacxcFtC7Bz29CYWfBpCZ916rNcihpXHSfRxAIY7PsKDlsKy0E3QSZChBLTrBYxix
	 ODmQurQiS7/4Ph0M0p9OjL+oPs1KgkrcUBhMzVe0UCE0hROEZQqkA+lniuLYuNdm2pqyP
	 s9VDkZaIgosewqOTJ5U46izcfVMaRNiOqa+GRkAJMSmYyDqBiu97AGnJK93IeVKwy/mct
	 Amme4cYgXKOmxBPLkC2BPoWNb2WVOuArPnMiUbrayNG374XqQmU2bO8k/uylGpFcAuQ==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790590452;
	bh=tDlVNO1pfbghNjmPTrnyQPzgnIX/HZURd6LwmNV17JM=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TfANlERVkAS99LbRQ92DZ3iM3VAIJEKPeJXbM6wvsnT0LquERe8ll7xKKk/2/CwRT
	 x1aR4uuMlQ0CzDdsT+0riEG/4pOO8bN3teaOUzorctljr7/J6mfxK4S7+QSnhkmtP0
	 FVqnC5Kp6pJPy2kRAbSr17O3zyx/cmRyZbEq7Xa8kGxCcyev3itypS1FtGRwK477h0
	 aFkWIawoiewRuwS1PvtSI8zkGaYReKsRR1QRFPL2fgFY7gHSVVR7GnHmTKF/Z+kDsc
	 IME88JARmWIc9bmvy0atCjfS7AGLBpKKDQ49SKIFnOzWL7keGmRwIw/T8FmxskLZS6
	 Qmx1Oa8ltUe0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBBDE60681;
	Mon, 28 Sep 2026 10:14:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 786E524E
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 10:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A5A680D97
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 10:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAtSkJHCjHKX for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 10:14:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4CCB180D64
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790590450;
 b=p2t4bjA7BMxEE5+Yp4Pk3p+QoJ9eKKjIt2Lm1M+sVUjEAEQwCB69B+VkbruJwI+/SbgG
 sZAwcQ+J3xd9iEv6lgjLl6y7ruUE3ZiGfbKUWYCzDoDrWtFmxAzQqVRhT46yU6tdv4fQC
 aOSAHfFdSthYIMrVKSorNh1WeBa0dxpxyaDWxdSPDtSvE+AgbjsXbTaDEKOB2kTBfTjh8
 /WMkKwQdSqAA2DoAUk96v9JQgz3MWr6mGtqjG7CuOy6lc03biYPtDm2iPpxeXVHTgQsRS
 lRwOFn1LpdJhZ7jHNzV5bZE6t1iTE1oK8z5UgFUwSDZJ4FbsdMj2NtX/1gWw8g4WNZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790590450;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=vh+nKUv+aK+cknmAOWLAUrc9EXtyZMmNiBDMhp+AV7A=;
 b=HFMNotkjLDorIVq9Asbp9Aiy4HLNp9rfC54h+9AIT1GjvikKe0KWMYFnyXVi4rcZ1jc9
 zi5ylxZ2vJEOqu2/FTdxV5+64v+Dg/LhT/wEjLqCygB72Xxk6kyc+QsVTAFg4AGVLOeLE
 RpYE9vNzxIciAngCK0CxO+Vcfn2tkA3jlKocHxQYJ4TJLud2mIJRkClct7TGeQQikhzHK
 G3i27ljhzxD0ro0a/Xmbsuy5sh2L5HUH25Yh5quQJOrhbW5ehH8GQJHjHh0bGaAoT/FIw
 89u/wR06pHSzkhEN2qQ8yv2bNUUn6tRZi3SYw83pZ6bMoCiUTagHZrV9XsRmyAYPYsg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=rU48bXhV; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CCB180D64
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 10:14:09 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c29d50b7cf9so412319266b.2
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 03:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790590448; cv=none;
 d=google.com; s=arc-20260327;
 b=S3xyo3HEA793HmlFOcB2RM/LDPgusI+ERVvjgWtNIMJK07MZ0J8oPVEtoWZH033Trs
 nv3qqEY5jhYZqRxm+Vz/xi/Kw7NbF5ZtAzPcxzfecdeuLx+IpZy23WPsMt53LpQ4cIEW
 3EprlPwVCZUF/Hp0RY/pl0pgtWLtD5wOMttN2qB/8SHgNHdf2zGw4r3slYuKBwMnLDa5
 Xx0cnRgAIU0OCxDstCba814Te/N9m25fG8JZnU+iNCwso6nq8mtTBG7nVXLOi+Kn78yo
 M6jPD3zXOLDP08Cp9Z9J4djFmnehutaXv0eXawNfxFuYrk5FXzTS2AakhwsSXeTWSNm0
 tEMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vh+nKUv+aK+cknmAOWLAUrc9EXtyZMmNiBDMhp+AV7A=;
 fh=Pv2yMr+uf9Z0Jj4hvc5rKp06NbEixl3KReSgrKtf0Rg=;
 b=PxGFQbmDbzCh9sf14OwcFwKm6to4wFIpw4NafnukK6HhPXyhq3j6i6ivTXT1IkeboM
 Z1GAHlwaFRnd3FbzgZ+XevXgKLzLt8VNznONQ+dW17ZYMZ1aLGnJZrjESdu9FfP+6tdo
 yXKgzvSg3/zFcmeDUSjkpGGgqCswblOAAHgN3SeTYd/BdHlX6ioswCD5KCbsP0hhovv3
 qIXA8qdrOEtBacX6mJzBSoSZhL+onUXRB6y4dWTWw5LfQ5UwfJh51h0rSXSX2wFEpkDO
 zGWcrqwe9nzV9I4MJ2FnLdCbz4vdVzFtLmTWKp9HjsCtuNJOArvV7X22E4uv6cfIV1z2
 Scqg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790590448; x=1791195248;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vh+nKUv+aK+cknmAOWLAUrc9EXtyZMmNiBDMhp+AV7A=;
 b=VqGKGEIdGQeJju3CMC//mLEcAvi/h1nQCsPVeEwL2i8qG/HFikQpQ3k9PaEcEZfK0c
 0TCnOcj5JaOVUX9gn0yoP0y0M/dTYgXBC2wx4K7SoTJ0gPIlfo6uN0K7OxtKXlpgbLC2
 TcHbLVG+S+wDYrrcW+6Cg2esPIRk2pzHv/+E5iNjLZX7m1tLi+lcbkebGyzp9VRJnQcm
 T+ihxhMHvI59ZXypiP560A6h9qUlZccnbMAHT05mkh8U2g+mZ2cNUdedQ4VreRbuMn14
 OPVM48jYCTItZdouDqW9wFDwy46/O0DHRHv5YUcbQvZadmXgCw+oQRQtFqCPbOw9IESj
 eTkg==
X-Gm-Message-State: AFuF++kf4b1s04IujaOewx2WC8ANfUTHRdS4KkYtG8TthKCtxMaiaEMN
 pX5idwr6iNpUsIG8MN4WkRQJFtloqGoQ2gp8I1IGeTnRoa8tLxima/AmZ6JQUjoDQEXRt9FFDW5
 smZD69gBlI+lv8jZWZVIn3MWshgXUWaH++2yf
X-Gm-Gg: AYBFou2vO71ic7SPL9vCJ6AFznuj+FmZqtMKDJF4SqegclQUz+G+W2w4q8pUgbdQwmM
 OFO3darIMXaUO3uycnFm6Bj4S6qyyJY2seqsryMcUNoxLs5ys68pRMNlxQb1N3QRoliWsOFs1aE
 +rKW6KunCDzVKER2XqhIKk6yQen02uls66x8LhppffrekczK8wb1vrBtTt27P2TZL22sdCCdLUF
 rpHqueLgyOtjKPZryaiI/3rh9NRrjSTXgJ6ppYpaXZFuWuHL1CB6WAA/hBgOZIBdvMYhOlO1zDs
 xN8u6pRxbUYqIzxECFwoTgPiT2W/hXHSClsLi+Kl5I9tJTIOLXWC5YUkV9c6dvTmOdg=
X-Received: by 2002:a17:907:1999:b0:c29:45ad:7af7 with SMTP id
 a640c23a62f3a-c2ac256d4damr1088192466b.30.1790590447544; Mon, 28 Sep 2026
 03:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260926133654.2836794-1-yegorslists@googlemail.com>
 <aroq5mq_8nTxwbYv@windsurf>
 <CAGm1_ksWtcOOUnGC=yoxJYAs09f95WEZJx_4jKPw_VHKU6LUdA@mail.gmail.com>
 <aro7pjx9dv3NJZT7@windsurf>
In-Reply-To: <aro7pjx9dv3NJZT7@windsurf>
Date: Mon, 28 Sep 2026 12:14:35 +0200
X-Gm-Features: AclHuK9vmXO6GjyjBuzN1LXd5ROy7d2yQ_iQnQ-ktLAIUFKXElpY9oO0uj8qCPM
Message-ID: <CAGm1_ktjmQ8npH_Sf0U6ru243cvsm2x8iGXGj1um6pZ6qk0_dg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Will Newton <will.newton@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/libmicrohttpd: fix build without
 thread support
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBNb24sIFNlcCAyOCwgMjAyNiBhdCAxMjowNeKAr1BNIFRob21hcyBQZXRhenpv
bmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBP
biBNb24sIFNlcCAyOCwgMjAyNiBhdCAxMTowODo1NEFNICswMjAwLCBZZWdvciBZZWZyZW1vdiB2
aWEgYnVpbGRyb290IHdyb3RlOgo+Cj4gPiBUaGUgaXNzdWUgd2FzIGludHJvZHVjZWQgdXBzdHJl
YW0gYnkgY29tbWl0IDczYzQzYTdlZjdiZCAoIkFkZGVkCj4gPiB3b3JrYXJvdW5kIGZvciBzeXN0
ZW0gY2xvY2sganVtcHMgYmFjayIpLCB3aGljaCBpcyBwYXJ0IG9mIHYwLjkuNzUuCj4gPiBUaGF0
IGNvbW1pdCBhZGRlZCBjb25uZWN0aW9uX2dldF93YWl0KCkgaW5zaWRlIHRoZQo+ID4gIiNpZiBk
ZWZpbmVkKE1IRF9VU0VfUE9TSVhfVEhSRUFEUykgfHwgZGVmaW5lZChNSERfVVNFX1czMl9USFJF
QURTKSIKPiA+IGJsb2NrIGFuZCBhdCB0aGUgc2FtZSB0aW1lIGNhbGxlZCBpdCBmcm9tIE1IRF9n
ZXRfdGltZW91dCgpLCB3aGljaCBpcwo+ID4gYnVpbHQgdW5jb25kaXRpb25hbGx5Lgo+ID4KPiA+
IEluIEJ1aWxkcm9vdCBpdCB3YXMgcHVsbGVkIGluIGJ5IGNvbW1pdCA4ZWMwMDFiNDY3Cj4gPiAo
InBhY2thZ2UvbGlibWljcm9odHRwZDogYnVtcCB2ZXJzaW9uIHRvIDAuOS43NSIpLCBzbyBhbGwg
bWFpbnRhaW5lZAo+ID4gYnJhbmNoZXMgYXJlIGFmZmVjdGVkICgyMDI1LjAyLngsIDIwMjYuMDIu
eCwgMjAyNi4wNS54IGFuZCAyMDI2LjA4LngKPiA+IGhhdmUgMS4wLjUsIDEuMC45IG9yIDEuMC4x
MCwgd2hpY2ggYWxsIGhhdmUgdGhlIHNhbWUgY29kZSkuCj4gPgo+ID4gSXQgd2VudCB1bm5vdGlj
ZWQgZm9yIGEgbG9uZyB0aW1lIGJlY2F1c2UgR0NDIDwgMTQgb25seSB3YXJucyBhYm91dAo+ID4g
aW1wbGljaXQgZnVuY3Rpb24gZGVjbGFyYXRpb25zLiBHQ0MgMTQgbWFkZSBpdCBhbiBlcnJvciBi
eSBkZWZhdWx0LAo+ID4gYW5kIHRoZSBmYWlsaW5nIGF1dG9idWlsZGVyIGNvbmZpZ3VyYXRpb24g
dXNlcyBHQ0MgMTYuCj4KPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4gVGhlbiwgd2hpY2ggR0ND
IHZlcnNpb24gc3RhcnRlZCBjb25zaWRlcmluZwo+IHRoaXMgYXMgYW4gZXJyb3I/IEdDQyAxNCwg
MTUgb3IgMTY/CgpJdCB3ZW50IHVubm90aWNlZCBmb3IgYSBsb25nIHRpbWUgYmVjYXVzZSB1bnRp
bCBHQ0MgMTMgaW1wbGljaXQKZnVuY3Rpb24gZGVjbGFyYXRpb25zIG9ubHkgdHJpZ2dlcmVkIGEg
d2FybmluZy4gU2luY2UgR0NDIDE0IHRoZXkKYXJlIGVycm9ycyBieSBkZWZhdWx0IChzZWUgIklt
cGxpY2l0IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyIgaW4KaHR0cHM6Ly9nY2MuZ251Lm9yZy9nY2Mt
MTQvcG9ydGluZ190by5odG1sKS4KClNvLCBHQ0MgMTQgaXMgdGhlIGVhcmxpZXN0IHZlcnNpb24g
dG8gdHJpZ2dlciB0aGlzIGVycm9yLgoKWWVnb3IKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
