Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A09AC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 10:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E30704384C;
	Thu, 11 Jan 2024 10:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E30704384C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4z8EbTwkgrRe; Thu, 11 Jan 2024 10:56:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD6E34384A;
	Thu, 11 Jan 2024 10:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD6E34384A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99A5E1BF2F5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F05B4384C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F05B4384C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AjaCxLwdT2YF for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 10:56:31 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01A194384A
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 10:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01A194384A
Received: by mail.gandi.net (Postfix) with ESMTPSA id D15B9C0002;
 Thu, 11 Jan 2024 10:56:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rNsjb-009k3I-14;
 Thu, 11 Jan 2024 11:56:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 11:56:19 +0100
Message-Id: <20240111105621.2321957-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: set GIT_DIR=. in {HOST,
 TARGET}_MAKE_ENV
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A number of packages try to detect if they are running in a git repo and run
git describe at build time instead of using the hard coded version number if
it succeed, leading to odd version numbers as they end up picking up the
Buildroot git version if building inside a Buildroot git checkout, E.G.:

rauc --version
rauc 2023.11-562-g9c954953b4+

This is because rauc builds with meson and uses vcs_tag:

https://github.com/rauc/rauc/blob/v1.11/meson.build#L168-L171

https://mesonbuild.com/Reference-manual_functions.html#vcs_tag

Another example is micropython, where we already work around it by passing
GIT_DIR=.

In the context of Buildroot the packages are never built in their own git
checkout, so pass GIT_DIR=.  to ensure git doesn't walk back up the
directory tree and finds the Buildroot git repo, which fixes the rauc (and
similar) issues.

>>> rauc 1.11 Building
..
ninja: Entering directory `/home/peko/source/buildroot/output-rauc/build/rauc-1.11//build'
[1/29] Generating version.h with a custom command
fatal: not a git repository: '.'

cat output-rauc/build/rauc-1.11/build/version.h
 #define PACKAGE_STRING "rauc 1.11"

 #define PACKAGE_VERSION "1.11"

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 9fbe960759..3e276d23d6 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -263,7 +263,9 @@ export PERL=$(shell which perl)
 # finds this perl module by exporting the proper value for PERL5LIB.
 export PERL5LIB=$(HOST_DIR)/lib/perl
 
-TARGET_MAKE_ENV = PATH=$(BR_PATH)
+TARGET_MAKE_ENV = \
+	GIT_DIR=. \
+	PATH=$(BR_PATH)
 
 TARGET_CONFIGURE_OPTS = \
 	$(TARGET_MAKE_ENV) \
@@ -307,6 +309,7 @@ TARGET_CONFIGURE_OPTS = \
 
 
 HOST_MAKE_ENV = \
+	GIT_DIR=. \
 	PATH=$(BR_PATH) \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	PKG_CONFIG_SYSROOT_DIR="/" \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
