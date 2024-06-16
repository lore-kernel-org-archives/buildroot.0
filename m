Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C036C27C6E
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 09:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF4998210B;
	Sun, 16 Jun 2024 09:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvcz6flrvnyt; Sun, 16 Jun 2024 09:10:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD3318210C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD3318210C;
	Sun, 16 Jun 2024 09:10:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4222D1BF2C8
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 09:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D01A6069A
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 09:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41FBmjhH8FDf for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 09:10:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30ED66067C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30ED66067C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30ED66067C
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 09:10:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4398213F8C8;
 Sun, 16 Jun 2024 11:10:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Jun 2024 11:10:12 +0200
Date: Sun, 16 Jun 2024 11:10:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Dugast <francois.dugast.foss@gmail.com>
Message-ID: <Zm6r9D68LrxvCrCZ@landeda>
References: <20240615064632.1708859-1-francois.dugast.foss@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240615064632.1708859-1-francois.dugast.foss@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718529015;
 bh=JmzEal/7ChqGwQkZM4Ezqg7anDDROmyjL4+Lcb9Snhg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tJ9O28TY0KD5MDw9xzCgQL5eRLnBBO/r7IWZeGyf4d6Qyn2UpdBgwlvfIO1HPZfha
 E3TcaUznVgORYtEGgedu1ZWcnAPDHqlNKUNGwUQ9XYbfYqBV0vGo+Ykkss8XvuuSBN
 N+eE7kDMHZyJOfUZQJp3a4PFrqXS15voJkUPSyrctZbrF8gVCwlVl3FJB3yJKkof6s
 asgPWOOqd7EOlw+GCS1spOx5fXwslP7ULn3gYaK/MdIhTPVPzlHrqKhCH4Co2twcDP
 t2ieeMgNm2C5VzdrmQq6H0lu8ufhrXNlFomIJT964Tp4+suuq6y2scTcIuLSe+mBZ4
 PV70lp4hezwEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tJ9O28TY
Subject: Re: [Buildroot] [PATCH 1/1] configs/hifive_unmatched: new board
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
Cc: Alistair Francis <alistair@alistair23.me>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI0LTA2LTE1IDA4OjQ2ICswMjAwLCBGcmFuY29pcyBEdWdh
c3Qgc3Bha2UgdGh1c2x5Ogo+IEFkZCBzdXBwb3J0IGZvciB0aGUgSGlGaXZlIFVubWF0Y2hlZCB3
aXRoIG1haW5saW5lIGNvbXBvbmVudHM6Cj4gIC0gVS1Cb290IDIwMjMuMDQKPiAgLSBMaW51eCA2
LjgKPiAKPiBCb2FyZCBob21lcGFnZToKPiAgLSBodHRwczovL3d3dy5zaWZpdmUuY29tL2JvYXJk
cy9oaWZpdmUtdW5tYXRjaGVkCj4gCj4gVGhlIGNvbmZpZ3VyYXRpb24gZm9yIHRoZSBIaUZpdmUg
VW5tYXRjaGVkIGlzIGJhc2VkIG9uIHRoZSBleGlzdGluZwo+IGNvbmZpZ3VyYXRpb24gZm9yIHRo
ZSBIaUZpdmUgVW5sZWFzaGVkLiBUaGUgZmlsZXMgd2hpY2ggY2FuIGJlIHNoYXJlZAo+IGJldHdl
ZW4gdGhlIHR3byBhcmUgbW92ZWQgdG8gYSBjb21tb24gZGlyZWN0b3J5IHVuZGVyIGJvYXJkL3Np
Zml2ZS4KClRoYW5rcyBmb3IgdGhpcyBwYXRjaC4KCklkZWFsbHksIGl0IHdvdWxkIGJlIHNwbGl0
IGluIGEgMy1wYXRjaCBzZXJpZXM6CgogIC0gaW50cm9kdWNlIHRoZSBjb21tb24gZGlyZWN0b3J5
IGFuZCB1c2UgaXQgZm9yIHVubGVhc2hlZAogIC0gaW50cm9kdWNlIHRoZSBoYXNoIGNoZWNrIGZv
ciB1bmxlYXNoZWQgWzBdCiAgLSBpbnRyb2R1Y2UgdGhlIG5ldyB1bm1hdGNoZWQKClswXSB3ZSBu
b3cgcmVxdWlyZSB0aGF0IG5ldyBvciB1cGRhdGVkIGRlZmNvbmZpZyBmaWxlcyBkbyBmb3JjZSBj
aGVja2luZwpoYXNoZXMgb24gdGhlIGRvd25sb2FkZWQgbWF0ZXJpYWxzLiBTZWUgZm9yIGV4YW1w
bGUgY29tbWl0cyA5ZWI3ZWI0NTZhNmEKb3IgYzE1NTRkZjY4OGNiIGZvciBzb21lIGhpbnQgb24g
aG93IHRvIGRvIHRoYXQuCgpDb3VsZCB5b3UgbG9vayBpbnRvIHRoYXQgYW5kIHJlc3BpbiBhbiB1
cGRhdGVkIHBhdGNoc2V0LCBwbGVhc2U/CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAz
NzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAg
ICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFgg
IEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1h
LWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3ku
ICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
