Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28C8C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32EB9711E2;
	Mon, 19 May 2025 11:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sshEq8DkqBM; Mon, 19 May 2025 11:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 438D0711EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 438D0711EA;
	Mon, 19 May 2025 11:05:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10879D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C883B410D8
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JN5PCzZD6qGN for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7AFE40D6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7AFE40D6C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E661781E90; Mon, 19 May 2025 10:40:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:15:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1c1ee69fa7ba55b3eefa5d5a326abb0c13220aae
X-Git-Newrev: 34cb164b7e83635e7f3afac226fc6d4a94efafe5
X-Patchwork-Hint: ignore
Message-Id: <20250519104009.E661781E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sox: add fix for
 CVE-2022-31650, CVE-2023-26590
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=34cb164b7e83635e7f3afac226fc6d4a94efafe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Patch comes from Debian. The CVEs are not reported by pkg-stats
because the NVD database has associated it to the sox_project:sox
vendor/product CPE. This has been reported to NVD:

  https://lore.kernel.org/buildroot/20250517220322.4da9bdb3@windsurf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...f-reject-implausibly-large-number-of-chan.patch | 63 ++++++++++++++++++++++
 package/sox/sox.mk                                 |  5 ++
 2 files changed, 68 insertions(+)

diff --git a/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch b/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
new file mode 100644
index 0000000000..fd1d210da1
--- /dev/null
+++ b/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
@@ -0,0 +1,63 @@
+From 452bfd55096e24ff5eb4a5eb491c70125ce05be8 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sat, 17 May 2025 22:55:32 +0200
+Subject: [PATCH] formats+aiff: reject implausibly large number of channels
+
+Bug: https://sourceforge.net/p/sox/bugs/360/
+Bug-Debian: https://bugs.debian.org/1012516
+
+Upstream: https://sourceforge.net/p/sox/bugs/360/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/aiff.c      |  5 +++++
+ src/formats_i.c | 10 ++++++++--
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/src/aiff.c b/src/aiff.c
+index 3a152c58..6de94f32 100644
+--- a/src/aiff.c
++++ b/src/aiff.c
+@@ -619,6 +619,11 @@ int lsx_aiffstartwrite(sox_format_t * ft)
+            At 48 kHz, 16 bits stereo, this gives ~3 hours of audio.
+            Sorry, the AIFF format does not provide for an indefinite
+            number of samples. */
++        if (ft->signal.channels >= (0x7f000000 / (ft->encoding.bits_per_sample >> 3)))
++        {
++                lsx_fail_errno(ft, SOX_EOF, "too many channels for AIFF header");
++                return SOX_EOF;
++        }
+         return(aiffwriteheader(ft, (uint64_t) 0x7f000000 / ((ft->encoding.bits_per_sample>>3)*ft->signal.channels)));
+ }
+ 
+diff --git a/src/formats_i.c b/src/formats_i.c
+index 7048040d..6a7c27e3 100644
+--- a/src/formats_i.c
++++ b/src/formats_i.c
+@@ -19,6 +19,7 @@
+  */
+ 
+ #include "sox_i.h"
++#include <limits.h>
+ #include <string.h>
+ #include <sys/stat.h>
+ #include <stdarg.h>
+@@ -60,9 +61,14 @@ int lsx_check_read_params(sox_format_t * ft, unsigned channels,
+   if (ft->seekable)
+     ft->data_start = lsx_tell(ft);
+ 
+-  if (channels && ft->signal.channels && ft->signal.channels != channels)
++  if (channels && ft->signal.channels && ft->signal.channels != channels) {
+     lsx_warn("`%s': overriding number of channels", ft->filename);
+-  else ft->signal.channels = channels;
++  } else if (channels > SHRT_MAX) {
++    lsx_fail_errno(ft, EINVAL, "implausibly large number of channels");
++    return SOX_EOF;
++  } else {
++    ft->signal.channels = channels;
++  }
+ 
+   if (rate && ft->signal.rate && ft->signal.rate != rate)
+     lsx_warn("`%s': overriding sample rate", ft->filename);
+-- 
+2.49.0
+
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 384d012763..f76a338661 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -74,6 +74,11 @@ SOX_IGNORE_CVES += CVE-2021-23159 CVE-2021-23172 CVE-2023-34318
 # due to the change of CPE ID to libsox_project:libsox in the NVD database
 SOX_IGNORE_CVES += CVE-2021-40426
 
+# 0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
+# This entry is NOT stale, those CVEs are not reported by pkg-stats
+# due to the change of CPE ID to sox_project:sox in the NVD database
+SOX_IGNORE_CVES += CVE-2022-31650 CVE-2023-26590
+
 SOX_CONF_OPTS = \
 	--with-distro="Buildroot" \
 	--disable-stack-protector
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
