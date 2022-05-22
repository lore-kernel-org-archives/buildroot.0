Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A77BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E53EE40256;
	Sun, 22 May 2022 10:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHSo1nZi9uI1; Sun, 22 May 2022 10:32:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5D7E40578;
	Sun, 22 May 2022 10:32:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2FD71BF47E
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BA67400B8
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QG_ZBjtxt0Vm for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:32:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DACF4401AE
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5600286311; Sun, 22 May 2022 10:20:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 12:30:21 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f9332d7aae9d0e4bbe07ff90171ac46e636854ce
X-Git-Newrev: 00f402d3662ce26173438a59fe701c35fed5136d
X-Patchwork-Hint: ignore
Message-Id: <20220522102053.5600286311@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gzip: security
 bump to 1.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=00f402d3662ce26173438a59fe701c35fed5136d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issues:

CVE-2022-1271: arbitrary-file-write vulnerability

zgrep applied to a crafted file name with two or more newlines
can no longer overwrite an arbitrary, attacker-selected file.
[bug introduced in gzip-1.3.10]

https://www.openwall.com/lists/oss-security/2022/04/07/8

Other changes:

** Changes in behavior

  'gzip -l' no longer misreports file lengths 4 GiB and larger.
  Previously, 'gzip -l' output the 32-bit value stored in the gzip
  header even though that is the uncompressed length modulo 2**32.
  Now, 'gzip -l' calculates the uncompressed length by decompressing
  the data and counting the resulting bytes.  Although this can take
  much more time, nowadays the correctness pros seem to outweigh the
  performance cons.

  'zless' is no longer installed on platforms lacking 'less'.

** Bug fixes

  zgrep now names input file on error instead of mislabeling it as
  "(standard input)", if grep supports the GNU -H and --label options.

  'zdiff -C 5' no longer misbehaves by treating '5' as a file name.
  [bug present since the beginning]

  Configure-time options like --program-prefix now work.

Release Announcement:
https://lists.gnu.org/r/bug-gzip/2022-04/msg00011.html

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4bfe7edc4b1b9074385edd03c3ac1e7e6df0889c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gzip/gzip.hash | 4 ++--
 package/gzip/gzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
index 1cf73ff912..80b86f4797 100644
--- a/package/gzip/gzip.hash
+++ b/package/gzip/gzip.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gzip/gzip-1.11.tar.xz.sig
+# https://ftp.gnu.org/gnu/gzip/gzip-1.12.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  9b9a95d68fdcb936849a4d6fada8bf8686cddf58b9b26c9c4289ed0c92a77907  gzip-1.11.tar.xz
+sha256  ce5e03e519f637e1f814011ace35c4f87b33c0bbabeec35baf5fbd3479e91956  gzip-1.12.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 92588fcdb8..2092df363c 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.11
+GZIP_VERSION = 1.12
 GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 # Some other tools expect it to be in /bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
