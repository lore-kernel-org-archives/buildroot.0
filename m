Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAB2E8784D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 17:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F94A605A6;
	Tue,  3 Feb 2026 17:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhZeib-qY_cQ; Tue,  3 Feb 2026 17:12:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED3DA605C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770138761;
	bh=Klx//+MXPNTuh+vPiYVi1+nscU8YzfQTs13wTseJ76w=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s5Echs2nMxYG4jwh17QAmNC83BkQXXxL/wl/PLsmSYjMrwPaAGvAMYz073/YTCdtU
	 bKu+7cUJrYOtDRKyvGZ+GSrk+CYKkYIrrKu2UluuCcx7IhWlyOjHEfKrVdE0Bg1yuG
	 B1OUzk6rTqZqk4/kVfKAaZKilC7flEjSrHa+pBsFuES3MwwV3f/lctukDU0v+04ucO
	 G+i5fZxPaYniEj+7L8yJiba2sMCzs5W01JZBmMC9VRPYBZ6cK8cMcmTP2gk0UBUUtk
	 f2ju3BMcEiQq9IZ4/SsrIvXUQvAQ0pqoczy8It5cAy4vZl8WXejefFQaQq/2xnHT/Q
	 CpsAqY3ereDEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED3DA605C4;
	Tue,  3 Feb 2026 17:12:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B2DBF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63105402EB
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwueR5IXSwIU for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 17:12:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a29; helo=mail-vk1-xa29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABF5040025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABF5040025
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABF5040025
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:12:37 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-5665171836cso4283939e0c.2
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 09:12:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770138756; cv=none;
 d=google.com; s=arc-20240605;
 b=TxNIJj9IzBPPH0lkAp9raCYEg2rGrfzMtr4ZMaA2FNy/zvYjxCGc9pNpkG5v0+ZVxR
 QSu5oY+QpY/Lg1RLzuWR9AU2o7lvo2SSFbEof5kB3e9XVxJDt/7DKbid1aj4oKh5tRlx
 7QHha9cHPw+f9PrJ8N4lFvSysfeo+syHjTes4XQGwO4AMNUACrIBBqmw89if2sz5QeYA
 exsjiuRPOLrEvGNEx4JKndpe6HAi8BPDxQ1E4KlzGQzrwRtEir8Kypy41q3JNOmZu3fB
 PbWdAXB5vznTWC7uXJOO8NKvGzyKxvswY3WM1lm/CGo0dhb0xrF+0Ok5UEX0Vk7fKcjl
 YiSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dunqfRdFjWynnWLMx5D9lIFkvspJwCdtk/Mcd8WhX+M=;
 fh=wIE0GVFJNr+NTQcorsONgHH/LYWtBjjbKZJ4B9nLYm8=;
 b=XIcDVWit7kWVQiDWCqYeDgOO2XUCmnDIj6v6mt36Rp76Ft0LBR68UMmsr63VYXi8JB
 06GZFJXj56n3PWQM4gXaFgqm8lGU/wWGgpkW4AzyZ5D1JC3I0os7XeKp+/TvoF6fLChF
 0N91lFDGQ51rxehwHwKt4fZ5zYgcXd+4VKA4psuElZmyyzTVBSFBfqPWa79OFcdoydoa
 kDdZiTq/vSE/HRwVDR9fkhFO8tSya9qlk1YvmUvOM5L13ILE1+RwqIQLnCwxU6jTWBnO
 cPCVPaElzz1Xe1xDG9ve/pjXU8rOmBrmx8ZyADWzFrsj131CSQBZyT1X0JF0crR+Mlz2
 S9sA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770138756; x=1770743556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dunqfRdFjWynnWLMx5D9lIFkvspJwCdtk/Mcd8WhX+M=;
 b=mZsmejzvNHb52uqwALnQmJ7U48UcobzorUvRIeCX5wrzVHs8LqIEspW8W64OYV0tAe
 fsLXSmCDIpE9ZJPYRqyf6pAJR+eeMMPSFCcL6hpsJkQTF6GRfRUjrWT95CXrlGn4Ux0U
 mtry8Lo435eMZSF8DXuCFtoDLdG7QgOwpp6LbJmdbAPqcxN0SoTHbT4loSoQtCTQefsJ
 bbPfoFzxSko0U7gLrIZlltnaotLJJHJvvnx1T7ZOXYtcb6qYPnJAi1D37SC7qA7y32EG
 fF8l91tJa2wfWCxaxUlrHjDcClwcNw7q3trzvvGhpNDoAyaHQPjZPUVjcJHS7z/J74K1
 YgcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt0nCuTxzskK4GDcthlCHpZa1D8y76vddSKzSamXCHNwy5eYOjyTEpCXBo0uwoP2hr4hOLnuPd2E8=@buildroot.org
X-Gm-Message-State: AOJu0YwMbzVADJG6BqutGbOB0jqI+tcOFnrT3bX+3Hs4skMchgmCgoXm
 uqZtIHsZzq9VXBljsfz8jTJ52DivloM9CimPZOL+GcYXTIBKMfLrzZ6oxnFTm6+X3zAWIEA5rfF
 hCpz+X4aWx5e7g7tFmsyxLayPZj6k9ao=
X-Gm-Gg: AZuq6aLUefLGXuhKJalmnB8zsu/PbmZe3Ul31wvi5/09QSCzZQlZt4c+j/ay/yLQy7T
 vlhhdyNmGuIBHQY0BI2E1cf1US0C7iiKHvA8MOSr9pbY8jKU2eFuodPWeGYh/CYhBMJaWBcZzsg
 yqe3UJd2M45a0sTB9wXgyq2IAMb5pvgL44UBrPT/qHG2r8PPC+jy54Sz2efdWbBER4veWWLhj7N
 BoZXv+nWcxHcSYRo9rh1bRiSPy+IBbsRT3WwklA3Dpv7ANLgLXSiOU0PcjESoy5h5yewNJ5z27t
 a0bNmIEdE4MJt04M08EV+ZU9qAdr8ua3lBjRoD4R9pppuhjnUr/wgHOiqQ==
X-Received: by 2002:a05:6102:dca:b0:5f5:2b1c:7551 with SMTP id
 ada2fe7eead31-5f9394eff56mr163825137.19.1770138756022; Tue, 03 Feb 2026
 09:12:36 -0800 (PST)
MIME-Version: 1.0
References: <20251228213710.2591716-1-james.hilliard1@gmail.com>
 <20251228213710.2591716-2-james.hilliard1@gmail.com>
 <CA+h8R2rJFvtnP4DD7qwGx0smh7sgkDeptMUibqhJgSUuUO3Lyw@mail.gmail.com>
 <c8defb4d-4f5f-4bdf-8ff9-4adad5891fcd@mind.be>
In-Reply-To: <c8defb4d-4f5f-4bdf-8ff9-4adad5891fcd@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 3 Feb 2026 10:12:24 -0700
X-Gm-Features: AZwV_QhraFfpsTwRnda6WuXXPfYRH3fZjtiuJKoJNKKU4RYZ3fV-nIgA5SQZWB0
Message-ID: <CADvTj4rGb6KO0BUFyss9TRy9Ctk7oLdJ1PJLg-F3Y59e73XYbA@mail.gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770138756; x=1770743556; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dunqfRdFjWynnWLMx5D9lIFkvspJwCdtk/Mcd8WhX+M=;
 b=QqFKh4PlyULc4sMOwKlY7ksYW67jlgIl4002Sd8JtXgi+E71aknD3Yb1Hb/LVUvNom
 8G1n5DMD98rzf4ijMM8GCbB0CgfFGMZkOzuPwUqWvpOWe1xkXQAsplggoSA63vJTR/nl
 t/71x/8kVDF0jAhNM0+rT4SI/tFBDK73sF8wsQNbiiWGyn6gwwOPBc1IA9TTmaxnHeGq
 3u11E67JN61I8IAk9TuuAT7/jiEh5Zqz57eaDZAj8kId0LPlMkY+D1MGY8Cxe9tdQ9vx
 pHVOS0rcJ5VPNVvBllhyU/uXZHQjvvzizfEYqqCb8a0DYwUTOvahxfObX5fQc26NPqxm
 mYCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QqFKh4Pl
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBGZWIgMywgMjAyNiBhdCAyOjI44oCvQU0gVGl0b3VhbiBDaHJpc3RvcGhlCjx0aXRv
dWFuLmNocmlzdG9waGVAbWluZC5iZT4gd3JvdGU6Cj4KPiBIZWxsbyBKYW1lcywgQ2hyaXN0aWFu
IGFuZCBhbGwsCj4KPiBXZSBqdXN0IGRpc2N1c3NlZCB0aGlzIHNlcmllcyBJUkwuCj4KPiBPbiAy
OS8xMi8yNSAwMTozMSwgQ2hyaXN0aWFuIFN0ZXdhcnQgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiA+
IEhpIGFsbCwKPiA+Cj4gPgo+ID4gT24gU3VuLCBEZWMgMjgsIDIwMjUgYXQgMTozN+KAr1BNIEph
bWVzIEhpbGxpYXJkCj4gPiA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4g
QlIyX0dPUFJPWFkgbm93IGNvbmZpZ3VyZXMgdGhlIEdvIG1vZHVsZSBwcm94eSBVUkwgdXNlZCB0
byBkb3dubG9hZCBHbyBtb2R1bGVzCj4gPj4gc3BlY2lmaWVkIGluIHByb2plY3QgZ28ubW9kIGFu
ZCBnby5zdW0gZmlsZXMuIEJ5IGRlZmF1bHQsIGl0IHVzZXMgR29vZ2xlJ3MKPiA+PiBvZmZpY2lh
bCBHbyBtb2R1bGUgbWlycm9yIGF0IHByb3h5LmdvbGFuZy5vcmcsIGZhbGxpbmcgYmFjayB0byBk
aXJlY3QgZG93bmxvYWRzCj4gPj4gaWYgdGhlIG1vZHVsZSBpcyBub3QgZm91bmQgaW4gdGhlIG1p
cnJvci4KPiA+Pgo+ID4+IFRoZSBkZWZhdWx0IHZhbHVlIGZyb20gdGhlIHRvb2xjaGFpbiBjYW4g
YmUgcmVhZCB3aXRoICJnbyBlbnYgR09QUk9YWSIKPiBbLS1TTklQLS1dCj4KPiA+Pgo+ID4+ICtj
b25maWcgQlIyX0dPUFJPWFkKPiA+PiArICAgICAgIHN0cmluZyAiR28gbW9kdWxlIHByb3h5Igo+
ID4+ICsgICAgICAgZGVmYXVsdCAiaHR0cHM6Ly9wcm94eS5nb2xhbmcub3JnLGRpcmVjdCIKPiBJ
biBteSBvcGluaW9uICh3aXRoIG15IExUUyBzdGV3YXJkIGhhdCksIHdlIHNob3VsZG4ndCBjaGFu
Z2UgdGhlIGRlZmF1bHQKPiBpbiBCdWlsZHJvb3QgdG8gZ28gdGhyb3VnaCB0aGUgcHJveHkgZmly
c3QsIGFzIGl0IG1heSBpbnRyb2R1Y2UKPiBzdXBwbHktY2hhaW4gcmVsYXRlZCB2dWxuZXJhYmls
aXRpZXMuCgpJdCBkb2Vzbid0IGJlY2F1c2UgYWxsIGRlcGVuZGVuY2llcyBhcmUgaGFzaGVkIGFu
eXdheSBpbiBnby5zdW0sCkkgZG9uJ3Qgc2VlIHdoeSBidWlsZHJvb3QgZGVmYXVsdHMgc2hvdWxk
IGRpZmZlciBmcm9tIG5vcm1hbCBnb2xhbmcKZGVmYXVsdHMgaGVyZSwgZXNwZWNpYWxseSB3aGVu
IGdvbGFuZyBoYXNoZXMgYWxsIGRlcGVuZGVuY2llcy4KCkN1cnJlbnRseSB3ZSBoYXZlIGdvbGFu
ZyBwYWNrYWdlcyB3aXRoIGtub3duIHZ1bG5lcmFiaWxpdGllcyBkdWUKdG8gdXMgYmVpbmcgdW5h
YmxlIHRvIHVwZ3JhZGUgdGhvc2UgcGFja2FnZXMgYXQgYWxsIGR1ZSB0byB0aGVtCm5vdCBiZWlu
ZyBhYmxlIHRvIGJ1aWxkIHdpdGggdGhlIG5vbi1zdGFuZGFyZCBHT1BST1hZPWRpcmVjdApzZXR0
aW5nLgoKPgo+IFdvdWxkIHlvdSBjb25zaWRlciBzZXR0aW5nIHRoZSBkZWZhdWx0IHRvIGBkaXJl
Y3RgIChhcyBpdCBpcyBjdXJyZW50bHkpLAo+IGFuZCB0aGVuIGluIHRoZSBoZWxwIHRleHQgYmVs
b3cgKG9yIHRoZSBCdWlsZHJvb3QgdXNlciBtYW51YWwpLCBpbmRpY2F0ZQo+IHRoYXQgc29tZSBw
YWNrYWdlcyBtYXkgYWN0dWFsbHkgcmVxdWlyZSB0byB1c2UKPiAiaHR0cHM6Ly9wcm94eS5nb2xh
bmcub3JnLGRpcmVjdCIsIGF0IHRoZSB1c2VyJ3Mgb3duIHJpc2sgPwoKRm9yIGF1dG9idWlsZGVy
cyB0byBmdW5jdGlvbiB0aGUgZGVmYXVsdCBHT1BST1hZIG11c3QgYWxzbyBiZQpmdW5jdGlvbmFs
IGZvciBwYWNrYWdlcywgaW4gdGhlIGdvbGFuZyBlY29zeXN0ZW0gaXQncyBlc3NlbnRpYWxseQph
bHdheXMgYXNzdW1lZCBkZXBlbmRlbmNpZXMgYXJlIGRvd25sb2FkZWQgdmlhIHRoZSBwcm94eSwg
YXMKZXNzZW50aWFsbHkgbm9ib2R5IHRlc3RzIGlmIEdPUFJPWFk9ZGlyZWN0IHdvcmtzLgoKVGhl
cmUncyBwcm9iYWJseSBhbiBhcmd1bWVudCB0aGF0IGNhbiBiZSBtYWRlIHRoYXQgdGhlIGdvbGFu
ZwplY29zeXN0ZW0gc2hvdWxkIGhhdmUgZGVzaWduZWQgdGhpbmdzIGRpZmZlcmVudGx5IGJ1dCBh
cyBhCmRvd25zdHJlYW0gaW50ZWdyYXRvciBpdCdzIGltcHJhY3RpY2FsIGZvciBidWlsZHJvb3Qg
dG8gZGlmZmVyIGZyb20KdGhlIG5vcm1hbCBnb2xhbmcgZXhwZWN0YXRpb25zIGhlcmUuCgo+Cj4g
S2luZCByZWdhcmRzLAo+IFRpdG91YW4KPgo+ID4+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9IT1NUX0dPX1RBUkdFVF9BUkNIX1NVUFBPUlRTCj4gPj4gKyAgICAgICBoZWxwCj4gPj4g
KyAgICAgICAgIFRoZSBHbyBtb2R1bGUgcHJveHkgVVJMIHVzZWQgdG8gZG93bmxvYWQgR28gbW9k
dWxlcy4gQnkKPiA+PiArICAgICAgICAgZGVmYXVsdCwgaXQgdXNlcyB0aGUgb2ZmaWNpYWwgR28g
bW9kdWxlIG1pcnJvciwgZmFsbGluZyBiYWNrCj4gPj4gKyAgICAgICAgIHRvIGRpcmVjdCBkb3du
bG9hZHMgaWYgdGhlIG1vZHVsZSBpcyBub3QgZm91bmQgaW4gdGhlIG1pcnJvci4KPiA+PiArCj4g
Pj4gKyAgICAgICAgIFRoZSB2YWx1ZSBjYW4gYmUgb25lIG9mOgo+ID4+ICsgICAgICAgICAgIC0g
Q29tbWEtc2VwYXJhdGVkIGxpc3Qgb2YgcHJveHkgVVJMcwo+ID4+ICsgICAgICAgICAgIC0gIm9m
ZiIgdG8gZGlzYWJsZSBhbGwgZG93bmxvYWRzCj4gPj4gKyAgICAgICAgICAgLSAiZGlyZWN0IiB0
byBkb3dubG9hZCBkaXJlY3RseSBmcm9tIHNvdXJjZSByZXBvc2l0b3JpZXMKPiA+PiArCj4gPj4g
KyAgICAgICAgIFNlZSBodHRwczovL2dvLmRldi9yZWYvbW9kI21vZHVsZS1wcm94eQo+ID4+ICsK
PiA+PiAgIGNvbmZpZyBCUjJfQ1BBTl9NSVJST1IKPiA+PiAgICAgICAgICBzdHJpbmcgIkNQQU4g
bWlycm9yIChQZXJsIHBhY2thZ2VzKSIKPiA+PiAgICAgICAgICBkZWZhdWx0ICJodHRwczovL2Nw
YW4ubWV0YWNwYW4ub3JnIgo+ID4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1nb2xhbmcubWsg
Yi9wYWNrYWdlL3BrZy1nb2xhbmcubWsKPiA+PiBpbmRleCAyNmRhN2JlNzFiLi4zZTM4OGNiMjU3
IDEwMDY0NAo+ID4+IC0tLSBhL3BhY2thZ2UvcGtnLWdvbGFuZy5tawo+ID4+ICsrKyBiL3BhY2th
Z2UvcGtnLWdvbGFuZy5tawo+ID4+IEBAIC0xMDEsNyArMTAxLDcgQEAgJCgyKV9QT1NUX1BBVENI
X0hPT0tTICs9ICQoMilfR0VOX0dPTU9ECj4gPj4gICAkKDIpX0RPV05MT0FEX1BPU1RfUFJPQ0VT
UyA9IGdvCj4gPj4gICAkKDIpX0RMX0VOViArPSBcCj4gPj4gICAgICAgICAgJCQoSE9TVF9HT19D
T01NT05fRU5WKSBcCj4gPj4gLSAgICAgICBHT1BST1hZPSJodHRwczovL3Byb3h5LmdvbGFuZy5v
cmcsZGlyZWN0IiBcCj4gPj4gKyAgICAgICBHT1BST1hZPSQkKGNhbGwgcXN0cmlwLCQkKEJSMl9H
T1BST1hZKSkgXAo+ID4+ICAgICAgICAgICQkKCQoMilfR09fRU5WKQo+ID4+Cj4gPj4gICAjIElm
IGJ1aWxkaW5nIGluIGEgc3ViIGRpcmVjdG9yeSwgZG8gdGhlIHZlbmRvcmluZyBpbiB0aGVyZQo+
ID4+IC0tCj4gPj4gMi40My4wCj4gPj4KPiA+IFRoaXMgUFIgaGFzIGJlZW4gaGFuZ2luZyBmb3Ig
YSB3aGlsZSAtIEkgcmVjb21tZW5kIG1lcmdpbmcgaXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4KPiA+Cj4gPiBCZXN0IHJl
Z2FyZHMsIGhhcHB5IGhvbGlkYXlzLCBoYXBweSBuZXcgeWVhciwgZXRjIDopCj4gPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
