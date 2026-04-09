Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D759FEA3C5D
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 13:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A41B14101F;
	Thu,  9 Apr 2026 13:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJ0tIqjlwRyF; Thu,  9 Apr 2026 13:19:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D66234107C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775740762;
	bh=i+S+bw+8JipGH06x9BqRP7q/UcRUngQjiLFGQ4jyDAQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=De1dH3mJ0FZ97/slRDM5kvaYiTBqDwlKtFFNKgEUes+7FgOcvFyPlDDQv173b9PIs
	 5fsn2nS4IeYsrjBTqrSd6py3muWqY2iQ/IqIpKZEQXfuWgh3FvWv1C/TiD1dp9yVFE
	 0lXJ59XgkceQCMe58MxK1z3wAsLDY6p2BUzQnmcuVw0Q3VaYxtgSSZQB68Rmiv2iMp
	 iieFdepjDuzzycNlBmJjUvNWwTrxlVt0AQ3C7wYYdvXHk+TyenRLkhSH57lrN+A5ac
	 uaVkUM2j8pHZ8M5eIVTKV+hLYh5tbPhX/I7v70+m7y3TSb63PlXPPkiRhz98+ywzbM
	 1mtwvFfZmYguw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D66234107C;
	Thu,  9 Apr 2026 13:19:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27FFA1F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E1FD40340
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUNlbk2J6wkI for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 13:19:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDA22400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDA22400F6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDA22400F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:19:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EB8EEA4C0B29
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:19:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wApHm-000000002eL-3j1G
 for buildroot@buildroot.org; Thu, 09 Apr 2026 13:19:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 15:19:06 +0200
Message-ID: <20260409131906.279061-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409131906.279061-1-bernd@kuhls.net>
References: <20260409131906.279061-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775740746;
 bh=ATLedpUga1RrU6aadpDcGhLzOm6cF33gyvu9nH1oIZI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=LP9iFCF7FvzEvnjccCtpnfn0fhq/JBZi7B9KuNGeYQgetob4e0y/DYT4vriDSDQab
 RxHEMTB2eYRzIcMfBCl8UzCRYIBym5uWkl6t8eiBwi0MdOIgh+s8VeWWva0CGJAFhE
 sYn4wwyDdVTDUUJHKmwkA40kPq78J6msdeyHYncEplDhJcA0+LHQfNU/JzPvTWRSWZ
 okkjyXvBNLIARk4sJ6dsG3/IuT8fSurfM5ezvmVD9KOo5SkX85hm9vSOWd6q+f5jDJ
 TDLLK441CDR0jUKU1VLtsYhPO0MDuMADNbcLB+lW/OSVD98OJFvPOBSSL51TlmFerp
 a7q9etfUYUn4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LP9iFCF7
Subject: [Buildroot] [PATCH 2/2] package/autoconf-archive: bump version to
 2024.10.16
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

https://cgit.git.savannah.gnu.org/cgit/autoconf-archive.git/log/

Computed sha1 tarball hash locally due to upstream not providing
release notes this time:
https://lists.gnu.org/archive/html/autoconf-archive-announce/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/autoconf-archive/autoconf-archive.hash | 5 ++---
 package/autoconf-archive/autoconf-archive.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
index c4658e6f91..0ca19aee1c 100644
--- a/package/autoconf-archive/autoconf-archive.hash
+++ b/package/autoconf-archive/autoconf-archive.hash
@@ -1,6 +1,5 @@
-# From https://lists.gnu.org/archive/html/autoconf-archive-announce/2023-02/msg00000.html
-sha1  e26d15db0f1ec60e9ea8ff024cf3ee895fa2eabd  autoconf-archive-2023.02.20.tar.xz
 # Computed locally
-sha256  71d4048479ae28f1f5794619c3d72df9c01df49b1c628ef85fde37596dc31a33  autoconf-archive-2023.02.20.tar.xz
+sha1  74be8b0ae9b11535dc0dba3f559ac302061e3c7f  autoconf-archive-2024.10.16.tar.xz
+sha256  7bcd5d001916f3a50ed7436f4f700e3d2b1bade3ed803219c592d62502a57363  autoconf-archive-2024.10.16.tar.xz
 sha256  e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYING
 sha256  23ed0b84fa023bfa33433b498192cd08a3bfb1f4864a8ed791a84f3eb48b2dd2  COPYING.EXCEPTION
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index 07ac7e9743..2b01ba2bb9 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_ARCHIVE_VERSION = 2023.02.20
+AUTOCONF_ARCHIVE_VERSION = 2024.10.16
 AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPL-3.0+ with exception
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
