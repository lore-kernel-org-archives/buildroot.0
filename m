Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7893CA5FA0
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77AB840A4C;
	Sun, 27 Sep 2026 10:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCKsEffjIGyJ; Sun, 27 Sep 2026 10:51:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9D4CB408C4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506293;
	b=SxAgY9qwAO+csGR2WqAZLYLB94AZmuUVmgZHnjQbRZNUl/sowBLZUycbHoede24c5i4N
	 316h7R+2FJAQ0C6LmNO+/lTw2WWCswzmOOiZi3qntlYFHtmr3qtJiNgIGM/wExRlaaL4F
	 4+ao6KbVcoeVoIZ+VSzfhpXQgcAUo6HOa0mMdJwcvGQfQa1RzZujSbo1QmKSDoCK7ff2C
	 d6lFVb4gGf/ZAFRiQD+7VzR1TR4pD/sdVXd5ppGJU+q06SCoLzDyZOqL+rI+VN1tdMUUA
	 Qw72ZKbtuBcIPSbL0QytbXSrRrli8hUuVk9EX0eJV4xVhJwUpOZHGEd1xjpMRMzN3Zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506293;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4OmKiTrJt1Opi+cGwW8nRTkR5lznoIdAovdE+b9wSpc=;
	b=HwDjJKBALA7QJXNNEj7oL/yTRCLZSknKvjHBLe4zxFBHAlNlE1CadimmlblGHaAP7I+g
	 oopzDALvcM31+MhZI+cAH88/8fR+K9W9G9bWRTHf5Se5WDlOJi9TVwL3oiLUcGYJAtqtL
	 iTwUtCEF8YdqJeeeRlwtD4l5EJig7ktWifYnX+ZVT/bQ8y9huAfEMf/ErN46Jo2yim3aB
	 WECYcKDosXpu1t7tXd4pg3m28ELVMF1LnwnFoCbEQ1CF5Me4dX0ixwqSU8EhrvOHL2ZrE
	 +1F3Dyqx8KAtvwUSt098ZyNX7BH7BM49/i2LMaFYA0Trdd1LXAfGu57yAHI2hI1S7sQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=nnSlQpbd;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506293;
	bh=4OmKiTrJt1Opi+cGwW8nRTkR5lznoIdAovdE+b9wSpc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JvoruhH1m9eJC6ypNm1pjdVUxaD3AfFssTkG0iSiOI6+0rA4Di+HBWtRhkq/hTxY0
	 HXuGPL111UH7tiVHIUDh17y5ERYeL25UXJkRyTTVs5sGctPLQd1ZikX199a0UF76Dn
	 NYPudXduNsvt4Zqbza28KxIQujh9eTG5SVY5Ei5W7EoSkQUJUmCzv54yXTR6I04Q06
	 AdqooFGiR98QV9HdUyMC5pNDjDgJMmizXmjz+5s+Arkkct3cbZKDinz99E3bSberha
	 AyvSRdjyHg1aI9+4UJj0Kfl9qONtnZw+4qOUMl1nz0tTU0HkaotQGnKddfVSl0KoFD
	 XYI2mpq8EXXHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D4CB408C4;
	Sun, 27 Sep 2026 10:51:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17FB7335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBF3B408C4
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqUohVOJXTQ2 for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:51:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 47F844084E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506291;
 b=OFOPDjP1PbRGZTW7cE1gU0PiEnBcddAjzu8e/aObRkEBnYkhZFg47xgZVtNqcBLTge6w
 Zf/YYaRDBn30OWAyUgfnRdsEU06aLNc7vpCJ/Z6Mk1hFpyAh/GDJH0TioTGxPDaByibg5
 9Gw8Yud0Og77PXUqg97TsXptO93wkfWHHMurrGHB8jLmxgsHNHLWuBEw1+kKm0lceGznM
 ceyWrrzWDm2Q4vxHyfXV8KFx5ZA10ZNkUnyw3RYwh0EjU0S20L3UDKVhTbJ7Z3KmPbeWl
 7nLRTRV0ZG303i1Lk+rpmAXce8EoLBxN56c8oclSnmaubgW1z4zXPG/xzy+VUK4yAJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506291;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GqJdn8ERP67ikRXIV4fg2sdrMbI++AQNNhaOxQf5wrs=;
 b=pna7hQc9nE66/xyhv1vdEGDCoMeII1q54uvU45F/yDS1NS9tS6EqboW+zgIjrNWuUN1A
 vDCEgGSCT9JRzbRaqlLhYqIpK3qWETvL8khpvKyn22M8gYUrgzRwtZpvN47VtBeS4YNwy
 uroyvwkFXJOQmagoVUuvyxoKAtNJ3+miE1IDR75IVBdgJyiHtSdFCfZ40G7PKNKeqfKg9
 MxGjz8RiZtnrNWMyDaH2EBCgRCIcAyH7qFL33V+JwWXKT8jP81SGymjGuUNWIMaWkD2er
 BKRf91cJ/eDcaF5ZaFImdK7axza18EPgXaads8HE7U4PxGr9Wct3Ne5t27yvyvAiXVA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nnSlQpbd; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nnSlQpbd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47F844084E
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505848;
 bh=GqJdn8ERP67ikRXIV4fg2sdrMbI++AQNNhaOxQf5wrs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nnSlQpbdwY3Z3mOCFE48C9uynBMzQt2BaWmfy8BIgtLl1jCYweV11vp8B4FNJrZte
 SKpwiVzZ7Eex/IAIRWbXpec/3ZzfU4SB4geT8cgQzkqlXtbdToaNv32eH6co7JbGM0
 qVkCG+iN+lhZswNhlibsXfyj4YmDzAUIlbBrB8pwZVeLcpcO7WkYTU7Zj1IXxJlaRd
 rzCru/eKPFabl94E1JkmeHggkOHPlKfoqElqHjeoiSouc15q90A4Kh/+Rccpa5mYc9
 GcWlU2f7kS/US4uFeCEVbKvQj2fEEJ01+sUqzF1gYWeBr/iy0VFyN66gNOEqL93HmP
 ykONuKjZtG42g==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 TLRmLLf7zCQwDwU4j+ee+mHqZW0OxErRg2ut2DijhI//p9BqHmBRjgqsSCj85Ncgeoe7jLa6aDU
 a3jsxqo7I+dj0HOp8P69yreoWpZrMn4qZmSbh9V9yLqI3wxmT2e3eRhDUceMsDSx39Fot8gAleG
 tM/nrVOKYF9jPoQHozebUvMqD4X6+HSOanaGIpEVdI91W3FnuZ2ZwdOTPEtPb85HWxCGwIspQI/
 skOtULK/+rToSMN+fPhxZAl+Q++xJy7N5wR/xrFlRaq+KVCpDWuj0lgx35Ts68OULCaOP+or+Ne
 ftQOWLHF2VklTIDRAVguHyH6b//ZBfwHrDY51KZnnIR/xI9CSsqdLv5dXJ8kpXZmqj8slFmylBR
 cZpCoRgxdjW/cXr0oZgg4Hk+FlGWJ88fgAy2CEXihQ6aWhriwT+BKKMyc5xjunvcCO+RRhzc6RH
 Xfzi7rk3cnisZVOXov3eZ+OiCAKjeHS0U3qo/vx/GOvRNuVLIu6goLB2KI7h6Lbj1p4ntsU9Egw
 d01bwOsLnYcaqsTIXYUcjIWKW2nE19p8VAqHliZUwj1/duDkRuQuVqT8+qDMIRSylUNa/SFKrsX
 p61PZC1PA/BzR9NZVxcpMruUEQItgmgkLOixWOTfBIearduWJAwKvLqD6DjlIAckWn2kSmQ3DJ6
 baZBgbWNru9I=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 42951A4C4FA1;
 Sun, 27 Sep 2026 12:44:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLY-0000000007a-1GAL;
 Sun, 27 Sep 2026 10:43:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:51 +0200
Message-ID: <20260927104301.1801638-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v6 13/82] package/boost: update graph
 dependencies
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

From: Michael Nosthoff <buildroot@heine.tech>

needs match, serialization and thread

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 362cd6c95c..63c50d9835 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -170,7 +170,12 @@ config BR2_PACKAGE_BOOST_FILESYSTEM
 
 config BR2_PACKAGE_BOOST_GRAPH
 	bool "boost-graph"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	select BR2_PACKAGE_BOOST_MATH
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SERIALIZATION
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  The BGL graph interface and graph components are generic, in
 	  the same sense as the the Standard Template Library (STL).
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
