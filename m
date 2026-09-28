Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C6CCA5FA3
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5800480B08;
	Mon, 28 Sep 2026 21:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNTuc3MEelr0; Mon, 28 Sep 2026 21:04:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 69FD680B12
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790629476;
	b=gCpvFTnVAB/nq7sNp39IUkk5jzaxMytfirE5bcjNumptRTx4tUKQM2D0Ldtl+SQ6bHBQ
	 uOEa+mafUNJ2x7CqBozktwNkcG6EEXq1L1QjC5cEfyc093+oSdQz9kKPjI2WFDrqqiIj/
	 oo9BPLju/XH5SbPNIMcbLX/DetVL/zfRy10fXB8VN7/RBEVOet9pkl6sv7Ynesl3LSndx
	 WtwuEGDySkSVr8FhYrxz09vQENEU/ebdd6q6xxq9WZzH1wyP7BTyDMUxxvMXzyuwwbn9c
	 Sr9ThYEdVfimiHaxusqUiLlMGo5dpx9bXnjZq8W5/GIEKx/6raVeEo5H1Pt18eNrimw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790629476;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FBhmgRsbwXNwiojdKui09v1RFTp55xnT92xRiQ7r9v0=;
	b=K76S1PMpSVtQUfmAqOO9Gids0F961GHxsBGvxiMr3wpky6bjJKnGAvqwos/qLj84LxEs
	 w6zuETv8D2dppCJ3zvsUV4OuW38E/gjULTTsDMO3L3SBRTCFIgBHZP/c/sG17lOFzWuQL
	 4ud3Ra7v5kWT64AxDicntoP+V4F6kEov7b/uyBBLOJnUwBiGq4dPG/GfGd6ifdpDQxHs5
	 sg3aeufGntgP2wiAw/nFgJ/T4Aed2uTa5Z9TV9S3oFYr9OZ76u2zP8suxZrUs8fD91D31
	 VkS8cRS/M0mzIJ9jwsixKF+KZDn5t+mUcpZPt+7aAkPK2Kfg260d4LBbTvd3Uj1g+5w==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790629476;
	bh=FBhmgRsbwXNwiojdKui09v1RFTp55xnT92xRiQ7r9v0=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B8v5pB8L10mqwglpxJW0HtJ+6mxoYBsLy9SVXESyvIWIHt1em0CGDB2nAG9TXURN8
	 DW/IyTVwpjzP+6wC4seZWVm9Yz0owLLtKdplWDJpcm09cwvcY/Nr+vkEsWlhL8pzN5
	 9JbvBO2Xz8Kh8acOIta8ngWKgtYD3x4hXNStP2K8WBe22/2mPXug0whDCnU0B/O5Cw
	 yl9HkTxVGSN9LwR/yz18p2sj+UKPn9eAXuTcA96TMllXuQHHn1iK+Y7cOA7Bl3/bWE
	 o0ARj6yEqfrQ0u4C88nx59WlV0PkisRMH1Yw44AVVHSFYlGNRJFShanp8WrSjcD3LM
	 Yn+8Tln6dCwpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69FD680B12;
	Mon, 28 Sep 2026 21:04:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1297B61
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 040FB401C8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xpjSRR3mOjN for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:04:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D29E94018B
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790629474;
 b=rwJujF162UhMRLTi0C4AFZIwclbTgOtfaZ4EwKiMWzSV3BJQ2WP2WR9gUAYWB4gD1ePi
 fefz/pxUyGpyqXRVOl2TxP0m/NBbckM10pDevYcSjva9YU3r67uUJSOwyq3ATicw8TI3B
 nAig3bGnKwim8OTyVzb/LaYhEbCQGce11/ftwJJF122+6xnLD5ZXfZ/ujUTYkAxi/+rjd
 q8G10y92Sh5AJMZiHmqSK5KoPiInL5L2r7wVR8x1eJUGZ/QISjSPsEIIPxpI1O2Z88C3c
 xSFwd4GZgQ3ka/pHks+6FxV4IKYR59S4udC+UsdOemFKj5GNEvGuL7cbrYkvMttuxTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790629474;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=MXShg9iZ2I+4VnUXOBkKyZT10/fYOWosJnl/DLm0vo4=;
 b=oL48XwkYDNZz5SKMACAQsdfyxcaak291JB/u+AaPyNF0xe66qIPGy4ixkZFavhAlc9Jd
 r95iCVnhdacIyKV6Tn3VhZMMzck7rZsqVN3nDs+tglnk8H2PtkTEPaKxp9gJNjsISom6x
 P6U7XjcR5sNeP7j/LfLoV41H9YrIZNOS+02gOD2wYIKgk7t7SvVhgfMCgFQvmTpwA8+yD
 +Dgr4/kgP5NK1vracrn4/QkFnx/vIF4KAL1Z5bMJshlOMDNv87oXU7L3fMJUFL3sbwRyc
 yMfPEKd/q+DsmoL/KBXrFOjyY0o10mharF8Mw6QNiqcLuTa4MFQKy2/29C8IG75hHXQ==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=MRvt2qSV; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:33::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:33::e;
 helo=mail-ed2-x0e.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ed2-x0e.google.com (mail-ed2-x0e.google.com
 [IPv6:2a00:1450:4864:33::e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D29E94018B
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:04:32 +0000 (UTC)
Received: by mail-ed2-x0e.google.com with SMTP id
 4fb4d7f45d1cf-6aaf688ebb0so3932406a12.0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 14:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790629470; cv=none;
 d=google.com; s=arc-20260327;
 b=Ho5G6W/zKgGg7HPlIspYIzGE5sIDA/R72GpnaGbBoceJ3zHRu3MnadR9vy/LKbzhQ1
 z9Bcd+a7vvsH2czmE5s7lzgFYeR43LAiFgY6Fvry70L2UvQlIkDJjR0TywlJSK8XHMfc
 5wZmLKI7lzrl0kpwrzJQ4rbBVmgHcQMO2222H9FL2DoaDncRFNe3ub6FVCwSX6mNn7px
 Px7fbWBQ91Ont3ha00bFe3W8HZmfkHYq2r+GvYHGVjd9xbuMhp4XQrcJ4D3fJjROI3Yl
 C2AC5csv3Yx5UbNHPhjW7uOWRgasAnbmveCPL3Zf3aSeP9f9GBJVN9t6AsRr1zwqcS9w
 N8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MXShg9iZ2I+4VnUXOBkKyZT10/fYOWosJnl/DLm0vo4=;
 fh=lgRPIRPzXxxRS599zlHIbpt0lol323QK4/G5IjH/bI0=;
 b=MYIs/twS+Mm5CspxcOLvE2gNZl2miBGxkpWiUUf4YFu2EWNmFzJIJXRNtZauf71jB6
 Qv0yc/aAheItQKxhWfRL0GTH3ZH5o2ULEum493OGA+6UqbakUjd72YZ3BEjejr3p0Vcy
 uISO5tyPovjDv+s/Z1ew4FMZ08fOqQWIFkLhYHMc1NRJjoAiv2TA9sI9y+FcfHsxZmgI
 r19IouZQfeKQfkuW3VbX+q1sHAzGNkO74ErfVKEH8auWo8neszQLVe46Pg/VciGmvKiw
 IYU9W2oqsdu7uOEmD5whoYzOvs5hNFceJR9yhaHpEiep9H3Km9c0t3Z0tqIl9hliZX1S
 7yiQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790629470; x=1791234270;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MXShg9iZ2I+4VnUXOBkKyZT10/fYOWosJnl/DLm0vo4=;
 b=i3RaqOvi/HeI5wEsW6RKs60JoJh0Kwsm2BaP+K48xSbhPo14Sg15nbdMi6idcvlOge
 ZvksGPpBTf8zQu7EIuqigOFIme8WthM6QB/zQ10fhtG7jL/bISyWYc6erZ7KDZxl9hXf
 2IuVFPDk3xuL41DZfXzhp3eItHXT89uMINEbuUVuu0FLYclo/pmFqMvhYLIfRF5J0R0C
 zRbocaHlHf1xw1O7nxbAAmZaXfRaBruZba4I+lngHVyDkqZ4WoQeP0HBcI41W+W/x+Do
 c8hkvfYbfTSrG+NOyG0gG2syuNfxKXDUC/Z98OAB/K4s1o95sVHlFlz3fET2+AehZBPG
 G3KA==
X-Gm-Message-State: AFq9FYK5JOG9wttF8eC+s0tRLegj5fOYXgLH9LaDO7ZbiNZ8epmYJvfU
 9vpCYBCizSJ9tOe4tvI70uEhKF3MqWBjR2OFWw2cWGT9eeCuokWzAJuKG15bl2RaAUPQ2WHLTbH
 iwUW84DUiSgkeCatWo80LnnS9vF04M6gVKyKB
X-Gm-Gg: AYBFou2UT8psjgc/IxmQvGi6cT2rxVPhPCcKeS349SvNISUK8M0tb2H1L2UXVq9p7xc
 Y5rMJPS/0foP5K5RuEf4ZK7xAaZyQiGXF8P4lbALlXCFp6DjaIfkWwa1KyIhtFkfK3mHIVeK6+Y
 c6gHlIWEBnp7Z7d0bKAjm4YK41BM9JhNEXmR2AxdRRaauyfddppS37+a2caPRnrB8pBBSn4a+mb
 ZEDzwT6MqPU/OSFFYBFnit535kP1UCLAh6AWQF6iC2zC5zIZkplm9yy5xwMAgrnU//a/JRgx5S6
 HMzorXZGP21cVC1+77KlwjadYtIwqlk4shaV23uTvuamyfdPaDohnFk=
X-Received: by 2002:a05:6402:324d:b0:6a7:ee56:615d with SMTP id
 4fb4d7f45d1cf-6aac90cfde6mr9060579a12.31.1790629470051; Mon, 28 Sep 2026
 14:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260928150654.295119-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20260928150654.295119-1-giulio.benetti@benettiengineering.com>
Date: Mon, 28 Sep 2026 23:04:18 +0200
X-Gm-Features: AclHuK-CoJzF-VcN2_k8h-6SQTY1beC9nQF8NDBlofjDQmTqfUpLUVtuDCf_O2U
Message-ID: <CAGm1_kvhSa6Vumz+Er6nkjWKHkoRYiBHXdO-CdGxV4rLDsODrw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: fix build failure due
 to wrong libtool/configure paths
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

SGkgR2l1bGlvLAoKT24gTW9uLCBTZXAgMjgsIDIwMjYgYXQgNTowN+KAr1BNIEdpdWxpbyBCZW5l
dHRpCjxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPgo+IEF0
IHRoZSBtb21lbnQgY3J5cHRzZXR1cCBpcyBidWlsdCB1c2luZyBsaWJ0b29sL2NvbmZpZ3VyZSBh
cyB0aGV5IGFyZSwKPiBidXQgdGhleSBkb24ndCB0YWtlIGludG8gYWNjb3VudCBjb21wbGV0ZWx5
IHBhdGggd2UncmUgYnVpbGRpbmcgZm9yLgo+IFRoaXMgbGVhZHMgdG8gYnVpbGQgZmFpbHVyZSB3
aGlsZSBsaWJ0b29sIGNoZWNrcyBmb3I6Cj4KPiAgIGk2ODYtYnVpbGRyb290LWxpbnV4LWdudS1n
Y2M6IEVSUk9SOiB1bnNhZmUgaGVhZGVyL2xpYnJhcnkgcGF0aCB1c2VkCj4gaW4gY3Jvc3MtY29t
cGlsYXRpb246ICctTC91c3IvbGliJwo+Cj4gU28gbGV0J3MgZml4IGl0IGJ5IGVuYWJsaW5nIENS
WVBUU0VUVVBfQVVUT1JFQ09ORi4KPgo+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxn
aXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+IC0tLQo+ICBwYWNrYWdlL2Ny
eXB0c2V0dXAvY3J5cHRzZXR1cC5tayB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2NyeXB0c2V0dXAvY3J5cHRzZXR1cC5tayBi
L3BhY2thZ2UvY3J5cHRzZXR1cC9jcnlwdHNldHVwLm1rCj4gaW5kZXggNjQzYTJiM2Y1OS4uZmJl
OTIwMDFmZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2NyeXB0c2V0dXAvY3J5cHRzZXR1cC5tawo+
ICsrKyBiL3BhY2thZ2UvY3J5cHRzZXR1cC9jcnlwdHNldHVwLm1rCj4gQEAgLTIxLDYgKzIxLDcg
QEAgQ1JZUFRTRVRVUF9MSUNFTlNFX0ZJTEVTID0gXAo+ICAgICAgICAgZG9jcy9saWNlbnNlcy9D
T1BZSU5HLkxHUEwtMi4xLW9yLWxhdGVyLVdJVEgtY3J5cHRzZXR1cC1PcGVuU1NMLWV4Y2VwdGlv
bgo+ICBDUllQVFNFVFVQX0NQRV9JRF9WQUxJRCA9IFlFUwo+ICBDUllQVFNFVFVQX0lOU1RBTExf
U1RBR0lORyA9IFlFUwo+ICtDUllQVFNFVFVQX0FVVE9SRUNPTkYgPSBZRVMKPgo+ICBDUllQVFNF
VFVQX0NPTkZfRU5WICs9IExERkxBR1M9IiQoVEFSR0VUX0xERkxBR1MpICQoVEFSR0VUX05MU19M
SUJTKSIKPiAgQ1JZUFRTRVRVUF9DT05GX09QVFMgKz0gLS1lbmFibGUtYmxraWQgLS1lbmFibGUt
bGliYXJnb24yIC0tZGlzYWJsZS1hc2NpaWRvYwoKSGF2ZSB5b3UgbG9va2VkIGF0IHRoaXMgYXBw
cm9hY2ggWzFdPwoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmJ1aWxkcm9vdC5vcmcvcHJvamVjdC9i
dWlsZHJvb3QvcGF0Y2gvMjAyNjA5MjQxMzQxMDkuMjQxNTQ5OC0xLXllZ29yc2xpc3RzQGdvb2ds
ZW1haWwuY29tLwoKUmVnYXJkcywKWWVnb3IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
