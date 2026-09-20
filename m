Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCBAC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BD1F40D90;
	Sun, 20 Sep 2026 17:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxaBx9CQvayf; Sun, 20 Sep 2026 17:18:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7EB9940F37
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924728;
	b=cIvLkOTPfBiXHnyLYl+Kwn3Qxhy5gIJqlqAj9a6HOXts/0WLpKz6ELtaZiSXH2IOnBZT
	 zvtqKdfWQ9tF0R+/K/C5kiaa6mR6wrwed5KY8BV4QYyhGjxsfCiwaOjLNSeml/WPumbcl
	 6d9mRmnbAhRZGi7h/6a+Uc+echuV+YL8+hIjuHKg3UU82LfQcu/w0fNvFcHY2G1d1yO0/
	 TLps7T2Uz1F1ThpYctkfVza1kLLRIC0VjZ4m7XfgBLFuUmscWkWkok8Ugdl+UeHI0HP4Z
	 FaNh+RMCG72B4qHHBEanju1VB8ECXcDb3GY35XWGDStkNYHwkEAHP5mFsadSXtyGsww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924728;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	b=IoP9bHdbZnVGT+ztKHYgWn/7ZTaX8eYCeuoL/GJ8GeH1R7IbzWp7Rll57nSINm/9VP+l
	 CwxlOHUa/+mUCAEpfVxM5uhX1p1vzQG3VI+axax0OoDFWMrCQ7fVoaL8iPzLy0lXunb8i
	 jXPZ+oiNoKcba/PKHdxfM5pNCsR7lgYzikbS4xtmfGNyv5m0DSzv/82s/0RBHGJ1Nli1x
	 3AnyCWyF7WuzG/tUJ9Brzh7jlZlhvVcvNn0ofZbjzGAvt8CJvRKmEuLf2n3VHdWpEGFPd
	 WrMJkqsqxRx26/lE5Kn15idnmUD7K7hfTf8MJNhGOuWogQ/DLiGa1t4guL7rL62mKfQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924728;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OOj4Iq6PA1jbwWkHGYJuPxBfnc4hhCKx3iU7nR0zwUrDlXITWMzPLFaFzj2XKVbqc
	 e7jx2wHJksnEWHUZUJ0rx2XyG/Sf6LOcgFuLiIo2KbNcxQO3ajzWgSjkxpyOt/HsAp
	 LTsWHIATq6S1H8dXYqRigEgqW50J2UDTTZOasPvdQcj04jfTTJzd/ucofcIxBs8r0v
	 lHMSVz8OrjYzXPgCiUJwIcGUQYYwpDyQmjUGxAsE2llkYXGyr0Hg3bcasxG819Pw4I
	 R/+GyeIZCM5vKkWHCo3XL5z71MHxva3VGt/PSXU8PsN8f93A7+Pgcg4/AYZXlIhj++
	 v6Y53zTQdyxag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EB9940F37;
	Sun, 20 Sep 2026 17:18:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B69053FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C7E140099
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3xSoVcIJHlE for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:18:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 68A2A4007E
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924725;
 b=Iw5icj+uH3iMq721ootRK9O3M7iyFV1IfU+Lq5MGLcIXCJJUdDvFwn23l5ylveVYz/mx
 aKbkYj6cXw/9QTctNaTVb/i3ty5DVI7RV+V9yifaIv3Kc/afh7MfY5juMWyHUhZjaBM9C
 YwwtBK2XUJVmQae2Bmnqzx96d+7DL2VbGBXD5taas17HNkhkuUVrIa3QbpTuDKkaiKH8q
 cPcSBYppYb+FM+3Awl8VOae0ljZ9lYJB/lNV8NBD8Fe/ZHD2tkZepfFcz4pDaUNTt97ba
 ECV7JlkAmAm9VrtZ2OAVgiWEUIpm0VF/QfEgbXrW7CzOFjja9L6x3S1CxCtABe5Zn/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924725;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 b=ZUoi2wiilVFWGgdKzBBSWx1ZR8ZxgO5chpTCMpRTL/ANz6C6ZDr+XAScYzUZ3aSlwM0W
 RwjsA8tCI2gFIicMZJQCMJrjmylr2tqEj+ku952MuqKowBZ+jvFeHii+EMTqH75s0zZE4
 YQPgLr7tzFVKvVacN4FAhEGlWy+atdwTzR9/jIxpZTOavjpGoLpXtXMcQ+FyHdfTHx8yk
 0pSH7sNOM/nwnLILI2k7s1ofDPMYWAayvTiw5IAu3WTFjnlP0Ne4Ag1E7PpbUF9eeIQVy
 3ysHYTvGqu/b1AYMo7f+/e5MUqPk5RUFUcNWt8s9EagTmyW8voRvmkFU4k9o+lKIqEg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mSQVNtAQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=mSQVNtAQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68A2A4007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924160;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mSQVNtAQ0A2xGH0YCbWi9out4FcwVcmzdHZM2Jy/NON4qJh2zwLMNEFnXEp6eKt3V
 /sEYKS643dAXRSELaHsFswzE19NXWO1bSr6cWYg+tGPE9crS1BsUyz4jdsnfEvcSz5
 q9bbRHE6wDgdyd+oCtPrcBZ0X7thTukjGFNnu7xNN+BjzFKN6/AkR4eeyTYkCORA2n
 U8en6BEq5YEJp/10jsN9rsx/KammKpzwzHtWRSLM0mfbEVf9OhxFlNA1yRKU6ZPn7w
 LEwLco4cU4rZXtUFoX0RkYBgJM11jA24kK1mbmO7piXKXPyOklaObrPCeUMrRgZEsx
 cgh6V0tphQVqg==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:iuPi6aApg5W7WacU8z+d/6ed0Sv13wqz8v6ERWuMbQswDUBDNDBLf9JDPd8EYQcVFCBohx0Yip9QQRV3ZQUqNaNTjZoX2khiHm7kXCvwJMLW8beK+5Pa7CDmZWsxMDINAFGANuFBIQ0EEdZdXL8W76wSYOhNx7Q2E3tKT89r5bkDfhN9baYsmy4on9y5429IwLS6K1joHF8Qq7CItyq0Ut1IZ4iitLE5Cl46hGdQJb6iuGwcFB4GyGujJKuB2oG//TOYPu0+Sq8M43+K5aAuU7XvvdNpjDulMZlT8RY1Uv9cmQBze/2rRxd/3Gmw81XJ6gJARLEtVogq5TNlTUt17Y52Ysrv1NIXM80GStGor+Ep1+lbllSRYxgdaC26z5ZrzN2mVgrdLTM9Vbj+E+atU3JWxdAX/5so1Zt/mYzWwJKa9YbedEA7Tc66rBHx1GKlY98ywJHPuDsmGHc3l8Yk517a4lE3hF8IWttQOLbY62ReasPM5ccXW/EabaKQ8baGXpwVFxvwWNVhhkCSRPhXLX80p97ecF3mHPwETXl7YtjC1qT6qo4J5B5sBwZT5kYTbgw1TQuL0mPC5FxdJ9meSfetOyl8+OfpYdb1bAUSUjIT7+
 XgF5dan3KhS1gHNy6Ejp7wdsKET6j9uqWKCOBa75EcPimjX2cYM9L+MkZvxXM2Mv0zDojZIGQ=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EBA66A4C4896;
 Sun, 20 Sep 2026 19:09:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1b-000000000o7-3L59;
 Sun, 20 Sep 2026 17:08:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:45 +0200
Message-ID: <20260920170815.240247-39-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 38/67] package/luvi: fix build without c++
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
