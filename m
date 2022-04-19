Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F638C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35A3483E70;
	Tue, 19 Apr 2022 20:31:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppSfNZ4s7R5q; Tue, 19 Apr 2022 20:31:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36BDE83E50;
	Tue, 19 Apr 2022 20:31:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B60351BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3C3460AD6
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLHnqq8UNaiz for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:31:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0EC760A9B
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:31:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2FF3B83DBE; Tue, 19 Apr 2022 20:21:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 22:30:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c1324248d7855b35652ed367ec815429d559a7e
X-Git-Newrev: 4bfe7edc4b1b9074385edd03c3ac1e7e6df0889c
X-Patchwork-Hint: ignore
Message-Id: <20220419202147.2FF3B83DBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gzip: security bump to 1.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=4bfe7edc4b1b9074385edd03c3ac1e7e6df0889c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
