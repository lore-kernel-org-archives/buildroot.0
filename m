Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01927C5B552
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4E1583B9E;
	Wed,  4 Jun 2025 18:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTzxkxdGrNp5; Wed,  4 Jun 2025 18:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAC4183BFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAC4183BFB;
	Wed,  4 Jun 2025 18:28:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C3C2DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E65B64022B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAoRKJ7EOiEs for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 501F04015E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 501F04015E
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E778876CD; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:28:13 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3e99a1ed42dfc6dbf3e222840a1d953851fa7702
X-Git-Newrev: 08f272db555993483d911cc535b292505ed40e0a
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.4E778876CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sox: add fix for
 CVE-2022-31651
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

commit: https://git.buildroot.net/buildroot/commit/?id=08f272db555993483d911cc535b292505ed40e0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Patch comes from Debian. The CVEs are not reported by pkg-stats
because the NVD database has associated it to the sox_project:sox
vendor/product CPE. This has been reported to NVD:

  https://lore.kernel.org/buildroot/20250517220322.4da9bdb3@windsurf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c678e334e04d9563c05c786832db7473456572db)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../sox/0010-formats-reject-implausible-rate.patch | 39 ++++++++++++++++++++++
 package/sox/sox.mk                                 |  5 +++
 2 files changed, 44 insertions(+)

diff --git a/package/sox/0010-formats-reject-implausible-rate.patch b/package/sox/0010-formats-reject-implausible-rate.patch
new file mode 100644
index 0000000000..5e60b62011
--- /dev/null
+++ b/package/sox/0010-formats-reject-implausible-rate.patch
@@ -0,0 +1,39 @@
+From 6af0a8b32df4d7a83fd52a963a20e6e321f10fd6 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sat, 17 May 2025 23:05:33 +0200
+Subject: [PATCH] formats: reject implausible rate
+
+Bug: https://sourceforge.net/p/sox/bugs/360/
+Bug-Debian: https://bugs.debian.org/1012516
+
+Upstream: https://sourceforge.net/p/sox/bugs/360/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/formats_i.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/formats_i.c b/src/formats_i.c
+index 6a7c27e3..5f5ef979 100644
+--- a/src/formats_i.c
++++ b/src/formats_i.c
+@@ -70,9 +70,15 @@ int lsx_check_read_params(sox_format_t * ft, unsigned channels,
+     ft->signal.channels = channels;
+   }
+ 
+-  if (rate && ft->signal.rate && ft->signal.rate != rate)
++  if (rate && ft->signal.rate && ft->signal.rate != rate) {
+     lsx_warn("`%s': overriding sample rate", ft->filename);
+-  else ft->signal.rate = rate;
++  /* Since NaN comparisons yield false, the negation rejects them. */
++  } else if (!(rate > 0)) {
++    lsx_fail_errno(ft, EINVAL, "invalid rate value");
++    return SOX_EOF;
++  } else {
++    ft->signal.rate = rate;
++  }
+ 
+   if (encoding && ft->encoding.encoding && ft->encoding.encoding != encoding)
+     lsx_warn("`%s': overriding encoding type", ft->filename);
+-- 
+2.49.0
+
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index f76a338661..c0d903f9d4 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -79,6 +79,11 @@ SOX_IGNORE_CVES += CVE-2021-40426
 # due to the change of CPE ID to sox_project:sox in the NVD database
 SOX_IGNORE_CVES += CVE-2022-31650 CVE-2023-26590
 
+# 0010-formats-reject-implausible-rate.patch
+# This entry is NOT stale, those CVEs are not reported by pkg-stats
+# due to the change of CPE ID to sox_project:sox in the NVD database
+SOX_IGNORE_CVES += CVE-2022-31651
+
 SOX_CONF_OPTS = \
 	--with-distro="Buildroot" \
 	--disable-stack-protector
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
