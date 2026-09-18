Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1908C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C86FA60E25;
	Fri, 18 Sep 2026 18:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AROpPbYuZ2l0; Fri, 18 Sep 2026 18:48:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E5CDA60E1B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757331;
	b=TlN2vomXjQV8lEskJV31fzRiZQwpMie9+HoEWOXSo8L7wsPyTtFKuhNYraLuGGVF8hWH
	 7RXFoq5sIewGx1QqbDjoUtMj18MrGLnIWuOx29aj6MShgH7y/NuY8hkQKoLYfyqptXYse
	 QNyRfIEc1ihYbunEcQRvtt+qZX785Lr5mvqlVm73ZdTLY1xUP7vf+/+Tav/QCUIKrdLy0
	 /5egKb8OtvhxRW4ch3vc+ucVow1YuuHFaUNwfa15cLBP2REGQapRX/OPm+/fZD3EQ3t+A
	 OvrLBFz4dQOgvkafJljS//FmWtw+QOpagyMTIvsDxXb578ZqBKYtMAPQUPQCbhcVedg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757331;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aRiVEgXoDjtm+Fe3Y7oEt6VWwLbN2f142nxkkTDc7Ow=;
	b=AwOlVdAuR0ELMjEqoZpU5L/cF3MjnJFJ6NYpUk9YFqpbh3i3YkQL8pWtp1dqO8sIl0cr
	 wSQ0oLzcL+OySZ1BqS8ZPWUfGLdWY5H7IEuTbRJPBSPpw7QtKxw/enro6H7CofWQ/A50L
	 tHmx6vMef+Rcn7BhRPn33N5A+3FZ7sca3jtmZkD+aNKE+eevMClEy2EHQu4svljZ+q1eS
	 HwdybNDCRxn3KB4wXE5BBVaoOBjsieEPVwBrYufwC5ZlsxAYcq7HF77eas9nkn7DiUn55
	 xrLZWknYLzZyrPFrlmQgqIzX8Fa2MP7y29FtxEl7wVR0p7cyPlcb/s6LwBL1/05T5Tg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ZRpH4Qar;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757331;
	bh=aRiVEgXoDjtm+Fe3Y7oEt6VWwLbN2f142nxkkTDc7Ow=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kJZKmmKC/kczJlFChuFtRnNrObRVYBvS6ICO6JLmUl3hWhsO98ssfMSrSxwfuTtHg
	 3GANKlNt3elUACyebm8ygHNjBgpPSJrvK97IcF5MGiErvne9H1ddIqtxd5tuGxvLLZ
	 EB3Tglmba/pYD3SO23jcBUXJ7tbkaRpmJNrauTBTE01quk1ycwxu6h9HkM+DXtwvi0
	 u6ZLwcf9RiaUEX1pO7IdACvxakJwHiSCfR9b0PIM0ArZVdKMdmftqlypjLNy4ATrUN
	 lyP7JOZW777FFQjxnFnlUjSV+OLHuCAXSyJfXWEtFdMh5GkXtCZbsLLAEjLJNZ0xjT
	 1AB4Z/gcxE+WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5CDA60E1B;
	Fri, 18 Sep 2026 18:48:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DAAA7237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCB2760E1B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQ2NmoZwP7DE for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:48:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EB5E260629
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757329;
 b=baFjUp/uKPXBBI/vrkqE30Nl/v2I0UKMVx5Sd1wsgMfQ46fe8T18ibrgAcMVvdGtbzrk
 UtcA/S+KvCxk/W6yWtseIq1IGqJeicOd1Ns50V04wafP5b2L3VH+4B5ingPU3CBzwVH65
 tvNnbH1otZh4ZULXPlTQ4FfiQ7AjfXUCQvrO0rREBeY76DwUqA97dbF0KclKH0CsUwcjg
 qpp/Zhidvr7mf3E9nv+pFbJFmEzlXa2BF2k1py58Z0m9SyFvikYPdnxSpBocY7U9y7HLN
 DMMEPxCiOM9bcY9yFWs8XPF2DnVf2hoqu00xhbCtAMKx/JrsHKpDvJj2+wHDrfb3j2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757329;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3O3DnL6LfnkCgxNFRYdPkZcCcenVZCICDFGJ3mUv5tg=;
 b=TrLULyHfnqjT7fVg5KKjmQp3s3Ntr3mJ+RGaKUGzU2+WXaaeYPQxnEGsPGb2Ojptfjsu
 TCNm7dAcCB2zB+N1DnZJXPM6DdT0xVq01WePzVmkxhoBxvSDRcTy5+bgurOHIBJzqMMkh
 kFrn6Q0m6HgPQyk3/Cq6TBzk8uYrU8KzJqlJLqjkqz3W0KDksJRiEDgpK0OUWsbloVd6i
 ZUeHQPnv6VsjxtvJuev2zggQSliDXC3+4Y7pc/bP4eHdoatmDeoujP/p9aM6azQLkpOF2
 g5SGhmd9S+faZw6lWYTRvlrApGZ2kjYqx3+F5jroUwpqJKB5AzdzxT9Xc7sf3hFC/Kg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZRpH4Qar; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ZRpH4Qar
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB5E260629
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756930;
 bh=3O3DnL6LfnkCgxNFRYdPkZcCcenVZCICDFGJ3mUv5tg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZRpH4QarvD6iLrTGByMAYvh+RNbi1xYbtjCmlGCNrtGzV21w/oao5bivspb76XnIB
 np2vdenTY0a8/SQH9PNI99vAWRkgGfsGuTPvNT9c0d4ooAdVykxZC3jphazCM6j4MB
 8GKTV1fc2jUkHe2di1xScnw+5Cb+pi4So1E2BdVBy1qSTJ74ZKEuYV5Ock8ELWa5Cy
 rVA8DnF7hyinMSYCGwFzsA6IoJbh6v4fSYr9EwO7BsVPFByW57sljrVEMxUiXJ8Ptx
 cHToxCV5ICblSD50Pq4WzwjRGzIKXb9vLmyuLwPhg8yKqu3ihlKrRdWhm5WBWkhb8f
 sx67ATE6lhlWw==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:qzICvxJFbYEmf9bwpOGv5x072FsrFcyat9bKSpikx2kX0+4kK0I8YWEZn99FRQiLpWiFjH0+tyK4giI41vFU63GtsNdbwDjE/SU8ZwiNfk3nCbvdE3AKC7UjvPkcGuXxrgmg6pvwLL+OWbPzDBEvdevdGfF0bY/riR392lBZ8R9NBrX4QGLOAy0w6mgZJrA2doTR4MUA3uE6Hpx8JGimXtyK0MOfCoJN4jqMwYZhtIfGXbD3UU+vIDGDte7oUK1fzUVAwZaL2360VirzppRXtIDg5ZExtjpw8GnHPpXweBPgwpbGoZD+mHAMeBVwqBobYoUgxYnWWo1UBjIeunu2DbQ4YPNE6xQ5caJehoemqYHDJDaoJAGthoyT7fKwVsSy0z0FOYNIk2d2lxK7SENGeNfNgNkQ6zgBhiG5hbcmCiiw4Vm1gFDPOTqxUkiSKNVs+4AU7sn8/++P1s9b9hXdLMgQq6/4F03c9X4JVBrxAGxqj0LJxib5jZfBusRVeZgGn6eL1p3SOEheL949L8Bn8ucqLmKHaKy4uEz8TEpGatdrxp9bYYY8YRnIOwHS2rQ8i5EotiyEHpYVxRAqTOL8IXKujLzuUH09Matov43KdsTrLR
 /G19QOMT3z6Hou3dZ5xMjr+0OlgJXXFmM3UkHdaUU6vTmYReldtUmQoboHjwkztzVswTrqa40=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8ADCAA4C471E;
 Fri, 18 Sep 2026 20:42:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWs-000000007cB-2f38;
 Fri, 18 Sep 2026 18:41:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:44 +0200
Message-ID: <20260918184140.3631274-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 22/77] package/snort3: bump version to 3.12.2.0
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/snort3/snort3/blob/3.12.2.0/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/snort3/snort3.hash | 2 +-
 package/snort3/snort3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
index 599818ee24..02ebcf85c9 100644
--- a/package/snort3/snort3.hash
+++ b/package/snort3/snort3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  9465d19b0925088266504e8962e97e55359bafd6a19f66b4169dcd21ef1d8ec5  snort3-3.11.1.0.tar.gz
+sha256  43000d6b0e0307bc1a735874d00deb61e8b6a96d074f8cc9b2fe2cde0058720b  snort3-3.12.2.0.tar.gz
 
 # Hash for license files:
 sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index 273aa56709..a6f296a062 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT3_VERSION = 3.11.1.0
+SNORT3_VERSION = 3.12.2.0
 SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
 SNORT3_LICENSE = GPL-2.0
 SNORT3_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
