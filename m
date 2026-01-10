Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285CED277C1
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 18:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC7F960842;
	Sat, 10 Jan 2026 18:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1YPgtHe6hhQ; Sat, 10 Jan 2026 18:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C58460793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768068479;
	bh=yKoUnJ7J2BkRLvX1H1Onik37my7VRcD7LNUbspGu95M=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aN2HuFtlHOkaNhqs1pdv+PmrTXi0sgveVO4a2sxNSVLda1K13vlrThpy/dVNI6U3+
	 FdbRKD2hlJnMnIqgkEjzhHanOVKJfLElivphMCbBjFQJKptK1he7AkbyxYpPYOAPe6
	 pRsAnYY8VMI6Uu2GD847AVZWRCG+10AdclRMuj8OkqJkKtxgc+rwvB4SBNTMwY/nRL
	 ihiuKuzKndxzCWT0p8Yj8WTtYc67C+CUBLyv1DqZh9JSWicsyLu+qHQqSsvugtZSGc
	 YH93OV4VESIyD/l6nW88RJ4dXzAv0C1EhOYrv813+VZ6e0CGd/PVpw/hAOpx70+SaF
	 MKgSsVOorY/cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C58460793;
	Sat, 10 Jan 2026 18:07:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A83EC131
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F0F560793
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AX4dMgJwf5kw for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 18:07:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 798DB6077E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 798DB6077E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 798DB6077E
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:07:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9070AA4C362F;
 Sat, 10 Jan 2026 19:07:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40188)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vedNS-000000008Ap-13jP;
 Sat, 10 Jan 2026 18:07:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sat, 10 Jan 2026 19:07:54 +0100
Message-ID: <20260110180754.2248793-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768068474;
 bh=/cvF8xi5gfgld15oUwcUCH2EBNBiSo8tcHJ9YBlcu7Q=;
 h=From:To:Cc:Subject:Date:From;
 b=YnhrFpt8p8A0VAApsUOfDpXPCnLpvdx94Hxpd9iMSjVlUlgNRhOG89qVag33/WQlu
 jOqmJJ2LuWfXo17C20RG8aQjW9GgMzADxkluDloli1hSruRZ89aDEdmI1nAo7MFqMM
 SHedjxkxHKVZb1UV0g3lQmXNWGFa4drXR+KimxDjllNeuTOvUyWv6/E/iYAlW0OHkb
 rM1LmLiBr5flxxxd0b8xLFy9l0sxHkL6MYKaK8JsLC3FhTIHoEe4qiuu3VTEnulHRc
 RETi98krv/OvA+mjqn0Tmu73h8Y++sIpZC9S7C3S5ZthTFW2Kvz4SZMzdLxu35TZiJ
 rgOjbs1PoXqNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=YnhrFpt8
Subject: [Buildroot] [PATCH 1/1] package/libarchive: bump version to 3.8.5
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

https://github.com/libarchive/libarchive/releases/tag/v3.8.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 1a61d254f7..db7ed95bd9 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.4
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.5
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.4.tar.xz.asc
-sha256  c7b847b57feacf5e182f4d14dd6cae545ac6843d55cb725f58e107cdf1c9ad73  libarchive-3.8.4.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.5.tar.xz.asc
+sha256  d68068e74beee3a0ec0dd04aee9037d5757fcc651591a6dcf1b6d542fb15a703  libarchive-3.8.5.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 083e913033..f3e90e5910 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.4
+LIBARCHIVE_VERSION = 3.8.5
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
