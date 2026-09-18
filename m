Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1429DC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF64060E60;
	Fri, 18 Sep 2026 18:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IKiByZJcr4c; Fri, 18 Sep 2026 18:54:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DE39860E76
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757660;
	b=q/WZnTpLAMLE+GzETDx1oSQKKue5hMppqRUD1sSpNoscmQNdxvR1ssynJKFvRulAefw3
	 4Hb5FvN75T1aZMF/5VI2b+0qpFzYHqfA8Pj72S9bczeqXFXvoPfXGHEIlguxN5pw0oB//
	 6Ntl8QFciThgFPHSMHjp1CQp+iziQxfKEw5cJcQX8iVW5yn6N9VInPWximcY+jOj/Xr++
	 1QOMMW4+xeH4JrN8LEATtAc20cm2SB5bywyMNNuhS8t8rbhmpBrLWUfDgi0s8WcKmJdiw
	 lGpMcoPYc49Ly044zkJA3OxJ633yv1RvX2aA4rZDHuHs356toNKwLS3+3CrkXuBtJfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757660;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	b=oiprSnwFSIU/rIyRoW12D3H2avoFiyCdW7HhEE6htjAPZN7qog6tXinVEiiMjZbImyBb
	 N2U6DYuw6TTytvqoOZeJuvaninnP6dEWvGzFT/mMn7uGZ6cCQmiu5w89Xryz41MQ7GSeK
	 7YKH2TqhV/bBDpuoTI6/iHOiuIyezZJjUu2cQCwum8Yjswp6Ql26FaG6jbpxeruEOTUYs
	 MIw/+82VnqjZ+zEKJqBS0X5DVw7VSLEB1R7BvlE1w3kC+oYRk/dv05hRY7JBvdcQ351IX
	 mXuGm+aNNuDpAlPnu9MWCRLwlARakCnSkqhhSK5MbKh8fjDI3WRzQL4fjH4EH9yjygA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757660;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gD47H8eWHOONkGShqfejTUUPtl57vMvBts+bCOEvyxb8o9FdDPm6C2uFEqG8c0I6B
	 gp2lE4m3uF1UW+Jj4gD96VpcvE5ANA/dk39CUcuciWwFiAYra7q0YHgs4ropLKCFRC
	 8JsZmuEj86kfaf22SVPJ0pLhtkFiV1y76cZVjCpiHFnIRK5i2bWp9e7YfhU2pWu2s4
	 dz4U+9f74dCVMWSVUIrs6bFLx5x0mPBPK3M/0cBOJD/4x1kiA/B5D1kSxmrRRBBoBU
	 YcYabVrD2XPuPH86CoDcvE1TmguRxI2z+HLTyURwMNeOjgfUjSEJIG44bY7bjSc9Qp
	 oUVSJ4HYerzrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE39860E76;
	Fri, 18 Sep 2026 18:54:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A193237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97E7940B10
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjVdO6_npXRY for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:54:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7314840B43
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757657;
 b=pWXbGPmqhusCe9aoujTGe/D2LUDK6FFkMOk2/7Q2U+c0K6h696hu25qyrj7CZ8dD+BCr
 UOP9qhpzhe4Z5/ES69ho2/XcMGCibHELcrVjjSwszA6mmC5d49PuO4j9HM8ZHxPb76TTP
 ZToI4Li29gWl62SvaM1qH+kZCACH2Mr8jQoj0FYxjLZ1VsobGEBXW9/CVOi2hbWrnVlai
 O83xsJvbkJAvMCg4RnIwsRvR9m4yi/+ZeqvJR0BDHj2+0uQZahIaSkXiD84igNny3jJU9
 n+hM0sL/sqHVdwl5AYhpLsVKm2Jzs/yj5KcMa9JMMjfAVzvo/wVE3eUTpsezAsgoktA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757657;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 b=TjXu7FjXp3ZZex+tMOp0hb+++q5Douy+PUPLAo17WTyPTx2sYdm7wgSQBBYI0Ae7j/jS
 BFI2jzrD237RCxY91O/zTpIt5RQ67obfi3L6s5Afe1xpOqzOVvCaEh0EaGhaE97RCNcL2
 E6+foee1Angm9Wdnk8FmbmY9HqPanMqavRIQutcB5xrS5q4sKTQg1wMK0kJ4Pjphp9BEx
 q9H3my8zEb/VfjO2YfukSVBB4qUVMnEDrbIyfEtroDcPquV4RkQ3ECnbl6dOiwvT5Vmo2
 xfqLsSc3TGOAGWwpeopCGMGpzWmK0ThH2+/MoAhz77b1MwOMTj2fSDPauOcJ1i5MGJw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sRxAKDd3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=sRxAKDd3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7314840B43
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756943;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sRxAKDd3747qhuZmETSy/+CBu8NNY2YvAD9+bMEj9DvT23+lSBYTdgPokrLIBD+0R
 mCjYtIjvX22M3CBm3QF/2IdGF3aidT/SbJaACBeYnN+PKYEYiJeuGliVXKsoHyzQ5+
 +YtQrXYzCIaOarLutp7mxl3LuLVk3AWW3zZhITWFMqJYKmJjXblQbKtTYOog7NRQ2g
 k/ZK6UiyOfJwm3dnC+wwTiCEKQNLXiJAYrwSU1oWEdKNrE5kncqfsWbvPmkhLWCbfa
 qCP8ElLAdiZfFHQZ1DDBpNlp0Ct5AjVPxzsq7QxiCwdO6lpRw72k4ukcpRvnJfyjhj
 sFPz5X2MiV9PA==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:QGqpyIO7zJ60qL9AvB4+8yxbKiGyT6G0AXDT+bYb4tkU0o4uU/wDphZAbnH1SleDegyCUssYShXWxP8PXvoM3eCVjupbFyERSN1IoMr/tSb/DNmKjjMFiIOMzVpRYC7VhFF+BrvLDFdbIX0UGGfTNtV1SXlOCWEpIXzhGZ0JDOEsf9E4hLvM7dDWFh2pVwSqfeT2/twes7omeDnm/Nf76yYolY9Tkf1BH5i438EgIg4to6kw29jzTaNTYPhKrtnqiamgrcvFq/paEhExbIV7WERFncXJP+PkHEmKdEbu6CGVxiep5dgpj3U0sa+OrsUSkWCFHaETQHY6nVDKNmaNNBBBPhCk6vjRIZg3wHG43tUR0l5kLg8EDElY5+acJzDzIKGPVZvwVzvlL+em2UQdMz1gr3FaSuZnQXLY4Jn89yTXwwWG49sl+XxDINPRez7KD8e5/PEukFwJ7KySfwVeEBSae5avVbjZ3IhfXcBLviXk5haOWhopBhz09pqlQubjS3wQcCWroRw2kBxuEX+w0w3EhOMQPiyZwUsIO0d68uy6oyGnF5h87z57OWEiOZlDbAjFfPNNHydTsKvVVXPsCNu5OuNsmgAZKFcZgonhM9v29o
 wCy7pt2oWJ5pTrOZuL/NfX0LIYNjzytf5S+8F5GsB6PtIRaHpnRA4O/ne0vc5YeQ+9JR9c2qRH
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 481F2A4C4742;
 Fri, 18 Sep 2026 20:42:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWx-000000007cB-1vOE;
 Fri, 18 Sep 2026 18:41:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:10 +0200
Message-ID: <20260918184140.3631274-49-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 48/77] package/luvi: fix build without c++
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
