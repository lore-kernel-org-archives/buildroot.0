Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7202DC19F2C
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19B1660AA3;
	Mon,  1 Aug 2022 20:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19B1660AA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jEmhCW0pVWvB; Mon,  1 Aug 2022 20:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25D8D605EC;
	Mon,  1 Aug 2022 20:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25D8D605EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F3571BF25B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A6FB605EC
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A6FB605EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XlQujX-ZJ4kN for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:37:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81D5C605B7
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81D5C605B7
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3735D86C22; Mon,  1 Aug 2022 20:23:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 22:37:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 795ef710027b8f2843ef7a8e3556d7c4b20a7b67
X-Git-Newrev: 7a41d937b4cb63daee6caf7df2a6c502a36ce7d1
X-Patchwork-Hint: ignore
Message-Id: <20220801202340.3735D86C22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysklogd: bump to version 2.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a41d937b4cb63daee6caf7df2a6c502a36ce7d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mostly a bugfix release (critical fixes to syslogd below), which also
includes some features added to the logger tool and libsyslog related
to logging to remote syslog servers, bypassing the local syslogd.

Critical fixes:
  - Prevent over-read when scanning kermel log messages
  - Prevent kernel log file corruption when messages contain control
    codes, notably '\n', now C-style hex encoding is preserved (\x0a)
  - Forwarding of log messages to remote servers stops after a few
    SIGHUPs have been received (bug introduced in v2.4.0)

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 16a8bb4609..bac35ebcc1 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  1d9ed88a772af95c8b46c9e92ddc5bf4a76ac233ec5850f084290b80df7e02c4  sysklogd-2.4.0.tar.gz
+sha256  64acdb6ade609a1f42eeb7fbdb25c539b1c16abf2f6ff722606773b84a3c4073  sysklogd-2.4.2.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 9e5932f8fa..b25937df31 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.4.0
+SYSKLOGD_VERSION = 2.4.2
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
