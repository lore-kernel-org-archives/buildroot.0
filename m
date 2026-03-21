Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019C7109446A
	for <buildroot@archiver.kernel.org>; Sat, 21 Mar 2026 11:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 850F861062;
	Sat, 21 Mar 2026 11:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mt3ar6uj6mwf; Sat, 21 Mar 2026 11:25:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C207612F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774092313;
	bh=bEx2DwJm3kZ1NTrdNUSUDaiMRyqlJ6cKFf6k1J05fl4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VWuQ11jdFSiJAH8i0yLcFcHnVXFqCxZq+flhSi2zBR7u++76M7/s2wEeGV4vyVuki
	 pRe7Crzd+L9h9NelGxOAZjulrUDRa7iLsBma/uztHG+dBxE30Jdl2Zn/9nIaaA9wYW
	 A1uYXWR4egflz3J6kiQqmFT6ID/7P5N95O2vX1rTe07sYOXAxVKExG7i8vd5re7gkF
	 4bwLZa8wdV7Crh4cJzMw0LmKOIRRwTqGQDBKHSOX2ThlS4lt2CtFn1HQH3ysffj3+6
	 +I6TpTUULWsAF3y9ILEhosLDkdAuhp1bXvYl1hJBbNlQ4CQv9j7n84vy75OjGvc5x+
	 gI231/apkCjPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C207612F0;
	Sat, 21 Mar 2026 11:25:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F11D6265
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 11:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2A21849B8
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 11:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ME1OJzJuM2W7 for <buildroot@buildroot.org>;
 Sat, 21 Mar 2026 11:25:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E83F9849B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E83F9849B7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E83F9849B7
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 11:25:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8F8DB6012F;
 Sat, 21 Mar 2026 12:25:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 21 Mar 2026 12:25:06 +0100
MIME-Version: 1.0
Date: Sat, 21 Mar 2026 12:25:06 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260315191748.762183-1-bernd@kuhls.net>
References: <20260315191748.762183-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <31e47ae685216158c50ac5b039bfeaad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774092308;
 bh=fs3NnTVp8hP+0a241uWtw+K23PRRprQWacEo+M3xlaU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ELmnLw6oETpztXZsD6ZVx+Hhs3gRhi/iY8vAxjWe80I0ZUHxks2Z0rmyFioDUcSxv
 HWLBHwQXrt7YnTgPaXYaMbgya4mvLYZu5ZzNSS6hKPZFeVLsaChGPd4+vwM6BTatez
 CNDxKEc4T4rlZlSeaqK6YW+n1+ulz6wRADu1r96Wg0dVDTPg/QvBBjQWRGCIznO3C+
 rKkwRh4EYg+zrIN3+HBO+WaevTXKio+RsFKAKIPVueyxcSRWVRKsHMj9J4l4L6m18D
 eHP+p2OsRsk+knTzuquVKJ6rX2PSQTsrxh2AH6DkQPHyOvo3iOVIgQ0v5bgRdpyFKE
 RGZuaOCnsiNcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ELmnLw6o
Subject: Re: [Buildroot] [PATCH 1/1] package/igh-ethercat: fix build with
 kernel >= 6.15
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTUvMDMvMjAyNiAyMDoxNywgQmVybmQgS3VobHMgd3JvdGU6Cj4gQnVpbGRyb290IGNvbW1p
dCBjNmU5MTQ4MTk3NzQyMTJlNzliZTE5ZjYyNzA2ZjY1M2I5NjQ2ZjExIGJ1bXBlZCB0aGUKPiBw
YWNrYWdlIGZyb20gMS42LjMgdG8gMS42LjguIFRoZSBwcmV2aW91cyB2ZXJzaW9uIDEuNi4zIGZh
aWxlZCB0byBidWlsZAo+IHdpdGgga2VybmVsID49IDYuMTUgYXMgc2VlbiBoZXJlOgo+IGh0dHBz
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy83ZjQvN2Y0YjNlNjMyYTVkZTY3ZGVj
MjYyNGEyMDk3MDQ1ZWM0ZDc2NzI0Ni8KPiAiZXhhbXBsZXMvbWluaS9taW5pLmM6NTI4OjU6IGVy
cm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbgo+ICDDouKCrMucZGVsX3RpbWVy
X3N5bmPDouKCrOKEoiBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgIDUyOCB8
ICAgICBkZWxfdGltZXJfc3luYygmdGltZXIpOyIKPiAKPiBUaGUgYnVtcCB0byAxLjYuOCBpbmNs
dWRlcyBhIGNvbW1pdCB3aGljaCBmaXhlcyB0aGUgcHJvYmxlbToKPiBodHRwczovL2dpdGxhYi5j
b20vZXRoZXJsYWIub3JnL2V0aGVyY2F0Ly0vY29tbWl0LzI0MDA4MGYxMTA2MmNjYTQyZjkxMzJj
ZDMyZmFkM2I5OTM1MDI2NjUKPiAKPiBidXQgaXQgb25seSBtYXNrZWQgb3RoZXIgYnVpbGQgZXJy
b3JzIHdoaWNoIHdlcmUgZm91bmQgYnkgdGhlCj4gYXV0b2J1aWxkZXJzOgo+IGh0dHBzOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8xYTUvMWE1NDZlZTIyMTdlNzg0M2I4NTJhNWI3
OWI0NzdlZjIzZGY2YTA2NC8KPiAiZXhhbXBsZXMvdHR5L3R0eS5jOjIzNjo1OiBlcnJvcjogaW1w
bGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24KPiAgJ2RlbF90aW1lcl9zeW5jJyBbLVdpbXBs
aWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgIDIzNiB8ICAgICBkZWxfdGltZXJfc3luYygm
dGltZXIpOyIKPiAKPiB3aGljaCBuZWVkIHNpbWlsYXIgZml4ZXMuCj4gCj4gRml4ZXM6Cj4gaHR0
cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzBiYS8wYmE3MTYzZTUwMTIzMDlk
M2EzMWFhNzE4NmNhOTVhOWQ1YzhkZTY5Lwo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxz
IDxiZXJuZEBrdWhscy5uZXQ+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
