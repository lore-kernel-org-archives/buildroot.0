Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FD4CD98C7
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 11:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62A0682A0E;
	Mon, 15 Jun 2026 11:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgFerCz6FQoB; Mon, 15 Jun 2026 11:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4484982A29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781521984;
	bh=mMwxIoFl9Nk3XaoYrZRMQ1gwQolHRjerGWJcj2U1dnA=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VJM8GLqZ2CptrO2OmzMKlM01uPGTH2hXZWQE+K1Skd2GYJmZtAvWf+bmXjB3Esr/R
	 LlVe/teRLdob2Eb0FDQr8+BfAksk4pRa6xwgFq6fTv6uvGljOsBw7XlBTKEnbF+K1k
	 9s4M3kEXnUE7OiQQoKUyudGt+cC/5j4GKujlKBRErDad5rDfyP2L5YmKojFLdoqTOD
	 nOrXgNFgfYqExzGLqw1pXLp1aKBfk8W9HoxtDQx/HYKqDSBCNMujMAKXm4NXs5kauG
	 VkQDfXM8/njvFtoyTJqizUwnJXhUxDAKUY8HjrTUHhsabOr6A9fArvtMFdgN8/zVHv
	 /tvwQkW92zELQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4484982A29;
	Mon, 15 Jun 2026 11:13:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E37C4DE
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 11:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD13C82A0E
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 11:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdqZ_7DRJcpE for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 11:13:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E0198254A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E0198254A
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E0198254A
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 11:13:01 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0698731E04AC; Mon, 15 Jun 2026 13:12:57 +0200 (CEST)
Date: Mon, 15 Jun 2026 13:12:57 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Message-ID: <ai_eOUXoKOC0S6yd@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.90+deb13.1-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1781521978; bh=1DHPy8Uf1EBu/RVveaotujJoMPblGY0pYubSpVtjKWM=;
 h=Date:From:To:Cc:Subject:From;
 b=Y8kCtXXgQaDQLk1gzdKCi8Ro1K7xsgFaq3iQZyvVTZ99Th78G18mFB6f4oI4/xZFe
 uNa380DpC5si8GiEvMsxri5iFU0jjHY7MqiY2M69PXQIfEmiR1rSYkbasjZkUY/E1W
 C/7l1ttWna2nwlAr6llX3AyHlx+10m6I08yt1p9ZBqa4X0abrgl13TKaGWMWCqh0Eu
 XHqq5PzJycGj3ALsJmuFJXFhv2kNH/ArjmyuUIDLWWKL6DRM0mG7UubJpVEYXhZ6Ju
 iNnzUDvWdxitnVYg4HqkV8En2Ody4J6SkUErowf9lbhBOWlrknmwnOslKq5lybxvML
 QkKXAWvagMFrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/perl-cgi-session: new package
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
https://metacpan.org/pod/CGI::Session

Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/perl-cgi-session/Config.in            | 11 ++++++
 .../perl-cgi-session/perl-cgi-session.hash    |  6 ++++
 package/perl-cgi-session/perl-cgi-session.mk  | 15 ++++++++
 .../tests/package/test_perl_cgi_session.py    | 34 +++++++++++++++++++
 6 files changed, 68 insertions(+)
 create mode 100644 package/perl-cgi-session/Config.in
 create mode 100644 package/perl-cgi-session/perl-cgi-session.hash
 create mode 100644 package/perl-cgi-session/perl-cgi-session.mk
 create mode 100644 support/testing/tests/package/test_perl_cgi_session.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d591c62805..d9612a5e06 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3423,6 +3423,7 @@ F:	package/fbv/
 F:	package/libpam-pkcs11/
 F:	package/mksh/
 F:	package/perl-cgi/
+F:	package/perl-cgi-session/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
diff --git a/package/Config.in b/package/Config.in
index 96e113e226..388b9ff5ee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -814,6 +814,7 @@ menu "Perl libraries/modules"
 	source "package/perl-appconfig/Config.in"
 	source "package/perl-astro-suntime/Config.in"
 	source "package/perl-cgi/Config.in"
+	source "package/perl-cgi-session/Config.in"
 	source "package/perl-class-inspector/Config.in"
 	source "package/perl-class-load/Config.in"
 	source "package/perl-class-method-modifiers/Config.in"
diff --git a/package/perl-cgi-session/Config.in b/package/perl-cgi-session/Config.in
new file mode 100644
index 0000000000..42559cb2b3
--- /dev/null
+++ b/package/perl-cgi-session/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_CGI_SESSION
+	bool "perl-cgi-session"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_CGI # runtime
+	help
+	  Persistent session data in CGI applications.
+
+	  https://metacpan.org/release/CGI-Session
+
+comment "perl-cgi-session needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-cgi-session/perl-cgi-session.hash b/package/perl-cgi-session/perl-cgi-session.hash
new file mode 100644
index 0000000000..1c5b7d2541
--- /dev/null
+++ b/package/perl-cgi-session/perl-cgi-session.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  7f8983aaeb92a0ba77eca8bca6d8d43a  CGI-Session-4.48.tar.gz
+sha256  46756461c24ce7666b8108ddb96dbab612699df3012c80ef11016619fe1554f7  CGI-Session-4.48.tar.gz
+
+# computed by scancpan
+sha256  b9e52465669f1fc29b38ffbc4f39425654611982cbee971aef07f3070446ab28  README
diff --git a/package/perl-cgi-session/perl-cgi-session.mk b/package/perl-cgi-session/perl-cgi-session.mk
new file mode 100644
index 0000000000..4de70cafec
--- /dev/null
+++ b/package/perl-cgi-session/perl-cgi-session.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# perl-cgi-session
+#
+################################################################################
+
+PERL_CGI_SESSION_VERSION = 4.48
+PERL_CGI_SESSION_SOURCE = CGI-Session-$(PERL_CGI_SESSION_VERSION).tar.gz
+PERL_CGI_SESSION_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MARKSTOS
+PERL_CGI_SESSION_DEPENDENCIES = host-perl-module-build
+PERL_CGI_SESSION_LICENSE = Artistic-1.0_1
+PERL_CGI_SESSION_LICENSE_FILES = README
+PERL_CGI_SESSION_DISTNAME = CGI-Session
+
+$(eval $(perl-package))
diff --git a/support/testing/tests/package/test_perl_cgi_session.py b/support/testing/tests/package/test_perl_cgi_session.py
new file mode 100644
index 0000000000..ad722b008e
--- /dev/null
+++ b/support/testing/tests/package/test_perl_cgi_session.py
@@ -0,0 +1,34 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlCGISession(TestPerlBase):
+    """
+    package:
+        CGI-Session
+    direct dependencies:
+        CGI
+    indirect dependencies:
+        Clone   XS
+        Encode-Locale
+        HTML-Parser   XS
+        HTML-Tagset
+        HTTP-Date
+        HTTP-Message
+        IO-HTML
+        LWP-MediaTypes
+        MIME-Base32
+        TimeDate
+        URI
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_CGI_SESSION=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("Clone")
+        self.module_test("HTML::Parser")
+        self.module_test("CGI::Session")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
