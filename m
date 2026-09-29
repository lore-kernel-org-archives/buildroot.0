Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE91FCA5FAD
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A314280EFE;
	Tue, 29 Sep 2026 18:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2vFa6EGF2Lt; Tue, 29 Sep 2026 18:42:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AB6538100D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707369;
	b=al2WMnZ+lhSGadS+7y4o/8wYbKKpsNCYxi1Lmt5VuWoVScLlYT62vPiJ+342jmY00nbL
	 e44jhnapNhzwaASoOZA887LTLMGjwmyXrvesTuCy3DFkKdfMe4GUclhJjffhvqoHirUYq
	 EAjmgHNVi+M9AO+BersXgXest8aL8boVblNJX1BJ4JgXk98czRVOqi50Ks+O/PmWz2ems
	 SsPnIuqc7O4b+OKmH8TJd38V16Wa2oKCbNZ00oj+D61bek+BPZpLKw6ySijnmK2cs9B2g
	 vJfPqbHlItXr3xajpnwINynPlDgvJV2vwgXq6l3rY9q5gDq5rv39iIgkEC0vjSR5XIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707369;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9hjy+p8U0hlDKo3iLgbga+U4tKr8QhzFlTZcwP3lcWU=;
	b=Bv7rsXBpTeaMi8go2iAgiEjlLywBqGhEe9SJoiH/tK75i6LZYJPftyUrZgierHMl877E
	 Ub+OiSUMJO2vZywODeOn2HKLN2uM4kb+yLVf/GcBE+0+kwiyaEifZdoZhZ84QQWy+oUvg
	 pE1iAOevUmihj+HXyHb9Ax97uR2JpVfPBJTaMsP+Q5yV0RB7bkFvIq537gj9VzEFAahdt
	 k944yVJazCR73+2h0tdDOEMDN0ER+ZMXIiQWSsDnmxHgNEgxuz0XVyGYZLJvt/UaBQXes
	 VXwCcMQWci1sJRH/jkpPJexxyyd1VFxg8knO2yor17i9b01HiucRQZt7Eay6HNz5Mjw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707369;
	bh=9hjy+p8U0hlDKo3iLgbga+U4tKr8QhzFlTZcwP3lcWU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B6qHC7nHW2FpJ6vOuC0oGiZ4PUOHpo2/3vX9JczICH70T505oMpJgsjOIoWZtGsWu
	 mFMsIvRkAE6Lf/LBTqqHXz4YZkWzhI5VpOF6iFkFlrLqYDi41oMnoaGXAxO9yU/mV5
	 jPMe09ti7yu/mnupZnn5LCLsRhLnBXLbOhQ/mgJNWt9zAms0IoDc4y1kXliu8+Eaoc
	 oVl9CiI50d7JbUpzp6yviJjGbjzxmTXuTsq3MvnAiHSuOJEs+Iqxlu6FFC4ZAjV5Uk
	 7Hhgvn0ZNoq2cgG0Dsu+xYFqkb4JEqW0y2hP2aUSDIr7mXqnm2/078hyBKknSxLj8R
	 FyY/ZrDcPdFbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB6538100D;
	Tue, 29 Sep 2026 18:42:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C05DD14C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5FDF4046C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hF47Ht3c0oP for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:42:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 792FD403F9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707367;
 b=ECgpC/Gn758crDmKwU9Ij15VDQgBhsXo/JuRExInX6XjibCSvjZdI8yDueyMmA5XL0F3
 D4MGaT+tiF4w6dWsFkD+y4x3PtdaM/oZfNuPRn6RUEHBgHR4ExjR9GOqiUPXM8L5hco6H
 jzZQ/JDr+5lZ7poltLV2VjYR9VnZk9yA8sPGmKi1qnR6q92oBfY24wo+iyORwK61FmEFh
 kJxFtLMNBRIPntPnnyYs0ji2kr1+fRMJ+ZyBt3Lmq015L99+8ktYGTP82ZBaDrzVCO5LI
 Du+tszncxz+qEpa1Jjp5bAgpNsWgFhdcQf7puNzIFuSJq9rPg+Uag9c9woLkO//XnQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707367;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Ci4+qhLuaJZBZSAe0ZUDK3prlEwSXUALeXMzD6T+wDA=;
 b=hxbm8Uaw04V1m+dFOwn34/6j9/yCDK4ugsasWk6ER1txhjz4LIRC3yO7FPqRp4KXEdmk
 NR0qv83DdMhkI7tk8IxyTue2pKvMqrElw5P9kqXL59jLYu5WUNBq8Wdsm4wdJ+qeagxlQ
 5+xmr7EZZpGeZy5ZW9CKLvaBb+PGJUs5vPpYssaPVaRJcawJ42b55kTRHfhg58CXjjDGH
 P/reNpikrqIcvK6oQGlqhi/7hMG9SR27kOaIdiAXFuu+ZF1NxtAMiy8e3Z+N2lOKjIqhL
 3l0CEgga9xeyj1Vz9MAhcuCeOdfrtqVjgetIhjfzwmH09tIvR30gOBnFKq0CEmZ15cA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kZxnctEZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kZxnctEZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 792FD403F9
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707027;
 bh=Ci4+qhLuaJZBZSAe0ZUDK3prlEwSXUALeXMzD6T+wDA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=kZxnctEZEfdRLfzwZVF6di9Zob3tWujIKI7aSrggc3Pwsi1jDkG01njiPW1bVuTzY
 TvbiUbmaB9DAqmkBbkswlVlVc/uVol3UeImENRsDhbabyyMIjdSw/KvSUHPrU4xc0r
 IHGeF125lL0AM7cP1N9C3/xyYRtj0U+r6aM/vJkQzscDX7lnZwvjYnXKJeOjEyNoDO
 Np3GCV9T7bloXz4YM/cNL7ed8RssgHaeamhsPhz/GRff2ayfa486PDakoaTH+e5ctF
 jmtf/A5uBMEgos+599e2bCtWZDf3xu54tqC2wwzaophxBE4LaxQJ8+BjjTYqCI57d4
 NFhSZiCAWsumQ==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 3nfe4qZ5RcbRoneZWF9/m+6gNxDRS+cM8/mgze3TP2FL/TokbyJEfRXVjM971BaWE4hhm8iwGta
 9tu8bBbuqhZNscNOiKuJSgrPsb2wp6fDywEjJppmR4zvKOomTyYJ6oeaGgsVgq+h3iOH1OpOn17
 Zp0U9LpcPaBKKTm93UA0uQfJmxSLFjYyBOxrHOwl7hIwcYHQS3cQruN2iFYmsgL4xbzZTpFURRD
 Mn6hc/hiMnW3o+nP4qpmEMx/xZPugl+NsFx0yf61+NFMq8z+w7Jkghi3axZJMuq/Jw9bifePAFm
 DpHZdtp6O1Qg5oJOoI0erLULaNxDCimI3qzzjfKSOg28vVlRfPJ7+xp/I2iPU0AN9OuRdx3DSfe
 XnBLeVHaKsF90WWiJQqBjwZFl/BYmnMs6iZN457CU1iO3/9UXwHccvUAe4FFbcduAZGZMvWtLxz
 T1LGkstwsy2Oc9PpMPBoFrLnLxRt0A663aUs/rqo0fCnLd8tRmZJ830wy2+VKkMhsN5ydYVeZP0
 aaxTZMTH0gj6r8S+eqmxpSWMvPtxS/LN5eFzb43Ss2aFkA/+2bvJwHziwgEwkMtezo8nstZawTj
 p664Vsw=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 249D7A4C51D7
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:37:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgg-000000006Jn-0sYA
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:22 +0200
Message-ID: <20260929183607.1849293-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v7 23/66] package/nmap: bump version to 7.991
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added patch to fix build error introduced by upstream commit
https://github.com/nmap/nmap/commit/a24082eee41fcabf7fa180020e1771af3226b358
which was first added to this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...if-compiling-without-Lua-support.-Cl.patch | 29 +++++++++++++++++++
 package/nmap/nmap.hash                        |  6 ++--
 package/nmap/nmap.mk                          |  2 +-
 3 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch

diff --git a/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
new file mode 100644
index 0000000000..54cafdafbc
--- /dev/null
+++ b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
@@ -0,0 +1,29 @@
+From 4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5 Mon Sep 17 00:00:00 2001
+From: nnposter <nnposter@e0a8ed71-7df4-0310-8962-fdc924857419>
+Date: Wed, 12 Aug 2026 19:29:05 +0000
+Subject: [PATCH] Do not call NSE if compiling without Lua support. Close #3434
+
+Upstream: https://github.com/nmap/nmap/commit/4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ nmap.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/nmap.cc b/nmap.cc
+index b94c71223..70206daed 100644
+--- a/nmap.cc
++++ b/nmap.cc
+@@ -1858,7 +1858,9 @@ void nmap_free_mem() {
+   AllProbes::service_scan_free();
+   traceroute_hop_cache_clear();
+   nsock_set_default_engine(NULL);
++#ifndef NOLUA
+   close_nse();
++#endif
+ }
+ 
+ int nmap_main(int argc, char *argv[]) {
+-- 
+2.47.3
+
diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 17f9eb7f5e..bbdb81ec4f 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,6 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.99.tar.bz2.digest.txt (lowercase)
-sha256  df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2  nmap-7.99.tar.bz2
-sha512  9ff69659b76573eb10b6e472a0217032fd5fed20f0ac971b3736a4222fb6251c5fbf381ebea7ede313b8ff2feac90a848f645000c61200772d01b843594f4ba4  nmap-7.99.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.991.tar.bz2.digest.txt (lowercase)
+sha256  a5d507f29437bef3bedd4771ff9aaa8fc1c2a109ddba1f5b1cf12027456929be  nmap-7.991.tar.bz2
+sha512  d87836eedd453f4f5e55075b50640a6ad61cb5dbc1f887dbaf725fa8c32b6a472d838d174c68a2efa749b3b028512d2f0467aea0ff0b5f5752df714db62f8320  nmap-7.991.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index b04d8b080d..0dd96d2b95 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.99
+NMAP_VERSION = 7.991
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
