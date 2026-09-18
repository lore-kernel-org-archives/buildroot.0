Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09571C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6F6060E1F;
	Fri, 18 Sep 2026 18:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UI5mBDrzBBp6; Fri, 18 Sep 2026 18:48:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BF53D60860
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757317;
	b=WoDry2NY6mkID3uXTPQ1EV2VPT8NjFMJQ76bdodZqGVPNK2HjhaSoHHc/fNgJ9IsTEnv
	 7rpD9vPu9hkCsDIWFp/AmsgfupF3sNi+8avFmXlBzeDy9/r1GeJGtC5pfe+SdenyIyAy3
	 AygIrmzw4N7tE2ENw0LbNmiUxrzoQA/JYAJTbHXzgMracnFcGMWNKyH0QkayhOab2RFFD
	 DXYp4QUcTlE3TGLwOMMIWbAH8UYCi6Zbit7CGddr6E47RlEErC93FkG35danrwsBeGl7v
	 r+LZBd/8/YkUxg1TA3BF64igGGHZEdbqL9O1qYzebTlkpk1v3KD0yI9KTaIhShGsaxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757317;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0AyG4/N5+aD2DqL+PGexnfsXdvIUqNgLFAlu+/lTdyY=;
	b=AmUYhHRF14gx026iBJUKPPo7gwZGJgojL0Bb57CrIYklmzoW0bdrojMh2S24wz9r8kqI
	 75LSR7ZxZRngjyEfpG5+28S3Kflcj8OQkiMhXLD1WhCfhy62g+j4BSeJTh7SWp3jqmCc/
	 Hsr60o++NNVS2Nh1yToxu4+Xmot7kvXlkiDnVrCz6/epVf4o2zj8cDjVxocq6F9G7mabs
	 /IoZy4IQ/AXg9GCm6xSmXdbHlPEj7kXxIo+35MnWGAL0oHKeFNRG7i7J07vjjMTmss97r
	 Hs46TTVA3br5t3aNR38WWCndy4fQ6gMJxjVC4EXvpm+xE6Sl9TLD1z9jF5iIoNVhgyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757317;
	bh=0AyG4/N5+aD2DqL+PGexnfsXdvIUqNgLFAlu+/lTdyY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cyWUM+isgJVMpV/lUsWFJKNf49IJmGtJlA6RzY2KXHjUHhwJDKr3WsY3eASPbbS3w
	 NHhfRJ5KyQaNzAoEM8bp7xOupdJKRnL3/WUngfKbzox2ds6yAL5dX1RNoSIuwBYVKX
	 IUukGAbPqMRBQUMlNz57/1x+oY0/IeoPxVXuTr6lSadkxw4nnl09e2EVDg/02zzCuH
	 Wv9vmI4TCg5BZ7jaQtyrvgkdGI0ocWW/ophv24ya0s00DpoZfcGGTvTGnWNYaSRjBY
	 7Ls+lIZqNNQ0TFqcLJR6UwDaGnAugoneh8x/XGH0qDD8priDEUyKuMFbtGKDG7Gz33
	 IvFV8/nfvnC4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF53D60860;
	Fri, 18 Sep 2026 18:48:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E365237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30710400AB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVLAYDeR_OR3 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:48:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 080934006F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757316;
 b=EXKt4zjeZ7CwaQjdxy8uRDxMJZMD3MU37E9TYaJe+CfInJVXsHHziI6y/+hQMv6PafLQ
 wfQ07BnkV4MWTuqbaRjRFW/f2hP/0D1wvkM+wFs5ZG2Tv7YXM6YNdgMQXpeplXh8Ou4k0
 NRuSrkoPKM2A5VlsZEKhQbvJEoaEssD+CQc2WYxSNWDiN8xIFISGPHPn44rvi+R8RrRcO
 hjLpCM0pVK0FCV/pnceVd8d6EkY2v7RY/BRPl6YCimAs5e4QxXq5a5aaHbCYhNRQh/Hxs
 SE5Bjgwmm5wbiEeklieEeFWn3CMtGpu6tn+51svnQTZ3eCL6hI5Eo+5t2pST3r2aRKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757316;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1FXrMr2LeW7hvLOkx4nxseyghvKJGdNNpb0LqBqxS48=;
 b=SOZfGU/g50I5wRvIPdM49LnuAqkN704pJ9o5zcWQ7RvzFsPEBAFDzrISUvh/lL1Ar0XR
 Tzi4Qoxjbs24467qKpdEZNBbSEkzz7JbKu3Kch2peg/kPO5BRUD67s/D6Pgy18cg/Alr+
 pZnrlgAnOIk24xAcNZFd36+BOdy4fC2+vYwcD5FO4Glljdp8qve/bQpqIghUCpa7m5amx
 /5sMJ+bxJE6HiIG7G99EHa9EVu8NOuHVrPQf8HuyJNvs6o8+Gl0oo8M3CiMXEwUlgSBN1
 l4q1cf4nFy3KunjMbWezbHb9P7Y/WV/4vvfVOnpw+8L6WlkzCdMBFsPb/oL7rZx/oFA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=eslf6V0e; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=eslf6V0e
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 080934006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756930;
 bh=1FXrMr2LeW7hvLOkx4nxseyghvKJGdNNpb0LqBqxS48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=eslf6V0eFIlfvR0gWepo+oK+SakbCLL+hGw1NTIXbDqKsjAakjZnj3dEbOdkNZ65d
 K1SabUT6RvwNSQzInpiumw828ffdO1bnZFqI+qLbpXzfJrrANV3yawgHjGO7PP4zqH
 HogofkLohtVlI8p4Ov/1aA9zw6n6B5Vp0NKEFft6h/eKx5Sc3Bs1DV+H56uhRuiH0e
 3QUj5/YcemyNsn6DScIzcrd02PWlTdQZ/XmFMn5QMMl8uURO1CJ4m3vUFJNYV9t++q
 w6s+2w7hc9hnmjaLii5nuLYAQeW4/8fsAhEmBuYswymBEuDKunMEvkGgrdif2jdK3J
 QfwJE+Am3KOYg==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:rP+QKzVyO/9HvqYVMhYhec9XCAAia2ugUlgpqpdqo/6MaNWUK8Ia/uwDTkY16DMUJp3PF5Mcqj/YLFktb7tKYUs6T8T5IomVgmj4O4TZovDmAaEzAwu0L+t+VRjymwj7sfNQKZBWXqgn3K096Ixv/tfXkay1Wat7WtPg+ebluB9HgY5g1qdm8pNFJlGmAwk4IeWcmgiqu9yH8ecr9kmmuOYC5B2tmlOTwVQy8NN2Ee2dqSKK1qzOHqjZ0AGgLOpcbtyC4S0TjkNa7nxaEJyueQBRjfK+yUykUW6LHgZ61LR+aQWvz/Q8ia/SUDYwF3sMaSnkvfpV/zIsxuwxWZjjQWssz6u++BgaPLrUjdSIoFZHfYOxdi6HJJUwmEPFO/fklZWjKTFzDVaXeZyUL8WGnC/+5TIZU77y01CIembaGP89QUeZ2VNh6/uOsuumjTDre+67I1HiZHOZFyosX6calynawpXIDdVHFNpkxsKp3MHirvf4QIuAPOBE+YbuI7X4I+4WHQaFSRimkI0iGmoFKNodlPESU2EWKD5DAxxORq3HX0jRKv4pqu7ATjUApQFKENpvLWDcubANB/E34ew8kn1KeDb88BDBg8CEuaZCZ/i+7W
 xL44OeUvCvaV4wAHt5BrcA291nQkG16k0jbmAopr+Vr6z+ifhVWYh0HDhJOpqebQs9QE6nVLYK
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12018A4C471D;
 Fri, 18 Sep 2026 20:42:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWs-000000007cB-24lj;
 Fri, 18 Sep 2026 18:41:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:43 +0200
Message-ID: <20260918184140.3631274-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 21/77] package/snort3: fix build error with numa
 support
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
