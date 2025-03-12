Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A78C28B2E
	for <buildroot@archiver.kernel.org>; Wed, 12 Mar 2025 04:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D07DA605B7;
	Wed, 12 Mar 2025 04:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZzP9_Tg4TGV; Wed, 12 Mar 2025 04:40:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F357D60BB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F357D60BB7;
	Wed, 12 Mar 2025 04:40:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E29C61C8
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 04:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6C6C811B6
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 04:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YE6RdSpudT9F for <buildroot@buildroot.org>;
 Wed, 12 Mar 2025 04:40:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com;
 envelope-from=kanakshilledar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3B5B8107F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3B5B8107F
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3B5B8107F
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 04:40:44 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2ff73032ac0so1514293a91.3
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 21:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741754444; x=1742359244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sIDsyONc9nlb6jW/MDsbX7bhiuSz8ivF6oTvJuFpB/k=;
 b=qi7wenN0TvaHMN+3H5RD1HFG+8CPYt6OJLa23e9Io8pWYB2k/dlDaHBIfQZCc/y1wl
 89LhqH5E7aHrkytUTuutq/3ZzB1v+JtkfV09jrqF1N88M62BScIlcf07JmSPNs/zFQt2
 B4vgE6IwLv77lFjLYkvSdXoDXfY0E7i6zsJaZZql7Vz/Ior1mZb8q5zjkKglgF/Nwjjf
 JLkAsuiBfAzT3tM2yFnNcEEJDj2fFbRd9rjU5WMzhIE1bl9CJEIQO0RzOBZe/BT8gA1v
 lLnETBPmtTBge7IbEKxb/6j87lwlR6n8f/dtP7+aYYsW8l21Fu+JJq8iDePskbt+VpKp
 6/1Q==
X-Gm-Message-State: AOJu0Yw2cjX87WfllkNHkz2p8aIfpP2LG9BPkNT964vSORRSk23kauTj
 V33rqg/ZTEmdcrsSWxX9PdMEpMpjUR/29lB3q+zhga3sCvIXVciDleq69xq80rPwC5dR28RpYQr
 Fu+9mGWd8ZD03wfQbak6srWAvJKI=
X-Gm-Gg: ASbGncs5OOI/JrxnSGaMRAs/6Xe868mU5MnL3hWVJFhfyMh3nna6Jvwo0IK9cEhRNPp
 zv8eCVBwZ1Gizh8ddhryJNXhqqu9mM0QUDS1V3ZriiJrYXY8Urzjm3QwExwygpuoKljKIeShPzO
 Ibd2DaxTc+dbhqeQUt48m7qZP12zg=
X-Google-Smtp-Source: AGHT+IHUSLOON3w2W4cdqnPtP2xGoLqexmsLUAYHMgltsK5ylbAwbjIZgtMx9CQldYuHA3X/v9oxkPG6Gy9yZAmiwFk=
X-Received: by 2002:a17:90b:1d0b:b0:2ff:7c5a:216d with SMTP id
 98e67ed59e1d1-300ff90db80mr3036701a91.5.1741754444039; Tue, 11 Mar 2025
 21:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250309130230.1520839-2-kanakshilledar@gmail.com>
 <20250309130230.1520839-4-kanakshilledar@gmail.com>
 <704fcc5d132c37da06f4d21cf24b418f@free.fr>
In-Reply-To: <704fcc5d132c37da06f4d21cf24b418f@free.fr>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Wed, 12 Mar 2025 10:10:32 +0530
X-Gm-Features: AQ5f1JoVLnnl_QykaKYlVuFxZypRyRRQu2vXhytxPrVpqst4XZp0wmsGqmz1LcA
Message-ID: <CAGLn_=vy6gt_qjRaCPLndATJNBH1sxWK4D+xmFaRychAqxeZ0g@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Damien Le Moal <dlemoal@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741754444; x=1742359244; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sIDsyONc9nlb6jW/MDsbX7bhiuSz8ivF6oTvJuFpB/k=;
 b=BFmMYQwCRS5aO77Esxiwa6YBETzYKSfuP+vnSwWjgTfA8kpfTyfF3LQeamofhWExJl
 S9i7R0UFFyMGOOxpALe3i2c5thkk4amAnoqiNNZGc2r8qCzqp+8QrpVtXneB2dRQ8JWG
 wXPUc4RFA2DdlfsZ6rCQPHV9FSbjAq3OBahNG72NggJxmxRr8TBvUubyniBZOVspHzVZ
 pCk2WxjFLIkWjjX8daczzViVeKdJX0u/Iizk3Mh751CTvUIiqB/2B5I2tbrkzjCL9K3Q
 rwOD8uXfvaTKMg5uXz4c/v9zhWF3mtFhcCv4FBtpfO6wNdVESMtLI3Fc/jFhfbyqVOWt
 Cm1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BFmMYQwC
Subject: Re: [Buildroot] [PATCH v2 1/2] package/sipeed-lpi4abin: add
 licheepi4a boot bins
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

SGkgSnVsaWVuLApUaGFuayB5b3UgZm9yIGFjY2VwdGluZyB0aGUgcGF0Y2ggc2VyaWVzIGFuZCBm
b3IgdGVzdGluZyBpdCBvbiB0aGUgYm9hcmQuCkkgYXBwcmVjaWF0ZSB0aGUgcmVmaW5lbWVudHMg
YW5kIGRvY3VtZW50YXRpb24gdXBkYXRlcyB5b3UgbWFkZS4gVGhlCmNoYW5nZXMgbG9vayBncmVh
dCEKClRoYW5rcyBhbmQgUmVnYXJkcywKS2FuYWsgU2hpbGxlZGFyCgpPbiBXZWQsIE1hciAxMiwg
MjAyNSBhdCAxOjQx4oCvQU0gSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gd3JvdGU6Cj4K
PiBIaSBLYW5haywKPgo+IE9uIDA5LzAzLzIwMjUgMTQ6MDIsIEthbmFrIFNoaWxsZWRhciB3cm90
ZToKPiA+IFNpcGVlZCBMaWNoZWVQaSA0QSByZXF1aXJlcyBzb21lIHByb3ByaWV0YXJ5IGJpbmFy
aWVzCj4gPiBmb3IgYm9vdGluZywgdGhlc2UgYXJlIHByb3ZpZGVkIGluIHRoZSB0aDE1MjAtYm9v
dC1maXJtd2FyZQo+ID4gcmVwbyBbMV0uIFRoZXNlIGJpbmFyaWVzIGFyZSBhbHNvIHJlcXVpcmVk
IGZvciB0aGUgb25ib2FyZAo+ID4gc291bmQgYW5kIHdpZmkuCj4gPgo+ID4gWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9yZXZ5b3MvdGgxNTIwLWJvb3QtZmlybXdhcmUKPgo+IEkgYXBwbGllZCB0aGlz
IHBhdGNoIHNlcmllcyB0byBuZXh0LCB0aGFua3MhCj4KPiBJIHdhcyBhYmxlIHRvIGdldCBhY2Nl
c3MgdG8gdGhpcyBib2FyZCwgc28gSSBjb3VsZCBhY3R1YWxseSBydW50aW1lCj4gdGVzdCB0aG9z
ZSBwYXRjaGVzLiBXaGlsZSBkb2luZyBzbywgSSBkaWQgZmV3IG1pbm9yIGNoYW5nZXMgYW5kIGFk
ZGVkCj4gZXh0cmEgaW5mb3JtYXRpb24gaW4gdGhlIHJlYWRtZS50eHQuCj4KPiBTZWU6Cj4gaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzI5ODYxODMy
YTM4OTc2OTExZDkzMTI1NmU4ZTVhM2FhZDUyNmU3NjEKPiBodHRwczovL2dpdGxhYi5jb20vYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMWFiMzc4OTlhZTdjNzU5NWQzZmMxYWI3MGI2
NzM4OGU2N2U3MGMzMwo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gSnVsaWVuLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
