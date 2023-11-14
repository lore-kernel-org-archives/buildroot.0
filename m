Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2F1C54E69
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 20:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8675C41E27;
	Tue, 14 Nov 2023 20:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8675C41E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VErwt4a1n-zT; Tue, 14 Nov 2023 20:07:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1498417A5;
	Tue, 14 Nov 2023 20:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1498417A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A0751BF5E9
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 20:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2BBC4010F
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 20:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2BBC4010F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjemVlb1V1or for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 20:07:08 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83EAF416E5
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 20:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83EAF416E5
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2c4fdf94666so80692331fa.2
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 12:07:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699992426; x=1700597226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GnYnSleKS9Q027AK/c+GLAsUlD+sHcGXA66RV9XbuIg=;
 b=AYpRG6n88T82vhwc5N0W0ihaAM5ebFFJ0BT763KdxIiXmvaPSCY+4ujAyr0mTcEfN1
 M6APRBkPM/cdlMkUswA/jrgjMXFik7dveHXwwieytITCxEWM9Arz18mrgcOvbIUUuc7t
 4cmQbH9Y/fpjSSxpVEy7QGelfwBSbfp73PMaSVr7gxZrCw0y1k5YogVlEUKiVTVDJ71t
 7Id68YWu92WOBXSFzM5SAoZEiNmOu/4GIjFCZSv2XtGiW6+kbARzNUTijtLatNl8ntga
 Var2kwvqtchWgRFi/GkpLvE99a5/LX1mXC6sQoNsQnqsXzWlPgoeuKyM3Auhi7jO/x2M
 AtPA==
X-Gm-Message-State: AOJu0YwSrtZsUojAfZDaVCiI9EWcrhPx4Nownn7i/cxkJYh9kuUhwiXI
 YyAnHgQGiA7biWLIS9BGGWCSfLMpfLoVXQ==
X-Google-Smtp-Source: AGHT+IEdK968mwJZwQYOniwNY8lNrFJZXvrjrCx+9kYaX5Ep1BTqYaeET9qcbXi93LLRWKCuDRvviQ==
X-Received: by 2002:a2e:a4ba:0:b0:2c8:3b12:776d with SMTP id
 g26-20020a2ea4ba000000b002c83b12776dmr2387288ljm.6.1699992425644; 
 Tue, 14 Nov 2023 12:07:05 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178]) by smtp.gmail.com with ESMTPSA id
 y13-20020a2e544d000000b002bcedacd726sm1530920ljd.25.2023.11.14.12.07.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 12:07:05 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2c79d8b67f3so67434621fa.0
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 12:07:05 -0800 (PST)
X-Received: by 2002:a2e:3208:0:b0:2c6:f6eb:b396 with SMTP id
 y8-20020a2e3208000000b002c6f6ebb396mr2662470ljy.40.1699992424904; Tue, 14 Nov
 2023 12:07:04 -0800 (PST)
MIME-Version: 1.0
References: <20231001165218.1960930-3-thomas.devoogdt@barco.com>
 <20231110164617.569602-1-thomas@devoogdt.com>
 <20231110164617.569602-3-thomas@devoogdt.com>
 <20231114151118.GF1974649@igalia.com>
In-Reply-To: <20231114151118.GF1974649@igalia.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 14 Nov 2023 21:06:53 +0100
X-Gmail-Original-Message-ID: <CACXRmJjSErFeRc2TwopyzemtPk9t3TXS3L1cM=gOgqoR91erog@mail.gmail.com>
Message-ID: <CACXRmJjSErFeRc2TwopyzemtPk9t3TXS3L1cM=gOgqoR91erog@mail.gmail.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH v5 3/3] package/webkitgtk: bump to version
 2.42.2
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWRyaWFuLAoKVGh4IGZvciB0aGUgcmV2aWV3IQpBcmUgeW91IHN1cmUgdGhhdCB0aGlzIHBh
dGNoIGlzIHN0aWxsIHByZXNlbnQsIGFuZCBub3QganVzdCBhIGxlZnRvdmVyCm9uIHlvdXIgc3Rh
c2g/IEknbSB0cnlpbmcgdG8gZmluZCBvdXQgd2hpY2ggcGF0Y2ggdGhpcyBpcyBhYm91dCwgYnV0
IEkKZG9uJ3Qgc2VlIGl0LgoKQ2hlY2tlZCBieSBkb2luZzoKIDExNzMgIGdpdCBjbGVhbiAtZmR4
CiAxMTc0ICBnaXQgZmV0Y2gKIDExNzUgIGdpdCBjaGVja291dCBvcmlnaW4vbWFzdGVyCiAxMTc2
ICBjdXJsIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvc2VyaWVzLzM4MTY1Ni9tYm94LyB8
IGdpdCBhbQogMTE3NyAgbHMgcGFja2FnZS93ZWJraXRndGsvCgpLciwKClRob21hcyBEZXZvb2dk
dAoKT3AgZGkgMTQgbm92IDIwMjMgb20gMTQ6MTEgc2NocmVlZiBBZHJpYW4gUGVyZXogZGUgQ2Fz
dHJvIDxhcGVyZXpAaWdhbGlhLmNvbT46Cj4KPiBIaSBUaG9tYXMsCj4KPiBUaGFua3MgZm9yIHRo
ZSBwYXRjaCBzZXQgd2l0aCB0aGUgZml4ZXMgYW5kIHRoZSB1cGRhdGUgdG8gMi40Mi54LCBJIGhh
dmUKPiByZXZpZXdlZCBhbmQgdGVzdGVkIHRoZSBvdGhlciB0d28gcGF0Y2hlcyAodGhleSBhcmUg
Z29vZCEpIGJ1dCB0aGlzIG9uZQo+IG5lZWRzIG9uZSBtb3JlIGNoYW5nZSBiZWZvcmUgaXQgY2Fu
IGJlIG1lcmdlZCwgcGxlYXNlIHJlYWQgdGhlIGNvbW1lbnQKPiBiZWxvdy4KPgo+IE9uIEZyaSwg
MTAgTm92IDIwMjMgMTc6NDY6MTcgKzAxMDAgVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2b29n
ZHQuY29tPiB3cm90ZToKPiA+IFVwZGF0ZSB0byBhIG5ldyBtYWpvciByZWxlYXNlLgo+ID4KPiA+
IFJlbGVhc2Ugbm90ZXM6Cj4gPgo+ID4gaHR0cHM6Ly93ZWJraXRndGsub3JnLzIwMjMvMDkvMTUv
d2Via2l0Z3RrMi40Mi4wLXJlbGVhc2VkLmh0bWwKPiA+IGh0dHBzOi8vd2Via2l0Z3RrLm9yZy8y
MDIzLzA5LzI3L3dlYmtpdGd0azIuNDIuMS1yZWxlYXNlZC5odG1sCj4gPiBodHRwczovL3dlYmtp
dGd0ay5vcmcvMjAyMy8xMS8xMC93ZWJraXRndGsyLjQyLjItcmVsZWFzZWQuaHRtbAo+ID4KPiA+
IFNlY3VyaXR5IG5vdGVzOgo+ID4KPiA+IGh0dHBzOi8vd2Via2l0Z3RrLm9yZy9zZWN1cml0eS9X
U0EtMjAyMy0wMDA4Lmh0bWwKPiA+Cj4gPiAtIFVTRV9KUEVHWEwgaXMgZW5hYmxlZCBieSBkZWZh
dWx0IG5vdyBbMV0sIHNvIGFkZCBhIGxpYmp4bCBpZiB1c2VkLgo+ID4KPiA+IC0gRU5BQkxFX0dM
RVMyIGhhcyBiZWVuIGRyb3BwZWQsIHNvIGRyb3AgaXQgYWxzbyBoZXJlIFsyXS4KPiA+ICAgSW5z
dGVhZCwgZW5hYmxlIFVTRV9PUEVOR0xfT1JfRVMgaWYgbGliZ2xlcyBpcyBwcmVzZW50LiBCZXdh
cmUgdGhhdCBhbHNvCj4gPiAgIGxpYmVnbCBpcyBuZWVkZWQgZm9yIFVTRV9PUEVOR0xfT1JfRVMs
IGJ1dCB0aGF0IG9uZSBpcyBtb3N0IG9mIHRoZSB0aW1lIGEKPiA+ICAgZGVwZW5kZW5jeSBmb3Ig
bGliZ2xlcywgc28gbGVhdmUgaXQgb3V0IGhlcmUuCj4gPgo+ID4gLSBBbHNvIHJhaXNlIHRoZSBt
aW5pbWFsIEdDQyB2ZXJzaW9uIHRvIDEwLjIsIHdoaWNoIGlzIHJlcXVpcmVkIHNpbmNlIHdlYmtp
dGd0ay0yLjQyLnggWzNdLgo+ID4gICBTaW1pbGFyIHRvIGNvbW1pdCBlYzFmZjgwMmRmOWEwZjE3
ZGQyYjczNGJhNTM2YTVlMjA2YWE1YWE0LAo+ID4gICB3ZSBkbyBjaGVjayBvbiA+PSBHQ0MgMTAs
IGJlY2F1c2Ugd2UgY2FuJ3QgY2hlY2sgb24gPj0gR0NDIDEwLjIuCj4gPgo+ID4gWzFdIGh0dHBz
Oi8vZ2l0aHViLmNvbS9XZWJLaXQvV2ViS2l0L2NvbW1pdC85Mzg2NTQxNGYzMzE5MGM1N2UyOTNh
ODA0OTJlMTBlZGM0NjFkN2YwCj4gPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL1dlYktpdC9XZWJL
aXQvY29tbWl0L2NmZTkxN2ZlYzQ1YmY3MmMzNzEwODdlY2UwMzRmZWVlODQ1NGYxYjQKPiA+IFsz
XSBodHRwczovL2dpdGh1Yi5jb20vV2ViS2l0L1dlYktpdC9jb21taXQvMTMzNDk4YWFlZThmNDQ0
NDNkOWUzYjJhMDhiZTRhNGI3N2I5M2ZjOQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBE
ZXZvb2dkdCA8dGhvbWFzLmRldm9vZ2R0QGJhcmNvLmNvbT4KPiA+IC0tLQo+ID4gIHYyOiBuL2EK
PiA+ICB2MzoKPiA+ICAtIHJlcGxhY2UgZm9yIHBhY2thZ2Uvd2Via2l0Z3RrOiBhZGQgYSBVU0Vf
T1BFTkdMX09SX0VTIGNvbmZpZyBvcHRpb24KPiA+ICAtIDIuNDIuMCBuZWVkcyBhbiBleHRyYSBi
dW5jaCBvZiBwYXRjaGVzLCBzbyBidW1wIHRvIGltbWVkaWF0ZWx5IHRvIDIuNDIuMQo+ID4gIHY0
Ogo+ID4gIC0gZml4ZWQgaW5jb21wbGV0ZSBnaXQgbWFzc2FnZSAoYSBfX19fIGxpbmUgc3BsaXRz
IHRoZSBnaXQgbWVzc2FnZSBhcHBhcmVudGx5KQo+ID4gIC0gcmUtYWRkZWQgcGF0Y2hlcyB3aXRo
IHVwc3RyZWFtIGNoZXJyeS1waWNrIGFuZCBoYXNoCj4gPiAgdjU6Cj4gPiAgLSAyLjQyLjEgbmVl
ZHMgYW4gZXh0cmEgYnVuY2ggb2YgcGF0Y2hlcywgc28gYnVtcCB0byBpbW1lZGlhdGVseSB0byAy
LjQyLjIKPgo+IFBhdGNoICIwMDAyLVdQRS1HVEstRXh0ZW5zaW9uc0dMT3BlbkdMRVMuY3BwLXVz
ZXMtR0xFUzMtc3ltYm9scy0ucGF0Y2giIGFsc28KPiBuZWVkcyB0byBiZSByZW1vdmVkOiBpdCBk
b2VzIG5vdCBhcHBseSBiZWNhdXNlIHRoZSBmaXggaGFzIGJlZW4gaW1wb3J0ZWQKPiB1cHN0cmVh
bSBhbmQgaXMgcGFydCBvZiB0aGUgMi40Mi54IHJlbGVhc2VzLgo+Cj4gPiAtLS0KPiA+ICAuLi5l
LXdoZW4tZ3N0cmVhbWVyLXN1cHBvcnQtaXMtZGlzYWJsZWQucGF0Y2ggfCAzNiAtLS0tLS0tLS0t
LS0tLS0tLS0tCj4gPiAgcGFja2FnZS93ZWJraXRndGsvQ29uZmlnLmluICAgICAgICAgICAgICAg
ICAgIHwgIDYgKystLQo+ID4gIHBhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoICAgICAg
ICAgICAgICB8ICA2ICsrLS0KPiA+ICBwYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsgICAg
ICAgICAgICAgICAgfCAxNiArKysrKystLS0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQo+ID4KPiA+IFsuLi5dCj4KPiBDaGVlcnMsCj4g4oCU
QWRyacOhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
