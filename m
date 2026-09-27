Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AD1C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D9E240DD8;
	Sun, 27 Sep 2026 10:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21PG44znl2Tu; Sun, 27 Sep 2026 10:59:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6800B40DA7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506768;
	b=b7qpv5ZbFIM5AykZI7GrV73/cR4+4+SRuHXicJ0yIN4+T2uYTVqYw/jH2QIf3grxsKQD
	 P8ay+be2GAjBR8TYmlYlmrZZ3era3mtAUknRCtPF3FGBs2iKqnDiFSfHbmh32+XcTAh1V
	 tBKqGOqKwF3lg/6eazMcym5DDguYSkL90MyrDKpcIgd+zj1ChbEtO9R6UyGdkR7OqxxnW
	 209vW2avC9rtTM432U3jniX2KCYyXzngk4OtfhiPclL0jUwwJqqf7SyqHfexuSaBE4V36
	 VfnZM6qbSVFG1m2HZfcpQLHQpiXWI/aPEYujnWpJO3uqt40tyQOFNAeH2SUYyfUSyXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506768;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	b=VYKlBKYHmuUbov+cIvVP2u04qPg9SExE4i1Q2X5D3jw2lqnqC5McVxhV139sN4ITm/Ev
	 /nEfn7Ly91lEzMbNM+Uzysn9WJ4mT7mEyHWB+k6luLTFJ648f9cIYhurwomnVWvkhxeLa
	 vjyOtFMIJKXievuXWre/uLOMLt7nIVKCJayT9M+nXy4wgA4qhbg12hB/xF6mnFcVBSUjT
	 1KOc5FL4KSVlI+d2crtsVmw2OvnCMlC3k3AFCrwc6LZqMVJ9gllDTTqHUgfwokttW+mqV
	 jG5uH8dFMWcWzQcEVzVSkmI87uFiO06q1lulDLflEEECbNqOXMCFz6hpqXq8o6KlG5A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=IylJqysL;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506768;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BdWiv3dawwh/5K3H5lVkVAJzFOH+MDRxTJwqEskgQOPGiC4Skl8U7Al3bN0oFJckP
	 9knOGZjxjh3s1nWdLvJ9vy26bJdz6UpC/JBs6qw2+K5jfeoRUQcT61BtqmJFDquDmA
	 zCXRrDudiDSFthqcsr3W6iMJi0PHGoMxIUJDV+9Jyc3+jpWLT8CEOMW6SJ0jHkVe6y
	 yc4aEQM+NSPiCBOgOky0qxZwA7c6LUFtQyWSChPJQsLgHmiNG/0DXl/mzKNHVu7UlR
	 9hJfm9J8+NO+waa/e81Fb5u+Efh9P/rlA57kXSAZ6YJvyifsJN/8D6OdFYF1F+TCg2
	 rbfEKBbwvQvqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6800B40DA7;
	Sun, 27 Sep 2026 10:59:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE17F335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93CE540DA7
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRfPLvUVaCGj for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:59:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9A47740D98
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506765;
 b=oPwFpMrPDxfqookRg6e8yneTxSOksvJ1QehgfINiJWXuCDebtTygYRimDcxGUJQxyPyp
 4Bl/1iFde+V1j9OrYMVrSuQU7c2Ji+i85+wyeYNRB8z0rhb0+gUkxNXd7Ribp+8pfAA2h
 9zYGAEmuXizc6T7N4Ymr0nCjzAVFYLw6wYBBqheUxNAIBn0alYpX4vjoNDdQP/JK/LdnV
 gESYetrOm1aaXGeFsc/Vfd95NzmTeIB25tLav9YxW99939sFbDE11Ul/Dit37NDDy/gyi
 YxKAtyyaZM0P7/qB0g/sqQkl4lkp3U+5hAjkvTmyWJXjuwkSuq9eY77m+gSQjoDU5Yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506765;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 b=lDCrmRKzPJ3KIpMd4bMwFNI4M3dLBGuOrOi3KibgWluILXJI5HLQg53Vhsss8rTNMRWl
 3QzWlqVqL223dR+w/4iyy9qUZMXXJzucYBmv/OfdvwzWddVgwQVjgzmT7F7iZj9OYZIBU
 WRn0s5ovRFD5QyZtTSUJts/LGibf35KzutQclJ4VnvHKfPDLdwsTIkDPI0zZKj1TMPheP
 cuodXLqQGAH55ocooc5Fel2ODWDhrjs5Gv9iwRS61ZhBQH+GCBL1ASKfp55l50chdHvMg
 vhnaDvoKfIV8vFi08sg5H4p4Jv32XZHrQV6IVZf7drECA53QcqepV/3YCkEWeRGq+ag==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IylJqysL; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=IylJqysL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A47740D98
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505869;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IylJqysLaiWBAvrjstdJRih73YBnO7o2MH/6LXJ1D0YyaMMlkHkvLFCy0mybvnPXY
 0NHqlhbe5dj/t+l+ybcsQLBGMelBTHMx7qkdTimX0IKc0H0CzcKiGt6uVUkpIZYceA
 7gfjNxsHBwV9TgzNf2llY77JKCYOBf1FBw+wKFM0qaNYch8TRlxfXFqo8olmOD+xYo
 FKv4GTS5gMMkqjRUaiVEk4L7wZgm+LBcp4Yr8PSRAq2vtWNW7APGVaN8fkQGvL+GPx
 cBadmslZp8i5HmaIeSHYJSF95tg3cuyLcXt1+4KSG9kxscUkt/AJ1WhZMODBYtQoaD
 gh8oar9CVniAw==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 Wb3MD0c/iFiAGd3bwQUEdYfjqo3hE5v5wZEi1x0ksnsdecQn9LEKb2VGN3lQY9r/bIovrIjhXch
 gXuyj2WI0M/Zfxb51cFHRcIo8rtFSYN1jSHLTiDHgPuDZlB5VY0gH2dr96BOfIFICKzMzpIS7hE
 p63EL8mPcExtH1BraNCW4fUf62ydsTN08b+6Sd0XBRghkMVklsMxXyrtUR51wocPr4sfiU0uXy3
 H80NzDBMIFwGewvrB3opCkB1ppjSHFgAIqPvqN0VD6SlorvUrV+WL/7dl3gGEhYYxCtW6r+U2Ln
 XPhOQDDY6btSxnDbnbUei4eRjlmXS0i3h8wtm/qAobhf0VWTN4LQAl60YU22JWf/zLtUF5rmjh4
 Sb8S1JPwTyd3YauNjwZxlv5/uca9K/0e6ct+4W9BN5VUFpCIIKeWns7lEIaZrPaerGnDpyV3Ui5
 kx07ZENLzFK8PIRfArqAqKmbhWtRAK2jxHuYBHHu7iVDN5LucA3Llik7ApjQd36ltCkc4IfXlrL
 JcSIZBAgVLZIwHJ3H+BKooaFqY/JQ1l+LZcl4sUO3lKaGxcOk9BwiG+LfWU+/MDdLHEDdL/1prR
 3Be/SbV+MpA5l5WK49wcDggedIkfFlz9yM2zSYsn6q+yodPu+3L9EbqkQaUYoIVyrc/g4g0jLZ7
 E16ANnuPZ6eGkLI8kJh/+
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BDBEDA4C509A;
 Sun, 27 Sep 2026 12:44:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLe-0000000007a-2C8b;
 Sun, 27 Sep 2026 10:43:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:30 +0200
Message-ID: <20260927104301.1801638-53-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 52/82] package/luvi: fix build without c++
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
