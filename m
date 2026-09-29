Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2DBCA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 851CE606A8;
	Tue, 29 Sep 2026 18:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XBauF_CFo6R; Tue, 29 Sep 2026 18:46:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8E9556083B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707617;
	b=JaYZKndOsko8gHFAm/Sd29fcbEE0IrTyekLm1OLaVrT4UjtO4++6evtQQqjfDXZHF1bz
	 z4qGyujhS2JsfL4K6laUPSED+IA1e7zpFScqZXxYFdDtnIf4kw/kx6T/kWn2JPCEvbd1X
	 /h548KEgEOFA4rEMqJhhtKoKWBsSp35np9+Xufjavi0caNcWuDw5I4EkitIFU71IzKKWS
	 G/6Y5m8MjQWgo+j+jOdRLY7J7Ga7q/pKuCjXjW70yWZL1O4go/GV2wNFUfz1uaK0YY2Qh
	 VF2rnIoQ30aa8zwqYSiGJBOGRGEPZsEfcjMMqYHj1eoI86cAfjW3zOtQRWwQe/ii8DA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707617;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	b=oGBDJWyhRcyi6oQhYLrGR0dkD9XJr8SBJElSKIQTlL7m1B/woW9Ud6LIgvprSGUtCtNi
	 MUpgQ0bmXhSUaBPk//UiimrqIwsglmtZ2MmnnT6DcAd+Qn16Jrf4nwPJZNO2pZBzKar83
	 tzg1wM8BhM5W5hmDua+PVCNml3gCcOrUy9R7U+DV9+UUZ0VEdIGghkvYZDEZKObwWXlKX
	 vXDQLvBymyoWwgbVYoXgMJ142kBtQ+tOD9zH7/k12qzBkjoi92j0MU6z/3pWlqrZmI+q9
	 8qrZa3sn5Exl9USXfo8IdFgRHYhXk15jV+NSr70IF+BxKYuMn5l5FC1I51G+gDSR9XQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707617;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yp6ZvbH5bq1AlBZeToAF/ktn2M2H94qvolBbyx3c1HXx7DoW/NB1ESC12V3yUta1p
	 jOO1tKd8QJA2v8T6a5TpcqlVwFrYj8WZNpRiSN5MyS737fbykO4ItnECdW8+Gy32v3
	 x2tXU1s8/8OOEuRdv67AONZ+lLhCiVrhbtsko4jvJDBxkKAfv/wJN048wRLq2gxgRK
	 eRAHaETMBFqnHH8az9c2ai9UzbYWkBvd/lZ03XfNmMh5y3wm6gxV9FpDZttxrcZId9
	 Og0N+ClTTiiIf/4G3cEIYOwyOBsUyNf7O5RUKE+aE2AnNdWru+0Fks5v6SLCODWWLm
	 FIYlLmeLvL1qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E9556083B;
	Tue, 29 Sep 2026 18:46:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3996814C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24B06406DF
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzZStve4K7w8 for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:46:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 11FC04069F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707614;
 b=tZFztMK+ufCjy86AQz8FcOc61DOt9WNkCrDc5p6t7bSF2FQl34sfH5vW+l0wSnlk3tRg
 DcxouzVj6XF6f1/SzWwRPib3hnm3+WPE1xuwx/lb9Hb40CvKMcqfq4BFj27AzhW+4UtNs
 5CV7Sf6+25cmi1Wv01mnFHMX87MvcaJO3bOcEALr4IxRVScRr3tYIZDMkTkBdkIA091LU
 w9lREtvtO3qzj8m2MPfGW9rS1Mm2VlAuEuNdoQDnHZpzGkh+F7aXz74dfrsESj4VXgUl1
 RQ46GD0bOB6S810eRm5f34W1K481udmrPPV1ztZULw/UJemws3qhWBRsfPvZKtYOMBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707614;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 b=M2DNOYs0n9vRPlo4/OF0Kxd1tOU5rtOq90zCVi2/uZ+1GkWrk/5wn9QDG3hq7HRY/5XZ
 OVKamZUSiY6y2JzH/JFL7T7K0wBjqN8+d6802vFRnfZ0khAcomBdFBUtOIYl2au0Ui+Cw
 pkadBlv8RbE7/fCmdBxsZh7izmrZg6JuY4zTpbYHPhFI4jRqfo+NCfP+TDhoaQm0EvAEH
 O10VYc/x6nuQIYjICqxBQX613l2WX3NBDq67CZMuKGpoZo8R1GxuLJaIRgV2GpuPqsvrp
 sFqE2co+7xRylBnu0+fMruL2TWlkId0XSQnNR4gZxbi99t//rOWm4a7BLRwLTY3hSZg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PqAwIghz; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PqAwIghz
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11FC04069F
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707030;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=PqAwIghzRAZ/wJkYux8einSplR4vLvGkoa1x+jOOaEaxhF83LZK8I+SuaOqkBY4sA
 jQd4uOzlQA/JOAJNfpT0B+aAjBobe6uZl1PNrOjPa6OpfaQfWT5hXMI6nrqlfYpz/0
 nEB8hqTzpIM0mP/5wPxOdDhKJbIDBteMnCsdp74jAteKpP4Dh7uObP2FWnbkB/nmQG
 8t32nn19xgg0BbLezbueBGYwkPDunOse92sLlYhYVeaS6JYxy+MULqmgjxaIDaUnq9
 pPappiC8BcgO6oDyIqoIgze8IQ87KWcMlhAvfVLwN798wfrEdzIHRg1XFj9eSlaSCo
 ncD2URPJmu9hg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 ySt5axah9E2prq8m7BcCeWvrXtoJFBGrnmDjVpoaw+vYBpb+9duZdetwIJZ2bkixKEOxqticG0V
 CJRbeSJWXIO01/q4aE5IQJ+7bDES5lOxYTb4DQXr5dEcxhSiPtXPqDNm1yir6LiYJof0ORMBpk+
 WJRJDjvPblI8wz6bgQKbuZ1UwydCdcC3BiTgoog5deVyFgVIZusCSccytjoRqNFh6/m2BbrCDcq
 yxXy4Z9r7SwUi3QEWAFLwZb2Bb1GJpSBu06ybXtpPAkxGJDljl9oxy2rXP5y3uXXIE4mnzwqLB1
 ScgFjDj6VQPzZyziIhzfQKqz9D4CVUNUtXeVvi8UemHqjkkqdJMEUo7+0+Iz2eRG6TFNJLKsea6
 0oCUr2MWR/hN/lYKMqjdjzOW08nti40UC758JUsRVmyuLtNqRuCU403H8Jz/2dP/nb+1HDyI/ci
 H/WNxozPxK/P3bLbSS+AVJxeRH1MEamPhuhC2yL5gaAwI9CzXPi8+ajXF4OxXuoFjL5oC3wTxea
 VRuWF7/k4VtvCyi8EXnnhuC42fON7s35UFVCl+UYJcmR9eCEjYG19FR2+pHYoG3TsSw5kiDXaWf
 +uuBBv0=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D1A70A4C51EA
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:37:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgj-000000006Jn-1Ndi
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:42 +0200
Message-ID: <20260929183607.1849293-44-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 43/66] package/luvi: fix build without c++
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
