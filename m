Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7D2C001E0
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 13:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8E3381312;
	Thu, 27 Jul 2023 13:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8E3381312
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TD5zOXl2Xf2g; Thu, 27 Jul 2023 13:05:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C93181332;
	Thu, 27 Jul 2023 13:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C93181332
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABCC31BF429
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 13:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D07381332
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 13:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D07381332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZdXthpkf6jVJ for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 13:05:01 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C133781312
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 13:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C133781312
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C532CC0DF1
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 12:51:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 17A4960012;
 Thu, 27 Jul 2023 12:51:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 14:51:23 +0200
Message-ID: <20230727125123.927568-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690462287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZbiEr6gvvhFArdRwRSbQDZi1QnitL9LfdnWZBuxwJmw=;
 b=nYaFdU0gzCbV9Yf3xERydASWLa+a4tlL3fqV8Y77xCyQ0lWy+n1FBbPpCrRGnJTDV3h2bo
 +ksCnAU1eePkZQGt8s/IiZzgpSW1b0RWg8H8JNEqN/fcrCwjiu80laJNiC0D4HtUGvbfSD
 mN2FYzlg9pZxKMhOYkuJNOkbDWLviyOz5ywIEuXf/PHp1D+u9F06KC1LMm2EaNFJ/Lnt9o
 E6JMkDpgpE74ehg3m0hH1y4KHHeP+Sg+OEMNTICTQEEkHk19knp3UX7gYKKmgHFdS1EMzc
 +eBP43jvtMzfhiyhe7KfKIzfz5QRhqkcPZGyLMSGwBx5sYXTryEnugmidsyxUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nYaFdU0g
Subject: [Buildroot] [RFC PATCH 1/1] support/download: allow to use part of
 file in checksum checking
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The checksum checking is done on whole files only using the <pkg>.hash
checksum references.
Among the files checked, files related to licenses are checked.

Some packages do not contain any specific license files and, for
them, some source files are used. These source files contain license
information (usually comments at the beginning of the file).

Using the whole source file for checksum checking in this case can lead
to issues if a br2-external is present and applies some patches to this
source file.
Indeed, patching a package from a br2-external is allowed but in that
case the whole file checksum change and all checksum verification done
on that file fails. In particular 'make legal-info' fails.

Using only the license related part of a source file for checksum
checking solve this issue.
'make legal-info' will fail only if the license part is modify.

Introduce the possibility to have a lines range in <pkg>.hash and, if
present, compute checksum on the part defined by this lines range.

For instance, in <pkg>.hash:
sha256  xxxxxx  foo.c        <-- sha256 on the whole foo.c file
sha256  xxxxxx  foo.c  1,15  <-- sha256 on extraction from line 1 to 15

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 support/download/check-hash | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index 5a47f49bc3..a90c9ca58a 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -45,10 +45,20 @@ fi
 # $1: algo hash
 # $2: known hash
 # $3: file (full path)
+# $4: lines ranges in the form s,e. If present, the checksum is compute on the
+#     file extracted part from line number s to line number e included.
+#     The first line in the file is the line number 1.
+#     If not present, the whole file is used.
 check_one_hash() {
     _h="${1}"
     _known="${2}"
     _file="${3}"
+    _r="${4}"
+
+    base_with_range=${base}
+    if [ ${_r} ]; then
+        base_with_range="${base_with_range}:${_r}"
+    fi
 
     # Note: md5 is supported, but undocumented on purpose.
     # Note: sha3 is not supported, since there is currently no implementation
@@ -64,13 +74,17 @@ check_one_hash() {
     esac
 
     # Do the hashes match?
-    _hash=$( ${_h}sum "${_file}" |cut -d ' ' -f 1 )
+    if [ ${_r} ]; then
+        _hash=$( sed -n "${r} p" ${file} | ${_h}sum |cut -d ' ' -f 1 )
+    else
+        _hash=$( ${_h}sum "${_file}" |cut -d ' ' -f 1 )
+    fi
     if [ "${_hash}" = "${_known}" ]; then
-        printf "%s: OK (%s: %s)\n" "${base}" "${_h}" "${_hash}"
+        printf "%s: OK (%s: %s)\n" "${base_with_range}" "${_h}" "${_hash}"
         return 0
     fi
 
-    printf "ERROR: %s has wrong %s hash:\n" "${base}" "${_h}" >&2
+    printf "ERROR: %s has wrong %s hash:\n" "${base_with_range}" "${_h}" >&2
     printf "ERROR: expected: %s\n" "${_known}" >&2
     printf "ERROR: got     : %s\n" "${_hash}" >&2
     printf "ERROR: Incomplete download, or man-in-the-middle (MITM) attack\n" >&2
@@ -80,7 +94,7 @@ check_one_hash() {
 
 # Do we know one or more hashes for that file?
 nb_checks=0
-while read t h f; do
+while read t h f r; do
     case "${t}" in
         ''|'#'*)
             # Skip comments and empty lines
@@ -88,7 +102,7 @@ while read t h f; do
             ;;
         *)
             if [ "${f}" = "${base}" ]; then
-                check_one_hash "${t}" "${h}" "${file}"
+                check_one_hash "${t}" "${h}" "${file}" "${r}"
                 : $((nb_checks++))
             fi
             ;;
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
