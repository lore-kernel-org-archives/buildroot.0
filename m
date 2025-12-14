Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F403D5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC82C81296;
	Sun, 14 Dec 2025 17:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSeQgPMPGEZb; Sun, 14 Dec 2025 17:15:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F1848128F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765732548;
	bh=lcfJ0ZvJVtgZWc8oIgZn157xT/vxfQ46AEtGzCnbYz0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bWfcrwGh4+cMEg9zYbyZ/fXZoVZ7091AXvlB9ModkQXX9Jyt+RsLrMXYw/mCapj8F
	 PXl2qTeWFjy7sIqS5yxtgNYTsjHWCVfvkIg9ObKbgPMqDeC5SMkC5Vo7W7HG/IXyy1
	 DI44YL0KYZ8lCJt7V6NL/Qq+/8k9fKXOgS/Gsf03lCC85cO9WYnlW1iPJTqtyLCXlt
	 /6fMSn1vlvR1Qz0kfQhK6Ay14YhJsyUFhYKFwEZ5Uj76NgWl+jpGvuBBVZdqcG52kB
	 m+xvwUSdSr5be885fwFlCJKxnxz3RsdU+43QvfnAsXwPMnBOtlbmlbCF9IdrjL1mN8
	 lfMfGEoS09+tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F1848128F;
	Sun, 14 Dec 2025 17:15:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7298B2D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FD1D40203
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 739QY8RUSD-d for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:15:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 613B24005F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 613B24005F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 613B24005F
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:15:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7F3EFA4C409D;
 Sun, 14 Dec 2025 18:15:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUpgw-000000003EJ-3rQc;
 Sun, 14 Dec 2025 17:15:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Laurent Charpentier <laurent_pubs@yahoo.com>
Date: Sun, 14 Dec 2025 18:15:31 +0100
Message-ID: <20251214171531.1496512-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214171531.1496512-1-bernd@kuhls.net>
References: <20251214171531.1496512-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765732531;
 bh=8X8auMCjeu9jVh6hQzn87Xgzwmf00BaeZd42mD8ysUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=m8ZoBhFDOQLBcIe4Bv9clPvnIzCoG75cFVtF1hszzX9hXaLV2HylH+KuuM98NxGb2
 LBW8p9+h0w13/7GHtr1gm4U5t7r1D3yd4AzmpxrnX273kO31qjCUfawhVWRT1YAeRK
 /oPmqQPRcRnwjMo64lWbC+iKjqkdv2i42U3A1xYPwZ95h8hffwbmq1ZlBOb1PwImXT
 vMGWs6nsPPrYZo2qiApkeYMpsZU1TInEZ9Q6dNsgcoW1i3G0HezoawDiWO+CEzfHBE
 rby3kYBanRwM8R1iDC6AGGjktW3gvHzGOYJr2Wh8zTAe3uOv2ftEyUUmjmYtXX4We5
 hm4e6t3FPnRCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=m8ZoBhFD
Subject: [Buildroot] [PATCH 2/2] package/open-lldp: bump version to 1.1.1
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

https://github.com/intel/openlldp/blob/v1.1.1/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/open-lldp/open-lldp.hash | 2 +-
 package/open-lldp/open-lldp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open-lldp/open-lldp.hash b/package/open-lldp/open-lldp.hash
index 1fbd8dd0ca..8bbba470aa 100644
--- a/package/open-lldp/open-lldp.hash
+++ b/package/open-lldp/open-lldp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  13e0890527192a6289e6dac82056c447a1e2624ff93b0b6bbd8a42d15b2cbc8c  open-lldp-1.1.tar.gz
+sha256  2faa9db57f8426db9f394bd2bab87237a350ae43437b16faf6569250cda25a69  open-lldp-1.1.1.tar.gz
 sha256  67af5abeb092213cd9c53781503320f635ba28b641e0c3f24d367e8e93a9839b  COPYING
diff --git a/package/open-lldp/open-lldp.mk b/package/open-lldp/open-lldp.mk
index d42dbcc5c3..0b84b6773e 100644
--- a/package/open-lldp/open-lldp.mk
+++ b/package/open-lldp/open-lldp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN_LLDP_VERSION = 1.1
+OPEN_LLDP_VERSION = 1.1.1
 OPEN_LLDP_SITE = $(call github,intel,openlldp,v$(OPEN_LLDP_VERSION))
 OPEN_LLDP_DEPENDENCIES = readline libnl libconfig host-pkgconf
 OPEN_LLDP_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
