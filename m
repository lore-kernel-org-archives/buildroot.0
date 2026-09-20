Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E02C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1731840DF2;
	Sun, 20 Sep 2026 17:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RgVldk58IS98; Sun, 20 Sep 2026 17:15:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 16B3340EEB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924517;
	b=TgsTnI+Iq8bJiK5R8XXVVicjrfQdzQe/sYs4Z9Y5AUPfRjF9YwwxFy7o7f/A9ViVlqZw
	 /GJN7M7w9/eSbxFYH3ID6tuxF3ph9Kk8zjvy4sGzqPTJg3LvTJQf1xkrcdDlAk8ydRxGn
	 ASVIp7MODct2vzoB6pCfN2jm05uhuLPIIO5cGhX8U2mulAn3pkePbwhX2rRF7EWKN92fI
	 UOKAr36NDXnKkIROWlOv6SZF8YzidYWlx1N6QI6FxasFvlDkWb4IzqTvoXWe/cBH0HNIf
	 0h27xVvzZGAkTfOhmwFb4UqYbDS7ZpjlSFuDgcy+qHrg/tmhUo4K1cm4vLHesOJTeHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924517;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0AyG4/N5+aD2DqL+PGexnfsXdvIUqNgLFAlu+/lTdyY=;
	b=gLFlnXp719kFZd/lHgwzNVQCp8joHwMa0P/jgTFa1fef6IPU/xV3e3eBTsojsd+Jn/E7
	 4ZmYXRSK0g4j19uCGcPYnKb1GdCPmi3gMEpK1SgdVXdzCYOyE3y3mn8PXG8gppbKDbpeP
	 ymyyikQFnfMTFHs/PPSen9qBaqSmvYYkJxFZ7OLjQpkbN9LuweBsolsgWsmC6HoqRrpEL
	 wpkM7jNlYqoeYRWVf5QPIy1FSvG8Chyj1HnbpB03pcUVTtPyEtfyy+6wAEGh4og5B72Tr
	 kICboa3x8+qxYmk1h5DHJsVLXGpHZufQ2I++qcWC+azHuNrJOPG7GTRrLneA97wNl2g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924517;
	bh=0AyG4/N5+aD2DqL+PGexnfsXdvIUqNgLFAlu+/lTdyY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GOIx/ThbooVEu54zQ2gbLPeE5BEorlMiewpX4pNCF4mw4fyLSukJWU2B87HA5EGt0
	 aqMYgiQ2deZ8ci1YDfFK1xyAJe0E/xRjqSD4zcjAhwbbu2karvn9AAlIE4Wo6NcVcn
	 HClz1wgDrqKo5Oe6aAuIpNXtIQIPwy8hFs+upkDnHS3RknfBmPxnpat62HZfG47/PZ
	 H+3Wz8Kn4dA+nvH8ts5qdEYOgFoY3+9GSsjuJ+zeiMcmZEysbm2F+0soGRT1W3YAMs
	 CZ9uIMwnL/sqgIArbNmWOVsA6wy9Ept+ENmZz5SdfomZcdPuOl8vq+bH6UHFRnXrJi
	 yhIS1gfva/BTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16B3340EEB;
	Sun, 20 Sep 2026 17:15:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 353ED3FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B78D80DB4
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXs4WROxrqUf for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:15:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D66EF80D29
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924514;
 b=T7k/eTNcmLZwDAw0syZFiV9lr47e64ugygX/iaJz9MN6qvKBqsB1f1BV0pBEkumfmgbF
 1HqGusbssC64AYtR0tOpxEBgHo4ziFoB1in2hhspPE9YHO23kFpTgnceAkp0gJEgX+RmY
 4MdkxhrP8CKSozUmnt8cow5xjRoEBOqrdXDTPqREOrEbTmye7kIvEJBvIKKBJsQ+uUX7N
 ljdwsPHcool8vzjU9rQ2LpN+Mrl0cxNMe6NEXRlPm1LsZis2dQIlRR3oJm3jN7r7nPuDl
 dz09kLze6oyxkVJ/Cf2cEIuYHb7YS7gCZhicIuDHUhEU0rXX5LGdWxUlhDntZsHPzAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924514;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1FXrMr2LeW7hvLOkx4nxseyghvKJGdNNpb0LqBqxS48=;
 b=DIwRMIBKi4+jnEU8JuuCV8RlE5u9GjsGr4K4ohUgBlO3sAb/zkyP8f06VHh5cTTjr+ZK
 bFi0T5zPJgokeQvBpqiUKDapBLx9t2xM22JfbWC99NDv4q/FMaLG0WjMEceI+gcr5QA1W
 10BMgtIqsQqtY39AKpZAUZG8kbW+/63dmJrEZRxf+Bk2WhlW7NNvzhsny8N6zUd/piuOZ
 Filhui9/mdvU9J6tmOL11BKE5d00cS6YWYzXsY8BGLU5D+fl01cbB9JXkBYmee+dr+AA7
 a+ry/nOVa8+EHICFFawVyjJnuH5HPBSEZxZXa/Bf2eo6XI+O/0+yCH0OchDsFKgzHng==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=oplaSzOq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=oplaSzOq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D66EF80D29
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924152;
 bh=1FXrMr2LeW7hvLOkx4nxseyghvKJGdNNpb0LqBqxS48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=oplaSzOqY1txOych4P7lxWpntmB5MHcQug1cKoPxePobX4n5MVrB27qnZkllLkCHi
 2imOVIVgXLHNOKTfqFIERc420iEAEWdW7yhqfgb9zWcNhoWeY3F0fGVrkpRi2aoaSB
 dRMgqAOzzRNVj+yftX3feyaEHBjfYgA42YkykQj0M+Y0kusPJ6BLLhvb7pz3wukxJU
 EuStCxjqPzlXc/udbUVxI62RXIoGFaemHsWi77GIgoi3fpshsw5+tJaWS+hxh5k97T
 Oi/ZaEaGeWbDmlaPY0Uwv/dtWmL7pLmqNY+tioIrkgnteO4tDM7WBQtF0UXI1vRscz
 6ApToetZPxiqg==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:GdWn43qYrRBOq1WM6QeGmk4Ew7ZhiDkSv6cUdGd6RQbUxuQKq3wdZfSNBu7mLg1fXmRFJYz0dFZ965dO2/xz2AtHtk1LOhMnY4m/YYDGVA2XfCdiZIKPlS/jCZDtXIOMSbHa5ENH01mSpgNiZEyaGuBLMlhMNw0mxpOYqVpgwMHoXGpPsYkhvnfQChdnV1Mdad9PBUG+DpJapmv4fYdgYHbK/th0/eMI5WWEIM7W47Sa7Qeje0R3I4q8Eps3/57bFDaUqjPp493BeTj2Q+Xmw5KtF/kG0enokd8T08RGH6Sg7x9sEO/zuaqk39zw/usVP+g6BOFEjPGMT63BtfRHBOKNL+LEDm0O6QSh/19uweMFxjkZxMCn8ZuLHRtx8iRrfgrusSVKQyZTjbNeStQzHGwL/RB095PuClFZ1X0/jWdKoATrzt+Bn9igAB832fh3/8lfXm9CnDwC1pXBA4kvJqGRXAS/9KIIUKi9ELb2IHKltFV75c+/bV2yKBf5N+WalTaameenRuguERFAfaSbv+7EIm8nMOMUHaWWbQilzER6EVx9x1nB0itrPhdQUCAmmtutXIJhHJAJmNrVcwgC3GNWnSZm+qMS2t317ISYHF4Yr2
 N9t5aVHj4MtxTEJvjjrBEZlnEiFo5RjKThqrvEsXWvfIAhdbeq9A+Aw7NhdI4zfYiNR8p+8Fc=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 92931A4C4882;
 Sun, 20 Sep 2026 19:09:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1Z-000000000o7-1YGi;
 Sun, 20 Sep 2026 17:08:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:26 +0200
Message-ID: <20260920170815.240247-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 19/67] package/snort3: fix build error with
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
