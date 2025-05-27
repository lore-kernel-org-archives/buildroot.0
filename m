Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92965C5B552
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CAF86167D;
	Wed,  4 Jun 2025 18:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_ttDLVZAbFd; Wed,  4 Jun 2025 18:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72BD96130E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72BD96130E;
	Wed,  4 Jun 2025 18:28:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54B79DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8502E401E0
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glyjwfIcdcCD for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5842B40164
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5842B40164
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 568FD876DC; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:28:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 08f272db555993483d911cc535b292505ed40e0a
X-Git-Newrev: 8b59257b822ffa77c394819d63edc3c52d0c6b7f
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.568FD876DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sox: add fix for
 CVE-2023-32627
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8b59257b822ffa77c394819d63edc3c52d0c6b7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Patch comes from Debian. The CVEs are not reported by pkg-stats
because the NVD database has associated it to the sox_project:sox
vendor/product CPE. This has been reported to NVD:

  https://lore.kernel.org/buildroot/20250517220322.4da9bdb3@windsurf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0d7e72afb2b2b283cf4ad103df77f86d64c8ea6c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...627-Filter-null-sampling-rate-in-VOC-code.patch | 37 ++++++++++++++++++++++
 package/sox/sox.mk                                 |  5 +++
 2 files changed, 42 insertions(+)

diff --git a/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch b/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
new file mode 100644
index 0000000000..b67d23c12d
--- /dev/null
+++ b/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
@@ -0,0 +1,37 @@
+From 2ab4f13af84f224cfbdd997e027c7348156de463 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sat, 17 May 2025 23:07:34 +0200
+Subject: [PATCH] CVE-2023-32627 Filter null sampling rate in VOC coder
+
+Avoid a divide by zero and out of bound read by rejecting null sampling rate in VOC file
+
+bug: https://sourceforge.net/p/sox/bugs/369/
+bug-redhat: https://bugzilla.redhat.com/show_bug.cgi?id=2212282
+bug-debian: https://bugs.debian.org/1041112
+bug-debian-security: https://security-tracker.debian.org/tracker/CVE-2023-32627
+
+Upstream: https://sourceforge.net/p/sox/bugs/369/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/voc.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/voc.c b/src/voc.c
+index 0ca07f94..d8b982c5 100644
+--- a/src/voc.c
++++ b/src/voc.c
+@@ -353,6 +353,11 @@ static size_t read_samples(sox_format_t * ft, sox_sample_t * buf,
+             v->block_remaining = 0;
+             return done;
+           }
++          if(uc == 0) {
++            lsx_fail_errno(ft, EINVAL, "invalid rate value");
++            v->block_remaining = 0;
++            return done;
++          }
+           *buf = SOX_UNSIGNED_8BIT_TO_SAMPLE(uc,);
+           lsx_adpcm_init(&v->adpcm, 6 - v->size, SOX_SAMPLE_TO_SIGNED_16BIT(*buf, ft->clips));
+           ++buf;
+-- 
+2.49.0
+
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index c0d903f9d4..3c9c939e8c 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -84,6 +84,11 @@ SOX_IGNORE_CVES += CVE-2022-31650 CVE-2023-26590
 # due to the change of CPE ID to sox_project:sox in the NVD database
 SOX_IGNORE_CVES += CVE-2022-31651
 
+# 0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
+# This entry is NOT stale, those CVEs are not reported by pkg-stats
+# due to the change of CPE ID to sox_project:sox in the NVD database
+SOX_IGNORE_CVES += CVE-2023-32627
+
 SOX_CONF_OPTS = \
 	--with-distro="Buildroot" \
 	--disable-stack-protector
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
