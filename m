Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752DFC021A9
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 02:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2626660F54;
	Tue, 18 Feb 2025 02:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gzx-dpAKgEn9; Tue, 18 Feb 2025 02:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47DE360F5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47DE360F5E;
	Tue, 18 Feb 2025 02:11:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99129C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 02:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D4A060F54
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 02:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ferY0GJAodgW for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 02:11:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97B6760F49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97B6760F49
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97B6760F49
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 02:11:08 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3d2a8c2467eso1820195ab.3
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 18:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739844667; x=1740449467;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=voYhY/45Ru7lzJCTndt9RUE2sqLkdVgUgrkgsevZ7hU=;
 b=D3XCi6tAem4SfToWcCtPIf2kdo1XtDnqneId172tlFMHCUTEMRFIJou94akwqd2EI/
 7h/C2MW/yrJp7nKwR/f7G1gEkdKfTte7rN0iD+xOmf4YGXJHVmmiyvEe+KNQNZmGZrjs
 OqNrv3r4l8rj7wJkghXX4i2kM/DOwr3uMLFlDRzrFVLFvZ3nLKIRtreAG2s3pZrbI0Dy
 s2WwrG/0xcIUUPCamEmELgbaw9dhIniR3yfakkjGy8joGacpYfQTX7tvjAM/svrTSonC
 i3zxqC3HlNcudctzhQkHiRzakJoc0uBkDET8EnDmLgs5MYNFtDV1k89+eOeZuiDGAkNy
 ERpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkwhXjNkB0mN3XLqkGhFKa9pcVtXFHW6MmReLs8bjaoqVcpgxCCJam9UMDWazvQNakOsijL9n4ZaI=@buildroot.org
X-Gm-Message-State: AOJu0YySCml3CGoFlIgMDarK129A4Nn4PS8S9IiEu11LV8Mk131hsSFO
 vu3PRgR9LOhNA2gB4ga8a7KKcLSn677gittveRUJvaxtTZk1yKoT
X-Gm-Gg: ASbGncsMv4y6NifUd1ef0jUjvQh11hfNzx3xcCy2qR0pp57rQb6rE9Ffj4yVOhj203i
 ANRgmEnxImazNiVjIKNpWzB77+6bC9gIwoGrJon2F2CBcmkau2a434dcV3zcnqAGIrpp9JQcNws
 rH+XIEUeV1DMa9UPKKbgqYjSYwfqnz+UqeTPI2wjZqlp/TsVaLtbRw8waMbUFr6xKjEAig8yqkM
 XZgj1M1WuhkNFIv1lYYiuk6x4VYcy2Pcujw/v79cOLexW9PafWjrveF8ndFsFpnpvJZJa3Z1Vxf
 h653BWVDO+icMkeb36N+5/MunllpOui9NXQk3X477APZ0RNLg+AWRWIf4n6i+i/ffA==
X-Google-Smtp-Source: AGHT+IGHyQ0E2mt8FFcfwAvm8QR5BbI+VDFZ/rhpTAo7+EBaSin1FqWLjt9vqRCyIjHLf1HU+efzfg==
X-Received: by 2002:a05:6e02:b4b:b0:3a7:820c:180a with SMTP id
 e9e14a558f8ab-3d2809193c5mr114158785ab.19.1739844667376; 
 Mon, 17 Feb 2025 18:11:07 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ee90c7d27esm1089513173.52.2025.02.17.18.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 18:11:06 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 17 Feb 2025 20:11:05 -0600
Message-Id: <D7V7GLF6R2JQ.3CH0YHV3C16UX@gmail.com>
Cc: "Brandon Maier" <brandon.maier@collins.com>
From: "Brandon Maier" <brandon.maier@gmail.com>
To: "Akhilesh Nema" <nemaakhilesh@gmail.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20250111063753.769689-1-nemaakhilesh@gmail.com>
 <CAMV0Ro-AWc6Ugxsgks2zhVzvNkpVWW0zoJSvYfQ0STh2D4yu8A@mail.gmail.com>
In-Reply-To: <CAMV0Ro-AWc6Ugxsgks2zhVzvNkpVWW0zoJSvYfQ0STh2D4yu8A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739844667; x=1740449467; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=voYhY/45Ru7lzJCTndt9RUE2sqLkdVgUgrkgsevZ7hU=;
 b=fgFUoY4bzmuMOKGja0fJV0XeFrWFlKQYHx5bauw2ykEiSj/FVsY+PHEZ2zG6jptYGC
 z1rDIcXz6xQUEGnbRFVS7EgMMEsDR7FlVZJGwzICXKZFW22wyEGaA+IECLaHJRZRJZXT
 e0HlqoyyLdtud8oq1NPZyoj/UaTo+6NAN5XF9lccOG8kk26MtyWfvvB1NU33n37c4OsB
 VLDCN2Tcoav7laGFKW8roL4Plpt/+kiV5i5TPkcc5uGhchH0S9G1SiMTx6p1gVKD86dO
 +A/qLhWUZ0scCwTD+2dx5AV6H3PE6lRSczquEGiY3BaphisrOR5tPQbKZErq31WEoK8x
 rxtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fgFUoY4b
Subject: Re: [Buildroot] [PATCH 1/5] package/qoriq-rcw: bump version to
 lf-6.6.52-2.2.0
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

SGkgQWtobmlsZXNoLAoKT24gV2VkIEZlYiAxMiwgMjAyNSBhdCAxMTo0MiBBTSBDU1QsIEFraGls
ZXNoIE5lbWEgd3JvdGU6Cj4gT24gRnJpLCBKYW4gMTAsIDIwMjUgYXQgMTA6MzfigK9QTSBBa2hp
bGVzaCBOZW1hIDxuZW1hYWtoaWxlc2hAZ21haWwuY29tPgo+IHdyb3RlOgo+Cj4+IENoYW5nZWxv
ZzoKPj4gaHR0cHM6Ly9naXRodWIuY29tL254cC1xb3JpcS9yY3cvY29tcGFyZS9sZi02LjYuMjMt
Mi4wLjAuLi5sZi02LjYuNTItMi4yLjAKPj4KPj4gU2lnbmVkLW9mZi1ieTogQWtoaWxlc2ggTmVt
YSA8bmVtYWFraGlsZXNoQGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBwYWNrYWdlL3FvcmlxLXJjdy9x
b3JpcS1yY3cuaGFzaCB8IDIgKy0KPj4gIHBhY2thZ2UvcW9yaXEtcmN3L3FvcmlxLXJjdy5tayAg
IHwgMiArLQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4+Cj4KPiBDb3VsZCB5b3UgcGxlYXNlIHJldmlldyB0aGlzIHBhdGNoIHNlcmllcz8KClRo
ZSBzZXJpZXMgbG9va3MgZ29vZCB0byBtZSwgb3RoZXIgdGhlbiB0aGUgbHMxMDQ2YS1mcnd5IHBh
dGNoIG5lZWRzIGEKbWlub3IgY29ycmVjdGlvbi4KCj4KPiBUaGUgZm9sbG93aW5nIGRlZmNvbmZp
Z3MgcmVxdWlyZSB0aGUgbGF0ZXN0IExGIHJlbGVhc2UgdGFncyB0byBzYXRpc2Z5IGFsbAo+IGRl
cGVuZGVuY2llczoKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJvb3QvYnVpbGRyb290L2Js
b2IvbWFzdGVyL2NvbmZpZ3MvbHMxMDQ2YS1mcnd5X2RlZmNvbmZpZwo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9idWlsZHJvb3QvYnVpbGRyb290L2Jsb2IvbWFzdGVyL2NvbmZpZ3MvbHMxMDQ2YS1yZGJf
ZGVmY29uZmlnCj4gaHR0cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJvb3QvYmxvYi9t
YXN0ZXIvY29uZmlncy9sczEwNDNhLXJkYl9kZWZjb25maWcKPgo+IExGIHZlcnNpb24gdGFncyBh
cmUgYSBuZXcgYXBwcm9hY2ggaW50cm9kdWNlZCBieSBOWFAuIElmIHRoaXMgbWV0aG9kIGlzCj4g
aW50ZW5kZWQgdG8gYmUgdXNlZCBjb25zaXN0ZW50bHkgZm9yIGZ1dHVyZSByZWxlYXNlcywgaXQg
bWlnaHQgYmUgd29ydGgKPiBjb25zaWRlcmluZyB0aGUgaW50cm9kdWN0aW9uIG9mIGEgYnVpbGRy
b290IGNvbmZpZyBvcHRpb24gdG8gc3RvcmUgdGhlIExGCj4gdmVyc2lvbiB0byBzaW1wbGlmeSB2
ZXJzaW9uIHVwZ3JhZGVzIGZvciBOWFAgYm9hcmRzLgoKSXQgd291bGQgYmUgbmljZSB0byBtYWtl
IHRoZSB1cGRhdGUgcHJvY2VzcyBlYXNpZXIuIFRob3VnaCBJIGZpbmQgbW9zdApvZiB0aGUgd29y
ayBpcyB1cGRhdGluZyB0aGUgaGFzaGVzIGZvciBlYWNoIHBhY2thZ2UuIFlvdSBjYW4gYWx3YXlz
CnN1Ym1pdCBwYXRjaGVzIGlmIHlvdSB3YW50IHRvIHRha2UgYSBzaG90IGF0IGl0LgoKVGhhbmtz
IQpCcmFuZG9uIE1haWVyCgo+Cj4gVGhhbmtzCj4gQWtoaWxlc2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
