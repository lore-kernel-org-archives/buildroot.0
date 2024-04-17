Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD749C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 18:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46B16404F5;
	Wed, 17 Apr 2024 18:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPakg1T6bIbq; Wed, 17 Apr 2024 18:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81F5A4027D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81F5A4027D;
	Wed, 17 Apr 2024 18:41:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80AC21BF423
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 18:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B08D4027D
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 18:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnXz9Shc8-wU for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 18:41:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD7BD40108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD7BD40108
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD7BD40108
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 18:41:03 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-570441bc23bso47764a12.0
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 11:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713379261; x=1713984061;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z997bqXS9spYRHWjiXTxVbBtvOwZ5jhFyHGAknR9s84=;
 b=fcIhIcB0my39avEaMTp7Ik5HrUdMzaN9rKZ7QDx6qvyMN2War3MMpupzN0zGoVz9NY
 2AD+s01vTlCPVIVNj31UiGmBtTqtwsHxTMb7PgVJDLVwNssEGdlSK3D4X6seR1s6afuE
 bV3/QkbDj018UrWzyoKRadARf/z1aZiWFnh0NmFdihWyvsAE1UQHbSi1s85EV3koJMVi
 KTnX7fySu2lVAb8gm/pot6wn6HsoWi2uGkQwcEJuXGfDpFBF6v5FkDjoT0+OM7K4OQXC
 IxbqVWBzUVXr9oCwmgvSjk8fisM8b+nGgJqK9ZWFRC8mYbVXXDLxGHATyQW2mWZimKcp
 dSTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWUIsEZyg9Gsi1IOy21Nc7U6qcNKxM/BxVCcixwUmS60isuq7D/FvasV7tybDdWP/zSxCjLLYaeepQOGu8votZ+fx9/Ldftw==
X-Gm-Message-State: AOJu0Yx4X5b8TbwI8T3VS3RGxVdY6qMlLA5c4s16nKOwXX2Bfd0Q8+LP
 hd7l7Dm3TwvKOG8aVqlq7fqZPMM3aig5KgM/WHNvWHNQstQAW1AwXTHRipTufo3B8xC82LvgDeH
 NlFwpAGyLTqM130pabcbYh86cGKa24AKdgqgZM4D5svxlyLUfgJxMgg==
X-Google-Smtp-Source: AGHT+IFCrmKIsYM4/FAkGmQdcmCWp6Tz0yvPQbB/FlQxaemK8EChEMJbvzi92olGv05naPaQKS25GvF67Wsap9RL5aM=
X-Received: by 2002:a50:cd5b:0:b0:570:2198:b3ca with SMTP id
 d27-20020a50cd5b000000b005702198b3camr324296edj.14.1713379261423; Wed, 17 Apr
 2024 11:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
 <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
 <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
 <CAOf5uwmQBtHf9w7vjxyxDjFuaQj=uv4a0OpLHJ1MNg5V3PjNwQ@mail.gmail.com>
 <37ec60b9-d7db-440c-a8d4-2993ae9c6a16@yahoo.com>
 <CAOf5uwmOi0V7t7GmwNvrwy8qoKyVnaGJziwZhqPd2jCAZMK5EQ@mail.gmail.com>
In-Reply-To: <CAOf5uwmOi0V7t7GmwNvrwy8qoKyVnaGJziwZhqPd2jCAZMK5EQ@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 17 Apr 2024 20:40:50 +0200
Message-ID: <CAOf5uwkmcuBvXSp0oHuCXQX+HqNP6O52QEvxTWm0hEnF=W2eNw@mail.gmail.com>
To: DTrustee <dterry_engineer@yahoo.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713379261; x=1713984061;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z997bqXS9spYRHWjiXTxVbBtvOwZ5jhFyHGAknR9s84=;
 b=nt8O5CDMwSPEAZK3oPHwdsna+rEY2NCS7TIOUSjgZLlPnCZnwVGR99FrC8uZy1ksBZ
 tQUYSdXxx4H7zFZ+QUJragAvlbxyLj6S17/MA/fupyHGtghAAheioALcDBLGJq4lFACS
 hKrDz/GM/hLxsNDcjFoXRkup+48rPwfd5fZzc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nt8O5CDM
Subject: Re: [Buildroot] Problem with device tree
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
Cc: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkKCk9uIFdlZCwgQXByIDE3LCAyMDI0IGF0IDg6MznigK9QTSBNaWNoYWVsIE5henphcmVubyBU
cmltYXJjaGkKPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+Cj4gSGkKPgo+
IE9uIFdlZCwgQXByIDE3LCAyMDI0IGF0IDg6MjbigK9QTSBEVHJ1c3RlZSA8ZHRlcnJ5X2VuZ2lu
ZWVyQHlhaG9vLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSSBhbSBidWlsZGluZyBmb3IgdGhlIEJlYWds
ZWJvbmUgQmxhY2sgd2hpY2ggaXMgY29udmVuaWVudCBhcyB0aGUKPiA+IEJvb3RsaW4gdHJhaW5p
bmcgdXNlcyB0aGUgd2lyZWxlc3MgdmVyc2lvbiBvZiB0aGF0IGJvYXJkLiBJIGhvcGUgSSBhbQo+
ID4gZG9pbmcgdGhlIHJpZ2h0IHRoaW5nIGJ5IGluY2x1ZGluZyBldmVyeW9uZSBvbiB0aGUgYWRk
cmVzcyBsaXN0IG9mIHRoaXMKPiA+IHRocmVhZCwgZG9uJ3Qgd2FudCB0byBmaWxsIHVwIHBlb3Bs
ZSdzIGluYm94IG5lZWRsZXNzbHkuCj4gPgo+Cj4gUGxlYXNlIHByb3ZpZGUgdGhlIHN0ZXBzIGhl
cmUKCm1ha2UgYmVhZ2xlYm9uZV9kZWZjb25maWcKCm1ha2UKClJpZ2h0Pwo+Cj4gTWljaGFlbAo+
Cj4gPiBIYXZlIGEgQmxlc3NlZCBkYXkhCj4gPgo+ID4gRG9uCj4gPgo+ID4gT24gNC8xNy8yNCAx
MToyOSBBTSwgTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpIHdyb3RlOgo+ID4gPiBIaQo+ID4g
Pgo+ID4gPiBPbiBXZWQsIEFwciAxNywgMjAyNCBhdCA2OjI14oCvUE0gRFRydXN0ZWUgdmlhIGJ1
aWxkcm9vdAo+ID4gPiA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+ID4gPj4gSSBr
bm93IHlvdSBhcmUgYWxsIGJ1c3ksIGRvbid0IG1lYW4gdG8gYnVnIGFueW9uZSBidXQgSSBjYW5u
b3QgZ2V0Cj4gPiA+PiBidWlsZHJvb3QgdG8gbWFrZSB3aXRob3V0IGVycm9ycy4gSSBoYXZlIG5v
IGlkZWEgd2h5ICJvcGVyYXRvciAnPCcgaGFzCj4gPiA+PiBubyBsZWZ0IG9wZXJhbmQiIGlzIGdl
bmVyYXRlZCBvciB3aGljaCBpbmNsdWRlIGZpbGUgaXMgdGhlIGNhdXNlLiBJCj4gPiA+PiB0cnVs
eSBhcHByZWNpYXRlIHlvdXIgaGVscC4gSXMgdGhlcmUgZG9jdW1lbnRhdGlvbiB0aGF0IHdhbGtz
IHRocm91Z2gKPiA+ID4+IHRoZSBidWlsZCBwcm9jZXNzPyBJIGhhdmUgbG9va2VkIGF0IHRoZSBC
b290bGluIHRyYWluaW5nIGJ1dCBpdCBpcwo+ID4gPj4gc2V2ZXJhbCB5ZWFycyBvbGQgbm93IGFu
ZCBvdXQgb2YgZGF0ZS4KPiA+ID4gWW91IGFyZSB0cnlpbmcgdG8gYnVpbGQgYSB1Ym9vdCBib2Fy
ZCB0aGF0IGhhcyBub3QgaW5jbHVkZSBvZiB0aGUKPiA+ID4gS2NvbmZpZyBvZiBpdC4gIEkgdGhp
bmsgdGhhdCB5b3UKPiA+ID4gaGF2ZSBqdXN0IGEgYnJva2VuIHVib290LiBXaGF0IGNvbmZpZ3Vy
YXRpb24gb3IgYm9hcmQgYXJlIHlvdSBidWlsZGluZz8KPiA+ID4KPiA+ID4gTWljaGFlbAo+ID4g
Pgo+ID4gPgo+ID4gPj4gQnVpbGRsb2cgaXMKPiA+ID4+Cj4gPiA+PiBodHRwczovL3Bhc3RlYmlu
LmNvbS9FcXQ2emk5YQo+ID4gPj4KPiA+ID4+IGNvbmZpZyBpcwo+ID4gPj4KPiA+ID4+IGh0dHBz
Oi8vcGFzdGViaW4uY29tLzhQMmhCOXVZCj4gPiA+Pgo+ID4gPj4gYnVpbGRyb290IDIwMjQuMDIu
MQo+ID4gPj4KPiA+ID4+IEhhdmUgYSBCbGVzc2VkIGRheSEKPiA+ID4+Cj4gPiA+PiBEb24KPiA+
ID4+Cj4gPiA+Pgo+ID4gPj4KPiA+ID4+IE9uIDQvOS8yNCA0OjU5IFBNLCBHaXVsaW8gQmVuZXR0
aSB3cm90ZToKPiA+ID4+PiBIaSBEb24sCj4gPiA+Pj4KPiA+ID4+PiBPbiAwOS8wNC8yNCAyMzoy
MywgRG9uIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gPiA+Pj4+IFRoaXMgaXMgbXkgZmlyc3QgdGlt
ZSB1c2luZyBidWlsZHJvb3QuIEZvbGxvd2luZyB0aGUgaW5zdHJ1Y3Rpb25zIG9mCj4gPiA+Pj4+
IGJvb3RsaW4uY29tL2RvYy90cmFpbmluZy9idWlsZHJvb3QvYnVpbGRyb290LWxhYnMucGRmLCBi
dWlsZGluZyBmb3IKPiA+ID4+Pj4gQmVhZ2xlYm9uZSBCbGFjayB0aG91Z2ggbm90IHRoZSB3aXJl
bGVzcyBvZiB0aGUgdHJhaW5pbmcgcGRmLiBVbmRlcgo+ID4gPj4+PiBLZXJuZWwgLSBzZWxlY3Rl
ZCBkZXZpY2UgdHJlZSBibG9iIGFuZCBpbi10cmVlIGRldmljZSB0cmVlIG5hbWUgSSBwdXQKPiA+
ID4+Pj4gYW0zMzV4LWJvbmVibGFjay4gSG93ZXZlciBJIGdldAo+ID4gPj4+Pgo+ID4gPj4+PiBE
ZXZpY2UgVHJlZSBTb3VyY2UgKGFyY2gvYXJtL2R0cy9hbTMzNXgtLmR0YikgaXMgbm90IGNvcnJl
Y3RseQo+ID4gPj4+PiBzcGVjaWZpZWQuCj4gPiA+Pj4+IFBsZWFzZSBkZWZpbmUgJ0NPTkZJR19E
RUZBVUxUX0RFVklDRV9UUkVFJwo+ID4gPj4+PiBvciBidWlsZCB3aXRoICdERVZJQ0VfVFJFRT08
ZGV2aWNlX3RyZWU+JyBhcmd1bWVudAo+ID4gPj4+Pgo+ID4gPj4+PiBXaGF0IGRvZXMgaXQgd2Fu
dD8gU29tZXRoaW5nIGlzIG1pc3NpbmcgYnV0IEkgZG9uJ3Qga25vdyB3aGF0Lgo+ID4gPj4+IFN0
YXJ0aW5nIGZyb20gIExpbnV4IHZlcnNpb24gNi41WzBdIHlvdSBoYXZlIHRvIHNwZWNpZnkgdGhl
Cj4gPiA+Pj4gbWFudWZhY3R1cmVyIGZvbGRlciB0b28gY29tcGFyZWQgdG8gcHJldmlvdXMgdmVy
c2lvbnMoaS5lLiA2LjRbMV0pLiBTbwo+ID4gPj4+IGlmIHlvdSdyZSB1c2luZyBhIGtlcm5lbCBu
ZXdlciB0aGFuIDYuNSB5b3UgaGF2ZSB0byBzcGVjaWZ5IHNvbWV0aGluZwo+ID4gPj4+IGxpa2U6
Cj4gPiA+Pj4gYXJjaC9hcm0vZHRzL3RpL29tYXAvYW0zMzV4LS5kdGIKPiA+ID4+Pgo+ID4gPj4+
IEhvcGUgdGhpcyBoZWxwcy4KPiA+ID4+Pgo+ID4gPj4+IFswXTogaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjYuNS1yYzEvc291cmNlL2FyY2gvYXJtL2Jvb3QvZHRzCj4gPiA+Pj4g
WzFdOiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni40LjE2L3NvdXJjZS9hcmNo
L2FybS9ib290L2R0cwo+ID4gPj4+Cj4gPiA+Pj4gQmVzdCByZWdhcmRzCj4gPiA+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+ID4gPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+ID4+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+ID4gPgo+
ID4gPgo+Cj4KPgo+IC0tCj4gTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpCj4gQ28tRm91bmRl
ciAmIENoaWVmIEV4ZWN1dGl2ZSBPZmZpY2VyCj4gTS4gKzM5IDM0NyA5MTMgMjE3MAo+IG1pY2hh
ZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4KPiBBbWFydWxhIFNvbHV0aW9ucyBCVgo+IEpvb3AgR2Vlc2lua3dlZyAxMjUsIDExMTQg
QUIsIEFtc3RlcmRhbSwgTkwKPiBULiArMzEgKDApODUgMTExIDkxNzIKPiBpbmZvQGFtYXJ1bGFz
b2x1dGlvbnMuY29tCj4gd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCgoKCi0tIApNaWNoYWVsIE5h
enphcmVubyBUcmltYXJjaGkKQ28tRm91bmRlciAmIENoaWVmIEV4ZWN1dGl2ZSBPZmZpY2VyCk0u
ICszOSAzNDcgOTEzIDIxNzAKbWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCgpBbWFydWxhIFNvbHV0aW9ucyBCVgpKb29wIEdlZXNp
bmt3ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MClQuICszMSAoMCk4NSAxMTEgOTE3Mgpp
bmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
