Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F90BC88E72
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 19:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EC4B605E9;
	Mon, 14 Sep 2026 19:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYVbP93qVGJF; Mon, 14 Sep 2026 19:21:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 30BB3605F7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789413718;
	b=QlGIzT/mH0iR1N+AbYm0JAR1bHxu6mEv3pzJPxJSN8snx7KUEwPTuLlG+59y5kan3z9O
	 qnrwgie/44WowfclWZdic7G8JPq2SKfc7sIEh1nkDrzXchPFdqiSOcYiE41GJut/pEZBv
	 Wemc/fBhuyIcaIV9Plje4BN2l5hWVKu4C09kDyIj12e2xNvQ81S+OSK6kAvXsbos9qR9L
	 TPZWj3kTp/BHQ6isg1hI1//lcdUw4qNsYm+7IlvZzpAEjkMDrfU6av8xeWyPJ3Ztik5Tt
	 rxxzflNMZdPO1lTA4uFVQI7/IvdbheVOvicf45f8pbW8TWQk62EDo2OwpMkiCo5RJ8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789413718;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=O3P++mh4ZTzuKSWLNIzExcXNfdKwnj7BxPYNuJcI/sU=;
	b=iky7G2FjlJEjJX+hQUHwXn4ww0c+6BfqKc0C87WQUDNURzymuXjzFxzf3HrqZvf2RDLt
	 Vsh96I5d5cnBHp+ZcXmbnC9x8G0HdgYnR3jMr06OOganNfAYkNcWKvpHzyA/Gd9toT2EP
	 zUKTrf/SHVmbD4RtyJpR7qsMkCA1am169zg7CPlcTwxyqWxOf8mxwCWqMFNVh/7XaRJO6
	 xlEc9vcnFTZHyAFVn7bgrxhAAh+Q3Wqsfr/e2Y/RYOxocVfEDo4POkwQXquHwy1HVFjeZ
	 Z41SjUEMciKoYXqDRJqiNvBnYIuo8cY7cHkYuNSExtMMu34pfWnuYNORBC6VguHyh+w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789413718;
	bh=O3P++mh4ZTzuKSWLNIzExcXNfdKwnj7BxPYNuJcI/sU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZC+VzjZAYJsVUQ1Bs7CWgDnjVCraBxZRxTPxdGABJzHcSbyB62kaZrmLb0xs1nMsO
	 b0vz8DRKjh1AJSKDmrj5fRK+T5XB1rOrC2YQSlGa4zT+eSjCLWlJipXFsieyJOMX+i
	 rrChKPrrh4YQdRBBoE3gKqm9YVIyK1jvE0g192jKh4FHV8TpFjRh1MChNf8m6/37O2
	 u3U3evgxQbuNZfSsJFKWjp0PfTzSA7mDtpe1/ZnDGRAZ2QGOzCLFQandEMykYX64IN
	 faxkipwyqyjSxThhvuo2tYMJTwr5THkKLKdQ6Bm8xqNT/PY4IaY/aD/EW2e8KulKww
	 +BrA/LRAFa6xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30BB3605F7;
	Mon, 14 Sep 2026 19:21:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36F2C465
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D40F40076
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sC1yy5E9gq18 for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 19:21:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 99E7D40055
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789413715;
 b=jCdzJNBZcV5m8poebINHJqMQYDwtczEazVD+l663M3/xU4obNEmh+iPAKlmwf8AkcBr7
 SYOPG7AQkBV0kgZyqeghdv91iiRMw6ogxpOugHfkQe5ucs18zb0X+eyMZa2AMqY+bPS0D
 n60YqpW2GdZcnYc/eG008lpBEhFpV4T5RxXCmqn4qOQm2bwnCGRN/ToOzsshzSqhdto3H
 IwyQS6Sz4zt7VDCsBrvJCo9VZXbv/zlQjMoxEe9B5DxntVjCZQv3KYv1qXhe8Svh6bbUd
 NaY4kotZeBDuzprXVRdVMw9KL7B26Lg0ZxQjlfBAedl+bnA7icmztUtCyA+WPUUQCKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789413715;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=C/8PuU75eFdqR/xCjmy2Hot6WEa+BcX4+N4H9a3rsV0=;
 b=qyFJeI23nx8hpGSOlTN/+B0B1q7yliTBBmXajIQCiGODNXQ/oNNMx617khzJh6sY8Ixq
 qFCqw7bs6Ona4kXpApZzHH5pEx6HNX403svU6/CEyip8KpKbdgBpUTezKPMpw9ran6sB1
 9x5mXv4wDOdh6oXCevvfHNaicm2Og6OVj6ldEd3TIBFo8FM+91w8RsRkwxBi7AtviRmLq
 Bi1KLG4cOWj92siSP6acjeohqEqhyWTG/5Q/XCNx9HWWsV9+gcrz/zpN2awO6shOWl8/C
 YR8OKE3vt1BNN5S8hPMCPlF0X1FyXmM0UBWM15GaOYpalqKTu6N6kvqGDaJo4UY5+2A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=R1Xe9paP; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=R1Xe9paP
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99E7D40055
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789413649;
 bh=C/8PuU75eFdqR/xCjmy2Hot6WEa+BcX4+N4H9a3rsV0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=R1Xe9paPtxNjuWgD3BJxsLc/zxHQjnTqi8TKlxqm0SeUzldtkIy+xhgA11lR0wrhs
 D803WwUPocZA69pj2hVtP1sMeCl+bpIcUBIkTt8p81brp7Bj9Aow76mWAbNUH9Lzx/
 TwY5TpoSKBuPxEyuea0aBS2LiLIJhi+9XlUbwz9+p+Ng2kQyMe1yc5mqI2Rs+eZCoG
 Bw2IeSN8PjXqt9/r5XZ4dma5+gOHiEjOlKHtsya7UoCAIyrM0cOCHb1fB2C2oO5gXw
 XDo1hmMDmPcgZSAFqG0StfHxcjGvumF0OdCWm7rOOWls/xVB3HHo6iWn710X1gl0gC
 obIitRGjEnLew==
Received: from fli4l.lan.fli4l (p54a1b732.dip0.t-ipconnect.de [84.161.183.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E4311A4C4288;
 Mon, 14 Sep 2026 21:20:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49450)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6CET-000000004QB-3Ufj;
 Mon, 14 Sep 2026 19:20:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 21:20:43 +0200
Message-ID: <20260914192045.1648017-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914192045.1648017-1-bernd@kuhls.net>
References: <20260914192045.1648017-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 6/7] package/boost: remove dependencies on
 Boost.DateTime
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
Cc: Marcin Bis <marcin@bis.org.pl>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

Boost.DateTime is header-only since 1.77.0
The Boost Release Notes[0] didn't mention it but it was introduced in
the documentation of DateTime in this commit: [1]

This was bumped in buildroot in d39d8f7cee9b4634e6f490020204f63fae419e8e

So analog to the "header-only" move of Boost.System we have now to
gradually phase out the dependencies on this library. Ideally before
the stub is removed as it now happened for Boost.System in 1.89.0.

[0] https://www.boost.org/releases/1.77.0/
[1] https://github.com/boostorg/date_time/commit/33dc6136f193a100c753c819694d6d11e9ab4123

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Downloaded from
https://patchwork.buildroot.org/project/buildroot/patch/20260205152211.3297942-2-buildroot@heine.tech/

 package/boost/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index a9ab4836b5..7b78345798 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -95,6 +95,9 @@ config BR2_PACKAGE_BOOST_DATE_TIME
 	  A set of date-time libraries based on generic programming
 	  concepts.
 
+	  This library is header only since boost 1.77.0. Building a
+	  stub library is still supported for backward compatibility.
+
 config BR2_PACKAGE_BOOST_EXCEPTION
 	bool "boost-exception"
 	help
@@ -200,7 +203,6 @@ config BR2_PACKAGE_BOOST_LOG
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_ATOMIC
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_THREAD
@@ -359,7 +361,6 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on !BR2_m68k_cf
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
