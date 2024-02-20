Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787BAC48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 21:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE492606EB;
	Tue, 20 Feb 2024 21:36:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id de1RoWreIYxO; Tue, 20 Feb 2024 21:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 731F9606F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 731F9606F5;
	Tue, 20 Feb 2024 21:36:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5A11BF475
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9789081FF8
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-GTQAblHZnP for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 21:36:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 943D881FF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 943D881FF5
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 943D881FF5
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 21:36:54 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4126fda8ef8so7359835e9.2
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 13:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708465012; x=1709069812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c2UnL+N2kH1EROaoS55t7AAvHMPqdWEQze4nENp6Pyc=;
 b=vhyHHjL/isNBqUHf7ak5inT2ZoXzt4pbH/xCOyxsXm88s2awkbnYHCGUZMcWICekUU
 PBKYNBaikdGp53KThlRn8sI5D41SnC6sVb3DXOpYX879yl9sUqPlsbo54C9MBDRB92MM
 JC6bB2GzamzodHZhhyTesO57v3St4Chh+HFDwFGcBg5Wc/wCD5GHDJds1EkdA7454tCc
 6BdA7WdBhxfhlCBPTF555piP96mowNB1YBcOXsaGuwukyK9CVWRxhZMs2hpN2VwzIeJc
 nys9K6WMVo5sXNR+uYAV+OtxBqP9Rdh+Hmi+8TSQJPphRVAruQOG1HtBo3Tom8NHKnmp
 kvsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKlkSj5JEWpVbDHSg0bY1THmspw+scPtSwpmbBOkjhHvyy/bTWTYnegHU2rt++5qS0zL5D/QM0RtCPWcAGgTbYGCvJOjx3zQ==
X-Gm-Message-State: AOJu0Yyuk85r7oTbkp/B6FGlR4ZAmr3sOR5S7kURh9MJEfoT4ZLcnaQy
 rxiUrQGWSpg9uKgMZCYmPg4NiVux9ev5/lauedP2Tv5WjtSEE4Wa6Rm+5rau/IIuWYTV7rem5pj
 k
X-Google-Smtp-Source: AGHT+IGVv6eYW+Qq6VtuygS/FgQQlj01nWNyH4ax85osA/37XPujQDwcQNAlj9OHx/1MMqUKFZxjcw==
X-Received: by 2002:a5d:64e7:0:b0:33d:5ae5:f356 with SMTP id
 g7-20020a5d64e7000000b0033d5ae5f356mr6357628wri.20.1708465012369; 
 Tue, 20 Feb 2024 13:36:52 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 bw4-20020a0560001f8400b0033d297c9118sm12310833wrb.24.2024.02.20.13.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 13:36:52 -0800 (PST)
Message-ID: <1a7ab8e6-bd43-4191-ad95-12e40f3a5c51@smile.fr>
Date: Tue, 20 Feb 2024 22:36:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Andreas Dannenberg <dannenberg@ti.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <90dd167b-bceb-4e42-86c3-255caf825f41@smile.fr>
 <CAOf5uwka5w7DEAOox1pAfZ=mkpostmNATBJ_Ny1xuyYesXUwoQ@mail.gmail.com>
 <bf687add-2677-45fe-8eb1-cf04bd95bf57@smile.fr>
 <20240220004100.3yzqapeplx6olarz@dasso>
 <0b6dbe1f-2591-4290-b620-880d63eee7d0@smile.fr>
 <20240220200414.2bsvqvaeltqhsulc@dasso>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240220200414.2bsvqvaeltqhsulc@dasso>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708465012; x=1709069812;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c2UnL+N2kH1EROaoS55t7AAvHMPqdWEQze4nENp6Pyc=;
 b=kjfeMz4h3yC0Xuu4+s0HkI9y0MxAqIWPt5AkDXdLSdOyzdQS6BLXnc4dwTjQMinOej
 Yx5FPKKS2UbPnnZEK6xvY7uq86E3KILQnW+a0agstfZGf2Hwt+b5jwoto4d4FzRcfZKo
 599D2b96BgPtm8gOSHdioyVT3mFTY250MBcHTO/0yVtay3FiC6N0UGrP7A2M4norRYxV
 g8krG60N3Bv0aKItRKDjHukXqGAQxqJhQtSUbJvaeqH2Kss7i+FaQAU/cXEIIcYjKfr2
 MWjOreqtUoPKpMKFTvowLPWRYKwcXOEckrKksKSBhCkbdsiDawvUo6d3Zy1ideyLqQlf
 8uQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=kjfeMz4h
Subject: Re: [Buildroot] [PATCH v4 00/20] Add support for AM62x-SK HS-FS
 devices
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcmVhcywKCkxlIDIwLzAyLzIwMjQgw6AgMjE6MDQsIEFuZHJlYXMgRGFubmVuYmVyZyBh
IMOpY3JpdMKgOgo+IEhpIFJvbWFpbiwKPiAKPiBPbiBUdWUsIEZlYiAyMCwgMjAyNCBhdCAxMTow
Mzo1NEFNICswMTAwLCBSb21haW4gTmFvdXIgd3JvdGU6Cj4+IEhlbGxvIEFuZHJlYXMsCj4+Cj4+
IExlIDIwLzAyLzIwMjQgw6AgMDE6NDEsIEFuZHJlYXMgRGFubmVuYmVyZyBhIMOpY3JpdMKgOgo+
Pj4gT24gTW9uLCBGZWIgMTksIDIwMjQgYXQgMTI6MjQ6NTJQTSArMDEwMCwgUm9tYWluIE5hb3Vy
IHdyb3RlOgo+Pj4+IEhlbGxvIE1pY2hhZWwsCj4+Pj4KPj4+PiBMZSAxOS8wMi8yMDI0IMOgIDEy
OjAyLCBNaWNoYWVsIE5henphcmVubyBUcmltYXJjaGkgYSDDqWNyaXTCoDoKPj4+Pj4gSGkgUm9t
YWluCj4+Pj4+Cj4+Pj4+IE9uIE1vbiwgRmViIDE5LCAyMDI0IGF0IDEwOjMw4oCvQU0gUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+IEhlbGxv
IERhcmlvLAo+Pj4+Pj4KPj4+Pj4+IExlIDE3LzAyLzIwMjQgw6AgMTc6MDIsIERhcmlvIEJpbmFj
Y2hpIGEgw6ljcml0IDoKPj4+Pj4+PiBUaGUgU0stQU02MkItUDEgaXMgdGhlIG5ld2VzdCB2ZXJz
aW9uIG9mIFNLLUFNNjIgd2hpY2ggaW5jbHVkZXMKPj4+Pj4+PiBoaWdoLXNlY3VyaXR5IGZpZWxk
LXNlY3VyYWJsZSAoSFMtRlMpIHNpbGljb24gdG8gb3B0aW9uYWxseSBjdXN0b21pemUga2V5cwo+
Pj4+Pj4+IGFuZCBlbmNyeXB0aW9uIGZvciBzZWN1cml0eSBhcHBsaWNhdGlvbnMuCj4+Pj4+Pj4g
VGhpcyByZXF1aXJlcyBlbmFibGluZyB0aGUgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU0VD
VFlQRV9IU19GUyBvcHRpb24sCj4+Pj4+Pj4gd2hpY2gsIGhvd2V2ZXIsIHdhcyBidWdneS4gVGhp
cyBzZXJpZXMgZml4ZXMgdGhlIGVycm9ycyBhbmQgYnVtcHMgdGhlIExpbnV4Cj4+Pj4+Pj4ga2Vy
bmVsIGFuZCBVLUJvb3QgcmVxdWlyZWQgZm9yIHN1Y2ggYSBuZXcgZGV2aWNlLgo+Pj4+Pj4+Cj4+
Pj4+Pj4gVGhpcyBzZXJpZXMsIHdoaWNoIGluIG15IGh1bWJsZSBvcGluaW9uLCBzaG91bGQgaGF2
ZSBiZWVuIGltbWVkaWF0ZWx5Cj4+Pj4+Pj4gY29uc2lkZXJlZCB0byBjb3JyZWN0IHRoZSBjb21w
aWxhdGlvbiBlcnJvcnMgaW4gY2FzZSBvZiBIUy1GUyBkZXZjaWVzLCBoYXMKPj4+Pj4+PiBzZWVu
IGFuIGluY3JlYXNlIGluIHBhdGNoZXMgaW4gdmVyc2lvbiA0IHRvIHJlbW92ZSB0aGUgdGktazMt
aW1hZ2UtZ2VuCj4+Pj4+Pj4gcGFja2FnZSB0aGFua3MgdG8gQmlubWFuLiBBZGRpdGlvbmFsbHks
IGl0IHNoYXJlcyBzb21lIG1vZGlmaWNhdGlvbnMgYW5kCj4+Pj4+Pj4gdmlld3Mgb24gaG93IHRv
IGltcGxlbWVudCBjZXJ0YWluIGNoYW5nZXMgd2l0aCB0aGUgc2VyaWVzCj4+Pj4+Pj4gaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9Mzk0
ODQwLgo+Pj4+Pj4+IFRoZXJlZm9yZSwgSSB0aGluayBpdCBpcyBuZWNlc3Nhcnkgbm90IHRvIHJ1
biB0aGVtIGluIHBhcmFsbGVsIGJ1dCB0byBkZWNpZGUKPj4+Pj4+PiB3aGV0aGVyIHRvIG1lcmdl
IG9uZSBiZWZvcmUgdGhlIG90aGVyIG9yIHRvIGNvbnNpZGVyIGEgc2luZ2xlIHNlcmllcyB3aGVy
ZQo+Pj4+Pj4+IHRoZSBwYXRjaGVzIGNhbiBiZSBjb2hlcmVudCB3aXRoIGVhY2ggb3RoZXIuIEkg
YW0gYXZhaWxhYmxlIGZvciBib3RoIHNvbHV0aW9ucy4KPj4+Pj4+PiBMZXQgbWUga25vdy4KPj4+
Pj4+Cj4+Pj4+PiBUaGFua3MgZm9yIHRoaXMgbmV3IHZlcnNpb24uIEkgYmVsZWl2ZSBib3RoIHNl
cmllcyBzaG91bGQgYmUgbWVyZ2VkIGludG8gb25lCj4+Pj4+PiBzaW5jZSB3ZSB3YW50IHRvIGZv
bGxvdyB1LWJvb3Qgc3dpdGNoIHRvIGJpbm1hbiwgYWRkIG1vcmUgVEkgSzMgU29DIHN1cHBvcnQg
YW5kCj4+Pj4+PiBrZWVwaW5nIGV4aXNpbmcgYW02MnggYW5zIGFtNjR4IHdvcmtpbmcgaW4gR1Ag
b3IgSFMvSFMtRlMuCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBCZWNhdXNlIHRoZSBEYXJpbyBwYXRjaHNl
dCB3YXMgc2VudCBiZWZvcmUgKGVuZCBvZiBOb3ZlbWJlciksIGl0J3MKPj4+Pj4gcmVhc29uYWJs
ZSB0byByZXZpZXcgYW5kIGFkanVzdCB0aGF0IG9uZQo+Pj4+PiBhbmQgYXBwbHkgeW91ciBjaGFu
Z2VzIGZvciB0aV9qNzIxZV9zayBvbiB0b3Agb2YgaXQuIEl0IHRoaW5rIHRoYXQgaXMKPj4+Pj4g
YSBzdGFuZGFyZCB3YXkgdG8gbWFrZSBwZW9wbGUgaGFwcHkgYWJvdXQKPj4+Pj4gdGhlaXIgd29y
ayBhbmQgY29udHJpYnV0aW9uLgo+Pj4+Cj4+Pj4gQWN0dWFsbHksIHRoZSB0d28gc2VyaWVzIGFy
ZSBhYm91dCB0aGUgc2FtZSB0b3BpYzogVEkgSzMgU29DIHN1cHBvcnQgKEdQLCBIUywKPj4+PiBI
Uy1GUykgbm90IG9ubHkgQU02MngtU0sgSFMtRlMgZGV2aWNlcwo+Pj4+Cj4+Pj4gQnV0IGR1ZSB0
byB0aGUgY29tcGxleGl0eSBvZiB0aGUgQlNQLCB0aGUgYm9vdCBmbG93ICg0IHdheSB0byBib290
ISkgYW5kIHRoZQo+Pj4+IHN3aXRjaCBmcm9tIGN1c3RvbSB0b29sIHRvIGJpbm1hbi4uLiB0aGlz
IHNlcmllcyBpcyByZWFsbHkgZGlmZmljdWx0IHRvIHJldmlldwo+Pj4+IHdpdGhvdXQgaGF2aW5n
IGEgZ29vZCB1bmRlcnN0YW5kaW5nIG9mIFRJIEszIGFyY2hpdGVjdHVyZSBwZWN1bGlhcml0eSBh
bmQgaGF2aW5nCj4+Pj4gb25lIG9mIGVhY2ggVEkgZXZhbHVhdGlvbiBib2FyZHMg8J+Zggo+Pj4K
Pj4+IEFsdGhvdWdoIEkgaGVscGVkIGNvbmNlaXZlIHNvbWUgb2YgdGhpcyBhbmQgdGhlIGFzc29j
aWF0ZWQgdG9vbGluZyBlYXJseQo+Pj4gb24sIHNvbWUgb2YgdGhlIHdoYXQgbWF5IGxvb2sgc3Ry
YW5nZSBhcmNoaXRlY3R1cmFsIGRlY2lzaW9ucyB3ZXJlIGRyaXZlbgo+Pj4gYnkgZGlmZmVyZW50
IHVzZSBjYXNlcyBhbmQgcmVxdWlyZW1lbnRzIGZvciB0aGUgZGlmZmVyZW50IGRldmljZXMKPj4+
IChlc3BlY2lhbGx5IGFyb3VuZCBhdXRvbW90aXZlIGZhc3QvZWFybHkgYm9vdCwgYnV0IGFsc28g
c2VjdXJpdHkpIGluCj4+PiBjb21iaW5hdGlvbiB3aXRoIGxpbWl0ZWQgb24tY2hpcCBTUkFNLi4u
IFNvIHRoaXMgd2hlcmUgd2UgYXJlIGF0IG5vdy4gQQo+Pj4gZnV0dXJlIEFNNnggZGV2aWNlIHZh
cmlhbnQgd2lsbCBoYXZlIHlldCBhbm90aGVyIGJvb3QgZmxvdywgYnV0IEkgY2FuCj4+PiBhbHJl
YWR5IHNheSBpdCB3aWxsIGJlIHZlcnkgbXVjaCBzaW1wbGlmaWVkIG92ZXIgd2hhdCB3ZSBoYXZl
IHRvZGF5IDopCj4+Cj4+IEFib3V0IGV4aXN0aW5nIGJvb3QgZmxvdywgSSBmb3VuZCB0d28gcmVj
ZW50IGNvbW1pdCBpbiB1LWJvb3QgdGhhdCBzdGF0ZSB0aGF0Cj4+IHRoZSAiU3BsaXQgYmluYXJ5
IiAodGhhdCByZXF1aXJlcyBzeXNmdy5pdGIpIGlzIGFscmVhZHkgYSBsZWdhY3kgYm9vdCBmbG93
Ogo+IAo+IEl0J3MgY2FsbGVkICJsZWdhY3kgYm9vdCBmbG93IiBiZWNhdXNlIGl0IHdhcyB0aGUg
Ym9vdCBmbG93IHVzZWQgb24gdGhlCj4gZmlyc3QgSzMgZGV2aWNlcyB0aGF0IHdlcmUgcmVsZWFz
ZWQgKEFNNjV4LCBKNzIxRSkuIFRoaXMgYm9vdCBmbG93IHdhcwo+IG5vdCB1c2VkIG9uIGZvbGxv
dy1vbiBkZXZpY2VzLiBUaGUgY2hhcmFjdGVyaXN0aWNzIG9mIHRoaXMgYm9vdCBmbG93IGlzCj4g
dGhhdCB0aGUgaW5pdGlhbCBGVyBpbWFnZSB0aGF0IGdldHMgbG9hZGVkICh0aWJvb3QzLmJpbikg
ZG9lc24ndCBjb250YWluCj4gYW55IGRldmljZSBmaXJtd2FyZXMsIGJ1dCBvbmx5IGEgYm9vdGxv
YWRlciAoc3VjaCBhcyBVLUJvb3QgU1BMKS4gVGhlbgo+IHRoaXMgYm9vdCBsb2FkZXIgd2lsbCBs
b2FkIHRoZSBTeXN0ZW0gRmlybXdhcmUgZmlybXdhcmUgKyBjb25maWcgZGF0YQo+IGJsb2IgKHN5
c2Z3Lml0YikgaW50byB0aGUgZGVkaWNhdGVkIGNvcmUgKGNhbGxlZCAiRE1TQyIgPSBEZXZpY2Ug
TWFuYWdlcgo+IGFuZCBTZWN1cml0eSBDb250cm9sbGVyKS4gQW5kIHRoZW4gYWRkaWl0b25hbCBi
b290IHN0YWdlcyB3aWxsIGJlCj4gbG9hZGVkLiBUaGVzZSBkZXZpY2VzIHJlcXVpcmUgdGhpcyBi
b290IGZsb3csIGFuZCB3aXRoIHRoaXMgaXQgaXMKPiByZXF1aXJlZCB0byBiZSBzdXBwb3J0ZWQg
YnkgVS1Cb290IChhbmQgYW55IExpbnV4IGRpc3RyaWJ1dGlvbiBvciBidWlsZAo+IHN5c3RlbXMg
dGhhdCBidWlsZCBvbiB0aGF0KS4KPiAKPiBUSSBpcyBzdGlsbCBtYWtpbmcvc2VsbGluZyB0aG9z
ZSAibGVnYWN5IGJvb3QgZmxvdyIgZGV2aWNlcywgYW5kIHdpbGwKPiBjb250aW51ZSB0byBkbyBz
byBmb3IgYSB2ZXJ5IGxvbmcgdGltZS4gT25lIHByb21pbWVudCBjb21tdW5pdHkKPiBpbmNhcm5h
dGlvbiB0aGF0IHlvdSBhcmUgcHJvYmFibHkgYXdhcmUgb2YgaXMgdGhlIEJlYWdsZUJvbmUgQUkt
NjQuCgpUaGFuayB5b3UgZm9yIHRoZSBkZXRhaWxlZCBleHBsYW5hdGlvbiEKCkkgcHJldmlvdWx5
IHdvcmtlZCBvbiBhIEFNNTd4eCBTb0MgdGhhdCBpcyBub3dhZGF5IGxlZ2FjeSBTb0MsIHRoZSBs
YXRlc3QKdGkta2VybmVsIDYuMSBkb2Vzbid0IHN1cHBvcnQgc29tZSBvZiB0aGUgZHJpdmVyIHRo
YXQgd2hlcmUgYXZhaWxhYmxlIGluCnRpLWtlcm5lbCA1LjEwIChwcnVldGggMTAwTSwgUlBNc2cg
U29ja2V0cyBvdmVyIHZpcnRpby1ycG1zZyB0cmFuc3BvcnQgKHVzZSBmb3IKQVJNLURTUCBJUEMz
LngpLCBUSS1SVE9TICh0aGUgY3NsLWNvbW1vbiBwYWNrYWdlIHdhcyBhbHNvIHJlbW92ZWQgZnJv
bSBtZXRhLXRpKSkuCgpBbHNvIHRoZSBUSSBTREsgb24gdGhpcyBwbGF0ZWZvcm0gZG9lc24ndCBz
ZWVtcyB2ZXJ5IGFjdGl2ZSBbMV0uCgpTbywgSSdtIHdvcnJpZWQgd2hlbiBJIHJlYWQgImxlZ2Fj
eSIgOikKClsxXQpodHRwczovL2UyZS50aS5jb20vc3VwcG9ydC9wcm9jZXNzb3JzLWdyb3VwL3By
b2Nlc3NvcnMvZi9wcm9jZXNzb3JzLWZvcnVtLzEyOTAxOTcvcHJvY2Vzc29yLXNkay1hbTU3eC1s
ZWdhY3ktcHJvY2Vzc29yLXMtbGludXgtdXBkYXRlLXBsYW4KCj4gCj4+IGFybTogZHRzOiBrMy1i
aW5tYW46IEFkZCBzdXBwb3J0IGZvciBGSVQgdGVtcGxhdGVzCj4+Cj4+ICAgICBBZGQgdGVtcGxh
dGVzIGZvciBGSVQgaW1hZ2VzIHVzZWQgZXh0ZW5zaXZlbHkgYWNyb3NzIEszIGJvYXJkcyB3aXRo
IG1vc3QKPj4gICAgIG9mIHRoZSBjb2RlIGNvbW1vbi4gVGhpcyBpbmNsdWRlcyB0aGUgRklUIHBv
cnRpb25zIG9mOgo+PiAgICAgCS0gdGlzcGwuYmluCj4+ICAgICAJLSB1LWJvb3QuaW1nCj4+ICAg
ICAJLSBzeXNmdy5pdGIgKGluIGNhc2Ugb2YgbGVnYWN5IGJvb3QgZmxvdykKPj4KPj4gaHR0cHM6
Ly9naXRsYWIuY29tL3UtYm9vdC91LWJvb3QvLS9jb21taXQvYjE1M2JhZDBmMTQxNjhkNWZjYzAy
YmE2YmYxYTJjZDk4ZGFiYTliNQo+Pgo+PiAgICAgYXJtOiBkdHM6IGszLSotYmlubWFuOiBNb3Zl
IHRvIHVzaW5nIHRlbXBsYXRlZCBGSVRzCj4+Cj4+ICAgICBSZWR1Y2UgcmVkdW5kYW5jeSBpbiBj
b2RlIGJ5IHVzaW5nIHRlbXBsYXRlcyB0byBnZW5lcmF0ZSB0aGUgQTcyIGJvb3QKPj4gICAgIGJp
bmFyaWVzICh0aXNwbC5iaW4gYW5kIHUtYm9vdC5pbWcpIGFzIHdlbGwgYXMgUjUgYm9vdCBiaW5h
cnkgc3lzZncuaXRiCj4+ICAgICAoZm9yIGxlZ2FjeSBib290IGZvbGxvd2luZyBkZXZpY2VzIEo3
MjFFIGFuZCBBTTY1eCkuCj4+Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS91LWJvb3QvdS1ib290Ly0v
Y29tbWl0LzQ1MDliOWZmMGI4Y2IyNjkwN2Y5ZTljMzU3MWI0MzU2NWM4NTkyNzUKPj4KPj4gV2hp
Y2ggb25lIHNob3VsZCBiZSByZWNvbW1lbmRlZCBvciBhdm9pZGVkIGZvciBhIG5ldyBkZXNpZ24/
Cj4gCj4gVGhvc2UgY29tbWl0cyBhcmUganVzdCBhIHNpbXBsaWZpY2F0aW9uIHRvIHJlZHVjZSBk
dXBsaWNhdGlvbi4gQXMgcGVyCj4gZWFybGllciBjb21tZW50IHRoZSAibGVnYWN5IGJvb3QgZmxv
dyIgaXMgc29tZXRoaW5nIHdlIGNvbnRpbnVlIG5lZWRpbmcKPiB0byBzdXBwb3J0LiBJdCBpc24n
dCBzdXBwb3NlZCB0byBpbXBseSB0aGF0IHRob3NlIGRldmljZXMgYXJlIGFib3V0IHRvCj4gZGlz
YXBwZWFyLgo+IAo+IE5vdCBzdXJlIGlmIHRoaXMgYW5zd2VyZWQgeW91ciBxdWVzdGlvbjsgcGxl
YXNlIGxldCBtZSBrbm93LgoKWWVzLCB0aGFuayB5b3UuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoK
Cj4gCj4gLS0KPiBBbmRyZWFzIERhbm5lbmJlcmcKPiBUZXhhcyBJbnN0cnVtZW50cyBJbmMKPiAK
PiAKPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBSb21haW4KPj4KPj4KPj4+Cj4+Pj4gVGhlIHNlcmll
cyAoYmFzZWQgb24gRGFyaW8ncyB3b3JrKSBhYm91dCB0aV9qNzIxZV9zayBzdWdnZXN0ZWQgdG8g
cmVtb3ZlIFRJCj4+Pj4gY3VzdG9tIHRvb2xzIHJlcGxhY2VkIGJ5IGJpbm1hbiBhbG9uZyB3aXRo
IG90aGVyIGltcHJvdmVtZW50cy4KPj4+Pgo+Pj4+IEknbGwgd2F5IGZvciB2NSBhbmQgcmViYXNl
IHRoZSB0aV9qNzIxZV9zayBvbiB0b3Agb2YgaXQuCj4+Pgo+Pj4gVGhhbmsgeW91IFJvbWFpbiBm
b3IgeW91ciBidXktaW4uIExldCdzIGZvY3VzIG9uIGdldHRpbmcgRGFyaW8ncyBzZXJpZXMKPj4+
IGluIGdvb2Qgc2hhcGUgYW5kIHRoZW4gbW92ZSBvbnRvIHlvdXJzLiBJJ2QgYWxzbyBsaWtlIHRv
IHJlLWludHJvZHVjZQo+Pj4gZ3JhcGhpY3MgKEkgaGFkIHRoYXQgd29ya2luZyBiZWZvcmUpIGJ1
dCBJIG5lZWQgdG8gd2FpdCBmb3IgYWxsIHRoZQo+Pj4gImJhc2VsaW5lIiBzdHVmZiB0byBzZXR0
bGUgZmlyc3QuCj4+Pgo+Pj4KPj4+IC0tCj4+PiBBbmRyZWFzIERhbm5lbmJlcmcKPj4+IFRleGFz
IEluc3RydW1lbnRzIEluYwo+Pj4KPj4+Cj4+Pgo+Pj4+Cj4+Pj4gQmVzdCByZWdhcmRzLAo+Pj4+
IFJvbWFpbgo+Pj4+Cj4+Pj4KPj4+Pj4KPj4+Pj4gTWljaGFlbAo+Pj4+Pgo+Pj4+Pj4gTXkgbWFp
biBjb25jZXJuIGlzIHRvIGF2b2lkIGFkZGluZyBhIG5ldyBwYWNrYWdlIGZvciBhIHRvb2wgdGhh
dCBpcyBhbHJlYWR5Cj4+Pj4+PiBkZXByZWNhdGVkIHRpLWszLWltYWdlLWdlbiAobm90IHN1cmUg
aWYgdGktazMtY29yZS1zZWNkZXYgaXMgcmVhbGx5IGRlcHJlY2F0ZWQpIFsxXS4KPj4+Pj4+Cj4+
Pj4+PiBBbHNvIHRoZSB0b3BpYyBpcyBub3Qgb25seSAiQU02MngtU0sgSFMtRlMgZGV2aWNlcyIg
YnV0ICJUSSBLMyBIUy1GUyBkZXZpY2VzIi4KPj4+Pj4+Cj4+Pj4+PiBbMV0gaHR0cDovL2xpc3Rz
LmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3QvMjAyNC1GZWJydWFyeS82ODU4MjAuaHRt
bAo+Pj4+Pj4KPj4+Pj4+IEJlc3QgcmVnYXJkcywKPj4+Pj4+IFJvbWFpbgo+Pj4+Pj4KPj4+Pj4+
Pgo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
