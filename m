Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70739E87823
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C54C60893;
	Tue,  3 Feb 2026 13:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTFM7ROK42WT; Tue,  3 Feb 2026 13:06:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07BCD60896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770124016;
	bh=EZ5HOBo7kQiZJcqRqlIvOGLsa/MeqCwoXLBI41LwSQ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=UZ1xl/fa3TJE47KQAw2/G3u2d4o2ZLOizgQp3b4DafbEc2tzychtFtCrFSfgdzGVH
	 M2kaIqomEAk/4J/N/fOGoyN91Hk2vnWrIjN55j2qo4Em2anRvxnYLpcH8djObzt0K+
	 LSATmxG2matEXCPV8JKGKuafANch3MBQVmxQyhLXTh0GTfuAKlqS08LD92cnE8tNaA
	 uBLg1x1IOcVvlua41PyelXQb3AF/MjVfU1pfNXt7MXSilbvFSIXusboHDVd2T6/Uqq
	 j5VKf9bqh7UcHnwfTheS6BX5B8pgTbOBSylf86SA4RCLtlPYFNpi8cQ+Zq+KvlMeTR
	 6ohKuggVAem8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07BCD60896;
	Tue,  3 Feb 2026 13:06:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4457DF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F24683D00
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CEHcTqtUH11 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:06:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F3D883CFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F3D883CFD
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F3D883CFD
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:06:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8F8DC1814B9; Tue,  3 Feb 2026 14:06:46 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 14:06:08 +0100
Message-ID: <20260203130610.1891941-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1770124007; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Sk0lI5DjcJFWwwkijdG4g+ZsKFiJSSqDJa5n8q7HkZY=;
 b=lDOBnfGT1kEoUWCDuZ73g5mBTXsy2AhZbc+Znlw9uAG/ud6tgzSt6E1UjFbGZKThNLeCtl
 lwoYAolQjNkBaYHGUKe8n3KpspQyVEXqLvycn+pgb4FnEOUMzmFDdXDNiaq9thJHcVInGu
 NFDCImDU/D/r+/NeKr8BORP7pXxfE5I=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=lDOBnfGT
Subject: [Buildroot] [PATCH] package/bitcoin: drop dependencies on Boost
 Libraries
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Bernd Kuhls <bernd@kuhls.net>, Fabio Urquiza <fabiorush@gmail.com>,
 Dick Olsson <hi@senzilla.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The dependencies on Boost.System, Boost.Filesystem were removed in
v23.0 [0][1] and Boost.Thread in v21.99 [2].

This was never reflected in the Buildroot package so do it now.

[0] https://github.com/bitcoin/bitcoin/commit/07269321f38e46e9e02f16d7cd135ea90692638d
[1] https://github.com/bitcoin/bitcoin/commit/b87f9c5edf3895df9650131fcf8551c3ad1d7301
[2] https://github.com/bitcoin/bitcoin/commit/06e1d7d81d5a56d136c6fc88f09a2b0654a164f9

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/bitcoin/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index eedb0897a5..66c8ebbfda 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -21,9 +21,6 @@ config BR2_PACKAGE_BITCOIN
 	depends on BR2_USE_WCHAR
 	select BR2_HOST_CMAKE_AT_LEAST_3_22
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_LIBEVENT
 	help
 	  Bitcoin Core is an open source project which maintains and
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
