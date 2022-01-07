Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DC9C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 10:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1874E42954;
	Fri,  7 Jan 2022 10:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XNwHVHTDIwQE; Fri,  7 Jan 2022 10:27:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 578CC42940;
	Fri,  7 Jan 2022 10:27:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52BDD1BF2EC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 052F682FD7
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iX68v-3992l2 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 10:27:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3342A80DA5
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 10:27:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6B7BC8296B; Fri,  7 Jan 2022 10:20:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 11:19:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd8f8f8e89b9e2fdfe3262bc685368ad77d96e2a
X-Git-Newrev: 1db15e2853ff5a234e8ed1a70a75b5d426dceec5
X-Patchwork-Hint: ignore
Message-Id: <20220107102059.6B7BC8296B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/dl-wrapper: add concept
 of download post-processing
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

commit: https://git.buildroot.net/buildroot/commit/?id=1db15e2853ff5a234e8ed1a70a75b5d426dceec5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to support package managers such as Cargo (Rust) or Go, we
want to run some custom logic after the main download, but before
packing the tarball and checking the hash.

To implement this, this commit introduces a concept of download
post-processing: if -p <something> is passed to the dl-wrapper, then
support/download/<something>-post-process will be called.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr:
  - double-quote variable expansion when calling post-process script
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/dl-wrapper | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 3185887541..09a6ac1f1a 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -25,7 +25,7 @@ main() {
     local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:lrf:u:q" OPT; do
+    while getopts ":c:d:D:o:n:N:H:lrf:u:qp:" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
@@ -38,6 +38,7 @@ main() {
         r)  recurse="-r";;
         f)  filename="${OPTARG}";;
         u)  uris+=( "${OPTARG}" );;
+        p)  post_process="${OPTARG}";;
         q)  quiet="-q";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
@@ -136,6 +137,12 @@ main() {
             continue
         fi
 
+        if [ -n "${post_process}" ] ; then
+            "${OLDPWD}/support/download/${post_process}-post-process" \
+                -o "${tmpf}" \
+                -n "${raw_base_name}"
+        fi
+
         # cd back to free the temp-dir, so we can remove it later
         cd "${OLDPWD}"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
