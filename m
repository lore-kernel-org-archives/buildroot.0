Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38A3C982CD
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 06:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 540FB80A91;
	Thu, 17 Sep 2026 06:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moVUcCVKUZic; Thu, 17 Sep 2026 06:56:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3EB0080C1A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789628171;
	b=rOZUgeOqoz+9KS9yE1Nbqexr19WCU4hmag2Z4Y6TGrSuyrbocaIeaxHkJcFDrFVnScWr
	 qI+KHQrfsfM0jIs/y874inW3iQTGnSX+k/nqQsKSxyaB8gm7KI3l5dPlKkMHu/sY7RK7a
	 aH68uUwVNry61hVGoRmoDJqbg8epVUQa5Wv9NUhBW0HMkQxC0pwYMf1J3ZBhzpj2zpLy3
	 a4RyrQBLFlLNknCzvFH2bv+pLfixxBeiMQPWadHOwJojPl4qLk5WdZVzpb/msAhjZyx6m
	 vXrA+duxg1vhKXza878o43WVE1YyPzpHHhORqm7U5SQLyb88P9Vhh8W6hnhQf4vas/Q==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789628171;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PVSg5n+nxRc53Q8MlCLHyVP0zmMZqYdSz/WalojPqLA=;
	b=RxXCYvL7fnNg/+ElbPfRWaZvLuDCPXvjcfBxfmV22Qr2sGYa8B3PiRnH3MZMlaHSJ9P7
	 bHPDOxjAsqN4UK/7bF4WrYqnlIe+/rzGUJhh/ReYRx4/4xj2as5Cr6T+n/3J0ZOi2DLgd
	 z8pijhA+jeubkFbGQdQVekTUgryUVT45/3n7LjZE3pEBMs/1/TnSAtL5uGD+eCiCNKXiS
	 Qo6Zwo2X9C8KlhkL566I12l+uHrnaZbHA9OomPEVTb6QSSBqZbdBpdyx5VSLjUeO1eMQT
	 +PpiSX/5NlMY7o6Fq4na1hGvoHMntSrGczyiEodXmolge+aotzL05IL+zEfkcSR9slA==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789628171;
	bh=PVSg5n+nxRc53Q8MlCLHyVP0zmMZqYdSz/WalojPqLA=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Upt3wxrJFkUFGll2fuA7QNMQssqeVFBIqzuEKf8ECTxHN9D9+Tcth2LJMnaaxVqXw
	 g/eMK8KWTRlX+z82y3PfK6/dOBUs+3cLjPYe1O+fFt05MJAGvrQ9OEr+KL3InfBKVM
	 HHxhMKgG71uQla9pmu+fEoiJ2L5fOLwi4v+j6S9kdYZPEsk/xtfRu6FUEDsaR2Jnxy
	 qw9PH0lave5mXEmFA79sBDYnn0RM5YxHFPEMmV+UbQydilL4MSp6FqNdUGvnHQSMsh
	 yz//Urcq6d+OPFBLvuwQCdpb0bw2r5SUzDcsebhQCo57xl7mU2oKK+puhZcRBx9KJe
	 oHN2wl849a3OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EB0080C1A;
	Thu, 17 Sep 2026 06:56:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8785A422
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 777BA80A91
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxYlloK5hbL5 for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 06:56:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0DDC480C1A
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789628168;
 b=CQzsAuVPp5Q2QwqqjqGea2gU+Ws96VxDLgsWy9bhLi5weJkVwvVfLDo+XM9lB4oW7oLo
 E/a/wGWOlc2KKffCeP6IAEbamEzYYEyQEypwetz7xEDbKgBW8lVFRFIu0x7RwJSYaLhCK
 aFfB/N0S5fgTBJSfjlcbrfUIRXCxB0ecXpc1hQKO1OXDd/hwMiB5z3ulOcoQQMKNPdotI
 Jp06A6QgaCPDODLg8zR2u/uvSOmVySN/HXM8flzIFJRM10sofQnkDDfENECulQnuhQH4X
 Ml8XTxuaCwCk7SPlrmmdoFJ88cLAK4G5g1Z5krREqlYFcpCHIQJvCD+oOjq4gAALBsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789628168;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=7HR0XBonwz1RUfzS4Dw4hN3TUwQtPWUjxtNiW6YFOIA=;
 b=fc/9gVqUu/rTy5gGCAWpSl9LGurKQ5qUADuqqJpssF1ffCYlUeLKNJaQUk5SZPcKlE9j
 ztvfvlikvAjNG5xwWNvzBSpUVI++JVCcueKX/fba66JGIXA/J0jIJPfjSTZ77Hx4/1Fiz
 AVlc6VqATCAZYlsJCuCXnAB4bofFpk7gQqucAlCa1ZRpNAcbmYhnkg6H03twmifO9W5SR
 my300u4xioBXT8Q4eglLwtu3ictOylv+WOum2gYb2TS87DzuBI0wPiEzOY3BDx8bsoJnP
 3htbT/P2fwr4dXrLJ6igPDmb2WRm2bAFEU5nplLQH/waAtP94qK1ct98LJ7yfrX97gg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=FM10QyJr; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:33::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::10; helo=mail-ed2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com
 [IPv6:2a00:1450:4864:33::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DDC480C1A
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:56:07 +0000 (UTC)
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a6056be4d2so415873a12.1
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 23:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789628165; cv=none;
 d=google.com; s=arc-20260327;
 b=mGW/5cVz2XKNe39glm8+FIpfN3/qb8cSA/M1H1JYCsZmioLyJ4TGrVSS54AIhmN/fW
 tjfNE2ClU/C6H1tHP+YnhwqwXktiUe0Y01+o0o6Uk/if9n5GU+Tu5hDQH6EVI0g9u61b
 3qwcDUO2IxNh+4ZdYO1z95XsW87QnqdYrQe370gkunjB+FkPHQ5h6FqRo0l4EaPYnXYt
 u+a4ynCZOQjDvGEFVU6P/lvD1hBQjHueyOIBSnp5ovemxDXHE0LMXZv8u/cRpr/A+fTj
 JYlixUiDESMcj08OJkb3Ad52JnTRxH3XAA+x1Lr+DwwKTsnlRAaw+Cse/X4/kEiMl4Pu
 bQ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7HR0XBonwz1RUfzS4Dw4hN3TUwQtPWUjxtNiW6YFOIA=;
 fh=WHoaB16FV4RmW+G+i8sNm+rWryxC+LEz2qV5lmSL1bA=;
 b=kGpAthrBnSOp7vykLFgLZseDlpWl+2v0TBsYsjF6KqXE5GLgpNjDhaXSkyo3uODXeX
 Ix5K6CiWErkm6eijFKRFEbR/nxUf8r9XCXPFsJfhCU5cOEagSJ28KQrN3aGzmnwSxU2f
 NFf5AX6R4M9W+t8VTDPjSgWLXH7fdbmMvNnzlwX3OHlAhIqPGiKilxe3t6/OpALJfoXs
 TX7AcfB7FT4FED+ED4NC+4w4ZASdd37BhuIS6/h1ym0SpDFCIxhDLDt6ioI7dQmUp3uK
 AGnmbMqs+24Lj68G3fliyQMBVO6z9UJXjjp8rSW9FgK/6rrZCe1Gy317B0qsL257IOWG
 zkEA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789628165; x=1790232965;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7HR0XBonwz1RUfzS4Dw4hN3TUwQtPWUjxtNiW6YFOIA=;
 b=sbUZhHggwjF//vfsbNkFF2wy6fneMI+AkxsECvk1Ex97QuRImgnos5pOhZ0QuOAhBM
 GTPmMtyp6DEAsoZ+HqgRj17xTo3ouGvzMIU0g2TwkkB/PQW2mdUOBfRJrhykkYLONAx9
 EgMrCsfb00UxOhUSDWjMkccavX6HJfrrAAcXzxRW4iHDVKNmuotupF4ccuoY9NVbKeeq
 eH+qdUeSjD/y1SHK0OSU7+j717IJKpOVe38BejinHyDvOvxr+MTa5WNj+0ZXMCD0Ukkj
 5ids8pQqg3MRsPRNlWnOoO10Qb//cfaabynfZgBipqlhdKs5TLBP0oZ5OcLYyQWfJYG8
 oZhA==
X-Gm-Message-State: AFuF++mfdNFA+ZHym4bpqkdyUeQ3SumdDDk1uRgg0Ksw6VQC2VYaXF6F
 lyQ1N79yIyfngLap6ZS+dxsEagbnWByfO1zZYarHCigTrQBhXF+OKn8hGfsmdS1V1zMTgZFhMoA
 cvMpGP3jUpmurIdpS91tbXJ+GMy+J0yY=
X-Gm-Gg: AYBFou3KLS+iKdMg3vO5Z/zD78VP1/uOT639XMunjdQ25aHPFeB2qovva8I/WDA8ZHI
 d5em9RrY+vban5y1QHO88gFVo3w78+TMZkXl1nGIJeRNOfLJbehXQGbjxaES+CkB7pDhxtQSSl3
 i6FNynDApdQAlAEHT9iq0QDuhDAdfmWjbr8doRiMsWfW/grv2oP/XuBTIJLpm6NFmqO7Xl/WIsd
 DoOAqFO78mzxUYOYTS8nLmgZwaeWQhuvKjBlMwZJ98sEXcRt7oFzl0ajEBRSchnpLber8/oU0h1
 /Afib2VH1Ngbk4bCicSDIk/obo7e3YvCj0oHvBZbl+WIcGeidwtTcJ8aAvzwIeb9gOUU
X-Received: by 2002:a05:6402:ea2:b0:6a6:b2b9:61f8 with SMTP id
 4fb4d7f45d1cf-6aa36da13c2mr1443685a12.12.1789628165107; Wed, 16 Sep 2026
 23:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260914092612.1283030-1-yegorslists@gmail.com>
 <aqrl-vOwcHy1wpBs@windsurf>
In-Reply-To: <aqrl-vOwcHy1wpBs@windsurf>
Date: Thu, 17 Sep 2026 08:56:46 +0200
X-Gm-Features: AcwNN1VkpNnZZnYd_OBukepxqOkcQ_ZBLZ1SK4zYgDmy109pjyzS5_YVI-mdH0Q
Message-ID: <CAGm1_kux2mRrdnvkcX=y2vB=Hb3-UxkjCu-F67L2_2-N3cs-tg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/qemu: host-qemu does not support
 AVX512 CPUs
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

SGkgVGhvbWFzLAoKT24gV2VkLCBTZXAgMTYsIDIwMjYgYXQgODo1N+KAr1BNIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4K
PiBUaGFua3MgZm9yIHRoZSBwYXRjaCEKPgo+IE9uIE1vbiwgU2VwIDE0LCAyMDI2IGF0IDExOjI2
OjEyQU0gKzAyMDAsIFllZ29yIFllZnJlbW92IHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gPiBGcm9t
OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gPgo+ID4gQnVp
bGRpbmcgZ29iamVjdC1pbnRyb3NwZWN0aW9uIGZvciBhbiB4ODYgQ1BVIHZhcmlhbnQgd2l0aCBB
Vlg1MTIgZmFpbHMKPiA+IHdoZW4gZy1pci1zY2FubmVyIHJ1bnMgdGhlIGZyZXNobHkgYnVpbHQg
dGFyZ2V0IGJpbmFyaWVzIHVuZGVyCj4gPiBxZW11LXVzZXI6Cj4gPgo+ID4gICBxZW11OiB1bmNh
dWdodCB0YXJnZXQgc2lnbmFsIDQgKElsbGVnYWwgaW5zdHJ1Y3Rpb24pIC0gY29yZSBkdW1wZWQK
PiA+Cj4gPiBUaGUgUWVtdSBUQ0cgZW5naW5lIGltcGxlbWVudHMgQVZYLCBBVlgyLCBGMTZDLCBG
TUEzIGFuZCBWQUVTIHNpbmNlIFFlbXUKPiA+IDcuMiwgYnV0IGl0IGRvZXMgbm90IGltcGxlbWVu
dCB0aGUgQVZYNTEyIGluc3RydWN0aW9uIHNldCBhdCBhbGwgWzBdLgo+ID4gVGhlcmVmb3JlIG5v
IC1jcHUgdmFsdWUgcGFzc2VkIHRocm91Z2gKPiA+IEJSMl9QQUNLQUdFX0hPU1RfUUVNVV9VU0VS
X01PREVfQVJHUyBjYW4gbWFrZSBzdWNoIGJpbmFyaWVzIHJ1biwgYW5kCj4gPiB1c2VyLW1vZGUg
ZW11bGF0aW9uIGlzIHNpbXBseSBub3QgcG9zc2libGUgZm9yIHRoZXNlIENQVSB2YXJpYW50cy4K
PiA+Cj4gPiBNYXJrIHRob3NlIENQVXMgYXMgdW5zdXBwb3J0ZWQgYnkgaG9zdC1xZW11LCB0aGUg
c2FtZSB3YXkgaXQgaXMgYWxyZWFkeQo+ID4gZG9uZSBmb3IgeDg2X3N0ZWFtcm9sbGVyIGFuZCB4
ODZfY29yZV9hdngyLiBUaGlzIHJlbGllcyBvbiB0aGUgZXhpc3RpbmcKPgo+IERvZXMgb3VyIEJS
Ml94ODZfY29yZV9hdngyIGV4Y2x1c2lvbiBzdGlsbCBtYWtlcyBzZW5zZT8KPgo+IDEuIFlvdSdy
ZSBtZW50aW9uaW5nIHRoYXQgdGhlIFRDRyBlbmdpbmUgaW1wbGVtZW50cyBBVlgyLCBzbyB3aHkg
aXMKPiBzdXBwb3J0aW5nIHg4Nl9jb3JlX2F2eDIgYSBwcm9ibGVtPwo+Cj4gMi4gQWNjb3JkaW5n
IHRvIGFyY2gvQ29uZmlnLmluLng4NiwgQlIyX3g4Nl9jb3JlX2F2eDIgaXMgZGVwcmVjYXRlZAo+
IGFuZCBCUjJfeDg2X2hhc3dlbGwgc2hvdWxkIGJlIHVzZWQgaW5zdGVhZCwgd2hpY2ggSSBzdXBw
b3NlIG1lYW5zIHRoZXkKPiBhcmUgZXF1aXZhbGVudC4gQnV0IHdlIGRvIGV4Y2x1ZGUgQlIyX3g4
Nl9jb3JlX2F2eDIgYnV0IG5vdAo+IEJSMl94ODZfaGFzd2VsbCBpbiBCUjJfUEFDS0FHRV9IT1NU
X1FFTVVfQVJDSF9TVVBQT1JUUywgd2hpY2ggZG9lc24ndAo+IG1ha2UgbXVjaCBzZW5zZS4KPgo+
IFdoYXQgZG8geW91IHRoaW5rPwoKIE5vLCBJIGRvbid0IHRoaW5rIGl0IGRvZXMgYW55bW9yZSwg
YW5kIEkgYmVsaWV2ZSBpdCBjYW4gc2ltcGx5IGJlIGRyb3BwZWQuCgogIDEuIFRoZSBleGNsdXNp
b24gY29tZXMgZnJvbSBjb21taXQgMWY3ZWZhZjg5ZjAzICgicGFja2FnZS9xZW11OiBkbyBub3QK
ICBzdXBwb3J0IHg4Nl9zdGVhbXJvbGxlciBvciB4ODZfY29yZV9hdngyIiwgRmViIDIwMjApLCBp
LmUuIGZyb20gdGhlIFFlbXUKICA0LjIgZXJhLCB3aGVuIFRDRyBoYWQgbm8gQVZYIHN1cHBvcnQg
YXQgYWxsLiBTaW5jZSBRZW11IDcuMiwgVENHCiAgaW1wbGVtZW50cyBBVlgsIEFWWDIsIEYxNkMs
IEZNQTMgYW5kIFZBRVMuIEluIFFlbXUgMTEuMC4wLAogIHRhcmdldC9pMzg2L2NwdS5jOgoKICAg
ICNkZWZpbmUgVENHX0VYVF9GRUFUVVJFUyAoLi4uIHwgQ1BVSURfRVhUX0FWWCB8IENQVUlEX0VY
VF9GMTZDIHwgXAogICAgICAgICAgICAgIENQVUlEX0VYVF9GTUEgfCAuLi4pCiAgICAjZGVmaW5l
IFRDR183XzBfRUJYX0ZFQVRVUkVTICguLi4gfCBDUFVJRF83XzBfRUJYX0JNSTEgfCBcCiAgICAg
ICAgICAgICAgQ1BVSURfN18wX0VCWF9CTUkyIHwgQ1BVSURfN18wX0VCWF9BVlgyIHwgLi4uKQoK
ICB3aGljaCBjb3ZlcnMgZXZlcnl0aGluZyAtbWFyY2g9Y29yZS1hdngyIGNhbiBnZW5lcmF0ZS4K
CiAgMi4gWW91IGFyZSByaWdodCB0aGF0IGNvcmUtYXZ4MiBhbmQgaGFzd2VsbCBhcmUgZXF1aXZh
bGVudDogZ2NjJ3MKICBjb3JlLWF2eDIgaXMgYSBkZXByZWNhdGVkIGFsaWFzIGZvciBoYXN3ZWxs
LCBhbmQgImdjYyAtbWFyY2g9Y29yZS1hdngyCiAgLVEgLS1oZWxwPXRhcmdldCIgeWllbGRzIGV4
YWN0bHkgdGhlIHNhbWUgZmVhdHVyZSBiaXRzIGFzCiAgLW1hcmNoPWhhc3dlbGwuIEluIGFyY2gv
Q29uZmlnLmluLng4NiBib3RoIGFsc28gc2VsZWN0IHRoZSB2ZXJ5IHNhbWUKICBCUjJfWDg2X0NQ
VV9IQVNfKiBzeW1ib2xzLiBTbyBleGNsdWRpbmcgb25lIGFuZCBub3QgdGhlIG90aGVyIG5ldmVy
CiAgbWFkZSBtdWNoIHNlbnNlLiBUaGUgc2FtZSBhcHBsaWVzIHRvIGJyb2Fkd2VsbCwgc2t5bGFr
ZSwgemVuKiwKICB4ODYtNjQtdjMsIC4uLiwgd2hpY2ggYWxsIGVuYWJsZSBBVlgyIGFuZCB3ZXJl
IG5ldmVyIGV4Y2x1ZGVkIC0gYW5kCiAgdGhleSBkbyBidWlsZCBmaW5lIG9uIHRoZSBhdXRvYnVp
bGRlcnMsIHdoaWNoIGlzIGFub3RoZXIgaGludCB0aGF0CiAgQVZYMiBpcyBub3QgdGhlIHByb2Js
ZW0uCgogIDMuIFRoZSBzdGVhbXJvbGxlciBleGNsdXNpb24sIGhvd2V2ZXIsIGlzIHN0aWxsIG5l
ZWRlZCAtIGJ1dCBpdCBpcwogIGluY29tcGxldGUuIHN0ZWFtcm9sbGVyIGlzIGJkdmVyMywgYW5k
IHdoYXQgVENHIGNhbm5vdCBlbXVsYXRlIHRoZXJlIGlzCiAgbm90IEFWWCwgYnV0IFhPUC9GTUE0
L1RCTS9MV1AuIFFlbXUgMTEuMC4wIGhhczoKCiAgICAjZGVmaW5lIFRDR19FWFQzX0ZFQVRVUkVT
IChDUFVJRF9FWFQzX0xBSEZfTE0gfCBDUFVJRF9FWFQzX1NWTSB8IFwKICAgICAgICAgICAgICBD
UFVJRF9FWFQzX0NSOExFRyB8IENQVUlEX0VYVDNfQUJNIHwgQ1BVSURfRVhUM19TU0U0QSAgfCBc
CiAgICAgICAgICAgICAgQ1BVSURfRVhUM18zRE5PV1BSRUZFVENIIHwgQ1BVSURfRVhUM19LRVJO
RUxfRkVBVFVSRVMgfCBcCiAgICAgICAgICAgICAgQ1BVSURfRVhUM19DTVBfTEVHKQoKICBDUFVJ
RF9FWFQzX1hPUCwgQ1BVSURfRVhUM19GTUE0LCBDUFVJRF9FWFQzX1RCTSBhbmQgQ1BVSURfRVhU
M19MV1AgYXJlCiAgZGVmaW5lZCBpbiB0YXJnZXQvaTM4Ni9jcHUuaCwgYnV0IGFyZSBkZWxpYmVy
YXRlbHkgbm90IHBhcnQgb2YgdGhhdAogIG1hc2suCgogIEFuZCB0aGUgd2hvbGUgQnVsbGRvemVy
IGZhbWlseSBpcyBhZmZlY3RlZCwgbm90IG9ubHkgc3RlYW1yb2xsZXIKICAoY2hlY2tlZCB3aXRo
IGdjYyAtbWFyY2g9PHZhcmlhbnQ+IC1RIC0taGVscD10YXJnZXQpOgoKICAgIGJkdmVyMSAoYnVs
bGRvemVyKTogICBYT1AsIEZNQTQsIExXUAogICAgYmR2ZXIyIChwaWxlZHJpdmVyKTogIFhPUCwg
Rk1BNCwgVEJNLCBMV1AKICAgIGJkdmVyMyAoc3RlYW1yb2xsZXIpOiBYT1AsIEZNQTQsIFRCTSwg
TFdQCiAgICBiZHZlcjQgKGV4Y2F2YXRvcik6ICAgWE9QLCBGTUE0LCBUQk0sIExXUCAoYW5kIEFW
WDIpCgogIFNvIEJSMl94ODZfYnVsbGRvemVyLCBCUjJfeDg2X3BpbGVkcml2ZXIgYW5kIEJSMl94
ODZfZXhjYXZhdG9yIG91Z2h0IHRvCiAgYmUgZXhjbHVkZWQgYXMgd2VsbC4KCiAgSWYgeW91IGFn
cmVlLCBJJ2xsIHNlbmQgYSBmb2xsb3ctdXAgcGF0Y2ggdGhhdDoKCiAgIC0gZHJvcHMgdGhlICFC
UjJfeDg2X2NvcmVfYXZ4MiBkZXBlbmRlbmN5LAogICAtIGFkZHMgYSBoaWRkZW4gQlIyX1g4Nl9D
UFVfSEFTX1hPUCBzeW1ib2wgaW4gYXJjaC9Db25maWcuaW4ueDg2LAogICAgIHNlbGVjdGVkIGJ5
IHRoZSBmb3VyIGJkdmVyIHZhcmlhbnRzLCBhbmQgcmVwbGFjZXMKICAgICAhQlIyX3g4Nl9zdGVh
bXJvbGxlciB3aXRoICFCUjJfWDg2X0NQVV9IQVNfWE9QIGluCiAgICAgQlIyX1BBQ0tBR0VfSE9T
VF9RRU1VX0FSQ0hfU1VQUE9SVFMgLSBpLmUuIHRoZSBzYW1lIHBhdHRlcm4gYXMgdGhlCiAgICAg
ZXhpc3RpbmcgQlIyX1g4Nl9DUFVfSEFTX0FWWDUxMiBkZXBlbmRlbmN5LgoKICBJZiB5b3UnZCBy
YXRoZXIgbm90IGFkZCBhIG5ldyBCUjJfWDg2X0NQVV9IQVNfKiBzeW1ib2wgZm9yIGEgc2luZ2xl
CiAgdXNlciwgSSBjYW4ganVzdCBsaXN0IHRoZSBmb3VyIHZhcmlhbnRzIGV4cGxpY2l0bHkgaW5z
dGVhZC4KClllZ29yCgo+ID4gQlIyX1g4Nl9DUFVfSEFTX0FWWDUxMiBzeW1ib2wsIHNvIGFsbCBB
Vlg1MTIgY2FwYWJsZSB2YXJpYW50cyBhcmUKPiA+IGNvdmVyZWQsIGFuZCBpdCBkaXNhYmxlcyBn
b2JqZWN0LWludHJvc3BlY3Rpb24gYW5kIG5vZGVqcywgd2hpY2ggYXJlIHRoZQo+ID4gdHdvIHBh
Y2thZ2VzIG5lZWRpbmcgaG9zdC1xZW11IGluIHVzZXIgbW9kZS4KPiA+Cj4gPiBbMF0gaHR0cHM6
Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vaXNzdWVzLzI4NzgKPiA+Cj4gPiBGaXhl
czoKPiA+Cj4gPiAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy83ZWQ3
ZjljMzZkYWUxZGRiOTY1YTBmMDAyMWRiNmNkMzE5OTI3YjQ3Lwo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiA+IEFzc2lz
dGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNQo+Cj4gTmV2ZXJ0aGVsZXNzLCB5b3VyIHBhdGNo
IGlzIGdvb2QgYnkgaXRzZWxmLCBzbyBJJ3ZlIGFwcGxpZWQgaXQgdG8KPiBtYXN0ZXIuIFRoYW5r
cyEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywg
Qm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWlu
aW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
