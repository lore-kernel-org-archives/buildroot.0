Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE05C43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 03:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A4D380EDE;
	Tue,  7 Jul 2026 03:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QaC0l2XQfDnu; Tue,  7 Jul 2026 03:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83FAE80F2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783393809;
	bh=h2PJqQUWPJzBpSIpdpk54eTnCTZLWhgo7wbbdMvmd1U=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iNSf3qTWEmjoNjNV9TpBNLptCQpSXTQ7gLFdhGIy3aOTEmLzazuAthTmdwuJu6kiH
	 2N6ZDevd6TLzNpGJVBdrnZ+NGCIXCQt3J/N+/dT7n/ECUQ8Z6UeOJujs6+WxF4H4om
	 Mu+PDhpgkaZOPDrzq6UitKKZR/0Jqat5tPaAfVMjccRSUKrqUMJIfuW6oaplwd7oqt
	 X8dX35TsJGDrD7u9UpfD8QBUfhkfb+gBhmeA6jsTttixcDOH2BALTGnZtySez8zscx
	 DBIVDXet8pEnP9Azhhfd6QXl4e+xsBCSxskL/kZSjXhk8804Kue7DheNmMuSZ6n0hy
	 h8Yu9elKCaCNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83FAE80F2B;
	Tue,  7 Jul 2026 03:10:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10F4E33A
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 03:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEEE660757
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 03:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXFyMPxOWimG for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 03:10:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 079B06061D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 079B06061D
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 079B06061D
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 03:10:06 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-738bd0b7960so3163651137.0
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 20:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783393805; cv=none;
 d=google.com; s=arc-20260327;
 b=jevWWR8OGsCxHUJfq6SJiR7Lz1FIvUo/Fki/lzNJg+s+p3H9hoCAmUD8rJXRVDkyBg
 /G6qsY1VdfdQucPaGv4+7j8Y/HeJjMKsqfrWwLOL13MEpD9C027+5KPpGVQ+uSwqq9Ir
 lU5ve4QzESL7HM+h2ZgGRayETC9BwZUbmRKFS5Uduq127mPoI4HAobqpttsfU4CXxtcB
 siNTg8q7JaN/6lyPAaJitjrc3f0hTAUbv1bEY4A2D+lfAJL1Z9/ZPQJH6oPFBhx0wJsj
 woKHV4Sdyjj8Sw5TGITpis4mCdxEowBI5VTzdxuj2PFUicTWUe5GhGm5Ux67vGjAXIu8
 Of3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZTIWelfsWLDQme8yqdgkRL/ZNfCJMy1LKkvX5CQ/BGg=;
 fh=NImTuwZXTN2MY//DcSrR08JJgXVLp5B19q2+Z6JT+sg=;
 b=DR2HYDzv9kfTn8CjWN3LIB7tRhZRNHxhQhtGzaDlSNNkIU7ysQF2pETf4ClOFX7l3n
 /LJoezqHVHwD76fxfJTPID+hjTqJ/ICzXxaXQgzHivvNANbWDofPt+mW9Nvp8YIt4tQJ
 jJRLmMErmRmLFq85tqKtIEOfMwMfl6LI/jgTpuM+6L8oEgywXFBubnvOl7PyRlkjcnJR
 nVEYX8czqL2Nl0V5wxRgGtP+ZeWmSOyuw21vwOY3FO9gVzG02g7nN9E3GJdPvzuP/3ZZ
 N+nuTML8Tf/s2juu/sLBrvMmYP6yF7KvJRu2AgfsAVvkigObqxjYPD7ga/eM3onWMvC9
 qcCw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783393805; x=1783998605;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZTIWelfsWLDQme8yqdgkRL/ZNfCJMy1LKkvX5CQ/BGg=;
 b=J5+4jxLRqUi8QUQskypo8pmzC+5tA3qq/a7hrvTVKy69nqJwHoSoUW0YO6lv43aBPG
 blSe9Z51ip4SJRXfTh4s1lgHPCHVT4Smx97Ed3OymNWM18sylb6y47sMRBiBeCzB0sU1
 ctH/bVTzK/YTa77xFJhxurFnG8l9k+8d6ffo1bbtZ01tpH3D/psdQ1jYuhw2DFL+Jt2I
 /GWODzhf1HBLLcuap81voqE6tYq5uBja18bDmZGLHIOZM2zpa7HaG70lEsvUktb3pjkk
 3te9XjonXSz/+TLuRrrYPqwE9+PMKgIEP644mg/lt+UQYR7Mly5wm5VkYyAVKwzf0ZOD
 gzvQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RruBxLYq8Jciir0bzPne2C+0Ebp4vEQkcyGT2COF2oe2FAJEVWk+tNF4PzgLaTTUlZe3qF5oZVP4PE=@buildroot.org
X-Gm-Message-State: AOJu0Ywj2rXoEUbq/GJoyP02SxYK8bAsDs4R4+s9TLNduOoWHOVIcDW0
 LeB3Bntl2u2Q66DtRsiPypkTQwmvfPKuq7YHsJ0Ubf7Wm/9XlPcicSdyWKrVEhHVOVNA6PduoYR
 /+CZARq37ZG/oJBi17UBMKBh0zsIJvTY=
X-Gm-Gg: AfdE7cla39ocn8oIqxS4Zl/U3mvEVDeH/ASoIGEZ78bxNokOaVyg004P6JEEdOVYiM1
 izv7Sv0IGV8yU9s6EcnFLTOu3SamwiyLhDrqpaSrs5af5eN3M1obbwi1OSpL9QGyYz36WXEUwn1
 Rh7rk21kmctK25GGMZvEyW6KtobxDf1XGDkF68Ldus18Lj0Crls0WDh9niGky2D8brGVpfEqsQp
 xStLIJ0h+V9bIg4PCI5PMWYPmASkcq6ZWQgy0+kelvhgN1vY9L451QrFKFb2Zmc1nmUiDlcYjKR
 4zICXt2e7+p7Wr7WVzL1Z2AYqwSDFTx0UaSlBBI4etHr+epIL5Hd997Jb7VNX0xgjV38jw4aJdJ
 RFybG1XZuk16q0Tehk6LIlw==
X-Received: by 2002:a05:6102:3709:b0:738:be9e:e11b with SMTP id
 ada2fe7eead31-744b7ea97b4mr1531300137.14.1783393805432; Mon, 06 Jul 2026
 20:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <81101c7c33d.089a792a7c6c.8637372150373603044@ctx-coder.com>
 <CAH+XeQZxiMEEk9y1U4G84V6LCXqE0yviF5zUQnkw7+O8jw2vKg@mail.gmail.com>
In-Reply-To: <CAH+XeQZxiMEEk9y1U4G84V6LCXqE0yviF5zUQnkw7+O8jw2vKg@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 6 Jul 2026 21:09:54 -0600
X-Gm-Features: AVVi8Cfiv49ORcIGd5nTmIGZPBnZMQocGgioTh7uU0sZROhuFOMixCj2ftI1uYw
Message-ID: <CADvTj4oT625=Kh-2p=ZS4qYFsby7aue=oaRzHmF4cPky1dtqMw@mail.gmail.com>
To: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Cc: Luca King <luca@ctx-coder.com>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783393805; x=1783998605; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZTIWelfsWLDQme8yqdgkRL/ZNfCJMy1LKkvX5CQ/BGg=;
 b=HNDJJF0P9YNusZBlwJ4VeSRxypyQQvuhL9haOMfehBl7NvRke+PuLqnEPmUCBNouaZ
 sGYKIB95FGcYXzBmU4WGivA3fYpq06BF3gagZPlKbpD46xIqQKLu4ZJ/ZCOLLXVPLFoH
 UmeUpe7Gh3diXoDpbBSbZTiT4MSLQW7+QhF1YGC/DmbDce6izDpD5e7jqwHcQKYRwRcr
 DxYGzSVUX+uWvt1SZRpe2W2vzFgCkLSdmNMbQs97AoRerJ6hQHsoYqwb3zkS6aJUIX9i
 f44DcRxBfTvy5Un5C/Afwi2jrXskLsHgQdqiDj+deKYCIKWPj7gBKtpMBfuvUn8zyK3S
 1qIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=HNDJJF0P
Subject: Re: [Buildroot] Buildroot ZFS update
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

SSdtIHByZXR0eSBzdXJlIHRoaXMgIkx1Y2EgS2luZyIgYWNjb3VudCBpcyBzb21lIGZvcm0gb2Yg
QUkgc3BhbQp0aGF0J3MganVzdCBjcmF3bGluZyBnaXRodWIgZm9yIGVtYWlscyBmcm9tIHJhbmRv
bSBwcm9qZWN0IGNvbW1pdHMgb3IKc29tZXRoaW5nLCBJIHJlY2VpdmVkIGEgbmVhcmx5IGlkZW50
aWNhbCBzcGFtIG1lc3NhZ2UgZm9yIGEgcHJvamVjdApjb21wbGV0ZWx5IHVucmVsYXRlZCB0byBi
dWlsZHJvb3QgZnJvbSBhIHNpbWlsYXIgZW1haWwoSSdsbCBmb3J3YXJkCnlvdSBhIGNvcHkpLgoK
Ck9uIE1vbiwgSnVsIDYsIDIwMjYgYXQgNjowOeKAr1BNIEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVm
bwo8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPiB3cm90ZToKPgo+IEhlbGxvIEBMdWNhIEtp
bmcgPGx1Y2FAY3R4LWNvZGVyLmNvbT4KPgo+IExldCBtZSBhZGQgdGhlIEJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QgdG8gdGhlIENDLgo+Cj4gSSBkb24ndCB1c2UgTExNcyBvciBhZ2VudHMgZm9yIG15
IGdpdCBwYXRjaGVzOyB0aGUgY29kZSBJIHN1Ym1pdCB0byBCdWlsZHJvb3Qgb3IgT3BlblpGUyBp
cyBlbnRpcmVseSBteSBvd24uIFRoaXMgaXMgbm90IGFuIG9waW5pb24gb24gd2hldGhlciBvbmUg
c2hvdWxkIHVzZSBMTE1zLCBpdCBpcyBzaW1wbHkgbXkgcGVyc29uYWwgd29ya2Zsb3cgZm9yIEJ1
aWxkcm9vdC4KPgo+IEVhY2ggdGltZSBPcGVuWkZTIHJlbGVhc2VzIGEgbmV3IFJDIG9yIHZlcnNp
b24sIEkgZ28gdGhyb3VnaCB0aGlzIGNoZWNrbGlzdDoKPgo+IC0gWyBdIENoZWNrIGlmIHRoZSBl
eHRlcm5hbCBwYXRjaGVzIGFyZSBpbmNsdWRlZCBpbiB0aGUgcmVsZWFzZTsgaWYgc28sIGRlbGV0
ZSB0aGVtLgo+IC0gWyBdIGAuL3N1cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgLWQgJChwd2QpL2Rs
IC1vICQobWt0ZW1wIC1kKSAtcyB0ZXN0cy5wYWNrYWdlLnRlc3RfemZzLlRlc3RaZnNHbGliYy50
ZXN0X3J1bmAKPiAtIFsgXSBgLi9zdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzIC1kICQocHdkKS9k
bCAtbyAkKG1rdGVtcCAtZCkgLXMgdGVzdHMucGFja2FnZS50ZXN0X3pmcy5UZXN0WmZzTXVzbC50
ZXN0X3J1bmAKPiAtIFsgXSBgLi9zdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzIC1kICQocHdkKS9k
bCAtbyAkKG1rdGVtcCAtZCkgLXMgdGVzdHMucGFja2FnZS50ZXN0X3pmcy5UZXN0WmZzVWNsaWJj
LnRlc3RfcnVuYAo+Cj4gTm9ybWFsbHksIHRoZXNlIHRlc3RzIHBhc3Mgd2l0aG91dCBpc3N1ZXMu
IFdoZW4gc29tZXRoaW5nIGZhaWxzIHRvIGNvbXBpbGUsIEkgb3BlbiBhbiBpc3N1ZSBpbiBPcGVu
WkZTLCBmb2xsb3dlZCBieSBhIHRlbnRhdGl2ZSBwYXRjaCB0byByZXNvbHZlIGl0LiBBIGZldyB0
aW1lcyB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCBhIFdJUCBidWlsZHJvb3QgY29tbWl0LCB0aGF0
J3MgcmVxdWlyZXMgYSB0eXBpY2FsIGdpdCBiaXNlY3QuCj4KPiBEbyB5b3Ugc2VlIGFueXRoaW5n
IGhlcmUgdGhhdCBJIHNob3VsZCBiZSB3b3JyaWVkIGFib3V0LCBvciB0aGF0IHNlZW1zIHdyb25n
Pwo+Cj4gR3JlZXRpbmdzLgo+Cj4gRWwgbWFyLCA3IGp1bCAyMDI2LCAxOjQ1LCBMdWNhIEtpbmcg
PGx1Y2FAY3R4LWNvZGVyLmNvbT4gZXNjcmliacOzOgo+Pgo+PiBIaSBKb3PDqSwKPj4KPj4gSSB3
YXMgbG9va2luZyBhdCB0aGUgQnVpbGRyb290IFpGUyB1cGRhdGUgYXJvdW5kIHRoZSAyLjQuMiBi
dW1wLgo+Pgo+PiBJJ20gY3VyaW91cyBhcmUgeW91IGdpdmluZyBlYWNoIGFnZW50IGl0cyBvd24g
d29ya3RyZWUgZXZlcnkgdGltZT8KPj4KPj4gTHVjYQo+Pgo+Pgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
