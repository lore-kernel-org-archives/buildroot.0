Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E64C77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 09:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 738BA60F27;
	Mon,  5 Jun 2023 09:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 738BA60F27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEGoQRxW2liE; Mon,  5 Jun 2023 09:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8061760F17;
	Mon,  5 Jun 2023 09:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8061760F17
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E92321BF3D1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 09:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C05BD417C3
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 09:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C05BD417C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16MKljpjh3Xl for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 09:39:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84B4D417AE
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 09:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84B4D417AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7195486B0D; Mon,  5 Jun 2023 09:39:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 11:36:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c29bf1d2db5afb8a0109260ed2477fa8fc49c2ba
X-Git-Newrev: 35dea785ef6a4c3f3faa91b20da60aef15d1bcdd
X-Patchwork-Hint: ignore
Message-Id: <20230605093927.7195486B0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-http-message: add missing
 reverse dependency from perl-clone
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

commit: https://git.buildroot.net/buildroot/commit/?id=35dea785ef6a4c3f3faa91b20da60aef15d1bcdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] added dependency on perl-clone but forgot to propagate
the reverse dependency on !BR2_STATIC_LIBS.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PERL_CLONE
  Depends on [n]: BR2_PACKAGE_PERL [=y] && !BR2_STATIC_LIBS [=y]
  Selected by [y]:
  - BR2_PACKAGE_PERL_HTTP_MESSAGE [=y] && BR2_PACKAGE_PERL [=y]

http://autobuild.buildroot.org/results/5d5/5d503aaa94b56523c684be7946123921747ebf52

[1] 742258fec06df18782e4bd75b00ca530120312cb

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-http-cookies/Config.in   | 4 ++++
 package/perl-http-daemon/Config.in    | 4 ++++
 package/perl-http-message/Config.in   | 4 ++++
 package/perl-http-negotiate/Config.in | 4 ++++
 package/perl-plack/Config.in          | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/package/perl-http-cookies/Config.in b/package/perl-http-cookies/Config.in
index 3ca461bf83..147d9521bb 100644
--- a/package/perl-http-cookies/Config.in
+++ b/package/perl-http-cookies/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_PERL_HTTP_COOKIES
 	bool "perl-http-cookies"
+	depends on !BR2_STATIC_LIBS # perl-http-message -> perl-clone
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	help
 	  HTTP cookie jars.
 
 	  https://github.com/libwww-perl/HTTP-Cookies
+
+comment "perl-http-cookies needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-http-daemon/Config.in b/package/perl-http-daemon/Config.in
index 0c7ffe723a..4d6277a799 100644
--- a/package/perl-http-daemon/Config.in
+++ b/package/perl-http-daemon/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_DAEMON
 	bool "perl-http-daemon"
+	depends on !BR2_STATIC_LIBS # perl-http-message -> perl-clone
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	select BR2_PACKAGE_PERL_LWP_MEDIATYPES # runtime
@@ -7,3 +8,6 @@ config BR2_PACKAGE_PERL_HTTP_DAEMON
 	  A simple http server class.
 
 	  https://github.com/libwww-perl/HTTP-Daemon
+
+comment "perl-http-daemon needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-http-message/Config.in b/package/perl-http-message/Config.in
index 3c6849487a..e2cb42f941 100644
--- a/package/perl-http-message/Config.in
+++ b/package/perl-http-message/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_MESSAGE
 	bool "perl-http-message"
+	depends on !BR2_STATIC_LIBS # perl-clone
 	select BR2_PACKAGE_PERL_CLONE # runtime
 	select BR2_PACKAGE_PERL_ENCODE_LOCALE # runtime
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
@@ -10,3 +11,6 @@ config BR2_PACKAGE_PERL_HTTP_MESSAGE
 	  HTTP style message (base class).
 
 	  https://github.com/libwww-perl/HTTP-Message
+
+comment "perl-http-message needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-http-negotiate/Config.in b/package/perl-http-negotiate/Config.in
index c519ede2df..2e82ce5ad2 100644
--- a/package/perl-http-negotiate/Config.in
+++ b/package/perl-http-negotiate/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PERL_HTTP_NEGOTIATE
 	bool "perl-http-negotiate"
+	depends on !BR2_STATIC_LIBS # perl-http-message -> perl-clone
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	help
 	  choose a variant to serve.
 
 	  https://metacpan.org/release/HTTP-Negotiate
+
+comment "perl-http-negotiate needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-plack/Config.in b/package/perl-plack/Config.in
index c81ac4a444..420f8257e5 100644
--- a/package/perl-plack/Config.in
+++ b/package/perl-plack/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_PLACK
 	bool "perl-plack"
+	depends on !BR2_STATIC_LIBS # perl-http-message -> perl-clone
 	select BR2_PACKAGE_PERL_APACHE_LOGFORMAT_COMPILER # runtime
 	select BR2_PACKAGE_PERL_COOKIE_BAKER # runtime
 	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE # runtime
@@ -19,3 +20,6 @@ config BR2_PACKAGE_PERL_PLACK
 	  toolkit).
 
 	  https://github.com/plack/Plack
+
+comment "perl-plack needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
