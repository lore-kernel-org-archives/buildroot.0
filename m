Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEEAD58CDC
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 06:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C0C9824CE;
	Mon, 23 Mar 2026 06:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VN4pbwj4hqW; Mon, 23 Mar 2026 06:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3A92824D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774248066;
	bh=YJqdwjU5mJYaR/fWVXCMTrwl4k7UN9TDObpMJGu/tmc=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=neiWrP5lebXAiuO0FOd80zJ42GTuWRXqNhBQnAAqo8ZM6y7qYDQhtTeTktRuh8ot6
	 aWUvPUom+AHDHEoqGkRKPdMYV9bUwnGo/8VSdiJIoNUX312KrQXQ6xhqIrMJlgmjPo
	 wGo80OvKSL2kAErWUJmJOs4Kcnm+zxlb6Jk+dNWmR9ohg7RmmZzNZD0hU25FB22KOx
	 nmfUwhhD54oFyskkjx+vACOVpmf+UqCeoEvvA7oTaxwLZCe8MZdRUsLULJ36FY1Lgx
	 hUPdmLlW1pjtN7vyaKHlr1xdvuchRX+5eByE7waN7rebSk4B72ki5isNeKa66kox9H
	 Lkt93eMLLxkcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3A92824D4;
	Mon, 23 Mar 2026 06:41:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9B86353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 06:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E049240AC8
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 06:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6flJGW44X8B for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 06:41:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A25340A60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A25340A60
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A25340A60
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 06:41:03 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id F221331E0C16; Mon, 23 Mar 2026 07:41:01 +0100 (CET)
Date: Mon, 23 Mar 2026 07:41:01 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <acDgfd2FRjjG4J3M@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1774248061; bh=ZYY+SytwCMb8RkZ/aWlyEuH68hGASTvDQtoS3r3EzWU=;
 h=Date:From:To:Subject:From;
 b=tPpW012udJRRS/NqnQHh//4jObpWT267M1wfT8d2lRYT9RvXz5sP7d2Oel3C4RZ4B
 oNRO1L9BwXPQOSdeQKsMSKY4LlgulPGK8rCMODMFcutSh0YJ1hszSiyuR6zZot6QQ1
 QLUlRr2CQl/tYf2eGiEjQ92deD5RLUsSM1jj+8GuXDvo9jxtMI2yG5clTDGYqn+oyi
 NO62OR/MQzAGXz5xHXYIMVY9tTjrbjwzqLV6pZak9WMrloyJVt/9b1iEBnD817s3Ys
 i0HTlfjn9vYEtfetyf5QQeD5eP4slSJ/YRGVRp9Io3sWtpmay2nBpOCwLpw0l55IMc
 E3tuP16nHxjOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] DEVELOPERS: remove Waldemar Brodkorb from zabbix
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

I am no longer interested in zabbix.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 26f093fa39..87310f595c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3435,7 +3435,6 @@ F:	package/mksh/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
-F:	package/zabbix/
 F:	support/testing/tests/package/test_ruby.py
 
 N:	Will Newton <will.newton@gmail.com>
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
