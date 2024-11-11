Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DE3D2E9FF
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 14:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 117A880B31;
	Mon, 11 Nov 2024 14:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gllrw2SqdH7Y; Mon, 11 Nov 2024 14:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25BE280B1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25BE280B1A;
	Mon, 11 Nov 2024 14:30:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66F4BDB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53AAB402CD
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgdQimz0uWTU for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 14:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 779B2402C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 779B2402C5
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 779B2402C5
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:30:25 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2e2eba31d3aso3427267a91.2
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 06:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731335425; x=1731940225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4ZlB+vygSpS8m4c99VqlCgW19ptJd9u1Hr27MpOUxE=;
 b=nAzzHYJrZO0EY2pRqCVT1Xhf9xl+HZ/5v4N3Tbq8s/CSqeUFlICntRKMvPGjiZ/z88
 PWI0VPy4Ui+mcFzrgyRnHBgtt5sa02OxjxXxxZwI2nqSAMVyz0x0G2BTcs5rYq/9eV6A
 d/3mOQTC6I55CpzNDDS7C/SgkuY2uTq5uMUFfTOdydwiNu/NBTC0QXk5MbZRlXvQiD/k
 le06i2/cxKBRTixYvUQN+Eci83Xdha06qyBNthhyPn+xOzgFlufavoRu5Gh9h6JmOVoK
 /cXEEZ5d17+5D+j/BHGZ+rfNn22AO7MQ3QqMhhv+oj/6OVCevSo1NVqn+p0RIEjnTBbi
 hw5w==
X-Gm-Message-State: AOJu0YyKd1C2pA087NJe1Jx0qyBVcZiRx4yMHysgeX6Xo91IY7CaSZeO
 nVo0ElxHx+KMCguDoILJWV4ZFcx2j/qWChBSTGg98bUENAMkIou8DoFfOJKO+3gzCsQAUBqsXTx
 et29AA8qFV82DlUCJlhGadNx6+Xths0sL
X-Google-Smtp-Source: AGHT+IFVzlBfykwPJK9gvXF++5b6MVYspN5ziSmHi2bx3+3NtgveWyG2NGLzcUX7xO4yaHtn+HpFxWiQqKvmeHWDW/A=
X-Received: by 2002:a17:90b:4b09:b0:2e2:c98e:c33f with SMTP id
 98e67ed59e1d1-2e9b16eb860mr19448363a91.1.1731335424544; Mon, 11 Nov 2024
 06:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
 <20241109-genimage-partition-type-uuid-v1-6-9f23180c7195@gmail.com>
 <ZzIDrUgxa7TSVI0t@ryzen>
In-Reply-To: <ZzIDrUgxa7TSVI0t@ryzen>
From: Brandon Maier <brandon.maier@gmail.com>
Date: Mon, 11 Nov 2024 08:30:13 -0600
Message-ID: <CADwxmT=KT2gGJPvkDknk6nJPhhJcLLFO88PzHOtSw0BNBzyVJg@mail.gmail.com>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel <cassel@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731335425; x=1731940225; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y4ZlB+vygSpS8m4c99VqlCgW19ptJd9u1Hr27MpOUxE=;
 b=nYl8YzUX+oTRrsmcZ3xT+kKwIRSI+JIZ1Cd71gJq7FmmFCrY800hncSvMqTls8AfrH
 hkxCuxpAfFMyvm3hqBWfUj/i5HuhMQVPZw7DOF+At4ysy4vyqr3+yRITV2Zsoi822ie5
 JaiQwHu8ieJHXgVCnk/7Bg2/2Rid6HtkLbkSfjHGveGZmNnp6uMbk/F23kG9+vrAWs14
 sVC19Rd12weeVFIl0J5/Uj9EL4/F//bHmH8stMYZ4qojyFCFsCpEEC7DS0X+1Xm+QFfB
 /9taGre3kdye6PAwUSEj4QrqWK+crMYORnVZhTkzLTY3/jGwKxYzowQhPIh9DcZ2gUgO
 aBDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nYl8YzUX
Subject: Re: [Buildroot] [PATCH 06/17] support/testing/tests/boot/test_grub:
 use partition-type-uuid "root-x86"
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

SGkgTmlrbGFzLAoKT24gTW9uLCBOb3YgMTEsIDIwMjQgYXQgNzoxNuKAr0FNIE5pa2xhcyBDYXNz
ZWwgPE5pa2xhcy5DYXNzZWxAd2RjLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIE5vdiAwOSwgMjAy
NCBhdCAwNDoxNjoyMFBNIC0wNjAwLCBCcmFuZG9uIE1haWVyIHdyb3RlOgo+ID4gU2lnbmVkLW9m
Zi1ieTogQnJhbmRvbiBNYWllciA8YnJhbmRvbi5tYWllckBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+
ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2dydWIvZ2VuaW1hZ2UtYWFyY2g2NC1l
ZmkuY2ZnIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90
ZXN0X2dydWIvZ2VuaW1hZ2UtYWFyY2g2NC1lZmkuY2ZnIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L2Jvb3QvdGVzdF9ncnViL2dlbmltYWdlLWFhcmNoNjQtZWZpLmNmZwo+ID4gaW5kZXggMTE2MTVj
ODg1YTA2MmQ1YTg2OTE3YmI5NDIzNjBhMmFiOWIzYzJkZS4uOTcxNzA3NmNhODcxZWIzZWZiNGZl
YTdjYTk0Mjk3ZDAyMjgzOWRlMyAxMDA2NDQKPiA+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy9ib290L3Rlc3RfZ3J1Yi9nZW5pbWFnZS1hYXJjaDY0LWVmaS5jZmcKPiA+ICsrKyBiL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9ib290L3Rlc3RfZ3J1Yi9nZW5pbWFnZS1hYXJjaDY0LWVmaS5jZmcK
PiA+IEBAIC0yNSw3ICsyNSw3IEBAIGltYWdlIGRpc2suaW1nIHsKPiA+ICAgICAgIH0KPiA+Cj4g
PiAgICAgICBwYXJ0aXRpb24gcm9vdCB7Cj4gPiAtICAgICAgICAgICAgIHBhcnRpdGlvbi10eXBl
LXV1aWQgPSA0NDQ3OTU0MC1mMjk3LTQxYjItOWFmNy1kMTMxZDVmMDQ1OGEKPiA+ICsgICAgICAg
ICAgICAgcGFydGl0aW9uLXR5cGUtdXVpZCA9IHJvb3QteDg2Cj4KPiBUaGUgZmlsZW5hbWUgb2Yg
dGhpcyBmaWxlIGlzOgo+IGdlbmltYWdlLWFhcmNoNjQtZWZpLmNmZwo+Cj4gWWV0IHlvdSBzcGVj
aWZ5IHJvb3QteDg2Lgo+Cj4gSSB1bmRlcnN0YW5kIHRoYXQgeW91IGFyZSBqdXN0IGNvbnZlcnRp
bmcgdG8gdGhlIHNob3J0Y3V0LAo+IGJ1dCBzaG91bGQgdGhpcyBwZXJoYXBzIGJlIHJvb3QtYXJt
NjQgaW5zdGVhZD8KCkdvb2QgZXllLCBJIHdhcyB1c2luZyBhIHNjcmlwdCB0byBidWxrIHVwZGF0
ZS4gVGhpcyBkZWZpbml0ZWx5IGxvb2tzIHdyb25nLgoKSSBjYW4gYXR0ZW1wdCBmaXhpbmcgdGhp
cywgdGhvdWdoIEkgd291bGQgcHJlZmVyIHRvIHNlbmQgaXQgYXMgYQpzZXBhcmF0ZSBwYXRjaC4g
U28gdGhhdCB0aGlzIHNlcmllcyBpc24ndCBtYWtpbmcgYW55IGZ1bmN0aW9uYWwKY2hhbmdlcy4K
ClRoYW5rcyEKQnJhbmRvbiBNYWllcgoKPgo+IEtpbmQgcmVnYXJkcywKPiBOaWtsYXMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
