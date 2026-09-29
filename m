Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0444ACA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C005C6082A;
	Tue, 29 Sep 2026 18:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAbCx_cvaDXh; Tue, 29 Sep 2026 18:43:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D21676082B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707432;
	b=s3Tm72RhNramPkLzHNwvg9hHCt8h32P0b4IXFI7oaUbkb36ddjg4jyTa+bm9v+8fBaK5
	 bWERdbQ02+aEgH+yCHjYsOHmAgTTbIfHXR4fLU7EprAinPw+koActDAXDqmUoa0ZSNOoI
	 88GSDsHuP1Jg4O/VslWTep7yr0ujnh1Ojk5Ip32FeB7U1hAmv98iJpyb20FUbQJKl7L4S
	 pUZELy7ISrkIT4JvquYgA9Twq5TP8IRJjTX3quGryUfBKsPH63wjpGNJCjO642BwnaPOO
	 ryuv3evr2BhS/3Fjnu1jv6KBDmbbWJofLmFJuKGDY5HR3wNA9B7c8NCLxqYjz39vslA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707432;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=J4PZS6TLp6lhG2g+4+V8ZcyKgL1xpmHdUPM5+NzH4iM=;
	b=ncXRwZXNic+H/VDlcU9M1n5GAbpzBWuFiss0C7sEcb2GjzcfiMNE8CSiVmQ2E/OZkgb8
	 ui4d2dgEJ9r/XZU1B5A9Ot94MKr7ZGU1giREvCKR21AAyQ52ZOl/6iYtC8piPKBxeV0KG
	 o50Adwizw+N8JNAmQNJpmt2PAI0OYrGnjNLI/EOJ/nh/BxRtyrRXJAEuag+4jUIzr4/qP
	 jz4891B5Lq/5rkfMZhfV4rGEJ5yHO3GjS1K+8I9QII9NAKIEcgZyGpHPoG2qUcQqaLQxN
	 QHycZ0Vpy/K7wTtovJOuq06rGavRcX4YId5rQy5SFNXazwyodIMq0hocsY7adSwAjFA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=m76eBfFT;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707432;
	bh=J4PZS6TLp6lhG2g+4+V8ZcyKgL1xpmHdUPM5+NzH4iM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jos/vWpR5JCYmxqDpi0oHFxnVrhsJbrFahezQLFNWWaahhAO3pfpnUFvj99vlpW6I
	 ZUcc43X8DeWlVp4QFYxxWplRzFJtp6NNXu04DvUw/d0AIy47vW8OiiV/aEQIAYO433
	 F5RKcwT7CMwLSbN9Si2Et7AaRALpzaVrpgSEchK3Y73q50htmwbRsVz7NfUsGz2TjG
	 mKJpWQYKwg99lPj6hoJwaKqAje+13avnZbqR1dRtEQoVWhH93ovup2YNNLstIxPXVw
	 EWDGfWBjV6DbMqSQAhlZqzaXdkt0H63nHZb3u3xFXOir3nhSU+RDLMAOyGXb+QFj6f
	 Lx/o32Ncsd0+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D21676082B;
	Tue, 29 Sep 2026 18:43:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3ED93D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9F596082A
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAm-D-xs1sPz for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:43:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E1E596082B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707431;
 b=O+RbXUNoi3iKAABTML4nNmv6InZ/QimTQiEdcutWdhLZilp9TQCtPsKggsSL+L0CIOFW
 6iXRzfSC/wMFW94Mb3NJDTIi7DtBC5YjoPSozPNhep54IgjwH+OVIAtiQxhRItm4IJjox
 wBtVNf7e/tSnyiOjyPl+tR9Yuc1VEbVI1XCeCBtktH18pm8zPIzaThbs7FGN4oWRkobhw
 7/cjjn3ROJfzmBJEHYn8XgbYM0j49bb70MEK9pcYIsqznZ3cKZk0r6qGqxDg6SQqxQxdj
 wXoTG9UiZQqKAUMLGOcgc2qWJy0YvgNCKJcxh7bbnvbDQ4yIgK/IrvXan+pRFYdk2dw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707431;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=PIc2jCoFUatDhtRSMK7+NGiW4MV1QtFbieY3nN6Xdo0=;
 b=W6DbPrNd/LsFRwzMQi8uEGA45sTe+UGyADLKfFnDrsUw6oN1iqd/0f040bocTV5syAbo
 DAzuQbCHpZG/e3GA5vVKfOnQM+wqm87OlC9TYULClN/FsB9Q+1awONwqDHi6DKXp/0252
 F2WW/Zn6fn9XfRIa5H7raSpXHTi6dt5/wd4VIjFin56+OOJkrR7LqXBTSLYy16G8wQSoy
 6Bii3XYCYPx9mtAXTuM0oNz8x7AuynuNwDWmrV3aiLcBXntin+2k8KftIVCrNyqaPC3+p
 UW2sVhu5PcC23dO3WAx9uLqtsmb3wm9z5Doncz1M6xZc2UsV1EtQPwSZELsjVQ2bmZw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=m76eBfFT; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=m76eBfFT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1E596082B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707028;
 bh=PIc2jCoFUatDhtRSMK7+NGiW4MV1QtFbieY3nN6Xdo0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=m76eBfFTddWdizH+ecOQjsk7Ocb7eRo2mh4n4lObR4c2zThFHJ9Oy8Qm5lC0YpC79
 gkHD3v4UHfDD7p32Sl3t+dNm2M8oUFXkddlxNId7RZwMj7RA3OPNKEn+UuWDFcY4UY
 KVHA9CArLPYb/8fAN0AH35CBPkRE0TJp/Dl+sa4hEh+sR+dKIZnAM8zcsZjb638D1r
 xnA5PhHXDOyjPDEYrXzyytWKJlYglt6oCke7n3gpFwcMcqi+Pub49q+YpOb3Rro9qk
 XFQPCLqcp60ZAF6l6M+U+KLBlIg84RrUzGbTM2PfVbPeU+rd09SQeZDplmYOSbDdjP
 GsVAa7KwWWNDw==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 pxax+Gb3TrWk4QLHOWWLrtL6R/TuKXdYX2qKTmKClJi4RzMDuli0H/7BmiGeShGkdwnx8cW+Nte
 nNK++NBLoDBbWcOG2dZG6SbTOJHkHnSabwCNR/jZBIaJbuaxtjC1MJSp0cm/UIETan8hLJrrLAW
 XY2g2NcOi78jWL1e+xyZ0TJopYs0VCoiIratyJBjQ62EjRvhyXfMjEP7oXiu5IGZnuQJvCzlCxq
 /QnmIg+jdVxs4TAePQ0xlHYMmSsk7MSGGZowi/OR0n17ssjuG4Rl2+chbY/EBa1/TJNC8ivefL4
 srLgsLCeYW7aZMqCeWoiDPwQKhKDdMjNdWGdO/9sXuVv2hUaq7P6xg9PYbi8hH3nAqPD+xNYMtf
 SzrCztqYO6ToV+HC0lmNIzXmTG7Ic3I/aQy80/7Ew66utCyBAflag7/peQMpa1BRy5acjU+VUxM
 5/3V4VahFZk2QX3hCh/HvgJFb7audNR6FqzoYCm5A9qLGtsmhtfs70ypTmty8+myMrFMGtRaL50
 hk3I+NcSFgmcznEi0rfTH3FAGDZaaesXwpT6TPF/Mcbej18TJ4R3eLDnoEabFtdrmIqi7Fxzi8W
 MqxGY2ANniGyMldqvlwkM6bbDqqd9CvWln9SZEkAXb1WFtOqqAdkAfjPEodxlg==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2DFDBA4C51DA;
 Tue, 29 Sep 2026 20:37:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgh-000000006Jn-3Ais;
 Tue, 29 Sep 2026 18:36:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Sep 2026 20:35:27 +0200
Message-ID: <20260929183607.1849293-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 28/66] package/snort3: fix build error with
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
