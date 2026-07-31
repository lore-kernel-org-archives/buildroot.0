Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABA5C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 09:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFC9A40F7A;
	Fri, 31 Jul 2026 09:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id annul6RjTr7t; Fri, 31 Jul 2026 09:31:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75F8340E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785490288;
	bh=pOA/WN3tdVJc6xgFD1u/5HbGKEKXsWT03Nb5Kng1QTU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IDsrVsVxPmgyFcTNSSok041hV+jLtg/GdMyucGCgk/kuRsRIa1KwPyJ3HVWLVOzxq
	 2kocjLePZesKRwroiq+iwLVEYfuEbJm6W2QK/yK1LvuSXPnP63AgzEnf8uFmhES734
	 uMy/f4S8jLthRO6vx3lD9naa4DY2NL7vrNOQXYFTNAxumlEhmb0yTuOCMS2Na+xqS2
	 Px5NMIJBSByMn7836aEMVCO9sZDcSQc/79yshwla8eeZpgSeh4GnM8G1pjELodrTUA
	 00K8kmCjfqA9XXsQgeqv2JV9QQ3G8zD6ArTC/UDHpT/eI2qntJrdnzx5Xjj6WH1Jld
	 wnGsDSC+pFURA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75F8340E7A;
	Fri, 31 Jul 2026 09:31:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84B7123F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B3BB4045B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7bCFLeMDK8E for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 09:31:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.159;
 helo=fhigh-a8-smtp.messagingengine.com; envelope-from=mcdev@playlinux.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A5A86401D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5A86401D2
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5A86401D2
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:31:26 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 96E531400141;
 Fri, 31 Jul 2026 05:31:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Fri, 31 Jul 2026 05:31:25 -0400
X-ME-Sender: <xms:bWtsan5ASWwg9Y2JXzGqazsqciMOO_HZh94XCQvLeslej9k17d3eTw>
 <xme:bWtsatAq262HiYzm0ez51zNktBo5voYJNqTGVXU0WJXYfujbSSX3l_d_McabUY2Ji
 EmwkHQUZgqxlkft_3_6CLczwY3O4n4EbsjurGlLGSiNQEUcLUhA0Mk>
X-ME-Received: <xmr:bWtsamYkWzQvV0IcLnrQMcI0RxLOuH9w1JI2ondP3ob2mSRpv001zAELlSd_gd5lmS9KdPq9VgnCByjKCK7vepylyIIiWvawsZnQrKY>
X-ME-Proxy-Cause: dmFkZTGvxJ8SZqWrjCqW10lsVZOzt8aqRZNBDpS2a858DkfYz/rswwQJShNKVBG+vCmmny
 QzAuC16GZ7IfbdF7TCOCn/ZIkcC98ae8lkT1yJv+remH0eO75aEMUWVgF0IGF4GuZEKazf
 UTB3i661S94X1jVqydUH7Pupg8WfyOBqKD02FmoO/hLS+uS3kQs0VvqL+5wRz4wzIyzSQG
 SjLGtmNMCYz+xtZ5i8c7ig07hAZAtVRa94t+vZ7zLNhq7Srz++ldaA7mRVQn6Tuxc/jAC5
 4xAVNUtz0Owh4Bd19Ir6SLpum1OeRStibn4zF2F2kb1L+n0yI1jXYfO6XAOgFa2BQEuhcn
 nRT3Nt8wV5aJkVljK1n9vy+gNtUkIsNegXG2fAoTFMBw3l9UZCaQu1TPkEdNRXeG5SNVjB
 nIlqqK/ED97YHpgkl3Oww6N/jmG5/Bnlw7yHtxTl6YScqyBA7SHIWpIS2HkAHADQOKXwVn
 SNuKsiXDzYHoi3E+6ksPQzDRGC3KMEFbbR5esGX7wrbAzlPN1yFgN8QtHjKg8rlwOjS0yT
 YSPZDv9u+LYF5+SEtiJYT0iWcOId+3mFGjZJg7Y7U7T3HgeHTPCUsntBXi6IpzeobT58L/
 xDUksEHQw5Lm7U/4uTx5tOZwxh46aMRPaLDJcve0UOUqLOJDozHZJq1HYWfA
X-ME-Proxy: <xmx:bWtsagbkuJIOA1o4tmqsJrob2QCsdQ2u_nUOxRzWmJUOwWepGasOCw>
 <xmx:bWtsal-ICG1yj2le86YjJ9MmGRPhZ-HGu8uFfzAM4Kj0h4okiGO86w>
 <xmx:bWtsanh42wkiTaa1jNipzNlScfQZz7zplzpw52BkNGQRRqYxPFm1Zw>
 <xmx:bWtsatdQjyxiOza6IF37R4XbhX10GMu8ltYKyMosktWj4CSGPukwTQ>
 <xmx:bWtsap1P4PpBTBvXAco7mn27_b0yF7RedqkvdJ9O3lfB-Qj8242Fkucd>
Feedback-ID: i0df9467b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 05:31:22 -0400 (EDT)
From: Michele Comignano <mcdev@playlinux.net>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Will Newton <will.newton@gmail.com>,
 Michele Comignano <mcdev@playlinux.net>
Date: Fri, 31 Jul 2026 11:31:10 +0200
Message-ID: <20260731093113.81116-1-mcdev@playlinux.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=playlinux.net; 
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm2; t=1785490285; x=1785576685; bh=XseYdvvlf/
 kVeNgJ4TBrBGMcBZHamdy19yErtHdmhg4=; b=INutiRZNRs1FcfkMvNh/riOoYs
 LmlGgAohnmZRqmKFrs8F9p+rD7l+EBGicaQIFH25q4oGtZR0BvpmWhz2Rjoy+y+J
 5ppNE9/uKNIVyubvvmKsf6Jqecr3glj69ooRSqfVlzFKfzIdkcV3gJQb7iEgQx7N
 4dY0Iz14WnokHH+VP5vSbHrtpvngXupzXMbovmutk739M/S4qMMwuXCzr1Jub6ao
 Frx4rlA3TD0K2D9CVhpkfUCqTlXgTw1gQ3lqHVFFu1AQKV+0H4byZGgyf7m+Gh40
 fd2D3AUQxYb6WMDYcxgam6etSC65B8YmqHB4bqp7vbAqk5kAmVmf9qwuuZug==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1785490285; x=1785576685; bh=XseYdvvlf/kVeNgJ4TBrBGMcBZHamdy19yE
 rtHdmhg4=; b=WE0s6l1lv3ZQv3klOeggVGYmqCE1V2jwu/C5JrY9FgNqxEHY8pU
 fBZREjQO6/bJbcphEFsCoI1MJlK5REcVAlnIqnCdlERvp1ZF08Avuo4M0YW+Nk4I
 hDhR6nmAAMk4utNS4zID8p+dTELv+5neSnlMI8DU2QcfjbNJjwF9yTWA4DVikCe/
 R5Or2scDXhkNOKXHLEoRpL7wKwKUZwEApYLIf83N6VzJjP648zsyoRnVGeKlwdOt
 4xfZCtQkVBJmsrYTNnRLOJHZ/d3uC7O+nlRHdU6Cvaak9NqvNfUgBCFofYVGkqqh
 j7LrJ8nEDJ+tzn0XBa0dVJ0U6IR7kKkAV5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=playlinux.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=playlinux.net
 header.i=@playlinux.net header.a=rsa-sha256 header.s=fm2 header.b=INutiRZN; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=WE0s6l1l
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: bump to version 1.0.9
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

Changelog since 1.0.6

- 1.0.9: This is a bugfix release, fixing minor vulnerabilities
and expanding the test suite.

- 1.0.8: This is a bugfix release, fixing minor security
vulnerabilities and expanding the test suite.

- 1.0.7: This is a bugfix release, fixing modest security
vulnerabilities discovered by A. Ramos.

Signed-off-by: Michele Comignano <mcdev@playlinux.net>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index d342eddc9e..b1b943ce87 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  827250db649546cdb04bea01f5f0560f0edffde9130e256387d1f977242eaf98  libmicrohttpd-1.0.7.tar.gz
+sha256  6e9adc446b08083ec03d40317fb66ca6f2e03e4f6170aef33a6e59bb08db2012  libmicrohttpd-1.0.9.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 605291c046..c2e585adea 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.7
+LIBMICROHTTPD_VERSION = 1.0.9
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
