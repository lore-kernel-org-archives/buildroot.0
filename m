Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E321CD98CF
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 13:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C83FA60C23;
	Mon, 15 Jun 2026 13:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOsVHVcBik6u; Mon, 15 Jun 2026 13:48:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69BFE60BFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781531339;
	bh=1Q9YdO6QQ4mtMsrlPrdgyf+pVKZexuz5QDfsoUNi+T4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ds9SyRM2wvLgp+JEIbVCbzWwznaV/lr5Te5wLlbg7C89YNnNcTsWbO9Kaoq76qXUZ
	 02EzTGaPOeX9AcYYI/HNF6MLDMM7YhBMBDE8+KznJrqzWKqgTxyLCajAYNFbbCrESd
	 GK6V6f4JBaJJrUJ32BL6XPN61u5aIY6KoKkzssQoyWaohMo5EF7AxQF17LErqK1Df5
	 MkI6WFAui0gYJrOk2WtSu0NUhfqwPNIyhnmT77ZZFWdeKhax1GyuIC/Svq2GvsXp7d
	 Ng11hVlrGzAo6/Pk9v3heJCFMy2Q2cyqvSFIR+kzO6ocN4zTbJaGazbiwyclRATOgm
	 daFzehwRTQTSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69BFE60BFD;
	Mon, 15 Jun 2026 13:48:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67EB9169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 13:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65A0C40291
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 13:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPl1b5aG3Mx0 for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 13:48:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3928B40126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3928B40126
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3928B40126
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 13:48:56 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 8AA9E31E0562; Mon, 15 Jun 2026 15:48:54 +0200 (CEST)
Date: Mon, 15 Jun 2026 15:48:54 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Message-ID: <ajACxoxP8phONNg4@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.90+deb13.1-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1781531334; bh=ghoeetm3C/5Nz58ALri2jHUZJEFkLNFldrCxjjyX5mM=;
 h=Date:From:To:Cc:Subject:From;
 b=uLzS6LCU5QA391wvM9s6Xj6js+Tma37sZIrw+SeCdHdUE2LUWhd5hfDvfg9qvtpZL
 dBkd+4ZCpPL/EdDw3uSM8SDZmleo3q4L/5eQNxB/dO1SlspgcCgGdx2qjoazGKUuBG
 IMZcBZfM9wyzuNRgae25didW7H8HkOTWOKevRh1CwICrsOsmr/P6HbnNeXbBVtG1Ht
 6+wjrEOwd3u1dJb2bsIorloIDVze/NYEeBiDT3KeKZtZgr2FTFEUwxnC9rppi4Vkg/
 NsD8N4oLEYUGMeWpTMFX+ulUamWByZlljmtO0+4db+d1WhteG1KD1hfuukRRQ0AQ/5
 bzxzSs3p6yphQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/perl-switch: new package
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

From: Deividas Puplauskas <deividas.puplauskas@gmail.com>

See here for a description:
https://metacpan.org/pod/Switch

Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/perl-switch/Config.in        |  7 +++++++
 package/perl-switch/perl-switch.hash |  6 ++++++
 package/perl-switch/perl-switch.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/perl-switch/Config.in
 create mode 100644 package/perl-switch/perl-switch.hash
 create mode 100644 package/perl-switch/perl-switch.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 413c71192d..3d947d40f0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3426,6 +3426,7 @@ F:	package/perl-cgi/
 F:	package/perl-cgi-session/
 F:	package/perl-log-message/
 F:	package/perl-log-message-simple/
+F:	package/perl-switch/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
diff --git a/package/Config.in b/package/Config.in
index e81f314e17..03c11f1437 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -916,6 +916,7 @@ menu "Perl libraries/modules"
 	source "package/perl-sub-exporter-progressive/Config.in"
 	source "package/perl-sub-install/Config.in"
 	source "package/perl-sub-quote/Config.in"
+	source "package/perl-switch/Config.in"
 	source "package/perl-sys-cpu/Config.in"
 	source "package/perl-sys-meminfo/Config.in"
 	source "package/perl-sys-mmap/Config.in"
diff --git a/package/perl-switch/Config.in b/package/perl-switch/Config.in
new file mode 100644
index 0000000000..1aee9ea13d
--- /dev/null
+++ b/package/perl-switch/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_SWITCH
+	bool "perl-switch"
+	help
+	  A switch statement for Perl, do not use if you can use
+	  given/when.
+
+	  https://metacpan.org/release/Switch
diff --git a/package/perl-switch/perl-switch.hash b/package/perl-switch/perl-switch.hash
new file mode 100644
index 0000000000..41c29b00f1
--- /dev/null
+++ b/package/perl-switch/perl-switch.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  34e2b6dac0a43384505b4e036633cff0  Switch-2.17.tar.gz
+sha256  31354975140fe6235ac130a109496491ad33dd42f9c62189e23f49f75f936d75  Switch-2.17.tar.gz
+
+# computed by scancpan
+sha256  a2fa55566d0d94278ba43480b8f1bfa93f51e56088000a058ca34bd3a89893d7  README
diff --git a/package/perl-switch/perl-switch.mk b/package/perl-switch/perl-switch.mk
new file mode 100644
index 0000000000..e09f4d3c7d
--- /dev/null
+++ b/package/perl-switch/perl-switch.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-switch
+#
+################################################################################
+
+PERL_SWITCH_VERSION = 2.17
+PERL_SWITCH_SOURCE = Switch-$(PERL_SWITCH_VERSION).tar.gz
+PERL_SWITCH_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHORNY
+PERL_SWITCH_LICENSE = Artistic or GPL-1.0+
+PERL_SWITCH_LICENSE_FILES = README
+PERL_SWITCH_DISTNAME = Switch
+
+$(eval $(perl-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
