Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB1ECA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE725608C6;
	Tue,  6 Oct 2026 16:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lIzxlIQmjLDj; Tue,  6 Oct 2026 16:34:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 50BA9607E5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304446;
	b=k38rSR/uU95Ij6Xqc2Si/SOT0iLW0oA8KzGpB8NkJNBx+UuZ1cgkTNKm13xHAevkOB2h
	 +ndMi+ut6tDeXvNWFs42OHKOU0UD+jrA8XDpg4C5AGLuXE9jrFx9Tu2qSCHWbaHwkcc1d
	 ILRcm1JDkHdszZuUP0+PAY1bcPeA9T6b+nMh9hClyaHvSfFSdLqTHtzf5Ms66Q9acNyMJ
	 0JZk6jRQ4qbEmepM9TDjOETTMA1VRxjrPzwP/uXv6GMwV2Wqds1E3c8TXhj2x+Dlt58Gy
	 zmo36mO6L0tn5pQbZrGT0vGxkKd2vSHSLjFSrzG2mo1bmrdsNLQlppZs6lPdmGyXu+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304446;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=J4PZS6TLp6lhG2g+4+V8ZcyKgL1xpmHdUPM5+NzH4iM=;
	b=WChxhbvkct2qDckBJkY9+hjG/B9LaRjz1TtxBHw1LRTi3Z+RcYAMAWEEFpzNjR1RfVaJ
	 lj0+lkf39Q0dwit8skOpqNEoDJjId1Ch9+azQfsyr5iPaakL6yN4MPbo5S4pNBYW5J9Vf
	 998ZPuA1g9shUbHgGTgM91BPzHy2LEuojNt86MRsu2nSqJtrwtBHp0Kz86LIm0thzeMFJ
	 GMKctQR/GV+MJ3XpMnf7F56lpoa3UETj33DuAPHxD0e0CJPHufSkm+5hiX8iOTM0kwnVS
	 +veUbYouAwOw3OroBztOm8ruP/dKRS3ifdpHQHjyKFz5QEj5pLZhI7URIlmgO1opULQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="RqnUA/ej";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304446;
	bh=J4PZS6TLp6lhG2g+4+V8ZcyKgL1xpmHdUPM5+NzH4iM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WI0LrKuB8qQ9GPUMglz6lESt9kU/bgyW4M1PA9HUrgO8MG89pkppHRzG/KBm3TOCo
	 KWXKmajG70ftUGYaXwZ912foKBIR2gamKEzczITsiZdhLKCx4cUJHMNahtthPsl4+l
	 Nx3GvfWIT+6932whpLAM2Gqma1aeKAg3pOPEQB7S0VfG2ZLDhtHn3gaKUIWPxdX4j+
	 +jlMaMvC48y6c/RmEvFnYSd9s3YQbIT5iDV+8X+VCp8rwn4WAOUArYpSz785SNwxEi
	 PWVuQK1BvXRDY3Jdh2xDxJXRBISvOogbgjkU43Dg2s4dPj/RMKg1HBAnTG9AhhfsAj
	 BLokaf4ABQjcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50BA9607E5;
	Tue,  6 Oct 2026 16:34:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B8B534E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2164B60815
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCYnTWjDzoIX for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:31:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 152DE60809
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304268;
 b=Mw0bYPuR/fI7lPwm8ElJ+eLoHMxPOgtPM841sK8iOFtlOYdNP8Nvw961GIaxe+PnizJ2
 qp3pvzRopOhFf+WumrtpVh9WO3zQp0oubf6M6I28gUHkpb5CllZMk1iF35CEpMAw6i0WM
 FEUBEDNgWE0EEzysU4YcAqZJ8/JOX+fd9uBcVo8sLoDy2PjA+tdzBuVHF9W+XC89Gn3wD
 YLNzeE04wK2WvSOEDoMYxRvkXu9hhyb9r20DbwBL9jwon9/Rzk6Jf7zdw/92Zxcb5dWp7
 zlFJZIhqQIqlC51EXfm2JlC/vvcmwtZyOjluZPBqRfPHzRMde+AlK5TMyKFUV8A5R9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304268;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=PIc2jCoFUatDhtRSMK7+NGiW4MV1QtFbieY3nN6Xdo0=;
 b=ZjnP75TCS4wOfSMru3S98qeZuJLnQnxAtDKf59Bc01G2YJI5h+yuNK1zFQZ/fCLJPhiE
 x4WZJmzXIoje2ZfEaI2lgiQI5hz+LY60jFAZKWy50hFDCp+4fhohpfHDHDDq9yrxR5sy0
 lf/mTGGOkLx3Nw82XDo+Lx4SHBhdjor2m3CHEFrzquFANDImLfxjD+RqQrHFKxH8Jmexs
 9y29bNqAD0N3D3dK4U407QlkfrwuGYG8WWx8p3DEAs6T17YZDe1GK5aUVfZ16r0OdyLa7
 Q6nrUIhnVTTF4wjRubZHL/gjMOxbcSPwL1aeDxxyFTQBmDUPvFnxiVcK1bG2OoE+ENQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="RqnUA/ej"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=RqnUA/ej
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 152DE60809
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303708;
 bh=PIc2jCoFUatDhtRSMK7+NGiW4MV1QtFbieY3nN6Xdo0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RqnUA/ejsc+nMHsHAe9mbWgeki/lJ1EUYxtnm3kqunHL5UYPdEGNwwfuzTghogSvv
 yU/pi0tNL2ZqQgfjiVe1vO+SUt/TZJTDHY/If/Thw2TE3kXKUAzh+PChT/GT6L1Lrz
 1QN6z5uS38lA9jBCj2I4C4A+I1RyTTEClVYMlBgbKfA/4aKBGI5F6kBOPsLprcR+Fx
 wMLjLZtWkOAE5N2bce+63XVq4jAwvJMmgSwyNWTi2JGfju7ADHbySb1ARs5kYHkTFO
 +BHVJ49RYbY5vji8ylJnZhQfnqY5Wvq/Lh0//p5aeFa/CKBPznHMMfN+9s3VkLq+UV
 VTozEvdsJe37w==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 Gcb/HAcPCqLzol+tDb/FLPgKJpN0jrMsn0Bb7+kkk5Uognwp++kdspXBY6+aBIEBVLyrb6ET+Gy
 Y+UEaw3EwU2tV4OCIzpZNmmMBd5iMCcxwSo48mzUN4b2jlmDfe1dCQvaIqd31GaZScFq//3GcIA
 Zonlg9p8lqRgyfYDepJJry1xIbzr/cAGJr6xSr/2UAQiyK5TMt+YwZHsUUvvWZRDwb692DCO03m
 rSya7a1WX9SdKkfSSQLdNBTcBHTlND3eWR8XRQ9aMmtd4m+4QnnGFoRiB81IhGnXvs1EzoHi21/
 IQiV3jYZrKPJAtCREHtkczkBO3KBN1M9+QlXOlsgiwgN7sDA3IHOGtKMzIUVl4pSaHJgCuQOImi
 0NWlilml1Jf5j83NqYTqQu3THMnw+lhnrlNlyCRIvvAkea/N04zvXyoffA7uMVJLdTnuAJvV8ht
 3HGQYakmm0nqq9eUif8CcmLzvbLhv4snMUip+5ReuECg7XafdEozr/NRPoIMpIzfI36BF4ce6gA
 f4plFvomek/yOGQRKgU2LENgF3OCsRP1GVkY8WktqS42mCdjBj4ogea9UCc8XWLaHOwCa/bikNc
 N5WxQ/S/+jMAiZjO+TdeQYL9Cl+NuigFKM7SHFXiw3FGosh9UUe1A/wOrTqoGA==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7AE74A4C548D;
 Tue,  6 Oct 2026 18:21:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uj-000000000ir-0oYZ;
 Tue, 06 Oct 2026 16:21:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Oct 2026 18:20:05 +0200
Message-ID: <20261006162106.3439373-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 24/84] package/snort3: fix build error with
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
