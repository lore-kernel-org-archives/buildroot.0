Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34D0C282D0
	for <buildroot@archiver.kernel.org>; Tue,  4 Mar 2025 22:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 976D5608AA;
	Tue,  4 Mar 2025 22:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyIcOpqOj-a4; Tue,  4 Mar 2025 22:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A698E60B3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A698E60B3B;
	Tue,  4 Mar 2025 22:58:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45CBBD2
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 22:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15FEB40CFE
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 22:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rL8sqah1Wko for <buildroot@buildroot.org>;
 Tue,  4 Mar 2025 22:58:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 58F9D40CF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58F9D40CF5
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58F9D40CF5
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 22:58:54 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso894477766b.1
 for <buildroot@buildroot.org>; Tue, 04 Mar 2025 14:58:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741129132; x=1741733932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JETrMMEofEgYzYW4vB3tChxYPa9PmY0mc1DtZfKVTBs=;
 b=bCp3KI1wGyuHvOxM6MOLMaULQ/hf4bcZ+XfV8DhLj6Zb5Yh+f1171M6MIzRpPW4UNO
 ZW3vjc8/q2Q9KyDYEjHBU2rlPCC3FszrBqWONURcQrG7Juyxln9V+leDPnxNL98ZULny
 C+CHBGiwSSdrySTu7SPBRZbDFmpugmkoGFjmYj93IMYHJGaHXVKdY2CSIlkuFlfsQTCc
 6suXWkZz89rmBKuK3WSQCxAY8T4O5izkOu8HUAif4ZQlVFmkTNdnbosz/HjxRfg7pKS7
 rHBEVejpqBFOFWk5AVPe8ZIfwt9EmFGDlI/tVXU8ViYOAW/GQYMmDHRwhuCvIoO2Rsrf
 yPxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLF+2r1glnywAFRi8qKeLnVwxTG+sV9tbJRv0AqtDEvIjzTnDCmFrw/5EOZ3pg9UBZRsPhsMTePLI=@buildroot.org
X-Gm-Message-State: AOJu0YyyCy1YbmD6yALn0773xNzlk3BXSBFNeMufr8y1zQcqlPN/xiw+
 KYSylCFqgYWCMa8lpPlxGxPL3TKuJ8GOnmlOBBS0YKrMh8sMWLurlHmtYVus27mXbx54+4LTrnF
 Y8RhhZTzGlmJhLi/DEqOEAqPEZEsOSzq22mqkejMV72j1sHWwpQ==
X-Gm-Gg: ASbGncvWtiGFbNXtYdQT8UBwcH2fKG9C5aE68XBk6xLGZXRhORfUrTM3DIPVR3IZkXC
 wzMOLgu6Nx08FRI0KILD/QeFirkBhleek3XTO0EYvokEWMvX4JP3TOoypP83hujrQKKffS5V184
 te8WDgOpYipQqhxHNuU4Iodq7RAN4=
X-Google-Smtp-Source: AGHT+IG/xFLO6EWeZ8RHsqpNTwzdjxehBkPLhwzCdsm2orhgDObF93ZFqoiPNppHRpd4WZJ1vEp6Nhs45oTs9TGPzFM=
X-Received: by 2002:a17:907:9409:b0:abe:fed3:9eb8 with SMTP id
 a640c23a62f3a-ac20dd05169mr111847466b.41.1741129132059; Tue, 04 Mar 2025
 14:58:52 -0800 (PST)
MIME-Version: 1.0
References: <20250303155310.513886-1-alex.bennee@linaro.org>
 <0c66ba0f-9efa-4cc0-8a36-71b54e25979e@gmail.com>
 <871pvc6f80.fsf@draig.linaro.org>
In-Reply-To: <871pvc6f80.fsf@draig.linaro.org>
Date: Tue, 4 Mar 2025 14:58:40 -0800
X-Gm-Features: AQ5f1JrxTnwqj78RlKIlX263eqcgJfC3Dm8k8yDH9vASjTP5vN9zgLuZQ9Uy5OE
Message-ID: <CAGt4E5vt9fXvxqChyavRMTf0jk7ZKMowZ+=YhjDF-OnHZLm7Eg@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, buildroot@buildroot.org, 
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Alexander Egorenkov <egorenar-dev@posteo.net>, 
 Bernd Kuhls <bernd@kuhls.net>, Julien Olivain <ju.o@free.fr>,
 Laurent Vivier <laurent@vivier.eu>, 
 "Wojciech M. Zabolotny" <wzab01@gmail.com>,
 Francis Laniel <flaniel@linux.microsoft.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Qais Yousef <qais.yousef@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1741129132; x=1741733932; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JETrMMEofEgYzYW4vB3tChxYPa9PmY0mc1DtZfKVTBs=;
 b=LrkEQJZal9siKtO6vFPZzSOVCtolhujcWhjqe6UwfqwLef1AsrvZIc8t/xlegnXPy+
 Rg7eSv4BKmbdyeuJkcG3/7Jr/ZEIAcCpKC+3qawl0DZCYjPuznm56Nq7bqG2VuGDO03M
 LdMXg04snWfX8JnTeFRMpqP3LYIT5A9ENLdMA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=LrkEQJZa
Subject: Re: [Buildroot] [PATCH v3] package/elfutils: ensure we have 5.0
 kernel headers for aarch64
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCA0IE1hciAyMDI1IGF0IDA2OjMwLCBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxp
bmFyby5vcmc+IHdyb3RlOgo+Cj4gRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5j
b20+IHdyaXRlczoKPgo+ID4gT24gMDMvMDMvMjAyNSAwNzo1MywgQWxleCBCZW5uw6llIHdyb3Rl
Ogo+ID4+IFNpbmNlIEJ1aWxkcm9vdCBjb21taXQgWzFdICJwYWNrYWdlL2VsZnV0aWxzOiBidW1w
IHRvIHZlcnNpb24gMC4xOTIiCj4gPj4gZWxmdXRpbHMgZmFpbHMgdG8gYnVpbGQgb24gQWFyY2g2
NCB3aXRoIHRvb2xjaGFpbiBpbmNsdWRpbmcgS2VybmVsIG9sZGVyCj4gPj4gdGhhbiB2ZXJzaW9u
IDUuMC4gRXJyb3Igc2hvd3M6Cj4gPj4gICAgICBhYXJjaDY0X2luaXRyZWcuYzogSW4gZnVuY3Rp
b24KPiA+PiAnYWFyY2g2NF9zZXRfaW5pdGlhbF9yZWdpc3RlcnNfdGlkJzoKPiA+PiAgICAgIGFh
cmNoNjRfaW5pdHJlZy5jOjYxOjI0OiBlcnJvcjogc3RvcmFnZSBzaXplIG9mICdwYWNfbWFzaycg
aXNuJ3QKPiA+PiAgICAgIGtub3duCj4gPj4gICAgICAgICA2MSB8ICAgc3RydWN0IHVzZXJfcGFj
X21hc2sgcGFjX21hc2s7Cj4gPj4gICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+fn5+fn4KPiA+PiBlbGZ1dGlscyAwLjE5MiBpbnRyb2R1Y2VkIGEgQWFyY2g2NCBwb2ludGVy
IGF1dGhlbnRpY2F0aW9uIHN1cHBvcnQKPiA+PiBpbgo+ID4+IHVwc3RyZWFtIGNvbW1pdCBbMl0u
Cj4gPj4gRm9yIHJlZmVyZW5jZSwgdGhlIHVzZXJfcGFjX21hc2sgc3RydWN0dXJlIHdhcyBpbnRy
b2R1Y2VkIGluIEtlcm5lbAo+ID4+IHVwc3RyZWFtIGNvbW1pdCBbM10sIGluY2x1ZGVkIGluIEtl
cm5lbCB2NS4wLgo+ID4+IEZpeGVzOgo+ID4+IC0gZS5nIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5vcmcvcmVzdWx0cy81MTU2OTAxYTczYmU1MmNlOGZmYmYxMDcyOWU2ODUyNDk5YTMwMGJl
Lwo+ID4+IC0gNC82IG9mIHRoZSBmYWlsdXJlcyBoZXJlOiBodHRwczovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnLz9yZWFzb249ZWxmdXRpbHMtMC4xOTImYXJjaD1hYXJjaDY0Cj4gPj4gWzFdCj4g
Pj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzVl
YjczNDc2NmIyNGRlNWZjZTZlNTg2ODk3Y2Q0ODI3Zjg4NTU0NDIKPiA+PiBbMl0gaHR0cHM6Ly9z
b3VyY2V3YXJlLm9yZy9naXQvP3A9ZWxmdXRpbHMuZ2l0O2E9Y29tbWl0ZGlmZjtoPTY0ZTNiNDUx
YWQyY2VjOGQ0NTY2MWIxODE2ZTNkMmRjNDQzMWYzY2EKPiA+PiBbM10gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQv
P2lkPWVjNmU4MjJkMWEyMmQwZWVmMWQxZmEyNjBkZmY3NTFkYmE5YTQyNTgKPiA+PiBTaWduZWQt
b2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4gPj4gTWVzc2Fn
ZS1JZDogPDIwMjUwMjE3MTQwMzMyLjMxMDM0Ny0xLWFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4g
Pgo+ID4gV2FzIHRoZXJlIGEgcGFydGljdWxhciByZWFzb24geW91IGRlY2lkZWQgbm90IHRvIHRh
a2UgdGhpcyB1cHN0cmVhbQo+ID4gcGF0Y2ggYW5kIGp1c3Qgc3B1biBhIHYzOgo+ID4KPiA+IGh0
dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWVsZnV0aWxzLmdpdDthPWNvbW1pdDtoPTUyYTc0
N2EzMTYwNDJlNzBhMjJhY2I0ODlkZjllNTFiZmM2YmYyZDUKPgo+IFNvcnJ5IEkgZGlkbid0IHNl
ZSB0aGF0IGJlZm9yZSBJJ2QgcmVzcHVuLgoKV291bGQgeW91IG1pbmQgY3JlYXRpbmcgYSB2NCB0
aGF0IGRvZXMgTk9UIGludHJvZHVjZSBhIGRlcGVuZGVuY3kgb24KTGludXggNS4wLCBzaW5jZSBp
dCBpcyBubyBsb25nZXIgbmVjZXNzYXJ5IHRvIGRvIHNvPwoKSGF2aW5nIEJ1aWxkcm9vdCBhcHBs
eSBteSBlbGZ1dGlscyBwYXRjaCBhZ2FpbnN0IGVsZnV0aWxzIDAuMTkyIGFsc28Kc29sdmVzIHRo
ZSBwcm9ibGVtIHdpdGhvdXQgY3JlYXRpbmcgdGhpcyBkZXBlbmRlbmN5LgoKQW5kIHllcywgd2Ug
c3RpbGwgdXNlIDQueCBrZXJuZWwgaGVhZGVycyBpbiBzb21lIHNpdHVhdGlvbnMsIHNvIGEKZGVw
ZW5kZW5jeSBvbiBMaW51eCA1LjAgd291bGQgYmUgY291bnRlcnByb2R1Y3RpdmUgZm9yIHVzLgoK
VGhhbmtzLAotTWFya3VzCgoKPiAtLQo+IEFsZXggQmVubsOpZQo+IFZpcnR1YWxpc2F0aW9uIFRl
Y2ggTGVhZCBAIExpbmFybwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
