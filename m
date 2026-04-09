Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E477F364A6
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 18:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0D0F40DE3;
	Thu,  9 Apr 2026 18:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4QMRozJcPFG; Thu,  9 Apr 2026 18:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24BDB40D86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775760081;
	bh=DlkhftS2e/E5DsojoJHquT2mRuTcs6UEteXo7GEBqiE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jHfDSGuNZio7uNedA5w//nvwjOWaAobuSXaSYsvc763uBxCiXyghyzdT7koYlLPfk
	 MgEqPCGy29+YQ+Nrdt8VQhXojnlV9/U1zU/lSOcZm8jcAOWCZJqwtiXIX7YfPN4ZMt
	 +B3xT01o7m8gE4+hQSnopC/UuZhlAYxqoYJ4cHXuscKzF5tqMdeoMrUiHgZh7wk0cG
	 ubS4t2PORfg7BtCxDQYXnjjYkb4hE7k1Ws97nRzSjWLEb3PQ90vODefgbJwAGM9be3
	 iE4+zg/lbaTE7Dml9u+rqlHrkobei1zl2PHkSiY/cL8E2hsvNodHAdKeCKaQJUmeSe
	 pNJ1Z/Gfkk+3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BDB40D86;
	Thu,  9 Apr 2026 18:41:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A77BF194
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 18:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9917E819F3
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 18:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UJi1r6C5LWL for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 18:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C7C481916
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C7C481916
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C7C481916
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 18:41:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c238.dip0.t-ipconnect.de [79.214.194.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5C5F5A4C0E55
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:40:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57198)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAuJ6-000000004H0-3Irw
 for buildroot@buildroot.org; Thu, 09 Apr 2026 18:40:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 20:40:48 +0200
Message-ID: <20260409184048.3180731-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409184048.3180731-1-bernd@kuhls.net>
References: <20260409184048.3180731-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775760049;
 bh=w9fOdDl0fRGj8jOtKvj0INFwZkBtHgEfeaBx7OkhHSw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=CGrXUX38MeYE2tk67asHmquTrQXS9rrsGGSf4+hyl6mZK63ip95izhIJOWQWK0Hvh
 uttIUl2o4ZRNQ7bcQPimOG+BteOzFQbz0aku+5w3rgyUrv/nJIKllWzw0ZBd+H5qy2
 cTM2x2mvbQerNA6XWhXxkt/Zh5TxyZQbebgBKkKJgfwU3RIymNwdAQf9Akte/WQSon
 DeP+x05Sfk5eI4GGPkugGpU/aHTUOEg9aH+oPogKI8xbNNwKBHWdxF/XAVU2o2uAe3
 iwf3Wnq70qZH3KNMx2XdU9TVa1OkphikhVkpJQ9whM8/A3lghPKRfqeR39nM7xLWza
 fDzCt7koki/Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=CGrXUX38
Subject: [Buildroot] [PATCH 3/3] Config.in: remove BR2_NEEDS_HOST_JAVA
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

Buildroot commit aac3d2b402fd2b8b91f125cf9314f4805b88f72a added a hidden
boolean option that packages which depend on java on the host can select.

Since buildroot commit 5366b8f734fe7aff7e95c1f92627265c5a75becc we can
provide our own host-openjdk-bin package.

Kodi previously used BR2_NEEDS_HOST_JAVA but was switched to host-open-
jdk-bin in this series.
The option BR2_NEEDS_HOST_JAVA is now unused and can be removed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in                            |  5 -----
 support/dependencies/dependencies.sh | 11 -----------
 utils/genrandconfig                  |  2 --
 3 files changed, 18 deletions(-)

diff --git a/Config.in b/Config.in
index 0bfe6d1ab5..ac58c685d1 100644
--- a/Config.in
+++ b/Config.in
@@ -101,11 +101,6 @@ config BR2_HOST_GCC_AT_LEAST_15
 # When adding new entries above, be sure to update
 # the HOSTCC_MAX_VERSION variable in the Makefile.
 
-# Hidden boolean selected by packages in need of Java in order to build
-# (example: kodi)
-config BR2_NEEDS_HOST_JAVA
-	bool
-
 # Hidden boolean selected by pre-built packages for x86, when they
 # need to run on x86-64 machines (example: pre-built external
 # toolchains, binary tools, etc.).
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 9c2aeaf23f..f44723678e 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -217,17 +217,6 @@ if grep -q ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG ; then
 	fi
 fi
 
-if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
-	check_prog_host "java"
-	JAVA_GCJ=$(java -version 2>&1 | grep gcj)
-	if [ ! -z "$JAVA_GCJ" ] ; then
-		echo
-		echo "$JAVA_GCJ is not sufficient to compile your package selection."
-		echo "Please install an OpenJDK/IcedTea/Oracle Java."
-		exit 1 ;
-	fi
-fi
-
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 	if test ! -f /lib/ld-linux.so.2 ; then
 		echo
diff --git a/utils/genrandconfig b/utils/genrandconfig
index 5ebd552a1d..727c8193c4 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -113,8 +113,6 @@ async def fixup_config(sysinfo, configfile):
 
     ROOTFS_SIZE = '5G'
 
-    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not await sysinfo.has("java"):
-        return False
     # libffi not available on ARMv7-M, but propagating libffi arch
     # dependencies in Buildroot is really too much work, so we handle
     # this here.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
