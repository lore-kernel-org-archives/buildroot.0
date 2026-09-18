Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F54C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD99860617;
	Fri, 18 Sep 2026 18:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_UXGlpo32WF; Fri, 18 Sep 2026 18:44:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C4D946064F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757059;
	b=KHqXWdZWwEmvKrskC9TXNwi8oOn4VP0a68QEBfGNzbMVSZuQ2YCoZ9yhKVgVAXWfLs7y
	 LqzVJ4N4uorABL+JgCAb+2L6nUGHIPmswk1egqZhv92qz0PjUHIn1NT3jmQjGSvLGPfbf
	 lvp0XrvmHEyOCIWzM/OghboB+0p4KAh85SPd5yPyDQrhmUJopq5z1FeWZhPXLC933Wrzq
	 tbpmx6cE4D5+YDjQ4/PepVV4qGqDASX7eoLZe0CJGhdBriYJLyMk82fcMkkh6ieSYRlPA
	 +FpExuvlEFdHu+I277GUrcmPAyMSaQ4YA73uMjvEEHxKFyax8nK/ccCKO4mtyvbiW2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757059;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=e5bbfP0gIs/ilmArzE+cgtlAKS6J/pwt33myB8R7WJ8=;
	b=lDrHaFJekA5Q9wB0UGyEvGB9gJw3WGetcKX5J3Z0rOOPBu5ThEMAJUmN/88CZOLuprxC
	 8wpotWrwVqAu56Nd4UkBTgLONN/OH0+4MXKpAqjGyQDyV3ys13LlQYPk8HV1kqnLBQsBz
	 zZD0vcqxW7U6AVWzKH/9zHkszTvCsIpPIqnP2f/bfToVUlsFHIndO5ymU99cpR+oy94/3
	 rIY047w/9OeB7nGC50KbvwKzZblqouuK4oo1J9gzV2Sa82je3C/ysXgvmlMmvTbrZcZ/H
	 wzJ3mp+7itp3A6BTqLrfeVgd4hoc0gjeuEYvLoYxzPxcsadwnMHBZYcN1IZWar3hc8Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=SjUWKKlz;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757059;
	bh=e5bbfP0gIs/ilmArzE+cgtlAKS6J/pwt33myB8R7WJ8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JJrKmfMidES/ko5OgJgfNEYLFEpYUR3XM1jSoX8JibaSzf6LVBgQ9TunlQQ+GmTGR
	 bqPA+sGAQPqPtm17LpKbdCA+4/XoumBw0kPWaNoTdewORXDp8tlCj2tsM9WIuOngnk
	 2AjXA/R2B8du/Xn+on1TUTowPRRge2mKA/68eARElcXilb4KgKT6XXFgwfl5gyvjt7
	 1GgyYrHbzRjYGv5JL5xmYcaKFWX4Aqx06U2Pj3uukNDOzl9fYUXadRFmov/ceLZlsI
	 TWRmUR+Sk3CU9sx2rUxKkferm/QiQSf+WE1r4vWSNyr7QdTrtpw7QDvxywYqYmY85K
	 AN6nyWbXxAOzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4D946064F;
	Fri, 18 Sep 2026 18:44:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF53E13D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C14186064F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpXKTdXJPoIA for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:44:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C0AC660617
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757058;
 b=KFWxTxq7czMuZuYlReFrW13/Fe6QU2lrV/VbpXB0Dc7GeD+1F3tfibPU5F6JRzNDgr4c
 TrHKrgIR/unqGC69wsgZiZHZnv0HDfxRsHmA2sOqiW9woTx3b4aBMV0dpVMztb+K0/mgC
 0IhUyPj8+SGGrI301v4z7Bjnt5Wv7Cc9Euvke5ldqJRlYVO8TbXi8z+MHswl1r7q5Q2l7
 7iUScac8qbAk5pZ36EV+0XMrPCEcJp2Xb7CXIFgH404RwTIZeqkTOyIDytgUB2Nd8qWhR
 u6uqDUfQHgUgfHJFCTDh1ZVlVXlkABdFgidhLOusNXDpXiyrow3eTqAdVyaLYTW9Aeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757058;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=juAB7F8bfidWi9Id3CzH3Wsy9xyz2G6DyHNJ4CUfTb8=;
 b=REGsWpHRXGW0wbEhuQDwKz23xwMqpV7cBYiDFos0Lf65KqNPgHLQaqIa2oEdoSjDYnz1
 NBir/RjcOvg4/kkYjYoWnCt5GtBzzKE7kMtYA2CJ6Y2Exn7Q7xD10MTrVfloIb52vA+EU
 +6KZJo4r2LC7Dh15uhwtCB4EVTgnc3OpSYn4YNAcza/kZkPOLGpN9WrJr7d/zqpRSmfDW
 o931YAh13JVDXP0kW6pXXh6LL32lX/EJIg/NPedQLhgfnnN3zUoDyB0rBnIBdBpJrPU+a
 6MUzcmngo/NI3rGTnepEvhwoxqmKILTeu2cRzXYLyvtNJ19MOCrhijxYIq1vhDRxClg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SjUWKKlz; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=SjUWKKlz
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0AC660617
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756905;
 bh=juAB7F8bfidWi9Id3CzH3Wsy9xyz2G6DyHNJ4CUfTb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SjUWKKlzf0599EU8rR2X+sxCndrdxQAXulJ/oMISf0QdoKVr9lNvSzxp91MAcWxDs
 07lJz0bTjw3oDjHJeRzrPym4dWf/ZPRf//zIhZ5Cd78l426tvx7ALdkJvKUQurxMZu
 GwVj4wjhfbXG38E7P+T/oCPMK4RjLs2dNK2zr+ARwrLQfwTa3ihNQnmDa0pCjIEt/A
 14Ix6f2HF1ajsOwCd3RTxEQyepZEW1oDrC/oi4GJJgsGvLIo2oQuSqK09ueJNe0qSq
 SpZE6i1QGSgSI2t9+J2Wrx9PrtJzDF3qQYh+/9YbBuUan4zAg6b/cmZfSNv+rTw0uz
 ItGfOaJDdgvNw==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:sxO9YNCUF5qXHuNTxZYZ1pkyCqNuUfHBFzSjZ5vRuPcs5pw4UBm2p3E37LvMn6rfEzHPcvhRzuifA59gw5Fll0krouswsKRlwGGkFxVDetsKKghF4rnvsdlCOL5GGfuDPeHJxweePKpgXKt5rbjPoq48tJuTIMJ7SM8DB1mdjiunm51wFkqvNiELYWA42xbWikaDBFVFANG0i6pVgI1CcY456uoTv150nqJ5UBJT6ybfAJfo0wjRybrcVMKJu4isJ/kd9+UowGz/SdcdgpOgLnBHCt/g95H9BwqUbYI7+QRBaAf+oUr87IvewAeGw2RfXeAANh76JVH1PElvM/fP/yTZ0zsh4HZcL2lyz03ryucvRuFTVMJoWQNanBmUON1es7eYtklG89JCZF+vrDRQeGh7F/iHcYHFRENZADOkHFvRgtHKSfpouLidKQczQP1rPOzxdJpqyH7TlhJS/US+F3z7mjQWw9kbT/35JfkkAMAv0rta1KKkbpBSiUAgHu9EFrTF2XYe8Yk1WLVulmaPO0pmF+aVsIXW0DeG4S+TFdz6hXEeDf4LM2dKhuaaU/+oEHs84FOoMxIHajgXwLMuwN0a64jEgr0DwfJgYiSoqiCdSf
 7Zu7tDckkdjAoRJCgkh/MG/R58MhdPmhzGv+w+7kunMy5ybaV0dRYXZIrvju7vq36bmkv5js8=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0C24A4C4704;
 Fri, 18 Sep 2026 20:41:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWr-000000007cB-11BU;
 Fri, 18 Sep 2026 18:41:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:34 +0200
Message-ID: <20260918184140.3631274-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 12/77] package/boost: remove dependencies on
 Boost.DateTime
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

From: Michael Nosthoff <buildroot@heine.tech>

Boost.DateTime is header-only since 1.77.0
The Boost Release Notes[0] didn't mention it but it was introduced in
the documentation of DateTime in this commit: [1]

This was bumped in buildroot in d39d8f7cee9b4634e6f490020204f63fae419e8e

So analog to the "header-only" move of Boost.System we have now to
gradually phase out the dependencies on this library. Ideally before
the stub is removed as it now happened for Boost.System in 1.89.0.

[0] https://www.boost.org/releases/1.77.0/
[1] https://github.com/boostorg/date_time/commit/33dc6136f193a100c753c819694d6d11e9ab4123

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index a9ab4836b5..7b78345798 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -95,6 +95,9 @@ config BR2_PACKAGE_BOOST_DATE_TIME
 	  A set of date-time libraries based on generic programming
 	  concepts.
 
+	  This library is header only since boost 1.77.0. Building a
+	  stub library is still supported for backward compatibility.
+
 config BR2_PACKAGE_BOOST_EXCEPTION
 	bool "boost-exception"
 	help
@@ -200,7 +203,6 @@ config BR2_PACKAGE_BOOST_LOG
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_ATOMIC
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_THREAD
@@ -359,7 +361,6 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on !BR2_m68k_cf
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
