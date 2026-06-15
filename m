Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5768FCD98C5
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 13:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8B6B40E33;
	Mon, 15 Jun 2026 13:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1YcUY2s9O04; Mon, 15 Jun 2026 13:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 392B340E3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781531240;
	bh=db01bMwgbl4Sv4pXck6p1aWPdHGdX0tkPnjFPhDNfBo=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tBnQJU92cOCKVu7hDtIpMirDt/dKrVYrZcKpmE80tPhTa7NkVLd16ZM3/BbwqRREk
	 oGAlg0Mvjm0i3anz4hQnfF0kYlVZXrevJ+Riv2gX5pPRgQAn7bC8GF5RzI+tD7asUw
	 Vin7Cm1tuEoR6yfmHQH1gZ3EowWH/LfNLPIA3xYiHhE32obG924vetC36a8NFaLL/P
	 IKWLfsr4ubB/V90fQpuMSJ8jNdizle12Kn6UbstEcs5dISYcxGecxuvbWQVz1aOTlY
	 dJ8sAkW6pg2LZn6kXb8X+zHk+LT5LaX0Se7snS6ttYtjFo+fn9WUMZAwUh+l80VHLP
	 ALhlrJHmnX1vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 392B340E3D;
	Mon, 15 Jun 2026 13:47:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0CC5169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 13:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA32360BFD
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 13:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsgYHhcw7Yzr for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 13:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89FD760BE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89FD760BE9
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89FD760BE9
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 13:47:17 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 754E531E06E6; Mon, 15 Jun 2026 15:47:14 +0200 (CEST)
Date: Mon, 15 Jun 2026 15:47:14 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Message-ID: <ajACYu7LSI58wafz@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.90+deb13.1-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1781531234; bh=6fs4+6RI1YAhzHToDlgL5S4MgXH3IrcIXw2L8oQbp3w=;
 h=Date:From:To:Cc:Subject:From;
 b=u6pvvSUineLcfjRuVIXhLr8sxTOdG0BqFH3zKYUZy4dY9N5woS4Gtg7updHHFRsiR
 dr2ZAIR6aTyAHFqrLUuAVIUEk2YRdLcaXQBweFzj0hBVuz0G+C9boiiR7UQik1k+Of
 n0EDuVOP37LXcK+x7zEe9EhBMfHv3sM2rvGcFhEdJkLZmmLqa3OJLqlBpWTSh0AcQL
 y6tw4EFzw77g3DuG8aIlaIhVlt7iSry72YfbVX13xRl46O11BbsC2TMMlH5skZUK3E
 ONZa+qh3Qg0vFpXO+vr5Ai9wBXeeMLFdhnB6tWsGlgtKhj/sGcV9gJbT90p5P4Xma4
 WPwFWk7m4kaFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/perl-log-message: new package
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
https://metacpan.org/pod/Log::Message

Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/perl-log-message/Config.in             |  6 ++++++
 package/perl-log-message/perl-log-message.hash |  6 ++++++
 package/perl-log-message/perl-log-message.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/perl-log-message/Config.in
 create mode 100644 package/perl-log-message/perl-log-message.hash
 create mode 100644 package/perl-log-message/perl-log-message.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d9612a5e06..605d54b945 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3424,6 +3424,7 @@ F:	package/libpam-pkcs11/
 F:	package/mksh/
 F:	package/perl-cgi/
 F:	package/perl-cgi-session/
+F:	package/perl-log-message/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
diff --git a/package/Config.in b/package/Config.in
index 388b9ff5ee..cc667a763a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -876,6 +876,7 @@ menu "Perl libraries/modules"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-libwww-perl/Config.in"
 	source "package/perl-locale-maketext-lexicon/Config.in"
+	source "package/perl-log-message/Config.in"
 	source "package/perl-lwp-mediatypes/Config.in"
 	source "package/perl-lwp-protocol-https/Config.in"
 	source "package/perl-mail-dkim/Config.in"
diff --git a/package/perl-log-message/Config.in b/package/perl-log-message/Config.in
new file mode 100644
index 0000000000..4834117afd
--- /dev/null
+++ b/package/perl-log-message/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_LOG_MESSAGE
+	bool "perl-log-message"
+	help
+	  Powerful and flexible message logging mechanism.
+
+	  https://metacpan.org/release/Log-Message
diff --git a/package/perl-log-message/perl-log-message.hash b/package/perl-log-message/perl-log-message.hash
new file mode 100644
index 0000000000..7024d994e2
--- /dev/null
+++ b/package/perl-log-message/perl-log-message.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  406fe7d1e37980afa105b663c436c4af  Log-Message-0.08.tar.gz
+sha256  bd697dd62aaf26d118e9f0a0813429deb1c544e4501559879b61fcbdfe99fe46  Log-Message-0.08.tar.gz
+
+# computed by scancpan
+sha256  88ba1a4e4836eb179a5c93ba34d9549024b2c7cae923b6e8263df8f525f168cd  README
diff --git a/package/perl-log-message/perl-log-message.mk b/package/perl-log-message/perl-log-message.mk
new file mode 100644
index 0000000000..f4018e4cf2
--- /dev/null
+++ b/package/perl-log-message/perl-log-message.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-log-message
+#
+################################################################################
+
+PERL_LOG_MESSAGE_VERSION = 0.08
+PERL_LOG_MESSAGE_SOURCE = Log-Message-$(PERL_LOG_MESSAGE_VERSION).tar.gz
+PERL_LOG_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BI/BINGOS
+PERL_LOG_MESSAGE_LICENSE = Artistic or GPL-1.0+
+PERL_LOG_MESSAGE_LICENSE_FILES = README
+PERL_LOG_MESSAGE_DISTNAME = Log-Message
+
+$(eval $(perl-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
