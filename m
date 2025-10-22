Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A15CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EBE9612DE;
	Wed, 22 Oct 2025 16:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwsDUjYw1RnB; Wed, 22 Oct 2025 16:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FED261331
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FED261331;
	Wed, 22 Oct 2025 16:41:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E48443F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AC8F83DAD
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ETTfUuTUrXlS for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CE2883DC6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CE2883DC6
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AE3A8615A; Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:38:45 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 1ce872b6349848c7105967e74d1d84977a6c8666
X-Git-Newrev: 5f4b229d21c3a4919709d017d3a0cac360de9b13
X-Patchwork-Hint: ignore
Message-Id: <20251022164130.3AE3A8615A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/zip: add patch
 for CVE-2018-13410
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5f4b229d21c3a4919709d017d3a0cac360de9b13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes the following vulnerability:

- CVE-2018-13410

    Info-ZIP Zip 3.0, when the -T and -TT command-line options are used,
    allows attackers to cause a denial of service (invalid free and
    application crash) or possibly have unspecified other impact because
    of an off-by-one error. NOTE: it is unclear whether there are
    realistic scenarios in which an untrusted party controls the -TT
    value, given that the entire purpose of -TT is execution of
    arbitrary commands

For more information, see:
  - https://nvd.nist.gov//vuln/detail/CVE-2018-13410

This patch also includes the patch 0009 which address a buffer overflow
when passing unicode characters that doesn't have a CVE assigned.

Tested with `./support/testing/run-tests -d dl -o output_folder -k tests.package.test_zip`

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7cb0419b92f5f35ca830e8c60d8080dd17f1dfb5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0009-buffer-overflow-unicode-filename.patch    | 23 ++++++++++++++++++++
 .../zip/0010-buffer-overflow-cve-2018-13410.patch  | 25 ++++++++++++++++++++++
 package/zip/zip.mk                                 |  3 +++
 3 files changed, 51 insertions(+)

diff --git a/package/zip/0009-buffer-overflow-unicode-filename.patch b/package/zip/0009-buffer-overflow-unicode-filename.patch
new file mode 100644
index 0000000000..860b453735
--- /dev/null
+++ b/package/zip/0009-buffer-overflow-unicode-filename.patch
@@ -0,0 +1,23 @@
+From: Shengjing Zhu <shengjing.zhu@canonical.com>
+Subject: Fix buffer overflow when filename contains unicode characters
+Bug-Debian: https://bugs.debian.org/1077054
+Bug-Debian: https://bugs.debian.org/1093629
+Bug-Ubuntu: https://launchpad.net/bugs/2062535
+Forwarded: https://sourceforge.net/p/infozip/bugs/81/
+Origin: https://src.fedoraproject.org/rpms/zip/raw/f41/f/buffer_overflow.patch
+
+Upstream: https://sources.debian.org/src/zip/3.0-15/debian/patches/14-buffer-overflow-unicode-filename.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff -Nura a/fileio.c b/fileio.c
+--- a/fileio.c
++++ b/fileio.c
+@@ -3502,7 +3502,7 @@
+   if ((wc_string = (wchar_t *)malloc((wsize + 1) * sizeof(wchar_t))) == NULL) {
+     ZIPERR(ZE_MEM, "local_to_wide_string");
+   }
+-  wsize = mbstowcs(wc_string, local_string, strlen(local_string) + 1);
++  wsize = mbstowcs(wc_string, local_string, wsize + 1);
+   wc_string[wsize] = (wchar_t) 0;
+ 
+   /* in case wchar_t is not zwchar */
diff --git a/package/zip/0010-buffer-overflow-cve-2018-13410.patch b/package/zip/0010-buffer-overflow-cve-2018-13410.patch
new file mode 100644
index 0000000000..399ab37bc5
--- /dev/null
+++ b/package/zip/0010-buffer-overflow-cve-2018-13410.patch
@@ -0,0 +1,25 @@
+From: Florent 'Skia' Jacquet <florent.jacquet@canonical.com>
+Subject: Fix buffer overflow when using '-T -TT'
+Bug-Debian: https://bugs.debian.org/1093629
+Bug-Ubuntu: https://launchpad.net/bugs/2093024
+Forwarded: https://sourceforge.net/p/infozip/bugs/81/
+
+strlen(unzip_path) + strlen(zipname) + " " + "'" + "'" + '\0'
+The additional space required in the `cmd` buffer is 4, not 3.
+
+CVE: CVE-2018-13410
+Upstream: https://sources.debian.org/src/zip/3.0-15/debian/patches/15-buffer-overflow-cve-2018-13410.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff -Nura a/zip.c b/zip.c
+--- a/zip.c
++++ b/zip.c
+@@ -1437,7 +1437,7 @@
+     /* Replace first {} with archive name.  If no {} append name to string. */
+     here = strstr(unzip_path, "{}");
+ 
+-    if ((cmd = malloc(strlen(unzip_path) + strlen(zipname) + 3)) == NULL) {
++    if ((cmd = malloc(strlen(unzip_path) + strlen(zipname) + 4)) == NULL) {
+       ziperr(ZE_MEM, "building command string for testing archive");
+     }
+ 
diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index 0457ba9414..0a66c146bf 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -12,6 +12,9 @@ ZIP_LICENSE = Info-ZIP
 ZIP_LICENSE_FILES = LICENSE
 ZIP_CPE_ID_VENDOR = info-zip_project
 
+# 0010-buffer-overflow-cve-2018-13410.patch
+ZIP_IGNORE_CVES += CVE-2018-13410
+
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 ZIP_DEPENDENCIES += bzip2
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
