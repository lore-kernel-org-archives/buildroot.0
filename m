Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F41BC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26D0D6064C;
	Sun, 20 Sep 2026 14:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bjw68wAORIvo; Sun, 20 Sep 2026 14:10:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 433D260638
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913419;
	b=lPpDXN0Gvl7+BvNLSE40NVpZJDAedsnyoFjL92P8RI23dD4COR5Hg+M6f9SMSTO24J3D
	 emfzoD5InB0WNcMo7qpRrmbObWd3Z05msQCEjjmujgr7VKKti/s+HHEEuLtjC2byXMk9l
	 wSfWBFi22cMVzBc6bIXvQpoap4ewCz/tV44lIQpzPyV61/zzD3096hNk6uRjXUb1UPDjj
	 OHGrwN9TagMmp1kdrzih9UFMGP3LVpiJdRbe2kALEq/pvwtl9TUkSPTtUgPr5mm3iVOtR
	 1CYfmZHbtqm5xZHMaX51s/rTg82iz/EttRQCONrc+eQhyvRQoLWWzmQNw9XA7jowNdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0VbkXkk1xpEOQhMO+zVipGweQU7rpa5j5oBRNvrA59g=;
	b=E7dXcIUPRdP0ZzUq7NN45THPQW6EqtKW9mlf4Ca2o8JvjP+54f8WQnFxjBzC3ZO41Q3f
	 XrAYVLPdz78OyMxxXEIRhc4iM2AtPF4TPILHpg/9/ImsOX8wUzKSyLh4k96rWF+otwuVf
	 blQI5lPndbLFe0CHtudiBts9ZHe278Z/e4qxs+7/e754Fv+qEHp/JJo4Ug0zC1JqDooMG
	 ICSJvf7OvvrR3qrpAKANi96dQs5DfD9wWd8eg0NdoHG/xhDvGTkwKjBtto7lgiqa9IJVc
	 RuLnjLDeQURQfVD7WP3eCdbi/79wb90tg1auCnPO5n9c8hqBcBeu0jt9uwN7+8zjk1Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913419;
	bh=0VbkXkk1xpEOQhMO+zVipGweQU7rpa5j5oBRNvrA59g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tIGqqHnjeawyaBsLm7iOru2Kaq/ph1TtnGJ9L1kGdx6PIWX/JcuRUZtJvnAUgjhCr
	 yZXLOexRxRcx3kR5ps67LrwWfa0RhWLpUf40eFdEYF0l814cVwHaskfHpbpxroTOxH
	 4DhEGo+MrlL3Ynse9T/98FK0VPBoug8oMPKZE1MsbAPOcKtcz6dJVwdE1uwRO84xya
	 qzQVxNJkujYXZdfh0oED3swfjBF5Q73x6K1hkb1P8Ups8ziOTmhi/yJCE6ftc6MJQL
	 t+OhgdKks8B+4ZljUBOnZRN8HE0B6S4dbzI0sfdzQWPK/tXTsokRcGUimpJbPCRVbc
	 +IE+zDW0WzQjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 433D260638;
	Sun, 20 Sep 2026 14:10:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55CA5392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C2DE400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jOCEsQyIMHgL for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:10:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5042F40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913417;
 b=pNfBpY/uq2tJufSPt4c0LTPmaPKVDrkzoqNYq86YziuPTOCVXwa5XlD22C2igo708qkZ
 DgWS4t9Qo/r/NSySVn0j5trkANjDgmsC6I1WqHwqZNv8qhNgmAY5HZLlgAddjni8DLhfE
 m+VjR7pSPlAb6VGKkCXDRZxNaSJ4damMl+ca64YSM/m1IC4wAAQToF6SdL7DjcPshLe0w
 8qpx2FI+PclAOKoGghVOdNlAIafP1FZ9vUdmFlKNxSCfWerCMTdYb25zFVItSA4KLwn2v
 FluPqlpoGk8CYH+eu8wMgLCi6PtX7UUYkgRZY37opXyPBTVLUFf95PFs5zs5H3StG2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913417;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=uKC7KxSy17C813qamL3f705ZVvnyKQr8JXL0DuQ+7mI=;
 b=LmE6CoMwAChl2epiKP1fs6dJwPp/bOv083zFF5LGx3BBL0CFvzwFXgKvvxUj6ZK0cN59
 50X6hlqhX10H4s7DomfER8MPL9oDQWpkxevYC29/kQlN5aVNLYp+ftyDnA66oV4HfAtwN
 HvdOz7STg+nTaEZCRxROXGbsOcDTnYcBdyTcdqkcH2JsRQRHJD7Pahz/OiFvC2cT5//pg
 55GxzbVU00cuPm8uQpB9h4N4zKMtB3yC6aqVUoFxeZDEJeTfXdmCw68tY33gJwI8lN5NR
 BoDqUOGkTyHKBj6zdrU1nID1YMv1rj0RxBSpJoiZYNVO2WF7FNglwJBL/hICCR+b5vg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qBEXi6bh; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=qBEXi6bh
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5042F40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913228;
 bh=uKC7KxSy17C813qamL3f705ZVvnyKQr8JXL0DuQ+7mI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qBEXi6bhB2r+FH3ea2uaaBHGHV4Pchz4D7Fzr8yAqUvYBpDu5JKzSn1lOOowebVvA
 43vG3IpRdaQl4Y1Cg4JyFkF1gOC28SKST6QBfzCwPUbW6sXUSMwOKjzxts/rup5jcG
 QDHKbtTCVTW3SGIySEXIUNKJBF9KQ3R/RRzeYXbGVuyjoeBZ8CNcGhlw8F0W5/YsG6
 kfA9e7M6K6FZoH7Er0BRUmQwgS71l9jp/5/hJSQ/f+tJpMugEmP7Iq6odkPcsOVLnN
 mhfoJ2YvAR+1TSNiz0hF1fFqy64RkEBcThFVpv0FI8udNV/OnW+7yFblCNGjQ0Yx5E
 nDym0jL7IiRqw==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:tmM9RGgPukSrOHsRH3gYULLGZOMhlkd/mIgkPVEYwNoJ9xJk2Vlx2dWLzZDxL6hW01835+X1dNq3hvZBH+gtCUYvMD3kWe6gRha1ichLkQYo8bJaNPRspnvBBWpPBCtAyZYJp1z5d/ofDndbrtIhw1WQKXK0k4+AHeg9/tzjXIrugOPe75NxkYjGajYtfweyiF3OkecBG9nsx3MVNSJ5RosR8lO2YtuyTpi757vY/BfOiJnXPqK9gD9MsQ1T/l7tGoG14cR8IpFI2TC5vo4AGWhFglThB6TL7dl0Mbsw52jUKVuSDSzjGKHLAFIAAZYfA8MELGpKrovv4Vl22d51Km968pbnKjwEKAXhVU6SbBr4djxBs24r1zdCAtvG/uITSrJ1HmZGsW6hkjfoS0Tzm+hgJYSLOMTGbsUfCTlx6xmUM2D6rCZMhIE9zkv23QAgN1bECV3+E3TP9aLALlUzG8pdWpeD/HnuI+f/yzQZJjpDgXMl/trkIkqC9EOsTg9uZQldINDVOF5RNcCHSge2+bDQ+V3dn4vvuWs696vEBdyYuJpflmDLmSNC15qJO0MfgD8uJOHtKMdIk557fl7AfzQrCXEDGnVThzwt5tbtqJMjyR
 7a9k/ZlJ6CTqX9OMifofhzf9RrUlb/8Xd5ZdxO0NeT3BicCRYGaQRE5r07O/2N35m9ULolpCWVHes5U5qN/e3Bf65oi+NsgOaTurGE+KqtEnjZl36l
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F2D4EA4C4861;
 Sun, 20 Sep 2026 16:07:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBE-000000002J9-3wG4;
 Sun, 20 Sep 2026 14:06:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:08 +0200
Message-ID: <20260920140605.3005461-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v3 10/66] package/libp11: bump version to 0.4.20
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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
