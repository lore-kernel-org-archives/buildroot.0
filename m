Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B228CCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 21:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A330784246;
	Wed,  5 Nov 2025 21:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BObWCCWtV3N; Wed,  5 Nov 2025 21:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B90D84256
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B90D84256;
	Wed,  5 Nov 2025 21:05:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F17A44C6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE9086134B
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALu3uSyaEuRs for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 21:05:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69CBB61350
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69CBB61350
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69CBB61350
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:05:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B9F2719F522;
 Wed,  5 Nov 2025 22:04:57 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Nov 2025 22:04:57 +0100
MIME-Version: 1.0
Date: Wed, 05 Nov 2025 22:04:57 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Mario Lang <mlang@blind.guru>
In-Reply-To: <20251105170351.1439823-1-dario.binacchi@amarulasolutions.com>
References: <20251105170351.1439823-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <317fcd103d4be91b2c17cbc0fd344850@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762376699;
 bh=7wBAdA5ozl2tE4ZsRkXxkIRXGKawVn416izxWXveCDs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O+9SsqUswUJGdt5Cck9PfYQM3evwQq+jhaIHXgRQzlu05flzgZCQVfXWo85fPUY0e
 LTfu9LUY1qqQDLaQWJGpxkeM7RuETMnkEMSjqIAn3c/Khk8TFcUsJXtC/ymUXkBB4A
 TetTQOFPrsGaJd5oRekV1i/lCZjG+88ISRm4JoI9zte7mxrs64K01PE8b+aWGoncGM
 Ksy09iSNtJdPMCmomBGv1fOsF/2nKQGFU7SsaxvnJ2xH6LkJOn22xJe65LEoXDV6aj
 E06p98H+5yLqyo9mzo/Lq1n5yzBdM332HyggHdJkjN4Q3DKw5QY4ND6Go++mshEX3n
 huLCTfypvIkDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O+9SsqUs
Subject: Re: [Buildroot] [PATCH v4 1/1] package/brltty: bump to version 6.8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDUvMTEvMjAyNSAxODowMywgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gQ29tbWl0IFsxXSBo
YXMgbWFkZSBuY3Vyc2VzIGEgcmVxdWlyZW1lbnQgZm9yIGJ1aWxkaW5nIHRoZSBwYWNrYWdlLgo+
IAo+IFRoZSBhZGRlZCBwYXRjaGVzIGZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yczoKPiAK
PiAvdXNyL2Jpbi9pbnN0YWxsIC1jIC1kIC4uLy4uLy4uL2xpYgo+IGJ1aWxkcm9vdC9vdXRwdXQv
aG9zdC9iaW4vYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYtZ2NjIC1zaGFyZWQgICAKPiAt
V2wsLWV4cG9ydC1keW5hbWljIC1vIC4uLy4uLy4uL2xpYi9saWJicmx0dHl4ZnYuc28gc2NyZWVu
Lm8gLWx0aW5mbwo+IGJ1aWxkcm9vdC9vdXRwdXQvaG9zdC9saWIvZ2NjL2FybS1idWlsZHJvb3Qt
bGludXgtZ251ZWFiaWhmLzE0LjMuMC8uLi8uLi8uLi8uLi9hcm0tYnVpbGRyb290LWxpbnV4LWdu
dWVhYmloZi9iaW4vbGQ6IAo+IGNhbm5vdCBmaW5kIC1sdGluZm86IE5vIHN1Y2ggZmlsZSBvciBk
aXJlY3RvcnkKPiBjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMKPiAK
PiAuL3VuaWNvZGUuYzogSW4gZnVuY3Rpb24g4oCYZ2V0VHJhbnNsaXRlcmF0ZWRDaGFyYWN0ZXLi
gJk6Cj4gLi91bmljb2RlLmM6MzQ5OjI3OiBlcnJvcjogaW5pdGlhbGl6YXRpb24gb2Yg4oCYaWNv
bnZfdOKAmSB7YWthIOKAmGxvbmcgaW504oCZfSAKPiBmcm9tIOKAmHZvaWQgKuKAmSBtYWtlcyBp
bnRlZ2VyIGZyb20gcG9pbnRlciB3aXRob3V0IGEgY2FzdCAKPiBbLVdpbnQtY29udmVyc2lvbl0K
PiAgIDM0OSB8ICAgc3RhdGljIGljb252X3QgaGFuZGxlID0gTlVMTDsKPiAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fgo+IAo+IFVwZGF0ZSBSRUFETUUgaGFzaDoKPiAtIHY2
Ljg6Cj4gICAtIFVwZGF0ZSB0aGUgY29weXJpZ2h0IGZyb20gMjAyNCB0byAyMDI1Lgo+IC0gdjYu
NzoKPiAgIC0gVXBkYXRlIHRoZSBzdXBwb3J0ZWQgYnJhaWxsZSBkZXZpY2VzIGxpc3RzLgo+ICAg
LSBBZGQgc3VwcG9ydCBmb3IgdGhlIEhJTVMgZU1vdGlvbi4KPiAgIC0gQWRkIHN1cHBvcnQgZm9y
IEhUJ3MgQWN0aXZhdG9yIFBybyBtb2RlbHMuCj4gICAtIEFkZCBzdXBwb3J0IGZvciB0aGUgS0dT
IE5leHQgVG91Y2ggNDAuCj4gICAtIENoYW5nZSB0aGUgY29weXJpZ2h0IGZyb20gMjAyMyB0byAy
MDI0Lgo+ICAgLSBEb2N1bWVudCB0aGF0IEhUJ3MgQmFzaWMgQnJhaWxsZSBQbHVzIG1vZGVscyBh
cmUgc3VwcG9ydGVkLgo+IAo+IFJlbGVhc2Ugbm90ZXM6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2Jy
bHR0eS9icmx0dHkvYmxvYi9CUkxUVFktNi44L0RvY3VtZW50cy9DaGFuZ2VMb2cKPiAKPiBbMV0g
Cj4gaHR0cHM6Ly9naXRodWIuY29tL2JybHR0eS9icmx0dHkvY29tbWl0LzhmN2Q2NTU2OWVmNzdl
ZWM4YjhlNGI5N2U2OGNiNTY4OWNmNTdlZjkKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2No
aSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CgpBcHBsaWVkIHRvIG1hc3Rl
ciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
