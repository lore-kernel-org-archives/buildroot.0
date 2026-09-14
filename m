Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FA6C88E75
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 22:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90D76606F0;
	Mon, 14 Sep 2026 22:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 293cowp0eEjq; Mon, 14 Sep 2026 22:52:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6C62960611
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789426336;
	b=ayrVCLjrI4hpjhVmeLrOTsyShHVgHUW2WTqBKZ2EiRSHiAML1r0BU3NBnynrk1M5G9xr
	 hDhrsZ2egaMgRSgkWhNaSwcn14fazuW0Q6zSt0n1esqhkdHa3Ye0sRCGWBpyCmcCY6Bxc
	 I4fU+bJtIYBpUUCK4A7jOJJOC/awg3ouwS4KCcbHnWsWa5kNqXg6YXFuccwxxmjGmfXTx
	 KVMHTS/KQ1keMauS7fGKc3z0qEcqmNIiJdZk6hZfVmLUxpUwRO3991BV2pHikkWn2tQ1H
	 0DV5P2fOINf7sLffUQO8+OrxyngcxDKRAbKoK6pRFSMOYJpy54OxUV2ZkEWuEgE91Cg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789426336;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=pZl1lJ1c9Y6FNB7FjuZh074xupn3cP8rXfdQfZjfu+s=;
	b=Hiz2hQONLN17WOstosel/TYvm8+AOJntml0dIraULY/OndsU0CSU01WbL8dMfiMgEDeV
	 B5Oe+JXMwLp86GOILruckC3UtumjyEM9hOQMldH8+BH1TRbmHVhtMd2l5bHNryLwsc39N
	 BaY3AhXckWKnC1IzBh12WyJZE506QpO7V8Lqum1AxMu29Q+1czibns5sTuQ8+vlgwZgyA
	 guW8Hj4pJjz4bgrozRJtZai/UnTdcAl/SNZibrDyoFBE/t1dNlqnZ/3tnwg4man19nlpY
	 KcDydAvAXReZJcJZ5RYxfhihjYTZGDgvewaTRGGxgdhfj9azs84A8IrkcfiSy4FtwsA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789426336;
	bh=pZl1lJ1c9Y6FNB7FjuZh074xupn3cP8rXfdQfZjfu+s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TaADaFvh9u1OVtls5djUtwxYs+H7fp5dE/ENl2xuYnxoOgZSUaST4ji/B0UWrIfOa
	 Po3X2y7DHnWdMEXVHspkOI4BI3vOvctnGNmKIYSV6I9IljR0kFpBIOOQX7x2goLtiz
	 Lvbd3RHEemg+uFDwkPMSZyZC/9yBizy7iZajqGtCkcBaZnveVr8fQPQNs5I9SHqYwy
	 WYzP+p3xBKxtfUqQVXwzrhWUFVdRWr/hb8/0NUtwq2zKPe/mBO/kKig1/icwYN2hod
	 OQHRN21P0k9jhqJtqhyl03ZtC0QuFJqoSoYUrxoM41G1O+3nsjS7CL/8GvjYtTANxa
	 iu91T4dOsjJ8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C62960611;
	Mon, 14 Sep 2026 22:52:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02A68362
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 003B540080
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wz7QkPlkGlzq for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 22:52:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ACE8040076
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789426334;
 b=m7HXPNkLkdb9mDYuBRPVQO37SF7oEvHrhbeZaBlu6eAuCunn7oY6Q/WQpstPEGFbvZTq
 fE/Y4ccNJzmVB1PvrZoaPJBtJ9dCtD7x8lFyk5p4JzMaziebBAB4lKUZqFDqyqyAEhqYa
 ArKjkuuRAjDqWHOodjkjnZUL2iBh8lSF09Wigj5dq7eKO/HEWaV26uzxA7HueUWrWGtBF
 YqvJxhazqLeVtKwi8eZrjwFk0FTfV+USGnmVSJL5CZybClVq0+5pmsR6tPjPd8QpbrIY9
 A4lZv3uvBS/2tDHLpWG+nIzkinIBOpjiL4y7fk7bROqjwYdjnnI3g5dyMysEGZMnRnQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789426334;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=K++1NPMCZ5LJDL7+LOdU7jojOYC722qnVuMg2TV4vYU=;
 b=Y1UJawPGJNe/ER7xSImnyG4dbWKi+qFEaxO93axsV0DigO5cxjEPuAKVAkGTzdleFP5v
 YEH/kqeEg76UpQhlOJxFFfCXjkSPxcw1KnWSc1hFd3a2NHG+kqDINTJh6Xb2KxX6DPFre
 vmqzSe+Fh8h5JehpQe5nC0JV5BFsSSYj4es0H2BXQ9S0zUBmmb15WkDDeJR8meYP89otO
 4kaTpQ+9bTOQONQpgD2f7sSgA1qA2AO0YrHs3ERyUFpEYKQdWTtmUko7jG/CvPa2YTKVy
 N66bleTDxITzuvJDsdWbEnWNv4OE2E3ytJes8LztTttyzXo5T44Efpm3f2NqoR+EwDw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mkEM27i3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mkEM27i3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACE8040076
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789426318;
 bh=K++1NPMCZ5LJDL7+LOdU7jojOYC722qnVuMg2TV4vYU=;
 h=From:To:Subject:Date:From;
 b=mkEM27i3cC62kTOZw58P7PqR2SDNolYin7K1i8Sf/6dbzLj1RCB6UsbLl1kp3x5KS
 62RdBbnvR1gC+bqi/fItovyc+qg0GZgYXDgf3C219EE4UgL/y+0GYvoW88zqfP1kKw
 e/6WPcL0kHOT1ALzJAA+WQNGyD9ix1K8MKlPYiqTTBGvzRelWg3X4Mf6V6cNg3vFmN
 gtDkDlc0QuFK7Z1ZpUCVgngkI1t6UcOYiM4shPNTwR6SV2bZl4+2FQo5Eg327l4pvp
 sYedGd7xCe8dzvMJOcnYyMeSY9vzgDUKS7p9zm4Sp/DghLLoQTDps3vmKto2a2C//A
 VRfuAFxCTs/pA==
Received: from fli4l.lan.fli4l (p54a1b56e.dip0.t-ipconnect.de [84.161.181.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6EE16A4C42A9
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 00:51:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6FWn-000000002aS-3gF8
 for buildroot@buildroot.org; Mon, 14 Sep 2026 22:51:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 00:51:55 +0200
Message-ID: <20260914225157.3786041-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
Subject: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to
 22.10.2
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

https://github.com/intel/gmmlib/releases/tag/intel-gmmlib-22.10.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/7e319a3379342ce37f1a0e7b1ce1e7c704448ee7

 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 0d65167829..07bdbeca31 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  33ebb6e65a2617c59f95a9e70ce0cbeca098316cd265345a0f4db5b381f1024c  intel-gmmlib-22.10.1.tar.gz
+sha256  94d0038ef92bb65b86d08f004197c56f8d81f82f9ac7a25c202a88afd653a30b  intel-gmmlib-22.10.2.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 6fe5c1c067..e3e1cf5a9a 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.10.1
+INTEL_GMMLIB_VERSION = 22.10.2
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
