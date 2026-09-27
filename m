Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D27FC98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49AC840B48;
	Sun, 27 Sep 2026 10:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKjkMxzWTTL4; Sun, 27 Sep 2026 10:55:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3BBAF40B4B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506544;
	b=jj0HIgY6joV/FcNGi9as15aD6yCRz9peYQ08tqc5P4BQM+EyW1qT+XEApmB/R/FQ/FpU
	 gqMR49hvxBa3iqMuHuiI3mzShz2PboXFvKWJnClYl13xcJj7z+xI9l5ZD3Rc5rvoHTzg+
	 dPI+/p7a2+0MMfpif3qfaGTpzaHlBaMn/ZlmBDk0n03KQwLdAQs+Vx1XN/juFkKUVVjGF
	 oRwLpW+3xviojuj80KS6Kn1XQebGUmObcm7677mdyfQACsVs2FInuoT5q4LtbNcdTZ7cN
	 LMuXGlbF/f0p5tFAhAVfQbqZOgo+gE5Y2weWuF2F1xAsZnfgjGF5ynHTp/q0W10HFSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506544;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0AyG4/N5+aD2DqL+PGexnfsXdvIUqNgLFAlu+/lTdyY=;
	b=iHeTP9rcsnq5WF7Va/iIyDFM4qfa2Yqujkm7afO3VTUYZZwDAKQzLHsjXkSzrY6vMMV4
	 gFSd7pPXshW2AvRu0T0w05Kj5eE4f0HlvqwoxOHgSTZzUoZyLOedoqzCA/HhpoLZGT9XL
	 adRBc1vuX4pKwOIf2/kbfT2xPDpEkd1NcAixbbEetC9Bml2SKeiWBTECoXLNmhRwvugTs
	 A5EBmm7VPDMnU9zBwXwGp/I8IefRfCU0dlBB5kAO0SCUzlXKz5bBP6t5UDfoR32sDiz9m
	 ZC0zVD/ckV25ETujlQ7WNK39vz/Hlm7jqB/DdeqDSNFSch8XDpiMNv5/aqKtO/WMaGg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=T54cB25p;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506544;
	bh=0AyG4/N5+aD2DqL+PGexnfsXdvIUqNgLFAlu+/lTdyY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jIJnIfBR/Ijxd7glP+nQdXToaS3S+QutC15BnPh6m2mu9HFoqrgZUkmrQCwkBxd5v
	 nOy7+tKE/WRpGIQ5ddLuHxNE8YccdsNSLL3Vh/dNvt2qbcTMESFtM/6v+kY+Hxbu82
	 q/oIJBKZXihx4H1Sj+x4zLgurZ3BtC9ZSJ6mu7ALvoYZ5KkcF+zL3RJ1GomjVy8+fe
	 DYdf05+BkT91zZZFsD04E2491AsvhyChkRasrkjTJrf0anN5/+xffmhYf2+IZKIt0S
	 qy8GzGiORM+KKqvl9GNlyJQYeoeNSqunVucHKz0oFFdMqFyxnkgrMu1CdDfdP5W4bf
	 v/oCy46eNK8Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BBAF40B4B;
	Sun, 27 Sep 2026 10:55:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74DFA335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A63740B0C
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhUmVJdEDQ34 for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:55:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4CAC840B37
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506541;
 b=eKvhcp9+u/pjZ63URmfUAYT8GPGI2N3Wfuo3RPTNoIsyMJorTTnraD4yJCpk2Kqwl0/S
 Q+F2Q/oAMpvq3I2bAdyZj5jAMj/u8jTBiE6jQXcvF5pxbrqNYTd48YJPCUbERZjEvq+Ql
 XfWMfw7ezuQlOGpoQtVI8Hi9uTsAiiqtPPF1W+3cWrY83mnJP507tD9H+9pYDNrZpqk5p
 176Qaghk+enllhvl/CIT3W3PfY2tcbXCygkmXyrsYoF2lzfG5QYCeFLdaJ9cV7WYnEOnP
 C2eNf5L1/19NpRSINXO9sQ+jdPJzHusLieqOCUolyub/n52fMEfz1rPyhSVptI7yoyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506541;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1FXrMr2LeW7hvLOkx4nxseyghvKJGdNNpb0LqBqxS48=;
 b=q/8XSkoDbisKlmksfPvK+kQuQYb1EcPtDcQE78Z3ZOVlBPch0LaQ8g0wYviQZQdOQJR2
 fpNvca/cSSSZBNMiXxp3y6SWX1GFU8UQKE4nAZ61gpAMdX8xejWnh3NMAccwyNlaHZM1F
 mQGapBWxyasdjPLauCaDAgNJLNmf+EAqvz+I4YzuRZ0SlowTzkKUB/PALhJQcwYsC6fr2
 fks2leGKqsn2hIP8CKa2i2ccc9GkLRXADzFZhNqsqGT2hOMhqG+HqxM1ryp05mLCpFjr9
 CGp6BBWJ/xLklaceT+8wfRl5d9mhCwtv3mYw/l+z4Fg0A7oXaSCdSFC3+TYD11HWn3w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=T54cB25p; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=T54cB25p
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CAC840B37
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505859;
 bh=1FXrMr2LeW7hvLOkx4nxseyghvKJGdNNpb0LqBqxS48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=T54cB25pJ/aPSvmuam8J3F9wjFvTz3UGow4ot+We3OM/e9zvDkJ9xmGbXBV2FpnNp
 DThGdTLritm2gJQ2c2bGhBIQIMJUQvD8bcdeJ0rZY5vQem8mzZn1tYMdbPgZ+7Ck0T
 bMP24nMljXMdpFENTLSR0VP8Ni6ok3CNEmg3oFrRAK4AMLuBMgl5vV1QZzmj21Wfrw
 6tQi4fjyb/iNaguWB+7xa6VUeymOcKc7E+DYK5Q4aK5sr0GfhIp1oovP/ksWOs3mqr
 5FXKnaNNnVdXCm+q9ANILLzdL/bzQmcmHqRV6CPVe2wDrz4yFW8LIGqZ/V3lSmBPSx
 OdZ9GgqQXeL7A==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 N7sysPvv3EW5BcSFnx04LphPr6yhZOsg+QHCFI3PPfoY+eMH/eWKDRl10GAa+b4GIrq+DKFks5+
 lL77NgGV7bym3NX/rX0e3R9NujvXuYHKvhv/OGr4lDH2x5nyTwKapjuEn8HFFZX4mkRIMS+EG2f
 GDp3WjcHRH7F+4RBIFEYHBjiQmr6X/tz6gqc2/2SHkxql3hVbnK7OXbxtz3TZi32/ZuE6GterxU
 pwWbv3BTdUg2toOTyiYyjFvj0Izma+KhnnhlnSVrsJ9sidJl+aw/LTf+TB48/57UvaUbWIxBu1J
 l52enRzeQJpAcA5dpkzwOQGdzCNS+xniM9c7K92yd374XdxAEtEgV1fVi5cPfAttTJtmAI/+stp
 KWwFwTyxMU0wIu0ucikOVqq0/sqbwo2Pgw8MfpdV/ujy9zn7MzYE0oqK8MJw2gcJ4CAgl2T7IWT
 0P+OEbL8+70nHYRjR4nstYIyMcnBdN5hBtT5h1TzK5xavKX013Q0IePKtOXRAiMsi0oIgP7LisO
 WKfqbtUHcNXliAO7ISC01pQzsms9bUA4XKIq4dYk2YvzAYks80hpympNDBo/8NBhNo9z06ZvjNq
 uKraFM9Jh/uVM3/P3lxTDj6qUAE+99zQMyiXF4mon3ytTKCDzZjnAYFB+LEtPqPV2CiiXMe85SU
 XNFzD7EyHsDbE0Ze723XI
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 94E6AA4C5061;
 Sun, 27 Sep 2026 12:44:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLc-0000000007a-09TI;
 Sun, 27 Sep 2026 10:43:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:11 +0200
Message-ID: <20260927104301.1801638-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 33/82] package/snort3: fix build error with
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
