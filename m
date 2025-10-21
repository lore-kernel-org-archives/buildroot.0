Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E3FCCD1A7
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 17:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C1EB811A6;
	Tue, 21 Oct 2025 17:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvvImhaiiOoD; Tue, 21 Oct 2025 17:23:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4DB98156A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4DB98156A;
	Tue, 21 Oct 2025 17:23:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 520FD70A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43B0D60725
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRSuC32fI55C for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 17:23:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::936; helo=mail-ua1-x936.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E4DB606BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E4DB606BD
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E4DB606BD
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:23:17 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-932bced8519so3034348241.1
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 10:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761067396; x=1761672196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=58qm4o1uAxO5kAmMmri+6ImVnB5aECoOovWrFYThDmY=;
 b=EWA8hz1xVlAQ6bv+00WQ/Pahktr18L85w9fGcroAIROkyxMN6TCIIXeu54Q7YiU/a8
 YGidky67DHi5035zzDxT5yCORXpN0z7OYcd5lXb5WRatL9YB8MMVOeJqYApTnJlVx2C9
 CQiiHfvYfAWGqa327Q43xd6TNNa91LQR83Mztu2jLnVqU7saTwcpoyHkXk4PkxhN+4iI
 Ho7XOVAycL+fK7LgxEjEvEke4LRNRdK2eDboWZo7pZC5i+jUmvvKDiNWvc000o07dcqH
 8w+C+gcNtaHLS/36ncGwRMmA/uqHubmhfHCyOtV42VLO79kDfN7OCjCiEqR7S//CDvCh
 kHcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyES6QRZDD89MWVoNCSGFUpxxjb+97Wk+YyHZDFFgW/wGkxd768NwwsOn/1Qona+HD/jjRiHKWIfo=@buildroot.org
X-Gm-Message-State: AOJu0YyZiNuV08CjTSXzc2YDV1E9o3VHBRbNgrKFJT0xsXMOd5ezG/sT
 Zh5ITpXlGFePjoOMXuz19b0BhKJkPm2suz2NdM/hqHWLVkTm31P7wK1oqZbJqCDFpoaAg9yLDxm
 Asx9AZkIWX0EjiCX/GPv7jL5hhAy+FFk=
X-Gm-Gg: ASbGncuSPDRhnnMb9YqpLpiHRPEuR7VmG5I2FL3TWqN4QATs02dasemrZTffY3t+0MP
 gnnSBJCaxSrJNmRUJxEWx6UJgeS2sg/Z8cHziaRW2MxNOVy6zFNDNTHiovjVmu+r6wYj3aB1xXV
 3PU2+0cl/pWK9Szzz9m8RaaUA7E1LRTiRJxEGsu7PKepRwovPVhAEGXgOtIZGDEes516wuoMOo4
 c+VrncfsQVpAY32uqLUbqKNj46Th8ur5jDFuVtsVPw5zPqix1ohdbGkrm8m0Q==
X-Google-Smtp-Source: AGHT+IEEZfLZwjd6fCp+5REzlSB08VZkJA4yk3omDjn4PCeCAh6AoqFOFitaoTAbq/wFW74hxihcGdExMCIc0E5Gmzg=
X-Received: by 2002:a05:6102:d93:b0:520:ec03:32e9 with SMTP id
 ada2fe7eead31-5d7dd4267b6mr5543235137.3.1761067396160; Tue, 21 Oct 2025
 10:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251021055931.532861-1-james.hilliard1@gmail.com>
 <aPcomAvNjlDA4o9R@yd-6wlzhs3>
 <CADvTj4qVJJ7dhUGJiOQnUtrgyuYcZzCKPMf3tx55CWzW-2RQbA@mail.gmail.com>
 <CA+h8R2pYtF+_aDB1o22=ywQCt2aPvPUG_2F=q3ACvR1oKnXiSA@mail.gmail.com>
In-Reply-To: <CA+h8R2pYtF+_aDB1o22=ywQCt2aPvPUG_2F=q3ACvR1oKnXiSA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 21 Oct 2025 11:23:04 -0600
X-Gm-Features: AS18NWAlZ1f9c0a_AWfKMSHxlfxgHcTOSospqGOYLMUhM_Niee1QpKfR8AD0xKY
Message-ID: <CADvTj4rYETcO3AzGrWcb86pkXX5HRXFX3je0L31u-QN=8SLfyg@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
Cc: yann.morin@orange.com, Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761067396; x=1761672196; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=58qm4o1uAxO5kAmMmri+6ImVnB5aECoOovWrFYThDmY=;
 b=Yn8ojs6q22/9VFqJ5FEGJ+GiP+xiE8A+rn8eZ/suK9JUs3nIa4JofDSWUhqXLEnQvo
 2q6rJYzO5zssyYw2zjyEQYP10W8KoH7OD8JMceu/rvbediFwstbOsRO9Nmubp2nD6TGn
 LIchc+oDqa6YwWclfTMx3X5RB40lwafDoDBKYDiEFC98m13KviU/8n8RKtLzXCogKcHI
 v3Nhs+QoA9GRlnlZQvEqTfDm4978uP4jcb2IeeBSm51eRulQVL9yTmAZjoF7Va3xDeN5
 aPzpf32SSP2kprI4ohg0zybnMfT0bYPwxpyF/SbMiNElrDX8t6EtRAYtewsMzUTmF/J7
 JAqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Yn8ojs6q
Subject: Re: [Buildroot] [PATCH v3 1/3] package/pkg-golang.mk: use golang
 toolchain default GOPROXY
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

T24gVHVlLCBPY3QgMjEsIDIwMjUgYXQgMTA6NTLigK9BTSBDaHJpc3RpYW4gU3Rld2FydAo8Y2hy
aXN0aWFuQGFwZXJ0dXJlLnVzPiB3cm90ZToKPgo+IEhpIEphbWVzLAo+Cj4gT24gVHVlLCBPY3Qg
MjEsIDIwMjUsIDEyOjAw4oCvQU0gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFp
bC5jb20+IHdyb3RlOgo+Pgo+PiBPbiBUdWUsIE9jdCAyMSwgMjAyNSBhdCAxMjozMOKAr0FNIDx5
YW5uLm1vcmluQG9yYW5nZS5jb20+IHdyb3RlOgo+PiA+Cj4+ID4gSmFtZXMsIEFsbCwKPj4gPgo+
PiA+IFRoYW5rcyBmb3IgdGhlIHF1aWNrIHJlc3BpbiAod2hpbGUgdGhlIGRpc2N1c3Npb24gd2Fz
IHN0aWxsIG9uLWdvaW5nIGluCj4+ID4gYSBwcmV2aW91cyB0aHJlYWQuLi4pCj4+ID4KPj4gPiBJ
IHdhcyBleHBlY3RpbmcgdGhhdCB0aGUgb3JkZXIgb2YgcGF0Y2hlcyB3b3VsZCBiZSB0aGUgcmV2
ZXJzZToKPj4gPiAgIC0gZmlyc3QsIG1ha2UgaXQgY29uZmlndXJhYmxlLCBrZWVwaW5nIHRoZSBj
dXJyZW50IGRlZmF1bHQKPj4gPiAgIC0gc2Vjb25kIGNoYW5nZSB0aGUgZGVmYXVsdC4KPj4gPgo+
PiA+IElmIHlvdSBmaXJzdCBtYWtlIGl0IGNvbmZpZ3VyYWJsZSBhbmQgdGhlIHBhdGNoIGlzIHJl
dmVydGVkLCB0aGVuIHRoZQo+PiA+IGRlZmF1bHQgcGF0Y2ggd291bGQgX3RlY2huaWNhbGx5XyBo
YXZlIHRvIGJlIHJldmVydGVkIHRvby4KPj4KPj4gWW91J2QgYWxzbyBoYXZlIHRvIHJldmVydCB0
aGUgdGFpbHNjYWxlIHBhY2thZ2UgYnVtcCBzaW5jZSB0aGF0Cj4+IHBhY2thZ2UgcmVxdWlyZXMg
dGhlIGNhY2hpbmcgcHJveHkgYW5kIHdpbGwgbm90IGJ1aWxkIHdoZW4gdXNpbmcKPj4gR09QUk9Y
WT1kaXJlY3QuIFNvIEkgd291bGRuJ3Qgd29ycnkgdG9vIG11Y2ggYWJvdXQgdGhhdCBzaW5jZQo+
PiByZXZlcnRpbmcgd291bGQgcmVxdWlyZSBwYWNrYWdlIHZlcnNpb24gYnVtcCByZXZlcnRzIGFz
IHdlbGwuCj4KPgo+IERvIHdlIGhhdmUgYSBHaXRIdWIgaXNzdWUgZm9yIHRoZSBtaXNtYXRjaGVk
IGRlcGVuZGVuY2llcyBmaWxlZCB3aXRoIHRhaWxzY2FsZT8KCkkgZGlkbid0IHJlYWxseSBib3Ro
ZXIgc2luY2UgdGhpcyBzZWVtcyB0byBiZSBzdWNoIGEgZnJlcXVlbnQgaXNzdWUuCgo+IFdoaWxl
IEkgYWdyZWUgZm9yIHBlcmZvcm1hbmNlIGl0IG1ha2VzIHNlbnNlIHRvIHVzZSB0aGUgcHJveHkg
b24gZGVmYXVsdCwgYXMgdGhpcyBpcyBubyBkaWZmZXJlbnQgdGhhbiB1c2luZyBzYXkgbnBtIG9y
IHB5cGkgb3IgYW55IG90aGVyIHBhY2thZ2Ugc3RvcmUsIG5ldmVydGhlbGVzcyAuLi4KCk9uZSB0
aGluZyBweXBpIGRvZXMgc2ltaWxhciB0byBnb3Byb3h5IGlzIGl0IGVzc2VudGlhbGx5Cmd1YXJh
bnRlZXMgaGFzaGVzIHdvbid0IGV2ZXIgY2hhbmdlLgoKPiBJdCBzdGlsbCBtYWtlcyBtZSBuZXJ2
b3VzIHRvIGhhdmUgdGhlc2UgbWlzbWF0Y2hlcyBhbmQgdHJlYXQgdGhlbSBhcyBhIG1hdHRlciBv
ZiBmYWN0IHNpbmNlIGl0IGluZGljYXRlcyBzb21ldGhpbmcgd2VpcmQgaXMgZ29pbmcgb24sIG1h
eWJlIHNvbWVvbmUgdHJ5aW5nIHRvIGhpZGUgbWFsaWNpb3VzIGNvZGUgaW4gdGhlIHByb3h5LCBz
byBJIHRoaW5rIGF0IGxlYXN0IHdlIHNob3VsZCB0ZXN0IHdpdGggZGlyZWN0IGFzIHdlbGwgYW5k
IGZpbGUgR2l0SHViIGlzc3VlcyBmb3IgdGhlIG1pc21hdGNoZXMuCgpNaWdodCBiZSBvayB0byBt
ZW50aW9uIHRvIHVwc3RyZWFtcywgYnV0IGZpeGVzIGdlbmVyYWxseSBkb24ndCBzZWVtCnRvIGNv
bWUgcXVpY2tseSBlaXRoZXIgaW4gZ2VuZXJhbCBzbyBJIGtpbmQgb2Ygc3RvcHBlZCBib3RoZXJp
bmcuCgo+IEluIHRoZSBwYXN0IHRhaWxzY2FsZSBmaXhlZCBzZXZlcmFsIGZvciB1cyBvbiByZXF1
ZXN0IG9uIEdpdEh1YiBpc3N1ZXMuCj4KPiBCZXN0IHJlZ2FyZHMsCj4gQ2hyaXN0aWFuIFN0ZXdh
cnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
