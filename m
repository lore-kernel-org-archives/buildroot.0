Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B62CCA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEFA56159D;
	Fri, 29 Aug 2025 10:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tiR5Vq14T36; Fri, 29 Aug 2025 10:27:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05968615B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05968615B2;
	Fri, 29 Aug 2025 10:27:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 709D26C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56F9C81DF7
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vApA9rr0dGy0 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AF4381CDC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AF4381CDC
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 852D987D60; Fri, 29 Aug 2025 10:27:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:26:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6b8ddab6e596d658a1ed8d516ad10f306f0232f
X-Git-Newrev: f3be464f7ad6f1376e929010bce55950b6710632
X-Patchwork-Hint: ignore
Message-Id: <20250829102746.852D987D60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/test-pkg: add new option
 -T/--toolchain-name
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
Content-Type: multipart/mixed; boundary="===============2093104504971021381=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2093104504971021381==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f3be464f7ad6f1376e929010bce55950b6710632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recently when trying to reproduce a build error with test-pkg on the toolchain
br-arm-basic, I had to create a new CSV file with that toolchain only to be
able to run the test in that single case.

I believe having a command-line option right away in test-pkg would make this
much easier, as I can now run: `./utils/test-pkg -T br-arm-basic -p redis`

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/test-pkg | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index cd77964252..cea7ace7cb 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -22,8 +22,8 @@ main() {
     local -a toolchains
     local pkg_br_name
 
-    o='hakc:d:n:p:r:t:'
-    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
+    o='hakc:d:n:p:r:t:T:'
+    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,toolchain-name:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -66,6 +66,9 @@ main() {
         (-t|--toolchains-csv)
             toolchains_csv="${2}"; shift 2
             ;;
+        (-T|--toolchain-name)
+            toolchain_name="${2}"; shift 2
+            ;;
         (--)
             shift; break
             ;;
@@ -113,7 +116,9 @@ main() {
     # E.g.: http://server/path/to/name.config,arch,libc
     #  -->  http://server/path/to/name.config
     mapfile -t toolchains < <(sed -r -e 's/,.*//; /internal/d; /^#/d; /^$/d;' "${toolchains_csv}" \
-                                | if [ "${random}" -gt 0 ]; then \
+                                | if [ -n "${toolchain_name}" ]; then \
+                                    grep -E "[/^]${toolchain_name}.config"
+                                elif [ "${random}" -gt 0 ]; then \
                                     sort -R | head -n "${random}"
                                 elif [ "${number}" -gt 0 ]; then \
                                     head -n "${number}"
@@ -288,6 +293,12 @@ Options:
         try. If not specified, the toolchains in ${TOOLCHAINS_CSV} will be
         used.
 
+    -T NAME, --toolchain-name NAME
+        Name of the single toolchain to use. It must be defined in the CSV
+        list of toolchains (see also -t / --toolchains-csv). If this option
+        is specified, then a single build will be performed on that
+        specific toolchain only.
+
     -k, --keep
         Keep the build directories even if the build succeeds.
         Note: the logfile and configuration is always retained, even without

--===============2093104504971021381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2093104504971021381==--
