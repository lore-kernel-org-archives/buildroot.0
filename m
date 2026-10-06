Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E60CA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD9D780DF8;
	Tue,  6 Oct 2026 16:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6EYTe0bPbNN; Tue,  6 Oct 2026 16:31:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DC9FB80DAF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304283;
	b=Byiy9fB35SiJlyF5hkjhkInEgqnj2RNQlHmbEletPa9SYbWFa0eXBuR7IwG9VET41b3S
	 erqkbjD3F/5ZT0G65ZKopjk3yo4H6+4Dr9yEdJLoUusYzVdTG7Ux2msVBPKwHfnC+CVSg
	 hnPZ74FnUxCThtlx/KcUsf4EFPpt2xKxYcDImiNcf/XTr91/oK92N5USSKwHBKBetfs+p
	 coF23XlMcJRQVj8oWM8KHVcuWvG0dHXw5Sf1vQYH+Y/PkF0/qcOu6ZmpQY8d23rnwYAhT
	 Cwilz6eYHFHoaVmHxUtS5pq/do1WQMXuPd10lK3RwkZB4987ukMEyhnELvwbBvgnFsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304283;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0P+W+h5Xn3iyVxgqeyjcrDoZyYBePQqnoCVj3jDUi4U=;
	b=qBKv26hIeQE0eeIKCP8F6uSRAE0jJHtSPA29j3PbBak9QdV+DuUJcksHESj3/bIzafNV
	 ilLPrDz9H3YYFhdcyiKY+WPTRgpy52NcajbNWn+ybDAKdDzi++DUH7TeDHH8nqJDp9bnh
	 cGsU0UsL9ze+QLi5GrBNpqe54Lc4MLXOdRA5upVz1dhnblLHFwcK61DQO3QzK/f4K8qYF
	 KDE7kp66C5qx8I2FmeLHwRtDcdW/VxzZ+EAGmtV9cO68X1C2K+BE3ze3ERkHepLLjQ8N6
	 MtYmBEGzp2xb2snu64ACMpxAvmN9AoAN//M/M+E5qyQWKA1jYfQ1ZTpRQtZUcgtlqjw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304282;
	bh=0P+W+h5Xn3iyVxgqeyjcrDoZyYBePQqnoCVj3jDUi4U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P67ud7iDaXvTE9TLF6S8zpHzOw+twUpwLQJiXEjsecLjfe9MCshZ2i1li8ZdcCafL
	 ZE9d+wvm1D+5wCVfcTdPJj0NF3LOYvhan+nwyoWTnXfXHSVkppPr0ZiFrqqtTY+Jw3
	 n9X0NucKhcUWGp6ntUSlq5y52K8aqWjfnOUO1S27AJB2AGIFkg5h9exFtko04qHF07
	 xFgLOI4qppT6uqiZP5FUcUv/WpzDwYDcqtCd/9b27U+z79uuwrzlXo699lG2FJXeog
	 cjuEv2JRQAfG0s//FIYG4M7xbPObzgK/8s94YyDcl/qPubgAUjQAOW04SoE6VrSOlo
	 OP5uuugaqTr8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC9FB80DAF;
	Tue,  6 Oct 2026 16:31:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B081317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70A00405AB
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeh9ZWjgHxYa for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:28:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BF4D84054D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304109;
 b=lU6cS/xpxDQaY4KZ7gr+c/yTMF0DyyuUPXRCHGoSenuXRYwJ7VgfdA7XUubBEMiftmUC
 p6DJg+rvv0UfxnBwjbekbuqV0fpojlBSbkxFfH8/BPkMqxHNI8sIx5vct57dGApeByDBt
 0d+Gu48ULZGj5Sdj3WzQmrA4X0fepCn5DUgfjAjDIbWcEUWjExOnTFKn0IQLAW9WYx7mF
 QcjxXS6krCvbVOYB1eikR5WgnWOAQjAYzDi2gbDm4r29uJXAaM9fhRAbSTY6KtFSU3fwJ
 6MnHfzAEDROgwfAt1SRZWIjyQ3/PX9HIZUO7+kj2U4EdP7SpWq0k5Iobr7+S9K/BGVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304109;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=vIDNoHpVeJZB8z4EGtEfI6I1XV+Bp573iBXq5YpjQFA=;
 b=Xi/y6T66RhCTxLW+Wq84P+6Qb7xyO2QdxxwPxPv0CA3OSzkXEYa9QQ6HEOi5r8U8UPS0
 XgI0l7kK00ke+rjfmNLGd82uLsHy34gqFcLKk933xXgMvXtsqzzL7NVngQeuNt/iTYTSs
 YnpmuuiOaPDhrZkVlLX6Jc5f7EH1DTIfKM001BWFtv06I39FPDCtIMn4P0bFNiDT3voG8
 6RmcsinvFUpN3H5k4wrPH7o6wujUwEzpQEQknFSZXkVlVWVFWqkMxZSBveZ2k1ihpLX03
 gzkoeh2I8UV2uG6yoncepH8pzych0hHRZZIWJU22toZdcYaoHFLNacV/tR7n9WLmZEw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="V/bLtRAY"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=V/bLtRAY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF4D84054D
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303706;
 bh=vIDNoHpVeJZB8z4EGtEfI6I1XV+Bp573iBXq5YpjQFA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=V/bLtRAYnHysv3hc+PcUxqpLVHv+xyMydGTQob+5js3ChivTn01L8fvQdTSWQKZzp
 /IfvxB3AfB5AbMkKmmjoV7vSwncud1ZtKqsg0C7NszmkuUpQp9PJxLth/x7aHYkWp9
 bBeuGjriYqaxOXM1hzC/VapLKnVBry8bVpl7ldHr7A1VgAYZ1DXPD2cyeKEirpM0a6
 evCxRMWrRxss5DeuRuhcKKH0obvysP1xJC/qj8j3WCQ2hcxP/fOXndIrZklLiPswWQ
 YH/tZGZ4S0QIHjlD08sWGz29A8TZ3BPD2XU1grvUwockfpTHvzyhr+UmLKdtzhvjal
 W9DStWJk6dSjg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 u5vbOpVvPcizgasBd71XHbnMH6I3eVC6P/TEt6jvobmoHduuLDt7ovatslLk55gZ4JEiqwu/ejr
 LxbC2kzA2Jmux9NOZoSXhQm4KGLhHPo/fqHf/1pKB/5T9sFLoe46EHiuq8dHj3fqQr8E5EbRUyz
 i2L76genSnb3S4U8ajDsOT/TdS133uCqOWnOpeePZzdeV5dbmPpXscB6RfYtVdr/MI/DeEX9Dgy
 +fuUz5xXfVn079mGS8Pi5Q2ulrkPwx339KGgHFa8g6UnxCxQsq5L671sJoa/aUjwdYwKM718CrR
 2gV6qtU1K9i332tLZA03SO6+1WQyvHnvqMEcn72tfuwnSRSPcBEF3snaAO8esdZBtaMqN9k4Q1l
 gz8lnDQqqNrJtOXCPM+OwQX+e5EElh0+yKT5+gdLhTNGZY7knKzuwrng89FyC7/GwU//5y1zk4r
 B6wtfJcoi+guxUzdQVrts0iDqQgdEmrD19CMGWINwKzJF7efmeJiL8/qs506hy2hB1H/KBuqOJ+
 p2DbExpxw0jF2qoMkShatYrFjoCZHk6aWUnOrV9isyHKTFUN4XNKLaREc61h2mX93QXAmSgio5Z
 3yzABYpUvn3t8B/LUnkGNeg688/IKRmaiUUotTcrr0V75q4=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BC46AA4C53C1;
 Tue,  6 Oct 2026 18:21:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uh-000000000ir-1lU7;
 Tue, 06 Oct 2026 16:21:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:53 +0200
Message-ID: <20261006162106.3439373-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v8 12/84] package/boost: fix coroutine
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
 package/boost/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 929a9c3869..f22f263538 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -102,21 +102,21 @@ comment "boost-contract needs a toolchain w/ NPTL"
 config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context, boost-thread
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
 	select BR2_PACKAGE_BOOST_CONTEXT
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  deprecated coroutine library, the non-deprecated coroutine2
 	  library is a header-only library and does not need to be
 	  selected.
 
 comment "boost-coroutine needs a toolchain w/ C++11, gcc>=4.8"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "boost-coroutine needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_DATE_TIME
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
