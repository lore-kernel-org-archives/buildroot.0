Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99177C79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 418AA80F5D;
	Fri,  4 Sep 2026 16:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCcrCT8goqvf; Fri,  4 Sep 2026 16:48:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 34CFA80DEC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788540481;
	b=QvkysoyawNWktXqlEwWiSTEjpBjjkJQmFUih1nSIx8wrgV4MdhYgpbc9VETF6A5EqWAb
	 NQpubmLLqAD15NP54KJF5OGRY6CzAwxD/dWuPLKEwq9I6CRDJkrxsD0YdTqI02vW/56rU
	 CObvVbHRPCcfjI5H3QFht4VxZvwTM2iTUZJwcNgPFSTH8YE4g/+6ILhGkAPtmOZTbAC+r
	 pXRfiRn2FZae7kQTbdBkhhuDILdWM+YCjNkCz9jkiUs5GoHfPhuBHYB9hLbcKQfpemZrq
	 s/6iePQGFMFjvWWBnWi+8VBgYZGPfPkIMt5gLZZWXnKcRDYUbX5QJ5TAYpJ6j82SGOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788540481;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=CGzYLHvG3E6+C6MBBnZoC/x/xkZkyQFMndRpO8T9igo=;
	b=UvwFifiFmxTD2srxw9VG+QKQbuUD59YYrOX/bd8tPE4pvdq05pSVwIPqcOcpk7FK9bAE
	 KJJBSrub02sFYmQ07ukPVh77+nNaLJwYkkzQJ3RzKbr4Gb3R07tZx6+7Bm3cuyb1bxT7h
	 1tROysVrwGQgMmieMVPswua1DasG3J5yrhKj6cMW3pQt7sbwTAvHh2KsDqKsh/MjbOzcq
	 6qYGQVJQQ6ucWPrKqoSnE74dDnrEPN89UvKS+I0i0Yi4aukmCR+ghPTeapmeRHv3jSTvY
	 o/LKQrJQitscj/d+154hDSqHXO+PfNjwhJ9xZwiTE04v0zG0TjVtfLMsS90xhLJ856A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Y+xikGPH;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788540481;
	bh=CGzYLHvG3E6+C6MBBnZoC/x/xkZkyQFMndRpO8T9igo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i9GM1Z4lB7xfwZYez9JnWDS1OS3kQMnezSuYzwZcZml+iDOTpa+XYHh4WYMjMUy0d
	 pxmTV93MY6Oj1z35XL5pjH1FCvbgq+fjqijGv+sN3ruf89pceZZdquQUmUeXmUlFll
	 KDdPb05KqzNhBaTJU8g/e1ZIHgHs9TM+JvZyygqtsHYJFaWtcrbuPZG2Erl5MPTKHU
	 ZqQutKACIJHIB3vmsin6zXa7/b4UoVmupO20CbnaK2lbdYkHjwCbGVsVfObvjk8Y98
	 ZfFypjBiWnJSWQqNKvLi9+DUZugv12S3yVZgwPdMA43iv9w0L//gXqooMeFkchLI5f
	 DLkGepsSTUgxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34CFA80DEC;
	Fri,  4 Sep 2026 16:48:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10FFB388
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0247680DDF
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lzjhmKjKdDG6 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:47:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8E13280DD8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788540477;
 b=bOSEo7+boCwEohXWOEPGsZmcdrN+kxUnKftEYO4eMss8jK7DvYAS+eCXdClNgg76V6Q6
 grLJNs2c0hzZh3fbGCSTZZE+jl0lYF9aYzSdnkwbr7EQ+aKxMSnOR4ie5eV5+4k86ku6X
 XrnQwyf9gJ3M9FYMrSR2c8Y9M+6MaRs7xuejXOurCehNwVbUaX91UEOW5Hws52bsv1DaU
 fp2+14Ed2MELwUfsl83HRMx7rvVNNlUpDs84qsyKowCWW/RBmkn/BPJNV6WtoLnt7lCsU
 cM5LO6MPC1kO4+UOINA8SrDVQhHUCl3sQsLhyM9qnPVnOok/mzfcOuacZmioNgt5RJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788540477;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=h9n8/lHFdh2yAMnEyMc8in2oKz9qycWuJ3YnM0bgkno=;
 b=IVnS89kTysowjDg3fyna8VeuS5RHyfIC6pz4N7o5W08AllDmoUt8C+uvUhvGJIkNt7cu
 QBVBzP3soRk+7mNDz2+wXtJrX4pPfPoyCLEp/v60nMNk/m2JA8+v2vidcBeUdvTOwgWcO
 2TrKrjBZH1dW2ChJEjS68raAUpj+863h2PuFRCLCiYYQd5XJyVOAYqZ/QcZTMgqB578Bm
 ysEU6AVg99z+ouj2x95nhZRwngOLw0pM4sHkCJB4CVz4XosLeE3NOg/9CBD1bQ3DIti8h
 c7TbUMM9DvoLF7s21CUZ6uguT3cOZ6Ym8QDZKmznEWAfiEQzp94uq9ooZQE8swIaOjw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Y+xikGPH; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Y+xikGPH
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E13280DD8
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788540475;
 bh=h9n8/lHFdh2yAMnEyMc8in2oKz9qycWuJ3YnM0bgkno=;
 h=From:To:Subject:Date:From;
 b=Y+xikGPHEKGaAFnf3AJ8y5RUbEmbDXCVfnbSUZVxPKxn/H7Nq7S09NuqLjCTSn1QN
 coOzSpocrJUp8kIZhq+BdeBUA7ISBZqX0vZ51g6UR+kWJignJ0q39FyLyHa2z3RCPz
 fl4cl9Ankl51yWsA2R1o6KAG2UTMnhu3PhjDoMfEwJVLFd7nZ0vjSACwgbnopUk3EG
 XrLYAt9rmAg2iTSk6MET5zWheWhcbgGvHEY36Ye7spqOpVgpDWyaECs5ypvMLgN5Fc
 7oSz1zdkdw4e+fPbplhPfFPX5sYPkGzOpYiqONtHxXB5RKxfks2wVKwzUat6tafud1
 4Vv0C5QCxWs2w==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 085C2A4C0370
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:47:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34286)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2X50-000000000gz-37sC
 for buildroot@buildroot.org; Fri, 04 Sep 2026 16:47:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 18:47:54 +0200
Message-ID: <20260904164754.187571-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/utfcpp: bump version to 4.2.0
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

https://github.com/nemtrif/utfcpp/releases/tag/v4.2.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/bf92a0e4934d9f793260bbdab67c8f300b292216

 package/utfcpp/utfcpp.hash | 2 +-
 package/utfcpp/utfcpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/utfcpp.hash b/package/utfcpp/utfcpp.hash
index 779bd2d282..454903575d 100644
--- a/package/utfcpp/utfcpp.hash
+++ b/package/utfcpp/utfcpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1ca68016f0abc24172998e39ce0d8f8e2b7a26f7579a0ff85d4e1b9a7aea56f8  utfcpp-4.1.1.tar.gz
+sha256  54a8e96ea835a7359e8e53d03e30e9833d51350cc4615ff53f8449ef19ee46ab  utfcpp-4.2.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index 0ec08bd54e..25cdb20ca4 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTFCPP_VERSION = 4.1.1
+UTFCPP_VERSION = 4.2.0
 UTFCPP_SITE = $(call github,nemtrif,utfcpp,v$(UTFCPP_VERSION))
 UTFCPP_LICENSE = BSL-1.0
 UTFCPP_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
