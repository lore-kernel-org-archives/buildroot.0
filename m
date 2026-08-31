Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC96FC624A5
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 08:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3FAB80BFE;
	Mon, 31 Aug 2026 08:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2zL3B1dl0j2; Mon, 31 Aug 2026 08:03:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788163394;
	bh=ctQ5HFuox8m3oARpMzePRnMVFt33F9Ep27wqXvKzv+8=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Px8Y4+gFq45aXIeLeEh6/bzifpP8Q4F8DJDMyIbEhd9zJmrzN4EUiGnSNRVMVYLvE
	 C5lBeHX2ffJFFku285ywpWpVUOWKWAisLjkBsVFkSoDpmO5LWQtaoycPMchwTzbJzr
	 IcZ8NXnyZVdjuKm1Wq0RBfiVGXpmtD6q01snGiTpA7tgrPwRaPk0n2De9yayT9mtR/
	 rstbwVfTYWKtj++NkTYGKfD2b93jR6Z0OwnpOHqmycCAGL7SZ4kGMo606J7yWeziBO
	 G8UzG61tmonMI/Xt1F6LIT0LZfISwiNXeqM3rNacG7Ddw7WCIBtxB6oPgcLrH+KgRQ
	 G2D1A1zhjLU0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0EF280C04;
	Mon, 31 Aug 2026 08:03:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 727BA230
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 08:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57EDC605DF
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 08:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-zzq7gafxlI for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 08:03:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72740605D8
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 08:03:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4CAD01A18E2
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 08:03:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 19150601E1
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 08:03:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4A74311C78AAE; 
 Mon, 31 Aug 2026 10:03:04 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 31 Aug 2026 10:03:03 +0200
Message-Id: <DL2Z0LY54M31.2D5J3ISTOPNK5@bootlin.com>
Cc: <buildroot@buildroot.org>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260814-openscap_musl_dbus-v1-1-cd42c1c3e0e2@bootlin.com>
 <apNMFCS2K3W1coCX@windsurf>
In-Reply-To: <apNMFCS2K3W1coCX@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/openscap: fix build failure with
 dbus and musl
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0IEF1ZyAyOSwgMjAyNiBhdCAxMToxNiBQTSBDRVNULCBUaG9tYXMgUGV0YXp6b25pIHdy
b3RlOgo+IE9uIEZyaSwgQXVnIDE0LCAyMDI2IGF0IDAyOjA2OjEzUE0gKzAyMDAsIEFsZXhpcyBM
b3Rob3LDqSB2aWEgYnVpbGRyb290IHdyb3RlOgo+Cj4+IEZpeGVzOiBodHRwczovL2F1dG9idWls
ZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYTg3NGQ0ZjM0ZDM2ZmE5Zjg1NjZiZTkwYWQyZDVmYWNi
OTlhZWMyNC8KPj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9y
ZUBib290bGluLmNvbT4KPj4gLS0tCj4+IFRoZSBpc3N1ZSBhZmZlY3RzIG1hc3RlciwgMjAyNi4w
NS54IGFuZCAyMDI1LjAyLngKPgo+IFdhaXQsIGhvdyBjYW4gdGhpcyBpc3N1ZSBhZmZlY3RzIDIw
MjUuMDIueCwgc2luY2Ugb3BlbnNjYXAgZmlyc3QKPiBhcHBlYXJlZCBpbiAyMDI2LjAyID8KCkFo
LCBnb29kIGNhdGNoLCBJIGZvcmdvdCB0aGF0IHRoYXQgdGhlIDIwMjUuMDIgdHJlZSBvbiB3aGlj
aCBJIHdhcwp3b3JraW5nIGhhZCBPcGVuc2NhcCBiZWNhdXNlIEkgbWFudWFsbHkgYmFja3BvcnRl
ZCB0aGUgcGF0Y2hlcwppbnRyb2R1Y2luZyBpdC4gVG9vIG11Y2ggY291cGxpbmcgYmV0d2VlbiBt
eSBkaWZmZXJlbnQgQlIgc2VyaWVzLCBteSBiYWQKIQoKQWxleGlzCgo+IFRob21hcwoKCgoKLS0g
CkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
