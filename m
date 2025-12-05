Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CFDD374A8
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 21:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A5A582313;
	Fri,  5 Dec 2025 21:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWzbbBXiI46Q; Fri,  5 Dec 2025 21:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE018822CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764970212;
	bh=MmIps65I60eyExcvU7ISfaCFejEzQxP5dP6nhnVN3Po=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=UaJjk6JcZAhgyvI5S9EGyH6AQqJdbXNVXRKC6D/rbZEqW6vRR2mw323LizCyKNyL2
	 iPjRMuukpleqLciwikbGjnArfIFp7XQd4xnp2CIbfm3EnTfowBbQhui4qGBq1tJHWU
	 o92wLzxoxlknec+gOIriqOIMmpnV+uJ6YQ6OJb6odfBfji64GMQtbgO6y3zDWAbBVI
	 o1czahuDMJwZgr01Au2lrAzMnthK4oRPIpjiWKIED6S1wxPSvjaGdYQIOm5Fb0d7jt
	 tfTRV+Pa62xfKPbEs8yQ7bciqDTxWAyq7qBmlrEjK1R3fK9Mi0TXqzNCSLAXe8t9BW
	 b3mUdUXKmCi5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE018822CC;
	Fri,  5 Dec 2025 21:30:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FED6E7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42421822D1
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygqc5vC3qOXd for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 21:30:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60477822CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60477822CC
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60477822CC
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:30:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8375DC19650;
 Fri,  5 Dec 2025 21:29:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DB7D8606AC;
 Fri,  5 Dec 2025 21:30:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 61A88102F170A; Fri,  5 Dec 2025 22:30:05 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri,  5 Dec 2025 22:29:54 +0100
Message-ID: <20251205212959.2082018-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764970206; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=XwBftSB+66tUY2k77PhT7x4Z4oy5kgBTDD8YE6WdqSk=;
 b=qptz8aQdSQgcFFdszkUgsLqdMDKgVItzi/6TS64Ir95If3qeqJJMc53+eXqovdU59FZ9Fn
 Dpe1GD7E/X/yRimHZZmRGgWFlinEgB+459aNkQP7zkln5+bqscouLpmKuTNyMNIPi6JiFK
 ckoZTHL99ssx+AVpEhSum8mKcPri9W9zC4pNoim38uQLD/DBfjsKVfx0fGq92It4t+UrEx
 Nd7Go2d3eWXQENIR4ZBxeE1BPiTdCLJCagEdh6oN3sk4akx9sJujVxRWtJHHO3Ux7k9FTi
 JqPP3FzJZSC2/gDzPHFWdTMym7suF5/iq0CQf4GbwH9mtR4O1CO943KHujAb4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qptz8aQd
Subject: [Buildroot] [PATCH] package/glibc: only supports ARC little-endian
 since glibc 2.41
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

Since upstream commit
https://sourceware.org/git/?p=glibc.git;a=commit;h=4ff55d08df0e6f11cbd217f4dca4532bd7d9330d,
glibc no longer supports ARC big-endian, and the configure step fails
with:

checking for egrep -e... (cached) /bin/grep -E
checking for big endian... yes
configure: error: big-endian not supported
make: *** [package/pkg-generic.mk:263: /home/buildroot/instance-0/output-1/build/glibc-2.41-70-g1502c248d58cb99a203731707987a4342926e830/.stamp_configured] Error 1

This commit was first merged in glibc 2.41, so this issue is
applicable to both master (glibc 2.42) and 2025.02.x (glibc 2.41).

Fixes:

  https://autobuild.buildroot.net/results/87e4b84f3aee64d041c3b845cb003e6b90649ffb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 9a4fe6f3db..b066616a01 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_x86_64
 	default y if BR2_microblaze
-	default y if BR2_arc && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
+	default y if BR2_arcle && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
 	depends on !BR2_POWERPC_CPU_HAS_SPE
 	# glibc needs atomic instructions, and does not support
 	# single-precision floating point ABIs (ilp32f and lp64f)
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
