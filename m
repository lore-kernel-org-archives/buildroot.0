Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ACDC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 19:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 634188141E;
	Tue, 25 Jan 2022 19:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3juSEkMSd6Jo; Tue, 25 Jan 2022 19:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98CF681405;
	Tue, 25 Jan 2022 19:23:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41CD71BF297
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 19:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3150660590
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 19:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id upZEmJGcduf4 for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 19:23:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6239F6058B
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 19:23:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5FAF8822E9; Tue, 25 Jan 2022 19:16:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 20:22:45 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 3c630f207bf527977150ef59659b8d0b573f26c3
X-Git-Newrev: 2d4a00623ebc44f197b08e039fe533bba82290b5
X-Patchwork-Hint: ignore
Message-Id: <20220125191637.5FAF8822E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libdbi: needs
 dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d4a00623ebc44f197b08e039fe533bba82290b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
(cherry picked from commit a24f0e8eeebbd6a77775a5eb5dbe830417fc9d22)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
