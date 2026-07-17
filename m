Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC859C44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92F5B40B07;
	Fri, 17 Jul 2026 15:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fuLZtwOL5h6; Fri, 17 Jul 2026 15:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C446340B5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303240;
	bh=auvO9SCpmGWDG81NdyWRff7ib5MVY6P9Uu9Xop6XQdI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LHlYXySK7jHakg5D5/nqCuBfW3jkaWRXM2ktya+CKGe0LiOvAwt7Z7jwx7bwfEBw/
	 EEAmS69OUpEalwPKdmExgzOYxpBLp8G1aOr7CxyhSZF7dzHdIdvkVworWwVKscclag
	 nsJz8xy9y55PimeAAY5Wvz4LH2t+xuD6AMWK3RMIu2jHdlB+i+cBkTsNx+BKkCzNgY
	 Wd7VxSrHbykIwyFSPpyFYDckcD9o4v6bQks+1iHzszExYmnZTNv5XUFDIQfkimX1ft
	 5wBmHE8dJw+rBm22dH35Dyr5FJWBQEFKMOfwzzaISCP+WClYUJLYcKDYxx9J8JYpfL
	 nzQt41h6v82ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C446340B5D;
	Fri, 17 Jul 2026 15:47:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70F5E1F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56F91402C7
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvfeVzBFni3D for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3892640291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3892640291
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3892640291
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:16 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-493ec555a26so52937675e9.0
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303234; x=1784908034;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9K5Ns2YcJreCsFu9IZ7VFgB9wPYlU/eQmaPQbCCl31A=;
 b=bCA7fOktzYbGS0CKHVBqU8YDx+FB+jrMV4kiozTEUNbO5/cOPhF5BDFaBg9hIklJo3
 x+NudUb0dEWhZS3vCSxabwtqJ2LYxSe3ru2C3/6z/c4e8iUmTDaF/vg0RAZvhZys9XWm
 ekPZC7Fe9Ey9oB+N0TAq4MV/eW0LQ5itq/e7YHR0ggzXydwpkSKPvtycyvxkL2BBSlcQ
 aC+kp9g35mSMjleJbjzoR+a0ho7D4xAz/5vp1QKbuNmrhb5SBVvG/BloYVVnt907Hg4w
 MFxwkbXploAy7qpLE+O7PMcBWLtx16PRc+iDqaUHLOehDxT3GKM90Krpzkaj7VZHPzwg
 zf4w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr4bCiRAmaMartyJbeWsP2z/QyJRidB2CH7ULyPwwUoqdYvu2k9YlbbBUHQDCS4U61ISuCr7BuTTQM=@buildroot.org
X-Gm-Message-State: AOJu0Yxp593ynijz7AayXfDYauZPET7QrLQLYy4FMPD8ffLGrGDWXpN2
 9HNB+YBTS3dzl9YaTa4E89S/ScTnFi8hCv5efvG+ULptG6kYyOILAK/dikGbWOjNaNw=
X-Gm-Gg: AfdE7cke/jm0eIq2QWEmbl89QCnm5EoLNNlqNG+xtyETPjD5agodAmsoFeoq6rriS3l
 Yn8Hqbx9A+1cbPaoc5Zfo7Dtyzw6CXxL6DTbZtv9MUIrylBFiT7RztJU4HDX5DJr3Oz6sTuUqs3
 BrOc7iobsjKkDSmMo+cwJHnP0bdslatLbU/IFSSE5OWgooPBQqLIq1pfN6R1Td6MOMxSV8ck4C1
 gAlkkpPB8JTDzoyxdaJNzfAOWNZJhddEXN4CicxCNXMdWmnpe0Z1dBwHEnaw9dNHZG9xb0/Y0Ne
 66H2GT9zPAZ+EyjzRUS0ObYCbaI7/zW7fX7hPnR0Tr8hsHrxG95LPQe7oGMR1ycTr0ANLxvx6yg
 FG8mxCBjY1qClo3UtdMliw9nHKeOysoZMiDskccaueHSr2gWe/1ldYOuM+q/OlHGDbCvdiU4=
X-Received: by 2002:a05:600c:19c7:b0:493:efcd:b809 with SMTP id
 5b1f17b1804b1-4954a3e2191mr35926885e9.6.1784303234136; 
 Fri, 17 Jul 2026 08:47:14 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954a2edbe4sm59306605e9.12.2026.07.17.08.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:13 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:12 +0200
Message-ID: <20260717154713.191571-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260710215456.2365392-1-bernd@kuhls.net>
References: <20260710215456.2365392-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303234; x=1784908034; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9K5Ns2YcJreCsFu9IZ7VFgB9wPYlU/eQmaPQbCCl31A=;
 b=PirW48CCi2N7L9bpk86j+hcemfJ3yU1PgnAnAZBKZKV+9m/+b8Z6wZwhfFuKZ+p4xG
 yXpK4i1K5ZvhvU0Pf3Hz7tKyNIVO+X7cw6wyB+GbW0cGv6mGqryDvrTYGTnYM4DEFAzZ
 q2WO+f9Gj+mxbGswrEK3LNeRUA410cwEkVGlAeJT/22F411e2OG5rM5WlDurTwA6t6gT
 +rJTz0vUmNVFDjn+fkaviDWPiE6syCMKdeMekbRi0PFrQKNgLvAuvPZ3TZVpfPHrMrVQ
 cQgzoGAXsrY8vt3aan5kUiuJxK4Syb3QM0YRUZkyNZxuafFFeUhMQY7xSKlX81YxiqzS
 WA6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PirW48CC
Subject: Re: [Buildroot] [PATCH 1/2] package/igt-gpu-tools: fix musl build
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gQnVpbGRyb290IGNvbW1pdCBmOWE5MWJmNjBlMzU2MTcxNTdiOTUwZWVh
MDVmYzZmNjE0NGQ2NTBjIGJ1bXBlZCB0aGUKPiBwYWNrYWdlIHRvIHZlcnNpb24gMi4zIHRoYXQg
aW5jbHVkZXMgdXBzdHJlYW0gY29tbWl0Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2RybS9pZ3QtZ3B1LXRvb2xzLy0vY29tbWl0LzZhOGIzM2UzNTM2MjcxODdmMWI1MzBmMzNjNGJk
M2Y1MjgyODgzZjAKPiB3aGljaCBtYWtlcyB1c2Ugb2YgUEFUSF9NQVggY2F1c2luZyBidWlsZCBl
cnJvcnMgb24gbXVzbC4KPiAKPiBGaXhlczoKPiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qu
bmV0L3Jlc3VsdHMvNDJhLzQyYTZlOWQ5NjUyYzFlYjk3YzhjNDlhZWQ3NWQyMTBiZjJhZmMwNjYv
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KCkFwcGxp
ZWQgdG8gMjAyNi4wNS54LiBUaGFua3MKCj4gLS0tCj4gR2l0bGFiIHBpcGVsaW5lcyBwYXNzZWQ6
Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2JrdWhscy9idWlsZHJvb3QvLS9jb21taXRzLzQwM2ZlZGQ3
OWFmODE1NmI3ZGIzNmY2OTgxN2Y0OWMxZTcxNjg0NGIKPiAKPiAgLi4uZnJlcXVlbmN5LWluY2x1
ZGUtbGltaXRzLmgtdG8tZml4LW11LnBhdGNoIHwgMzYgKysrKysrKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9pZ3QtZ3B1LXRvb2xzLzAwMDEtdG9vbHMtaW50ZWxfZ3B1X2ZyZXF1ZW5jeS1pbmNsdWRl
LWxpbWl0cy5oLXRvLWZpeC1tdS5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2lndC1n
cHUtdG9vbHMvMDAwMS10b29scy1pbnRlbF9ncHVfZnJlcXVlbmN5LWluY2x1ZGUtbGltaXRzLmgt
dG8tZml4LW11LnBhdGNoIGIvcGFja2FnZS9pZ3QtZ3B1LXRvb2xzLzAwMDEtdG9vbHMtaW50ZWxf
Z3B1X2ZyZXF1ZW5jeS1pbmNsdWRlLWxpbWl0cy5oLXRvLWZpeC1tdS5wYXRjaAo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMWQ4MThkY2MyMgo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9wYWNrYWdlL2lndC1ncHUtdG9vbHMvMDAwMS10b29scy1pbnRlbF9ncHVfZnJl
cXVlbmN5LWluY2x1ZGUtbGltaXRzLmgtdG8tZml4LW11LnBhdGNoCj4gQEAgLTAsMCArMSwzNiBA
QAo+ICtGcm9tIDQ4YTE3Nzk1OGE5ZWNmZjhmN2NlZTM3OWFmZmIyZjM1OTg0YjU4YTkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+
Cj4gK0RhdGU6IEZyaSwgMTAgSnVsIDIwMjYgMjA6MzQ6MDEgKzAyMDAKPiArU3ViamVjdDogW1BB
VENIXSB0b29scy9pbnRlbF9ncHVfZnJlcXVlbmN5OiBpbmNsdWRlIGxpbWl0cy5oIHRvIGZpeCBt
dXNsIGJ1aWxkCj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFp
bjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gKwo+
ICtGaXhlcyBidWlsZCBlcnJvciBzZWVuIHdpdGggbXVzbC1iYXNlZCB0b29sY2hhaW5zOgo+ICsK
PiArLi4vdG9vbHMvaW50ZWxfZ3B1X2ZyZXF1ZW5jeS5jOjkwOjE5OiBlcnJvcjoKPiArIOKAmFBB
VEhfTUFY4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ICsgICA5
MCB8ICAgICAgICAgY2hhciBwYXRoW1BBVEhfTUFYXTsKPiArCj4gK1Vwc3RyZWFtOiBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNzM5MTU5Lz9zZXJpZXM9MTcwMjA3JnJl
dj0xCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+
ICstLS0KPiArIHRvb2xzL2ludGVsX2dwdV9mcmVxdWVuY3kuYyB8IDEgKwo+ICsgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gKwo+ICtkaWZmIC0tZ2l0IGEvdG9vbHMvaW50ZWxfZ3B1
X2ZyZXF1ZW5jeS5jIGIvdG9vbHMvaW50ZWxfZ3B1X2ZyZXF1ZW5jeS5jCj4gK2luZGV4IDYzMTZj
MmU1OC4uN2RmN2YzMzFkIDEwMDY0NAo+ICstLS0gYS90b29scy9pbnRlbF9ncHVfZnJlcXVlbmN5
LmMKPiArKysrIGIvdG9vbHMvaW50ZWxfZ3B1X2ZyZXF1ZW5jeS5jCj4gK0BAIC0yNSw2ICsyNSw3
IEBACj4gKyAjaW5jbHVkZSA8ZGlyZW50Lmg+Cj4gKyAjaW5jbHVkZSA8ZmNudGwuaD4KPiArICNp
bmNsdWRlIDxnZXRvcHQuaD4KPiArKyNpbmNsdWRlIDxsaW1pdHMuaD4KPiArICNpbmNsdWRlIDxz
dGRpby5oPgo+ICsgI2luY2x1ZGUgPHRpbWUuaD4KPiArICNpbmNsdWRlIDx1bmlzdGQuaD4KPiAr
LS0gCj4gKzIuNDcuMwo+ICsKPiAtLSAKPiAyLjQ3LjMKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
