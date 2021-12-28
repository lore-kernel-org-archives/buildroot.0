Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DE8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 22:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1718440891;
	Tue, 28 Dec 2021 22:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWaoqTLmMlar; Tue, 28 Dec 2021 22:06:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54C704088A;
	Tue, 28 Dec 2021 22:06:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EA251BF3D4
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 22:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C4E5405AE
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 22:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUIjBkppZSFK for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 22:06:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E042400BA
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 22:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F181682C8B; Tue, 28 Dec 2021 22:00:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 23:05:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78d7c5f803c2f59385b57525e2d1d09da15e22a6
X-Git-Newrev: a24f0e8eeebbd6a77775a5eb5dbe830417fc9d22
X-Patchwork-Hint: ignore
Message-Id: <20211228220013.F181682C8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdbi: needs dynamic library
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a24f0e8eeebbd6a77775a5eb5dbe830417fc9d22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libdbi needs dynamic library to avoid the following build failure raised
since the addition of the package in commit
c6aac6ebdbbd3873110a9e19de1957e49cb9344e:

dbi_main.c:84:2: error: #error no dynamic loading support
   84 | #error no dynamic loading support
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/9cd56a625cbd52b0c070e2d462e02f5161d9631d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in       | 4 ++++
 package/libdbi-drivers/Config.in | 4 ++++
 package/libdbi/Config.in         | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 9c38d87bcb..05fb577345 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -214,11 +214,15 @@ config BR2_PACKAGE_COLLECTD_CURL_XML
 
 config BR2_PACKAGE_COLLECTD_DBI
 	bool "dbi"
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBDBI
 	help
 	  Executes SQL statements on various databases and
 	  interprets the returned data.
 
+comment "dbi support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_COLLECTD_DF
 	bool "df"
 	help
diff --git a/package/libdbi-drivers/Config.in b/package/libdbi-drivers/Config.in
index 087e6aaf0e..7c505340c1 100644
--- a/package/libdbi-drivers/Config.in
+++ b/package/libdbi-drivers/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBDBI_DRIVERS
 	bool "libdbi-drivers"
+	depends on !BR2_STATIC_LIBS # libdbi
 	select BR2_PACKAGE_LIBDBI
 	help
 	  The libdbi-drivers project provides the
 	  database-specific drivers for the libdbi framework.
 
 	  http://libdbi-drivers.sourceforge.net
+
+comment "libdbi-drivers needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libdbi/Config.in b/package/libdbi/Config.in
index ded2bc6e53..13ac344f82 100644
--- a/package/libdbi/Config.in
+++ b/package/libdbi/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBDBI
 	bool "lidbi"
+	depends on !BR2_STATIC_LIBS
 	help
 	  libdbi implements a database-independent abstraction layer
 	  in C, similar to the DBI/DBD layer in Perl.
 
 	  http://libdbi.sourceforge.net
+
+comment "libdbi needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
