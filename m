Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB2BCA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5056E80A83;
	Tue, 29 Sep 2026 18:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJ2X4UsI2_yg; Tue, 29 Sep 2026 18:37:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6966E809C1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707046;
	b=cuJ9gw50O14Zi/jFo26QLK6VLt+NrM7R8UYia+guZ8yNhLURSrV4vTIXfJjCdsbq7KXk
	 MFneSis6obkrjgBZjiZz9UT4tnqntka+Ty/unW9Hynwg5Hej4fVBVco6toXWWEvX1oKe5
	 Cg0x3sfNIR9YPX38lslp92FphJcHdZVZNaPNklxWXS7Y9oufnazO99m6rO97uQ5kcQeer
	 te3QkZwyhDkm0kle2WAvFj3D8K2pG5EIQvaJwV49wHEYaz2AeyjMQgEU74ONvjpHueBP7
	 FYKQtWpYfxX6+3IlLEPMLZHJdzBXuPj/bonAkGW7O8x4i0/G5fBYELMZ55wIPCoQvsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707046;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+Z3Q9Zem/8FQ+7dJCz2ifcD4wfTX/ShKEM13e80nkys=;
	b=P+VwgGqRtV/KV/JSaLCeJbOTFIeZjQhmoCaj4UYdOPsePGBhgFrl0AUv5eJjzh6y4ff8
	 5I3UTdKqopufKQKoMPKTKt18Gj8mQOIwuzIAlU3beERnUkFkHTuWOEcH83XRxG2MyIKNK
	 c7UUqNebvIiW5apypsjcTnxeUdN1cegpUEqU4lr2mxFwjh5H20EsPisd48jF+Pd6ye1vl
	 u+WMkDXZsOwMsdU9PUo5dj5IjSchJ02fiDTZxKWp3GJsWcBcaFrm09PZOVoem95hUvTnC
	 pdmR2YHa43+fGRcnRWw7snoa/akkzl/C42UfSRhL4L6Iwoe5OEVHs8j7AvSKOHdoDMw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=hUVLWnz1;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707046;
	bh=+Z3Q9Zem/8FQ+7dJCz2ifcD4wfTX/ShKEM13e80nkys=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RdFy743Y8dpb08HkgLFO+2UChHTiMS1hu3IuDtf/U/xQ2X+o3gSu8KswwRBZ+pfQU
	 1QM6p/ziwIkaDrDujlDrauy8jCaH79WPJKvYEpubCP/ce4LtPZbK057bEDp5e2Kkcu
	 mq1WwnFOtrGocMkDhxIY5RkixmcOLKdE03/GZsot3tklDhT2xIwF4VqkV8SLAiexkH
	 YeYMM7hJXUkuKl/w9rmapBkkLc42JGnS1iN8GjEmZhaGR4l/fwZPF6hwligljIVj/n
	 fEV0fybhLBccovTlh49Uc2OWSCVX0XqT6vOr+rxDtwWC1usdfeEbd1PrqODEpDxhEC
	 gj4FnHCKqPL5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6966E809C1;
	Tue, 29 Sep 2026 18:37:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E74C914C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8E0E809C1
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Z-dfbIDVMg8 for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:37:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1916980970
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707045;
 b=hGTegpkvZFL7rNRxVU6wVY/YjoO/j5ZmvVKBSrf0SK6mCHuBOj3NfYdXg9tYIu/2pa5g
 xjPiQmH6diXXGGLXmSyJD4fWVJef0QBZBZirAHJz3v4x7jWtE9i314vWKc0Jw8vsTt6cd
 zY4Yznx5P32sDpRyVExSNPrRK5qMKLbWzCkIZY57J52gR8adtRJY9fhs1esyndVSouUGH
 3xw/J1LbEmBhb8t3MNRNtzaLVX5IqUQlF9NozuMG/dyeU0oHFgF73V9r7VEPczK0x2vtk
 dNDs5QNYpTTP9ovVWWpqsdsfUxCjOcW6vsB5vToJRTl2TM8eLIq6SP5wSmyJoa5as5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707045;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=LqmAKsx+Nyz9yFitttXsLKuH1e5VylBN50ZGYB9ulFY=;
 b=maEe4SproLKemoJ7T2Xux0xilZKtneNLZxPBXdZfGsz68/TxS69Q5uHyiqeBgkBnysQK
 3VjLjuPgjWOC0ajC+9CoWe38k0laabu38fP96q1pEGJkfz9WlzyA9gV7VARFWgSCUHxwM
 QHzHhoqHC0n4obVqTazgEivM6pbZer1pQg4HGHkGA9cpqNzBk1EiFViirqpx8WZPuW6Nq
 zg4STzTbx8C/1Z1QrbgtDwQbY7Vr9doUd8U4Yh0YNNVZ+wIsr+PnWq66Cjg+VUExJfvDs
 sIPcjlGDPT1G0CWV+rhxNCMd0Fd0oAYDdopZ7ij9C0GRtmdoyyq+GqITN09z7kPVfuA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hUVLWnz1; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hUVLWnz1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1916980970
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790706981;
 bh=LqmAKsx+Nyz9yFitttXsLKuH1e5VylBN50ZGYB9ulFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hUVLWnz17fa35c6uwm2+ZojOidkDEHeN8hEsch5T9n7Z4oKfgCTWoXF5UBR8SGQ/u
 hmkcHZkMZHvWTwqV2JkXJTqEsGfnh5yuFpcS9pFTAf5E3qGFeqSM/de56knNKELNDL
 6qMcNujotFX9Fg9adFXJX7+Fu9bJg0t0COKonxqNybWQvvkikroddYMjmNGY/zOxnL
 Ilo5EAdn6SX0mWEWmycPRh2Loe7NoUkcPohFUsgrzGn2mz70SUp7BIaWi8b9T0pSNg
 UNhEG1Y9y8CAuQ9WtMXdvVrlW4/3p5hp33nCJw1luEmijYDz8wIHDqUC6mqoe3alv7
 B+y80MWaQhVMA==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 R41IKIUJ9NJuz+Iv38cUIuEDZSwD4I7neknDuVimW1lT/hAqfEzJNTjqw5V3X3LEvHzi2xM8K1w
 NOua5RBrVsLIatt8xQG7RQ604rRlKn8EHYvV1lxt6ZNRXii+He2VDU9F+Sus/EQWPNpaKT3+AGd
 F4nUoUHj29Q/+JS+oOcbjmFRmf20Ibd9Rb3bPo6r43VnHwGKNgLoDytXpwK4EHqYAklZ7Dyy1OG
 kCuJRHsyTHnPcEnxYkCTWUuBmsim8S9UeJhyODjIEYQSELdoesf/upWuknD3pZbGI1ghIZiojSu
 aAsnUIKcIegj6Ax6UCxG+ebE8NcXPj8YKPEM/74H4QlCnmPkjeiswufG/ONvFRxqTXH6a6bYZwH
 JdqZMB3+fi8PdxvCIW91d9q4vbhtsOlRJzhv7IVSVQ6y7wppppvvSQadIIn6vAJp6zoH7jGr35n
 Mze5GQEs1StA7fci2r+2C/p6vjprP0UJ2p8daGhW2oIGaEwWnneF6lHN41l2r9i+8EbuXCm7hWp
 Za/dSZFgmG03JtuNxM64Uixd/dVUNLKDeTx2dlKBzERsH5EU6Y326ApUWWMHgwArrggSKf3m5wy
 af1XRv2hFYcUVsw+DaCquhfNj7R4XY90ZgBX3rLLLcZcnmZZuTNpO4VNypHrz1vp2RmvJdgaeD1
 8fWJcFXPdxQw3eCFwdw==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4285BA4C518B;
 Tue, 29 Sep 2026 20:36:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcge-000000006Jn-2C8d;
 Tue, 29 Sep 2026 18:36:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:06 +0200
Message-ID: <20260929183607.1849293-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v7 07/66] package/boost: add new charconv and
 cobalt library
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

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Johan Derycke <johanderycke@gmail.com>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Simon Dawson <spdawson@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 29 +++++++++++++++++++++++++++++
 package/boost/boost.mk  |  6 +++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index da213dd2d3..45b98ec0a2 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -22,11 +22,40 @@ config BR2_PACKAGE_BOOST_ATOMIC
 	help
 	  C++11-style atomic<>.
 
+config BR2_PACKAGE_BOOST_CHARCONV
+	bool "boost-charconv"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	help
+	  An Implementation of <charconv> in C++11.
+
+comment "boost-charconv needs a toolchain w/ C++11, gcc>=4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_BOOST_CHRONO
 	bool "boost-chrono"
 	help
 	  Useful time utilities. C++11.
 
+config BR2_PACKAGE_BOOST_COBALT
+	bool "boost-cobalt"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
+	select BR2_PACKAGE_BOOST_CONTEXT
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_EXCEPTION
+	help
+	  Basic algorithms and types for C++20 coroutines.
+
+comment "boost-cobalt needs a toolchain w/ C++20, gcc>=10"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+
+comment "boost-cobalt needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
+
 config BR2_PACKAGE_BOOST_CONTAINER
 	bool "boost-container"
 	help
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index ed63a608ac..87a576f277 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -40,7 +40,9 @@ endif
 HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),\
 	atomic \
+	charconv \
 	chrono \
+	cobalt \
 	container \
 	context \
 	contract \
@@ -68,7 +70,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	timer \
 	type_erasure \
 	url \
-	wave\
+	wave \
 	)
 
 HOST_BOOST_OPTS += toolset=gcc threading=multi \
@@ -120,7 +122,9 @@ BOOST_DEPENDENCIES += $(if $(BR2_ENABLE_LOCALE),,libiconv)
 endif
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHARCONV),,charconv)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COBALT),,cobalt)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTRACT),,contract)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
