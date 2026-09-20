Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DCAC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA339402BB;
	Sun, 20 Sep 2026 14:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krTMABU65hFw; Sun, 20 Sep 2026 14:07:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BC50840607
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913277;
	b=Lj+vPgbiAOrSxgR8vVzhpx+EPY86y2XjioRKOkYTu5cOjsmZ+aRLq4otNABQfK0/dZq8
	 0/p/yWKUuKgHsUwK0k1P2lqGObXIUXIJsn0nF9bxU4ESZLF2jwn7UcEVQ0bk9Pq+FPl4S
	 LZpusC1Bg9v0mNjt1UGfE9lYozeatv2jzXNV5NCkILtKygyYtOQPnEVGzgUK7aqbPf+0n
	 svKHeyXtCeuRxd/JOeCg9i14aJv/8c920hXEAUXucZCSapwVFCYB0CjHFbkScbkSufiaG
	 ESLr0t/9fLzjIG4a2okemwI0incw+rglIo7W1XFW+dNl2nyOjRmgQMTEz7OND+aFWiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	b=bD/BjV6eOg3iNZsogSPxbKOr36ueuvYqH2q8A96rpobhi9TrcS4gsyvPWQSD4T39dspI
	 QHxJyT1RuMYQN6Z3AW2spZczySFJusrHSkCAKYAFYvfboMePRQJAqsiPlpzACWBkecv0I
	 Jiz8NwF/uwyjMa50pnWqaFcYCM0iHDVZaKBau5qO+3g4RCji6PbagjFdcQKM+qf6iMhzp
	 H/iv9uoDDUIyIz7mGnFGgEhMtYHu9zIUPGK6EEU6hVnGvvMaioO+ZSu1Dd/hZnLqkwop8
	 nSTcCW7rSHcnPaT1ZOU7uvl5Uyh0jJBAn9NEJ8ek35U94QE+XUWLTmyzyM6OtkYKQsw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913277;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qTaOdG2iAgekQ2kDSBvVEw1etxhK7x2mVMKn3/WhAirc+cCMW00R77O3A4M/hrAa7
	 Oyw9mkH8z7D16lBy+5Pb1GcSXYiV773r6aYMUXJ4Uho2eaPlZn4ZHaYGP9aStf+Soo
	 lTPI6UlB9hyX9mYcXVP/gqgm0AjeEKElZBqJc/oIr0YMtBpWS0R8xiQhPXWhp2ibWp
	 lccy/ty5oQoQfH18/AZdH3fkXegVOL8Up0ivzIaIlED86qIaeqU44Rj25HyT7ySfvZ
	 OLXTZwFoe6OgeBljs+GlLK7lhCEQhoVamxE3+7KYYU8qdciNYcHswNDKItovu9jTbB
	 HvMuGXNUP38SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC50840607;
	Sun, 20 Sep 2026 14:07:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18C093AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0ACC64005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-CCxTnZ2UUr for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:07:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0B5AC400D1
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913275;
 b=Nax2VCLY+UkKe8E1VYG2VjMG/XBwEOqYEB9aM7DeK7Xs9bAal9V8xfdrFPvnZKwFM/qw
 oxrFCUVOtcMeHFO6d3uf0qg+eRPswnqCQhZGghkBYGmp2pIwtTuH+tN1T1wuJIYds5PUc
 EOeNhE1W/9gf9LuE4ywuZ3iDEdxhVHnLEZSHW0fsIiNwPh49JeBH82paMqIYH9IKIcjY+
 oEHLWZNdgUZoF7E9zD/ap/wpsAseIPWK4gngQoxQCY9zMBH3U6SZlGtIPkvVRwsTqUOpH
 b6mJkG43sMlXCpY2pKRd1PQ1BYUlj/TDqfJlBWDKuIPok3tic5aY0VLkHHVP3VhQOYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913275;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 b=q1HOhZEmPqDCVbw7ef/k02vjV5Mp7l/p4L0Y5eXTe4SIJMIt8PKUp8c6zpteYjhZ9pcI
 cGXl8GsLqaIbUUlgGP9xCX1Nq/ZkEVxBVFPjqrJXIhb0b3q8rSdN0ycn0VnSFwpwZAwqf
 4G2PvNOeYKAzmk8mOOUSUGBuFWjxiQ1tRYDuiX/FsCDaKtPK5KAJ2GFdu18hjZ308jTfb
 7QYi0NqZtPwo8VROyP1Zjw6+gIgE5GchcIeLWer/Izy2rvEgP5KEuj9dd1+nEx17tcetq
 szcTfbS+fss/IKkJZIVQQ5uigczzRI6a/qJVUSl0CcoWbetyR9OF2qYuYrnfRlYnqkg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=R3eF7xwQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=R3eF7xwQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B5AC400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913221;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=R3eF7xwQimqkJClzWJ4E56IXPOSeFoTj//k0KlkU0y1jsbuT0yoMAMqxPsqNOtR1i
 ZJtCWTEkvClIB7mu6eOlWivERTjtRamyvZW8hPaz6/6j+KpZPqg+OcbL4uON6vOXI6
 I4dYzmHhhGUQnNsi+JyfyJ9BohpWzJhCX1UznbwHLnQhjmr8vlaiZeZ6jfSeUTiiNG
 GnUgOwAKP9jubuW0Rq0DRtR2jPuH1Ue5xQ11ovcVbqrj8qjG52t41VaKicLqk7n4rX
 RcKh5Ldh9/veb9qnSHstISSwyS4Hjx2lZcebP2gQIbJG8To2nrLHPbEDfl9W8ae+Zb
 a3gZzPiQuTn9A==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:m87rrQp+rW/Q4/IVJxKVSVynxF2iax+lzRhFpfS1MC3n22mXyS/nDXzGE0gKPNlQIBFcDRAdAMyuodwhRyZ+xR15FAK7hPb/EM9IflyN19ia3Ag4FbgNjQ9Q5cwsp832cmN+twONdYZeGm10oLjDLNTtaudIzKHpO7IQQWi7Uiwm+A5CKsYTcvV5C2uBVLn9HiPmiwRRsbdHkZMM06jgw9Ya58MzZ+RaR7iuZfa/B5BKFyhcsJrCQLKoujJlzCkc7Jm8SJ0pf14T7WEO42eg/I6KAYAard5tw0Jcx2zYwCb4+JNLoMz1N6zzcE1V1caiMuBLAJ58kcBpevRoUYcfTeXhKwLPpm6RKpsU2UoyMmHyiUZyHFTscI/oqZ30zJVjLZe5RVL0Uouj59JxZGEEKO20ZlEf0K3P8uoaeq2oXiZdjI/v6YPVpJ+lp6kwfkz1aaCWUJ2Anv9zaFOJkoZnKtOfCUjYAcaxKiFPlh0aBRNMdREq9xvWkYkQemOf8jkqRCc6v6nj5+41cj2zfJalJN4oKgZYotxglyHf+yPSsmVpJGqH39vwTxM++xIqCP6+Jeu6jWV9uNiMbzMskZUlOSa0Tjq0hHIZ1y/NgjfGxoctma
 QUaTz4gD11YD0iEI2Kta/VJP4c+auknxExoJDUpTkEfTAyiF0pMyMeIcTklizJubrPuzfeZWEv
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CD3CEA4C47CD;
 Sun, 20 Sep 2026 16:07:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBJ-000000002J9-47v8;
 Sun, 20 Sep 2026 14:06:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:36 +0200
Message-ID: <20260920140605.3005461-39-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 38/66] package/luvi: fix build without c++
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

Buildroot commit 00317f0aff243986983650671fd220ab040af50f bumped the
package to 2.15.0 which first included upstream commit
https://github.com/luvit/luvi/commit/262d5f7dff3484285cd8b3bf2ed32ff0f13c8741
that added the miniz submodule.

The version of miniz used by luvi contains commit
https://github.com/richgel999/miniz/commit/05ab4dc05c9d1e1f951f5849b659e2c7e291a620
which removed "C" from the project variable causing a dependency to c++
which causes build errors when the toolchain does not support c++:

-- Check for working CXX compiler: /bin/false - broken

This dependency was not intended so we add an upstream commit to fix the
problem.

Fixes:
https://autobuild.buildroot.net/results/2a5/2a5cf09dc9303b11e2a2769c5b0b319284ec1bbb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...eLists.txt-only-require-a-C-compiler.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch

diff --git a/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
new file mode 100644
index 0000000000..c68e05bdc7
--- /dev/null
+++ b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
@@ -0,0 +1,47 @@
+From 383e551cccf41fc2ce1177712d6a37a85d936642 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Tue, 1 Apr 2025 22:56:00 +0200
+Subject: [PATCH] CMakeLists.txt: only require a C compiler
+
+Commit 05ab4dc05c9d1e1f951f5849b659e2c7e291a620
+"Add some catch2 tests" dropped that C flag,
+but should instead only have added a simple
+enable_language call for tests only.
+
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+
+Upstream: https://github.com/richgel999/miniz/commit/383e551cccf41fc2ce1177712d6a37a85d936642
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ deps/miniz/CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/deps/miniz/CMakeLists.txt b/deps/miniz/CMakeLists.txt
+index 156df83..e0933f8 100644
+--- a/deps/miniz/CMakeLists.txt
++++ b/deps/miniz/CMakeLists.txt
+@@ -7,10 +7,10 @@ if(DEFINED PROJECT_NAME)
+ endif()
+ 
+ if(CMAKE_MINOR_VERSION LESS 12)
+-  project(miniz)
++  project(miniz C)
+   # see issue https://gitlab.kitware.com/cmake/cmake/merge_requests/1799
+ else()
+-  project(miniz)
++  project(miniz C)
+   set(CMAKE_C_STANDARD 90)
+   set(CMAKE_VERBOSE_MAKEFILE ON)
+   # set(CMAKE_C_VISIBILITY_PRESET hidden)
+@@ -309,6 +309,7 @@ if(BUILD_FUZZERS)
+ endif()
+ 
+ if(BUILD_TESTS)
++  enable_language(CXX)
+   set(CMAKE_CXX_STANDARD 20)
+   set(CMAKE_CXX_STANDARD_REQUIRED YES)
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
