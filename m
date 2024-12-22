Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0341DE77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 20:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CD5F6081C;
	Sun, 22 Dec 2024 20:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YoaDoG50YxZ; Sun, 22 Dec 2024 20:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68CE96068A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68CE96068A;
	Sun, 22 Dec 2024 20:28:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F5A35E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 20:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F0BA81951
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 20:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2aIp8ebs1MO for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 20:28:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 271E38196E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 271E38196E
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 271E38196E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 20:28:31 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-30229d5b229so36926151fa.0
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 12:28:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734899309; x=1735504109;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r1q09ALWWD3MsiMwWsgwfrRH49ncgSPEo6W7aXMpB9k=;
 b=G+rpo5kf/3TRlM2YGmeyDqZzJCaZPyVa84Iw9yeZC9xQgI2tUAysTOT2Y8QgKCep5H
 idx0wsbympmrtd3ALLay+s3sfGWdTdurVub4T6+0Dz17PAIT9WzC5WuUO0iqQpvsTjEb
 oxhZy16nuGcbG8kTDKbAh18syUE8Nh5xB4g6zy/60Qf33/kjFXbY6cDw5a9KCDh4Ms4M
 xj9L/6o6TALWvVQVgsybFLaipAJAonjLeMZwv+i1S6TzLQGqfpiL9GLQyh02qJJxLRCA
 wLPtBpo85RbZtnnU7XDHWQRbba34JeZu6jIjJ+TCqkqDWoPr2vXRHxBzFIgY979SgWVs
 tE2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSi0F02QbpW06RKDDkAx8/aKnRqRZvHJTSuKcTrWAlHOtOKFho85X3kedkmpQNMhX5Gcx6F/OHHjU=@buildroot.org
X-Gm-Message-State: AOJu0YyF4EN7Zqw12WPRjXbJGJHhaiVMDR8ayobN0LrOwcf2rc39yxMl
 spMDo8EFzQoJe9/4rTzDSR0o/eTCZTInBdb2/cCN/WX9RJ1xG0jPDglsiAPohGEhP3VUBbbHDFz
 lsoGHPk5YS2dVWRm5zpQqlGjVbT8=
X-Gm-Gg: ASbGncsdHyKgKA9KdjAWP7j75tlC8zT6f0mzTtgvfLWgyVL/P55UeuMSQPIQ0i3ZpCb
 K9N2ldAes08UOKFdwq1VzSvnMIAXYbwlbQdobNTPar9H1p4hl8XWGm25nlmIO/QsjgRvNTw==
X-Google-Smtp-Source: AGHT+IGXHKOC6tvIazaF6qH8cIgRDwdcxM244HNo/2kCvJk4Th1O07woozT5aUYxW//+afMAL8e3W+mptVncB/yHAqc=
X-Received: by 2002:a2e:a582:0:b0:300:3e1c:b8b1 with SMTP id
 38308e7fff4ca-3046855031dmr31960161fa.18.1734899308201; Sun, 22 Dec 2024
 12:28:28 -0800 (PST)
MIME-Version: 1.0
References: <6764f1fc.050a0220.142ef5.521b@mx.google.com>
 <CAGm1_ktiWPLOXr6cTGyBxiywHk1Jy8hNKhyS+Vb9dsebNtiqSQ@mail.gmail.com>
 <4bd5b931-b405-4b17-9e58-b637e4a49afb@korsgaard.com>
 <a81d287ec24eb47ad57dffcb5ef75d42@free.fr>
In-Reply-To: <a81d287ec24eb47ad57dffcb5ef75d42@free.fr>
Date: Sun, 22 Dec 2024 21:28:15 +0100
Message-ID: <CAGm1_kuqMQv4uw3HYTVX1POg+vDmCKY_UA3NnSr=PV7R7ZiGBQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1734899309; x=1735504109; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r1q09ALWWD3MsiMwWsgwfrRH49ncgSPEo6W7aXMpB9k=;
 b=FyrFt4DZ7oqBrMTpAAu8HYm1+IFbP33hyZbJMtfIzvZcheiHAhZRthE9JLObmxvCNN
 TUZa/Lv+KoxKJwLnxh48/QUZmRFhRMXjylpNehuG8cfswj3qtSjD5AiF+QYhmdh4bwaJ
 pSjIRpEf42GaKPCBYgINBVX15Lvvwb1dL5fZwvNleummsI3T7jGv20XGSDAAxCsALtfE
 t3q1Uk1o+3O3JbKMHw44xvsEhvmwcBUoGbeorm4KehrWsKWpnXKhAlG63oh3u87Uy1e4
 Jl63yltv/gsc6zAetNUGdIFVP6ocBoy/trTHpYkjv9t7/xiJhfIf9IEF90AIUZIbkdml
 2fEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FyrFt4DZ
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2024-12-19
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLCBBbGwsCgpPbiBTdW4sIERlYyAyMiwgMjAyNCBhdCA2OjIw4oCvUE0gSnVsaWVu
IE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gd3JvdGU6Cj4KPiBIaSBQZXRlciwgWWVnb3IsCj4KPiBP
biAyMC8xMi8yMDI0IDEwOjUyLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4gPiBPbiAxMi8yMC8y
NCAwOTo1NiwgWWVnb3IgWWVmcmVtb3Ygd3JvdGU6Cj4gPgo+ID4+PiBCdWlsZCBmYWlsdXJlcyBy
ZWxhdGVkIHRvIHlvdXIgcGFja2FnZXM6Cj4gPj4+Cj4gPj4+ICAgICAgYXJjaCAgICAgfCAgICAg
ICAgICAgICByZWFzb24gICAgICAgICAgICAgfAo+ID4+PiAgICAgICAgICAgICAgICAgIHVybAo+
ID4+PiAtLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+PiAgICByaXNjdjY0ICAgIHwgICBob3N0LXB5dGhvbi1n
cmVlbmxldC0zLjEuMSAgIHwKPiA+Pj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9y
ZXN1bHRzLzZlNDczODNmMDBiMjI0ZGRjM2JlNWU1NmM5MmY3NzRkNzk0OTY0NTMKPiA+Pj4gICAg
IHg4Nl82NCAgICB8ICAgaG9zdC1weXRob24tZ3JlZW5sZXQtMy4xLjEgICB8Cj4gPj4+IGh0dHBz
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9kMzY5YzI4YWVhNjZkMWZiYjczZmJl
NTgxN2M1MGEyZWQ3ZWY3ZGY2Cj4gPj4+ICAgICBhcm1lYiAgICAgfCAgIGhvc3QtcHl0aG9uLWdy
ZWVubGV0LTMuMS4xICAgfAo+ID4+PiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jl
c3VsdHMvMmE0MWMyZDcxYjUxNjk5ZjQ3MzQxYTBiZmMyOGY1MGUzZDRhMzJjZAo+ID4+PiAgICBh
YXJjaDY0ICAgIHwgICAgcHl0aG9uLWF1dG9jb21tYW5kLTIuMi4yICAgIHwKPiA+Pj4gaHR0cHM6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzAyNjcwNDI0ZmQ0NGYxMGI1YWIwN2Y0
MzE4MTcyY2YwZTEyNWRlYmUKPiA+Pj4gICAgICBhcmMgICAgICB8ICAgIHB5dGhvbi1hdXRvY29t
bWFuZC0yLjIuMiAgICB8Cj4gPj4+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVz
dWx0cy9lMzNiNDA1ZGY5MTNhMGY5YmE3ZTcwNmVhNjgwMzQxODZhNjJhZjFjCj4gPj4+ICAgICAg
YXJtICAgICAgfCAgICBweXRob24tYXV0b2NvbW1hbmQtMi4yLjIgICAgfAo+ID4+PiBodHRwczov
L2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvN2RjMmQ3M2IxMjRmZGJmMWU4NTYwODU3
ZjUzZDljMzE2MDJlN2UxMgo+ID4+Cj4gPj4gU29sdmVkIHZpYQo+ID4+IGh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDEyMTIwNzA4NDUuMTYy
MzM1MC0xLXllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tLwo+ID4KPiA+IFRoYW5rcy4gQ2FuIHlv
dSBhZGQgc29tZSBtb3JlIGRldGFpbHMgYWJvdXQgd2hhdCB0cmlnZ2VyZWQgdGhpcyBpc3N1ZT8K
PiA+IElzIGl0IHJlbGF0ZWQgdG8gYSB2ZXJzaW9uIGJ1bXAgb2YgcHl0aG9uIC8gc2V0dXB0b29s
cz8KPgo+IEZvciBpbmZvLCBJIG1lcmdlZCB0aGUgcGF0Y2ggZnJvbSBUaG9tYXMgWzFdIGluIFsy
XSB3aGljaCB3YXMgY29udGFpbmluZwo+IHRoZQo+IGluZm9ybWF0aW9uIHlvdSB3ZXJlIGFza2lu
Zy4KClNvcnJ5LiBJIHdhcyB0b28gc2xvdy4uLgoKWWVnb3IKCj4gQmVzdCByZWdhcmRzLAo+Cj4g
SnVsaWVuLgo+Cj4gWzFdCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1
aWxkcm9vdC9wYXRjaC8yMDI0MTIyMjE2MjYxNS4xODcyODk3LTEtdGhvbWFzLnBldGF6em9uaUBi
b290bGluLmNvbS8KPiBbMl0KPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9jb21taXQvNjIxZWJjY2YzZjFjYTcwNDQzMTYwMTAzYWUxMmFiM2VhODlmNjNiZApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
