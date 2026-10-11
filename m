Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEABCA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57F11403E0;
	Sun, 11 Oct 2026 13:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOkoStD36SU3; Sun, 11 Oct 2026 13:03:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DC6034046C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723797;
	b=bQSema47zgbuYBCP6yAY9RZby5NQx0q3tv+2qiIk9waPFNc3DNCx25FUDs18n2N3uMuM
	 mFqtgdSLuKgdm6nSvubIZiLwIAPV2SbbpQZPlf+jJCiE9vp3qH14aFbTrPdyRQPskT4NS
	 DP1CHygAUK79osFvs7iZf+u4j5/MkCm79OuJNC5SjtF916EwKRgrauPq8ZoBL9JX0t5AP
	 8KZ1MQCQZ4/eP4isjZDKEBKUmBqvfDkHuWVwa4TE6W5TaSdiqe6yMIlZ5/CC9wxoLFJvu
	 EJ90TxNlL4GbwSDrdAdSy/aCfDbRlZZLe8w1820m2YcYUK6FiB5Zw9gj4a12atu/xgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723797;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IzHT9apJugJ9Mq+9Maicanq4CQ+d/MfXXSfyAnw2OxA=;
	b=Ra9Eos9o872rAzjuBBMoetg3Vt1k/gscu61q+R01oYkgO+IWrAPxCNi//DWy4ByA2sQ8
	 pI03zuKrsoLjUNM9WLnPFTdT9ZhifTAgS/JiG1vsdWdKDhbKWNqkwwjk3JRqxY7UDfF+m
	 UIy+UNIoRafrlUllZ7JDhHXLYD2pv0LQs1m5ypnoN96jHVWTbrRRnxokabRGZn2PROHT2
	 PsWykZMox+6TqIzNGaALfTmCQlB6uHSyQiCA44QsM1bS1xU46Ozfk5P6F9o22HB7G8dON
	 USButTcxQsCcZedAZplRG3/ZrhrvjJBzKj3775B4mJoRwbrTopgeSLRLl86xtOyH6DQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723797;
	bh=IzHT9apJugJ9Mq+9Maicanq4CQ+d/MfXXSfyAnw2OxA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=J6oLBnj9JcEaZfIe4lHUAFGHLLtz12GOkhqherRCPohA0J2lbpbHJxRoEwYaSP/Dw
	 ue8e5tXJK7gq+duAnwXP5Xjoy4Q2MqHxLrkhM041JUS78o1s4nfqy8Rqf6caGcXYql
	 PobruVgpzrr8enZmJIqnB51VTRe+goApuIjwT9lgHcbjYEAZUyBBvY/MqI7kfaPwBu
	 f0EJMWUnJXYEyoFd6OVQHAtXEOmfkYPatzRHwbS8Wv+/rWapqV+clWbKVb91DpWOWV
	 ZsVbx7x5Nx9W+hsIubi/C5cfvvUkX8aWf/vPpikGnFpz5TeViOCCXn6D0B5+lLT3Qu
	 F2Aydnw+A3K9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC6034046C;
	Sun, 11 Oct 2026 13:03:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90EC2111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 770D240071
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5MkuyLSBa_nm for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:03:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0EC9D4002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723794;
 b=I/VgWE+LWVh+Bh/BDsZGHXofqKvuf0RMyndk2khGg1biyaAysoyYQfD02ikZ7OUtY9dU
 X2ipLtO+BY1Hs5YpJmz7ogthelOtHf6m/pKg88z4fihFhU2p9UviRPxbR7fz+3yaBqJFv
 wThKemYxeZSjiVD0fyag0gDg3Dgqp8x44npl3k7nQvGSuXiuOu+q2agry87Jfnj6ty+Cv
 sHzZOxyPe//xYH5ull1to0ec1LvWhd2P4FBTACgvQ3JtIQ5ZMRamn+gwULZfTv2sV0c9K
 Y1UbRcnN1kV/87JuZ7XcoXOxfhY9Nh9TnLHDGyYnE9Hlt0Fs1Yj7eSnCb0sjGNvaO5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723794;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=kmLOH8Yz89tBIBwwx+ozg80twlSX5WoQzeezXvLA1+Q=;
 b=kXfgVlglEycqwRM4IrnizJ/v8sMmr6MPd3GKt9mDSkXL/j+g3b3utwlLjfvuYUohxI1s
 mi/DHO05rPaEJrvgMySzJGmoCmZICrol6Iec64FI+lnxFev7809C21Ic9eJ+Kq8G7y2BW
 LbIjoZ0g1g6wcsOHTcsh3QOTAPpbWCPY7UMy+Nga8praOhjDrQ38JiW+sy8Vol1dQZcqz
 vomYI/WYUNPn6TgJkfXUDG3W6tWyqV5PrKAF5FNELi3ls05p9lRd3VupMHQwcT7706r9y
 LrnehxxUmJ0veaBW7mjLsnSXarotHknCkcvU4vnbk7LpidTu9ksqPCG5SADmoatYWWQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OcVDX3Sq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OcVDX3Sq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EC9D4002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723662;
 bh=kmLOH8Yz89tBIBwwx+ozg80twlSX5WoQzeezXvLA1+Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OcVDX3SqqkcDf+Gujg0oUTrnDJ2Go6NBkuvaEXPodBoKbAXHinVVz8RUXg4Mhsg1U
 9qprsZhfmvmzFwSacz0nWpZBhnKZbbLIkohEEfbHY0T+Wn+FAO7QBiISW9hFMu7fYx
 1nHUuLiPcfpR7Dx8UlFfIkHnEH8esnXbj/j5rmy0TkIdfaZrElvcIYOZFi//YmemFp
 6viUtb7OhUIxzuFMm5L8mpWWfUHZkUQEaVK5pn20uuER3e/YorYe46SV6SjD1LAQHq
 eKkyISjz17t2n5rcxkvRvrvsbwbyDTwGY/JX0/feM8BS28CumOv5VeLPYqsVZFFyZv
 l1vBerjtJ3wXg==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 uPvg619ahqCWUe8Z1SU2/3Fqyn4aFdSCvfbwvHQlJZ+rSq7wTScyoFJceX9v21a2iGn98Ol2Vh6
 yioxMCxsWf3B5gb+RFGWZ79Np3WAj35lgsJIlQa2llP5u7IOk/uXQWwCbdzM2+lM38jLKmDgW5c
 qYSgN00xW7EDDas+ZM1dyy5qGjS6QZqE7sz5WW4bR2LHXFzBx9OVyvFgV3s1RK6J+l5irOqdhIC
 jkW2UntkAIBnlAV8PWwSPqaxhheGHd2RG5pE9vhP0PdQJbpXZPlQ8ijb/r8CPlybiKuK/+xlrOL
 k2sSdk6mVZDLDwqfppsmGDBNmSOck+biXRwTbu1N8l3T3/maeUfIyP6VSCdh1v+mqYHAl5kifnh
 nUZ3oOHpDa6HGW01wGqOhK1OGWz4UQnT+naEIbUfUDdgdPiEW84OEluEcZGjsVuDg8vzy8bab6V
 GkABoCklFdjzKZWVmuz4v89lG7dnpwlkJXytLKS8d3WFZk/4Vlw8WnwK9eY0zUTO/IjZnyaOyiX
 g8JWXCbWQs2xTcmunZDdkVgFQoU4FCecDDuN/XwI6ggvPmkxv4yKHjgCYtmmV8gKpzApWE5/u8t
 GKEUJVwrcWsiwaNZ99AjYCN219TBBQ34iNrh6Wl+x4IvqJQcD+8Wcry3uZ3PXZOKa3UkDC66FBZ
 ULyKlTMp/4XWOYX5uRmg=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3BDD0A4C584F;
 Sun, 11 Oct 2026 15:01:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAj-000000007Fz-3O7y;
 Sun, 11 Oct 2026 13:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:24 +0200
Message-ID: <20261011130058.3443432-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v9 19/52] package/boost: update C++ version
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
