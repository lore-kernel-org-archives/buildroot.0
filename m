Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1507FCA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D38EC80DE6;
	Tue, 29 Sep 2026 18:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zzb3XUV1QB2x; Tue, 29 Sep 2026 18:37:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D37F580AA3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707059;
	b=aIyuL8909uXK7lRUn5oRQ5UQfzOI1SaYpCUDz//q3uCEZeGqHLdRtnVHEsDXxNUpny6U
	 W+yDnOswluUwWgTny8J1JMsC/8zk8Rhw8pfL75OEKP/F7hMPNMP2Z8uJA9TBF91E6Sc5q
	 qimupTpgEb9sf1fZqX9JpmotZ02OQWNt2chgvjGfVAEEHtYjYI9pW5dRgfjFh8Tx+ZUsf
	 qdJ9Gkr81yz5R6mgzB7MFfcAOD7CtG5u0M8zQ1nSLnShJJNRbJwXvsq/HVhPECSp93/XR
	 B575moEV/xDv5XIsmelWIfIPs9Rzn61/PpjYYwL7DxP7D0d7BDr+Q1aizLjqhTuKpPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707059;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7rYxzUiGdSItCOECILemuho3/NB0th60t5KDo2umm7k=;
	b=IQOZS5utf1qZNRyXmJqlFP0QF40wu7RtbVbKGxl56+Yyq6zqhEvN0EQYsMAnfYjDfl6Z
	 aSUkZWDRwcT5MF6Zz3W08AF9Uwl3ZP9ZdandDaMF9Xg6naNS0oL2/zX/PFNq9LAafIO4Q
	 6+6qldrPMzdFzONtnu5dR7zzOXDp0vddxwRB1Oa35fe8X+KuUZqKA2UaLVtdJ1aYGvulP
	 qkR+c84LUy4bQ5ovu3QCQA8358l6fP+f0zKudwEBJhVODzl/SzdycTeX3YIWYWGxVgUfg
	 O9hNVG0oaH0CXgPIzKw/Py9BMGJ4B9L304nuHKnNoSYyxttvZrmwDtC8tT8fBnVZyFw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707058;
	bh=7rYxzUiGdSItCOECILemuho3/NB0th60t5KDo2umm7k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GztxruBBmcCbMz+W6Sk+rbQbptdcPkKjR5KofGFovHzBcGiSH3gWmH593v9aSFk6m
	 OBCjwq2Y7uE16SLZzvxHXXWa9JeTzvUPFMo+hNFSSpL8+mWuh6HHB6jj3PhA1eJJ4h
	 P5o7HUBz3jiP50Wy4Dkldlu5tzk0RHaVhKkYq/XnR3Rccbx+IZr+pzwXDFniLvE5Kz
	 d3bMXcWRmkXcs/LS9btp6q7dMzXB/eUo866rDlmCVvvFUDPrTEMVGxpdyVzk9kvZ7g
	 yXwFe7B6DoojABsmqXtecDQRMl4Ji8n9HMuzHpbnyKxlFJbySAx/N+wyIVhG6REITd
	 6Q2zSQlaiNHBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D37F580AA3;
	Tue, 29 Sep 2026 18:37:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE4C23D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B04F34055B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkhX3wJgGlxi for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:37:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E4090403F1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707057;
 b=Mu9DMxmjs+9PmcEj/q2yo2fJJhdUbhslH3CliucbUAFX/ywa4ZkGftUIJPaneLvM50XM
 lpTxU/kf+8XTaVaJhwibgSoQ9TMIAiOrY6bdd8ySClPXgYK/48pJgaUd6Cv5q5WCwkiT1
 cMROHzjis3xengOrsReddb+Z1XkqkNw9BjeGSk+04P/ycjVfhXqQNt6DbFjxSwAUTBspf
 oTq5N1GPwyhlTpoQ6hLKlwL13FExMU4u/Fvikqdn2K6j4qpQM1PLjh9JzNqhMgbaVsPyl
 /6bXqglktv0/GCcZRcc7lugRL5a8uIpbCmYERxt5afOGtmqMWJMETPh6w9T/1tqdAtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707057;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=nPv6+yP96ul4xC4gCQMDDJIAxx5bgabg3wde7rrcOE0=;
 b=NJAco05Lfgy7VeVqOCUOhwDAXt5kp4oaYg33YC9CTokRWqsyU2r7PaWKGs9oChkN8Nsr
 gS7I9oMedsXcKtzN1cK8VZrXiQmvxwtdIDOq7AkgQyH++QB7mInPG5ndQxklH3AqXkS7c
 mn61WSdmdQ2xlJhsvcTbZRdE9vWghzxpTrNF7sXakIcEU9l2ATdj56FJK8qlYfhugLDHq
 HlJONhNYUG9UMDAk4d3ZEckm4kjXLpJA5HnDd5mKw7mmpB9Sg6v3rvDab+G2helCauMIy
 r9OU2ekVSE78bmcNv2JFtm+9EV6oRXkQ1shGjpf/5AOQsN6JDF5Viov+HgwQyxHsUiA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=eiTW6nP3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=eiTW6nP3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4090403F1
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790706981;
 bh=nPv6+yP96ul4xC4gCQMDDJIAxx5bgabg3wde7rrcOE0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=eiTW6nP3AoonZEywpzz7K4PCRxGO3K+VavvzukgRmaR7T8okWVee6JCgFVpKTsoTA
 yOJ61IKzgaclMQ4M0P5zMYz4LkXV0eHT+WhmPgUc+/k8PmEPxmFUfJKeWjXLSGIa5z
 leWd2ZmXADhCb0aOhPw84jTB/Fdnkh4cSVqyghYnIo73hZLRJHn/a4w1nxUGDC1OWl
 KIhgOMgKLSyxts2oJhNhj2YLzVSfwO9xLyCFwNYe/d+7XQ8yMQbJ6Kxx3m1Ux+WnJo
 tdGfw3Wzh9AtCu/KcdkgeTsUnIxf9bn0Acnpqr9WXjHJ1SibqkiFaVf+3/ANx5Nc2H
 pbpm37o2KvH5w==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 S0WHq87cu2YEZzePqwcbTxg7gIP1onZmuY00sIaZ6NyS55hb0K3DrfxRx/F4gTArBL2j5jl9Uua
 HtlJSxzwYmf9O69OrTQNLZZA6HdXSNMVTMMo5JvzHToF/Tg7GdlQsZgRbKKT86OpESJn1j9Nobv
 qWVIbdbcypHYLQY8xytAiLsrFzQOnqZ/v8Awr7H9xk3qhagoLzDSPZrQVbOPhR175n4EMiPeJYR
 M9XHVfXGJru0jdCIPVcnhOLYYLkDhXkTZkTEwmqy491JdC38Sl0r37wVvIjit/nG+ANuaBEb7FY
 UQ/WMbI+kl0elmCka8o8e/7MSd9g54g1N1IP77ZFqL3jqL4Bl8nI4mU4UkO0i8Gd9rllH/n2Cch
 Bn+ZwQGl6iGB83FygU2ZtUHBIO3YSeZBUPeDNIxxAJifdexaUxkhY8AJgPsjtdD5ssfh7rByFOU
 mXsHTUdlPuFpzCcl9x9Nk290g9XgwkCjixhjmavd1qgiqyDycl4RYR7tKa4mPNFppgx2h9MJQCN
 0Gs/Bso0BYgbK9mVniMVXz4kuE18LBboBHDaImKyQMOsqatzG+b6kQ2z5bqXZjr43/7PR9gtX4z
 13o7rVWi3WuSH3I4kyQD+jT+q42P4k8PB2CKecn6/8ek6YSlISsbrWGfNhb9/wBWMbWgTJeAh93
 jbbK3gJDHEzk3S6xS
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5414DA4C518C;
 Tue, 29 Sep 2026 20:36:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcge-000000006Jn-2ZZq;
 Tue, 29 Sep 2026 18:36:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:07 +0200
Message-ID: <20260929183607.1849293-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v7 08/66] package/boost: add switch for
 boost-process
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

since boost 1.86 this is a buildable module.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Johan Derycke <johanderycke@gmail.com>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Simon Dawson <spdawson@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 22 ++++++++++++++++++++++
 package/boost/boost.mk  |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 45b98ec0a2..736255a33c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -287,6 +287,28 @@ config BR2_PACKAGE_BOOST_NOWIDE
 	help
 	  Library for cross-platform, unicode aware programming.
 
+config BR2_PACKAGE_BOOST_PROCESS
+	bool "boost-process"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_CONTEXT
+    select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	help
+	  Library to create processes in a portable way.
+
+comment "boost-process needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+comment "boost-process needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	bool "boost-program_options"
 	help
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 87a576f277..37ec918aef 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -60,6 +60,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	math \
 	mpi \
 	nowide \
+	process \
 	program_options \
 	python \
 	random \
@@ -142,6 +143,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_NOWIDE),,nowide)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROCESS),,process)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
