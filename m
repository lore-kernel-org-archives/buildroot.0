Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F53C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 21:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5F1081501;
	Tue, 14 May 2024 21:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tpGJcnx_xWMG; Tue, 14 May 2024 21:56:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B96D081B6D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B96D081B6D;
	Tue, 14 May 2024 21:56:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B1381BF42D
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1790E405EB
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFsslTw211ZW for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 21:56:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8D2B404DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8D2B404DF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8D2B404DF
 for <buildroot@buildroot.org>; Tue, 14 May 2024 21:56:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09e6.dip0.t-ipconnect.de [91.58.9.230])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C95E6A4C0E95
 for <buildroot@buildroot.org>; Tue, 14 May 2024 23:56:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38380)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s708S-000000000bC-306L
 for buildroot@buildroot.org; Tue, 14 May 2024 21:56:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 23:56:36 +0200
Message-Id: <20240514215636.2866720-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715723796;
 bh=btEZKS+BSPYa7lLtU9TySyG3zqylNyB7mb6q8Eb9Y6A=;
 h=From:To:Subject:Date:From;
 b=s61+VPWsxLo/4NwBU+2vfgs4KD+IIviwPe5rVsGgeuQiw66PPBpYiiFbNZT01wDCB
 3tk8XnNUnVjc/SN2+gg8IYPWha+41WJYxzlnGvzjzeYroHaVjS0RqkNNTF6zu6rISd
 qRUdWUoH+oTBbUSLZVPjD2dxnoJjLr4y8NRZ/RUfQR+fs+YqJp1VzKX0GXe0H1yx0h
 wdkiThl76I+VazzPkWYDsiIc8ZSWZP8w+cOJQJIQ6FLoQJ2VAd5ESBfSkLxMucAv7W
 dSRtk2/aw6XZ6dFnuxFfZpI/0xPb2lHVcGtFH/SZOe0dY9KelN9ad+EV2uDrGOOSBS
 TSdpZoU4JC/JQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=s61+VPWs
Subject: [Buildroot] [PATCH 1/1] package/squid: security bump version to 6.9
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

Fixes CVE-2024-25111:
https://github.com/squid-cache/squid/security/advisories/GHSA-72c2-c3wm-8qxc

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 4a8ea5d550..ed78933306 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v6/squid-6.6.tar.xz.asc
-md5  5a41134ee1b7e75f62088acdec92d2ca  squid-6.6.tar.xz
-sha1  f05e06a9dd3bf7501d2844e43d9ae1bd00e9edcc  squid-6.6.tar.xz
+# From http://www.squid-cache.org/Versions/v6/squid-6.9.tar.xz.asc
+md5  4888e9dc75c0daa0ed526b34c055cb67  squid-6.9.tar.xz
+sha1  5e73b30116ce7111589cc2b1c9bfe3c17efa2e75  squid-6.9.tar.xz
 # Locally calculated
 sha256  55bd7f9f4898153161ea1228998acb551bf840832b9e5b90fc8ecd2942420318  squid-6.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index e325c63cb0..60eca397ec 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 6.6
+SQUID_VERSION = 6.9
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v6
 SQUID_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
