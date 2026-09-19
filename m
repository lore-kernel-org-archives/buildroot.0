Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C05C982CC
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 06:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D16260848;
	Sat, 19 Sep 2026 06:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4g6DcEYI8cxt; Sat, 19 Sep 2026 06:52:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 43ECF606AE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789800725;
	b=nqqDVETTV/cx06uilybR8GKo4lbHW9pM1soUnEFxD0SKH6XNWl/qIca4qf+MlE6qnuqW
	 CKD7C+nzVgi/KtQq2lDgH2ddnQh01VQJD5RU2MOuBgn8XM3CwqQ3OhegJsCKo38RwUWMN
	 V6AKS12O9p18fbidqavSH5+ZxUblCVp/Lk3sgF85/23Q8sPX5aerCVU8sB+ZHg0zrnQID
	 tXItTLIfTYPG6awmQe5G7szKwyu0UE84n5M1YJ2TYRvachAcE/2XUKrBqTVkTQJ6/YcTk
	 sNYRBH9vJRiXtu02fBtuA4pBwPnFtgL6Uwo6Jqv6LCpT0NhT+KfU1yLx2gDVoX05hvg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789800725;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:MIME-Version:References:In-Reply-To:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=ZObGukjMZRjSxruGjSTWYjbicyl9Z+GxRV9mgqWfXg4=;
	b=TisSvb+4ENTqWUaMRhRga32LklTd+MN5H5NAQBqQza4/NNQkOqkJFR0JrS97aDIvX5t+
	 +E3ApEF+6ovVyxUrOYRoqy1sXlnQiYu1510yHF5o5Wa8+BYwWgaOdtRFvnb3FD/LOLsxv
	 MlAYDZliNOUy8i1miosqr7NeHuU2aIhFliFrUHGaf/DJIGs0g11PgyOdMc2TenjjhDd/N
	 S6RE20Ah3JJkhlU/ZUi88HzOWjaDCIgZPn6nyH8hqhCqda9Fqqvj0wSgDFeph7biR37Pz
	 3E1/md/ZZKZxA9jI7PMz/Mq8/7q8HzR4v4/tj+MMq3coNSzISiLo3l6E5WbUUMoOQeA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789800725;
	bh=ZObGukjMZRjSxruGjSTWYjbicyl9Z+GxRV9mgqWfXg4=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NEg0WqYX0HqMrEXLXhF8eJnJ5felmFOBMIYqUrOkCnYcpLifjS4kMM+tOCxK4sOv7
	 hTbHxVhDgxLCj8+q/pWvvNeYGXE3156Yz7lyjJdu/5lllkqr3G6670cQ1cs7xvt9Xr
	 dYFlmRB1IUSMUkvTGTVrbfqn6JGwrB5AgtzEJBsnHZ+lMun3DDwrczY+PMyQIQ+3FD
	 Q85soha+Q8TQTRfaAg+zwHf6Q/QDzQEFZECYenhFa4FvA6s3yQJ/RR84ESQkETEMoW
	 gbuakqeWSTcT3NkSX0D8osqN0KljGpfsADbFywUYtB5Yc8A2TiJBvZz+I7806KLRkx
	 EnDmX8oulsv7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43ECF606AE;
	Sat, 19 Sep 2026 06:52:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 603F6224
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 06:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45E8F400AB
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 06:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQQX-QHTzrBf for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 06:52:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DF42340022
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789800723;
 b=Xunrc/vBG9y064l5zgf7IDGJauPDYpxicpefVHNCGiGBsF7d8X0qtqlJfYuU5pP2eYmJ
 zr9QurTHnbsRBMc/x5xQD2r3FMzgnDNtaed8Cnoa8d/mj6hveBcGZ+E98RoZJpNhiEnSg
 g6UUexq1gL/7zpY4lKaG6oiSBT83Ly1VXUXlR3ycfzSz7kq9tmUCcVsacFU6Uvl7cTFMc
 dTUWFurFruy4Uq/PM945d1Yr80DQK0xVkrTr0/vLPYI22yw7RMATIg06cwXSNL6kdFaiP
 xxvZutfFR5EecpcmiK5EODKz486KgZLl4ZOzFlYfqQxJ24OB1luedBc0N61wgoCGG3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789800723;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
 bh=6/eZOGcn7Jvt45lYUhxh/i19uY1e91SlUvAT4b7CWkI=;
 b=a2hSw7z2BPr+dmO0aK9nn6u9lu0R9FHM6Myft/Kk8KTnSqcf6YsLpXiK2szqA32RFD2y
 2N94Ckl2pXlXuPYZQ5AyOk7/YNxCgak7I/njyiP+8x7OpDo/P+Avqm1JDWkcHH6U3y0g4
 BNXmM3xbfwOqlr9/3ohC4GmAlC1VhThH5agvZxbnBUCL4SBgG3iEQw67LgR06HPqUarF0
 6UsA4rF2KIeA6/DoyHMZhUjwRaUepkbNcSXnaOCIAt4tz2p3KhDb5cw9DAQs7+WswF4qR
 EjWb1Eqhd+Tif4FWcAFWQsifNQIIFBD3qzo2pNz8Ro7bv/6nnHc/2DJxU+jzNDWjC4A==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=JOIx5ix9; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:33::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::10; helo=mail-ed2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com
 [IPv6:2a00:1450:4864:33::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF42340022
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 06:52:02 +0000 (UTC)
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a99391ffb2so2439707a12.0
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 23:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789800720; cv=none;
 d=google.com; s=arc-20260327;
 b=HWSoMmWmp8foDl/zgdaopAjntGffGBOlStWSVAkuI+tzDNzGSofxjiwcCZii2Uck5B
 pdWYv+VROQPYOFPeWvq/J2Peqlf5skr7fy4AjJ5KuahCTJoKNFXLmpvkkB68vboAZeQ/
 hJtuZWPkQufHo9BBef5eaH7HMs45GixEgDDXxNMZY4njgA7I7QXnJn4tE1ZtGawx7mri
 4JeQznXakw9WNIgYKF9davEl+7hOEJCptXNCzmBahN30jmQ+eBY4Bgxh1XyZKzzdprzU
 ml2VhrmuSY0iVSfqFoK/Cv/prPOVEx4bbsHE57XP+SogEZdlQvhwxNiubSpWuF6kSMxw
 0i4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6/eZOGcn7Jvt45lYUhxh/i19uY1e91SlUvAT4b7CWkI=;
 fh=JWGO9Y5LDX+KEVOD4p1wsdbns3qdDvWKoNclWLTpVBI=;
 b=TrLVhRTU7vt7TqCrj+xN693DN+Hhr+wo214KGqx2QkrvLbu34IfXm5Pfpu7wS6JSq7
 LthnZwR1UBl0Vlo8vBeZV0K6a129yHlpzz6viNEwosPifwXBaNbBvPePWyDXeEfj4O3O
 h5A0t9UccaUzzp226RSfKOogpuZ904xZww5fJBd6hjSqmyFO5Rqg1C5U82QQhMIkYjMb
 F9jddjJYtvf8lnAsasReABEQgvBNm2t0I68/BWYOKhd3iUAJ1cCsovJpO1S9LsQzsKmT
 3l2AuJ1PJ07MZ2KY/4DSZv8880xIAGtkGhbEGEVJXAt3t58p+dWNn9LB53ASwkpcWjY0
 n7GQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789800720; x=1790405520;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6/eZOGcn7Jvt45lYUhxh/i19uY1e91SlUvAT4b7CWkI=;
 b=IwkEbO/Q/hcHPsi+L8WD/ptsdIi26grRy9iwvoul9GruCz6Z/lw45r1WpKz3dOHvQl
 eJWsDOnB3/FRvywELEk2oiQVkK3gHNtl4YhOZ5vTce9/iK+VDUuppIfYItC/VpWCBR4q
 yyh31sPnU+zgPN5FYA7Zg+cT6O1ncP45gGmy3uC/P5vV30IQP8u+jayNHi7udm52z71S
 IrjL9vwiRGT6nX79RnOBGbdeT5MYrAvOyzneRiWz22zpyDvjhBv4vKM5zy+EHm6pD9Su
 hW0zGqTxk2q0crCXu/KMHxgqGQf7C2PDYfRihMJpCQmXwTj8n3a8p02xWyPlqgBfNJow
 he9g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzb1EoTF4Mu0hqI12jDitYQi/g+yefw8msKjQnnb9oD6b2G2Es6eYoHjFnWRGYNiRCXzVt9Dn8XSdI=@buildroot.org
X-Gm-Message-State: AFuF++leJXjFG9AUb19bEQWLnZl51RD2UllWP0X0Bh0ReAHuJ2hDLTjY
 em0L2uN52iWPNlEE6/QqNKTPUXARrvUbB6PKPjXij3xukg1UXttGFkDSrM/QLPJkHcm/E5OmvWS
 Y7YHZWsbRaRzhOGZmvGW0UykrZeMpCipayw==
X-Gm-Gg: AYBFou3wHqD6QMZ9zhchhQYcYzGdhv6sJ6X5t5uyHiRr2C7EeR3TLBgUAX1MAZuK9+L
 QGYvj3xL57XnQvrMGQzCIA2JqGoCUIGztIwgavuQj0/4+CL+uxK9ZwzUdoe8nnJUwnE/f+1nowO
 d0cdI2SkWf8jJ7CSpLnGEKRUDk9rKpwgVpM45wQNyqe8O0oTRZXeVYK7Tb+yqrfJ9T8HAZtTPEX
 SphnKGE5r3H+DxUKQuAVOPwWfopG+RsfPzgZiExFEsXqp8D14wp5udV4K3LYRxWoTefa8kAl2GF
 okRaSxWsTfhL+S0q3xXEr8vQg5oRnDfiJJAYOjncVFVk+563H79Sfqia
X-Received: by 2002:a05:6402:440a:b0:6a9:cddc:6808 with SMTP id
 4fb4d7f45d1cf-6aa57861d48mr2959562a12.20.1789800720080; Fri, 18 Sep 2026
 23:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260908132030.3792569-1-yegorslists@gmail.com>
 <aq2UaCJzYpQBy_XZ@windsurf> <aq4uaBQ3z1J6Yf6p@waldemar-brodkorb.de>
In-Reply-To: <aq4uaBQ3z1J6Yf6p@waldemar-brodkorb.de>
Date: Sat, 19 Sep 2026 08:52:41 +0200
X-Gm-Features: AcwNN1X9eukFLAH70sjMeB3_trnVVhoIV0BUdsJ4IfxcPGe8cwJusXT-rhABK4w
Message-ID: <CAGm1_kuh5GhrZNA7wZO7WcaEHcB9=a=B3e3d+weYsSEpu9XHMA@mail.gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/e2tools: fix build with uClibc on
 mips64
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

SGkgV2FsZGVtYXIsIFRob21hcywgYWxsLAoKT24gU2F0LCBTZXAgMTksIDIwMjYgYXQgODo0MOKA
r0FNIFdhbGRlbWFyIEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+IHdyb3RlOgo+Cj4gSGkgVGhv
bWFzLCBZZWdvciwgYWxsLAo+IFRob21hcyBQZXRhenpvbmkgd3JvdGUsCj4KPiA+IEhlbGxvIFll
Z29yLAo+ID4KPiA+ICgrV2FsZGVtYXIgaW4gQ2MpCj4gPgo+ID4gT24gVHVlLCBTZXAgMDgsIDIw
MjYgYXQgMDM6MjA6MzBQTSArMDIwMCwgWWVnb3IgWWVmcmVtb3YgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2UydG9vbHMvMDAwMS13cml0ZS1kby1u
b3QtcGFzcy1zdHJ1Y3Qtc3RhdC1zdF9zaXplLXRvLXN0b3JlX2RhdGEucGF0Y2ggYi9wYWNrYWdl
L2UydG9vbHMvMDAwMS13cml0ZS1kby1ub3QtcGFzcy1zdHJ1Y3Qtc3RhdC1zdF9zaXplLXRvLXN0
b3JlX2RhdGEucGF0Y2gKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAw
MDAwMDAwMC4uODZkZDAxMTkyYwo+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsrKyBiL3BhY2th
Z2UvZTJ0b29scy8wMDAxLXdyaXRlLWRvLW5vdC1wYXNzLXN0cnVjdC1zdGF0LXN0X3NpemUtdG8t
c3RvcmVfZGF0YS5wYXRjaAo+ID4gPiBAQCAtMCwwICsxLDc0IEBACj4gPiA+ICtGcm9tIDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCj4gPiA+ICtGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5j
b20+Cj4gPiA+ICtEYXRlOiBUdWUsIDggU2VwIDIwMjYgMTI6MDA6MDAgKzAyMDAKPiA+ID4gK1N1
YmplY3Q6IFtQQVRDSF0gd3JpdGU6IGRvIG5vdCBwYXNzICZzdGF0YnVmLnN0X3NpemUgdG8gc3Rv
cmVfZGF0YSgpCj4gPiA+ICsKPiA+ID4gK3N0b3JlX2RhdGEoKSB0YWtlcyBhbiAnb2ZmX3QgKics
IGJ1dCBwdXRfZmlsZSgpIGhhbmRzIGl0IHRoZSBhZGRyZXNzIG9mCj4gPiA+ICsnc3RhdGJ1Zi5z
dF9zaXplJywgd2hvc2UgdHlwZSBpcyB3aGF0ZXZlciB0aGUgQyBsaWJyYXJ5IGRlY2xhcmVzIGlu
Cj4gPiA+ICsnc3RydWN0IHN0YXQnLiBUaG9zZSB0d28gdHlwZXMgYXJlIG5vdCByZXF1aXJlZCB0
byBtYXRjaDogb24gbWlwczY0Cj4gPiA+ICt1Q2xpYmMtbmcgZGVjbGFyZXMgJ3N0cnVjdCBzdGF0
OjpzdF9zaXplJyBhcyAnX19vZmZfdCcgKGxvbmcgaW50KSwgd2hpbGUKPiA+ID4gKydfRklMRV9P
RkZTRVRfQklUUz02NCcgbWFrZXMgJ29mZl90JyBhbiBhbGlhcyBvZiAnX19vZmY2NF90JyAobG9u
ZyBsb25nCj4gPiA+ICtpbnQpLiBCb3RoIGFyZSA2NCBiaXQgd2lkZSwgYnV0IHRoZXkgYXJlIGRp
c3RpbmN0IHR5cGVzLCBzbyBnY2MgMTQgYW5kCj4gPiA+ICtsYXRlciByZWplY3QgdGhlIGNhbGw6
Cj4gPgo+ID4gQXJlIHlvdSBzdXJlIHRoaXMgaXMgdGhlIGNvcnJlY3QgZml4Pwo+ID4KPiA+IFdo
ZW4gSSBsb29rIGF0IHN0YXQoM3R5cGUpIGl0IHNheXM6Cj4gPgo+ID4gICAgICAgIHN0cnVjdCBz
dGF0IHsKPiA+ICAgICAgICAgICAgZGV2X3QgICAgICBzdF9kZXY7ICAgICAgLyogSUQgb2YgZGV2
aWNlIGNvbnRhaW5pbmcgZmlsZSAqLwo+ID4gICAgICAgICAgICBpbm9fdCAgICAgIHN0X2lubzsg
ICAgICAvKiBJbm9kZSBudW1iZXIgKi8KPiA+ICAgICAgICAgICAgbW9kZV90ICAgICBzdF9tb2Rl
OyAgICAgLyogRmlsZSB0eXBlIGFuZCBtb2RlICovCj4gPiAgICAgICAgICAgIG5saW5rX3QgICAg
c3Rfbmxpbms7ICAgIC8qIE51bWJlciBvZiBoYXJkIGxpbmtzICovCj4gPiAgICAgICAgICAgIHVp
ZF90ICAgICAgc3RfdWlkOyAgICAgIC8qIFVzZXIgSUQgb2Ygb3duZXIgKi8KPiA+ICAgICAgICAg
ICAgZ2lkX3QgICAgICBzdF9naWQ7ICAgICAgLyogR3JvdXAgSUQgb2Ygb3duZXIgKi8KPiA+ICAg
ICAgICAgICAgZGV2X3QgICAgICBzdF9yZGV2OyAgICAgLyogRGV2aWNlIElEIChpZiBzcGVjaWFs
IGZpbGUpICovCj4gPiAgICAgICAgICAgIG9mZl90ICAgICAgc3Rfc2l6ZTsgICAgIC8qIFRvdGFs
IHNpemUsIGluIGJ5dGVzICovCj4gPgo+ID4gU28gc3Rfc2l6ZSBpcyBhbiBvZmZfdCwgc28gcGFz
c2luZyAmYmxhYmxhLnN0X3NpemUgdG8gYSBmdW5jdGlvbgo+ID4gZXhwZWN0aW5nIGFuIG9mZl90
KiBzaG91bGQgYWx3YXlzIHdvcmsuCj4gPgo+ID4gQW5kIHRoZSBmYWN0IHRoYXQgdGhpcyAoYXBw
YXJlbnRseSkgb25seSBvY2N1cnMgb24gdUNsaWJjIG1ha2VzIG1lCj4gPiB0aGluayB0aGF0IHRo
aXMgaXMgbW9yZSBsaWtlbHkgYSB1Q2xpYmMgYnVnLgo+ID4KPiA+IFdhbGRlbWFyLCBkbyB5b3Ug
aGF2ZSBhbnkgdGhvdWdodHM/Cj4KPiBJIGJlbGlldmUgeW91IGFyZSByaWdodCwgaXQgaXMgYSB1
Q2xpYmMtbmcgQnVnLiBJIGNvdWxkIHJlcHJvZHVjZQo+IHRoZSBpc3N1ZSB3aXRoIE1JUFM2NCAo
TEUpIE4zMi4gQSBmaXggaXMgY29tbWl0dGVkIHRvIHVDbGliYy1uZwo+IGdpdCByZXBvc2l0b3J5
Lgo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL3dieC1naXRodWIvdWNsaWJjLW5nL2NvbW1pdC80ZDMw
NzQ4MWUyYzczZTRlYzZhZTNlMzdjODgxZDI5YzE4MmJlZDU4CgpUaGVuIG15IHNvbHV0aW9uIHdh
cyB3cm9uZyBhbmQgY2FuIGJlIGRpc21pc3NlZC4gSSB0dXJuZWQgdGhlIHVwc3RyZWFtClBSIHRv
IGEgZHJhZnQuCgpZZWdvcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
