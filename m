Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF06FCA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E0C81202;
	Tue, 29 Sep 2026 18:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Om5mPK9zpp_N; Tue, 29 Sep 2026 18:48:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CBBCB811F6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707728;
	b=G2VLPS7I5soTNuBY4EdWtK5SufVEQ4a+ZGx8a7yJJrNdpMUnDiQp5Wp/oBIQFvuqrwhY
	 50WNuUQswUnV6cXNH7sM1uaDWlSeoU8PqvNYZKoW/sJaxEKiCvJveKY83yChcgmM2cL51
	 T7s3hN+3cLinkyw4AQU2RbcekqUD7eFZc9TkMDzkB38kC1vwzjF7qiDCl2TAlASLxDXef
	 wh4nhMysQu09VPc+/F2UJ/zXVsN2AwzEFwqaBe+72ng7OpYVbF2Lo/8JN3iGfOGVoDZiF
	 ZbYosTTpW6/jRpKe9XhNqEBcMiF0occMQPWrPuTUiIHAx48RjHXdvSYK47FiqMe6PZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707728;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=haOtkK3FWovw/zGPh1bEPEtKImiHJAXti/heeUK8w8k=;
	b=O3vHEOvKrSnJM7cUUh9fzwSyg6y21rD/6rJ/OLAc8HNq90P+DFM1BlcbjQ6k1lodstYr
	 DoHHWTWotxiU6UlOY2b88AssTsPi+NXsCgUBaWCAlSH5IJqE2GfEIAhqXU9ajdnMZfItO
	 5dhPh//FuIYcv4uszydiyUv9kYwtF/xlRQXe+Ptgt0Kn+sJd7InckvDQIvbgWIs4DNgln
	 0fDz+aD7Laia6Rgm/Vco3BJJ/CiqPjztlqCHWhB+7/VGdTxfKpSIJbFLjeyIfXS3R59UT
	 fqR0EyllHCZqLcmyQnXZtxnqDwPqnitTs1Fi9yK6fdV074qndJAtF7RA4DmKW/smz4w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=hzCpAeCy;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707728;
	bh=haOtkK3FWovw/zGPh1bEPEtKImiHJAXti/heeUK8w8k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O4pcKlocuKMmw+PGA2ieu/Id6YQ0s7NYNN53GCRJyAHVB7I2SjRQruJoZg98S+Qtz
	 //WA5b0wWvPGECJu4N9cskaVF+MtVZMsv9FWKnfrltVPGBAzsjCjqsslSrj+4w27+S
	 c1LYwYCHN7diEqNuwwkyVMuO8FeUyJmXd9Vk8xRRpoM9ao3GTF9d+bvrkcEBnpk32A
	 hu4TYlUokgFJKhipAfB+OXMFoibTDNtIiC1381zMMcV6saRTSem7a/gbVn3CBc/7l1
	 bw6msy3exzp/quCYnbEHyoLLJzxSg1znDvK3yH3mRcvdkOrxyG01oidik+RwAGc11N
	 HxMnuNOEck7jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBBCB811F6;
	Tue, 29 Sep 2026 18:48:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30F1414C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22842811F6
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6JoJe1layDL for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:48:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3290E811D5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707726;
 b=or048f/ScY4FJtGUxkTSHRpgbXWL4WRj9fpdFw4GhBHVQA3eRDxc6ymT+b+VWsRdeD4x
 6Esfch9pmT7VV4D2R4087UC/j4F/Uhy4AGIdQKQRVTAHwrG91NRdTTCCxcQ3lOMZXUO3h
 khaZ0lxY2XHuMmL0c8DFOvuRZ4ewbRtDx6RfFuUUgBCcZKx3bJEANf/y0UCTQN34FSV8Y
 smXbk/hzbkvDU3Ni03grmPDLuJgSdo4BVdcqN4nMblKFGgvBIimUFtFevKmrhn2GJul/C
 qDQ+cZbdPLbNCz7v2lHRESpyl+U9/Y/qgzjzaU6igQ5MlGme5QnL5n8UvpQhxhqLSRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707726;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=WI76P+OfaCW7gEb8BS14XCtVjh+eO41koRx60yvPwRY=;
 b=M+gYH3J7lN8so2uueOTGb5qhKl3CwQrGcpPWw/GhFQqQJpHmF5tt2SASIvDOlJ/v84tk
 F9rwfuxhW7q1aSmjaZJY4E3yWoZ+n4cEcrXkHOK520FjizTbTJnbf0RNenAXxj9DMgzDy
 jUnnfDvkXExER0QxrUvhdlDp4Pxc4r+687Aw8saluDqMG51atN5LGBsw9BvCNkSRX9Ua4
 KjG5wBjJp9LiSjBxrGFcNASMacQ78poeyN0tBAiXHrNdDuZmct/n0J80FINF0OQU2l/Hv
 +/s4m0UCz79cK5V3uwMqkPD00OqyM7Ss9wGEKxhvJmevhCjqAQrKngIYbHYTBN33uVA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hzCpAeCy; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hzCpAeCy
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3290E811D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707033;
 bh=WI76P+OfaCW7gEb8BS14XCtVjh+eO41koRx60yvPwRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hzCpAeCyx9MZFMgG+5FKSHI3fTwzXMtoYj7yrmsfJhTsRRvw6inVU1nzwJg5riPUU
 Z+tNLzetMZE13zYiGIZaAiAwVTO88EKmy/vuSA/RnzXsr8DlkvGjcmVpce+HRC9vwy
 h80+n4ANzCcewpogwYHaxkwF7Und4M23UuuVPzf8m+Cb2NEfkuGVQw2h+zZV7HSLVn
 bJYAhYUYa/vMhuNSOqOCL6YEL/YOW9mjQa2U+CW5QMcAW7mDdRFSOEJ98OytC2Rpsp
 +zk2SnRETxXDjPrX4F3btwJvJ3NXZcD7CnJYcBrv0evc6DVGxQVS8LdXqc7z3ILef4
 qsL1chHOj8ezg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 5C5f+pOiEgkXHXDpzZOZHXNVbPdpyNaguWAlNBh+2sUYdSw2vDaAxQFDjzYEsj6pjrvLoFpuK44
 x1FPMKQZCFYtYojaeC8p84yuSnXGpayfmMsk9DgzXeG+stzE8zuehh0TIfLgwcZWBfSQinLQEf2
 F6u9Gfu7ZgepgINsauJDhc4TAGUBvVTHd0/G1jN4iqXelaZxTRZ2ufk9LYFKBXjtaMZpRzTHhRG
 kHYz8c0yaatEdQzI4jx+M038WKHlagMbsjUt77tElXDtMZH2jd5d3a8el+8w7ly6Q0UUBemSokR
 O8bsdpbFTCGn+PEkMJ/imKI91qiVYDYWoY81zclJZEGBVIJu96EdZnmXrsD9YeGasklTUYyl9eK
 oCu5o2abeBkN1qBzipfu+x6Rb8X+tDkuEJ9Vzuz7pAof1fF86f7LJFagkyr2puAR0JVG8vymS2A
 5Re7FZNdoqIU9UH9W3bAZt0eikUNtWSGN15rNtpsPfXAugpprKrrhk0SCgrJSZMOjNxOy94XSuH
 hi+UFHGOXv58Bl18aALBWq8WD/EC31As1AewJeQqoSfrENgGbLD4D7wcaL3oI75jSTVTpGDfK52
 t2hf4zJ7SyvD2i5YerQn+awvQIC2onJMtHovNG1Y3fyMq3qRDhS1ZVJUbnGDNLGJ
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 13620A4C51F4;
 Tue, 29 Sep 2026 20:37:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgl-000000006Jn-3ler;
 Tue, 29 Sep 2026 18:36:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Tue, 29 Sep 2026 20:35:51 +0200
Message-ID: <20260929183607.1849293-53-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 52/66] package/redis: Fix build with OpenSSL
 4.0.0
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

tls.c:676:5: error: 'X509_NAME_get_text_by_NID' is deprecated: Since OpenSSL 4.0 [-Werror=deprecated-declarations]
  676 |     int len = X509_NAME_get_text_by_NID(subject, nid, buf, sizeof(buf));
      |     ^~~
In file included from ../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:34,
                 from tls.c:22:
../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/x509.h:1041:27: note: declared here
 1041 | OSSL_DEPRECATEDIN_4_0 int X509_NAME_get_text_by_NID(const X509_NAME *name,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Upstream PR exists to fix the build problem:
https://github.com/redis/redis/pull/15227

Added buildroot-specific patch to remove -Werror=deprecated-declarations
from CFLAGS to not block the bump of OpenSSL to 4.0.3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Daniel Price <daniel.price@gmail.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 ...emove-Werror-deprecated-declarations.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/redis/0004-Remove-Werror-deprecated-declarations.patch

diff --git a/package/redis/0004-Remove-Werror-deprecated-declarations.patch b/package/redis/0004-Remove-Werror-deprecated-declarations.patch
new file mode 100644
index 0000000000..3c33456d52
--- /dev/null
+++ b/package/redis/0004-Remove-Werror-deprecated-declarations.patch
@@ -0,0 +1,28 @@
+From b42c0326b542b0e5d29cbfef2ab08d0d36430803 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Thu, 17 Sep 2026 23:58:19 +0200
+Subject: [PATCH] Remove -Werror=deprecated-declarations
+
+Upstream: not applicable
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 205508596..4f31a3af0 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -52,7 +52,7 @@ ifneq (,$(findstring FreeBSD,$(uname_S)))
+   STD+=-Wno-c11-extensions
+ endif
+ endif
+-WARN=-Wall -W -Wno-missing-field-initializers -Werror=deprecated-declarations -Wstrict-prototypes
++WARN=-Wall -W -Wno-missing-field-initializers -Wstrict-prototypes
+ OPT=$(OPTIMIZATION)
+ 
+ SKIP_VEC_SETS?=no
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
