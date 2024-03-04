Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E987C48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 10:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3BA640BAA;
	Mon,  4 Mar 2024 10:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1HixUKfjNnNG; Mon,  4 Mar 2024 10:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B39D240B99
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B39D240B99;
	Mon,  4 Mar 2024 10:55:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A624C1BF2A7
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 10:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91F9940B99
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 10:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w77--QPNWBgm for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 10:55:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.172;
 helo=mail-lj1-f172.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5240A401CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5240A401CC
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5240A401CC
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 10:55:46 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d33986dbc0so36046451fa.2
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 02:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709549743; x=1710154543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+VCTsmHcyEl7vfjYjieoJ7Rp4j/lZIYLxREd9tMn2WU=;
 b=U40rnfe+VoNvJ3KMX1XYWdxQOYYhT/EETwVuVAHGXToXvAwWwwhyJBkXrBnKYmWEQu
 vs+Tx1BBrM3yXkE9yUIpu08f1qzpGvj1UIeoaxiiEy9ElXSI1eXrzU9mCj+xmCCKVvDf
 Tgg2ABP6wH0d7A1c2whgSufcQKxFvX11nUeZdUfN6xz6DM85eWcKOG1JZuEo6OyP7Ov+
 CTZZ065iZuHldO6Vkwm8e5mXjq/9jCdv8apK2825Ip3VOTqt2C5MC0iwwKdSpNdVGMan
 om6FWHPL5icuhaCDZLGzoY2NFhDeIJ5G1pchL+zxrfNXEQpWXLgIRHK1XrljPq9RGtgy
 cWow==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7dX2oonklvxIpvBQ8T+yLz2Ed8t1MZg0z08W2WoJUI4EMJRPCgUCh6lw3kxkmxUeKgtXOOOYcKdxjsvPQk1NlFaAv4Sjh6A==
X-Gm-Message-State: AOJu0YzriPEQxs1ya3A2wN3Tun4WmfaOmcq2RVN2ouIOutLcGAImH+pA
 6PMhXchR+ieMSazrH/uFahQRbeFPMpdqJ8aNlKKWj5b5V7GRGDBdIiKv4eER
X-Google-Smtp-Source: AGHT+IF+MnbK2D5UZ1rSfDnXfFHCPogPhVdzPGRczkAsx2ac3CpqjEEBW/JJCpGwgE1W/oAZ0kEvzw==
X-Received: by 2002:a2e:8611:0:b0:2d2:3810:552 with SMTP id
 a17-20020a2e8611000000b002d238100552mr6586458lji.53.1709549743359; 
 Mon, 04 Mar 2024 02:55:43 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e7a09000000b002d2d1c11703sm1683733ljc.76.2024.03.04.02.55.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 02:55:43 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d33986dbc0so36046071fa.2
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 02:55:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXcL5g4kfifHGvQvoDBC8g2fKIKL6xlEmGtJZoWSOuE56DOo4llS/hsEzVSkjkWwvW2N2fv5Y8VN1JuS0w3BkbjHTmGpd8FxQ==
X-Received: by 2002:a05:6512:1152:b0:513:3d3c:722f with SMTP id
 m18-20020a056512115200b005133d3c722fmr3824275lfg.15.1709549742336; Mon, 04
 Mar 2024 02:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20240303212411.1139387-1-fontaine.fabrice@gmail.com>
 <20240303231700.55fe7c0b@windsurf>
 <CAPi7W80PD21cWRc6Gu=5YDSnCd9mB7h2oqALzSrfxoLRfe_aOw@mail.gmail.com>
In-Reply-To: <CAPi7W80PD21cWRc6Gu=5YDSnCd9mB7h2oqALzSrfxoLRfe_aOw@mail.gmail.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 4 Mar 2024 11:55:30 +0100
X-Gmail-Original-Message-ID: <CACXRmJikOqij+4GWfJRxpY_FvmNReHoirAjawshojbArFwm7aA@mail.gmail.com>
Message-ID: <CACXRmJikOqij+4GWfJRxpY_FvmNReHoirAjawshojbArFwm7aA@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build with
 BR2_TIME_BITS_64
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT3Agem8gMyBtcnQgMjAyNCBvbSAyMzozNCBzY2hyZWVmIEZhYnJpY2UgRm9udGFp
bmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPjoKPgo+IExlIGRpbS4gMyBtYXJzIDIwMjQg
w6AgMjM6MTcsIFRob21hcyBQZXRhenpvbmkKPiA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4gYSDDqWNyaXQgOgo+ID4KPiA+IE9uIFN1biwgIDMgTWFyIDIwMjQgMjI6MjQ6MTEgKzAxMDAK
PiA+IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToK
PiA+Cj4gPiA+IEluZGVlZCwgdGhpcyBMRlMgd29ya2Fyb3VuZCB3YXMgcHJlc2VudCBzaW5jZSB0
aGUgYWRkaXRpb24gb2YgdGhlCj4gPiA+IHBhY2thZ2UgaW4gY29tbWl0IDZhMGY3YzM5YmNiNDhm
YzEzYWEyY2UzZmM0OTk2YmFmMWJlNjY0ODMgYW5kIGlzCj4gPiA+IHByb2JhYmx5IG5vdCBuZWVk
ZWQgYW55bW9yZQo+ID4KPiA+IFRoaXMgcGFja2FnZSB3YXMgYWRkZWQganVzdCBhIHllYXIgYWdv
LCBzbyBJIGJlbGlldmUgInByb2JhYmx5IG5vdAo+ID4gbmVlZGVkIGFueW1vcmUiIGlzIG1vc3Qg
bGlrZWx5IG5vdCBzdWZmaWNpZW50bHkgYXNzZXJ0aXZlLiBDYW4gd2UgZ2V0Cj4gPiBzb21lIG1v
cmUgY2xhcml0eSBvbiB0aGlzLCBieSByZXByb2R1Y2luZyB0aGUgb3JpZ2luYWwgaXNzdWUgdGhh
dCBsZWFkCj4gPiB0byB0aGlzIEZMVUVOVF9CSVRfQ0ZMQUdTICs9IC1VX0ZJTEVfT0ZGU0VUX0JJ
VFMgbWFnaWMsIGFuZCB0aGVuIGZpZ3VyZQo+ID4gb3V0IGhvdyBpdCBnb3QgcmVzb2x2ZWQsIGlm
IGl0IGRpZD8KPgo+IENvbW1lbnQgYWJvdmUgdGhpcyAibWFnaWMiIGlzIHBvaW50aW5nIHRvIGEg
cG9saWN5Y29yZXV0aWxzIGRlZmVjdAo+IG9wZW5lZCAxNCB5ZWFycyBhZ28gaW4gMjAxMC4KPiBJ
IGFzc3VtZSB0aGF0IGl0IGNvdWxkIGJlIGxpbmtlZCB0byBnbGliYyA8IDIuMjMgYXMgZm9yIHRo
ZSBvdGhlciBwYWNrYWdlcy4KPiBIb3dldmVyLCBJJ2xsIGxldCBUaG9tYXMgYW5zd2VycyBvbiB3
aHkgdGhpcyAibWFnaWMiIHdhcyBuZWVkZWQuCgpJIGFkZGVkIHRoaXMgIm1hZ2ljIiBpbiBteSB3
YXkgb2YgZ2V0dGluZyBmbHVlbnQtYml0IGNvbXBpbGVkIGZvciBhbGwKdGhlIGJ1aWxkcm9vdCB0
YXJnZXRzLgpUaGUgdHlwaWNhbCAnLi91dGlscy90ZXN0LXBrZyAtcCBmbHVlbnQtYml0IC1hJyBz
Y3JpcHQgZXhwb3NlZCB0aGF0CnByb2JsZW0uIEJ1dCBJIGZvcmdvdCB0aGUKdGFyZ2V0L2FyY2hp
dGVjdHVyZSB0aGF0IG5lZWRlZCB0aGlzIGhhY2suIFNvIGlmIGFsbCBhcmNoaXRlY3R1cmVzIGRv
CmNvbXBpbGUgbm93LCB0aGVuIEkKZ3Vlc3MgdGhhdCB3ZSBjYW4ganVzdCBkcm9wIGl0LiAoVG8g
YmUgY2hlY2tlZC4pCgpUaG9tYXMKCj4gPgo+ID4gVGhvbWFzCj4gPiAtLQo+ID4gVGhvbWFzIFBl
dGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+ID4gRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiA+IGh0dHBzOi8vYm9vdGxpbi5jb20K
Pgo+IEJlc3QgUmVnYXJkcywKPgo+IEZhYnJpY2UKPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
