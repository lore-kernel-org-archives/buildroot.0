Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F67C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F222660640;
	Sun, 27 Sep 2026 10:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05sLINL4Y35b; Sun, 27 Sep 2026 10:44:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 254C56062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790505899;
	b=LslSzDutDhUh599DHPCXd+RFtqBG0gUd4lCp8ajj7t+SoetEhZFK/YIa26Aaz5CTtmdV
	 pLonh/A7TvDvAEVAnYT73rrOm7aC5jInvT9FL9djJt7H7WQT7kJVT6ML7mFNwiQLnAOG7
	 MYuXpZCpNlect5Ubw4DBueFwzkeMwogWoDWRu/JQV1nCENpLIktl221RpBuZbuQaJ2P+n
	 sv/WA82EvK2CMp4FaceHG/GU6gp7dA1f6fVwWHMvzWPihNLDqZYZnqq6OxrFhUS3GrH6+
	 ktWqFVob7VTm8vxXJkCVu4/icq2Ao9qIHPZktaRJQif9NMRSDpqMVpzfLiKb0tyV5HA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790505899;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0VbkXkk1xpEOQhMO+zVipGweQU7rpa5j5oBRNvrA59g=;
	b=PEX6w6fKNrGl40X9yqfsjGKJAVaWAtvj07cOA77q1qS/x75yux8iD8ASk0ulZxYK0Z0D
	 rw1oR4bGJKK5+3oP1y8ICrtLf+83TyZKtIs2NZrE85EunkIgONKbkT8oDSYjqltR8zryZ
	 M9xz6jvcskK3lxuIws5glT8Uv+N+YxTYIRmDfjLLGEG7LO82uUYcu/PuRS2iXz4hybx3w
	 kva1FZ7ytMkRV7iq49xnXDEnvn9D7fgk1aQZ7z3r5mOgHRjz5GCUf5g+2oNzs0IjHHgA2
	 ilWOGzXtS+Io0DEU5pdcRnuNCwgp4g5Mlm4GWin3zmozeWPY40q8tuX7PTLonM/vLYw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790505899;
	bh=0VbkXkk1xpEOQhMO+zVipGweQU7rpa5j5oBRNvrA59g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=W2QZN0MfsWuhD7M/cRtn0f5N8FPjFFCP5R+KebnMaalIuXFYmj40tNA4WX+hdE7IA
	 PbU7tOwl6jiyQhKJ9/4NyUaNBXQHr26qS4E/e5hl6IWcTqoSglxN3Mi4hJNFlizMFl
	 nZqtsh4jiDE0o/k8Da+ANmZ4A0V4SXBtKbGX5Sc7NIl4RCIewBMXn9yuSHCHPYkyQv
	 P/F5BTFefIsL0feZK395DRKSzOphS9Pt1KxJ77EcXeLXtYdUeBpGc59itL1B1JKQ+1
	 0IEmPngQFQO+4PfKqxBHjA4eRCFUh/bZME0mg+13vaL4b45YE4mq3GhD6bRHzVoqz3
	 d0bNz8MuJqk6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 254C56062C;
	Sun, 27 Sep 2026 10:44:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC531334
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DBDD810C0
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHq_N0vHOVUT for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:44:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B5200810B9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790505896;
 b=cGfee6C5bbi7HrJIP/Jf7VK7aR4ec8Sub+BxyD1Q6ZcDIstAFfB+0si2psrZh3BifB6H
 SlJQRRmPp9nhVuiUcg+7DH8x0ibj4OQwUGNH6bn4XJHrhrwGmIpd9gPmflBsi/5XlU1/U
 7YsVL5PIuyV922V0ZfOSvp1c+DFnRz0mcwO5Y/DAAhjOklM19IZTPaKkd/y6KHWtdNrJd
 8lcDvxcrvKzySWAZCSRUZvemA6Bvhbks3f8aheznOp0itzGoB5JNCxaYfFeX7X/vhhBGh
 yo2nADV37Xu6z9QDbkExEUq3ZGODNMNJJ4E3rBgKnsEpp2VsVi7ONYJelsMs1XBAZuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790505896;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=uKC7KxSy17C813qamL3f705ZVvnyKQr8JXL0DuQ+7mI=;
 b=ATgTmDmmVt+0k4nhPxHvIil46gs5EnJ1F6SXmPfpaOO8EUGyfi5H1wsdaXBU0zf7hI7r
 bLuGMbiknVZ7OBfT15EtmEvioR66Gl9wfoerH7AfZ/vVwyWr1z6PKq7l2M7e1qnUiKp/n
 FrPntv1kofI+z04nxHk/2Hf7w8jsgbKl9lav9tljrujdteeMTW/xC5XFg3nfC0bELZJdZ
 W+mo5Gnx7CavkIkV2MvwPjjRu7at5KXZAWnFBHv7DebBMlbW6Z20/sAeRLAO0e4sObyTy
 QzQ5lpPVG4V+sI6kqjq/78nnB/I94/q6kG/302Magj4g1MAi3yOpGrXKv3DnkHaHK6Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cWy0IZDG; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=cWy0IZDG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5200810B9
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505819;
 bh=uKC7KxSy17C813qamL3f705ZVvnyKQr8JXL0DuQ+7mI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cWy0IZDG0cuBI1DzuqJf+wfes3Cnc7dea3pBxPqtDewCxwrda++OEQu3j8HsUZJIp
 AnHiGRAcfxnohg2mERI05zC6F8gCKcZhGsysOKxhZjioTtXpSoi7ndcpSGIqCbJHlq
 YYq7juGBZ5Rc6JVYDURJaEMnkXMBFEol5H4zktKJxMq0TsZsIoYwO3rjosqOWczga0
 xWzgPVKPVjMrauhcCPkgqVjFFzMwEh5e++xAeYEY9jgXM+un70YHCG0qEpnZoXHb5q
 1chfCqVC2pkmk7e1ICY1k32UeLuTmgVtQWqA46EBhaxAqcoGKeNg36RqMeqdQj0Z2Z
 kMrvW44H8q+bg==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 kWB/rw53abRiUBMhoJ4zgOVm0qrGSqwxK1S1aGSlJCRl5XMgjtXUxhLaEmGIf1ROyKxtCy6ceAQ
 HMt/3HydesPprxfmyPZH5umN88DlwVT60UfFWiiNzbGGBwmI1QacynDTthhKzRz1wJ6tLtSJura
 DVGyhHGRZTN9dM9NqtWGHzBzMhsL2GlxhmOiTc6WlFe9FE6YgSYh0n11OLRVvAJxeWtYbwL8te7
 HRcMr8patP1dPRmtkg4iNhmVnKz90rDBzHPEc197Mb/24Zf6uPVJHUTTDNMeBEzwxsGpjW9/96a
 W9HTrjhWwbRr8BEBc4wQ7RRaYgWGyO+miAjpBef8NcCiF9Y+TYDWFhSuuIMRFkWDasn9OMGdrkr
 s22B8xNjbOQm+o+We7GCROMvqt0/ktG0iAlWEj9HN3s7mu3BtjRyAx3tsLp89KG1knnUjm5oECJ
 Bgk9BSvyt6BRLN8clgL9tNbVZtYu4gYQOGOP/KbuHzXAzZ0rXVzqhTs1YghwlC3/ubx7bHJ8z34
 kJ112A/VzoN9OXqrLusdplZo2Y2YNTsTXr875+Pe+tucU9RvehqpyPWFyndrWe6RwuFgS0ECN3Y
 EzG7HzQg3uiB0yzNqjzh52O/XPKwwofBm9AOgMqpn/eu5j8s6GFAez0m8PakL/p1/3U9j7oue9D
 pWhIDr4x74Kvx2Jh3PNYyxAtVahivpx1+pTYWdL0+76G3DGj/oUK4Ye/qxWDr
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17584A4C102F;
 Sun, 27 Sep 2026 12:43:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLa-0000000007a-049d;
 Sun, 27 Sep 2026 10:43:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:03 +0200
Message-ID: <20260927104301.1801638-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v6 25/82] package/libp11: bump version to 0.4.20
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/OpenSC/libp11/blob/libp11-0.4.20/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libp11/libp11.hash | 4 ++--
 package/libp11/libp11.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libp11/libp11.hash b/package/libp11/libp11.hash
index 8a31a6f39e..10ab7388ad 100644
--- a/package/libp11/libp11.hash
+++ b/package/libp11/libp11.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.18
-sha256  9292de67ca73aba1deacf577c9086b595765f36ef47712cfeb49fa31f6e772fb  libp11-0.4.18.tar.gz
+# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.20
+sha256  a125e0310ff10c189fc1b32a9652101486ea94a6b07c677a30e90e3638d2db48  libp11-0.4.20.tar.gz
 # Locally computed:
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index 51a44f5b3d..38cc1c2e6d 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBP11_VERSION = 0.4.18
+LIBP11_VERSION = 0.4.20
 LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
 LIBP11_DEPENDENCIES = openssl host-pkgconf
 LIBP11_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
