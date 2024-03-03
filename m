Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE99C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FCBD414BF;
	Sun,  3 Mar 2024 09:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zKggJHguktw3; Sun,  3 Mar 2024 09:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28347410BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28347410BB;
	Sun,  3 Mar 2024 09:50:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 123E51BF57B
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3E09410BB
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:50:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LxIVx0fIFn0f for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:50:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D013F40888
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D013F40888
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D013F40888
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:50:22 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-608e0b87594so36287257b3.1
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 01:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709459421; x=1710064221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aRwutyUf1/50RmR5QP0r1F8nRd4/yyFFEhJBwq4sDRU=;
 b=L1lATZZRBG/o8C1ujnPmztH20HpbX5vtZz9mdbNPi48mp2hg22up7ozvzOfdlcuJd2
 Q/Z89WusaQKWGGzYX5Zu4t61+xhjmv0XCQFGzxQeDSKK5DKaSzj3yQgbPvNLrUazew08
 pGssyraECNuhoJMWRqCCV4fWc5f6rXLET0pmVEIKtFa+QM0iMbpKQz2PPXJ4wBH9dSoC
 S+MMaPpFk4s3AvJ7VCpqsxrJEdr9sMnV2IjhZ2COrIw8Qc+uHm4LPnhA9+pIaYz32D7E
 veiL4LsfbMyOo3tvIeuf+fM/LugE6sFKu0sG8n6WriHYN8H8arVGu+B5WfJdlFZPTSMi
 ZHKQ==
X-Gm-Message-State: AOJu0Yx6SQ4ujC+hkie7qi+myNRsf2bAozq3UWpxBNeZth6Egf/UCAgh
 W+0we+HKZOupGAq9i/lWiulDDyPvU/oN8KpBUjJBvY7myK8odATP+Ou7LigLh8ffqSwnaiyqQJl
 m1IZe1yLZaGyeHjtcJInKl4o8I7zg90p/3U8jBw==
X-Google-Smtp-Source: AGHT+IFqQL7WaxYSyJmAwtWJYcS1BariReLX7W/iHPYI5n13H/1Pl6pNA/AF0IPIwrpByuMoV2dwcbRIpVEkLh1+3jY=
X-Received: by 2002:a0d:e507:0:b0:609:33dd:c63f with SMTP id
 o7-20020a0de507000000b0060933ddc63fmr6288782ywe.34.1709459421586; Sun, 03 Mar
 2024 01:50:21 -0800 (PST)
MIME-Version: 1.0
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
 <20240301133620.3547430-21-dario.binacchi@amarulasolutions.com>
 <056ae2bc-0380-4d86-b554-06a375a44bf5@smile.fr>
 <CABGWkvpi3jgV70jXi3Leti6+EgODiLnBCkmaYjb_qMcqEMZNmA@mail.gmail.com>
 <73584dbb-97d6-4b72-a58e-540a4beab266@smile.fr>
In-Reply-To: <73584dbb-97d6-4b72-a58e-540a4beab266@smile.fr>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 3 Mar 2024 10:50:10 +0100
Message-ID: <CABGWkvo7j-HAi_AmtLuiEnuUG9LTWEn57KqKpuzrG_OxP6uL_w@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709459421; x=1710064221;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aRwutyUf1/50RmR5QP0r1F8nRd4/yyFFEhJBwq4sDRU=;
 b=S26u3FZqOmc7LdMtMmIDxj/YgUoiyNy9nre2K3v4/XB6tb6oQ0o6M4Hk4DHFhvUuz1
 ELSC9G4qWL0/SYgphUndMkDazrnFX53prZh2MSAaJv2Z+pUhUUGR3yYi8EfWD2gCma7x
 27ILbiFSf39fcXRBQduoh0EHrt35cKFqfWi58=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=S26u3FZq
Subject: Re: [Buildroot] [PATCH v8 20/23] package/ti-k3: fix
 BR2_PACKAGE_TI_K3_SOC setting for am64x SOC
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLAoKT24gU2F0LCBNYXIgMiwgMjAyNCBhdCAxMTo1MuKAr1BNIFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPgo+IEhlbGxvIERhcmlvLAo+Cj4g
TGUgMDIvMDMvMjAyNCDDoCAxNToyMSwgRGFyaW8gQmluYWNjaGkgYSDDqWNyaXQgOgo+ID4gSGkg
Um9tYWluLCBBbGwsCj4gPgo+ID4gT24gU2F0LCBNYXIgMiwgMjAyNCBhdCAxMjowNuKAr1BNIFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPiA+Pgo+ID4+IEhpIERh
cmlvLAo+ID4+Cj4gPj4gTGUgMDEvMDMvMjAyNCDDoCAxNDozNiwgRGFyaW8gQmluYWNjaGkgYSDD
qWNyaXQgOgo+ID4+PiBJbiB0aGUgY2FzZSBvZiBTT0MgYW02NHgsIHRpLWszLXI1LWxvYWRlciBj
cmVhdGVzIHRoZSBmb2xsb3dpbmcKPiA+Pj4gdGlib290My5iaW4gZmlsZXM6Cj4gPj4+IC0gR1Ag
ICAgLT4gdGlib290M19hbTY0eC1ncC1ldm0uYmluCj4gPj4+IC0gSFMgICAgLT4gdGlib290M19h
bTY0eF9zcjItaHMtZXZtLmJpbgo+ID4+PiAtIEhTX0ZTIC0+IHRpYm9vdDNfYW02NHhfc3IyLWhz
LWZzLWV2bS5iaW4KPiA+Pj4KPiA+Pj4gVGhlIHBhdGNoIGFsbG93cyB5b3UgdG8gaWRlbnRpZnkg
dGhlIGNvcnJlY3QgZmlsZSBiYXNlZCBvbiB0aGUgU0VDX1RZUEUKPiA+Pj4gb3B0aW9uLgo+ID4+
Cj4gPj4gSXQgc2VlbXMgdGhpcyBwYXRjaCBzaG91bGQgYmUgbWVyZ2VkIHdpdGggdGhlIEFNNjR4
IHUtYm9vdCB2ZXJzaW9uIGJ1bXAgc2luY2UKPiA+PiB0aS1rMy1yNSAoYWthIHUtYm9vdCkgbm93
IHByb3ZpZGUgdGlib290My5iaW4uCj4gPgo+ID4gSSB3aWxsIHNxdWFzaCBpdCB0byBbUEFUQ0gg
MjEvMjNdIGNvbmZpZ3MvdGlfYW02NHhfc2tfZGVmY29uZmlnOiBidW1wCj4gPiBVLUJvb3QgdmVy
c2lvbiB0byAyMDI0LjAxCj4KPiBPawo+Cj4gPgo+ID4+Cj4gPj4gQWxzbyBvdGhlciBUSSBLMyBT
b0MgdmFyaWFudCBsaWtlIEFNNjUgcHJvdmlkZSBhIHNyMiBiaW5hcnk6Cj4gPj4KPiA+PiB0aWJv
b3QzLWFtNjJheC1ocy1mcy1ldm0uYmluCj4gPj4gdGlib290My1hbTYyYXgtZ3AtZXZtLmJpbgo+
ID4+IHRpYm9vdDMtYW02MmF4LWhzLWV2bS5iaW4KPiA+Pgo+ID4+IHRpYm9vdDMtYW02MnB4LWhz
LWZzLWV2bS5iaW4KPiA+Pgo+ID4+IHRpYm9vdDMtYW02MngtaHMtZnMtZXZtLmJpbgo+ID4+IHRp
Ym9vdDMtYW02MngtZ3AtZXZtLmJpbgo+ID4+IHRpYm9vdDMtYW02MngtaHMtZXZtLmJpbgo+ID4+
Cj4gPj4gdGlib290My1hbTY0eF9zcjItaHMtZnMtZXZtLmJpbgo+ID4+IHRpYm9vdDMtYW02NHgt
Z3AtZXZtLmJpbgo+ID4+IHRpYm9vdDMtYW02NHhfc3IyLWhzLWV2bS5iaW4KPiA+Pgo+ID4+IHRp
Ym9vdDMtYW02NXhfc3IyLWdwLWV2bS5iaW4KPiA+PiB0aWJvb3QzLWFtNjV4X3NyMi1ocy1ldm0u
YmluCj4gPj4KPiA+PiB0aWJvb3QzLWo3MjAwLWdwLWV2bS5iaW4KPiA+PiB0aWJvb3QzLWo3MjAw
X3NyMi1ocy1mcy1ldm0uYmluCj4gPj4gdGlib290My1qNzIwMF9zcjItaHMtZXZtLmJpbgo+ID4+
Cj4gPj4gdGlib290My1qNzIxZS1ncC1ldm0uYmluCj4gPj4gdGlib290My1qNzIxZV9zcjItaHMt
ZnMtZXZtLmJpbgo+ID4+IHRpYm9vdDMtajcyMWVfc3IxXzEtaHMtZXZtLmJpbgo+ID4+Cj4gPj4g
dGlib290My1qNzIxczItZ3AtZXZtLmJpbgo+ID4+IHRpYm9vdDMtajcyMXMyLWhzLWZzLWV2bS5i
aW4KPiA+Pgo+ID4+IHRpYm9vdDMtajcyMnMtaHMtZnMtZXZtLmJpbgo+ID4+Cj4gPj4gdGlib290
My1qNzg0czQtZ3AtZXZtLmJpbgo+ID4+IHRpYm9vdDMtajc4NHM0LWhzLWZzLWV2bS5iaW4KPiA+
Pgo+ID4+IE1heWJlIHdlIG5lZWQgdG8gaW50cm9kdWNlIFRJX0szX1I1X0xPQURFUl9TT0NfU1VG
RklYIHRvIGhhbmRsZSBzcjIsIHNyMV8xIG9yICIiID8KPiA+Pgo+ID4gQXQgZmlyc3QsIEkgYWxz
byB0aG91Z2h0IGFib3V0IGEgbmV3IGNvbmZpZ3VyYXRpb24gdG8gc3BlY2lmeSBhbgo+ID4gYWRk
aXRpb25hbCBzdWZmaXgsIGJ1dCBhZnRlciB2ZXJpZnlpbmcKPiA+IHRoYXQgQlIyX1BBQ0tBR0Vf
VElfSzNfU09DIGlzIG9ubHkgdXNlZCBpbgo+ID4gYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMt
cjUtbG9hZGVyLm1rLCB0aGUKPiA+IGFkb3B0ZWQgc29sdXRpb246Cj4gPgo+ID4gLSAgICAgICBk
ZWZhdWx0ICJhbTY0eCIgIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTY0WAo+ID4gKyAgICAg
ICBkZWZhdWx0ICJhbTY0eCIgIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTY0WCAmJgo+ID4g
QlIyX1BBQ0tBR0VfVElfSzNfU0VDVFlQRV9HUAo+ID4gKyAgICAgICBkZWZhdWx0ICJhbTY0eF9z
cjIiICBpZiBCUjJfUEFDS0FHRV9USV9LM19TT0NfQU02NFggJiYKPiA+ICFCUjJfUEFDS0FHRV9U
SV9LM19TRUNUWVBFX0dQCj4gPgo+ID4gc2VlbWVkIHRoZSBzaW1wbGVzdCB0byBtZS4KPiA+Cj4g
PiBBbmQgSSB0aGluayB0aGlzIGFwcHJvYWNoIGNhbiBhbHNvIGJlIHVzZWQgZm9yIHRoZSB2YXJp
YW50cyB5b3UKPiA+IGxpc3RlZCwgc2luY2UgZm9yIGVhY2gge1NPQyxTRUNfVFlQRX0gcGFpcgo+
ID4gdGhlcmUgZXhpc3RzIG9uZSBhbmQgb25seSBvbmUgdGlib290My5iaW4uCj4KPiBXaGF0IGFi
b3V0IHJlbW92aW5nIEJSMl9QQUNLQUdFX1RJX0szX1NPQyBhbmQgQlIyX1BBQ0tBR0VfVElfSzNf
U0VDVFlQRQo+IChpbmhlcml0ZWQgZnJvbSB0aS1rMy1pbWFnZS1nZW4sIHNvIHdlIG5lZWQgdGhl
bSB1bnRpbCB3ZSBjYW4gcmVtb3ZlIHRoaXMKPiBwYWNrYWdlKSB3ZSBqdXN0IG5lZWQgdG8ga25v
dyB0aGUgbmFtZSBvZiB0aGUgZmlsZSB3ZSBzaG91bGQgY29weSBiYXNlZCBvbiBUSSBLMwo+IFNv
QyBhbmQgU2VjdXJpdHkgdHlwZSBzZWxlY3Rpb24uCj4KPiBjb25maWcgQlIyX1BBQ0tBR0VfVElf
SzNfVElCT09UM19CSU4KPiAgICAgICAgIHN0cmluZwo+ICAgICAgICAgZGVmYXVsdCAidGlib290
My1hbTYyYXgtZ3AtZXZtLmJpbiIgaWYgQlIyX1BBQ0tBR0VfVElfSzNfU09DX0FNNjJBWCAmJgo+
IEJSMl9QQUNLQUdFX1RJX0szX1NFQ1RZUEVfR1AKPiAgICAgICAgIGRlZmF1bHQgInRpYm9vdDMt
YW02MmF4LWhzLWV2bS5iaW4iIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTYyQVggJiYKPiBC
UjJfUEFDS0FHRV9USV9LM19TRUNUWVBFX0hTCj4gICAgICAgICBkZWZhdWx0ICJ0aWJvb3QzLWFt
NjJheC1ocy1mcy1ldm0uYmluIiBpZiBCUjJfUEFDS0FHRV9USV9LM19TT0NfQU02MkFYICYmCj4g
QlIyX1BBQ0tBR0VfVElfSzNfU0VDVFlQRV9IU19GUwo+IC4uLgo+Cj4gIGRlZmluZSBUSV9LM19S
NV9MT0FERVJfSU5TVEFMTF9JTUFHRVNfQ01EUwo+ICAgICAgICAgY3AgJChARCkvc3BsL3UtYm9v
dC1zcGwuYmluICQoQklOQVJJRVNfRElSKS9yNS11LWJvb3Qtc3BsLmJpbgo+ICAgICAgICAgY3Ag
JChARCkvJChCUjJfUEFDS0FHRV9USV9LM19USUJPT1QzX0JJTikgJChCSU5BUklFU19ESVIpL3Rp
Ym9vdDMuYmluCj4gIGVuZGVmCj4KPiBTbyB3ZSBjYW4gYXZvaWQgdXNpbmcgY29tcGxleCBmaW5k
IC1yZWdleCAtZXhlYyAtY3AgY29tbWFuZCA6KQo+Cj4gQlIyX1BBQ0tBR0VfVElfSzNfVElCT09U
M19CSU4gY2FuIGJlIGRlZmluZWQgaW4gdGktazMtcjUtbG9hZGVyIHBhY2thZ2UuCgpTdXJlLCBm
b3IgbWUgaXQncyBmaW5lLgoKSG93ZXZlciwgdGhpcyBpcyBhbiBhZGRpdGlvbmFsIHBhdGNoIHRv
IGFkZCB0aGF0IGlzbid0IG5lY2Vzc2FyeSBhdCB0aGlzIG1vbWVudC4KQ2FuIHdlIGNvbnNpZGVy
IGFkZGluZyBpdCBhZnRlciB0aGlzIHNlcmllcyBoYXMgYmVlbiBtZXJnZWQ/IEkgcmVjYWxsCnRo
YXQgY3VycmVudGx5IHRoZSBjb21waWxhdGlvbiBvZgp0aGUgSHMgYW5kIEhTLUZTIHZhcmlhbnRz
IGZvciBhbTYyeCBhcmUgYnJva2VuLiBUaGVyZWZvcmUsIGhhdmluZwp2ZXJpZmllZCB3aXRoIEFu
ZHJlYXMgdGVzdHMgdGhhdCB0aGUKY2hhbmdlcyBtYWRlIGluIHRoaXMgc2VyaWVzIGFyZSBva2F5
IGZvciBhbTYyeF9za19kZWZjb25maWcgYW5kCmFtNjR4X3NrX2RlZmNvbmZpZywgSSB3b3VsZCBt
ZXJnZQp0aGUgc2VyaWVzIGFzIHNvb24gYXMgcG9zc2libGUgYW5kIHRoZW4gcHJvY2VlZCB3aXRo
IGltcGxlbWVudGluZwpmdXJ0aGVyIGltcHJvdmVtZW50cy4KClNvLCBteSBpbnRlbnRpb24gaXMg
dG8gc3VibWl0IHZlcnNpb24gOSB3aXRoIHRoZSBvbmx5IGNoYW5nZSBiZWluZyB0aGUKc3F1YXNo
IG9mIHRoaXMgcGF0Y2ggdG8gW1BBVENIIDIxLzIzXQoiY29uZmlncy90aV9hbTY0eF9za19kZWZj
b25maWc6IGJ1bXAgVS1Cb290IHZlcnNpb24gdG8gMjAyNC4wMSIuCgpEbyB5b3UgYWdyZWU/CgpU
aGFua3MgYW5kIHJlZ2FyZHMsCkRhcmlvCgo+Cj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+Cj4K
PiA+Cj4gPiBGdXJ0aGVybW9yZSwgaWYgSSdtIG5vdCBtaXNzaW5nIGFueXRoaW5nLCB0aGlzIHJl
bWFpbnMgdGhlIG9ubHkKPiA+IGFkanVzdG1lbnQgd2UgbmVlZCB0byBtYWtlIHNpbmNlIHRoZXJl
IGFyZSBubwo+ID4gb3RoZXIgY29uZmlndXJhdGlvbnMgaW4gYnVpbGRyb290IGFtb25nIHRob3Nl
IHlvdSBsaXN0ZWQuIFNvLCBpbiBteQo+ID4gaHVtYmxlIG9waW5pb24sIGZvciBub3csIHRoaXMg
c2hvdWxkIGJlIGZpbmUuCj4gPgo+ID4gU28sIHBsZWFzZSBsZXQgbWUga25vdyBpZiwgaW4gYWRk
aXRpb24gdG8gc3F1YXNoaW5nIHRoaXMgcGF0Y2ggaW50bwo+ID4gIlsyMS8yM10gY29uZmlncy90
aV9hbTY0eF9za19kZWZjb25maWc6Cj4gPiBidW1wIFUtQm9vdCB2ZXJzaW9uIHRvIDIwMjQuMDEi
LCBJIG5lZWQgdG8gbWFrZSBhbnkgb3RoZXIgYWRqdXN0bWVudHMKPiA+IGZvciB2ZXJzaW9uIDku
Cj4gPgo+ID4gVGhhbmtzIGFuZCByZWdhcmRzLAo+ID4gRGFyaW8KPiA+Cj4gPj4gQmVzdCByZWdh
cmRzLAo+ID4+IFJvbWFpbgo+ID4+Cj4gPj4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogRGFy
aW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4+Pgo+
ID4+PiAtLS0KPiA+Pj4KPiA+Pj4gQWRkZWQgaW4gdjgKPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1i
eTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+
ID4+PiAtLS0KPiA+Pj4gIHBhY2thZ2UvdGktazMvQ29uZmlnLmluIHwgMyArKy0KPiA+Pj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pj4KPiA+Pj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvdGktazMvQ29uZmlnLmluIGIvcGFja2FnZS90aS1rMy9Db25m
aWcuaW4KPiA+Pj4gaW5kZXggYjg1NDViN2JjYTYyLi45YzYxZjg4ODBhMTUgMTAwNjQ0Cj4gPj4+
IC0tLSBhL3BhY2thZ2UvdGktazMvQ29uZmlnLmluCj4gPj4+ICsrKyBiL3BhY2thZ2UvdGktazMv
Q29uZmlnLmluCj4gPj4+IEBAIC00Myw3ICs0Myw4IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9USV9L
M19TT0MKPiA+Pj4gICAgICAgc3RyaW5nCj4gPj4+ICAgICAgIGRlZmF1bHQgImFtNjJheCIgaWYg
QlIyX1BBQ0tBR0VfVElfSzNfU09DX0FNNjJBWAo+ID4+PiAgICAgICBkZWZhdWx0ICJhbTYyeCIg
IGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTYyWAo+ID4+PiAtICAgICBkZWZhdWx0ICJhbTY0
eCIgIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTY0WAo+ID4+PiArICAgICBkZWZhdWx0ICJh
bTY0eCIgIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTY0WCAmJiBCUjJfUEFDS0FHRV9USV9L
M19TRUNUWVBFX0dQCj4gPj4+ICsgICAgIGRlZmF1bHQgImFtNjR4X3NyMiIgIGlmIEJSMl9QQUNL
QUdFX1RJX0szX1NPQ19BTTY0WCAmJiAhQlIyX1BBQ0tBR0VfVElfSzNfU0VDVFlQRV9HUAo+ID4+
PiAgICAgICBkZWZhdWx0ICJhbTY1eCIgIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTY1WAo+
ID4+Pgo+ID4+PiAgY29uZmlnIEJSMl9QQUNLQUdFX1RJX0szX1NFQ1RZUEUKPiA+Pgo+ID4KPiA+
Cj4KCgotLQoKRGFyaW8gQmluYWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIK
CmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUg
MzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0Bh
bWFydWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
