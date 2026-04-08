Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B41FD5F99
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 08:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59D4480A49;
	Wed,  8 Apr 2026 08:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fC9bzjmt9NXM; Wed,  8 Apr 2026 08:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 730D880A88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775638536;
	bh=EHYIE+dtS9iNw2jbrUw5bYNsbvGQCUpCaleFyhmtBUU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LGghlasoCBg5IVYVtlNpXzAY3ipPqiD2HV3mJ0akcrmBYNMM84gVM1oyppQypSLwp
	 nPWXOmUIpKjfdhk7aHUKHpC/UcyHUNYim2oFh/i96XpnC29PTPjY4yx6ZrTcMKpCIQ
	 sLON47smIgy5ZKdnNLB8RjumUXg3AWZHVmPOdTZVwohyYr28W4sSiLRRc1pYO3Uvxv
	 fDjd3KFQj/HA20GHuZhr+KA5m+ZBFc8GcBFhoUXXBmDoy/+9malvXGrm2RUWcQEW7k
	 C1iOhjtiKzVWxZJq8rkTIM289FCJTPbWDoU4YZcehtyAH591cJXsiJpYMBOuqaHIvo
	 RnJ111OrsLr3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 730D880A88;
	Wed,  8 Apr 2026 08:55:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED67F237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF1564025D
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcYWoEI6XRcP for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 08:55:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C45734023D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C45734023D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C45734023D
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:55:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 675EDA4C10EC
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:55:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46450)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAOh9-000000005B9-0PkT
 for buildroot@buildroot.org; Wed, 08 Apr 2026 08:55:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  8 Apr 2026 10:55:31 +0200
Message-ID: <20260408085531.1641831-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775638531;
 bh=ADyF70JPPa2r430DtdF48cqFn3MxWN2TBJD+fIRhFmM=;
 h=From:To:Subject:Date:From;
 b=BrdivZzsNOU8u8QClbvv1UfojnaePfglXqPRFt2nzh6vb8p2r8013+sdk2tD+84Rf
 XmLRkMneh7A9qdC7cix9lz+CsTizULtop98rIBswN/uxoL6zVDpQp/2cEOXwd6uRuU
 pZlLSNDEbTgW7cyLTaq/Bh7WhJLk7fxzkL3COoX7AoACjvsw+TkntEAe8m2RisKqmw
 fMoOQvgRHH4ETGiAjBBwyFbivZOBiXrgYDWXkOC3LQ6NR9WM2OlclI0BI4iwD7CYy7
 RC9HQY2R9NbpnlUAZNSGwVQAR3Ghu8YNFAsDjn8JDO1GDVeeChnF2BAnhRRIqGDH7c
 5DRc4T+s/iljg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BrdivZzs
Subject: [Buildroot] [PATCH 1/1] package/libplacebo: bump version to 7.360.1
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

https://code.videolan.org/videolan/libplacebo/-/tags/v7.360.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libplacebo/libplacebo.hash | 2 +-
 package/libplacebo/libplacebo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libplacebo/libplacebo.hash b/package/libplacebo/libplacebo.hash
index a8d34c3fd2..ef6d5bdd10 100644
--- a/package/libplacebo/libplacebo.hash
+++ b/package/libplacebo/libplacebo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0d4adc5cbe7b3691c2c77fed1b9e94a00fcd2c2637a301aa2b522c093139e5c0  libplacebo-v7.360.0-git4.tar.gz
+sha256  8fb4d54ad9339e3530446f13b6a670b3819a00e295a55f675f0515d9dd94f52a  libplacebo-v7.360.1-git4.tar.gz
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  LICENSE
diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
index cb53248624..e03f224971 100644
--- a/package/libplacebo/libplacebo.mk
+++ b/package/libplacebo/libplacebo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLACEBO_VERSION = v7.360.0
+LIBPLACEBO_VERSION = v7.360.1
 LIBPLACEBO_SITE = https://code.videolan.org/videolan/libplacebo.git
 LIBPLACEBO_SITE_METHOD = git
 LIBPLACEBO_GIT_SUBMODULES = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
