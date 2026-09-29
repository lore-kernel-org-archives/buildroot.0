Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515EACA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E8188081F;
	Tue, 29 Sep 2026 18:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8GnnI7V6veQ; Tue, 29 Sep 2026 18:42:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B6A638061A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707333;
	b=AbltOuGqHrbaHf1dZlfmAbsZeNDKyrlv2E8ONTTK1tcjeUvaUvGWX9cRzNrpRZ61ticD
	 1G63ONcKNxSMWp2wxTaFqc9YzAth1QkVrsFoE7wx9rVB5yCg027KDFC/LM+YMnz23uOua
	 iT/nPVAULH9QAgBAMklMgMjV+29FIM9IFRaAikpubbU7tRSIWNtS/oG2lns9VDr0CJKaA
	 +7Lqq0LbhRU5QZRW+rr2jvB3YGzCtoEc6kEdYaEJDvMRd5OZXLtDYDC06heKUJqrdCfHG
	 xCYYSkmrLFEXODjnqsIjVuuDHRX5fX/nDpksN8PAATfDF/J/RXSwnLzVp1yYOmcWlDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707333;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IzHT9apJugJ9Mq+9Maicanq4CQ+d/MfXXSfyAnw2OxA=;
	b=ViLucYM6b7SzH7CgYOBAgC2vOXND61W2Rl9/9bGVmJ4Pa6l07Gw+glJt1GgdgqeZW1qa
	 uEyeN4b+KxXENFmfJ6mqQ1/J5FScRhZox/hTJ7yngpJfGMr60Fpv363DW7L+VFGz0C3xd
	 /KBB/vrY6ReJpAMAKew9VRrdIBGuR3weUGBIzOh3u5dQ9kAW1MUAwocyi3fa/FNoJW4WE
	 PhdEMsbPdfnMuaxsavxjwuoxvC1EedbuFqYjUnWW0sxyU1l6FChtZeITBhgrECtaPzl7d
	 wXLLYYirnEI/GC2s1T4Nnuwh1XeZiIMYTVr6EIOC7wwp2cw0uzRuT8UNCWrq0SsiSYA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=uOuTtkAz;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707333;
	bh=IzHT9apJugJ9Mq+9Maicanq4CQ+d/MfXXSfyAnw2OxA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=h5WFW3QJBsVYLkFQ/t4SkoLDQdf9mkFq3bsrg2p+qRc7KlzsJcDgGRG29hbFFd/eQ
	 faGCzXAJ8pZEyzoAOOF3TNBLsQ4mwjCiJeJSqw9xFB2ZK0/JcaoZsxLnLKt6aL0ljy
	 v+BtR8hWfghEMYFpSftheEkITZNH/t7MuR7umc+COwvbEx8GT0oG6Gi/AK4Tk4jObs
	 91L8JKtuEW98SnRNxFrtPGYkujrWCUpp/UiP5QPI5BQxCp65Wlk7qAeeUexFDZ8Gs3
	 NFNqiGqdLgPEt8rlVRXd5qpSLS96pA7Sv4W59dnEIQycaZEUlnJCyoOlR1osIY+py5
	 nBnGo1FbMj+HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A638061A;
	Tue, 29 Sep 2026 18:42:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F09E14C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9071D810AA
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGGiD9NtIQvx for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:42:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 363148109F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707331;
 b=Y0xVTyr3ZVoMIkjgKW5Nj8ZYX2UlFOj3Ys4nCGDaGxZwECmSpjFcb1/eIGU6pCORQ+9J
 7iScvei2XsDJ1cxgoPS2M6YydCGFXzSiUP5KKlMwvngyu/srFBZZdeT4ekf7CeVFQ81lx
 YooCbcOVR3ZPkx2Q5i12ekFwLAfH5uy0kgyN/+KoJEkd+Oh3fm1Vo4KuyAJlzBAVBwYmR
 60wNwiRrqFWecwJ0isN9Ua4I4bcJiXnpOL7hzVwpIrDq+ywJ4bgXC3prXNFyIaBGvXvga
 xffF+mTvQyNIGY0Xf4N3PGcDa6YWOqI2gWe1LCajdDqF8/6SjFze1WUuVvQPTZvAAMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707331;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=kmLOH8Yz89tBIBwwx+ozg80twlSX5WoQzeezXvLA1+Q=;
 b=TTLHvgN/h+80Zei/gxkVvgvKSGp7xIXjSk6eZPbt9YP9gzt0Z/GUT8+JHWUmFytanbDJ
 LtzWrHR9QGtqYoR41B/8xnTseScE2QrwemRktLm944UqxzBSseq8j8KfhtIZWGqp1hJUU
 0jGlt04SEAC3ooS2gPgs/xxL0mKKDl+UcejKBoEGvL/DyA9uAA50Bm1u8C05f0sZjfUiU
 SZfowqxhilt4w7mAJUaQfCjwg+GvqE9Ped6No0mOMIDuL1zflobfQgRsJAXvXdrMR0e5F
 5AIOeTJQDYAV6Ggnjp/NaqLyJSRDuAhLIAswHQOeHCefJhiLn4THGw5FRtrDIIXmilA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=uOuTtkAz; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=uOuTtkAz
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 363148109F
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707026;
 bh=kmLOH8Yz89tBIBwwx+ozg80twlSX5WoQzeezXvLA1+Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=uOuTtkAzmrOPZUXdvdZU5VRAGz5FKOWqhLhtByOHGexeR/eSm65qYr1Uw49QDZRlc
 zmt2efPAUDZdWgUUELObL3BgsgWMrsO54y8QRbTkOqUempcEAl+zQhNCEp4gLsSYPj
 tPPj/TAto5gM97lYp1eiOhv/3l3BkMqXgkYq2/Fb7pGyNexCBrDQVU4SlyJNtr+TsD
 wWhbT+xFGY/3ij46VEUYRcHHlDvRMpQKohWiMnRAQZ38Hs3zvvUUK444NTwe4c7Nkk
 OcsBs2RsJPKFc90GB8KUACPuT/mqjsW6jQBiLTTZwvksJKEXEM7p+oyJwqK//rVF/E
 ZLHbNM47NHIsw==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 O1QPTccfLRE/ufXP0SZ1zL4oBLbIJlntv4H6eO7zyIvg2I/19zeHkLbWrKVP864iBpB1zGC9TwW
 8eF3UD+9A0UT9IkcCPqljS2CUqKzvNkPXv+ZKrHEML1nRQG6gTIoPNHzJ7VYyYd4WR70CfXzNR6
 1D24rT3ckfw0qbokk01BGjoNSglcBPRCnJze+0BfJG2NVoI9aZ0/v/rmwY481nQwiVcU83NMRoU
 5AVMvemj4CLyKvpBS6z//GmULVVOHy5GlL29AsWU22YGYM0bOOlZyEE6uUkUKefMc4w1M359yNo
 4oSgxI8H8CXgu9O4Jzu/myljCgbVPCNo6s0emeHHNLLtv+OhrIDVPZO4Vb5aXJcRzF9VdkzjLS+
 JlwE5yT5EkOejSTLR3gj2vQlRxmjmoAHRyrB068wt2RE95k6rRvyMel7pfmiPEVYrdofVE59o6b
 OXLEuReeRIfLh/4dE+dRX66Eoi1w03c+jKgaO5choj9eFtX9NMhEhQEA6i7Xp94gO8Ew+CIIQ9G
 mDlgnwp3XMokTyFWed/+m+B7EYYEFQZLspCizNwZoWg+7gA/RyxvKlGiAfmYX4oITdztpmI7AgP
 jc2fmxqmzzrP483EHY35qAScMEgEpAvxI8twPNflLW+1QaI0ChSWH+d0FiAZP3eaJbBpVtE9LgX
 fzYK3xEFoQjryDWWovJ4=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D0F2A4C51D4;
 Tue, 29 Sep 2026 20:37:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgf-000000006Jn-1Yvv;
 Tue, 29 Sep 2026 18:36:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:19 +0200
Message-ID: <20260929183607.1849293-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v7 20/66] package/boost: update C++ version
 dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

1.84: Atomic, Chrono, Filesystem, Log, Random, Stacktrace, Test and
      Thread require C++11
1.85: Boost.System requires C++11
1.86: Boost.Graph requires C++14
1.88: Boost.JSON dropped support for GCC versions older than 5

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Johan Derycke <johanderycke@gmail.com>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Simon Dawson <spdawson@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in            | 90 +++++++++++++++++++++++++++++-
 package/log4cxx/Config.in          |  5 ++
 package/python-libconfig/Config.in |  5 +-
 package/resiprocate/Config.in      |  4 ++
 package/zmqpp/Config.in            |  5 +-
 5 files changed, 103 insertions(+), 6 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 93ba15df50..dede9b946e 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -19,9 +19,13 @@ if BR2_PACKAGE_BOOST
 config BR2_PACKAGE_BOOST_ATOMIC
 	bool "boost-atomic"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  C++11-style atomic<>.
 
+comment "boost-atomic needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_CHARCONV
 	bool "boost-charconv"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
@@ -33,9 +37,13 @@ comment "boost-charconv needs a toolchain w/ C++11, gcc>=4.9"
 
 config BR2_PACKAGE_BOOST_CHRONO
 	bool "boost-chrono"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  Useful time utilities. C++11.
 
+comment "boost-chrono needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_COBALT
 	bool "boost-cobalt"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
@@ -55,7 +63,6 @@ comment "boost-cobalt needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
-
 config BR2_PACKAGE_BOOST_CONTAINER
 	bool "boost-container"
 	help
@@ -92,6 +99,7 @@ config BR2_PACKAGE_BOOST_CONTRACT
 	bool "boost-contract"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread -> atomic
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-thread
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Contract programming for C++.
@@ -99,6 +107,11 @@ config BR2_PACKAGE_BOOST_CONTRACT
 comment "boost-contract needs a toolchain w/ NPTL"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
+comment "boost-contract needs a toolchain w/ C++11, gcc>=4.8"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
@@ -163,15 +176,20 @@ comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_BOOST_ATOMIC
 	help
 	  The Boost Filesystem Library provides portable facilities to
 	  query and manipulate paths, files, and directories.
 
+comment "boost-filesystem needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_GRAPH
 	bool "boost-graph"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	select BR2_PACKAGE_BOOST_MATH
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_SERIALIZATION
@@ -180,14 +198,22 @@ config BR2_PACKAGE_BOOST_GRAPH
 	  The BGL graph interface and graph components are generic, in
 	  the same sense as the the Standard Template Library (STL).
 
+comment "boost-graph needs a toolchain w/ C++14, gcc>=5.0"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 config BR2_PACKAGE_BOOST_GRAPH_PARALLEL
 	bool "boost-graph_parallel"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # boost-graph
 	help
 	  The PBGL graph interface and graph components are generic, in
 	  the same sense as the the Standard Template Library (STL).
 
+comment "boost-graph_parallel needs a toolchain w/ C++14, gcc>=5.0"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 config BR2_PACKAGE_BOOST_IOSTREAMS
 	bool "boost-iostreams"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-random
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_BOOST_RANDOM
@@ -196,8 +222,12 @@ config BR2_PACKAGE_BOOST_IOSTREAMS
 	  Boost.IOStreams provides a framework for defining streams,
 	  stream buffers and i/o filters.
 
+comment "boost-iostreams needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_JSON
 	bool "boost-json"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
 	select BR2_PACKAGE_BOOST_CONTAINER
 	help
 	  Boost.JSON is a portable C++ library which provides containers
@@ -206,6 +236,9 @@ config BR2_PACKAGE_BOOST_JSON
 
 	  To use the library "header-only" this option is not needed.
 
+comment "boost-json needs a toolchain w/ C++11, gcc>=5.0"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 config BR2_PACKAGE_BOOST_LOCALE
 	bool "boost-locale"
 	# When boost-locale is enabled with icu support, Boost no
@@ -231,6 +264,9 @@ comment "boost-locale needs a toolchain w/ dynamic library"
 	depends on BR2_PACKAGE_ICU
 	depends on BR2_STATIC_LIBS
 
+comment "boost-locale needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 comment "boost-locale needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
@@ -240,6 +276,7 @@ config BR2_PACKAGE_BOOST_LOG
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
@@ -252,6 +289,11 @@ comment "boost-log needs a toolchain w/ NPTL"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
+comment "boost-log needs a toolchain w/ C++11, gcc>=4.8"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 comment "boost-log needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
@@ -304,7 +346,7 @@ config BR2_PACKAGE_BOOST_PROCESS
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	select BR2_PACKAGE_BOOST_CONTAINER
 	select BR2_PACKAGE_BOOST_CONTEXT
-    select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	help
 	  Library to create processes in a portable way.
@@ -330,6 +372,7 @@ config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 config BR2_PACKAGE_BOOST_PYTHON
 	bool "boost-python"
 	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # boost-graph
 	select BR2_PACKAGE_BOOST_GRAPH
 	help
 	  The Boost Python Library is a framework for interfacing Python
@@ -337,11 +380,19 @@ config BR2_PACKAGE_BOOST_PYTHON
 	  classes functions and objects to Python, and vice-versa,
 	  using no special tools -- just your C++ compiler.
 
+comment "boost-python needs a toolchain w/ C++14, gcc>=5.0"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 config BR2_PACKAGE_BOOST_RANDOM
 	bool "boost-random"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  A complete system for random number generation.
 
+comment "boost-random needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_REGEX
 	bool "boost-regex"
 	help
@@ -356,32 +407,47 @@ config BR2_PACKAGE_BOOST_SERIALIZATION
 config BR2_PACKAGE_BOOST_STACKTRACE
 	bool "boost-stacktrace"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  Gather, store, copy and print backtraces.
 
 comment "boost-stacktrace needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
+comment "boost-stacktrace needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_SYSTEM
 	bool "boost-system"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  Extensible Error Reporting.
 
 	  This library is now header only. Building a stub library
 	  is still supported for backward compatibility.
 
+comment "boost-system needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_TEST
 	bool "boost-test"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  Support for simple program testing, full unit testing, and for
 	  program execution monitoring.
 
+comment "boost-test needs a toolchain w/ C++11, gcc>=4.8"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_CONTAINER
@@ -390,6 +456,11 @@ config BR2_PACKAGE_BOOST_THREAD
 	help
 	  Portable C++ multi-threading. C++11, C++14.
 
+comment "boost-thread needs a toolchain w/ C++11, gcc>=4.8"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 comment "boost-thread needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
@@ -403,10 +474,16 @@ config BR2_PACKAGE_BOOST_TYPE_ERASURE
 	bool "boost-type_erasure"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-thread
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Runtime polymorphism based on concepts.
 
+comment "boost-type_erasure needs a toolchain w/ C++11, gcc>=4.8"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 comment "boost-type_erasure needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
@@ -430,6 +507,7 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on !BR2_m68k_cf
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-filesystem
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SERIALIZATION
 	select BR2_PACKAGE_BOOST_THREAD
@@ -439,7 +517,15 @@ config BR2_PACKAGE_BOOST_WAVE
 	  preprocessor functionality packed behind an easy to use
 	  iterator interface.
 
+comment "boost-wave needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_m68k_cf
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 comment "boost-wave needs a toolchain not affected by GCC bug 64735"
+	depends on !BR2_m68k_cf
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 endif
diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index 8305217a48..4eddc1a227 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LOG4CXX
 	depends on BR2_USE_WCHAR # mbsinit
 	depends on BR2_USE_MMU # apr
 	depends on BR2_USE_WCHAR || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost-thread
 	select BR2_PACKAGE_APR
@@ -30,6 +31,10 @@ comment "log4cxx needs a toolchain w/ wchar or gcc >= 7"
 	depends on !(BR2_USE_WCHAR || BR2_TOOLCHAIN_GCC_AT_LEAST_7)
 	depends on BR2_USE_MMU
 
+comment "log4cxx needs a toolchain w/ gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_USE_MMU
+
 comment "log4cxx needs a toolchain not affected by GCC bug 64735"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/python-libconfig/Config.in b/package/python-libconfig/Config.in
index 00688719ee..f0d56602ac 100644
--- a/package/python-libconfig/Config.in
+++ b/package/python-libconfig/Config.in
@@ -1,6 +1,6 @@
-comment "python-libconfig needs a glibc or uClibc toolchain w/ C++, threads"
+comment "python-libconfig needs a glibc or uClibc toolchain w/ C++, threads, gcc>=5.0"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_TOOLCHAIN_USES_MUSL
+		BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_PYTHON_LIBCONFIG
 	bool "python-libconfig"
@@ -8,6 +8,7 @@ config BR2_PACKAGE_PYTHON_LIBCONFIG
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# error: invalid use of incomplete type 'struct _IO_FILE'
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # boost-python -> boost-graph
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_LIBCONFIG
diff --git a/package/resiprocate/Config.in b/package/resiprocate/Config.in
index ba68ad8e59..584f8d9e86 100644
--- a/package/resiprocate/Config.in
+++ b/package/resiprocate/Config.in
@@ -32,6 +32,7 @@ config BR2_PACKAGE_RESIPROCATE_DTLS_SUPPORT
 
 config BR2_PACKAGE_RESIPROCATE_REND
 	bool "resiprocate-rend"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-system
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_OPENSSL
@@ -40,4 +41,7 @@ config BR2_PACKAGE_RESIPROCATE_REND
 	  Rend is tool that is was created specifically to load test
 	  gtSIP based presence servers.
 
+comment "resiprocate-rend needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 endif # BR2_PACKAGE_RESIPROCATE
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 8c08b9d862..a913e71b89 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -21,15 +21,16 @@ config BR2_PACKAGE_ZMQPP_CLIENT
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR # boost
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	help
 	  Build and install the zmqpp client, a command line tool that
 	  can be used to listen or send to zeromq sockets.
 
-comment "zmqpp client needs a toolchain w/ dynamic library, threads, wchar"
+comment "zmqpp client needs a toolchain w/ dynamic library, threads, wchar, gcc>=4.8"
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR
+		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 endif
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
