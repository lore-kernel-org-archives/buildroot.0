Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFCBC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B96340DB4;
	Sun, 20 Sep 2026 14:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMrOpMKLkNxV; Sun, 20 Sep 2026 14:12:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6D20840DB9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913532;
	b=gweiSrm+NJzw+WQrvevQsoycArQl5nKw515tMvtCInDc3SKzUGGS67cKd28nmiWqXeHl
	 20VTk9dfBCq/XKH9lwHBYhBgV3t3BC/hh91MPxl/y01SXez3Ch59IgzTJnj/Lh4oGBiu+
	 gfeu7ufE4WV0RCaEGa8rBoGjVX/QBvKrQtrL2G3pxic/rJ2OfJ9oyfKnHXuoyXLdKNief
	 4mk85WLtaSs30hqPJrCskJG7Kid0+9k6qjU9dLQQmvVkqOzlA0wHTjJOst2NgS5Qk6zfJ
	 9WFKwt7QDwLfjVWWG2KIvkrL/vd//wtflSd3M67xdJdcDPv13cfnRY5qeLpVSnHxlZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913532;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0AyG4/N5+aD2DqL+PGexnfsXdvIUqNgLFAlu+/lTdyY=;
	b=P5k1RASwq/2nOISR0IEeVlmBTeCErdYBn+blcZFD9M+dM2dG1Jlp/PLVmlEuCW5G/zTx
	 RRwtBkBhmBOhR444ZKeIyjR6CcRMFq9d9t39fuNDIU10FfsgTfSeToq5mQHjy9BVcGjJd
	 2iF82Ppg44y0bxikeyL558r9GZCcpJbC5+xPVScW9aqBpAgXB+UELqjCeBZ/Nt6QEshax
	 qoBykQ8XiURUyTYjS6wwyZS7w02UImMYsaRS2qyNU/z5f1pjDkt+C4pwQbbviV5gsYbJU
	 26+eZwFH08TquqoAGC0SiBXrMFEyNxJAjRrDVvUg0XuRaXGb7O46s7mNfYLIE82EmVA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913532;
	bh=0AyG4/N5+aD2DqL+PGexnfsXdvIUqNgLFAlu+/lTdyY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rccaKcIT4HjiPrrro2x17kaOpoLs7OEX5SIkxjaaAwqQUUOfXGaMa0MHMpD6szqu9
	 IAtxBGkgT9msfDLnDyXAmbuxjJ546lRizOg9dQ8dnExcLLmPhKb83exz0FVFSZWT2J
	 eys5/Y//Wew4lYiypCO8tt30BNpZE9zXnun2K6KGBb1NyQyg2BhLmb8RqTmOe/lAnE
	 du63i/5Uoo6gC83iYf+S2FApb42zsoTwbZZ0BBOqNLy/H+P6FIzCHaZHuYVeCVO1+f
	 qtjWrpsYdvwPU1DzgYCa8BSp4dZKhiNr3+aArTeQGzWeZKTOHPOcYdszTPscbnAIpb
	 ZpvAOgzrBfbXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D20840DB9;
	Sun, 20 Sep 2026 14:12:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7297F3AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6431F400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6lWnwpASWFb for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:12:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1E48140022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913529;
 b=KMY4Ac45N0Y5kKUnXG8wTGv/f8RygxtCLEYB2ShhOvNc0En3ffOCG1pEdj/ZUkgSZKge
 Q6ydTJI5mhO0YTYtJMC9TpzStV7Z7C1aOJLJX+BMODGetnSZYSAS2ehASCaQ+2thy2YLa
 GMHbiWGHsIHRtWSaYaUdH1bWl9MDDxy3ucbqD9IlVI1/UCOCpGmrRd9tf81NgOt82hghl
 gJWuM8H4HIvQkH9dJ4udXm8K6YvZHZ8+pgnwbc6WzEmkgAcO4XRkjlWdI1iKFglDOycIO
 tK3jWK1hEBSkUErlINgUuEoOcQDEid7rlXaCV3PTJbIQ3nNGstT2bM3nUcg71Y+Z8mA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913529;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1FXrMr2LeW7hvLOkx4nxseyghvKJGdNNpb0LqBqxS48=;
 b=Cb2z+1qbxpxmLVGSC+x0zHiHn0fSvx++FsxjDbUjHJpmyEeTK0oQsT32ZY/k8hniXNLC
 vfqQBEibjrAydhdlRrnutD/ss8n8P3YvY9SPmzDPAOph5lKmI0f8YuqT+UucU8NDZJbxG
 MR0Kfrx6bu5I99P1T2qTMIq76iK865hPVMVxN3/UqQXDOr/sE7JslITbYWISiZHFCq2NT
 FLTJ/1p5eSqCef9pJUT+ho3yMyL8QPJSEF/HEmypW2MEx33clX5dj4YkN3EwkXGY2X5Q4
 nYIDzvkhgtuq/ZS13dMh5NkmTdtYBvusw2uEbc0vp4oERKyFRPqVyeRx4DnP0aMMDEg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=avtXmmMc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=avtXmmMc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E48140022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913232;
 bh=1FXrMr2LeW7hvLOkx4nxseyghvKJGdNNpb0LqBqxS48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=avtXmmMcX6smU7EdQTNJdo2f2DfzA5ZDaoSZp590fxInloaiwHZFWo0+7Z85RcCfz
 d0pOiQnfhEQa8LvE5GiguByiuOEl4mdhSyKyYlwI3sVpqRXTy2WbpimzkXmFcZH/aG
 vawQkW0pmhv9DoHc1YlJludEaX6P77rixi03hQR897nOM21FxXyJzRycOKQZcP1Rtn
 5CWc3VLWjLoXcNm6Rfc3nOzgryCVz2TK2kfvy+266aanjfRWaPQfSur7ZKT4+WL9r5
 SEsZlemkYupe37jsD3UHVlTeUOZrBpWKySLkRoQbJf4W+syOTfMP9EhjUbh1hEMD2U
 P2LDxzCdKJ5Yw==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:pMvOFg0IHDTPog8ZIGi5GdluW0PfgVurzQxHgCtWeL7X0EQlFuZjhKYyHBUQPE6WbLpiUgw/geOYb9BtQZ8YjP0BgAXHuhgnKrz+HQapcBr3xypk8lsnWbDQfQbJ2colyvTee71UL1yF1iYs5KUH2aeP9w1nvfO0oic0K2RDl2/Al0QLvt+J92loAB5xbaKe0yRb6B3ND/HluZYS5GqSVOTCFLjnK/kmnJ9Oa1CeG7hsPSZkFtEvPkym86d0gVRrb1DMdqEI2B2QNG5s0Ea3OgvfsWFbKM9ffb1a8hvYva8bqtGNMxCI1f7wOLm9rpW9qH98RzSylvooRHcRuUYPwB9Me5qIauzThAxu6A6YEj8Bvrfqzf1zN+gpsgeO01scB7i5ZbJKaMYUuGz2ZQUOAX1Y8dvc66E9fEwYcqtF9u9Ex3P/A5JjcpIqLz7erGAHD8VNYnZTLX8p0X+TLdbnwfelbz4elT2rYI9JyYJkzZCMXDvQu3NZ4zqjzdFU1Cb4m/A/0RFTzeHAo8klN9bWzR9LIDLqRls+4KEBmxl3CKNf1dQpMc0xnnqb9jfaMxKYTZUnvZc+Uc5yxX1KWmSRJ5tHsOL+i+tbK7vOi4ZIAB5sna
 hg0FdqxDzD7jtS4kVejoqfduKXH1MOXOAwGF+NwI5k7FKo3yWJlyXJ3D1gQQ/mh3yZI8XXh6Zr
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 812E3A4C486B;
 Sun, 20 Sep 2026 16:07:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBH-000000002J9-1fUm;
 Sun, 20 Sep 2026 14:06:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:17 +0200
Message-ID: <20260920140605.3005461-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 19/66] package/snort3: fix build error with
 numa support
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

Buildroot commit 5e78c6cf3323b4a45f84bcbc504f511dd268e270 bumped the
package from 3.1.40.0 to 3.11.1.0. Upstream commit
https://github.com/snort3/snort3/commit/83e9a2dda250a0ced9a105454a5a4fe59c304601
added numa support, first included in release 3.1.65.0.

This causes a build error due to the numactl package being pulled-in as
optional dependency by hwloc, the latter being a hard dependency of
snort3.

Fixes:
https://autobuild.buildroot.net/results/e8a/e8a9d787973fd109c07c185103de1f9f7339d506/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Rename-numa.h-to-numa_snort.h.patch  | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch

diff --git a/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch b/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
new file mode 100644
index 0000000000..ca8f7774f1
--- /dev/null
+++ b/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
@@ -0,0 +1,79 @@
+From 3bb2a8fc1244fcbdf24235e541fa2a06a655dcea Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 8 Sep 2026 21:20:04 +0200
+Subject: [PATCH] Rename numa.h to numa_snort.h
+
+Fixes https://github.com/snort3/snort3/issues/368
+
+and a build error seen with gcc 15.1.0 by the buildroot autobuilders:
+https://autobuild.buildroot.net/results/e8a/e8a9d787973fd109c07c185103de1f9f7339d506/build-end.log
+
+/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:
+ In member function 'virtual int NumaWrapper::available()':
+/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:50:16:
+ error: 'numa_available' was not declared in this scope; did you mean 'available'?
+   50 |         return numa_available();
+
+/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:
+ In member function 'virtual int NumaWrapper::max_node()':
+/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:54:16:
+ error: 'numa_max_node' was not declared in this scope; did you mean 'max_node'?
+   54 |         return numa_max_node();
+
+Upstream: https://github.com/snort3/snort3/pull/479
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/main/CMakeLists.txt           | 2 +-
+ src/main/numa.cc                  | 2 +-
+ src/main/{numa.h => numa_snort.h} | 0
+ src/main/thread_config.h          | 2 +-
+ 4 files changed, 3 insertions(+), 3 deletions(-)
+ rename src/main/{numa.h => numa_snort.h} (100%)
+
+diff --git a/src/main/CMakeLists.txt b/src/main/CMakeLists.txt
+index 117612b94..e4e816d15 100644
+--- a/src/main/CMakeLists.txt
++++ b/src/main/CMakeLists.txt
+@@ -23,7 +23,7 @@ endif ( ENABLE_SHELL )
+ add_subdirectory(test)
+ 
+ if ( HAVE_NUMA )
+-    set ( NUMA_SOURCES numa.h numa.cc)
++    set ( NUMA_SOURCES numa_snort.h numa.cc)
+ endif( HAVE_NUMA )
+ 
+ add_library (main OBJECT
+diff --git a/src/main/numa.cc b/src/main/numa.cc
+index 259f776b7..5cb23e26b 100644
+--- a/src/main/numa.cc
++++ b/src/main/numa.cc
+@@ -17,7 +17,7 @@
+ //--------------------------------------------------------------------------
+ // numa.cc author Denys Zikratyi <dzikraty@cisco.com>
+ 
+-#include "numa.h"
++#include "numa_snort.h"
+ 
+ #ifdef HAVE_CONFIG_H
+ #include "config.h"
+diff --git a/src/main/numa.h b/src/main/numa_snort.h
+similarity index 100%
+rename from src/main/numa.h
+rename to src/main/numa_snort.h
+diff --git a/src/main/thread_config.h b/src/main/thread_config.h
+index 93bfe63d2..8134da8bf 100644
+--- a/src/main/thread_config.h
++++ b/src/main/thread_config.h
+@@ -26,7 +26,7 @@
+ #include "main/thread.h"
+ 
+ #ifdef HAVE_NUMA
+-#include "numa.h"
++#include "numa_snort.h"
+ #endif
+ 
+ struct CpuSet;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
