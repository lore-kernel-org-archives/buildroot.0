Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21C8C0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 16:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80C1D60ADF;
	Tue, 11 Feb 2025 16:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGrbfMt0_QSy; Tue, 11 Feb 2025 16:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 660D060EDB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 660D060EDB;
	Tue, 11 Feb 2025 16:48:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97CEB6C
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AD9A4072C
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAB5o-aq10b2 for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 16:48:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E66A940712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E66A940712
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E66A940712
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:48:37 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43944c51e41so24921205e9.0
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 08:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739292516; x=1739897316;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QzZazfA5i6+4EUs+hc42xH6rd/w/gg2VRPtMY1O32ak=;
 b=m7gqFiyZ29FJjPeDBDlh9tOdYB23V2vYBuTOATwwU1dVCC+lh82TYxy4Zsta3D7KBh
 aEa4TpGmQAaZKc6YV3UZnWeRb5XnNf41KV4XNMPUEZrojdmeHxPaULj3TMXmkVWSigbh
 2L9TYpD16T2I4iY+eNPeJoixcMdKo6eMCz8wEEQHRV77stjVZ96B5bgSqvXIBG8bJSI6
 evOkXQHRI/NhovqDB7jTFJ6smuIJZC+/4kObFhkstHcm0wLdlqrvE6yJcfo1CbzV0kdH
 SSzGLwboNlEwO15B9DkAWp/YshP6k8PAI+GSs3oYvYA4f1QiO+2/IJ8fYJSsbGvVWCEO
 S2lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWtxJwJTfC/boDjhuJRaBlqXO5pkwAS8MOaQYrc1TUSz8zdsuuXyPNZrf3CjyRFOwq9g+vnxG9WOs=@buildroot.org
X-Gm-Message-State: AOJu0YzTz6mJ0rMlYkxtvgUcgu0evCaxVPwQ93Z0l6SP7R3D0fTTJGFt
 r9gcxtQbzEh3uSBV0Ny1iKWteTkW3E7f1kavUx8AX2Br0gQ1oIBl/Era2MFlCeA=
X-Gm-Gg: ASbGnctOyDPzFBkLWJUKUw4ELv6vwqJV/1ZReDatkj18M/Drj3oC9jzRxqjG7yngomF
 n/TBIRPYhiHy8CJknTzLgsz/pGj3ih687umegm39EQh2aFlleoUw7CQYrMBl1c40MmXqvg+IOJY
 c81RZCsm7UoGDTMDV7Pt2AFdRrkv2/gCcT6zbFGFCpOhIku+8FpP5BiNQHCKecYleXSR0cAnOlx
 vx1fooW7rWCTMjI34Qa+gMf5up/uXFSYZNqnRHReBSE9RhvS4A9nsZd5Ah7wK/mXcmCWuCOtcAo
 0ZMax+7MOf8SSVxBLo9DwS1uxLpR7aLcr1NMsnnxhb6TNDuJdHWhR1k/+l3CwCkOT8WG8i3Vxyv
 QCRO6+C8Bv4mfuEvGXTeykoZJfgUl1t+eK2NOE/iFEUUIgrY4Nmk=
X-Google-Smtp-Source: AGHT+IE1pnm63ovEO0qwQKe/uiaX8NYZNIXBoMtb5k7mP8zxNgcLf/hXrBgXGtYZspqFSPIyfT0QDg==
X-Received: by 2002:a5d:47c3:0:b0:38d:e166:8dc2 with SMTP id
 ffacd0b85a97d-38de1669178mr7490999f8f.16.1739292515864; 
 Tue, 11 Feb 2025 08:48:35 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4394f2c2c41sm18103455e9.1.2025.02.11.08.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 08:48:35 -0800 (PST)
Message-ID: <4991bef1-27ec-4594-a239-9694ca2a6993@smile.fr>
Date: Tue, 11 Feb 2025 17:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jamie Gibbons <jamie.gibbons@microchip.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>
References: <20250121090513.3375533-1-jamie.gibbons@microchip.com>
 <20250121090513.3375533-4-jamie.gibbons@microchip.com>
Content-Language: fr
In-Reply-To: <20250121090513.3375533-4-jamie.gibbons@microchip.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739292516; x=1739897316; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QzZazfA5i6+4EUs+hc42xH6rd/w/gg2VRPtMY1O32ak=;
 b=HikGj5U/DyDhVOyvKgGSxrj4pmF1RFgmzVoEChxFteS7C4DNeaW1/08qmP/ZXCKrdI
 E6fy3NtuGvEZ2znWDqOqj/akHzNk45imzg1kVsPOdM6KhsuoM3MM2kYLkhfcqtXaHU/m
 9VrmtmpTXZ+WogaGz/6+gZ09s8zX8O9xj3t7w=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=HikGj5U/
Subject: Re: [Buildroot] [PATCH v2 3/3] board/beagleboard/beaglev_fire:
 cleanup gatewate update
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtaWUsCgpMZSAyMS8wMS8yMDI1IMOgIDEwOjA1LCBKYW1pZSBHaWJib25zIHZpYSBi
dWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBVcGRhdGUgdGhlIFJFQURNRSBmb2xsb3dpbmcgdGhlIHVw
ZGF0ZSBnYXRld2FyZSBmaXggYW5kIG9wdGltaXNlIHRoZQo+IHNjcmlwdCwgbWFraW5nIGl0IGVh
c2llciBmb3IgdGhlIHVzZXIgdG8gdXNlLgo+IAo+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkg
PGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbWllIEdpYmJv
bnMgPGphbWllLmdpYmJvbnNAbWljcm9jaGlwLmNvbT4KPiAtLS0KPiAgYm9hcmQvYmVhZ2xlYm9h
cmQvYmVhZ2xldl9maXJlL1JFQURNRS50eHQgICAgIHwgMTMgKysrLS0tLS0tLQo+ICAuLi4vdXNy
L3NoYXJlL21pY3JvY2hpcC91cGRhdGUtZ2F0ZXdhcmUuc2ggICAgfCAyNCArKysrKysrKysrKyst
LS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZS9SRUFE
TUUudHh0IGIvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL1JFQURNRS50eHQKPiBpbmRl
eCBjOWE4MjRiNjdmLi42NDg0Y2NhOGUxIDEwMDY0NAo+IC0tLSBhL2JvYXJkL2JlYWdsZWJvYXJk
L2JlYWdsZXZfZmlyZS9SRUFETUUudHh0Cj4gKysrIGIvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xl
dl9maXJlL1JFQURNRS50eHQKPiBAQCAtMTEzLDcgKzExMyw3IEBAIGh0dHBzOi8vZG9jcy5iZWFn
bGVib2FyZC5vcmcvbGF0ZXN0L2JvYXJkcy9iZWFnbGV2L2ZpcmUvZGVtb3MtYW5kLXR1dG9yaWFs
cy9nYXRlCj4gICAgT24geW91ciBMaW51eCBob3N0IGRldmVsb3BtZW50IGNvbXB1dGVyLCBjb3B5
IHRoZSBiaXRzdHJlYW0gdG8gQmVhZ2xlVi1GaXJlCj4gICAgYm9hcmQsIHJlcGxhY2luZyA8L3Bh
dGgvdG8veW91ci8+IHdpdGggdGhlIHBhdGggdG8geW91ciBCZWFnbGVWLUZpcmUgcm9vdCBmaWxl
Cj4gICAgc3lzdGVtLgo+IC0gICAgJ2NwIC1yIC4vTGludXhQcm9ncmFtbWluZyAvcGF0aC90by95
b3VyL2J1aWxkcm9vdC9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvcm9vdGZzLW92ZXJs
YXkvZXRjLycKPiArICAgICdjcCAtciAuL0xpbnV4UHJvZ3JhbW1pbmcgL3BhdGgvdG8veW91ci9i
dWlsZHJvb3QvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL3Jvb3Rmcy1vdmVybGF5L2xp
Yi9maXJtd2FyZS8nCgpIZXJlLCB0aGUgTGludXhQcm9ncmFtbWluZyBkaXJlY3RvcnkgaXMgY29w
aWVkIHRvIHJvb3Rmcy1vdmVybGF5L2xpYi9maXJtd2FyZS8KCj4gIAo+ICAgIFRvIGFwcGx5IHRo
ZXNlIGNoYW5nZXMgdG8geW91ciBpbWFnZSwgbWFrZSBzdXJlIHRvIHJlLWJ1aWxkIGl0IHdpdGg6
Cj4gICAgICBgbWFrZWAKPiBAQCAtMTIxLDE0ICsxMjEsNyBAQCBodHRwczovL2RvY3MuYmVhZ2xl
Ym9hcmQub3JnL2xhdGVzdC9ib2FyZHMvYmVhZ2xldi9maXJlL2RlbW9zLWFuZC10dXRvcmlhbHMv
Z2F0ZQo+ICAgIFRoZW4sIHJlLWZsYXNoIHlvdXIgaW1hZ2UgLSB0byBlbnN1cmUgeW91IGhhdmUg
dGhlIG5lY2Vzc2FyeSBmaXJtd2FyZSBmaWxlcyAtIGJ5Cj4gICAgZm9sbG93aW5nIHRoZSBhYm92
ZSBzZWN0aW9uICJGbGFzaGluZyB0aGUgaW1hZ2UgdG8geW91ciBlTU1DIi4KPiAgCj4gLSAgT24g
QmVhZ2xlVi1GaXJlLAo+IC0gICAgMS4gTWFrZSB5b3VyIHVwZGF0ZSBnYXRld2FyZSBzY3JpcHQg
ZXhlY3V0YWJsZQo+IC0gICAgICAnY2htb2QgK3ggL3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRl
LWdhdGV3YXJlLnNoJwo+IC0gICAgMi4gQ3JlYXRlIGEgZmlybXdhcmUgZGlyZWN0b3J5Cj4gLSAg
ICAgICdta2RpciAvbGliL2Zpcm13YXJlJwo+IC0gICAgMy4gQ2hhbmdlIHRvIHRoZSBkaXJlY3Rv
cnkgb2YgeW91ciBnYXRld2FyZSBzY3JpcHQKPiAtICAgICAgYGNkIC91c3Ivc2hhcmUvbWljcm9j
aGlwL2AKPiAtICAgIDMuIGluaXRpYXRlIHRoZSByZXByb2dyYW1taW5nIG9mIHRoZSBGUEdBIHdp
dGggeW91ciBnYXRld2FyZSBiaXRzdHJlYW06Cj4gLSAgICAgICcuL3VwZGF0ZS1nYXRld2FyZS5z
aCAvZXRjL0xpbnV4UHJvZ3JhbW1pbmcvJwo+ICsgIE9uIEJlYWdsZVYtRmlyZSBpbml0aWF0ZSB0
aGUgcmVwcm9ncmFtbWluZyBvZiB0aGUgRlBHQSB3aXRoIHlvdXIgZ2F0ZXdhcmUgYml0c3RyZWFt
Ogo+ICsgICAgYC91c3Ivc2hhcmUvbWljcm9jaGlwL3VwZGF0ZS1nYXRld2FyZS5zaGAKCkl0IHNl
ZW1zIHlvdSBoYXZlIHN0aWxsIHRvIHByb3ZpZGUgdGhlIEdhdGV3YXJlIGxvY2F0aW9uIHBhdGg6
CgogIC91c3Ivc2hhcmUvbWljcm9jaGlwL3VwZGF0ZS1nYXRld2FyZS5zaCAvbGliL2Zpcm13YXJl
L0xpbnV4UHJvZ3JhbW1pbmcKCj4gIAo+ICAgIFdhaXQgZm9yIGEgY291cGxlIG9mIG1pbnV0ZXMg
Zm9yIHRoZSBCZWFnbGVWLUZpcmUgdG8gcmVwcm9ncmFtIGl0c2VsZi4KPiBkaWZmIC0tZ2l0IGEv
Ym9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL3Jvb3Rmcy1vdmVybGF5L3Vzci9zaGFyZS9t
aWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNoIGIvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9m
aXJlL3Jvb3Rmcy1vdmVybGF5L3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNo
Cj4gaW5kZXggMjQ5YzViZDI2MC4uN2UwNWQ0YjdlYiAxMDA3NTUKPiAtLS0gYS9ib2FyZC9iZWFn
bGVib2FyZC9iZWFnbGV2X2ZpcmUvcm9vdGZzLW92ZXJsYXkvdXNyL3NoYXJlL21pY3JvY2hpcC91
cGRhdGUtZ2F0ZXdhcmUuc2gKPiArKysgYi9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUv
cm9vdGZzLW92ZXJsYXkvdXNyL3NoYXJlL21pY3JvY2hpcC91cGRhdGUtZ2F0ZXdhcmUuc2gKPiBA
QCAtMSwxNyArMSwyNSBAQAo+ICAjIS9iaW4vc2gKPiAgCj4gLWlmIFsgISAtZSAiJDEiL21wZnNf
Yml0c3RyZWFtLnNwaSBdOyB0aGVuCj4gK2lmIFsgJCMgLWVxIDAgXTsgdGhlbgo+ICsgICAgZWNo
byAiTm8gZ2F0ZXdhcmUgbG9jYXRpb24gcHJvdmlkZWQuIENoZWNraW5nIGRlZmF1bHQgbG9jYXRp
b24uIgoKT3RoZXJ3aXNlIHRoZSBuZXcgZ2F0ZXdhcmUgZmlsZSBpcyBsb2NhdGVkIHRvCiAgL2xp
Yi9maXJtd2FyZS9MaW51eFByb2dyYW1taW5nL21wZnNfYml0c3RyZWFtLnNwaQoKQW5kIHRoaXMg
c2NyaXB0IG9ubHkgY2hlY2sgaWYgdGhlcmUgaXMgYW4gZXhpc3RpbmcgZ2FyZXdhcmUgZmlsZToK
Cj4gKyAgICBpZiBbICEgLWUgL2xpYi9maXJtd2FyZS9tcGZzX2JpdHN0cmVhbS5zcGkgXTsgdGhl
bgo+ICAgICAgICAgIGVjaG8gIk5vIGdhdGV3YXJlIGZpbGUgZm91bmQuIgo+ICAgICAgICAgIGV4
aXQgMQo+ICsgICAgZmkKCkNhbiB5b3UgZG91YmxlIGNoZWNrIHRoaXMgcGFydD8KCkJlc3QgcmVn
YXJkcywKUm9tYWluCgoKPiArZWxzZQo+ICsgICAgZWNobyAiR2F0ZXdhcmUgbG9jYXRpb24gcHJv
dmlkZWQ6ICQxIgo+ICsgICAgaWYgWyAhIC1lICIkMSIvbXBmc19iaXRzdHJlYW0uc3BpIF07IHRo
ZW4KPiArICAgICAgICBlY2hvICJObyBnYXRld2FyZSBmaWxlIGZvdW5kLiIKPiArICAgICAgICBl
eGl0IDEKPiArICAgIGVsc2UKPiArICAgICAgICBpZiBbICEgLWQgL2xpYi9maXJtd2FyZSBdOyB0
aGVuCj4gKyAgICAgICAgICAgIG1rZGlyIC9saWIvZmlybXdhcmUKPiArICAgICAgICBmaQo+ICsg
ICAgICAgIGNwICIkMSIvbXBmc19kdGJvLnNwaSAvbGliL2Zpcm13YXJlL21wZnNfZHRiby5zcGkK
PiArICAgICAgICBjcCAiJDEiL21wZnNfYml0c3RyZWFtLnNwaSAvbGliL2Zpcm13YXJlL21wZnNf
Yml0c3RyZWFtLnNwaQo+ICsgICAgZmkKPiAgZmkKPiAgCj4gLWlmIFsgISAtZCAvbGliL2Zpcm13
YXJlIF0KPiAtdGhlbgo+IC0gICAgbWtkaXIgL2xpYi9maXJtd2FyZQo+IC1maQo+IC0KPiAtY3Ag
IiQxIi9tcGZzX2R0Ym8uc3BpIC9saWIvZmlybXdhcmUvbXBmc19kdGJvLnNwaQo+IC1jcCAiJDEi
L21wZnNfYml0c3RyZWFtLnNwaSAvbGliL2Zpcm13YXJlL21wZnNfYml0c3RyZWFtLnNwaQo+ICAK
PiAgIyBUcmFzaCBleGlzdGluZyBkZXZpY2UgdHJlZSBvdmVybGF5IGluIGNhc2UgdGhlIHJlc3Qg
b2YgdGhlIHByb2Nlc3MgZmFpbHM6Cj4gIGZsYXNoX2VyYXNlIC9kZXYvbXRkMCAwIDE2CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
