Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF05CC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CAA781754;
	Tue,  2 Jul 2024 19:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVnbb4yoUG0X; Tue,  2 Jul 2024 19:49:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B6D981142
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B6D981142;
	Tue,  2 Jul 2024 19:49:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 398121BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34C8D60BF0
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axhMhQPjs7zv for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BD57606C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BD57606C9
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:49:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E08083B3B; Tue,  2 Jul 2024 19:49:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 21:47:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 700c394b1765fd70cafeb3b59a280f1d75e822e5
X-Git-Newrev: 9e00cceb60e9ac8ec36ec7eb43eb9ef5534b705d
X-Patchwork-Hint: ignore
Message-Id: <20240702194916.2E08083B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/daq: workaround for upstream
 changing the archive
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9e00cceb60e9ac8ec36ec7eb43eb9ef5534b705d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream has changed the archive for the 2.0.7 release since we bumped
in c1f820bd88a5 (package/daq: bump version to 2.0.7). Comparing the old
archive as it is on s.b.o. with the one currently available on upstream,
gives a few deltas, mostly;
  - (C) years changed in comments
  - version string changed from 2.0.6 to 2.0.7
  - changes (that look legit) to autostuff
  - a file dropped (Visual Studio related)

Of course, that means the hashes changed, and no longer match what we
have.

Downloading the file manually and letting wget set the timestamp on it,
reveals the archive is dated 2022-06-08T13:51:59. So, for more than two
years now, we've been relying on the archive we cached on s.b.o.

So, we can't just change the hashes to the new ones, nor can we replace
the archive on s.b.o.

Instead, we use the same trick as was used in c617ebbc977d
(package/python-*: fix hashes for cargo-vendored python packages): we
use the actual, real URL with a query parameter as the _SITE, and we set
_SOURCE to a different name so as not to conflict with the previous
archive.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/daq/daq.hash | 4 ++--
 package/daq/daq.mk   | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/daq/daq.hash b/package/daq/daq.hash
index 0fa1edecc2..82323ed404 100644
--- a/package/daq/daq.hash
+++ b/package/daq/daq.hash
@@ -1,7 +1,7 @@
 # From https://www.snort.org/downloads/snort/md5s
-md5  ea796f001d1b00302e4e69e337ab2460  daq-2.0.7.tar.gz
+md5  60e5ddcafb985fac7374884d28f299d1  daq-2.0.7-modified.tar.gz
 # Locally computed:
-sha256  bdc4e5a24d1ea492c39ee213a63c55466a2e8114b6a9abed609927ae13a7705e  daq-2.0.7.tar.gz
+sha256  d1f6709bc5dbddee3fdf170cdc1e49fb926e2031d4869ecf367a8c47efc87279  daq-2.0.7-modified.tar.gz
 
 # Hash for license files:
 sha256  07f28289c09fd9eb5a6ff7bc710ff40363601b1bbc6f3637d8ed412150e90819  COPYING
diff --git a/package/daq/daq.mk b/package/daq/daq.mk
index 8a5394a63c..27abd4d2f5 100644
--- a/package/daq/daq.mk
+++ b/package/daq/daq.mk
@@ -5,7 +5,11 @@
 ################################################################################
 
 DAQ_VERSION = 2.0.7
-DAQ_SITE = https://www.snort.org/downloads/snort
+# Upstream re-published a modified archive for the same 2.0.7 version, so change
+# its name locally, to avoid conflict with older BR versions which had a hash
+# for the previous archive.
+DAQ_SOURCE = daq-2.0.7-modified.tar.gz
+DAQ_SITE = https://www.snort.org/downloads/snort/daq-$(DAQ_VERSION).tar.gz?buildroot-path=filename
 DAQ_LICENSE = GPL-2.0
 DAQ_LICENSE_FILES = COPYING
 DAQ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
