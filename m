Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23209C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3B3040DE9;
	Sun, 20 Sep 2026 17:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WP8Rrm7ch1A; Sun, 20 Sep 2026 17:11:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0C9D140DF8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924305;
	b=ot1RclZtqVRfH/k9ZYRd4gpPCmAX2Tivy8jZWe5kuVE+9ltIy44M1KxOHpeOj/cakyTj
	 zG5mVdtPrDIghli6773vcJIzBXqSAdVCSKPs7YtmVMRoyCzf8aR1ywxAZX5j9KjOdi/Z2
	 yF7adjWImZhnOvWib5f+kZtvOE1h52D57S/By+mS40QhuXey4veooTEOYoGQHSBFJH4hO
	 6egmntUArPyoH7s6nEVNiGN8J2IeMiUviyFRj275/BM3AHp0WYem2OD8Sjtsg5GweKbqg
	 s1TvnVsJ3YnPfb6x9XvTAlIh2r4iAXhjdrOyAZynPFzA0Vb8mHTW4EWQmGrho9HOmjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924305;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	b=FCaYccowFxj01l/L2ciLQOUvbh3ftgCc2pRtGubR0/n1o4hTA+YzrSxntuNPEJaaW8Rb
	 LzFTJahlNVRdZVgbzP2h8OJ2GQ12hxTgmAFxq8DY+w994qlCVgOf0qI3PpzZDnb7vS0JT
	 AYmDnhRwBNPsb5NkgBvJ4e6QjwGjCzPWGhRy74o82vDFARWAT7a9LGOg9MSLGltmltnea
	 Bx5x1O+VT/n3o7b/t6jvHXgR5WQI/ZU+7I0IBTxB/w1VqclOx7/ISKYnpv5P8tBlY6Gg9
	 gCuGEmtwmA1BtrR3oG47yJiDGMy+aGJU/Y5mRWlvENV81TC+HPM9M8FH0ieU4Exugqg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924305;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hM2oF6pVQ7zKYiEiE93kvws7xZs/OTfMemHY1vwXaIy6vuyVO1+PuF3woWRPapRls
	 d+N/Ba3oSyX2KMGe3dQgfGdqZjVPqHoVHH7psA/DJkiBddI6RZT/ErKuhqYxi+Ywg/
	 9WKdcJch1BOBJSPVbYBrQcIA+ac5eIgRldXGASsR3NQp50R8VlaLn56uVBKzUPnM+T
	 jqW9nVri+Q07uuljom7JAQR0lv6amjUDn7kwmK+BxxS/omDw+1AjOLygfJSyfDmKr+
	 EEdPTxsiR9TUK6MQIKO1qXSARMG0vUoEqiRy8Bwc17QiK18RK1/IXkJ2gNWZxA9FtX
	 /UluhseYcDh3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C9D140DF8;
	Sun, 20 Sep 2026 17:11:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 497793FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FA2C606F8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqFVuhB0zX5J for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:11:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 45CF5606FA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924302;
 b=Rax3BP08Pa6y2YKjtZSiG5/WvnnumsgRrQjGFkny17A0fb8So/Ncr/mx56cRP8Z3Oz/Y
 8R25xPDmJoV/NCW56pxvTQ0InH+1O1ZUm3Uyj34BQblwZYFzL3Ppo1xpkp9KOIbPl92gC
 giBoJ6knZfP5Ow2lJsPm0qqmijq593gk0vVc4ZW+rBlY6EYiGffVH1Lfr1AHpBP8XiBwr
 DNB4aS2kDYAlnBAxeq6LKQENNYRzgtBx4gsmwvJ+KNmTBl7NWbzsvRyGUJueUU61eRRpX
 psDoo+KOX8/6ID79SUEd0H2ZESwIM+9cHgchJOQrVxLtd68E++8PW4R2MNzmxtEziaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924302;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 b=lwqv3TSE2xi6xSaVeE6R4NFQd7N7M1Ye93e8dQkVMbZCNDvLPuLRi/BcVd3L4naFw2SN
 b25pm97TdwT3N+X6rIZWD5yFrApSxKU0wxDdhdoyAC6NURiB3JakrVUnOo9zR0gVuHg2t
 dcrnbyFGW6UvxcDH4dNC17j10N1LErjpNakbvqhvGKzkX7DIKo+QpJUP6fGyt5EWHZa6l
 0ovNjIOl+d73Is+On47qNxIRNKNecAv6hlHnMLM+2Kbzj/VV32cagcrzJuhgGbrPyGDJz
 /TvE3C3VOBbuO6lefmcKXxbTV6LPX7RVCpZ833zU9jJ7KBINrZlBwQGV2TVDClPClug==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=o2yV5JAw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=o2yV5JAw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45CF5606FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924146;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=o2yV5JAwLqDqtFrhnbIhxUzGdAp+IR/Q1o5hHa2qb0azhd2O+K8Gj3UWOetwnDJlH
 +E91sAOh+q9sCfWsT2mU0xZRhcrFQsxck10pKV4KjOwy2SF34hNv+qD2jDgoU+TaXX
 LGqO7wxVsirpmHtCswnAF3a6A+Yt5a+Ov+/6FF/zyP2OD5D5qzIHYcTi9UqIKo54VF
 B+khqFU+f5uR2jq9zh9aUgF6CIDqZstguFvBnw5vGYnvLQnukSjGMPUjkmAObEJXVs
 JCmQNrXJdVxnwQcteXODBTwhGczboolqUU1MfpLGFtA6+laAho7dfhvFCvyGmM0+6W
 63XVkonQaIYQg==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:ipHz664rYqwPZKhI/cO9YJ+AKIfFtuTVOvM11HA4GVqSleUc85FZ4hLqMHdVvtXObL0HiYHndJAs5NaAHo6JGoCFZYE+6lQPxBlaFCLTykseurSqXi3+ntx1ddoxuj/8Nx30LWIOVEq9Q27HANDkH37C8QCD2z8MBlMMeO4BD3eP27wKytwDxU3QQkOT3CxTzbDxJqqnMWtb6b///Pap2ozfNn7ekeAf7XozvB3lfC+jFerdO93CQaR2bBfI3fKJmY/Mojkhcg7Sq8qfyW+OMsELaSat9sva6321kWUcxVlsIZKSekk4cqrVMurhuMYxOGDgrQwguyYuoK8B+6UkctD6Ud11HlaNoyZjv7JK07zDRvUjI9ykm8gUlmi6zthNd5TX6yw9+XGl6MCs4LCb35kFsBkv32JZ0LUlZU9U2q9JWUM13L5IQ+cOW0w3TiHvLBgEZAxvg4hkAdpvHjsm2KEjFnj6mBN0hvtgITCqZ6hFyoUe2ynf0tBx5WtxyBB3XoXAR+H2G1UZS9srkEHEYUS59gpjViaEB62iC7xCz7uG8jxSNBsJvq0g9kKgJwxaa7+nlG1gNAGogxRkZNc5KRFURSpImSwuKnAd+TdW8iRFwb
 XFEAUUyWISbMdY7bTAKtkAmlNmnyriP3wz0jq4uLRcjY5GY47sbJat2XbcG8ymrpMqdNSn//A=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 03EEDA4C4873;
 Sun, 20 Sep 2026 19:09:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1h-000000000o7-0Mxy;
 Sun, 20 Sep 2026 17:08:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:08:12 +0200
Message-ID: <20260920170815.240247-66-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 65/67] package/xmrig: Add support for OpenSSL
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
 .../0001-Fix-build-with-OpenSSL-4.0.0.patch   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch

diff --git a/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
new file mode 100644
index 0000000000..966744abbd
--- /dev/null
+++ b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
@@ -0,0 +1,40 @@
+From 357fab10b79e49dc9b8f42dc6cf425a8124a3f40 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 2 May 2026 16:45:38 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0.0
+
+src/base/net/tls/TlsGen.cpp: In member function 'bool
+ xmrig::TlsGen::generate_x509(const char*)':
+src/base/net/tls/TlsGen.cpp:118:32: error: invalid conversion from
+ 'const X509_name_st*' to 'X509_NAME*' {aka 'X509_name_st*'}
+ [-fpermissive]
+  118 |     X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+      |                                ^~~~
+      |                                |
+      |                                const X509_name_st*
+
+https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/xmrig/xmrig/pull/3808
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/base/net/tls/TlsGen.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/base/net/tls/TlsGen.cpp b/src/base/net/tls/TlsGen.cpp
+index ad2e648b..59e4f0c9 100644
+--- a/src/base/net/tls/TlsGen.cpp
++++ b/src/base/net/tls/TlsGen.cpp
+@@ -115,7 +115,7 @@ bool xmrig::TlsGen::generate_x509(const char *commonName)
+     X509_gmtime_adj(X509_get_notAfter(m_x509), 315360000L);
+ 
+     auto name = X509_get_subject_name(m_x509);
+-    X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
++    X509_NAME_add_entry_by_txt((X509_NAME *) name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+ 
+     X509_set_issuer_name(m_x509, name);
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
