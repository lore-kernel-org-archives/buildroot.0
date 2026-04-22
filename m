Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56806F94CD8
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 07:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48777616F8;
	Wed, 22 Apr 2026 07:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kftd0NJxXyLV; Wed, 22 Apr 2026 07:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FB47616F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776843166;
	bh=NKaFAO+KDlPuVPkD88wt6MsfXXFvjt2tv0mBrGQ50Rg=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kFXkMZ6k3ZcOvasWSAQr8RJYMC8aI5Kb36uQbwQZZhZq9afxeAB6GLNdRjrhi1aCn
	 pHybPSrWeDwuvRNez8jg0GBvmXfrtiVsixldxxW7nfOznVeOI38iNwKCP8RHPK+NSC
	 8EYN72HoWO1JlOfZBkiUwg3L0k4bokNfBOFpwyx8HckpkXxHXuMZf0BmhC4P+/MqY9
	 qQ0kBh1+aQX7bT5R6cQob92XsRnJMuiCMMo5RDQHgYdaQyo3DxVNcbxazZngUVN1I2
	 uUhpyjybAd2y7gO5tER4GNSG9TFnkf44BTqR0MnBSy7pFHsVICLamCZng6GSxUJrX6
	 q2O6/Z9Vgwwng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB47616F2;
	Wed, 22 Apr 2026 07:32:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D42624D
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 07:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EBFF4241F
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 07:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytshUKh-Apyb for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 07:32:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C1AA4241E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C1AA4241E
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C1AA4241E
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 07:32:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B681D1A33A1
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 07:32:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8C503600DD;
 Wed, 22 Apr 2026 07:32:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C99A610460B45; 
 Wed, 22 Apr 2026 09:32:38 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 22 Apr 2026 09:32:37 +0200
Message-Id: <DHZIBY14PVM4.634RFRU528IT@bootlin.com>
Cc: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Bernd Kuhls" <bernd@kuhls.net>, <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260421184831.2576691-1-bernd@kuhls.net>
 <20260421184831.2576691-2-bernd@kuhls.net>
In-Reply-To: <20260421184831.2576691-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1776843160; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=z1tEXhreezb53sf1znjCBgtwbM5ACmqHR2OlfbJkHcg=;
 b=piQmg0DbR46sKvNlq0v2LjTueYS2ezWa5+qI6LXBP0Zq6qfV7y/7VaKetXYZY4EaLkP9f6
 5gw0zaQy051jx5JCBScsemKmFdFWrC4gDNTk9feURPvsPiYDl2B6Vi/u/VyCJ30EVNKf3s
 C7+IZe6T+wVCeWxThHEloSMUuZ5yLfidaBARCsBY3Tu7q6w7nGTw2JUR92LmQwsKclLXsy
 s+PGNZEo9jbs+A0qiHv26fDZm4H5pNyJfHqPVS5E9JDJLXIcjFXwLkpWV6eHV2GNomRZGK
 qNnbm4ES50mPbWN4CcWlb2QGpjkGZ7//Nxi+ErO4rvhUjGJWIElwj9MchxzjJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=piQmg0Db
Subject: Re: [Buildroot] [PATCH 2/2] package/openscap: bump version to 1.4.4
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

T24gVHVlIEFwciAyMSwgMjAyNiBhdCA4OjQ4IFBNIENFU1QsIEJlcm5kIEt1aGxzIHdyb3RlOgo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0NBUC9vcGVuc2NhcC9ibG9iLzEuNC40L05FV1MKPgo+
IFJlbW92ZWQgcGF0Y2ggd2hpY2ggaXMgaW5jbHVkZWQgaW4gdGhpcyByZWxlYXNlLgo+Cj4gQWRk
ZWQgdGFyYmFsbCBoYXNoZXMgcHJvdmlkZWQgYnkgdXBzdHJlYW0uCj4KPiBTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgpSZXZpZXdlZC1ieTogQWxleGlzIExvdGhv
csOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KClRoYW5rcywKCkFsZXhpcwoKLS0gCkFs
ZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
