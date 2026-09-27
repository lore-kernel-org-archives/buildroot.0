Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C3BC98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6EC2407FE;
	Sun, 27 Sep 2026 10:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yufW0oPeTi4X; Sun, 27 Sep 2026 10:47:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 098B74084E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506029;
	b=eJuFWCahmM1zUzHIyV03IJTA2hsK7QnqGIV94tiAYJ06LVoiQNxm7133FeSVcD5ALmdA
	 nh+uFjySmq4N1oiZd9WpbQzXz/r8B/yS2hKmhgpaLEv4VujEQrkPAnljJxC/ASbWWv4r4
	 s4vmH+IbmnVq3QH3T/i5TFcUacE1JQuOmjfFZXbg8DdA/c1h04p2c7ewYLSwCvF0+69fs
	 5C4PTrUV5+aHZPCgA3oWtBKTqlcjU3xQfbooH1sEZcR6QryrcD1QTV8mfshUieKUbOTr1
	 aq6BFYLuN57H6bUrdBkafLwZoci0pVOEUXgeifY91riKRZTaiemOfp3zAGhL6eMeonw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506029;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9TLHPQ4ROuimtB7mO644o6aJnJzeswyG9IqO88KyurQ=;
	b=BzAWZXXX6GDPOX62jiQ7PFkjtTYdVbgRJLDaPU9k6IBlVMXwMyfhmq15WEgBzHYlL19q
	 IG9gN2VB0DVOXbBpzX/tnXQTj8xvI73VkEJ3DkvZDjoYtB1qTqqrJitK3W1SYYppn94vf
	 huJe3TLybxRQmvhMBXhPEoM0HJHP/2+1mMudZl0Mwee3dZEX3h9pU/L/iPdskZ/mOxjR5
	 y3sgHEpgjACugfhwiPqQj5cN5IoSV8LxCb+6GU5g1sjDgKMvRUxmpzR15E8BDZiwefuv9
	 c3d1LVX28MebTctPGAQFzfb7lMq4356BNPuqlDhFRvQvESFsBTzk3koy3vLcwjN51ZA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rMG9IYT8;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506029;
	bh=9TLHPQ4ROuimtB7mO644o6aJnJzeswyG9IqO88KyurQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=A9beSfMvPMCmBnBqOiWutZm3tX1lKyNg5MhGLYtY74PcOXBAA2cmkxRUVcc4W+gjq
	 4PUCBRbQIvDpt+1UHOrMemFjy/ErkTZaxuXQcBuvG1sz7e4GMcp1DNRHu+dgZF0StE
	 uzMSVFc5zw3kKcFpKbgaX9qswumwTJFikmeIZgD4rY7dMWj/MoOPb0V1xCzgWzu8wc
	 4Za0P+WF2y9L2rJWN4g8suRXSIErB6Wp+WqgV1gR7I95txZ/DXYyqHVspUtUg2j2W7
	 EGA3XSldcDOeO2U7HbrhbZHhqjDy6R4HFQ6fu5YbCOwFJ8e2hWGjAFFd0Iseg1OAVO
	 YO68NDaFdFbgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 098B74084E;
	Sun, 27 Sep 2026 10:47:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9589334
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A70C34084E
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPUyURVma7CW for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:47:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B73CF407FE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506027;
 b=PLi0GbeFMt0L2wlQbL29Fqc6mk/+SNuZe6nDHiMWEv9DdPYm/Yo0uEeekLM0iXcHWOet
 qUrDFdfYUoALAaV0doISWP29hktQGE5a0jrAIpDo0zZnNdbMbDE7+K/E/6Tv3lV6YNo8g
 tBK5ykJP6gr0yiBejFscuYWAaFJKi3Tm9pCYNqIrP141I9pijwuiXzc/eeSmMWQnJiU7o
 Pe3HGlRBtHzKIL2L3l0ePky8zBRa45FZoMSEFyzdx4D+S3TsEKJahj1V48cRZUKF1Qrpa
 zSHKFUrYQ69BH19gTU3mGU486MpWyGdYaDPXPM6hF26lFa2NOMzoanXDHeWrQXimDWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506027;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=paJHYDhT3NPHWu3JbU5vAYV7xq6YLok15BvHVQ/Yl0o=;
 b=D1menLEMx4qvxH7QzRrNWAy8TzBeLQgDKpaUP8t9th9QBErLl7VEyZF7mBll6X6JYLn+
 ZYQkrqVaFrtnHqUE93YgtGp//XdgVL7cnHsFSKBNVpqg5MpdCNbOZbmrXCnFcBJYF+Y/H
 t12lJjV63EMIsXXg9s1Y3ZFqoStbXDYQrEn/mHp3k5bC9gq/9dp9N9Z0ABVyN4FDCKOE1
 1NxTb902SDlSdMwJ1aiWdK2oU7keZ9FyTKI8Rr/4NsHRxKMOGSLxdZ8c+8h0NebsbeQJb
 c3l3aIL0FITFvhZ/eUkTXvC2Y3cvLuL9z4dAcrF8AKi+EmGp1Fism95kml72/cbJGPg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rMG9IYT8; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rMG9IYT8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B73CF407FE
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505831;
 bh=paJHYDhT3NPHWu3JbU5vAYV7xq6YLok15BvHVQ/Yl0o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rMG9IYT8treJia1GAYDfBjKpc//ORINnEpCNW+5A+aP7xFucuujypLbEv2ymo3RT+
 mojOCF2D2TNNwUlR/2NO0JvqPPtlO04snhE3kzILXGtWYymt4Pqwa5B4TtfP2bPLQ2
 HWGPKQNTosRf3sq7gQt0eS2i1VDGvro+7psZQ8gdNYHgEmAiZd51J0h1w+YFrm3Dsu
 nCyoIkChFSvzIsNauh+Xqep7UqMXmTdnAIhxjndUbtAqMO+FdtWsl6yJneOlAqF4jH
 FKt2cnE5E4Glc6LVLkfYeM11N6mOxxnNf1ihuvPP6JW3ZdXmBe31JlKY2bG+JnKW5/
 2zjy4o/MkZRQw==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 Rt92J5lVICXesoM56WfIb98Bp0sw8chpFc6Q4kQt1DBQ576H/n/a7IIE7/BezAMozURy8pE51qA
 4FymTdlzB0Q84OulApTSkp6ImeKYfgzkkSL6NLlDkYyf+Unws+I4qjYBmUEUVQUzBOy8bNLVCN8
 YhKwxS6wHzEi5ATIO1gI0heoBwzUABy45Il5+GttdTWLIXT9FiUmSL4TqKj4YfTjPkU7li6cOYJ
 AbQEy2PGj2iEJWjspVPwLm4W36VA87BGHHDY37FJCEwsReHO+XbbJ/xu63Pl5HoNRQjqHGLqvQg
 BTcTkBu0460e9TsTib81dyukQswQ4Cr5TMEvSmCy3CyZKvM9uoRHAMemFqRT/6tHGR91Dy7mewX
 Zq7N+UjQe8gAMhz1iThFFGfjBNHW6ixu7ZQvYPEhj9fJH9ybC6q/UXufNV2V2f9P9WTmlNriEvF
 kOLOreyAeaJUICGy2pOi6PRz/4Lj3CPgBuxwBgzhIBI4Ge14UKvM9MGU0YnGsux+RqEAts2/A/s
 UNTDA30ecno+SJqZWd7XiACa7LdZlQ6VdwYRJCIA6XlI0BMdMc93yXvd4xNIinWdRfVm5h/AD2U
 /+ERpTVe4fGZVYtZIN7ykWfvocA5j88PB3HMPikSCdbt6qTOzQRaVCv5HFCW94E6Jw==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05E41A4C4F6E;
 Sun, 27 Sep 2026 12:43:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLi-0000000007a-19nl;
 Sun, 27 Sep 2026 10:43:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:45 +0200
Message-ID: <20260927104301.1801638-68-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 67/82] package/rauc: Fix build with OpenSSL
 4.0.0
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiAuLi5OMV9T
VFJJTkdfZ2V0MF9kYXRhLWFuZC1BU04xX1NUUklOR18ucGF0Y2ggfCA0OCArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvcmF1Yy8wMDAxLXNpZ25hdHVyZS11c2UtQVNOMV9TVFJJTkdfZ2V0MF9kYXRh
LWFuZC1BU04xX1NUUklOR18ucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JhdWMvMDAwMS1z
aWduYXR1cmUtdXNlLUFTTjFfU1RSSU5HX2dldDBfZGF0YS1hbmQtQVNOMV9TVFJJTkdfLnBhdGNo
IGIvcGFja2FnZS9yYXVjLzAwMDEtc2lnbmF0dXJlLXVzZS1BU04xX1NUUklOR19nZXQwX2RhdGEt
YW5kLUFTTjFfU1RSSU5HXy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi5iYTgwMzJjNmU3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9yYXVjLzAwMDEtc2ln
bmF0dXJlLXVzZS1BU04xX1NUUklOR19nZXQwX2RhdGEtYW5kLUFTTjFfU1RSSU5HXy5wYXRjaApA
QCAtMCwwICsxLDQ4IEBACitGcm9tIDEwMWFhY2FmODJkMjUwYmZiOGU1ODFlMDAyYjJjMzgwODY5
MDgwZWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBCcnVubyBUaG9tc2VuIDxicnVu
by50aG9tc2VuQGdtYWlsLmNvbT4KK0RhdGU6IFNhdCwgMTEgQXByIDIwMjYgMTc6MDY6MTAgKzAy
MDAKK1N1YmplY3Q6IFtQQVRDSF0gc2lnbmF0dXJlOiB1c2UgQVNOMV9TVFJJTkdfZ2V0MF9kYXRh
IGFuZCBBU04xX1NUUklOR19sZW5ndGgKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6
IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKKworVXNlIEFTTjFfU1RSSU5HX2dldDBfZGF0YSgpIGFuZCBBU04xX1NUUklOR19sZW5ndGgo
KSBmdW5jdGlvbnMKK2FsbG93IGFuIEFTTjFfU1RSSU5HIHN0cnVjdHVyZSB0byBiZSBtYW5pcHVs
YXRlZC4gQXZvaWQgZXJyb3JzCitsaWtlIHRoaXMgd2hlbiBjb21waWxpbmcgYWdhaW5zdCBPcGVu
U1NMIDQuMDoKKworZXJyb3I6IGludmFsaWQgdXNlIG9mIGluY29tcGxldGUgdHlwZWRlZiDigJhB
U04xX09DVEVUX1NUUklOR+KAmSB7YWthIOKAmHN0cnVjdCBhc24xX3N0cmluZ19zdOKAmX0KKwor
U2lnbmVkLW9mZi1ieTogQnJ1bm8gVGhvbXNlbiA8YnJ1bm8udGhvbXNlbkBnbWFpbC5jb20+CisK
K1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vcmF1Yy9yYXVjL2NvbW1pdC8xMDFhYWNhZjgy
ZDI1MGJmYjhlNTgxZTAwMmIyYzM4MDg2OTA4MGVmCisKK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+CistLS0KKyBzcmMvc2lnbmF0dXJlLmMgfCA0ICsrLS0KKyAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZmIC0t
Z2l0IGEvc3JjL3NpZ25hdHVyZS5jIGIvc3JjL3NpZ25hdHVyZS5jCitpbmRleCBkMmFjYWM2Yi4u
OTFiZTdiYjcgMTAwNjQ0CistLS0gYS9zcmMvc2lnbmF0dXJlLmMKKysrKyBiL3NyYy9zaWduYXR1
cmUuYworQEAgLTEzNDQsNyArMTM0NCw3IEBAIGdib29sZWFuIGNtc19nZXRfdW52ZXJpZmllZF9t
YW5pZmVzdChHQnl0ZXMgKnNpZywgR0J5dGVzICoqbWFuaWZlc3QsIEdFcnJvciAqKmVyCisgCQkJ
CSJtaXNzaW5nIG1hbmlmZXN0IGluIGlubGluZSBzaWduYXR1cmUiKTsKKyAJCWdvdG8gb3V0Owor
IAl9CistCWlmICghKCpjb250ZW50KS0+ZGF0YSB8fCAoKCpjb250ZW50KS0+bGVuZ3RoIDw9IDAp
KSB7CisrCWlmICgoQVNOMV9TVFJJTkdfZ2V0MF9kYXRhKCpjb250ZW50KSA9PSBOVUxMKSB8fCAo
QVNOMV9TVFJJTkdfbGVuZ3RoKCpjb250ZW50KSA8PSAwKSkgeworIAkJZ19zZXRfZXJyb3IoCisg
CQkJCWVycm9yLAorIAkJCQlSX1NJR05BVFVSRV9FUlJPUiwKK0BAIC0xMzUzLDcgKzEzNTMsNyBA
QCBnYm9vbGVhbiBjbXNfZ2V0X3VudmVyaWZpZWRfbWFuaWZlc3QoR0J5dGVzICpzaWcsIEdCeXRl
cyAqKm1hbmlmZXN0LCBHRXJyb3IgKiplcgorIAkJZ290byBvdXQ7CisgCX0KKyAKKy0JdG1wID0g
Z19ieXRlc19uZXcoKCpjb250ZW50KS0+ZGF0YSwgKCpjb250ZW50KS0+bGVuZ3RoKTsKKysJdG1w
ID0gZ19ieXRlc19uZXcoQVNOMV9TVFJJTkdfZ2V0MF9kYXRhKCpjb250ZW50KSwgQVNOMV9TVFJJ
TkdfbGVuZ3RoKCpjb250ZW50KSk7CisgCWlmICghdG1wKSB7CisgCQlnX3NldF9lcnJvcl9saXRl
cmFsKAorIAkJCQllcnJvciwKKy0tIAorMi40Ny4zCisKLS0gCjIuNDcuMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
