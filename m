Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED03ACA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5C6281099;
	Tue, 29 Sep 2026 18:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0T45zGvgHry; Tue, 29 Sep 2026 18:42:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B85D681095
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707320;
	b=RSaTqCH7vNm2ME3uTW/tuh3/XQBbAclgnuynbkV/2Z1NcA7c2RC4PoU0RuxnT7LUQbWY
	 FAumOlWBTA5MFpRDbm65gIPucuud+oo8fN2caQsPKzP4FUqribUYRzau+7YF14GXmkpo2
	 BVDssbv4e5Grvu49hyGsxH+XLuXoQb8Bs/d53/7SaJ6Y2nibwprgFvcfudj1txJtu+Iki
	 x5SQbW7lGn5Vsl2K0gQzY8O7MbQZk2nSTLjapON2jXnpPBqa6XmAlAS/5lXvJFBeieyAm
	 HgHhbidITh6e1eDjx0l3VEPhFJJapDQgHxFa4/z5w7BZfueYkJJZI+QK2qo5tMf1VYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707320;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8Locd4M04kYftXmb/t1KKgxgWLDVf0CMRUys/i+tm/I=;
	b=pAabGUKuAM+GaPRQliBDHfiJ8WPl5gRE6TeElV12+p1T+ApA9LT4ewpVxJ6WLPuREhpN
	 t0W/UKeCoSo8lph7FOwFfiGKKlPOKUMaR+WPhLO+F+CVFVN00YdtBugS3otgBfJk/geF0
	 xliP8ycUI+1PQZACDX2ZThqZO4fsVJKC/5hJOgnb1VBa9FjKZxtg8/eaFZ83FeZkyJJrt
	 yheG8fEyYKy7SSnBsJl+rs7PO1LW+ItGU8aO/Qke5oHwlyG5uhRacRohMtvUKvVN898qn
	 g0sq6p2cpo/gkFmCpkClLDSTXmWQVJ/5KDD0ro9P6xXVE4YF+N5Qjp8eRvWOywsf4OQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707320;
	bh=8Locd4M04kYftXmb/t1KKgxgWLDVf0CMRUys/i+tm/I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XyAR0/1if8xArFrj8NF3IXse6Vq0/DbrdRxReG577Phb7yY/Wc4XX8pspOZnKZVPD
	 Y3V/xxdil/tFa8okt5fK9NsIkZSNyZFb91r0wuE5n9BuD2j9kX0ccpqe+c15RxXw/O
	 aeKDD5bM2zWO+N4IskWxYmrE17tK3Du53etG3oh8zaXylQ9RYcLM2CvhjQ57Rh2l7g
	 Jdv6YBMArJawnmqcCFWVN7O1SQvDetSbdHbMvIrzBJZJZmiJzkzh+Cl7dJq02CEQt/
	 u/kXLP/02W8QLSGHvWzbuD654Dj5zV1HDW0TluyDtEMyPvMgwo55kbW2Xa7NZ6TFzq
	 yoF95tcW4g2dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B85D681095;
	Tue, 29 Sep 2026 18:42:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB5823D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD34F4032B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8l7XZ3S5gMC1 for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:41:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A639F400D5
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707318;
 b=a7airjVz8IU8gRpH2syd6dBpMX4EzpEXG3mm2xb2dkrz+hGafQ1FSKCHFFRZ6OHW9oYb
 Tq9TOE2A4JXAY6qkuUwiYNAP5W+2rXjVtx2YUjr7mVnH9SBIRakkgAnpziHbx3A/Tf6Yd
 s/J+3Jh//EjlM7lXwSZfnuQyve+m8rz6VYzTXnXAII+R2iajIgIXLtZrNTb0n6oTCamJC
 GQKxu5wc6qf/wwJ4hNM9NlzF3daTXT28k2s2DztiHzwBdbn0qNg5+EG1MOD7MLUEXsQVc
 h7LC3kbVm0PGuQOvcgMkTGaN4M3w0ArUMuGt3cHRMP08ROYrdMAFxsOzO5dn7dYg7bQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707318;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=BoWGR6cSvmyZulpqradSBw52T1+FD3dN1TMX1/tS20I=;
 b=adkkbEXH+ISc4fy43HbTj9+3MkDNfjjEG4s9Mh3FPE7KjmvPOnCSwkc5Sd+H6wazOvqG
 ak6csdUXL/x1GikxXN/GMVnlhNwH7B/Qq2txNozjIGmKuB5RsPPvnUVIlaQYxWSoH7FNg
 48Pn/AoIVU1D/P2qVC0zznXw+qdjFZEXaYTRBFiymnNM03FkWDd5/I/7Nn+U/I0CDK8xf
 hybfmiLKGzORsnMn8KdlxD2Fw8ocJP8/1vWLbEP3oiQTBo0TzZ8u+7M9Y0ZHOR3KeMZzq
 yrEB5HBFDek/xvAVK4pgzK23yOwFkFlmtNCbZwwY7qZjL2BKKD9utkrP9shUbocWPPw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=L0QZqzIR; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=L0QZqzIR
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A639F400D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707026;
 bh=BoWGR6cSvmyZulpqradSBw52T1+FD3dN1TMX1/tS20I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=L0QZqzIRGRYdAvZh5MFF4wuO1Scmexi5EsDtnaX2qMfTivEPn1lNRxyytQQk+nX+H
 QDA/8cNNeV+jMaCWU6Fn95ZffvpfPoN71l50+N4RGzyzMI1PcsRLuiGFqXbzym4sa6
 fjpoXuqaODL+FLeldMBdKzhWg04vcnLX79z/X0MGAFZkS0JrQfqcnGr5Sk+MXlWYMF
 ZtIfxvDEhikUIXZUQPmSVYhBe+KY5OvL9OYb1CoGAFUXCyRd3GklLC4/QVW0pcUHHu
 6qVk5V2ni+zD2ys7yeBPagIEHxubAvcY/cStFsaEn56d4IXDWmXnWUS7XLKjfCcv/4
 N3NWAHxdEyJKg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 DODTTEv0Ys5deWEJltkDSd7t8IPhM4HR4pelWaGbvlwO+Ttab0IVW7B6LZTDio7vUGmNkBlHc4l
 4bj5xkSLWjxmHvTrx3pcGVFjVk+1/uGHvdwlVgpwrD0cFl5o61Y/zq5Iv6G52EZyvScCWhwNtBm
 s3gYjX27qjmSYFeXSy5XN/Q8IdvZqF0JoFgrKF2ffdQ+sWjzbB+HYJxbhXevnpaAEhoU60eyoL4
 VvahPdgoJKrzkkgP8wfnakQ0Sq2N4TwHDSjtNMEO06aRKWvsYNj0JeR2t+MvaxLDCFjb4+DVAnA
 0fdB4DTaIapHGCsLpT3AkCSsh6OBoELEY1rRfNeNqB4nKoHzaNWGSWmC4Mnm3MM8KPR/0pup5fZ
 1PxdvkE/79zNcFlrQ7imGQMLCZhbpXM2jjXcWVVhXSwvtwvcJsBdwD4eH6LDcY+rUsf6xcvVsF5
 NfHhX/d8ZCEbVjoa68GYMTuX9+pj9iustXOxdw6B7uVp8hdVXvbtUckFIlAnBK9XBqp6T+UD6v/
 p1BJ9XDvBAQ0TshoAmqhSEyq3puHFqS/YhYTG2kSlmmA5cFoKfQNsiofvtkkaYfqlGVO/lF2UFL
 HqZ/mDxdimwbIY8GGXgy44fIAswh3dhJGK71RYRxggUGquB1fNnO9Jq6jMQh0LiEGgRx2as0Js+
 YJoRMp4oAEiRDLu3ElA==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 281AAA4C51D3;
 Tue, 29 Sep 2026 20:37:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgf-000000006Jn-1G3n;
 Tue, 29 Sep 2026 18:36:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:18 +0200
Message-ID: <20260929183607.1849293-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v7 19/66] package/boost: update locale
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

- now always need thread
- charconv

this changed in boost 1.88.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Johan Derycke <johanderycke@gmail.com>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Simon Dawson <spdawson@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index d4626bf79a..93ba15df50 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -217,10 +217,11 @@ config BR2_PACKAGE_BOOST_LOCALE
 	# https://svn.boost.org/trac/boost/ticket/9685 for more
 	# details.
 	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
-	depends on !(BR2_TOOLCHAIN_HAS_GCC_BUG_64735 && BR2_PACKAGE_ICU) # boost-thread
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
-		|| !BR2_PACKAGE_ICU # boost-thread
-	select BR2_PACKAGE_BOOST_THREAD if BR2_PACKAGE_ICU
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # charconv
+	select BR2_PACKAGE_BOOST_CHARCONV
+	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Provide localization and Unicode handling tools for C++.
@@ -232,7 +233,6 @@ comment "boost-locale needs a toolchain w/ dynamic library"
 
 comment "boost-locale needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	depends on BR2_PACKAGE_ICU
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_LOG
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
