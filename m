Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC926C27C44
	for <buildroot@archiver.kernel.org>; Tue, 28 May 2024 13:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D02C82051;
	Tue, 28 May 2024 13:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aG67ZbeuJAgC; Tue, 28 May 2024 13:33:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E9F482052
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E9F482052;
	Tue, 28 May 2024 13:33:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94C9F1D2844
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 13:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DF6260784
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 13:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnnRyW8PBKSI for <buildroot@lists.busybox.net>;
 Tue, 28 May 2024 13:33:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B795E60671
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B795E60671
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B795E60671
 for <buildroot@buildroot.org>; Tue, 28 May 2024 13:33:39 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3d1bdefedc0so402679b6e.1
 for <buildroot@buildroot.org>; Tue, 28 May 2024 06:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716903218; x=1717508018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALoVxGQeTZzuI5oG71weEb7xcETegYcID8oGtDckjWE=;
 b=G3CYOzZg7QbwZ249YiRSTgEauT5zoiTf8e3n1T7eZWiUZ39+bee/OgHtspMFuD1X9n
 /JI1J8GA3Ebpy8FHIjVZjZCkdtvFTWr4OWQHqmDb95nJlGKoEsU/tRe4FADcFnoGSOmA
 oBtInOckXlcEMs1lYKu8Zr/A20itXFWIC/P19S0PQ2gAHL0PCSI5cIsbqEpvMhVLZEOf
 K3B8GhR4wCMPQzyPb/cDHVloRuyp6QgEg0uoZnxs6VH36U1EWoAeU5QRRedTbCzwxCc6
 aRkfLdJnEoPsDDZ2KCATPafitapEJDysXDaW//Ltbn/yJBPvqJt6eVRZfeR/pLw03wTA
 6xUA==
X-Gm-Message-State: AOJu0YxHyS76/HZZoxoUd32p+cByLPv0atTGtFoWJklaxTdk03id6HFF
 cOdvR/aijDGDz7KP7Hr+n6ICtzvieusa8SHUXvQyiocVJHHwTHYHiWz+QaHLy4pdovDNLHhB9Dr
 yVIIprRtleO3OymInebNiq+V9es4=
X-Google-Smtp-Source: AGHT+IHenqBxnpRCZJmhO5FQSo9Glt0CsZgtayWxEugd33QwOD09zMTrrBxfx9V8RfHoo2yp9t9r9hc/si5mwzUWYd8=
X-Received: by 2002:aca:1213:0:b0:3c9:9473:4300 with SMTP id
 5614622812f47-3d1a7b3bcd0mr10990500b6e.48.1716903218546; Tue, 28 May 2024
 06:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240528132218.2307479-1-james.hilliard1@gmail.com>
 <875xuy9i77.fsf@tarshish>
In-Reply-To: <875xuy9i77.fsf@tarshish>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 May 2024 07:33:26 -0600
Message-ID: <CADvTj4riLO-shACg9LLMgPqorKU9CkH088T8b-cddTcZf_av7Q@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716903218; x=1717508018; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALoVxGQeTZzuI5oG71weEb7xcETegYcID8oGtDckjWE=;
 b=CvDKNmZ143zGlGPg5Uc9Rf8cydCi3xahIiC5tec3X2M3ExytqEgs3Nu5uxrh4EVN8G
 a8APi8C2XgV5rOxrrI05S5HYgMfsFpwxylzWDaFUMuNfu0lsaX3KNg5tNdcYFyGCnxhm
 3m1lNLkkeVi2qS8Qs7TdGy/1uetQPrV2w5h2Vt87kTSr2zh6//yFFwuqf3HlHqWHJaMS
 3WSwissO8JzowyCXHZUxsAoMrdS9i1s8k1Gh3hKoKu6HUoregX3YaPpjtGpcLMFceHUZ
 i7sEs7K8LzUPtfslLMaaueeT5scejVGqY+wRKeUNxWR1cg2lyNxWIvj6AOYQUEObrsiS
 YQEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CvDKNmZ1
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/genrandconfig: switch to
 async/await format
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBNYXkgMjgsIDIwMjQgYXQgNzozMeKAr0FNIEJhcnVjaCBTaWFjaCA8YmFydWNoQHRr
b3MuY28uaWw+IHdyb3RlOgo+Cj4gSGkgSmFtZXMsCj4KPiBPbiBUdWUsIE1heSAyOCAyMDI0LCBK
YW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IFRoaXMgcmVxdWlyZXMgcHl0aG9uIDMuNSBvciBuZXdl
ciBidXQgaXMgYSBiaXQgY2xlYW5lciB0aGFuIHRoZQo+ID4gcHJldmlvdXMgY29yb3V0aW5lIG1l
dGhvZC4KPgo+IFRoaXMgcmVxdWlyZXMgYW4gdXBkYXRlIG9mIEJSMl9QWVRIT04zX1ZFUlNJT05f
TUlOIGluCj4gc3VwcG9ydC9kZXBlbmRlbmNpZXMvY2hlY2staG9zdC1weXRob24zLm1rLgoKSSBk
b24ndCB0aGluayB0aGlzIHNjcmlwdCB1c2VzIGhvc3QtcHl0aG9uMyBhdCBhbGwsIGl0J3MgbW9z
dGx5IHVzZWQgZm9yCmF1dG9idWlsZGVycyB3aGljaCBhbHdheXMgdXNlIHRoZSBzeXN0ZW0gcHl0
aG9uIHJpZ2h0PwoKPgo+IGJhcnVjaAo+Cj4gLS0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj4gPX0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1vb08tLVUtLU9v
by0tLS0tLS0tLS0tLXs9Cj4gICAgLSBiYXJ1Y2hAdGtvcy5jby5pbCAtIHRlbDogKzk3Mi41Mi4z
NjguNDY1NiwgaHR0cDovL3d3dy50a29zLmNvLmlsIC0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
