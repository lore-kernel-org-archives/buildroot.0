Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48C1EB64DC
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 14:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C88860B05;
	Sat, 24 Jun 2023 14:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C88860B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j8GVr-ZMy6XE; Sat, 24 Jun 2023 14:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F10460B3F;
	Sat, 24 Jun 2023 14:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F10460B3F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 014F81BF3E0
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCCB181F02
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCCB181F02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZR6kWHc7TNoT for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 14:19:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0E2F81F00
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0E2F81F00
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 14:19:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 783E0A4C00C7;
 Sat, 24 Jun 2023 16:18:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41054)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qD46D-0006J8-0d;
 Sat, 24 Jun 2023 16:18:49 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 16:18:46 +0200
Message-Id: <20230624141847.3243715-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687616329;
 bh=7T9pb4wylIOmUyOYORoLJm4f40VWWUU5ojCRHKoycIE=;
 h=From:To:Cc:Subject:Date:From;
 b=W5Ea0vnUXPOCGAf3jUH85lbTL7LIlxrtD/qBW9DetTLCyz2dacHSKico6HT7AsO7Z
 PUWMUxDA6AUbHJ3tSTea8YXLi1kDYnbupUU8gUC2R31BFhNSvt0BayygLmZPaelVb+
 Mv4NDKHXOxtNP+/eC9anndX1U2Ex27SW1evxXSOh880q94LZzryJ2giRKmt4Mk2ldM
 ka/l4ZnUYhJVT5W/WpwBAb/HM6X9JT5+TRYa1iaroc+7w8GU3IUGN/jjiTkVIlakAI
 d4F1mHQ5FzmKh3YWwIuDh0QP+Kbc2C7I04yZI4fOnikWbc/yoKEzeS69+eJJ/YZIj7
 mxMzFLLvwi8wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=W5Ea0vnU
Subject: [Buildroot] [PATCH v2 1/2] package/heimdal: Use perl module JSON:PP,
 part of core, instead of JSON package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Fixes:
http://autobuild.buildroot.net/results/48b/48b52d205150e30e522b40d1c7b51f339ae8b0db/

This patch ports the existing patch for the samba4 package:
https://git.busybox.net/buildroot/tree/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Fix typo in title, add upstream URL (Yann)

 ...JSON-PP-part-of-core-instead-of-JSON.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch

diff --git a/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch b/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch
new file mode 100644
index 0000000000..7323ac70df
--- /dev/null
+++ b/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch
@@ -0,0 +1,57 @@
+From f6fdb0a28e3bfcb3fd0aa1c81ad59c5411c0d660 Mon Sep 17 00:00:00 2001
+From: Andrew Sim <andrewsimz@gmail.com>
+Date: Sat, 10 Jun 2023 09:00:24 +0200
+Subject: [PATCH] Use perl module JSON:PP, part of core, instead of JSON
+ package
+
+This patch removes the need for an external package.
+
+Ported from
+https://github.com/openwrt/packages/blob/master/net/samba4/patches/105-perl-json-pp.patch
+https://github.com/openwrt/packages/commit/402f4ba4eff65b80a9deaa6085256112bec4d67b#diff-208d4e0345c9d29fbec23d6f655ba794afd3052f5cb8dd73944db72ce81b847b
+
+Upstream: https://github.com/heimdal/heimdal/pull/1176
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ cf/make-proto.pl | 4 ++--
+ configure.ac     | 1 -
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/cf/make-proto.pl b/cf/make-proto.pl
+index 36a040ce6..4af21916b 100644
+--- a/cf/make-proto.pl
++++ b/cf/make-proto.pl
+@@ -4,7 +4,7 @@
+ use Getopt::Std;
+ use File::Compare;
+ 
+-use JSON;
++use JSON::PP
+ 
+ my $comment = 0;
+ my $doxygen = 0;
+@@ -70,7 +70,7 @@ if($opt_x) {
+     my $EXP;
+     local $/;
+     open(EXP, '<', $opt_x) || die "open ${opt_x}";
+-    my $obj = JSON->new->utf8->decode(<EXP>);
++    my $obj = JSON::PP->new->utf8->decode(<EXP>);
+     close $EXP;
+ 
+     foreach my $x (keys %$obj) {
+diff --git a/configure.ac b/configure.ac
+index cedb4c01f..cecd030e6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -56,7 +56,6 @@ if ! test -f "$srcdir/lib/asn1/der-protos.h" ||
+     AC_KRB_PROG_PERL
+     AC_KRB_PERL_MOD(Getopt::Std)
+     AC_KRB_PERL_MOD(File::Compare)
+-    AC_KRB_PERL_MOD(JSON)
+ fi
+ 
+ AC_KRB_PROG_YACC
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
