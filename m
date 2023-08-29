Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11602C83F12
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 21:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79E0460F44;
	Tue, 29 Aug 2023 21:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79E0460F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PskWA7yBuNwg; Tue, 29 Aug 2023 21:28:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C46E060ECD;
	Tue, 29 Aug 2023 21:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C46E060ECD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96A6E1BF25B
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7081460DCB
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7081460DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mleyaVly7BPc for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 21:28:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CC7B6080A
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 21:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CC7B6080A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89BF6864C1; Tue, 29 Aug 2023 21:28:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 23:27:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04bc8046305ed326d9ead496bda6368aff058975
X-Git-Newrev: 47b79476fb1a2a4e56e01d51e1f66752293392b3
X-Patchwork-Hint: ignore
Message-Id: <20230829212809.89BF6864C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxcrypt: fix build with perl >=
 5.38
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47b79476fb1a2a4e56e01d51e1f66752293392b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

perl 5.38 deprecated smartmatch (~~ and the given/when syntax).
Backport an upstream patch to drop uses of when.

Fixes:
- http://autobuild.buildroot.net/results/04c/04cf8d79fe8a58c3438e7be95ae781c9b2bef8a0/

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...uildCommon.pm-compatible-with-latest-perl.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/libxcrypt/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch b/package/libxcrypt/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch
new file mode 100644
index 0000000000..7a17fa5c12
--- /dev/null
+++ b/package/libxcrypt/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch
@@ -0,0 +1,50 @@
+From ce562f4d33dc090fcd8f6ea1af3ba32cdc2b3c9c Mon Sep 17 00:00:00 2001
+From: Leon Timmermans <fawaka@gmail.com>
+Date: Tue, 6 Jun 2023 17:03:57 +0200
+Subject: [PATCH] Make BuildCommon.pm compatible with latest perl
+
+It was previously using an experimental feature that has since been dropped.
+This removes the use of that feature.
+
+Upstream: https://github.com/besser82/libxcrypt/commit/ce562f4d33dc090fcd8f6ea1af3ba32cdc2b3c9c
+Signed-off-by: Daniel Lang <dalang@gmx.at>
+---
+ build-aux/scripts/BuildCommon.pm | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/build-aux/scripts/BuildCommon.pm b/build-aux/scripts/BuildCommon.pm
+index 0e6f2a31..c38ba21b 100644
+--- a/build-aux/scripts/BuildCommon.pm
++++ b/build-aux/scripts/BuildCommon.pm
+@@ -11,7 +11,6 @@ use v5.14;    # implicit use strict, use feature ':5.14'
+ use warnings FATAL => 'all';
+ use utf8;
+ use open qw(:utf8);
+-no  if $] >= 5.018, warnings => 'experimental::smartmatch';
+ no  if $] >= 5.022, warnings => 'experimental::re_strict';
+ use if $] >= 5.022, re       => 'strict';
+
+@@ -519,19 +518,19 @@ sub parse_symver_args {
+     my $COMPAT_ABI;
+     local $_;
+     for (@args) {
+-        when (/^SYMVER_MIN=(.+)$/) {
++        if (/^SYMVER_MIN=(.+)$/) {
+             $usage_error->() if defined $SYMVER_MIN;
+             $SYMVER_MIN = $1;
+         }
+-        when (/^SYMVER_FLOOR=(.+)$/) {
++        elsif (/^SYMVER_FLOOR=(.+)$/) {
+             $usage_error->() if defined $SYMVER_FLOOR;
+             $SYMVER_FLOOR = $1;
+         }
+-        when (/^COMPAT_ABI=(.+)$/) {
++        elsif (/^COMPAT_ABI=(.+)$/) {
+             $usage_error->() if defined $COMPAT_ABI;
+             $COMPAT_ABI = $1;
+         }
+-        default {
++        else {
+             $usage_error->() if defined $map_in;
+             $map_in = $_;
+         }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
