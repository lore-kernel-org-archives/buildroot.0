Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE7BC4451C
	for <buildroot@archiver.kernel.org>; Sat, 18 Jul 2026 06:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 001006077E;
	Sat, 18 Jul 2026 06:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXpDRwoauMkq; Sat, 18 Jul 2026 06:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E49E960741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784357569;
	bh=bYlWAzetOKvo4/v4a6ej0ZpbGcWSncTqIDL/+YFND8w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fK5Xrw1x5FRHzFfDozBVBIwfBAaJHG6Q6CkVEHNGQxYXFQ6y2o1fXuqBtqdb00UWB
	 TRwFZ/PyvKeLmkuZ+grXe/htPja+1yJo8I8V3K4z8188KWoTM6XqwjAQXBvfWIccQD
	 BPs2KCkCbEGR/5SQzEtaQtcWS5T6aF4MstqBtASFLbL9hNIXCXy8AURF9Vv9i8+mqW
	 sRmt7Nxils8Th+8Wp6kFgnONmJVG+VAknnjeCmkFePglkGR5DchiisgzurfNMAuk7M
	 xxgdP69Bbv7Ij7d2LcNvw2qPh7T3rZfgqyXPUqtwcgxXcY//dwNVnnNS7SFdRlf3la
	 lk3h2IrPc80tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E49E960741;
	Sat, 18 Jul 2026 06:52:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C915426
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 06:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F332D40149
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 06:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bws89col9RWW for <buildroot@buildroot.org>;
 Sat, 18 Jul 2026 06:52:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BDA1640083
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDA1640083
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDA1640083
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 06:52:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b33e.dip0.t-ipconnect.de [84.161.179.62])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5E769A4C20D6;
 Sat, 18 Jul 2026 08:52:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wkyuG-000000006Pt-0Ypb;
 Sat, 18 Jul 2026 06:52:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
	Fabio Urquiza <fabiorush@gmail.com>
Date: Sat, 18 Jul 2026 08:52:14 +0200
Message-ID: <20260718065215.928877-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260718065215.928877-1-bernd@kuhls.net>
References: <20260718065215.928877-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784357536;
 bh=DwE3T1uBHayyz70O/XxgcaDf70iAp2b4dlaLhcyICt0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Gt+8fAA+9S0YcrwRnI8YuIgjSDItyzJdAa9ftsuTEF/J5wGKINSn0DuaxmGfwUU/R
 U6Typj/THO1n5SNLoP2ZRWjnmg6q0koPjsgV6GfJCHvoqsXRwNVFXe4lj0qoEmStRW
 LjiCG3bwcHNEOIDfx9DAwmLFvR5zSExETaAVXuDaEVSZA7w3gPuzlYssWCEERNJYu3
 M1UXUzgSRy15oa6ejh1gsiuy+KxhURJ8/9bHNsdE/8TkZA4wCKrC46YT0P9YnGjTNs
 xRti6m870h/8Pw0gmYIpVWAxbdcj0YBjBljCKQ1L81qob++UE2l92GKehsWGGMzVOv
 GjA1zEl1mWA0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Gt+8fAA+
Subject: [Buildroot] [PATCH 2/3] package/bitcoin: Fix build without SSP
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

Buildroot commit fabcd7c8cc44e7e03c68bfcd2b4e2d10331a93f6 bumped the
package from 28.0 to 30.0 which includes upstream commit
https://github.com/bitcoin/bitcoin/commit/a01cb6e63ff3940f0773b37e2fe1e148f17acad9
that was first included in version 29.0 and added among others
-fstack-protector-all to cxx_flags guarded with a new configure option
ENABLE_HARDENING which default to ON.

This commit causes build errors with toolchains with SSP support:

[ 44%] Linking CXX executable ../bin/bitcoin
/home/autobuild/autobuild/instance-40/output-1/host/lib/gcc/i686-buildroot-linux-musl/15.2.0/../../../../i686-buildroot-linux-musl/bin/ld:
 CMakeFiles/bitcoin.dir/bitcoin.cpp.o:
 in function `fs::PathToString(fs::path const&)':
bitcoin.cpp:(.text+0x4c):
 undefined reference to `__stack_chk_fail_local'

Upstream later removed the forementioned configure option with commit
https://github.com/bitcoin/bitcoin/commit/00ba3ba30341a9073049125334f176d6c05d1b54
that was first included in version 30.0 so we need to remove
-fstack-protector-all from CMakeLists.txt.

Fixes:
https://autobuild.buildroot.net/results/093/093253c79fed1c5b93decc3124e9ef4622168efe/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/8d17d8107a074b94d628061a3c18917987141483

 ...sts.txt-Don-t-force-fstack-protector.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/bitcoin/0002-CMakeLists.txt-Don-t-force-fstack-protector.patch

diff --git a/package/bitcoin/0002-CMakeLists.txt-Don-t-force-fstack-protector.patch b/package/bitcoin/0002-CMakeLists.txt-Don-t-force-fstack-protector.patch
new file mode 100644
index 0000000000..40370d1bf7
--- /dev/null
+++ b/package/bitcoin/0002-CMakeLists.txt-Don-t-force-fstack-protector.patch
@@ -0,0 +1,30 @@
+From 4d33b5bcc924c9271c40a19796f8316ba6aaa276 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 18 Jul 2026 08:10:21 +0200
+Subject: [PATCH] CMakeLists.txt: Don't force -fstack-protector
+
+This allows the environment to decide whether SSP should be used or
+not, for example to support toolchains that don't have SSP support.
+
+Upstream: N/A Buildroot specific
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 892f30d94b..93ccbf71ec 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -532,7 +532,6 @@ else()
+   unset(cxx_supports_fortify_source)
+ 
+   try_append_cxx_flags("-Wstack-protector" TARGET core_interface SKIP_LINK)
+-  try_append_cxx_flags("-fstack-protector-all" TARGET core_interface)
+   try_append_cxx_flags("-fcf-protection=full" TARGET core_interface)
+ 
+   if(MINGW)
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
