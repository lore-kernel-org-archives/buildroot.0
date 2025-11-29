Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EA9D116EA
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 21:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1737260790;
	Sat, 29 Nov 2025 21:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDpsipgiy7nQ; Sat, 29 Nov 2025 21:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2894260794
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2894260794;
	Sat, 29 Nov 2025 21:46:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C0B01A9
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 21:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D5F282656
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 21:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2gU7zLHFQ2F for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 21:46:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e29; helo=mail-vs1-xe29.google.com;
 envelope-from=softwarej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A937D82603
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A937D82603
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A937D82603
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 21:46:26 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-5dfa9e34adbso2320929137.0
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 13:46:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764452785; x=1765057585;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tCKCIB2IDjm54NDa6aKDjZYLR/ui0CmcmqDFJl98cvw=;
 b=OvvLOFIbazYitV1Z5nvfIS//x91Ul+RRm+31VQBoT0U4RYvHKkR41+5NX62brjXaI3
 DXJseaPZ8u0aMfM1i+QL7B4btIayjWeq+riWOzD+L7+5CdquT7bq9+InilQYcBxFIlbL
 D2/KSpcbNXTb1UF0Yya5KuTtH3FQCAm4rTGlspzX75m7kFXwy9sgEXFJFsGAMvIpOhke
 UnGgYEQDRi5FEHYhElop6QeoTOMlplZAQxtqlU/eGzV5zjmogRV5zR2xe6mVWsTdzzDB
 EHTdBBpFakP3N89m0JktHDJjevfet8h0LZI0BM3OBzVEQKzyhROpCuldpnroe1JJLKiP
 XDvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN2QxdTT1Yk9L4UU2bgycrqFQOtEBPQBIDvyLVCPDtaZBAWwmOnjY4VDfXoI68sdq26Fw4WBMkYjs=@buildroot.org
X-Gm-Message-State: AOJu0YxjCMfoPjXEFJjpKKsjy51KAazZH6qEPnUEpwZZHIfvWAWkJucq
 EzLIcCv2LHza00lC8KbN7Myso01b81UjspS2EUmV+kG9iU20J5deMYId6uOSu9EQbchD1wlx6CE
 J6xadWqYkWpaW1148dXK7wzslbS+KvwhJoFYz
X-Gm-Gg: ASbGncugtjOCm4LZE80aJj5PreP7ctOf/D8HGt57aSs0oWnqoO/R5ScYpC29yUY6RZ0
 YMvQehipEtmS4L6Xhjt788b5nhFnKMX/Ithnb1/rwIjY3JWDp8+LgoU90t3+AOG6FU9jw3ZAei0
 3JgruAXuPB57nLqwGkQWvHSF14QbGs+d6gJpkJYvYxo93FVD2XfEWs9Izk0vICtdkGlLc9McxkV
 BZ0sjGRQx3lmCCB7/ejr3pi+XzhRXDNQN9mlrS/HmShZ0TpqqI5avwsCDkr7Hq80ZJqQyY=
X-Google-Smtp-Source: AGHT+IH1r6tWEL90enzx0dzE2k/0pPfghQRJR+qXpTC6tPfCVGbEUHFJqcWUV3Q4K7Ww+UalvqjV7Dn8i+KK2wodA50=
X-Received: by 2002:a05:6102:1499:b0:5db:ca9e:b57c with SMTP id
 ada2fe7eead31-5e2243d5189mr8983556137.27.1764452785240; Sat, 29 Nov 2025
 13:46:25 -0800 (PST)
MIME-Version: 1.0
References: <CAH+XeQYPBnXkXq4Fu0aBJ2UBR_U31ypza4z-1jf2Y78aWWiv-g@mail.gmail.com>
 <aSszM90msDWGlEaa@landeda>
 <9e510762-e34d-41d1-9ec8-11d24a60ed84@grenoble.cnrs.fr>
 <CAH+XeQY8z5i6jdpKZ40sqy_v5ehshtHHQCOLhN92SLwG5u4SgA@mail.gmail.com>
In-Reply-To: <CAH+XeQY8z5i6jdpKZ40sqy_v5ehshtHHQCOLhN92SLwG5u4SgA@mail.gmail.com>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Sat, 29 Nov 2025 22:46:14 +0100
X-Gm-Features: AWmQ_bnMctbNMen5QK4J0uz82gC6eHmgtaCbukv-t28N4wjsTcJca9c72yLqL8U
Message-ID: <CAH+XeQbz7B6QcQUnbH5x+M2bE=1snLkZXW4syQdZm-3H_AfaMQ@mail.gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764452785; x=1765057585; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tCKCIB2IDjm54NDa6aKDjZYLR/ui0CmcmqDFJl98cvw=;
 b=cJSPQINi8VAvu2xwZSq424w+ayn3ycp7lgKDzC0SwZSQYOKkTt9DvfoH9Z4QhooxEH
 WCVnRNmNNat5uCdRqiAaJlFUNbdm+9gJeLzm2Nwrrzo/Oudtn386MmlF7GmoshEZDHIU
 U/ABqzxQMjCyRQSgEWdxtCNLmNr+FtdC1aTlZ3VeU7t7ybVsXOwDlN97OHC/JApP8JwU
 8GvjXkAc3FAmuUeyTTKZrvi/E7swV9IJkrSWzo4swVkUKnbRu/e6G4LIaxJbvuIbEy0e
 CKWYbm3U78gF4rL4I/wiLJRW1PrqPJu/QqoiM9KV9y0vYtM+0gBhBPl3tw5Czs/MgUhH
 vPaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cJSPQINi
Subject: Re: [Buildroot] Compilation Issue with Commit
 793ebd5d28095c8df45a0d183d273d8a84b3f0a4
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

SGVsbG8gWWFubiwgYWxsLgoKRm9yIGRpc2Nsb3N1cmUsIGhlcmUgaXMgbXkgYnVpbGQgaW5mb3Jt
YXRpb24gdGhhdCB0cmlnZ2VyZWQgdGhlIGVycm9yOgoKYnVpbGQgbG9nOgpgYGAKWy4uLl0Kc3Vw
cG9ydC9zY3JpcHRzL2NoZWNrLW1lcmdlZCAtdCBza2VsZXRvbiAtdSAtYgovdXNyL3NyYy9zaW1w
bGVrOHMvcm9vdGZzLXNrZWxldG9uClRoZSBza2VsZXRvbiBpbiAtdCBpcyBub3QgcHJvcGVybHkg
c2V0dXA6CiAtIC91c3IvYmluIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBub3Qg
YmUgYSBzeW1saW5rCiAtIC91c3IvbGliIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFu
ZCBub3QgYmUgYSBzeW1saW5rClRoZSBza2VsZXRvbiBpbiBza2VsZXRvbiBpcyBub3QgcHJvcGVy
bHkgc2V0dXA6CiAtIC91c3IvYmluIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBu
b3QgYmUgYSBzeW1saW5rCiAtIC91c3IvbGliIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3Rvcnks
IGFuZCBub3QgYmUgYSBzeW1saW5rClRoZSBza2VsZXRvbiBpbiAtdSBpcyBub3QgcHJvcGVybHkg
c2V0dXA6CiAtIC91c3IvYmluIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBub3Qg
YmUgYSBzeW1saW5rCiAtIC91c3IvbGliIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFu
ZCBub3QgYmUgYSBzeW1saW5rClRoZSBza2VsZXRvbiBpbiAtYiBpcyBub3QgcHJvcGVybHkgc2V0
dXA6CiAtIC91c3IvYmluIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBub3QgYmUg
YSBzeW1saW5rCiAtIC91c3IvbGliIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBu
b3QgYmUgYSBzeW1saW5rClsuLi5dCmBgYAoKRXZlcnl0aGluZyBpcyBydW5uaW5nIGluc2lkZSBh
IGNvbnRhaW5lcjoKLSAvdXNyL3NyYy9zaW1wbGVrOHMvIGlzIG15IG91dC1vZi10cmVlIHJlcG9z
aXRvcnkuCi0gL3Vzci9zcmMvc2ltcGxlazhzL2J1aWxkcm9vdCBpcyB0aGUgYnVpbGRyb290IGdp
dCByZXBvc2l0b3J5LgoKU29tZSBjb25maWdzOgpgYGAKWy4uLl0KQlIyX1JPT1RGU19TS0VMRVRP
Tl9DVVNUT009eQpCUjJfUk9PVEZTX1NLRUxFVE9OX0NVU1RPTV9QQVRIPSIkKENPTkZJR19ESVIp
L3Jvb3Rmcy1za2VsZXRvbiIKQlIyX1JPT1RGU19PVkVSTEFZPSIkKENPTkZJR19ESVIpL3Jvb3Rm
cy1vdmVybGF5IgpbLi4uXQpgYGAKCk1ha2VmaWxlIChtb3N0bHksIHRoZSBgJChDVVJESVIpL2J1
aWxkcm9vdGApOgpgYGAKaWZlcSAoIiQob3JpZ2luIFYpIiwgImNvbW1hbmQgbGluZSIpClZFUkJP
U0UgOj0gJChWKQplbmRpZgppZm5lcSAoJChWRVJCT1NFKSwxKQpRIDo9IEAKZW5kaWYKCmxhc3R3
b3JkID0gJCh3b3JkICQod29yZHMgJCgxKSksJCgxKSkKbWFrZWRpciA6PSAkKGRpciAkKGNhbGwg
bGFzdHdvcmQsJChNQUtFRklMRV9MSVNUKSkpCgpNQUtFQVJHUyA6PSAtQyAkKENVUkRJUikvYnVp
bGRyb290Ck1BS0VBUkdTICs9IE89JChpZiAkKHBhdHN1YnN0IC8lLCwkKG1ha2VkaXIpKSwkKENV
UkRJUikvKSQocGF0c3Vic3QKJS8sJSwkKG1ha2VkaXIpKQoKTUFLRUZMQUdTICs9IC0tbm8tcHJp
bnQtZGlyZWN0b3J5CgouUEhPTlk6IF9hbGwgJChNQUtFQ01ER09BTFMpCgphbGwgICAgIDo9ICQo
ZmlsdGVyLW91dCBNYWtlZmlsZSwkKE1BS0VDTURHT0FMUykpCgpfYWxsOgogICAgICAgJChRKXVt
YXNrIDAwMjIgJiYgJChNQUtFKSAkKE1BS0VBUkdTKSAkKGFsbCkKCk1ha2VmaWxlOjsKCiQoYWxs
KTogX2FsbAogICAgICAgQDoKCiUvOiBfYWxsCiAgICAgICBAOgpgYGAKCnJvb3RmcyBza2VsZXRv
bjoKYGBgCiQgdHJlZSAtYSByb290ZnMtc2tlbGV0b24Kcm9vdGZzLXNrZWxldG9uCuKUnOKUgOKU
gCBldGMK4pSCICAg4pSc4pSA4pSAIGdyb3VwCuKUgiAgIOKUnOKUgOKUgCBwYXNzd2QK4pSCICAg
4pSc4pSA4pSAIHJlc29sdi5jb25mCuKUgiAgIOKUlOKUgOKUgCBzaGFkb3cK4pSc4pSA4pSAIHJv
b3QK4pSCICAg4pSU4pSA4pSAIC5naXRrZWVwCuKUnOKUgOKUgCBydW4K4pSCICAg4pSU4pSA4pSA
IC5naXRrZWVwCuKUnOKUgOKUgCB1c3IK4pSCICAg4pSc4pSA4pSAIGJpbgrilIIgICDilIIgICDi
lJTilIDilIAgLmdpdGtlZXAK4pSCICAg4pSU4pSA4pSAIGxpYgrilIIgICAgICAg4pSU4pSA4pSA
IC5naXRrZWVwCuKUlOKUgOKUgCB2YXIKICAgIOKUnOKUgOKUgCBydW4gLT4gLi4vcnVuCiAgICDi
lJTilIDilIAgdXNyCiAgICAgICAg4pSU4pSA4pSAIGxvY2FsCiAgICAgICAgICAgIOKUlOKUgOKU
gCAuZ2l0a2VlcAoKCjExIGRpcmVjdG9yaWVzLCA0IGZpbGVzCmBgYAoKR3JlZXRpbmdzLgoKRWwg
c8OhYiwgMjkgbm92IDIwMjUgYSBsYXMgMjE6MzgsIEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbwoo
PHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4pIGVzY3JpYmnDszoKPgo+IFRoYW5rIHlvdSwg
RWRnYXIgQm9uZXQsIGZvciB5b3VyIGV4cGxhbmF0aW9uLiBJdCBtYWtlcyBhIGxvdCBvZiBzZW5z
ZSBub3cuCj4KPiBJdCB3YXMgbm90IG15IGludGVudGlvbiB0byBzdWJtaXQgbXkgcHJldmlvdXMg
bWVzc2FnZS9kaWZmIGFzIGEgcGF0Y2g7Cj4gaXQgd2FzIG1vc3RseSBtZWFudCBhcyBhICJKdXN0
IEZvciBZb3VyIEluZm9ybWF0aW9uIiBvciBhICJSZXF1ZXN0IGZvcgo+IENvbW1lbnRzLiIgTXkg
YmFkIGZvciBub3Qgc3BlY2lmeWluZyB0aGF0IGNvcnJlY3RseSBpbiB0aGUgc3ViamVjdC4KPiBM
ZXQgbWUgc2VuZCBhIHByb3BlciBwYXRjaCBpbiBteSBuZXh0IG1lc3NhZ2UuIDstKQo+Cj4gR3Jl
ZXRpbmdzIQo+Cj4gRWwgc8OhYiwgMjkgbm92IDIwMjUgYSBsYXMgMjA6MzUsIEVkZ2FyIEJvbmV0
Cj4gKDxib25ldEBncmVub2JsZS5jbnJzLmZyPikgZXNjcmliacOzOgo+ID4KPiA+IEhlbGxvIQo+
ID4KPiA+IE9uIDIwMjUtMTEtMjksIEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyB3cm90ZToKPiA+
ID4gVGhlIGNvbW1pdCA3OTNlYmQ1ZDI4MDk1YzhkZjQ1YTBkMTgzZDI3M2Q4YTg0YjNmMGE0IGJy
b2tlIG15IGNvbXBpbGF0aW9uLgo+ID4gPiBBbiBBSSBzdWdnZXN0ZWQgdGhhdCB0aGUgcHJvYmxl
bSBpcyBiZWNhdXNlIHRoZSBzY3JpcHQKPiA+ID4gYHN1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJn
ZWRgIHJlcXVpcmVzIHRoZSBmb2xsb3dpbmcgY2hhbmdlOgo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvc3VwcG9ydC9zY3JpcHRzL2NoZWNrLW1lcmdlZCBiL3N1cHBvcnQvc2NyaXB0cy9jaGVjay1t
ZXJnZWQKPiA+ID4gaW5kZXggNDQ3YWJmZDgxNS4uMjNmZGFhYzJjOCAxMDA3NTUKPiA+ID4gLS0t
IGEvc3VwcG9ydC9zY3JpcHRzL2NoZWNrLW1lcmdlZAo+ID4gPiArKysgYi9zdXBwb3J0L3Njcmlw
dHMvY2hlY2stbWVyZ2VkCj4gPiA+IEBAIC00Nyw2ICs0Nyw4IEBAIHdoaWxlIGdldG9wdHMgInQ6
dWIiIE9QVDsgZG8KPiA+ID4gICAgICAgICBlc2FjCj4gPiA+ICBkb25lCj4gPiA+Cj4gPiA+ICtz
aGlmdCAkKChPUFRJTkQtMSkpCj4gPiA+ICsKPiA+ID4gIGlmIFsgIiR7dHlwZX0iID0gInNrZWxl
dG9uIiBdOyB0aGVuCj4gPiA+ICAgICAgICAgc3RyaWN0PXRydWUKPiA+ID4gIGVsc2UKPiA+ID4K
PiA+ID4gQWZ0ZXIgYXBwbHlpbmcgdGhpcyBjaGFuZ2UsIG15IGNvbXBpbGF0aW9uIHdvcmtzIGFn
YWluLCBpbiB0aGUgc2FtZQo+ID4gPiB3YXkgYXMgcmV2ZXJ0aW5nIGNvbW1pdCA3OTNlYmQ1ZDI4
MDk1YzhkZjQ1YTBkMTgzZDI3M2Q4YTg0YjNmMGE0Lgo+ID4gPiBJIGhhdmVu4oCZdCBjaGVja2Vk
IHRoZSByZWFzb24gZm9yIHRoaXMgYHNoaWZ0YCBteXNlbGYuCj4gPgo+ID4gWWFubiBFLiBNb3Jp
biByZXBsaWVkOgo+ID4gPiBEaWQgeW91IHVuZGVyc3RhbmQgd2h5IHRoZSBzdWdnZXN0ZWQgY2hh
bmdlIGlzIGNvcnJlY3Q/Cj4gPgo+ID4gSSB0b29rIGEgcXVpY2sgbG9vayBhdCB0aGUgY29tbWl0
IGluIHF1ZXN0aW9uICg3OTNlYmQ1ZDI4MDkKPiA+ICJzdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVy
Z2VkOiB1c2UgZ2V0b3B0cyBpbnN0ZWFkIG9mIGdldG9wdCIpLiBNeQo+ID4gdW5kZXJzdGFuZGlu
ZyBpcyB0aGF0Ogo+ID4KPiA+ICAg4oCiIEJlZm9yZSB0aGF0IGNvbW1pdCwgdGhlIG9wdGlvbnMt
cGFyc2luZyBsb29wIChgd2hpbGUgOjsgZG9gLCBsaW5lcwo+ID4gICAgIDQ0IHRocm91Z2ggNjMp
IGNvbnN1bWVkICh3aXRoIGBzaGlmdGApIHRoZSBvcHRpb25zIGFuZCBsZWZ0IHRoZQo+ID4gICAg
IG90aGVyIGFyZ3VtZW50cyBpbiAkQC4gVGhvc2UgZXh0cmEgYXJndW1lbnRzICh0aGUgcm9vdCBk
aXJlY3Rvcmllcwo+ID4gICAgIHRvIGNoZWNrKSB3aGVyZSB0aGVuIGNvbnN1bWVkIGJ5IHRoZSBg
Zm9yIHJvb3Q7IGRvYCBsb29wIGxpbmVzIDEyNQo+ID4gICAgIHRocm91Z2ggMTQ0Lgo+ID4KPiA+
ICAg4oCiIFNpbmNlIHRoYXQgY29tbWl0LCB0aGUgb3B0aW9ucy1wYXJzaW5nIGxvb3AgZG9lcyBu
b3QgY29uc3VtZSB0aGUKPiA+ICAgICBvcHRpb25zIGl0IGZpbmRzLiBUaGUgYGZvciByb290OyBk
b2AgbG9vcCBvdmVyIHRoZSByb290IGRpcmVjdG9yaWVzLAo+ID4gICAgIGhvd2V2ZXIsIGhhcyBu
b3QgYmVlbiBjaGFuZ2VkLiBUaGlzIGxvb3Agd2lsbCB0aGVuIGludGVycHJldCB0aGUKPiA+ICAg
ICBvcHRpb25zIGFzIGV4dHJhIHJvb3QgZGlyZWN0b3JpZXMgdG8gY2hlY2suCj4gPgo+ID4gQEpv
c8OpIEx1aXMgU2FsdmFkb3IgUnVmbzogSSBob3BlIHRoaXMgY2FuIGhlbHAgeW91IHdyaXRlIGEg
bW9yZQo+ID4gYXBwcm9wcmlhdGUgY29tbWl0IG1lc3NhZ2UuCj4gPgo+ID4gUmVnYXJkcywKPiA+
Cj4gPiBFZGdhci4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
