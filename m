Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D1BC61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 09:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9519E406D8;
	Thu, 27 Aug 2026 09:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHrGbrnPAw5W; Thu, 27 Aug 2026 09:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787824533;
	bh=LHbrQdPdmfBaAB+0JDbW2n8PuF8e7QmHkAlfvQZ4+NU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=eH4PMV3te5/v7jVRUeLgk13XSagI5WL0w2aPGrIeH2srLDG9YsRm443P3UAUM07wb
	 MkBH+PkZ/VWSP0MwaqWZf4SyGae3ukHpBHfB0JiTAJT3dHY3LC1P51bqP05Zi488nj
	 4vWC4TmYWrPTOYJQykM4IR5VmzprZutiNxue5ilz9wpiD9au4IxtzCeMMAWJrZN/Kd
	 DIuYbaPhA3zo1ZKpKT6EHF1Yov8tyg8ENi75RD8kDWxhmDgJtne0aa7OrBbS5o8YOE
	 Vabw0YMFsuczg9iZG7uVHap/NFm2p7PgENNNICS72e+pvOByG7U8AhI5oO2ZSRiy8K
	 FhD4XJvRzbItw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC7F6406D9;
	Thu, 27 Aug 2026 09:55:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A1843AD
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C9DD402D2
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fS3s_ILSWx2 for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 09:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DE034007C
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:55:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id ED5884E413DA;
 Thu, 27 Aug 2026 09:55:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C2D72602B8;
 Thu, 27 Aug 2026 09:55:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2834A11C7832D; 
 Thu, 27 Aug 2026 11:55:21 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Thu, 27 Aug 2026 11:55:16 +0200
Message-ID: <20260827095520.1049186-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/3] package/libbpf: update UAPI header
 installation work-around
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bpftrace often needs very recent kernel headers, more recent than the
runtime version actually needed. We already had a workaround in
libbpf making sure that if the kernel headers are older than 6.1, we
would install the libbpf provided headers instead.

As we are about to update bpftrace to a newer version that uses
BPF_TRACE_KPROBE_SESSION, which was introduced in Linux 6.10, we need
to update this workaround accordingly and ensure that the libbpf
header is installed if the kernel headers are older than 6.10.

This is necessary for the update of bpftrace to 0.26.1.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libbpf/libbpf.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 5a6d574331..0683ec12c1 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -18,14 +18,12 @@ define LIBBPF_BUILD_CMDS
 		-C $(@D)/src
 endef
 
-# bpftrace uses bpf_iter_link_info.task that was added since kernel 6.1
+# bpftrace uses BPF_TRACE_KPROBE_SESSION that was added since kernel 6.10
 # so we need to update some uapi headers in STAGING_DIR if the toolchain
-# is build with linux-headers < 6.1.
+# is build with linux-headers < 6.1.0
 # Otherwise bpftrace is broken due to out of date linux/bpf.h installed
 # by the toolchain.
-# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f0d74c4da1f060d2a66976193712a5e6abd361f5
-# https://github.com/bpftrace/bpftrace/commit/7578314df67df6bbdffaf493ff3b4d182b235b34
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1),)
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_10),)
 LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers UAPIDIR=/usr/include/bpf
 
 define LIBBPF_FIX_STAGING_PC
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
