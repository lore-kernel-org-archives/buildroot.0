Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE84EA3C5D
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 13:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB9076101D;
	Thu,  9 Apr 2026 13:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPEspLNUF7m0; Thu,  9 Apr 2026 13:17:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B68216082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775740667;
	bh=vsXWWemWW4Trcvn5uyzmHm9fOvyf+kf1SOFUMhsBoM0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g20jv28Pq55cfi0qQ2qhbxmfJjnNBgkcEZEqU4reABkL9ZeredcCfHO+yXwu4taXC
	 pOprf7T3Or2OvUdThdxmUlDRz+24XukAryc6g24KJ59G9Iyo3z1GydBd9NWf21n/9T
	 NT+U4aeOZMwTQ117IISqJ/SSRdrXbhEAul/00KLNVXrtmznSKFDfVW7N6m4CxvmwVy
	 SosCw1Y6VDS2oOeOxRgwzx60kAiFELwq/6gfXaB9bq9F/YZ4TMmo2CBGr2x1fBpvQ7
	 zjHLcaqqfafi472XPtVTUhFkMtzRaQiayfNfFGEXLNLPnwxLc8W5WvqWDrFaPe2/NC
	 eHYCqaqyQG6DQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B68216082A;
	Thu,  9 Apr 2026 13:17:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BC701F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7166440340
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwlmYMbnk-OK for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 13:17:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67395400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67395400F6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67395400F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:17:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 71883A4C0985
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:17:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58400)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wApGQ-000000002P1-1dHp
 for buildroot@buildroot.org; Thu, 09 Apr 2026 13:17:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 15:17:42 +0200
Message-ID: <20260409131742.278793-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775740662;
 bh=BwBcU6jPqWV5RLalNq25pzbvUx7AiP/Z3XK5m0mst+g=;
 h=From:To:Subject:Date:From;
 b=j2B/nAq6BatX0eYniFTekZapTE0opXTfWe5CUFy3Xznt+YfFu5Z5bWCfrFzFiCmDb
 pPo2cTnegi+11eDOaHdOWrylnzjncfiHgL7524zKZsL0RNekqWyfCNJ99ZTbhWZ3bX
 dXx5NF9JQlLsaVaOj/zUdfcCnpnXpWPv2vI10rM1xdEXr2hqkUp0OaRwFKTWV7t7+6
 LLj80H9+DMjDP4hdcO25BBI4APf+v/Q3P6dJZKscKxYMXddtqOYu5Pr0GBgS1z/VXN
 Qfelb2fuZHUD/Wvrgwk4leD40pD1Gnk3MUKa+m4Ffily9r6VHyddKWdszz9Uoyku/H
 DsWg+2vFjDDmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=j2B/nAq6
Subject: [Buildroot] [PATCH 1/1] package/openssh: bump to version 10.3p1
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

https://www.openssh.org/txt/release-10.3
https://www.openssh.com/releasenotes.html#10.3p1

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 154464d68a..2d242b4a99 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-10.2
-sha256  ccc42c0419937959263fa1dbd16dafc18c56b984c03562d2937ce56a60f798b2  openssh-10.2p1.tar.gz
+# From https://www.openssh.com/txt/release-10.3
+sha256  56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4  openssh-10.3p1.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index bcbfc39755..607af7456d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 10.2
+OPENSSH_VERSION_MAJOR = 10.3
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
-OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
+OPENSSH_SITE = https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
