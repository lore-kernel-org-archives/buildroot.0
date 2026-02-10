Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62130EB2705
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 20:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0B8A81233;
	Tue, 10 Feb 2026 20:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PutDKS1Pjam4; Tue, 10 Feb 2026 20:00:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA793811A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770753617;
	bh=Vp9BMMC5omeNtLfovbLu8LO8j2J1k2JkGhs+Xdfn93w=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lIYXYIrpIZSM1X/NKFASiDUht2WtKLHCp5VArkAM/XJrcVUJp3v7UjLpSMhVfVxFk
	 9kJ9v/5M7VmO2gpf7wRW3zZtLJMGpsa4sW5lz2EYraEiuuX8g2+au3Kd4S/qLIdtW6
	 9hFtZxdQylodZPpsH/QmeKKIJUZ0ESb/JbHMXwCSiNTCEqMYJ73uMZKuPWDhgOi/T1
	 9HeQ9pIlv+2IMy0zmN2ZW77OxbN9vblWcGmPPHQaHvmRQkgTmV9Q1SRsw2L1/e7R/P
	 SbsY8sUnP7+mK85gnc/325AJQtY2mvzEnGHKrp4JlREM8PvY0NLJv0mY1NPzAeBfPR
	 6QjrrIqo4Neng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA793811A7;
	Tue, 10 Feb 2026 20:00:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D43A123D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 20:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6BE260B27
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 20:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZA7iAswHhCbw for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 20:00:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92a; helo=mail-ua1-x92a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF0E560863
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF0E560863
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF0E560863
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 20:00:14 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-948bfb6b6bcso1610932241.2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 12:00:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770753613; cv=none;
 d=google.com; s=arc-20240605;
 b=CiRjuYpas8teXziruMSxpUpWpki6AZs5cBqfufxIaNOqhlgnn72CpwM1hfDc9XVlNx
 wc2/nNBmFDUPT9znQM0h1OakTVGp8GsHkDGEUopKenPzuJajDSnXdEfMF27eD29XLKit
 oNcoxrBWLqf59ZaHfenSSoCljkMfzDUmgJKyxiQQFCddBxPwogcCpkJGqO675EjkYasB
 NA7z0azG6g4OIAWokUtfqXkG0ikYV09pI8iXmHo5091iUWIN5FizTS8wZt5c+t2zCGPM
 /ZkhMn+ONYLK9uhWZCsrRJlhbKjZgWsTLTU3KvMaqsMruLObQIn6RXEsKlbLuHJ4OPTT
 EIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=lSbxT8WZ8mN80rc94tVFEbg7wEi51s54GSgA34DxxwA=;
 fh=xaQjcxFgV/smHeLoJBDob5ulqZdTSLniWg4GhBDIMb8=;
 b=kOocYU3lCLfMCTXdMXnCJoHIWHQVHkH/sX5tZT0rxuWiSp3kG/had2wdeq5I3BnG6L
 +qAirPJCYgpqwalA6uzCMGBzMINVppeVjrk/ay4jUwmK7xYAVCUdV6yhaV+7wscNuRBV
 1yefPHT0X3KjF1xMf6Pb6hlu+mqDKYVcHScZdDpvI/etysJiM1fuW1iB4Tbuo/cTJ55e
 1mGmhTaMEFs83XyNqvZrx17q0T7idkTzS0s/8JbglbxtvphvS6PJ3SL7h7x3H7Tg5Vpw
 UU7jx7gxQNSO2D2Sjj0lQ7JNDPEzU/tsQ3INgQUzSHB4CdG8j4+boWQXQtf+JvvVeDnM
 RHEQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770753613; x=1771358413;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lSbxT8WZ8mN80rc94tVFEbg7wEi51s54GSgA34DxxwA=;
 b=KfR6D+I38c4CWYidFrFCakGgaMMHa+Yn+IdlVTe95qmFio1E5LKxjYuJi9DpB1KW87
 pxOpWNfwxCOF1bLvbW2dyp/e2xilhH0RMKPKYvmPkYkD6OWn9EwqWF6Sc6VCaRjlNtwP
 KT+E19FvKhpc9VuKbMJ+KIu+C9lX961CQWkh+JzfhymjcY4Ys8Npqnx2PkxsPmDMGF+U
 4sUkykyUlhVr85e3B3x9ZrBQ0Y4XboUaV4QRbOC8ejmSgyjgMxSZhZM5rwJ/Yi/Ts3Xa
 i6dKuKYd2tZ3+tXyHGGDtxBImttGw2NKRIBjEoss3UK9uZAOe5IblgFEK9SzreBOjCLD
 DtEw==
X-Gm-Message-State: AOJu0Yyw/+hZCAeIu0Oc9iLxCw3DzyvbXskog2bjDu1mP/9ctngsw4g0
 TInBNKcMHUQWY0HgdyeoNFkci6EHIrU2mbqxz2CIfMAdkumF337BMhUq0kylmTFJLqY2HEDi35N
 /x35QS4aVo+T6NTIy3BC/JYpkslEXR28=
X-Gm-Gg: AZuq6aLzit7joHWjtJY1Dn0ChJTRuBXu1f0i3RA4+gJqUJsNBHDunRUznT6+SwFdhEX
 oLbE4zT6y6EdpreCCkb9hiByU2yJqc+Y5vNVoSqv4MyAc+A0aRCl+Yyw1DuflfRY2j+vgyQTmOs
 B9ZI70Bv+vZzQ3gkROIpybUi86SmZA4kLi/VRFGf0amjOnuY1kCJZAx4A24WVnV35BOtTGYxptj
 ecAe/ZBoSYDbhCW+pjEXi7IxRnwZkWS3mKHsyYAWWer1hTcYe0a5HrMkP1HUhIxL6iFdZug6BL0
 anNNW6iZDhQ8HgrGiLaZzka0lPi3/dEskkvd1O5Rz4Pb9CucKubu/Vxfnaqjdwn3Ofj5s4dLh0N
 TaR4=
X-Received: by 2002:a05:6102:390b:b0:5f9:39ff:1a27 with SMTP id
 ada2fe7eead31-5fc48c8727emr997913137.10.1770753611423; Tue, 10 Feb 2026
 12:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20260210144308.689103-1-slaveze@smartandconnective.com>
In-Reply-To: <20260210144308.689103-1-slaveze@smartandconnective.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Feb 2026 13:00:00 -0700
X-Gm-Features: AZwV_QgS6f_5GrGtwG1ymO7nMeGpywgTyFFxdlLusvridXcn6M1l69HLa53gA6o
Message-ID: <CADvTj4pdvQWt3gbqs3HqytDyrgcDqZa-U4yLaND21n33=AUjEQ@mail.gmail.com>
To: Sebastien LAVEZE <slaveze@smartandconnective.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770753613; x=1771358413; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lSbxT8WZ8mN80rc94tVFEbg7wEi51s54GSgA34DxxwA=;
 b=QFT6iJ6nzho6nsxDTr70w8PLvD0rH6WS0vKPlbabb8kY9dg4571wl2lCQdbhmYD1T1
 0OAdy0bMCtZIDJiMuzHiKzF10ssqFgGHSdzQDIcxDNoCSaRFy2zJwU30NbSNF2JqP4KC
 iNcoVb+Ds5Ht77s1ZYWjmBq21S+KZxC9s1to0WkTOBJGTApVxbqx7YJNudRdVvcLpj7x
 i9ufdPl0J0VRa1MbHiCJsMgp0iqp1ggsA/PStPwjYkdjrmhFOYv7isTddTJqMqZlpfwD
 +DKCCPlKAJ49GpwB2FHu4tgFQlUCX8v3gCcBZwUAbyY+JuM/Fezns2MddViActfaxQBQ
 mguw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QFT6iJ6n
Subject: Re: [Buildroot] [RFC PATCH] package/pkg-cargo: add HOST_* variables
 for target build
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

T24gVHVlLCBGZWIgMTAsIDIwMjYgYXQgNzo0NOKAr0FNIFNlYmFzdGllbiBMQVZFWkUKPHNsYXZl
emVAc21hcnRhbmRjb25uZWN0aXZlLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBTZWJhc3RpZW4gTGF2
ZXplIDxzbGF2ZXplQHNtYXJ0YW5kY29ubmVjdGl2ZS5jb20+Cj4KPiBDYXJnbyBidWlsZHMgYm90
aCBob3N0IChidWlsZC5ycykgYW5kIHRhcmdldCBpbiB0aGUgc2FtZSBidWlsZCBzdGFnZS4KPgo+
IEhvc3Qtc2lkZSBidWlsZCBzY3JpcHRzIChidWlsZC5ycykgdXNpbmcgY2MtcnMgcmVzb2x2ZSB0
b29scy9mbGFncyB0aHJvdWdoCj4gSE9TVF8qIGJlZm9yZSBmYWxsaW5nIGJhY2sgdG8gdW5wcmVm
aXhlZCB2YXJpYWJsZXMuIFdpdGhvdXQgSE9TVF8qIHNldCwgdGhleQo+IGNhbiBpbmNvcnJlY3Rs
eSBwaWNrIHRhcmdldCBjb21waWxlci9mbGFncyBhbmQgZmFpbCBpbiBtaXhlZC1iaXRuZXNzIHNl
dHVwcwo+IChlLmcuIDY0LWJpdCBob3N0IHdpdGggMzItYml0IHRhcmdldCkuCj4KPiBodHRwczov
L2RvY3MucnMvY2MvMS4yLjU1L2NjLyNleHRlcm5hbC1jb25maWd1cmF0aW9uLXZpYS1lbnZpcm9u
bWVudC12YXJpYWJsZXMKCkhtbSwgaXQgbG9va3MgbGlrZSB0aGVzZSBkb2NzIGFyZSBmcm9tIGEg
c3BlY2lmaWMgY2FyZ28gY3JhdGUsIG5vdCBjYXJnbwppdHNlbGYsIGRvZXNuJ3QgY2FyZ28gbGV0
IHVzIHNldCBob3N0IHNwZWNpZmljIGNvbmZpZ3VyYXRpb25zIGxpa2UgdGhpcz86Cmh0dHBzOi8v
ZG9jLnJ1c3QtbGFuZy5vcmcvY2FyZ28vcmVmZXJlbmNlL3Vuc3RhYmxlLmh0bWwjaG9zdC1jb25m
aWcKCj4KPiBTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpZW4gTGF2ZXplIDxzbGF2ZXplQHNtYXJ0YW5k
Y29ubmVjdGl2ZS5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvcGtnLWNhcmdvLm1rIHwgMTQgKysrKysr
KysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1jYXJnby5tayBiL3BhY2thZ2UvcGtnLWNh
cmdvLm1rCj4gaW5kZXggNDdhNjM1M2YyNS4uYTNjNzQzNmExYiAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL3BrZy1jYXJnby5tawo+ICsrKyBiL3BhY2thZ2UvcGtnLWNhcmdvLm1rCj4gQEAgLTUxLDcg
KzUxLDE5IEBAIFBLR19DQVJHT19FTlYgPSBcCj4gICAgICAgICBDQVJHT19UQVJHRVRfQVBQTElF
U19UT19IT1NUPSJmYWxzZSIgXAo+ICAgICAgICAgQ0FSR09fQlVJTERfVEFSR0VUPSIkKFJVU1RD
X1RBUkdFVF9OQU1FKSIgXAo+ICAgICAgICAgQ0FSR09fSE9TVF9SVVNURkxBR1M9IiQoYWRkcHJl
Zml4IC1DIGxpbmstYXJncz0sJChIT1NUX0xERkxBR1MpKSIgXAoKQ2FuIHdlIG5vdCB1c2UgdGhl
IENBUkdPX0hPU1RfIHByZWZpeGVkIGVudiB2YXJpYWJsZXMgaW5zdGVhZD8KCj4gLSAgICAgICBD
QVJHT19UQVJHRVRfJChjYWxsIFVQUEVSQ0FTRSwkKFJVU1RDX1RBUkdFVF9OQU1FKSlfTElOS0VS
PSQobm90ZGlyICQoVEFSR0VUX0NST1NTKSlnY2MKPiArICAgICAgIENBUkdPX1RBUkdFVF8kKGNh
bGwgVVBQRVJDQVNFLCQoUlVTVENfVEFSR0VUX05BTUUpKV9MSU5LRVI9JChub3RkaXIgJChUQVJH
RVRfQ1JPU1MpKWdjYyBcCj4gKyAgICAgICBIT1NUX0FSPSIkKEhPU1RBUikiIFwKPiArICAgICAg
IEhPU1RfQVM9IiQoSE9TVEFTKSIgXAo+ICsgICAgICAgSE9TVF9DQz0iJChIT1NUQ0MpIiBcCj4g
KyAgICAgICBIT1NUX0NYWD0iJChIT1NUQ1hYKSIgXAo+ICsgICAgICAgSE9TVF9DUFA9IiQoSE9T
VENQUCkiIFwKPiArICAgICAgIEhPU1RfTEQ9IiQoSE9TVExEKSIgXAo+ICsgICAgICAgSE9TVF9O
TT0iJChIT1NUTk0pIiBcCj4gKyAgICAgICBIT1NUX1JBTkxJQj0iJChIT1NUUkFOTElCKSIgXAo+
ICsgICAgICAgSE9TVF9QS0dfQ09ORklHX1NZU1JPT1RfRElSPSIvIiBcCj4gKyAgICAgICBIT1NU
X1BLR19DT05GSUdfQUxMT1dfU1lTVEVNX0NGTEFHUz0xIFwKPiArICAgICAgIEhPU1RfUEtHX0NP
TkZJR19BTExPV19TWVNURU1fTElCUz0xIFwKPiArICAgICAgIEhPU1RfUEtHX0NPTkZJR19MSUJE
SVI9IiQoSE9TVF9ESVIpL2xpYi9wa2djb25maWc6JChIT1NUX0RJUikvc2hhcmUvcGtnY29uZmln
Igo+Cj4gICMgV2UgYWx3YXlzIHNldCBib3RoIENBUkdPX1BST0ZJTEVfREVWIGFuZCBDQVJHT19Q
Uk9GSUxFX1JFTEVBU0UKPiAgIyBhcyB3ZSBhcmUgdW5hYmxlIHRvIHNlbGVjdCBhIGJ1aWxkIHBy
b2ZpbGUgdXNpbmcgdGhlIGVudmlyb25tZW50Lgo+IC0tCj4gMi41MS4wCj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
