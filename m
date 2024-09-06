Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6757E6FE4B
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 21:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 930E840881;
	Fri,  6 Sep 2024 21:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4A_MdtRZnTA; Fri,  6 Sep 2024 21:56:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80979408D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80979408D8;
	Fri,  6 Sep 2024 21:56:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4D81BF37A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 21:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D1D560646
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 21:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPLan7UFzXH4 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 21:56:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 77CF760638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77CF760638
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77CF760638
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 21:56:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc3e.dip0.t-ipconnect.de [79.214.204.62])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0450EA4C0D95;
 Fri,  6 Sep 2024 23:55:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39062)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1smgvp-000000005ny-1SXG;
 Fri, 06 Sep 2024 21:55:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 23:55:50 +0200
Message-Id: <20240906215553.1737885-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1725659754;
 bh=pCjVL2VkcwcsabW9/sILfikSC6F5prPIolO0AwVMeWo=;
 h=From:To:Cc:Subject:Date:From;
 b=k5rNgS6ciCHYkzvUExIonoifKW+IQsgSifgJiO7wSLcvc9RqN5c54huRerOOcRMJQ
 DLSL7qmHq3ZL5QwDfGGz6JHhjZYcATt44OUCevAJlUUnENaRmULwD/bo7rvwnKf3Id
 Zquvju69gOmEXtj7WiuM8j/Do2tHKRzUBhE9PWTeNO17+9Lxdb0VEWtSLND3m5gwWL
 JilxycRQw8BgHs0QFKdlSH+3NyafelGRbDd0hHx7mNbDJ5ByCwP4xT2Y34YJA4o2Kt
 CPWgNpQGbkagU/0hptEOtqGAaxYl53w4XJJO/+GMijXyrOh62/DpI+27spcKYb+uD7
 xxd24+IzlnCJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=k5rNgS6c
Subject: [Buildroot] [PATCH 1/4] package/libvpl: bump version to 2.13.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libvpl/libvpl.hash | 2 +-
 package/libvpl/libvpl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpl/libvpl.hash b/package/libvpl/libvpl.hash
index 16034437de..0e7abd1e19 100644
--- a/package/libvpl/libvpl.hash
+++ b/package/libvpl/libvpl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  efc19e5a8544704100f814753eb5e09e85a68e3386508b164042c1f1f761bae8  libvpl-2.12.0.tar.gz
+sha256  1c740e2b58f7853f56b618bdb7d4a7e5d37f8c1a9b30105a0b79ba80873e1cbd  libvpl-2.13.0.tar.gz
 sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/libvpl/libvpl.mk b/package/libvpl/libvpl.mk
index 773e52be44..8a75ce22df 100644
--- a/package/libvpl/libvpl.mk
+++ b/package/libvpl/libvpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPL_VERSION = 2.12.0
+LIBVPL_VERSION = 2.13.0
 LIBVPL_SITE = $(call github,intel,libvpl,v$(LIBVPL_VERSION))
 LIBVPL_LICENSE = MIT
 LIBVPL_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
