Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4D4C531F9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 17:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92FDF4066B;
	Fri, 24 Jul 2026 17:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGVtmSc83_jr; Fri, 24 Jul 2026 17:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BED344066D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784913688;
	bh=ZxfRb8EAALELIkxc48Tfj4+h6cWMWnGozDXQf2KnlYU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mVEQH3phuq0Y22WqzN7sOfrNRF/wd7c+x+QaH7V9jjErBOuCT7BXiT255TpTDJAqT
	 I1kuh3H1TP12f/wSWD4tKLsAIq8AVAkLROeNpi31fcUeCQ/TEOlCj4g+pj4nB7NGlx
	 UhE9nLr2xmYHL2BR30+/j+UEEkUTV8lXpKWbVgWAm9bt3GQYtQA98sWDQ4S/XUECK0
	 0XOf8gEOdabhUToU0tRWlyrZHWK1DzXjb+9pUtgBRXM9mCeGdHSo8OXaZLskY07/3Z
	 qG/9z2hvnFPfkjnXcdQzuawmttLD9KxcxqrZGLhiM2LrtqbiVaFbdJwULKOXkDN/br
	 PR90uqO/EvjRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BED344066D;
	Fri, 24 Jul 2026 17:21:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14DE826C
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF26660A46
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEUaSf9BUpLM for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 17:21:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2C63607AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C63607AD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2C63607AD
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:21:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a00d2.dip0.t-ipconnect.de [91.58.0.210])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A8C51A4C11A8
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 19:21:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wnJaO-000000008Oq-2oXd
 for buildroot@buildroot.org; Fri, 24 Jul 2026 17:21:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 19:21:24 +0200
Message-ID: <20260724172124.319019-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784913684;
 bh=+va9Z0TQdOnuiLjDmx4RdE1ggn3tPcJoL93pP/U/xL8=;
 h=From:To:Subject:Date:From;
 b=CM0tNZFAVQPREHE0Fk8TSfBaHhb/gDP0AS9dpaFTlYMgM7diQ2GUKBjt+iiIKFtO1
 l2IvAyHaT+idDnvJyNbH1DGBVXWlwitQVXmWkmdGQ7IgkAAYNQ1KkoMk/ZQgLVQ0W/
 AOmJRtkLzj3EBU9unAWdYWql5zUUkOVyoPGjINMpTnTEeZJ9bg/v4v5tRjvn8i4pzX
 ZzJiN3KBEMawNR2uujD8eLOUTWVdD7x2Ctox5vSu670JoW6Vb4FBAqM51WOxL+XCsz
 IhtfcQSGxmWxuZvkD6QhDWP8blF8oSYCM+hXv4Edy+shMVDd/fjFuHVI2j0DYZJJtf
 hDI9kr0hflEZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=CM0tNZFA
Subject: [Buildroot] [PATCH 1/1] package/libheif: security bump version to
 1.23.1
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

aHR0cHM6Ly9naXRodWIuY29tL3N0cnVrdHVyYWcvbGliaGVpZi9yZWxlYXNlcy90YWcvdjEuMjMu
MQoKRml4ZXMgdGhlIGZvbGxvd2luZyBDVkVzOgoKQ1ZFLTIwMjYtNjIyODkgKEdIU0EtamM4Zi1w
MjNwLTVoamcpCkludGVnZXIgdW5kZXJmbG93IGluIEZyYWN0aW9uIGNvbnN0cnVjdG9yIHZpYSBk
b3VibGUgY2xhcCB0cmFuc2Zvcm0KYXBwbGljYXRpb24KCkNWRS0yMDI2LTYyMjkxIChHSFNBLXhw
dzMtOXJody00ODJ4KQpIZWFwIG91dCBvZiBib3VuZHMgd3JpdGUgaW4gbGliaGVpZiB1bmNvbXBy
ZXNzZWQgZW5jb2RlciB3aGVuIHdyaXRpbmcKaW1hZ2VzIHdpdGggbWlzbWF0Y2hlZCBhdXhpbGlh
cnkgYWxwaGEgZGltZW5zaW9ucwoKQ1ZFLTIwMjYtNjIyOTIgKEdIU0EtNzNwNy1tN2dnLXcyanYp
Ck91dC1vZi1ib3VuZHMgcmVhZCBpbiB1bmNvbXByZXNzZWQgdW5jaSB0aWxlIHJhbmdlIHNsaWNp
bmcKCkNWRS0yMDI2LTYyMzc3IChHSFNBLTl3dzQtOXY0Ny1tN3BqKQpSZWFjaGFibGUgYXNzZXJ0
aW9uIGluIEhlaWZDb250ZXh0OjpnZXRfdHJhY2soKSBhYm9ydHMgb24gYSB2YWxpZC1idXQtCmVt
cHR5IEhFSUYgc2VxdWVuY2UgZmlsZQoKKEdIU0EtNDZycC1wY3EyLXJwbXIpCkhlYXAgb3V0LW9m
LWJvdW5kcyB3cml0ZSBpbiB0aGUgdW5jb21wcmVzc2VkIGVuY29kZXIgZm9yIFJSR0dCQiBpbWFn
ZXMKd2l0aCBpbnRlcmxlYXZlZCBiaXQtZGVwdGgg4omkIDgKClNpZ25lZC1vZmYtYnk6IEJlcm5k
IEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQpHaXRsYWIgcGlwZWxpbmVzIHBhc3NlZDoKaHR0
cHM6Ly9naXRsYWIuY29tL2JrdWhscy9idWlsZHJvb3QvLS9jb21taXRzL2EzZDkwMjhhZDFhODI0
ZTYyZDNhMGE1NzNjZWNhN2M3OWFkZGVlYmQKCiBwYWNrYWdlL2xpYmhlaWYvbGliaGVpZi5oYXNo
IHwgNCArKy0tCiBwYWNrYWdlL2xpYmhlaWYvbGliaGVpZi5tayAgIHwgMiArLQogMiBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJoZWlmL2xpYmhlaWYuaGFzaCBiL3BhY2thZ2UvbGliaGVpZi9saWJoZWlmLmhhc2gK
aW5kZXggNzgwMDU5ZmFjZi4uZmY4YzA1YzdlNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJoZWlm
L2xpYmhlaWYuaGFzaAorKysgYi9wYWNrYWdlL2xpYmhlaWYvbGliaGVpZi5oYXNoCkBAIC0xLDQg
KzEsNCBAQAotIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9zdHJ1a3R1cmFnL2xpYmhlaWYvcmVs
ZWFzZXMvdGFnL3YxLjIzLjAKLXNoYTI1NiAgNGM5MTgyYjE4ODk3NjE3MTgyZWVkMTJhYjVlYjlm
OWQ4NTViM2FhM2E3MzZkNmJkYjMxYWJjMDM0ZWM3ZDM5MyAgbGliaGVpZi0xLjIzLjAudGFyLmd6
CisjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL3N0cnVrdHVyYWcvbGliaGVpZi9yZWxlYXNlcy90
YWcvdjEuMjMuMQorc2hhMjU2ICAwZGUwMzI3ZjYwZmNkNDdkZTkwZDU2NTRjNmZlMTUyMjMyNzM4
ZDYwZDg0ZmUwODRlYzNlMGYzNWUwM2IxNjZhICBsaWJoZWlmLTEuMjMuMS50YXIuZ3oKICMgTG9j
YWxseSBjb21wdXRlZDoKIHNoYTI1NiAgZmE4MWNlNjUyMzE1YjAxMzM1OWQ2ZThlNDc0NDMzNWYz
MWE1MGM3YzE5MjkwNzE3NmQzNjMyZjc4YTNiNDU5NiAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJoZWlmL2xpYmhlaWYubWsgYi9wYWNrYWdlL2xpYmhlaWYvbGliaGVpZi5tawppbmRl
eCBiZTk3YjE4YmQwLi4xMjRkYmE3YzI0IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYmhlaWYvbGli
aGVpZi5taworKysgYi9wYWNrYWdlL2xpYmhlaWYvbGliaGVpZi5tawpAQCAtNCw3ICs0LDcgQEAK
ICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxJQkhFSUZfVkVSU0lPTiA9IDEuMjMuMAor
TElCSEVJRl9WRVJTSU9OID0gMS4yMy4xCiBMSUJIRUlGX1NJVEUgPSBodHRwczovL2dpdGh1Yi5j
b20vc3RydWt0dXJhZy9saWJoZWlmL3JlbGVhc2VzL2Rvd25sb2FkL3YkKExJQkhFSUZfVkVSU0lP
TikKIExJQkhFSUZfTElDRU5TRSA9IExHUEwtMy4wKwogTElCSEVJRl9MSUNFTlNFX0ZJTEVTID0g
Q09QWUlORwotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
