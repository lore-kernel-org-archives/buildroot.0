Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06EAC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4139D40BE2;
	Wed,  8 Feb 2023 14:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4139D40BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zu5RYJUWSTyf; Wed,  8 Feb 2023 14:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BA6A40BF1;
	Wed,  8 Feb 2023 14:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BA6A40BF1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E9CB1BF8B4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16DE540BF1
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16DE540BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sgBQF8DJpf_9 for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:28:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 108B940BE2
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 108B940BE2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0F74846E8; Wed,  8 Feb 2023 14:28:51 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 15:28:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c3466bbeeedad1cfc8fda5120d452fd786d68e4
X-Git-Newrev: dab7a877148adad499a07c5ed785c42707593175
X-Patchwork-Hint: ignore
Message-Id: <20230208142851.F0F74846E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: fix shellcheck errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=dab7a877148adad499a07c5ed785c42707593175
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In utils/test-pkg line 8:
    if [ ! -z "${TEMP_CONF}" ]; then
         ^-- SC2236: Use -n instead of ! -z.

In utils/test-pkg line 75:
        TEMP_CONF=$(mktemp /tmp/test-${pkg}-config.XXXXXX)
                                     ^----^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
        TEMP_CONF=$(mktemp /tmp/test-"${pkg}"-config.XXXXXX)

In utils/test-pkg line 76:
        echo "${pkg_br_name}=y" > ${TEMP_CONF}
                                  ^----------^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
        echo "${pkg_br_name}=y" > "${TEMP_CONF}"

In utils/test-pkg line 86:
    if [ ${random} -gt 0 ]; then
         ^-------^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
    if [ "${random}" -gt 0 ]; then

In utils/test-pkg line 90:
    if [ ${number} -gt 0 ]; then
         ^-------^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
    if [ "${number}" -gt 0 ]; then

In utils/test-pkg line 109:
    toolchains=($(sed -r -e 's/,.*//; /internal/d; /^#/d; /^$/d;' "${toolchains_csv}" \
                ^-- SC2207: Prefer mapfile or read -a to split command output (or quote to avoid splitting).

In utils/test-pkg line 110:
                  |if [ ${random} -gt 0 ]; then \
                        ^-------^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
                  |if [ "${random}" -gt 0 ]; then \

In utils/test-pkg line 111:
                      sort -R |head -n ${random}
                                       ^-------^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
                      sort -R |head -n "${random}"

In utils/test-pkg line 121:
    if [ ${nb_tc} -eq 0 ]; then
         ^------^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
    if [ "${nb_tc}" -eq 0 ]; then

In utils/test-pkg line 134:
        printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
                                                          ^---^ SC2086: Double quote to prevent globbing and word splitting.
                                                                ^------^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
        printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} "${nb}" "${nb_tc}"

In utils/test-pkg line 146:
        ${nb} ${nb_skip} ${nb_fail} ${nb_legal} ${nb_show}
        ^---^ SC2086: Double quote to prevent globbing and word splitting.
              ^--------^ SC2086: Double quote to prevent globbing and word splitting.
                         ^--------^ SC2086: Double quote to prevent globbing and word splitting.
                                    ^---------^ SC2086: Double quote to prevent globbing and word splitting.
                                                ^--------^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
        "${nb}" "${nb_skip}" "${nb_fail}" "${nb_legal}" "${nb_show}"

In utils/test-pkg line 160:
    CONFIG_= support/kconfig/merge_config.sh -O "${dir}" \
            ^-- SC1007: Remove space after = if trying to assign a value (for empty string, use var='' ... ).

In utils/test-pkg line 181:
    if [ ${prepare_only} -eq 1 ]; then
         ^-------------^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
    if [ "${prepare_only}" -eq 1 ]; then

For more information:
  https://www.shellcheck.net/wiki/SC1007 -- Remove space after = if trying to...
  https://www.shellcheck.net/wiki/SC2207 -- Prefer mapfile or read -a to spli...
  https://www.shellcheck.net/wiki/SC2086 -- Double quote to prevent globbing ...

The suggestions from shellcheck can be applied.

This script already uses bash so we can rely on mapfile.

The warning about CONFIG_= assignment misinterpreted the intention: we
don't want to assign to CONFIG_, we want to clear it from the
environment. Spell this as CONFIG_="".

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/test-pkg | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index e7f5464817..19d8713d6a 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -5,7 +5,7 @@ TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
 TEMP_CONF=""
 
 do_clean() {
-    if [ ! -z "${TEMP_CONF}" ]; then
+    if [ -n "${TEMP_CONF}" ]; then
         rm -f "${TEMP_CONF}"
     fi
 }
@@ -72,8 +72,8 @@ main() {
     if [ -z "${cfg}" ]; then
         pkg_br_name="${pkg//-/_}"
         pkg_br_name="BR2_PACKAGE_${pkg_br_name^^}"
-        TEMP_CONF=$(mktemp /tmp/test-${pkg}-config.XXXXXX)
-        echo "${pkg_br_name}=y" > ${TEMP_CONF}
+        TEMP_CONF="$(mktemp /tmp/test-"${pkg}"-config.XXXXXX)"
+        echo "${pkg_br_name}=y" > "${TEMP_CONF}"
         cfg="${TEMP_CONF}"
     fi
     if [ ! -e "${cfg}" ]; then
@@ -83,15 +83,15 @@ main() {
         dir="${HOME}/br-test-pkg"
     fi
 
-    if [ ${random} -gt 0 ]; then
+    if [ "${random}" -gt 0 ]; then
         mode=$((mode+1))
     fi
 
-    if [ ${number} -gt 0 ]; then
+    if [ "${number}" -gt 0 ]; then
         mode=$((mode+1))
     fi
 
-    if [ ${all} -eq 1 ]; then
+    if [ "${all}" -eq 1 ]; then
         mode=$((mode+1))
     fi
 
@@ -106,19 +106,18 @@ main() {
     # Extract the URLs of the toolchains; drop internal toolchains
     # E.g.: http://server/path/to/name.config,arch,libc
     #  -->  http://server/path/to/name.config
-    toolchains=($(sed -r -e 's/,.*//; /internal/d; /^#/d; /^$/d;' "${toolchains_csv}" \
-                  |if [ ${random} -gt 0 ]; then \
-                      sort -R |head -n ${random}
-                  elif [ ${number} -gt 0 ]; then \
-                      head -n ${number}
-                  else
-                      sort
-                  fi
-                 )
-               )
+    mapfile -t toolchains < <(sed -r -e 's/,.*//; /internal/d; /^#/d; /^$/d;' "${toolchains_csv}" \
+                                | if [ "${random}" -gt 0 ]; then \
+                                    sort -R | head -n "${random}"
+                                elif [ "${number}" -gt 0 ]; then \
+                                    head -n "${number}"
+                                else
+                                    sort
+                                fi
+                             )
 
     nb_tc="${#toolchains[@]}"
-    if [ ${nb_tc} -eq 0 ]; then
+    if [ "${nb_tc}" -eq 0 ]; then
         printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
     fi
 
@@ -131,7 +130,7 @@ main() {
         : $((nb++))
         toolchain="$(basename "${toolchainconfig}" .config)"
         build_dir="${dir}/${toolchain}"
-        printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
+        printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} "${nb}" "${nb_tc}"
         build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" "${prepare_only}" && ret=0 || ret=${?}
         case ${ret} in
         (0) printf "OK\n";;
@@ -143,7 +142,7 @@ main() {
     done
 
     printf "%d builds, %d skipped, %d build failed, %d legal-info failed, %d show-info failed\n" \
-        ${nb} ${nb_skip} ${nb_fail} ${nb_legal} ${nb_show}
+        "${nb}" "${nb_skip}" "${nb_fail}" "${nb_legal}" "${nb_show}"
 
     return $((nb_fail + nb_legal))
 }
@@ -157,7 +156,7 @@ build_one() {
 
     mkdir -p "${dir}"
 
-    CONFIG_= support/kconfig/merge_config.sh -O "${dir}" \
+    CONFIG_="" support/kconfig/merge_config.sh -O "${dir}" \
         "${toolchainconfig}" "support/config-fragments/minimal.config" "${cfg}" \
         >> "${dir}/logfile" 2>&1
     # We want all the options from the snippet to be present as-is (set
@@ -178,7 +177,7 @@ build_one() {
     rm -f "${dir}/missing.config"
 
     # Defer building the job to the caller (e.g. a gitlab pipeline)
-    if [ ${prepare_only} -eq 1 ]; then
+    if [ "${prepare_only}" -eq 1 ]; then
         return 0
     fi
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
