Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E2ECD98CF
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 13:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2682582AC6;
	Mon, 15 Jun 2026 13:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7O-fptJ3jFg; Mon, 15 Jun 2026 13:48:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F55782A83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781531297;
	bh=hG8cOJ4tXlP+0VR9mvS9/IvCjq5qaJ6mOTjmiKgprEc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zb5XDt1V3KV0qq/mJH74062bF2c9Xp5LA0KduOaMxCSVxmsSRvlaLuojWpDUT4RU7
	 iR5MGU2DPX4WrSUuWmvjtMuEZD+5VEDZs88xoIilvbJsmBHsuDK5/ny+x891lURhRA
	 nY8P/hTla8/TBNjvdtJcrN1qs1EDbC+l9FfZdA4BI4n8EqI04dTkUBIWivKXWXZzdY
	 a4hVxf/jbuMVC33tfDbm+MiJF2sHHw9O2SE7T3VeyBMceNP6Hsz/64/fdJxdbJTsT7
	 G4GsBGniOYH5mIBHdPVV1eg6Ipn3dzSe/ZX/zDGao1WrJcuvKA1vPCMrNkUhbivJ7D
	 OKg0pDOCqEung==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F55782A83;
	Mon, 15 Jun 2026 13:48:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA8ED169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 13:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCD6440291
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 13:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHPHDQRIANJU for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 13:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A0ECD40126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0ECD40126
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0ECD40126
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 13:48:14 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 8714831E06BB; Mon, 15 Jun 2026 15:48:12 +0200 (CEST)
Date: Mon, 15 Jun 2026 15:48:12 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Message-ID: <ajACnMGB1xtN0Uu1@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.90+deb13.1-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1781531292; bh=j/Y5ed5RLu+K6HgK7ZW7yb4xIfmtmEjrA9N5nhkbV+Y=;
 h=Date:From:To:Cc:Subject:From;
 b=KKLHby5KacNGS2vbLzpYBvh76JzX27x8pqcb+wetMLr+l39WSbPSZR9NeVuYJp0Gz
 AJTZW9+UnYX4HXVwoe5W3DQnMj671HCy/2/RVDbCpjqeb9yM9bAst2e5Bb7SOSwjg7
 joiYxbUtmjuuuudXq9bVhdCElc99cYBnFt0P90l623Dtdc31hgn2xKUUmH4rK7hK8i
 kuTActgYGVaqVTA8YSRA43nDT7hRsWmurMPvyF5DkblCYAprXwyN5W7vJHGIG4kfSS
 EMDrQn1IeO08kfxaT6liN13pwZAn17ffBdLuRkh4ZJ7rNCW5QV3NZ4zOzm42WNXtac
 E+2Al4AHwCSZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/perl-log-message-simple: new package
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
https://metacpan.org/pod/Log::Message::Simple

Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/perl-log-message-simple/Config.in          |  7 +++++++
 .../perl-log-message-simple.hash                   |  6 ++++++
 .../perl-log-message-simple.mk                     | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/perl-log-message-simple/Config.in
 create mode 100644 package/perl-log-message-simple/perl-log-message-simple.hash
 create mode 100644 package/perl-log-message-simple/perl-log-message-simple.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 605d54b945..413c71192d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3425,6 +3425,7 @@ F:	package/mksh/
 F:	package/perl-cgi/
 F:	package/perl-cgi-session/
 F:	package/perl-log-message/
+F:	package/perl-log-message-simple/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
diff --git a/package/Config.in b/package/Config.in
index cc667a763a..e81f314e17 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -877,6 +877,7 @@ menu "Perl libraries/modules"
 	source "package/perl-libwww-perl/Config.in"
 	source "package/perl-locale-maketext-lexicon/Config.in"
 	source "package/perl-log-message/Config.in"
+	source "package/perl-log-message-simple/Config.in"
 	source "package/perl-lwp-mediatypes/Config.in"
 	source "package/perl-lwp-protocol-https/Config.in"
 	source "package/perl-mail-dkim/Config.in"
diff --git a/package/perl-log-message-simple/Config.in b/package/perl-log-message-simple/Config.in
new file mode 100644
index 0000000000..498c0abb6b
--- /dev/null
+++ b/package/perl-log-message-simple/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_LOG_MESSAGE_SIMPLE
+	bool "perl-log-message-simple"
+	select BR2_PACKAGE_PERL_LOG_MESSAGE # runtime
+	help
+	  Simplified interface to Log::Message.
+
+	  https://metacpan.org/release/Log-Message-Simple
diff --git a/package/perl-log-message-simple/perl-log-message-simple.hash b/package/perl-log-message-simple/perl-log-message-simple.hash
new file mode 100644
index 0000000000..80264e47a7
--- /dev/null
+++ b/package/perl-log-message-simple/perl-log-message-simple.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  0a0f9df6bc1148cc2aae4cb2882c0664  Log-Message-Simple-0.10.tar.gz
+sha256  aa12d1a4c0ac260b94d448fa01feba242a8a85cb6cbfdc66432e3b5b468add96  Log-Message-Simple-0.10.tar.gz
+
+# computed by scancpan
+sha256  f7dd6d58fbfe01f28775735bbfc48da1035ab3880eca872ba446ac5a55df9278  README
diff --git a/package/perl-log-message-simple/perl-log-message-simple.mk b/package/perl-log-message-simple/perl-log-message-simple.mk
new file mode 100644
index 0000000000..4aaae54d1f
--- /dev/null
+++ b/package/perl-log-message-simple/perl-log-message-simple.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-log-message-simple
+#
+################################################################################
+
+PERL_LOG_MESSAGE_SIMPLE_VERSION = 0.10
+PERL_LOG_MESSAGE_SIMPLE_SOURCE = Log-Message-Simple-$(PERL_LOG_MESSAGE_SIMPLE_VERSION).tar.gz
+PERL_LOG_MESSAGE_SIMPLE_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BI/BINGOS
+PERL_LOG_MESSAGE_SIMPLE_LICENSE = Artistic or GPL-1.0+
+PERL_LOG_MESSAGE_SIMPLE_LICENSE_FILES = README
+PERL_LOG_MESSAGE_SIMPLE_DISTNAME = Log-Message-Simple
+
+$(eval $(perl-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
