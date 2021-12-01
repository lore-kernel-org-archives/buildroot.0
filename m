Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178B7C433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 23:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E991401E9;
	Wed,  1 Dec 2021 23:08:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlJz49idAORk; Wed,  1 Dec 2021 23:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 917344055A;
	Wed,  1 Dec 2021 23:08:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78F661BF2BA
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 23:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 675FC40437
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 23:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaWzQReWEdxg for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 23:08:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ch3vs05.rockwellcollins.com (ch3vs05.rockwellcollins.com
 [205.175.226.130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE3714017D
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 23:08:29 +0000 (UTC)
IronPort-SDR: 6A5uSrTnVuHtMcEQtWE8hHSxMmQmsxdgB0o1F7Fo/o0yrqAMwYwZJAJLTUfYNT15psgdjYKqzs
 ZMpG3vzRJ0o+vRibn+fIURojwtaiIHR3W6wEHj1w4nyjnTZakLV6AMZg0NrVo54Zt6db8ws4qu
 xMUGBzrKNGqusS3d+unSynkXMKQ3VLjhos95Li3N+0kyIU08DmzEWTKM2VdTRDLvDJU4KD1Suv
 TCAGWon9wwpi/+Z5nznU858OUi/Ia2qtoCvx7x9tSzpeeXRtlupkh69S6tXC4k92sQAx6+iftR
 JzQ=
Received: from ofwch3n02.rockwellcollins.com (HELO
 crulimr01.rockwellcollins.com) ([205.175.226.14])
 by ch3vs05.rockwellcollins.com with ESMTP; 01 Dec 2021 17:08:29 -0600
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id BCD0B60264;
 Wed,  1 Dec 2021 17:08:28 -0600 (CST)
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 17:08:26 -0600
Message-Id: <20211201230827.35080-2-matthew.weber@collins.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211201230827.35080-1-matthew.weber@collins.com>
References: <20211201230827.35080-1-matthew.weber@collins.com>
Subject: [Buildroot] [PATCH 2/3] utils/test-pkg: add ability to fail when
 skipped
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

Add flag to allow the return value to be incremented when a skip
happens, treating the overall run as a failure.

This flag could be used when using test-pkg for local validation of
downstream packages, for example in a user's br2-external. An example of
this could be a user choosing to use test-pkg as part of a CI
infrastructure where the fragment and toolchains are tightly controlled
to test a package against multiple toolchains easily.

In this case, the user would want to lower the rate of false-positives
of that fragment/toolchain configuration if a build is instead skipped
(which may happen in the case of buildroot version bumps where
dependencies could change).

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
 utils/test-pkg | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index d0472f176b..97957008fa 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -18,8 +18,8 @@ main() {
     local -a toolchains
     local pkg_br_name
 
-    o='hakc:d:n:p:r:t:e:'
-    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,externals:,'
+    o='hakc:d:n:p:r:t:e:f'
+    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,externals:,fail-on-skip'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -29,6 +29,7 @@ main() {
     number=0
     mode=0
     prepare_only=0
+    fail_on_skip=0
     toolchains_csv="${TOOLCHAINS_CSV}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
@@ -65,6 +66,9 @@ main() {
         (-e|--externals)
             BR2_EXTERNALS="${2}"; shift 2
             ;;
+        (-f|--fail-on-skip)
+            fail_on_skip=1; shift 1
+            ;;
         (--)
             shift; break
             ;;
@@ -147,7 +151,12 @@ main() {
     printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
         ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
 
-    return $((nb_fail + nb_legal))
+    nb_result=$((nb_fail + nb_legal))
+    if [ ${fail_on_skip} ]; then
+        nb_result=$((nb_result + nb_skip))
+    fi
+
+    return $nb_result
 }
 
 build_one() {
@@ -279,6 +288,9 @@ Options:
         Externals to be used as part of the build process. Packages from
         within these externals may be tested.
 
+    -f, --fail-on-skip
+        If any builds are skipped, return a negative exit value.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
