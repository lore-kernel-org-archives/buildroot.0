Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09038C88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 10:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A763680D59;
	Sun, 13 Sep 2026 10:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vPOELY7H5hv; Sun, 13 Sep 2026 10:19:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A1BDC80E26
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789294792;
	b=EDjhQYoMhAUdMd3GwCBlx18jGsWUwEWy52FxMEeY1vprDW1txOrnhluvEZdrCOE23jxN
	 5+/rDPM6HPFMGeRZZOoCgcP+ItnuHBo38cBvPFTYhXjEgK8y0napaP00M3PXXfiiSFv0L
	 57LQsRDCOkNqDeTsa1p8v6mqaP1jTs3sHirvzL571dAMPdQ803FzGX2bPlnSZh461Ax7B
	 Nl9hmVL9p4FSsY0O/94CMTd+XUAHsSAf81NYUqrlxF5p0qfF4MAkTJjKaSw4xTXYXcuK3
	 cT8iiqH/E9lpg2IglpVYKL1w0cnW0VXYVhiF2yOIVeF4CQcq1wN8RJ0kWqgJOPf/mpw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789294792;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2DjaVNGgWG9KfZmYE7W/VWCpwVcJcfKAcurry1HOcWM=;
	b=OwT8i2DQHPdoOGcOPVK/v3XIIveYtwHmQQ+pLxzZLrWdlQYgZIfhNzEn5Cp1B+Sp2056
	 tnOE984AJ02yqBhdgces9H+5Izzi21i8PXcFVRW+7hT1ASgAcNF8eKohIuL64LY83EohG
	 KOohRHniKXDI/C8hYiWBj5csR1G2/7DH/VcYV1yxIg9Xo59Cpz34wE2OByDNd9gRbi3jN
	 3iVYfZB6vVCafGe21pciV3rsQ6tCA2uQuIKUWnJcFSV06zK5mJEqinKVdmuDGZHtk3g/I
	 zWctrIB/sP+RRJr/VKilpBsZWcBKcVF7MsEhaxlv91hYMVVDX1qv/cDO5q5CYkNuZ8A==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789294792;
	bh=2DjaVNGgWG9KfZmYE7W/VWCpwVcJcfKAcurry1HOcWM=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W+dNUNrcIx8VIWqLrXKQq1X3/82hsxiyDigkUfgQjgMJUucLo/9L92dt0vlGORHCk
	 X//cDpWCwX5tz8DSbcg5LkIh5CdUrJlLsheT8lkqgsW0TG/thpw7Nx7AWSxD6l6s9H
	 AnL9oRQSUFWrZEH/YrwebK50Ip2SGTlGYO1fEj7TGISUbNBzrfloDG6JbL3l0hrcoS
	 5gpoIoK5c7zDTyKQbyjYgLFuJe+IzGrIMuRl8zb59euPEljyiOBKwQo5haefA0ZNX/
	 EcRdgTOwbbiwBbvC05GqUUJ44OxwZDkdk4p8SycAy9NWZzgY5cHOT8xn2KMMKe1Cm2
	 pe20vcinnVCGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1BDC80E26;
	Sun, 13 Sep 2026 10:19:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC6A9EB
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B25BC400CD
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJuptfYyMFnG for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 10:19:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 56C8540022
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789294790;
 b=FE/O+OyqjpGKPaP53BVeNfglHWtWSCP6p8bXfUEtMW+FOyZR+WmU38CcOTto9j4sDXJ9
 hdqfZmCPBOjRnB2yMdj0UbjFKEleKWuXKUOXQEZwveQSAY+unJi6+DbrfOOfQML0hlCOp
 p8fM7+Lalo/Zazc/8Ed4uwnTW4Tvw6fGrHHLCdVc20YVpWjpVA377peGf7fF5+J7q5jft
 gNnt4QzgoJ0563qiqOq16uZstWCZubZZByY+YXBBhv5xpz0cdqWO+6bie5RErX6t7a7yI
 TFy4A7Q922+09ZuDwv0bZZbw3CmVCkY2nUqmkDPUIDptjp4RXEevLTt3NNhX8E23PWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789294790;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=+82Zn3UM8ePZzbTLPX61XHND0XwBxF8AGZWuAJfCiYY=;
 b=M+IyqSw/mWx57QovDeVPf8ePwlZOO3jHplHSyS4zNaBvZU9jak/lKoIx2BKHz/7Nsx9b
 hh3LMxuqukezyyTzQ1/l9QtlPnvoSbC0pv7NFpQJxOsp7nt2L6EfouYkOQO1XNrTg4aB8
 mAI7Xb/Ed7DQ7rFexMI8R8HTduWJyr0MpWCqVwzUNHD6QXOTknYcPr5ou6TRD85j5hhy9
 T0WIVrKlIqSlSqx3FjWnPitmNtVrwPp34gSMjQXe4M6NPxb5pOvcNCY/hs9tRO1IZdto+
 QkctjgNwB0rVGrK+NKjNq/4PJ//woElXe+xOi4lqyD/JXK/KJZ2ho7gSrAoP0Au7mew==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=XCawpTRd; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::52a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56C8540022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:19:49 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6a7ea0046deso3357248a12.3
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 03:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789294788; cv=none;
 d=google.com; s=arc-20260327;
 b=Mvi5sfw/fJV1QPuzw5n1EwiZyXmbQLOvrSHPdNJWtYJOgTQDLqno9QjjT+x61S3Wsm
 +1W5htW6YN9W/wGj7lkz6OYv+jU2/BpYCUAsvS81iSfSh1puSljQiIVsd5KBvye3k76J
 aFtbepvYBp92hQQGc6nmrzljgO0Ig36zDybxwcrSwp7DT96rDPqGv2ahwqe74A2I+kXv
 4rrWHhSLBcz/NNUGzc8wGAE08uYLYo+VVI68Ulfa5zAH2kcp0/xX7D4oVGSWFblCOYop
 bK2tPXLbe6RjRGL8UQiYzS1/3pONMid56OzDACKSTA/4lAc8mjah6C9HI0gvqR46KYlq
 n+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+82Zn3UM8ePZzbTLPX61XHND0XwBxF8AGZWuAJfCiYY=;
 fh=2MW8QZyyWsanhh63b2Ui4wXoiTEHnuxDz7ysrYJIwHg=;
 b=YtkfWlkFiBMGSN3Nqcn4xl6WQ67N9R30YNGrtj1B+UsR0zxaOwglPOF8v+xBP0+0qd
 SWZWU0R0dh3lZXomoZYrQsMTfs9Q90mIv1TOEE2jdR19eU6B52BSFmboZbCCIOSizSgV
 TmbxAi0BjxVqO488lvYQjpNq+r3TAwzlGaWxfMovArcv4h1hbMeH8357GbFuTLlqb9rE
 CUfcI+Jav0GKlX3zFs9tLDfe3lwiHGFiGtTT7TsTuJkxIbtP6GzFDp+g3fGR7L/ytDuB
 XYgcQijDhw2Kg7ARUFZwJVEw5dueApslB8F3wufSNEvlofAISjjnG+1T7vaThO3FUfBQ
 +YUA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789294788; x=1789899588;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+82Zn3UM8ePZzbTLPX61XHND0XwBxF8AGZWuAJfCiYY=;
 b=WmEcisokU3B4BAFaZGlkLqT0D9MqR2iLg9ykBYPOZ++cI7u9RROaoAn+FvosiFTeYG
 Iyt9SszkvlMR6DANS93LL77naX4yiUi0lg77bOISRVxr8LErlniINrDZwPtmdG91GkXX
 QHD0OAgw5NxzRkdU9wZGtNSeIgMMgUJugGnK66VaHQgV9lDUZXAON8cUrCYvD4L+atcW
 pm3CkI77jzrh+1FsG8tHQsjSujntChuelO2re2poo01STttMNHYNrXW7VR8X0UbQm3ki
 WVbHOpIBUTKmPZfCw8EG5+/gF8JJ0jW41r2nL1nb8c0yPpNsEvi2Vgq5qL40mGGu0ze9
 TFvQ==
X-Gm-Message-State: AFuF++m5mWm6nSgL/0M/YkA29YRpO4cJeJckNFuWinJOFWO9zCNMEpdr
 jH+f8G0KhtUb+4Ak76YdKG3wn5Ot/swwD591oNReDL02tDgxra2qVvv/1bpY2BWnq/frbo+bgdJ
 A4cjnikrC/1hC5dDXkCH8i9DVnp7T8fil6RNg
X-Gm-Gg: AYBFou2mdsZf87GKyM7tzYp42jsVT5uUUA0JD7lsb/Zr9TdZBvey+BCbMzO6/kVkeN1
 9yXDz0Np90FAsuH28glTjy62K3gyVROE4B9VHB5E7g+pdny/Ze6yi3ZavoXi77op0Fy5aLihymQ
 vJff9QTTOIptabzTiaXYX6XhpQptL78FQNnff3ZhDVu3yKe4yuywDfnGb6dJ0X1+sOaTbRGGrCT
 VQXYtlKBNWehgATrfY/LMpSgiTdUK1x6d3J6cffuuy3ANvCEerMoKyZ7eUjpp02cY8BQX5vvEXu
 gxAp80yTcQv33P8FDpCkxzrILPhJHoHDM3KM9RmSpQwKaGp/jkpz5w==
X-Received: by 2002:a05:6402:518c:b0:6a9:8d5e:66a6 with SMTP id
 4fb4d7f45d1cf-6a9b5671374mr6220267a12.11.1789294787677; Sun, 13 Sep 2026
 03:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260910015832.17751-1-matt@thewebers.ws>
 <5a6e97f7-426c-4d40-b1a0-bc8d8d327c6f@gmx.de>
 <87ecezec2w.fsf@dell.be.48ers.dk>
In-Reply-To: <87ecezec2w.fsf@dell.be.48ers.dk>
Date: Sun, 13 Sep 2026 12:19:34 +0200
X-Gm-Features: AcwNN1UmMAxXTUk7oewPbgjvH3Vo8LLRQ-RhW35Pbrsv8BDTzS48_kmeavwSnSo
Message-ID: <CAGm1_kvnKwmgiSku8+c_-KV1vqyPrNrq535R_Vxx6f0jb65WbQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Fiona Klute via buildroot <buildroot@buildroot.org>,
 Matthew Weber <matt@thewebers.ws>, 
 Fiona Klute <fiona.klute@gmx.de>, ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v3 1/1] docs: add agent guidance
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgMTE6MDLigK9QTSBQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+IHdyb3RlOgo+Cj4gPj4+Pj4gIkZpb25hIiA9PSBGaW9uYSBLbHV0ZSB2
aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgo+Cj4gID4gQW0g
MTAuMDkuMjYgdW0gMDM6NTggc2NocmllYiBNYXR0aGV3IFdlYmVyOgo+ICA+PiBEb2N1bWVudCBC
dWlsZHJvb3Qgc3RydWN0dXJlLCBkb2N1bWVudGF0aW9uLCBidWlsZCBhbmQgdmFsaWRhdGlvbgo+
ICA+PiB3b3JrZmxvd3MsIG1haWxpbmctbGlzdCBzdWJtaXNzaW9uLCBQYXRjaHdvcmsgdXNhZ2Us
IGFuZCBBSS1hc3Npc3RlZAo+ICA+PiBjb250cmlidXRpb24gcmVxdWlyZW1lbnRzLgo+ICA+PiBU
aGlzIGZpbGUgcHJvdmlkZXMgc2hhcmVkIGd1aWRhbmNlIGZvciBBSSBhZ2VudHMgdGhhdCByZWNv
Z25pemUKPiAgPj4gQUdFTlRTLm1kLiBDbGF1ZGUgQ29kZSBwcm9qZWN0cyBjYW4gbG9hZCBpdCBi
eSBpbXBvcnRpbmcgQEFHRU5UUy5tZAo+ICA+PiBmcm9tIGEgcm9vdCBDTEFVREUubWQgZmlsZS4K
Pgo+ICA+IEkgYW0gc3RyaWN0bHkgYWdhaW5zdCBtZXJnaW5nIHRoaXMsIG9yIGFueSBvdGhlciAi
QUdFTlRTLm1kIi4gRG9pbmcgc28KPiAgPiB3b3VsZCBpbXBseSB3ZSAoQnVpbGRyb290L21haW50
YWluZXJzLCB3aGljaCBpbmNsdWRlcyBtZSkgZW5jb3VyYWdlCj4gID4gTExNLWdlbmVyYXRlZCBw
YXRjaGVzLiBUaGF0IGlzIG5vdCBhY2NlcHRhYmxlIHRvIG1lLgo+Cj4gSSBhbHNvIGhhdmUgbXkg
cmVzZXJ2YXRpb25zLgo+Cj4gSSBkbyBub3QgdXNlIExMTXMgZm9yIGRldmVsb3BtZW50IG15c2Vs
Zi4gV2hhdCBpcyBhY3R1YWxseSB0aGUgY29uY3JldGUKPiBhZGRlZCB2YWx1ZSBvZiBzdWNoIGEg
ZmlsZSBpbiB0aGUgY29udGV4dCBvZiBCdWlsZHJvb3Q/CgpBR0VOVFMubWQgZm9yIExMTSBpcyBs
aWtlIGEgUkVBRE1FLm1kIGZvciBkZXZlbG9wZXJzLiBJdCBwcm92aWRlcyB0aGUKY29tbW9uIGlu
Zm8KYWJvdXQgdGhlIHByb2plY3QsIGl0cyBzdHJ1Y3R1cmUsIGhvdyB0byBidWlsZCBhbmQgdGVz
dCwgdGhlIERPcyBhbmQKRE9OVHMuIFRoZSBtYWluIGdvb2RpZXM6CgoqIFN0YW5kYXJkaXplZCBD
b250ZXh0IEluamVjdGlvbjogQ2VudHJhbGl6ZXMgcHJvamVjdCBydWxlcywgZGlyZWN0b3J5Cmxh
eW91dHMsIGFuZCBjb2Rpbmcgc3RhbmRhcmRzCiAgc28gZGV2ZWxvcGVycyBkb24ndCB3YXN0ZSBj
b250ZXh0IHNwYWNlIHBhc3RpbmcgcmVwZXRpdGl2ZSBpbnN0cnVjdGlvbnMuCgoqIEluZmVyZW5j
ZSBBY2NlbGVyYXRpb24gdmlhIEtWIENhY2hpbmc6IEJlY2F1c2UgQUdFTlRTLm1kIHJlbWFpbnMK
c3RhdGljIGFjcm9zcyBzZXNzaW9ucywKICBsb2NhbCBMTE0gYmFja2VuZHMgKGUuZy4sIGxsYW1h
LmNwcCkgY2FjaGUgaXRzIHByZWZpeCB0b2tlbnMsCnNpZ25pZmljYW50bHkgcmVkdWNpbmcKICBU
VEZUIChUaW1lIFRvIEZpcnN0IFRva2VuKSBmb3Igc3Vic2VxdWVudCBxdWVyaWVzLgoKKiBIaWdo
ZXIgT3V0cHV0IFF1YWxpdHkgb24gU21hbGwgTW9kZWxzOiBTbWFsbGVyIGxvY2FsIG1vZGVscyAo
N0LigJMxNEIpCnJlcXVpcmUgY2xlYXIsIGNvbmNpc2UKICBib3VuZGFyeSBjb25zdHJhaW50cyB0
byBzdGljayB0byBwcm9qZWN0IHBhdHRlcm5zLiBBR0VOVFMubWQgYWN0cyBhcwphbiBhdXRvbWF0
ZWQgc3lzdGVtIGd1YXJkcmFpbC4KCiogVG9rZW4gT3B0aW1pemF0aW9uOiBFbmNvdXJhZ2VzIHdy
aXRpbmcgc2hvcnQsIGRlbnNlLCBoaWdoLXNpZ25hbApydWxlcyByYXRoZXIgdGhhbiBsb29zZSwK
ICBjb252ZXJzYXRpb25hbCBwcm9tcHQgc2V0dXBzLCBwcmVzZXJ2aW5nIHByZWNpb3VzIFZSQU0g
YW5kIGNvbnRleHQKc3BhY2UgZm9yIGNvZGUgZmlsZXMuCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUg
dGhlIG9mZmljaWFsIHByb2plY3Qgc2l0ZTogaHR0cHM6Ly9hZ2VudHMubWQvCgpZZWdvcgoKPiAt
LQo+IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
