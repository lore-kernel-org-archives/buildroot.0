Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F45CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC65F80DCE;
	Tue,  6 Oct 2026 16:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWv33SLyCTLb; Tue,  6 Oct 2026 16:34:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4188E80D96
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304440;
	b=USL/9qX3SMKP3F04hdZ75hkZRcNBi7pb72+DAmBQHWulCTDMDN8EPc++zFCF7MPzC5Fo
	 92vX9qkDReOFyF1NFr1rt85YYHEFBto5JznmD2znJxNBF19DFaIxK59awWVMhKnEWwZv8
	 Dt0viMeEDs03d0Db5I0pHFvOrrAuOsdlTwpQzalk/aBYfUGimN86as5cFVqlrHq6xvOne
	 EAjzE7sYgsFm70/nZYFURjvRV0L7sO/LBsr8FCGZo6e2+k1tbhGtM5CzpEuQGzRKlYmgl
	 4tKlnrM2Xhc0aYOqQZms+atjpAV8x1jVPgsYYM/QPzC7MqtI52XHCQe6/Li9P4H40Gg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304440;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IzHT9apJugJ9Mq+9Maicanq4CQ+d/MfXXSfyAnw2OxA=;
	b=es7rNSQvwmEuFOUDfb0eOINWvUaFRotmRMaP+DldbXCsRBAk014x3scVmhzzGxmy9U+x
	 g/+3YZIQfsIK37T5K8NRAfxhFO172Lr/mfoYrC6oSp580R4aFNvRdC7JpIgVwnS3cgaTP
	 z3bakXnmxew2jKix4+6l9U0Yxxg3O/NPXoqO0slt4VcgA3XsG2+Z447l8aM2PtfifElNn
	 5EXhIJJIUwykxKGiMnt2Q1uf3A2IwiyZH7XR72hfIuKbGSom01oo/x+lsPno7nc7W0e1x
	 TQJ0lvLeS13VCwVDTbPVGOmRC41mFvvfvEdiOmYJG/KU86TtF/ZaaoRj9P6MA5LC2bw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=pv6N+7Ul;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304440;
	bh=IzHT9apJugJ9Mq+9Maicanq4CQ+d/MfXXSfyAnw2OxA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=L70kSxmNJkbOb1La71TqS2Vt/XYpEeCXzp7i6IhPKZR7hLn5u1pG2o/bS4tbTjH47
	 c+kVUcgcE+zmZ7cBOnFjkD01Hk9EM/TI5nIVYJNQKBQ8Eb1kKsKN/KWStvhWC2h9UH
	 x5g7PcfDjAdr+VCxQbdhdalEs4O8aoZZVPrp1wqkKAlwc8JMOIHY/LRx8y1zATplmt
	 sbMivvVxzhwf1SrNJOiosy7PbUn/wJk98gY5vqBjtbDr8IOr5T67N6FnWoXyWsftNn
	 pH5ZyEmjwdIUgswIj/o8ex1FY+ba2iBYbhzmLw4TEsaTq4u4ElogyEK2Jigsh1LfPa
	 Ufbmd1ScVEGEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4188E80D96;
	Tue,  6 Oct 2026 16:34:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2D6C34E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 977BB80DC1
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMeaqp4TqQES for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:30:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E0EF980DBC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304219;
 b=NWw63lfsesIAu74Ta5R2fsyy5ZYr5tAMnICwAGNTaOCxhicw8ZyfQ9nJrh36jy18GDm3
 Us79gFA0Ac1pKkwuCMCCG3H2CdlyG36uzjBO2fXsDB+NFIP2pLDowBvGOHFqxTdhafs32
 SYa5ECReJGYhFB7y8WofmScUAljF9BaErTnArSvahInnkmF/UY3bSREwwJasjdpHesxIf
 wc3/KH7+duai6Pzf6kyMxL9bUYA+WZW2rKDjx28mS+pfdZ8X0AoS81IqdT7tkFbvXNEkc
 GwiBbe6QUkeG+m69Z12G1aa4BMpGY3IG8+X7HCFAHpYkClVwvdXGPuwciYsmfLM6D3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304219;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=kmLOH8Yz89tBIBwwx+ozg80twlSX5WoQzeezXvLA1+Q=;
 b=f6agtVi7quXl4C2PrZuIKEgKne+th4QNWKSMOoSTxTi4xjGj3UB8ywWm4jEOb7rGZf37
 ZSfmdLlvzMS+ujtxlav/ZwBO5EBK4fnPcR1V4XUjbQKWcs3M4duUmKnypdmAbTqQrMOK/
 Ga1fMqawmhzxTlcJ4/oo8iYsCI1GCMaRm1y0g65p3clM/L0uEB8oTmUU2ehFy1INa4ql3
 77moi+nYM1q+vPOx0ouuemD4KT/84Pssppusn7Oy5O+O97NFwbAg+KZJs4MFrMqDZoxHA
 Qru8l+jSDrN9+XQjXjh9fwrbwUXAeIl37IG2Z72pPx6F/Zml2aq8BsSws6csZ8rUjLQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pv6N+7Ul; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pv6N+7Ul
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0EF980DBC
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303707;
 bh=kmLOH8Yz89tBIBwwx+ozg80twlSX5WoQzeezXvLA1+Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pv6N+7UlmnIZ4sVMaUaf4ApsJy7jzNt2ctxresJdyslpyl1gqgJt+7FEfQxzFF3zu
 jkUmMjqijw6PgwOOdSjbP3thc6y6GGlj6XRlfD+Y9EcoiKUWo3hkXWqcrSKt/YupZw
 jc4HEs6dhjoGwnAkcHAzekFvFT/Vu8PAJhFHpDWYJ5ClbXwivxNuYpyCE2N7B38Sdp
 18caBJuRLUczQRnb0OwNNhAZF9ubcAfQ+VQraitQ8sawh3lVKD3k/UtqbF8GwrrFDB
 mfKL5/Kh5yZw76QqXgvyZm/wF/d4zWtXzVCt2cJjQ7LCp//2wUQADaPnI86f5Pmhd9
 pWcYFUIUD05uA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 SxJW3mzqmvHrmUPtf6yy6ptulWBDH8RY3sdb/70jBDvcu6FDrgnXuMUawQULlrhloGcR83rNmN6
 yEMZ+WLSSSf3HlmcNQgHiAMgKn1peFKbKfHi+4K3RIFvsyNnbCdB4Hd0W1R9ptbjQAg13rtgR6Z
 aCtfeq6YMzDoDkuqWN7C7xKPQr+B+UPQQyF+LgIWR3JTO/4dUrVb8Et8Tv+dcYsvtdpCTOMqVf0
 lc2qAf49GlMhu1r421ULRyHv7n0sMcSxqUCHA9n1wQsFu8bXQgdVh3u8kXZDj8HLQT/E1Xcaf6S
 9g6PmI0Y2jWBhqeBYd6z/dfWhsjtfeyJW22UHorEIUALXseSn1toSyVtqYYmTlRecCx/OxshqKt
 UdGM9WVztJRgh1cMUyuGltPUluWV/ztSDJe7C0LqMtUEsDvMjMSrSHu2/5+upkDUEMiyzbiRZEB
 VlzY33sRwBKHHR090E63sqURfD8A1pMzMBTM5T0UjbETyOx+XJOl77YLUS0GiFNaBEcGYL3Naq2
 EVwilBJq8Qf/mIoAyzeiI4BV0ow5IFxVXYt6/Ifb7mq4OxkmiKoBplqqnopdH/s2g9QPFDhmiP+
 6VrW0DTLY5Lr72wb3hChyeZz3hhgN6XdGw6ieaovwkEJs/VDxFjVb3bUWKTGTgXxbNRDLn16iqY
 N11uJtBdwJHXrtWMB7TI=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CD286A4C544C;
 Tue,  6 Oct 2026 18:21:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uh-000000000ir-3yZa;
 Tue, 06 Oct 2026 16:21:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:01 +0200
Message-ID: <20261006162106.3439373-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v8 20/84] package/boost: update C++ version
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
