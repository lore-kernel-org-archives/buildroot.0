Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183D5D5B15E
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 18:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 027476087C;
	Sat, 13 Dec 2025 18:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjsYVRBnf5J0; Sat, 13 Dec 2025 18:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20D0560802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765651922;
	bh=WWuO3Lkxx78if3cWCUYIqlN2/a9BqA8aHioxwvwh94M=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=WWhqVFetB85gnG6iGhYR4qwb0EXVrwR4I+Hb44oyQkSuPG+7axhdGGRTnQSlBfnH/
	 rTQ+L7tckY9qAzBTUVDrjGrGqgAZdWTCkXaV/mUZduB2b2MPPLvHYuW+JnA5yYqQ8m
	 dgMz4IK0Ul0j9nUvS5aaaDtgCOPGyd8gEt1mIT3Zw+97kA1DPQuLcbwjLrWYWOprv5
	 zuSMbv1viS/F72sBqBNi2vJfBFnqL6SdIP8K6CXWIEY1Qh9i/7CCPJxGrIKXyWy4CK
	 cOf9fhi1ioQU368H6W7PHokL5gaqZCRiKZ8fbzs9Zj2AsOa8pk1SJwf119Zg5C9kUQ
	 AtJgLHGuqVpuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D0560802;
	Sat, 13 Dec 2025 18:52:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B9A92C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81FAD4010B
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 841FVGxUWGzP for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 18:51:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 662F1400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 662F1400D6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 662F1400D6
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:51:59 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso24321305e9.3
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 10:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765651917; x=1766256717;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fbJYpXAPBgiJJD0iLUBf6EMyrvO4QMfqKp0ob86Svrc=;
 b=BRi+NZ67HNCDCzImc5h/ECgD8mjK2uNWyFUDZAlL6TqyYtbY8nAAJEihP8Ko64dtix
 9jh7lhX3dg5bOXxJD7o8tHunlAgxEvDoGoO3ov9Bpq24o2iAlP5Nj1cTvjWryJ9ZU/M+
 2NxAsvRf/xWaee0Ib0aKMoeGlOxooB4evDfCHFNqZJellTU5KGQYLEbpEK6IwMIWCKvU
 mUEDemz7Hq3s6t7aptOSojWrW2fh2Gvi/uIDtIOIWtXvl1LFgCp7L6W9jQ8I/EebrXLd
 cIJO9JVYplEHH2EYNDaxSS6OQM9iTHM2BpKS7uOaom1zZX33rrMJq31bYZ2exqVqXGBy
 YwOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLqp8kfN8rSKF7kjkd/huquTheNIPozvsafTcR9xj/Au6jY7x2DZIi0dGg8AQdXR6vwGG42mdBu9E=@buildroot.org
X-Gm-Message-State: AOJu0YxsLMfu/l0HXeHVMnArUd098XXN8FtXCZyumYzDIe6lnIKXRqvb
 SAKGMGGYXzDvAcHLYLNhw2dUDcVywh61n6/j6CQyPNjc3mtfeNecrD/x
X-Gm-Gg: AY/fxX4+DTES1Hy3x4t5QthqG/K5aBKT6y1ckFnTn+MQpsgM5fG7Fa6fCGYCPABc11Z
 Qd52h3ukCRJ9r188597YqxfMJuv3rXsYJZ52aFVXkAOf6TI/5JTfu3Ja1ibsIitm98W8Ih/cnzl
 C7nYigj6bTEqbuah5/029fKlJ8citKfd/77ZImwGFd+IL9rfCa/VGfIMoSpp7trb/SxOCe3Gcgw
 YUZqBKcLsyKgC06yWucQzp/X1ioIEElPU+fHwc9eTzfJJSrtpSl46yYFSPHZSDl3V4TJx5ujC5b
 RBIyFHnaiPcKOf756MfxZ+qpBgnr4m6+6g5jGDoi9Q1lSwrD4AJR7XtgMbC4VJWXy6hmKdusYQB
 lPTDTsOpEf+kzC5TJCbXrY+F30pWanqDCGeQVLUgMoP+RiHKOs3uBZibvbUqbv4gEt7OUuMkkVK
 +1i9PxOjk/k5+7EEfwRyoWXtaKkL9mRir/nD3tVUjMD9jFpaL6u+TK7yOts1Q=
X-Google-Smtp-Source: AGHT+IHW5OwN1l7U1sHxdFy1p7FnAgXHQoSSEiwjzoY96/9F1KdT+vh3azErZFw1Mkqbr07fbzxIdw==
X-Received: by 2002:a05:600c:4711:b0:46e:4b79:551 with SMTP id
 5b1f17b1804b1-47a8f90d1eemr61825495e9.31.1765651917236; 
 Sat, 13 Dec 2025 10:51:57 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a957de489sm65151785e9.5.2025.12.13.10.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Dec 2025 10:51:56 -0800 (PST)
Date: Sat, 13 Dec 2025 19:51:54 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	buildroot@buildroot.org
Message-ID: <20251213185154.GC183913@pevik>
References: <20251213185555.22ab2051@windsurf>
 <3B44FA1C-00EA-40D7-AD9F-4980B9556673@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B44FA1C-00EA-40D7-AD9F-4980B9556673@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765651917; x=1766256717; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fbJYpXAPBgiJJD0iLUBf6EMyrvO4QMfqKp0ob86Svrc=;
 b=OODPwyXOTvU0444mN6quh5B1GNz8GOjEIUhrUGcrB+GIlx8vUV6Fyqf7eInshD3s7v
 lz7910kE0yFrGrEjmbNSfDSl/Ez4TCecwrsITOAiwR58FgvGltbok1VXxj06aHTxCO0r
 NPaOooSw9VT1jOXD9HLtz/OX3Uwbd8nN9mcEKcwxfwMFmYxMEDVNECnTnh80YBPIVuX1
 ITwB2TuWNdizW/90dmSgbvihvfYDmUA6e/BGKFvvhkDmy9s/+lseTzC9tE6EmmOGkBop
 MfKh8DxQmxHrljREdDl8Hb7tXdxkCemUVXLmBfJSGgwZp9DqIQ7cFL8WSkb1ZAvUX0nJ
 HdRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OODPwyXO
Subject: Re: [Buildroot] [PATCH v2 2/2] pacakge/nfs-utils: fix build failure
 due to missing BR2_PACKAGE_LIBTIRPC_DB
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PiBIaSBUaG9tYXMsCgo+IHRoYW5rcyBmb3IgbG9va2luZyBpbnRvIHRoZXNlIHBhdGNoZXMsCgo+
ID4gSWwgZ2lvcm5vIDEzIGRpYyAyMDI1LCBhbGxlIG9yZSAxODo1NiwgVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gaGEgc2NyaXR0bzoKCj4gPiDvu79IZWxs
bywKCj4gPj4gT24gU2F0LCAxMyBEZWMgMjAyNSAxNjoxNzozMCArMDEwMAo+ID4+IEdpdWxpbyBC
ZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKCj4g
Pj4gUGFjYWtnZSBuZnMtdXRpbHMgcmVxdWlyZXMgbGlidGlycGMgcnBjZGIgb3B0aW9uLCBzbyBs
ZXQncyBzZWxlY3QgaXQgYnkKPiA+PiBkZWZhdWx0LgoKPiA+PiBGaXhlczoKPiA+PiBodHRwczov
L2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMjlhZGYyZDA0Y2Y0YzQ2ZTQ5MmFmOTVl
ZGFhOTY5ODM5ODVkNmI1Ny8KCj4gPj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdp
dWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cgo+ID4gSXQgc2VlbXMgbGlrZSBy
cGNiaW5kIHdpbGwgbmVlZCB0aGUgc2FtZSB0aGluZz8KCj4gPiAgICBodHRwczovL2F1dG9idWls
ZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZjQ2MTIxMjYwNWQ5ZDVmMWMzOGExZmZlMDBhODM5MTI1
MjJiZjQ4Mi9idWlsZC1lbmQubG9nCgpUaG9tYXMsIHRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBv
dXQuCgo+ID4gTGV0IG1lIGtub3cgaWYgeW91IHdhbnQgdG8gYWRkcmVzcyBpdCBhcyB3ZWxsLCBv
ciBpZiB5b3Ugd291bGQgbGlrZSBtZQo+ID4gdG8gc2VuZCBhIHNlcGFyYXRlIHBhdGNoLgoKPiBJ
4oCZbSBnbGFkIHRvIHNlbmQgYSBwYXRjaCBmb3IgcnBjYmluZCBpbiBzb21lIGRheS4gU28gSSBj
YW4gY2xlYW4gdXAgdGhlc2UgcGF0Y2hlcyB0b28uCgorMSwgdGhhbmtzISBPdGhlcndpc2UgSSdk
IHNlbmQgYSBwYXRjaC4KClRoaXMgaXMgYWxzbyBuZWVkZWQgc2luY2UgbGlidGlycGMgMS4zLjcu
IENvbW1pdAo3Y2VhOGFkICgiQWRkIGNvbmRpdGlvbmFsIHZlcnNpb24gc2NyaXB0IHN1cHBvcnQi
KQphZGRlZCAtLWVuYWJsZS1ycGNkYiwgd2hpY2ggaXMgdGhlIGRlZmF1bHQgb2ZmLgoKS2luZCBy
ZWdhcmRzLApQZXRyCgo+IEJlc3QgcmVnYXJkcy4KPiBHaXVsaW8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
