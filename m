Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E497FF6E8B
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 22:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D844606A9;
	Tue, 17 Mar 2026 22:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXgvJ5IHcGCX; Tue, 17 Mar 2026 22:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CBD4606E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773785522;
	bh=tNH0wfEtzxBK8WaPZc3/oSKKlQzSjKrsI54Jk8+fm94=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=obyKpy/VT8jWm2fBXSqIAm49vbNmJ5+BqSHdmkgynd/Nf/LM2Li4uycNr0qJ0KA0d
	 OcmYgOlbThi3Rerbzfa/TDTGuSn46mVurz53an5E5S35NN1GU/TPztGxPJeDvx57Bn
	 iew3SoznR/c1aGumsZ14eITos4rJ7ctiLomkKDqOZHddDaJU1m4yNJRibcysHFG+2q
	 +xTS3Hk0Mbf2lKEEHcH6xPytOFGGnQG+VWprcEogxRAzQv14gYdIRl+w5/kysbpgTl
	 nbzox0anFU5MFpKU5u52WNCJMsQegQJfryR5kHPL98s/pVwvqQVChn6y4akZ4lGnty
	 FMSynB+LYHmWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CBD4606E6;
	Tue, 17 Mar 2026 22:12:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5C803BE
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2B9A40794
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqQoxBvZlGp7 for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 22:11:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7DDBE40722
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DDBE40722
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DDBE40722
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:11:59 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so51475655e9.0
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773785517; x=1774390317;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3fZq0O/b2VLsliNyZBYw6GwFo+noRqmF5RjBMFTdvOA=;
 b=FMYTHRtzokPc4ZMbCgxH7Xn+4bDXfAJJ1qskoyvpVH4wwg3iS9klShmKdCyoDcbXwS
 zc4HrPUkYT5idq016obo/S3tIAd+d5ASH3KZqx2Dz0pRcoRp9L9YecpwvO3INZdSVcI7
 rkogwppPCvNaA3f2mLi2Wo6xbPtzF7DJKjZrz4AkEJ9gqOWrSutuTGOerD07IH9Ew4Sm
 adoCFoAvcFeXfIJ7IfWmTCCQtE+0bdFtx4a1BLk04pjulNYUA+Yc3ojcbdj0Ms5ehjFk
 bO8OiDJmIgtIGwwNB9o/vTfJksEvhU9enIvzU0IvL34C+yI91a6VqJr5f98gCNrx/YPN
 15Aw==
X-Gm-Message-State: AOJu0YwNtiKQnGFlQ+H5vfDWUi1hDtcpdQbussSeSaM2Sj4m0FLQ/KcD
 M/Kxxk0mcQv9VIaciCVwaWhov0sRNbzNl5KxKyR9yHqTcXUUFDxSyThclTqU7J/x+c4=
X-Gm-Gg: ATEYQzxtAPvLrce5nWTI3ekA1sLJ+c6/Cx/6WOX4racu3rZ8QzhM3iHTLGx1ummKNns
 kum5oG+nGtbn+w6RSHH9EhUYBfGGdBJQhV2VtpE8SaKwtEOuZVljqdweTCz+wpnrjkwm7BK3E9M
 TI3q3gjIxt3YWE7SuhUaHGxGB4CnkuLAR9nJR7LV2dnyClcSpWPtFCIPegjgvPP5pv6RPPyP0++
 HEG55kjXeRyT8vq58vbcf0liw0+Mbmo0MejLwG53OTSuieHTk8CSl6trUhHM2wyiClhpeQ3+swi
 hDk50rVoTc21zxDzQH6fIfOHJ5jM2Hvx2y61G1vIT0uSm9JQ08Oi44zjLfJi2uA1/J4kOvSm7+u
 kXUlVBVhgUJjdBYGmDopujqrgh3H3jwp//lVA0hT3e90BXaq8B9R3Dwgjub7ynJfx/5CPKsVYpp
 WzG5D3CWTFUcIy7uajjKkx8V6+6sbbucZQH951oBdpIc5+p6qsyT7XOLdBvURyQ73sQ5sooncUG
 LyFt09RrwOg4S/pxJ8NIjpLSREXi7Lp96Gci/W3qt4M/IzluO3H4uPxKh3mt/CxMwKl32jA7QdY
X-Received: by 2002:a05:600c:1d0b:b0:485:45fb:3472 with SMTP id
 5b1f17b1804b1-486f441bacdmr19901925e9.7.1773785517101; 
 Tue, 17 Mar 2026 15:11:57 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b518588a0sm4006152f8f.16.2026.03.17.15.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 15:11:56 -0700 (PDT)
Message-ID: <3cf0fab0-f297-4378-9dc3-a63ce6e5a304@smile.fr>
Date: Tue, 17 Mar 2026 23:11:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls
 <bernd@kuhls.net>, Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
References: <20250909161325.59760-1-bernd@kuhls.net>
 <CADvTj4pYf0uymrkZUuWgahWK=pm5CgTJL5U+gwbwKExK1so5jA@mail.gmail.com>
 <CADvTj4p=xuJQ=3wRnWuKw9eBxTTD2Pntj+5aCyqeQfnBDsdqsQ@mail.gmail.com>
Content-Language: fr, en-US
In-Reply-To: <CADvTj4p=xuJQ=3wRnWuKw9eBxTTD2Pntj+5aCyqeQfnBDsdqsQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773785517; x=1774390317; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3fZq0O/b2VLsliNyZBYw6GwFo+noRqmF5RjBMFTdvOA=;
 b=rEvcHGfIHmBCjnN1uTOQCywa4Zlyv2KVRQFYEGJlfE1SOJPVOkkELm0Kv7LM0loPfD
 JGjj4bpI9jjD1TjRzHMYv4/QF0X1aXfGI/CM/KCpBHUc4DCsTUXGfz803YZLzKmz65sl
 ktdSOkJthVddSrXR8Ev045mmssYaKPmCvKqX8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=rEvcHGfI
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.2.2
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

SGVsbG8gSmFtZXMsIEFsbCwKCkxlIDE5LzAyLzIwMjYgw6AgMTg6MjYsIEphbWVzIEhpbGxpYXJk
IGEgw6ljcml0wqA6Cj4gT24gVGh1LCBTZXAgMTgsIDIwMjUgYXQgOToxN+KAr1BNIEphbWVzIEhp
bGxpYXJkCj4gPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBPbiBUdWUs
IFNlcCA5LCAyMDI1IGF0IDEwOjIy4oCvQU0gQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4g
d3JvdGU6Cj4+Pgo+Pj4gUmViYXNlZCBwYXRjaCAwMDAxLgo+Pj4KPj4+IFJlbW92ZWQgR2FsbGl1
bSB4YSBzdGF0ZSB0cmFja2VyOgo+Pj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21l
c2EvbWVzYS8tL2NvbW1pdC8zYmUyYzQ3ZGIyMzE4ZWJlOTIyMmM4MGJmOTgxMDM4ZGY0Mzc0YjJk
Cj4+Pgo+Pj4gTGVnYWN5IGhhbmRsaW5nIGZvciBibGluZCBvcHRpb24gQlIyX1BBQ0tBR0VfTUVT
QTNEX05FRURTX1hBIGlzIG5vdAo+Pj4gbmVjZXNzYXJ5Lgo+Pj4KPj4+IFJlbGVhc2Ugbm90ZXM6
Cj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9tZXNhLWFubm91bmNl
LzIwMjUtQXVndXN0LzAwMDgxNS5odG1sCj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9hcmNoaXZlcy9tZXNhLWFubm91bmNlLzIwMjUtQXVndXN0LzAwMDgxOC5odG1sCj4+PiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9tZXNhLWFubm91bmNlLzIwMjUtU2Vw
dGVtYmVyLzAwMDgyMC5odG1sCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJl
cm5kQGt1aGxzLm5ldD4KPj4+IC0tLQo+Pj4gIHBhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNk
LWhlYWRlcnMubWsgICAgICAgICAgICAgICB8ICAyICstCj4+PiAgLi4uLW1lc29uLW9wdGlvbi10
by1kaXNhYmxlLW9wdGlvbmFsLW5lb24tc3VwcG9yLnBhdGNoIHwgIDYgKysrLS0tCj4+PiAgcGFj
a2FnZS9tZXNhM2QvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDkg
LS0tLS0tLS0tCj4+PiAgcGFja2FnZS9tZXNhM2QvbWVzYTNkLmhhc2ggICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDYgKysrLS0tCj4+PiAgcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTAgKystLS0tLS0tLQo+Pj4gIDUgZmlsZXMg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNhM2QtaGVhZGVycy5tayBiL3BhY2thZ2Uv
bWVzYTNkLWhlYWRlcnMvbWVzYTNkLWhlYWRlcnMubWsKPj4+IGluZGV4IDVjZDA1Y2M5ZmYuLjU5
MzJkNzNmMmMgMTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1o
ZWFkZXJzLm1rCj4+PiArKysgYi9wYWNrYWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJz
Lm1rCj4+PiBAQCAtMTIsNyArMTIsNyBAQCBlbmRpZgo+Pj4KPj4+ICAjIE5vdCBwb3NzaWJsZSB0
byBkaXJlY3RseSByZWZlciB0byBtZXNhM2QgdmFyaWFibGVzLCBiZWNhdXNlIG9mCj4+PiAgIyBm
aXJzdC9zZWNvbmQgZXhwYW5zaW9uIHRyaWNrZXJ5Li4uCj4+PiAtTUVTQTNEX0hFQURFUlNfVkVS
U0lPTiA9IDI1LjEuOAo+Pj4gK01FU0EzRF9IRUFERVJTX1ZFUlNJT04gPSAyNS4yLjIKPj4KPj4g
SXQgbG9va3MgbGlrZSB0aGlzIGludHJvZHVjZWQgYSByZWdyZXNzaW9uIGZvciBjb2codGhpcyBw
YXRjaCB3YXMgZmxhZ2dlZAo+PiB3aGVuIEkgYmlzZWN0ZWQgdGhpcyBjb2cgY3Jhc2gpOgo+PiBT
ZXAgMTcgMjE6MzQ6MTEgYnVpbGRyb290IGNvZ1sxMDM3OF06IFJlbmRlcmVyIHByb2Nlc3MgdGVy
bWluYXRlZCBhbmQKPj4gZmFpbGVkIHRvIHJlY292ZXIgd2l0aGluIDEwMDBtcwo+PiBTZXAgMTcg
MjE6MzQ6MTEgYnVpbGRyb290IGNvZ1sxMDM3OF06IDw+IENyYXNoITogVGhlIHJlbmRlcmVyIHBy
b2Nlc3MKPj4gY3Jhc2hlZC4gUmVsb2FkaW5nIHRoZSBwYWdlIG1heSBmaXggaW50ZXJtaXR0ZW50
IGZhaWx1cmVzLgo+PiBTZXAgMTcgMjE6MzQ6MTEgYnVpbGRyb290IGNvZ1sxMTU1OF06IGxpYkVH
TCB3YXJuaW5nOiBmYWlsZWQgdG8gZ2V0Cj4+IGRyaXZlciBuYW1lIGZvciBmZCAtMQo+PiBTZXAg
MTcgMjE6MzQ6MTEgYnVpbGRyb290IGNvZ1sxMTU1OF06IGxpYkVHTCB3YXJuaW5nOiBNRVNBLUxP
QURFUjoKPj4gZmFpbGVkIHRvIHJldHJpZXZlIGRldmljZSBpbmZvcm1hdGlvbgo+PiBTZXAgMTcg
MjE6MzQ6MTEgYnVpbGRyb290IGNvZ1sxMTU1OF06IGxpYkVHTCB3YXJuaW5nOiBmYWlsZWQgdG8g
Z2V0Cj4+IGRyaXZlciBuYW1lIGZvciBmZCAtMQo+PiBTZXAgMTcgMjE6MzQ6MTEgYnVpbGRyb290
IGNvZ1sxMTU1OF06IGxpYkVHTCB3YXJuaW5nOiBlZ2w6IGZhaWxlZCB0bwo+PiBjcmVhdGUgZHJp
MiBzY3JlZW4KPj4gU2VwIDE3IDIxOjM0OjExIGJ1aWxkcm9vdCBjb2dbMTE1NThdOiBsaWJFR0wg
d2FybmluZzogZWdsOiBmYWlsZWQgdG8KPj4gY3JlYXRlIGRyaTIgc2NyZWVuCj4+IFNlcCAxNyAy
MTozNDoxMSBidWlsZHJvb3QgY29nWzExNTU4XTogQ291bGQgbm90IGNyZWF0ZSBXUEUgRUdMCj4+
IGRpc3BsYXk6IEVHTF9OT1RfSU5JVElBTElaRUQuIEFib3J0aW5nLi4uCj4gCj4gVGhpcyBzaG91
bGQgZml4IHRoZSBjcmFzaDoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjAyMTgw
NjMxMjMuNTQ2MDY3LTEtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNjAyMTgwNjMxMjMuNTQ2MDY3LTItamFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbS8KClRoYW5rcyBmb3IgeW91ciBoZWxwIHRvIGZpeCB0aGlzIGlzc3VlLgoKVGhpcyBv
bmUgaXMgZGVmaW5pdGl2ZWx5IG5vdCBvYnZpb3VzLi4uCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoK
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
