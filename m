Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED957C61DBD
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 21:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB32880D6A;
	Tue, 25 Aug 2026 21:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeE7bkv0Dyoq; Tue, 25 Aug 2026 21:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787694154;
	bh=3jwDtXHYmXzx17YEPHoywF0kzDVDPZffkZvBgA2deRs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kvk3EArVWtz2PBKIovnHi29PpAbU7KK2MpeKPTOaLlDzsQiH36uU2pyrnB/YFJa6k
	 ZbomK2X7Q9KCAJ7Vwm8790naLjMzQ88T5V0dGMK9WsToFamBT1nW0PQJ+rTjCFlqG8
	 2AEMRv+ymClWge9ByfUc308gDyqUUvAExpZ9DnDhFiygkAh7MVf7yLtIyRMVPCV+97
	 zJYOwR4zTr8IXGzHzfNs92bamcmDNKX5vdHW6Zy+5gW17RlBQ9pxo+c+bsYDnwaNgD
	 GQFNcaZFn83KtDFMnuCPPHCawc37KokRRAvqJr9Gn15s1dQYz6Fa8JXEFBf67QBUpi
	 mXl6tIAuzpf/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4827980D45;
	Tue, 25 Aug 2026 21:42:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9995F3C3
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 976D44008B
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkny8LSiPFWQ for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 21:42:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57A7540055
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:42:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5BE361A1827
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:42:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 32199604C4;
 Tue, 25 Aug 2026 21:42:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E81A11C7A938; 
 Tue, 25 Aug 2026 23:42:24 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2026 23:42:01 +0200
Message-ID: <20260825214203.3708181-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825214203.3708181-1-thomas.petazzoni@bootlin.com>
References: <20260825214203.3708181-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v3 3/3] support/scripts/check-host-bins: add new
 check on host binaries/libs
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

One frequent issue in Buildroot is that when building host libraries
or applications, the build system of the package detects some
libraries provided by the system, and happily links to them, without
Buildroot knowing. Sometimes this doesn't cause any problem, but
sometimes this causes issues, and we're regularly eliminating such
mis-detection by forcing those packages to not detect the system
libraries that have not been built by Buildroot.

Based on a suggestion from Yann E. Morin, this commit extends
check-host-bins to verify that all binaries and libraries in
$(HOST_DIR) only have shared library dependencies on libraries that
are in Buildroot $(HOST_DIR), to the exception of the C library (and
friends), for which we of course use the system C library.

For example, if the binary output/host/bin/plop is linked against
libpng, but libpng was not built and installed by Buildroot, the build
will now fail with:

*** ERROR: package host-gdb uses libs not in HOST_DIR:
  - liblzma.so.5
  - libxxhash.so.0

The script includes an allowlist of libraries provided by the C
library. It is potentially possible that this list might need to be
extended to cover all systems/distributions/C libraries, but only
wider testing of this script will help detect such cases.

Co-developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
It would be very useful if a few people could apply this patch to
their local tree, run their usual build, and see how it behaves. This
way, I can get some feedback to address the most obvious issues before
it gets merged and starts causing build failures in the autobuilders.

Changes since v2:
- Implement the check in the existing check-host-bins script, as
  suggested by Yann E. Morin.

Changes since v1:
- Replaced the per-file file --mime-type checks with direct ELF magic
  detection using Bash read -N 4, significantly reducing scan time.
- Switched file traversal to NUL-delimited find -print0 output, safely
  handling paths containing whitespace.
- Suppressed harmless readelf errors for valid ELF object files
  without a dynamic section, such as the Go test fixtures mentioned
  during review.
- Added librt.so*, libutil.so*, and libresolv.so* to the
  system-library allowlist.
- Quoted file and host-directory paths where appropriate.
- Fixed shellcheck issues

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/check-host-bins | 48 ++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/support/scripts/check-host-bins b/support/scripts/check-host-bins
index 7b48af42ca..098e35e592 100755
--- a/support/scripts/check-host-bins
+++ b/support/scripts/check-host-bins
@@ -21,6 +21,14 @@ main() {
     while read -r file; do
         is_elf "${file}" || continue
         elf_needs_rpath "${file}" "${hostdir}" || continue
+	missing_libs="$(get_missing_libs "${file}" "${hostdir}")"
+        if [ "${missing_libs}" ]; then
+            ret=1
+            printf "***\n"
+            printf "*** ERROR: package %s uses libs not in HOST_DIR:\n" "${pkg}"
+            # shellcheck disable=SC2086 # we need the word splitting
+            printf '  - %s\n' ${missing_libs}
+        fi
         check_elf_has_rpath "${file}" "${hostdir}" "${perpackagedir}" && continue
         if [ ${ret} -eq 0 ]; then
             ret=1
@@ -57,16 +65,44 @@ is_elf() {
 elf_needs_rpath() {
     local file="${1}"
     local hostdir="${2}"
+
+    [ -n "$(get_libs "${file}" "${hostdir}")" ]
+}
+
+# This function returns all non-toolchain libs that are not in HOST_DIR
+get_missing_libs() {
+    local file="${1}"
+    local hostdir="${2}"
+    local lib
+
+    get_libs "${file}" "${hostdir}" \
+    | while read -r lib; do
+        if [ ! -e "${hostdir}/lib/${lib}" ]; then
+            printf '%s\n' "${lib}"
+        fi
+    done
+}
+
+# This function returns the list of non-toolchain libraries that an
+# ELF file has as DT_NEEDED
+get_libs() {
+    local file="${1}"
+    local hostdir="${2}"
     local lib
 
     while read -r lib; do
-        [ -e "${hostdir}/lib/${lib}" ] && return 0
-    done < <( readelf -d "${file}" 2>/dev/null                             \
-              |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
-                     -e 's//\1/;'                                          \
+        case "${lib}" in
+        libc.so*|libm.so*|libstdc++.so*|libpthread.so*|libgcc_s.so*|libdl.so*|ld-*|libgomp.so*|libcrypt.so*|libatomic.so*|librt.so*|libutil.so*|libresolv.so*)
+            continue
+            ;;
+        *)
+            printf '%s\n' "${lib}"
+            ;;
+        esac
+    done < <( readelf -d "${file}" 2>/dev/null                                 \
+                  |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
+                  -e 's//\1/;'                                                 \
             )
-
-    return 1
 }
 
 # This function checks whether at least one of the RPATH of the given
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
