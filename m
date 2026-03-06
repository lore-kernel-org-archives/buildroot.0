Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B294F513EE
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 03:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F2C34094C;
	Fri,  6 Mar 2026 03:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibI9EXL1ycWd; Fri,  6 Mar 2026 03:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D10024091D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772768713;
	bh=lZHruOLEajaLzz7JXpterWS8TmbEfB6G2Qxhx7Hvdt4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M0IdDq5XJXi9Ek5pg8IYcpgRC2LX2lm0z1UUJjttT3beI9+ljOFAZb0ivdURqXzrP
	 +eYktGLmpXovXHhTK7aA0nVPKCjqdPuz5o84kE1ruIdkaYdppGqQGxBS/36Adta78E
	 /BPMu3Re9gq4hKMYxgwqP2Qr1CHeVSEJitDmXbGd3LhlceGVMjZK5j6EqydVvG9Ib5
	 jNMQvUGNXujTXw9xyAJ9ESHyStXD03u66c2Bk/HoGq3GYdcY7reH416MC4xOMS/R3k
	 bwUxI7zjauLsjRgBlPyf7WdymZdZ4PSClZEprNg9lLd5EgPq17ffu5K+ETy3cl0AAH
	 2odS33mN/x9/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D10024091D;
	Fri,  6 Mar 2026 03:45:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84A60223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 03:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7673B81A0D
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 03:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tn5N5ZtYgTOj for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 03:45:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.101;
 helo=out30-101.freemail.mail.aliyun.com;
 envelope-from=cp0613@linux.alibaba.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B189817AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B189817AF
Received: from out30-101.freemail.mail.aliyun.com
 (out30-101.freemail.mail.aliyun.com [115.124.30.101])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B189817AF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 03:45:03 +0000 (UTC)
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0X-M-cN6_1772768692 cluster:ay36) by smtp.aliyun-inc.com;
 Fri, 06 Mar 2026 11:44:56 +0800
From: cp0613@linux.alibaba.com
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Chen Pei <cp0613@linux.alibaba.com>
Date: Fri,  6 Mar 2026 11:44:14 +0800
Message-ID: <20260306034417.613-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1772768698; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=z6TLguiF+yOJfIYS8Md+k8eG8JZ8+cUbDKo6NcG+UmM=;
 b=Vz0mxbqNzbaMS23SfdGjdLkfOwLLratihPKRc6PI8R0kxdETkXc/qK87IgFslYbbZ6WGWPn9lif32VeFNyP/Kj1aDpkV+bv9IrcP71Vi0nx6IhTSJKciNV6xyQ5PyYljVRIX6oYg5Y1NHifEnyEb61oj7PKdYWDFCuajT/r5nxA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=Vz0mxbqN
Subject: [Buildroot] [PATCH 0/2] package/ndctl: new package
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

From: Chen Pei <cp0613@linux.alibaba.com>

ndctl is a userspace utility for managing persistent memory (PMEM) and
NVDIMM devices on Linux, enabling configuration and monitoring of
namespaces, regions, and health status.

Adding ndctl to Buildroot allows embedded or server systems with PMEM
hardware to manage persistent memory directly on the target device in
a lightweight, self-contained manner.

Chen Pei (2):
  package/ndctl: new package
  DEVELOPERS: Add Chen Pei to ndctl

 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/ndctl/Config.in  | 21 +++++++++++++++++++++
 package/ndctl/ndctl.hash |  3 +++
 package/ndctl/ndctl.mk   | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 60 insertions(+)
 create mode 100644 package/ndctl/Config.in
 create mode 100644 package/ndctl/ndctl.hash
 create mode 100644 package/ndctl/ndctl.mk

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
