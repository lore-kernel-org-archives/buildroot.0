Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76C5C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 15:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB7F60654;
	Tue, 23 Jul 2024 15:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBwY0SYkjXXG; Tue, 23 Jul 2024 15:52:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AABF60656
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AABF60656;
	Tue, 23 Jul 2024 15:52:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 508961BF2A7
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 15:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C7724027C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 15:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0c4fZYhbVe7S for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 15:52:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 128D24023F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 128D24023F
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 128D24023F
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 15:52:25 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-4928fa870a9so830204137.2
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721749944; x=1722354744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YK36zmHKnQKUQBncBfbHBjnoxPxGAC2nS17R1reMr4A=;
 b=N3m/AXvPuy6I/dumwSKJIXbIQ/KPxNppxvosy+u6DCNOJ9frxOhxBon1FacVRTNQDe
 CA82Ba8KUtSj/TPnXnGkqEtefqu88nnkOpan2k0EO0lYverZLgqIYU5E6ycipPFE1aaH
 3gZq/k3CKTQJyrWPoRj3GW9BajQnCeTr57uIkyOL3MxcVy8Vbvv3NM+OIyVn9zkNinGb
 epQEmMgsDDB4XcX2FL13suv6/4rAujlvo2PCQKBUd+/aGhT8gx0AEYNBSN098DGSmGJG
 lten3E3lqzoA2y2EyFFsB3q2M4/2O0AuV8j7sFjBH89gj2NpVglgd44xRdxTCKrdlS83
 iKVg==
X-Gm-Message-State: AOJu0YwYKZSGa9alt7ww6CM4GkglPMr0kn4ugOy+8mKimFryqrb3KlXI
 OCcJL5z+wxbm5AND06MeNh5xt6hUeSdsT0bC+cVUNNkfMiwIjMFy+aLXRTUMJnTv4vRDA3dqIYv
 EZTUJAuFwZ294ncH8GViq2sBkbBo=
X-Google-Smtp-Source: AGHT+IGWH+xlOOoUOTjzBy+gpj3BquMxMRIpypE2alynB4gMRbYiq3deOUGtcMGGeVTZXl5RdsgtaKfq1MI+9R/kZLs=
X-Received: by 2002:a05:6102:3e23:b0:493:c028:bee0 with SMTP id
 ada2fe7eead31-493c028c597mr710839137.15.1721749944370; Tue, 23 Jul 2024
 08:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240719045639.3336541-1-james.hilliard1@gmail.com>
 <20240723122759.3a4eb036@windsurf>
In-Reply-To: <20240723122759.3a4eb036@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 23 Jul 2024 09:52:13 -0600
Message-ID: <CADvTj4qd7D=KYJgx0O0bG56Gojq166U94zMEkm72QjxwEh9Ccw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721749944; x=1722354744; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YK36zmHKnQKUQBncBfbHBjnoxPxGAC2nS17R1reMr4A=;
 b=N16yPwCY0f3wzWnlw670J8avME5cQOw4oQTeY9Vc42s1t8NqTT9yHh5y5HgAsuDtBn
 hrPHTZo3X78VVLoApZ+trXOjYdUcJNxpEwzi9eWbL7HlRhG0LHnSdgAn7LB4h2bDOMym
 NtHLHp+zeWR0b8eZfnS7pb6zOHz4MnXOQ5lQMYfb2Ee2+j1she0vUT2ELdByAS0UM3Qb
 haStI+2GeQ3Ma+InBA8ZIsltVF6VoLjnyFLFTkKj9Ta9ZdjplEel0LFCfuohWbnwZh84
 CGM8o+P0yb9ZYWP7Kwh9Et+O6Ce/pSDwbmFDjGHSI5z9qahkrsO7P+rWL42Xxk1O8Nt5
 Pkzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=N16yPwCY
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.7.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdWwgMjMsIDIwMjQgYXQgNDoyOOKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAxOCBKdWwgMjAyNCAy
Mjo1NjozOSAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxp
YXJkMUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL3B5dGhvbi1tYXR1cmluL3B5dGhv
bi1tYXR1cmluLmhhc2ggfCAyICstCj4gPiAgcGFja2FnZS9weXRob24tbWF0dXJpbi9weXRob24t
bWF0dXJpbi5tayAgIHwgNyArKystLS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBUaGlzIHBhdGNoIHNlZW1zIHRvIGNhdXNlIGJ1aWxk
IGlzc3VlczoKPgo+ICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNDU5
LzQ1OTFjNjc4OGFkNTc3Y2U2MmY2YmM4MmVhNzdmOTRiZTgzMmNlMDQvYnVpbGQtZW5kLmxvZwoK
U2VlbXMgdG8gYmUgYSByYW5kb20gbmV0d29yayBmYWlsdXJlLCBJIGRvdWJsZSBjaGVja2VkIHRo
YXQgc3BlY2lmaWMKYXV0b2J1aWxkZXIgYW5kIEkgZG8gc2VlIHN1Y2Nlc3NmdWwgZG93bmxvYWRz
IGZvciBtYXR1cmluIDEuNy4wIG9uIGl0LgoKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6
em9uaSwgQ1RPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
Zwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
