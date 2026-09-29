Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063BFCA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B787960821;
	Tue, 29 Sep 2026 18:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGq5Rtir7WDq; Tue, 29 Sep 2026 18:42:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F066C607FE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707345;
	b=r7lUJYNTfVnKyFQnX65M8L4L2lRkAo3n2DKdWLGsq+obqIfvCFMx89P4Xdh10K39dOKR
	 i1EjSVJLHFF+z11luUcsBB38RKnRJhBzvy3aC0znvCgmQQ8EABetgMIGdrcolgdiys1by
	 RaK4BoGSZuOy0rVJridTGEv4rShB0A21daFf62YdlR7ASwWxkcxX8p9W8MpTOeGF5TBp7
	 a/9sw42ADBs5hw1gHmxCNTg9CXKIOnAlXWfk15X2deyyYhDwJFvOF4hhdBzLl4h7edxG9
	 hiUQLrD1+0CBoNrE3Cr99XIpikPMBsmdwXnsy8BSH5bEiEwsJnNa+ryBYVGNay0+5Dw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707345;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YfKC+Kl+BGZGiQQpIWB6PT8YEIRLUn+iWmpQGdD5dKc=;
	b=rPSPTwx7B1FSQ3sr1NVHdTbL1n1ARA7tlItTEe6B9IQVl6BWTc6e5pIPLko9+ho/gphc
	 uaiglzySdkKCdlZYJRS+jkry79C3gorQ8tXOzHLgUg9o1OBdp5vJ4uguRyqze70RmIHBL
	 qsjarT7RIDDdYBCMc4sxH9azO4PqpDj6S3ZBcbmm8V85StH4D9KvgKsBfQgQfb0pRHuqW
	 lyDqZ2T8z0jWH56ACQ9mkUKOWSRdJoa0uQGCmsaMVqeRV4LdUP6LdDkvSnaood3uIwOV5
	 eYysqc6e5/A3B/PJf7ZnCEOlxPp5u3vFNPCcbz+3OynkMNvqPjHtRJvT0Vbm0dqsekw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707345;
	bh=YfKC+Kl+BGZGiQQpIWB6PT8YEIRLUn+iWmpQGdD5dKc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pW4fJS3z66icUq5zOjbBmazJv3q8V37TpeGTSgbUF7DNcwSsg0jruVsJT9G8envOe
	 jES3GTp03xC56JaCqJUCiZNpllrk5657R/kJLyRD31YuZtDYwdW82LxJCPDFibjnNQ
	 6mWmj7skm2HfSTA/HLYeV5mHQfMI4Fh8Kn9h/AjthlQnFAwPU/IIqvp7GTQ2zzDuXh
	 olHY5AoIVVnDiDvsFnj2OxoYAL84KaMmcgXeHQn0Y1W8ijkcOC0yGpHjmAwe9MxAvz
	 YouorkN03IuOvQebQjyoEVGBQJFpMlZ0tlL2i3HaGdp9nzYsTmal61ekUmO0Pm0GtJ
	 o22DlrkT+Cs4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F066C607FE;
	Tue, 29 Sep 2026 18:42:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B617C14C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BFC1403F9
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xzBr3M4xn4R for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:42:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DB321403E0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707343;
 b=grB98Uik4ZNjXulsE0dYPrXhS9Aiyqes8NraZEqw6bJMN7dEnwr5LpOFz1AW1Up6VrHP
 eJld30DSIUieG63LHH5qU6O97geiX0ypwqJ5kjlhjNJVlALoJLu3fRcRQIwGApOlgeT1N
 Izm+C6T386yNnmgVRl2PqBy3Y7m27wB5KHeuxBog++w818kQaQiccpQ8HVk4DEoboL9dz
 svrSvCSfO7tR8JtQo3r+R6VOqXCj5JUN7JqiWn4Bshs4Ombxed0m+aK3kMruDpahoh36G
 aLkRVk6l7rpSoLsv4+0mbi+m7iISERMuDOuH/TR69GeldG5w2nxS4+nE0rr4tpQZrcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707343;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=M42JTivrBhsHDoQUvX/Le475/HZyQDAofYM1kdnENtg=;
 b=lM5CmVmjZPNPSRcwOBhovwUMOUhPMqLZjwfB5gGN9Mn1mlw3vokZh05sY/gkVV6ArS8W
 RTWZN43eLOlvM6hGiTquazwfzad0gqvHTiWs8x86uCJpQbKQTM8Sc7zjWVZlGtcIn3ge3
 sKhHCgFXMmXrvW9UBlrqNGGlCdmq0GWTIQq6ybkkRXnZEQm3nyqzuOfdlmtKa2b0/KdiF
 uQWzPSXvredIwdkGPrBzFryA2rCdbmFP8RC/ZZ0bhbE9yYQUus+wvOBLvsgqKTSrDMPFk
 7Uds5lSP/yCekTStk062ybIPcXxYcvUO55OMX6+pwL8jaI9YZ40iiMRwHnGyE0v8t2Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BxOFdIU0; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BxOFdIU0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB321403E0
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707026;
 bh=M42JTivrBhsHDoQUvX/Le475/HZyQDAofYM1kdnENtg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BxOFdIU0FZaXal4n0vmEo0RbfDL2aWs+BmDnUv9ObuGuFz+rZ5YuY0qYsk/4TxV07
 PlugT7Y797hAUr+227FTegOwsztv5ynUomDCFPfp2WcqqvVtJf70lcdDjPSMc+2FnQ
 iNAGwyzeHjZPp91AEGTqpux6vkUq2wYzUC+FOm4cwP7C39S0TpX16nc9z1Gha+x9ZA
 41L7ZGue/aIsPqbGidYQlb300FYmZBJRihSx7uUxxvcNoVoJbKfYLz8AmiLvAekC/t
 SDe1FyhG+GKQt93ey7Y7FlOzIBPo6JQrjPYMSftjsDsgpCh1MbQkoHj85ZPsy6+u9M
 B135BRLgbEunw==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 Uea9AdllMa3CZ0RUuH358pc4qYxCBJmaOXf0lwkmJZFX8E6Vf2HO1D3S26gNwJEkZhS54fVOrKn
 tWRihCrYkVRRY30J7b9nLcM7Snt8oQU17NdgBOh8GPbESSn8qr4W2ds5i45ChnCcsT44atXPu7u
 u6FXd/RRXLr2q0o/Sc10PQ/kH94kx95XOwAgJkoT096ukd3UGBN/FQi/6oYjPD9VRE1NzGuycbP
 s/kCzM6OhByQlSjS+Hm2yV/6cgM8bkL1LYFwo7HM7NTenP2NwzK+rR0S7B6p9kxti8jn4Efs5jB
 tKAd3zmdZVoLgN3t5IpLJv9hUxxUtU/zmX13Ch/h2piV153lrEXBssbPkQV+VUfjkkWWIcclRkN
 dK57O4EEBnQMwPgudyZBBulOaX4Hybl7/HrYc+3uh+ITh9/wb56EzO4Vgu1y+5s9nwR8Kdcb4Rw
 fjVaqY/DsP+c9HdDnVLjuorByVI/gY2FuchkQlyH1Z8crWX4LpDfNHRhCWPIaThEAGFoau6hV38
 fNdxAU49Z336CYwneRWgGoXXjOofC+fadKvRUPUlTUt4WLMKn5cgIWa0XsiU/Pd7aclLJLO6VMb
 NKsr3xFX/KuLH3J30yxSB5OGKq3JjNAetCy5uXJYWfr1sbE/wgz0NmTLMHv0Q5lcMRXmyQwtraY
 qeIiQQDns57Dwli9Nww==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C3E7BA4C51D5;
 Tue, 29 Sep 2026 20:37:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgf-000000006Jn-2h42;
 Tue, 29 Sep 2026 18:36:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:20 +0200
Message-ID: <20260929183607.1849293-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v7 21/66] package/boost: system: update
 description
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

After removing the stub library in 1.89 a CMake config
was added in 1.91 to not break 3rd party packages requiring.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Johan Derycke <johanderycke@gmail.com>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Simon Dawson <spdawson@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index dede9b946e..5eadbff2d3 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -424,8 +424,8 @@ config BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Extensible Error Reporting.
 
-	  This library is now header only. Building a stub library
-	  is still supported for backward compatibility.
+	  This library is header only. Enabling this option will
+	  install a CMake config file for backward compatibility.
 
 comment "boost-system needs a toolchain w/ C++11, gcc>=4.8"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
