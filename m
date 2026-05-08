Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23643CD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 07:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 267D3841BC;
	Fri,  8 May 2026 07:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4V7MNgY-oNb8; Fri,  8 May 2026 07:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A7D8841B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778225710;
	bh=eG6xjGtSl53zdnOvK/np7LdTLPKcZtaAPOD/0oN8Cco=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UfPom5ffHE+6R+RB+Mm/KR0Vh7h11plTdqBHSYuQj/xDek//v4JjTEy2IvvKD2sIF
	 WI6kxQaG6+xcjuUU1k2+A/ds+mGPIXuVEQ2AramsDcj//46pK3xmyJW4hZ2AeusKVU
	 lol6fqb33AanmuMZb5EU9HvHxk4x+o22LsROi/RJsOmZi+z/tQAUih7p7kntonJ2J8
	 4q0OaEoH6r4jmwwze1mGvy7xy+z9uQ3JXGBeJjM7uHJF7I+VQtjnx479xHKt9lLZqQ
	 +uvyYwyryXNSaizuwsy35CZFWhBOXcdUZPagNtZIZwmkpz7jMw6WBdzArE90jinqTv
	 vljztY7uE6DwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A7D8841B6;
	Fri,  8 May 2026 07:35:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F049A358
 for <buildroot@buildroot.org>; Fri,  8 May 2026 07:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D60F440C34
 for <buildroot@buildroot.org>; Fri,  8 May 2026 07:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rf72kF4pQjJf for <buildroot@buildroot.org>;
 Fri,  8 May 2026 07:35:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0EA440C43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0EA440C43
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0EA440C43
 for <buildroot@buildroot.org>; Fri,  8 May 2026 07:35:07 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1186531E0240; Fri, 08 May 2026 09:35:04 +0200 (CEST)
Date: Fri, 8 May 2026 09:35:04 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Message-ID: <af2SKCP2HeKD0y7-@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.85+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1778225705; bh=n1bqh/aoPzp+YuE9xkaWmE39Pc0mugnR9kFORt+wQ1k=;
 h=Date:From:To:Cc:Subject:From;
 b=vqkcwIO+gxWFVGjQMzrO7LQNTZcszExHgPw3YrswB+z9PGGefl8X2wnTiL0MvDtlb
 F875izffv+FieaYBN0aBfgrcKJi36wiuv2rYCf282Z/uiL8Z5KsqBUk/dUbP4DSudr
 Ba0L7WI1kjl6zWy1G6CrECKpheVpmxWrTqWXh+LhAcayByUfnd6dAvLb/O9GYJE32Y
 C1ckdixKcWIi/Yrv/CBpjC8w9UmvOPEMDNd5NPjKe6ikphEzLb/j88MZa1XSbobSIO
 8sRHKtAqC3YPZAZWs0vWRQaScmrHdUidJZj3Fgjw39a5lkG7CtWykHTh53p38CT7Yt
 2EiapVUHdy05A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/perl-cgi: new package
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
https://metacpan.org/pod/CGI

Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/perl-cgi/Config.in                    | 12 +++++++
 package/perl-cgi/perl-cgi.hash                |  6 ++++
 package/perl-cgi/perl-cgi.mk                  | 14 ++++++++
 .../testing/tests/package/test_perl_cgi.py    | 33 +++++++++++++++++++
 6 files changed, 67 insertions(+)
 create mode 100644 package/perl-cgi/Config.in
 create mode 100644 package/perl-cgi/perl-cgi.hash
 create mode 100644 package/perl-cgi/perl-cgi.mk
 create mode 100644 support/testing/tests/package/test_perl_cgi.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d849fa828a..f4fe6c4014 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3435,6 +3435,7 @@ F:	package/evilwm/
 F:	package/fbv/
 F:	package/libpam-pkcs11/
 F:	package/mksh/
+F:	package/perl-cgi/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
diff --git a/package/Config.in b/package/Config.in
index 9cae377fb5..7aa3a897ac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -813,6 +813,7 @@ menu "Perl libraries/modules"
 	source "package/perl-apache-logformat-compiler/Config.in"
 	source "package/perl-appconfig/Config.in"
 	source "package/perl-astro-suntime/Config.in"
+	source "package/perl-cgi/Config.in"
 	source "package/perl-class-inspector/Config.in"
 	source "package/perl-class-load/Config.in"
 	source "package/perl-class-method-modifiers/Config.in"
diff --git a/package/perl-cgi/Config.in b/package/perl-cgi/Config.in
new file mode 100644
index 0000000000..1c4292483c
--- /dev/null
+++ b/package/perl-cgi/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PERL_CGI
+	bool "perl-cgi"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_HTML_PARSER # runtime
+	select BR2_PACKAGE_PERL_URI # runtime
+	help
+	  Handle Common Gateway Interface requests and responses.
+
+	  https://metacpan.org/module/CGI
+
+comment "perl-cgi needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-cgi/perl-cgi.hash b/package/perl-cgi/perl-cgi.hash
new file mode 100644
index 0000000000..fa4544493c
--- /dev/null
+++ b/package/perl-cgi/perl-cgi.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5  ea0c7b5b002f100f23b11ac9487088a9  CGI-4.72.tar.gz
+sha256  babc1ca72db188083a1c3812debe88c4473b943b1f7c662281cd57c580a8bdd9  CGI-4.72.tar.gz
+
+# computed by scancpan
+sha256  55a4d9005df91f82cd19aab29c3ad64c1a2e2d69a069f76570ee679bedd6b351  LICENSE
diff --git a/package/perl-cgi/perl-cgi.mk b/package/perl-cgi/perl-cgi.mk
new file mode 100644
index 0000000000..ca6968125c
--- /dev/null
+++ b/package/perl-cgi/perl-cgi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-cgi
+#
+################################################################################
+
+PERL_CGI_VERSION = 4.72
+PERL_CGI_SOURCE = CGI-$(PERL_CGI_VERSION).tar.gz
+PERL_CGI_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEEJO
+PERL_CGI_LICENSE = Artistic-2.0
+PERL_CGI_LICENSE_FILES = LICENSE
+PERL_CGI_DISTNAME = CGI
+
+$(eval $(perl-package))
diff --git a/support/testing/tests/package/test_perl_cgi.py b/support/testing/tests/package/test_perl_cgi.py
new file mode 100644
index 0000000000..a6657ba78d
--- /dev/null
+++ b/support/testing/tests/package/test_perl_cgi.py
@@ -0,0 +1,33 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlCGI(TestPerlBase):
+    """
+    package:
+        CGI
+    direct dependencies:
+        HTML-Parser   XS
+        URI
+    indirect dependencies:
+        Clone   XS
+        Encode-Locale
+        HTML-Tagset
+        HTTP-Date
+        HTTP-Message
+        IO-HTML
+        LWP-MediaTypes
+        MIME-Base32
+        TimeDate
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_CGI=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("Clone")
+        self.module_test("HTML::Parser")
+        self.module_test("CGI")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
