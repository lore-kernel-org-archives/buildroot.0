Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D7AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 23:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D010401E9;
	Wed,  1 Dec 2021 23:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6TQgrGYTlT7; Wed,  1 Dec 2021 23:16:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 896DD4035F;
	Wed,  1 Dec 2021 23:16:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0DE1BF2BA
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 23:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E254607BC
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 23:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IiiUt34nNtA6 for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 23:15:38 +0000 (UTC)
X-Greylist: delayed 00:07:08 by SQLgrey-1.8.0
Received: from secvs04.rockwellcollins.com (secvs04.rockwellcollins.com
 [205.175.225.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91F8960799
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 23:15:38 +0000 (UTC)
IronPort-SDR: iZSUF6BMCz09QwtROEEsWHK0GTrfSIF+DNLY0oRvJ89u/K+JOhs06ygOBhQInFWAG9HuXB8y8n
 rX0howpfmniiQckOBvaj674hxi2Om1qRXdWgGqmPj7eY/2TRjw9SwwPMlLrioot93AcO4gZxV3
 ed57f8d3fxi6QY5LRcVPuxSfUAeOoKpszx55CYW1pcwIKuA7FCukcJYNhiMnEbxnawm4NWOzRB
 AkwPViDzJ6UDrPjuRsmfYgxYaoZY+qAPzJFO3c4ij0IXiWO3nhyxqcyZpTqZBZ9ifng9XafMg2
 ZHw=
Received: from ofwgwc03.rockwellcollins.com (HELO
 crulimr01.rockwellcollins.com) ([205.175.225.12])
 by secvs04.rockwellcollins.com with ESMTP; 01 Dec 2021 17:08:28 -0600
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id B080A600B3;
 Wed,  1 Dec 2021 17:08:28 -0600 (CST)
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 17:08:25 -0600
Message-Id: <20211201230827.35080-1-matthew.weber@collins.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH 1/3] utils/test-pkg: add support for externals
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
From: Matthew Weber via buildroot <buildroot@buildroot.org>
Reply-To: Matthew Weber <matthew.weber@collins.com>
Cc: Matthew Weber <matthew.weber@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support to test-pkg to allow the usage br2-externals, so that
it may be leveraged for packages outside of upstream buildroot as well.

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
 utils/test-pkg | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 526b95b1fb..d0472f176b 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -3,6 +3,7 @@ set -e
 
 TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
 TEMP_CONF=""
+BR2_EXTERNALS=""
 
 do_clean() {
     if [ ! -z "${TEMP_CONF}" ]; then
@@ -17,8 +18,8 @@ main() {
     local -a toolchains
     local pkg_br_name
 
-    o='hakc:d:n:p:r:t:'
-    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
+    o='hakc:d:n:p:r:t:e:'
+    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,externals:,'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -61,6 +62,9 @@ main() {
         (-t|--toolchains-csv)
             toolchains_csv="${2}"; shift 2
             ;;
+        (-e|--externals)
+            BR2_EXTERNALS="${2}"; shift 2
+            ;;
         (--)
             shift; break
             ;;
@@ -155,7 +159,7 @@ build_one() {
 
     mkdir -p "${dir}"
 
-    CONFIG_= support/kconfig/merge_config.sh -O "${dir}" \
+    CONFIG_= support/kconfig/merge_config.sh -e "${BR2_EXTERNALS}" -O "${dir}" \
         "${toolchainconfig}" "support/config-fragments/minimal.config" "${cfg}" \
         >> "${dir}/logfile" 2>&1
     # We want all the options from the snippet to be present as-is (set
@@ -181,7 +185,7 @@ build_one() {
     fi
 
     if [ -n "${pkg}" ]; then
-        if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
+        if ! make BR2_EXTERNAL="${BR2_EXTERNALS}" O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
             return 2
         fi
     fi
@@ -193,14 +197,14 @@ build_one() {
 
     # legal-info done systematically, because some packages have different
     # sources depending on the configuration (e.g. lua-5.2 vs. lua-5.3)
-    if ! make O="${dir}" legal-info >> "${dir}/logfile" 2>&1; then
+    if ! make BR2_EXTERNAL="${BR2_EXTERNALS}" O="${dir}" legal-info >> "${dir}/logfile" 2>&1; then
         return 3
     fi
 
     # If we get here, the build was successful. Clean up the build/host
     # directories to save disk space, unless 'keep' was set.
     if [ ${keep} -ne 1 ]; then
-        make O="${dir}" clean >> "${dir}/logfile" 2>&1
+        make BR2_EXTERNAL="${BR2_EXTERNALS}" O="${dir}" clean >> "${dir}/logfile" 2>&1
     fi
 }
 
@@ -271,6 +275,10 @@ Options:
         Only prepare the .config files, but do not build them. Output the
         list of build directories to stdout, and the status on stderr.
 
+    -e, --externals
+        Externals to be used as part of the build process. Packages from
+        within these externals may be tested.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
