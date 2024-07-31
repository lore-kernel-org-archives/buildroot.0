Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386E6C3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 08:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1F3D406A1;
	Wed, 31 Jul 2024 08:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZRZOZxuvg72; Wed, 31 Jul 2024 08:09:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FB6D406AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FB6D406AB;
	Wed, 31 Jul 2024 08:09:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C94911BF57B
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 08:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3B2780DD7
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 08:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDbj0cvI6LA2 for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 08:09:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6002D80DC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6002D80DC9
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6002D80DC9
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 08:09:21 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9372D352115E; Wed, 31 Jul 2024 10:09:17 +0200 (CEST)
Date: Wed, 31 Jul 2024 10:09:17 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZqnxLYzxD9Hs2NiM@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722413357; bh=cHW+pvf1qZ4FBLDHPynVxdPNXX4VJjeDVHfK/yRVirI=;
 h=Date:From:To:Subject:From;
 b=kMb1OvK8FK7u6F7b4046/Zq9exFbZ4YG77c6siu3WGzBtbk9DJaT/bChV9ITNVNp6
 9Gr/fEkld9VMfff8badmGLSo3HvrEO/eBibGGs19aQaF8ss8AlyKcozWihOfgygHLE
 F+SP8Av2LU4t4RBkcWHShze/iLZhc05P3lKYRIwMLgf9wGfT6YL5idV0G8nnGwQE/O
 7aDkpCnbk6Qdt1EKkBOne6tqPtLk0flXT9tf0QLmf3QizxbpyUd/quUwUKRn7CqEUZ
 U8qgUi07VCuGMEjwfBi6qI+NmDTi9IxOM2HjW2NSe29nfXDSElQHJ8kBxItF2Xptdp
 Ck4Erx6cLvSLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=kMb1OvK8
Subject: [Buildroot] [PATCH] package/strace: update to 6.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

See here for a ChangeLog:
https://github.com/strace/strace/blob/master/NEWS

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 68b9cc5f93..dcaf1ad5d4 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.8/strace-6.8.tar.xz.asc
-sha256  ba6950a96824cdf93a584fa04f0a733896d2a6bc5f0ad9ffe505d9b41e970149  strace-6.8.tar.xz
+# https://strace.io/files/6.10/strace-6.10.tar.xz.asc
+sha256  765ec71aa1de2fe37363c1e40c7b7669fc1d40c44bb5d38ba8e8cd82c4edcf07  strace-6.10.tar.xz
 sha256  1988d0e1aa101d68855e8c4f940aacf2531051b82f6b608eb026c5fad1f33df1  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 908aed6653..34a154357f 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.8
+STRACE_VERSION = 6.10
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
