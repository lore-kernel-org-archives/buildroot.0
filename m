Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C817C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BA7940DC6;
	Sun, 20 Sep 2026 17:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gl8joBthtgUE; Sun, 20 Sep 2026 17:17:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 78AED40DA2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924640;
	b=HKd/JNFiV3qaPKnax5ZgFuFLP/RD7P9oLNcblvgb1MGCU/bpdeV63uJ4FzSrq2DTc9rG
	 GERPm2RKwA9jr/Cj2LYZy/KxH895oF/8xNoP+sLyApOTUW00/9Q67pEkYZpwoIrVqdNbA
	 RVKIJSae5a/2MqCs2F4pKOjmTaGdleGWbNTlys3y1C1AasBYmzNnXzzcSwTo1zIsYavmE
	 4lFySIPhJEFjwaNB2NJG4Gkm1XitoLNDRm4AIWBaZakRacUKvaPpWyW33uao2P2l+v8TD
	 y7j4+XG15PbjPi8FvjZA0tPGPo/VMjsLBJsy1Goxg+sfgtvxR7dIHQ9QTASHwSrbOug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924640;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=p9L8kF8Nzp3KCRi/r0+rSnV+oz5ZYOsTUT7m57x22uo=;
	b=r41UoPopEoQZX8E/n+nop++sDtdx/nSfbER8f67h4FsMCkmtz98WJOChWfKUG2+Fm7XD
	 5Cjpggo78nwPmS+wvcsaKSBFAPU6Wm1dHaiQaZV/ysRiJD9o2uZMPR7+fivnph3s8yBFp
	 Skv1TMXYpWR634obHFDNisBs2Hfdbirlp1q/5to2t7nT9rw6IQQo5+Mpi+rgY8uuixlA9
	 yjP1zujJ6sAGYqYwNy/2l2600H5O+Lteegou+zm0kPdG3HdbLU7YEq39Vg1n5BpkM3nuA
	 lQMhXaHVLumf4fNzYKbvCnQYHoi++zFQR8XIOvS98+VI3fsiYz2ZrK2qjCCsaKe3qrg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=DE3ZwcBz;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924640;
	bh=p9L8kF8Nzp3KCRi/r0+rSnV+oz5ZYOsTUT7m57x22uo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lKGDxBLSv3TSAF2e7AHbz5st98K/yigXs7m2996q5Hc0xk8GXrphV+7k7L9xkooyt
	 D40bIEcv6JhWTI05FTxjJgJ5oqsDhXfc1nTPlrvEO7W0HPIVBS+vtM67CQne6+SBOq
	 Vnv4rhLMQGiL9+qYeIJTVSkNG700L1O4iL8uCOpmdOW+8fYR0PWo+Amv24KUQyP7tf
	 bvYjFtRX/07Bs23OKbPtHNHYf2J7jR4M8WC8uKRb373Phz1++e4zlC/K2KvzazJy2u
	 Pmvq6DuqUtNe0r15F8m5Lh8NluoDbmD3/L5tvF3819hhK2TXjkkV1BXwxGHhaf5wIt
	 +BQKlV43DqXng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78AED40DA2;
	Sun, 20 Sep 2026 17:17:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8099A37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56B0540528
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJyVOoR3nT81 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:17:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9917340F50
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924638;
 b=UbGwwS4Sg1B4ca5maaNvZkK0lnYDz7vu7Wd9DMsAdO/DclYubY0Vtaafk9xg7i9zmuON
 /8733ywbkIYCFiGD4goloSJAIi/Zb2ITx8GXVTtOXpyruv+pUTYVfQZzZV/pxOtjrkqSj
 FVkXixOCpAyxwvxZ9SCCVAtmbEZFJwjykRdr1PmNyxas8tzr4Sm1/TS6UszfkwJFtdt//
 eBE4d54iRxOlyWWlSHypSrzcn5sKjEba4XMJcZupYSV6TEfPZ8t4EAQFxAIsP7jITlTrR
 gvyPJ5DxnSkise96rVx6z/kcVeu7aXkFeE0Hs+j0PLH+KXPsGGgpvzTqXdhJegrLoqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924638;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dIFh+ZdunTyCcogzTlY9e/HYnSfn0B2UGyOpJK9cMys=;
 b=en1Wvr59t6Yp73ocL37Dp4Z0onGWrACO/hQHeeos9fQQHKgHbC/Xh/3yaQZmAjnTpH7Y
 84ANw70UVFbwYZbmInC7ctNzx3m/lbfKkzyKjSz/bIndTsnTWeT753BmDpNeyvbmMSh0a
 0xfzvCJyhXGVBPF1WpJW03PhWOYaIcF/1ibBqunBaPiiV+y0iqK+uT8qdaxhqb1sEzUvg
 dZ39Z+R+9GLoHPO2uIP5i3b4pzKWYsczmQVW3NRiXxYHLA84GYTS0btsxYWSpT8PpFz7A
 yZzjdEpX6Qj1wqichx//7nQXHlGuicoh2d0RJVZzAeOT9rfs4U6uJ46/kjQTveQKBvw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DE3ZwcBz; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=DE3ZwcBz
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9917340F50
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924157;
 bh=dIFh+ZdunTyCcogzTlY9e/HYnSfn0B2UGyOpJK9cMys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DE3ZwcBz+tNsI+EWnMjyEl8Efc2w5n9Of+SjkiKJi1UypE1RdjbEmEZXlM8bwP90Q
 1sLcJjSH0d9LZdu4+TN4DKDmtpMP/bDX5MTKGojgDd9hUDxV01si+WueMKvtKLqJOv
 YhXwZO8oPBjccqJscOrVw/WDPUMy6xCEC2gOyZa8oeSVcTfTHTja4eUEnmVt8LRvRC
 5ktHEDZPDd48a5NgZ6Aw/OWOq7EHeQYbN72+NurZXRh/jA3H8NOOaUUzIm4fKkO5QG
 fTIMHCd0TWNhlgaeZnXCooZFYsbq/Yq/Lt36rawx9i5dptcJ8iaIBhsC7crLqT8o9z
 pV0rhJiNzmH6A==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:uICFEgGmqyxka7dyAtyBCJHW7UoiSwMofZgp0MJFXQIVp97DJ+fCjMQYTLgT3cmPApdNb1gi645yQAdyL3NJ6Sw2ir9bLGo74UB4L/tguPtrpeGo4kLWu+Z1It6/FmAER1WejCKGtfnWubNfJomV8BaCLFRB81eMYZWo8E5PRjJstYzROHEZjgHjmFtKaIRyx+BGchRQOMwpIMQqv2hecqvNf5lMlgtbIg+ijnptHpfPMk/+tVYvYisfOTKhUj0WryiZ9CTwgHhbExIQ/4yvp+ws/X+S1I0SBZNygwiq6udNplDD/rw4wmD8oHsAiP8jMe2McF+K/5SCvB+I3jg/N+lylJH9zyawxCAohHwYml564AYWTmfFE+Tur03odV15F/TC0r4rX9uOMEZxh+ohk3qpovBMNJcas8BQpX80B+xRou2MuSo5O7a37jzjG8MQL1bPbSUa1bXBZs6TylS5ZIoEKl4ZZfsM8SSivj4Iw3zSBMT+02OnXLthxmMVfSI4OUDPdwp+t5TQu/AIBBhho74ZBZVkWzWuIqV4S6KQWy0TzAeK/ihk0+sQXL0pNGlXsYpzyBnESlD7Hd9eJL2G2gLPM8McFXSM1hrMu3OwaypIa/
 cRoy9TcdiGt8J5ZoQldcpaWKPSilc+vbtOC0fn4uVvGeKj+pHBm2O/3GIBDBKFNOghCqu9Px0=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BBC30A4C488F;
 Sun, 20 Sep 2026 19:09:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1a-000000000o7-2eFQ;
 Sun, 20 Sep 2026 17:08:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:38 +0200
Message-ID: <20260920170815.240247-32-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 31/67] package/gloox: Fix build with OpenSSL
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-build-with-OpenSSL-4.x.patch     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch

diff --git a/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch b/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..bae3319115
--- /dev/null
+++ b/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch
@@ -0,0 +1,43 @@
+From 69c49c945aa3847eb12a995f949d97a2a99642f6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 9 Sep 2026 23:27:07 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.x
+
+Upstream: dead
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tlsopensslbase.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/tlsopensslbase.cpp b/src/tlsopensslbase.cpp
+index bfa1fd9..a71ff11 100644
+--- a/src/tlsopensslbase.cpp
++++ b/src/tlsopensslbase.cpp
+@@ -224,12 +224,12 @@ namespace gloox
+   int OpenSSLBase::ASN1Time2UnixTime( ASN1_TIME* time )
+   {
+     struct tm t;
+-    const char* str = reinterpret_cast<const char*>( time->data );
++    const char* str = reinterpret_cast<const char*>( ASN1_STRING_get0_data(time) );
+     size_t i = 0;
+ 
+     memset( &t, 0, sizeof(t) );
+ 
+-    if( time->type == V_ASN1_UTCTIME ) /* two digit year */
++    if( ASN1_STRING_type(time) == V_ASN1_UTCTIME ) /* two digit year */
+     {
+       t.tm_year = ( str[i++] - '0' ) * 10;
+       t.tm_year += ( str[i++] - '0' );
+@@ -237,7 +237,7 @@ namespace gloox
+       if( t.tm_year < 70 )
+         t.tm_year += 100;
+     }
+-    else if( time->type == V_ASN1_GENERALIZEDTIME ) /* four digit year */
++    else if( ASN1_STRING_type(time) == V_ASN1_GENERALIZEDTIME ) /* four digit year */
+     {
+       t.tm_year = ( str[i++] - '0' ) * 1000;
+       t.tm_year += ( str[i++] - '0' ) * 100;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
