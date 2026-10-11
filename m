Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FE0CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A8A340581;
	Sun, 11 Oct 2026 13:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sG0BPoNyKGau; Sun, 11 Oct 2026 13:02:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 69A2240585
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723735;
	b=ZelM/zPd/vjrbWmBZlAefaMEyfcgz9NtL1l8YiZ9W9UEjcaiS7KVa7JS344iN+FK3DUk
	 SlMmjIoV3tbesFlnmZM29t2utQIgix6kunUjFrygU2IXrBCl1+ObAOTG3vt519n2qLpXZ
	 EkdvK7IFUavJaz+m3Yw6XEDqz0uTq595d/JjaxSwcEghbd99tb7rdjzJx+84EAQW3AYAI
	 SfCIMEQTGezJ6jvc0MeYOh2yuVtLt3CSzFD+3x+HEruDZGLb3Txq39gpYJuIcje58zE0T
	 EZC8OWv7AvlIh54N/Ns337wifIQupZp778UZ2pNIIJhB0AbxMu4tbinlbmd4yO31uQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723735;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=D7FFb97c0EcP3JaWcu8VVUUFL4Ij3WQTEnb2DNmfLuA=;
	b=APjfQLK4JH/aJxpBEkESQyJj8QaFs16enJ+HRZpJ7Pz/kOCjTmKr7mu4mUqKa42aL/kw
	 idO+v2PxTMNtXw3qIOv4X8IM8EKXK8YVlGWwXLg8CkG7ot0qFfz+24Z0tdtGyEWxaxxkI
	 rhusj/+qCVV7k/qe3SHKRpR6g7ihueiZG1GRMgSt2Arwk9AUFdz5VbSTs9h954i4dCj/F
	 PEmZD5ErTBuxIZ+0bLgsdBJtRAW3K9w6pULvAK6XFqAdNiTsnd8UQVAKSIpqn7kvyFUSc
	 6pfdQl+Nx8j5ionpfHQpbTMYbjWCK+pmUcpN6X6qquxwqZkkGxyjOiZ9sh/Ykn9XK5Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723735;
	bh=D7FFb97c0EcP3JaWcu8VVUUFL4Ij3WQTEnb2DNmfLuA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kTsVtNHeh922jxrAud/YgeYDa+Qj6KqAeq2VeeuPh7pPrhtWOgo6jgzdVE/WFPBSd
	 jJWiEpZZg01gNIJNxgNVZyQqHKq/2UFHxRSa9cL4qZX1FW9zvPmKnm3cBmeYmKI8o5
	 uqoqY+b1GXOFoRRuf2phozx369twbV83TWExnkNhSsLiRYZK/oxRcvvijlOq2/2Xir
	 qsW2ap7Tmc7t1c0gELgV3YU6dFEpuH6ncrkJkWE+oYNokM+GrC2stUFXydoCO5j2b+
	 VMlmwVX8Tp6Lx3YPaHbbbks6LX9gVibTBZj3RhCUKcoBOf0s9dX0AP6Bdu2sr+K+1N
	 ROT2AbR8ptvYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69A2240585;
	Sun, 11 Oct 2026 13:02:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C96D111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E97040071
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmlLGznqE40t for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:02:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 741074002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723732;
 b=TfLjd1iJMStSxEfwZN5zMmNubj/JDkBWQKJX9QhwZ4u/patYvN4h33rPrsbCRa/NPgit
 ATDZGYDAHOslEsYak0K+dUuS7UTpAhLfRrhjYGKXRg/Gxs/Us06zptd+2Bq48eX4cSwxT
 bptvWi2E3MZpJyJh6cARN0WuEzFx7jWh1lMFecdHu/oF4TUjjfdhkhredhJtu7gpsaVFZ
 svtwjQ1of+Y31rs0yoWdz+KMutFgIvh2lCWhRsFUKQF0PWLlXC4bYLBnGOkhcLsAQvkNy
 UGhMM+J/fvYjGhvpTNJHfv29UoIOgZrcLDJnYbhqckQ/LwYYiSLAt4YkvIQdy50Rx7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723732;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Ut/pk0gcY4RnO2BEwl0uS8lJrnhv6IpoIDTNG+ESVi8=;
 b=nquu07OQ64FpvAurW0QHVe3usZ2RPaerxDmSG7+fdWrPNML0x9eHW8Y/xXYs9U24h8VO
 v6K6WmikBIfVdPPesjL3LS/4nYi9vCd4xA4shFI1cnTKBpVOaCfyxm3V5hlF7k2iHauKk
 zFvFhkJo6VeTLUNnSFUS+W10yTUPzvBRc1eB93bzQ/PNjIIIODH8BRlbGySgDJbgUG8Gr
 KrmHaVY9ib+ElL08Vr1bAYwc49wTwMG+nC30wpmwfNb8WS10MGyMAkwlLqTmNUMWzvfbD
 gVE3zwp0didkbfi4fcNebdEXgezZHY/CeYPMJ7rEQeHb9K2vtEUKtGFUom3jZzAxnVA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aX2MPacg; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=aX2MPacg
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 741074002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723661;
 bh=Ut/pk0gcY4RnO2BEwl0uS8lJrnhv6IpoIDTNG+ESVi8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=aX2MPacg6N42OZhOqIzmJ46Xo/9GJgXLzRjbl3gAlrT6HopQbg8BTqSDvPS+PNLne
 PLez2CMjJ801Wh+l4Ut66/0fVfRlGV72Ki7MWGZn7uPYEbPexyX9Yb3pdca5JAFCBf
 DGzSJcsV0x6Zpwqh5C6Bnx8AbX2wKL3CwcpU8edqA44ohzbnqs7DGC1g00ZrVFfq7k
 U2pop4e33exb+dmCwbXS1cYovrsZwPDP3MLC0e3sCJmNA75ngSOjDC1K5soUMEowbK
 qch3C//x2ojiIfr1Oyx2a1yATjsqY5ygFlKBDzFbRArI6NncVc55+re7r/yjG8ehaO
 FUl49Kx86wwOQ==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 noOGQcXIJZWu4rlKIHdRN1BObtpvvj2Ip0IBb0wXPCxq9a5Bk19pbeZofW+cCqLaH94jO/ePJZr
 Avx5SvqKaApykv7zEoDllrg+JrC/yNgvIcB6Awd1Fj3Etl0m7jO7PV1m2849qJJuEzrf4eTji5w
 yipJbc7951KRSu7esq3S8MQ6er7CwZXNULs0frikwBHcABQiiwAEDd8UucYdDYb8kH4QqptUSy8
 kcx++oq1geOCEgCgCtnWpCQ3Du/OSEmfBknw3U9VIc5pP6SHAl2WlCKbho3omQXzcQotivou6Zn
 XcBkRos38tPMb4pMWhQXS2N9zH4lnkn2dFPawJz6YzX8ccMiZt8C8C1IapXWKORDmHW+r1z8gEX
 jrpyo30moLFlqvMCepHqK5U9Sk+Rl3O/58MMVK9+6SYXg+2N6cRjpqxbath8JnS4oWO7BTHdlul
 uu/snAI8BcAUXLF7Cb3Ij0lWtVmGobujm4SCv2Ly/l5+37ELDrbq/eb5d+g9Wx5PWqdhwqaVk6A
 PmEWChOoxwUaEFiSmUAArEu36b4cclienCPzj1RZEJ+jvbSh20gLDKtPaleK5ESQe16XyebpVSm
 pqTuI8vCLHqfzl1jodDkolFBGO43sk0i2lHijtNsoAbAt3k=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1292DA4C584B;
 Sun, 11 Oct 2026 15:01:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAi-000000007Fz-3qjr;
 Sun, 11 Oct 2026 13:01:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:11 +0200
Message-ID: <20261011130058.3443432-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v9 06/52] package/boost: add new charconv and
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
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
