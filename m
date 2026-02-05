Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EF2ECD996
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 19:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A026660F92;
	Thu,  5 Feb 2026 19:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laZr9re0cWQE; Thu,  5 Feb 2026 19:22:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 917E5610A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770319326;
	bh=mgJOUFlll0lTH/KLl+XIBUtO1UWnej20SvJGJeN4GE0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IbqZPnoRH2qgcVbg8AfxKiWd/HDmiVImDyiTSiNljOXtBtrtj1KYcZVxnhqFC4qsW
	 VJvz3FQcw2d2QqbZchmKNKbp1RH9WhsJBjYscgoacjEg9bcKphjDYK7myewvb2zaw0
	 vaWTs0EqAjZ7LAbpFdL+DypO1iNnmCht0irmlUkdNKbV59lXywx8lD7qJLzEiZtzgz
	 5rEwMAtio3SzAHSA3lozBULeYj5G3GPIIk4T2hNIQIkJ73a4q+MBpI+4gGGW9N6Qzw
	 TQoLNqnrIaznR7DS4GMF9whDhZ/Vu3TbrJ+X2Ep+jiJ+hEx77ET+wTzx23lpi4MKTj
	 43AOB0ictJOBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 917E5610A9;
	Thu,  5 Feb 2026 19:22:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 606F817A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57F22840A5
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 95jV86jMi3eR for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 19:22:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5676C84071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5676C84071
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5676C84071
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:22:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 41CEFA4C56B7
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:22:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42346)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vo4vR-000000000wv-0WmB
 for buildroot@buildroot.org; Thu, 05 Feb 2026 19:22:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Feb 2026 20:22:00 +0100
Message-ID: <20260205192200.1728041-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770319321;
 bh=sFsKR8w7gl85ld/m1cRo4/rb+fqufj6cVo87zfvMATI=;
 h=From:To:Subject:Date:From;
 b=Bhm3y1M+V1w8gctlRXeugfVCEFSqw/zbJLsKVMYxEowZSNYlZR4GohhKt2+V9AHpp
 x5nWdh+O9gPcrx/xnb0VAtnJi8+NZ+icJ38ta4YsU2TbzZJsTBtoQI2zyzyDrm3LrW
 pl2E+XtAZhwlhQpFVxZ4DKiDm0fW1lMNeQa0apJ0YzF8Le5sg360LkVseeAlittFR6
 MVlnjaJCfPMH96+U2G3NdEPxh5JgVNyran0hUwl5T6R0lQoumXjrxYEF81QjYurXu5
 Clqz2k8Mi1Ymm0Y2FPdmleoeRAP+rbBf8OtwfuM2lj/O5RIxCHfROKVWug8Batgf/H
 CkzGJS2c1VhSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Bhm3y1M+
Subject: [Buildroot] [PATCH 1/1] package/collectd: fix wchar dependency of
 mariadb
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

Fmt depends on BR2_USE_WCHAR since its introduction in 2017 by buildroot
commit 81fe75c855f9a598695f83b7384713820383efe4.

Buildroot commit 821f9dee8112dc02fe58d60273d0dfdabbc46d1f added fmt as
dependency to mariadb in July 2023, including the wchar dependency.

Buildroot commit 8708f3a23a7e28fdb04fc57406e13e6b7ff4a337 from March
2024, which replaced the mysql virtual package with mariadb, causes
build errors due to the wchar dependency not being propagated.

Fixes:
https://autobuild.buildroot.net/results/ef2/ef201a7d04330463ce46b93e6d5702dfefc6ad6c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/collectd/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 127bcace6d..d1ed36ef5e 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -393,15 +393,17 @@ config BR2_PACKAGE_COLLECTD_MYSQL
 	bool "mysql"
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
 	depends on BR2_USE_MMU # mysql
+	depends on BR2_USE_WCHAR # fmt -> mariadb
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
 	select BR2_PACKAGE_MARIADB
 	help
 	  Connects to a MySQL database and issues a "show status"
 	  command.
 
-comment "mysql needs a toolchain w/ C++, threads"
+comment "mysql needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR
 
 config BR2_PACKAGE_COLLECTD_NETLINK
 	bool "netlink"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
