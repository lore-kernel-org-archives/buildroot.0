Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF465D1BDC7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 18:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B518C841C7;
	Wed,  3 Dec 2025 18:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAZbKjOEfMoi; Wed,  3 Dec 2025 18:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE0A5841BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764785266;
	bh=UYSa/iJUmBSMMvSvDPB+SWao4iWgwT9LInrvCyHf3B8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HSkCj2OpflKFELuxrpRMZ9tgi9qWpKEiPi2EMtq89hGmmtqjjHWTW8hnWhZpsk1Cw
	 bQMBfj+rPjVZORulJIMsx5xhgZqQFiQmzy944dOFUxomsEsSWQ9SOLsa679+lIGoSL
	 XgiwFJY/NWmxL4Hf3xUJrOC0bRnEEZBHF2QGCxbOzFs/QzmAP4p+0qv1phOlq+fYYA
	 DRkI9K3CrvJd+InSTauyTBkDhGX65gawP6uWGPs1K44BpSZIH2YgzD8WvEMzu7iBHX
	 A/W2mbGRVf2k+iiKVJt+arAxnCNy4rEa3qDyNRjaZNSxa7W8RV0ZdoieLtsIGTaFDh
	 3yJE4n4Qd6taw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE0A5841BB;
	Wed,  3 Dec 2025 18:07:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A52FD3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30836841BB
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkEDLN4oqY3L for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 18:07:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE4A380C52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE4A380C52
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE4A380C52
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:07:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0763CA4C78A2
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:07:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49882)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQrGO-000000002xV-1ACQ
 for buildroot@buildroot.org; Wed, 03 Dec 2025 18:07:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 19:07:40 +0100
Message-ID: <20251203180740.2121090-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764785261;
 bh=JN6HI/nKZaORW54E1dbu1IyV7CMPMmcQcVn0NEBmb8c=;
 h=From:To:Subject:Date:From;
 b=cdQp29tbUVwP7ADrg4GwugC/fD048VmY7hEtU3tHeo9UEiytyZfragqAuLdF0AZDm
 FbWca3lWgQEHs8T78TC+4GLzSRXy4O0Ku0cur+oCfrevy4JWJmFPbuAdQ7+yhgAWhW
 CR9FJGaUS7iC/V6+D/qFOnRMTUmjn4pfUBNBi18MJZ9t5adJ5FmWd0bofLfzmfe+B/
 25xeDa8gvHF+TAJGP1Co/k63EfYMdgXzlVJGE64zlXjAbJA3gcJOMIKEcc6qJtQm6v
 QOlK7nkeLe2woSB/n6+/JAcWyRTGc6dUCU1yEKcskPaFzG4lGHoj1cKgDjsaKoG254
 RrLC2+3U3+aDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=cdQp29tb
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.51.1
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

Release notes of this bugfix release:
https://sqlite.org/releaselog/3_51_1.html

"Changes in this specific patch release, version 3.51.1 (2025-11-28):

    Fix incorrect results from nested EXISTS queries caused by the
    optimization in item 6b in the 3.51.0 release.
    Fix a latent bug in fts5vocab virtual table, exposed by new
    optimizations in the 3.51.0 release"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index e33c87f34e..19d5584625 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  42e26dfdd96aa2e6b1b1be5c88b0887f9959093f650d693cb02eb9c36d146ca5  sqlite-autoconf-3510000.tar.gz
+sha256  4f2445cd70479724d32ad015ec7fd37fbb6f6130013bd4bfbc80c32beb42b7e0  sqlite-autoconf-3510100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 13ae9d9281..ca8071c78e 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.51.0
-SQLITE_TAR_VERSION = 3510000
+SQLITE_VERSION = 3.51.1
+SQLITE_TAR_VERSION = 3510100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2025
 SQLITE_LICENSE = blessing
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
