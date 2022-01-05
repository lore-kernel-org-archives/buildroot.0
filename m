Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAE6C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 20:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D98966FBBB;
	Wed,  5 Jan 2022 20:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TT0wTnqXoQkV; Wed,  5 Jan 2022 20:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 271CA6FBBC;
	Wed,  5 Jan 2022 20:35:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD3F81BF407
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 20:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB0FB6FBBC
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 20:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Qp2FDtSwvhl for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 20:35:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E32CC6FBBB
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 20:35:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C2ECF813FE; Wed,  5 Jan 2022 20:29:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Jan 2022 21:35:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64843258ce59822ad8d52e75fd4d8fcf10c9b041
X-Git-Newrev: cd9c604c96480819c053811432b7c36073ad785e
X-Patchwork-Hint: ignore
Message-Id: <20220105202916.C2ECF813FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fakedate: fix finding the right
 date executable
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
Content-Type: multipart/mixed; boundary="===============7466334612826667164=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7466334612826667164==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cd9c604c96480819c053811432b7c36073ad785e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we look for the actual date be easrching form the end of the
PATH, and keeping the last-found date that occurs after the wrapper.

However, in some cases, the wrapper will be the last item in the PATH.
This is the cae when users already have the HOST_DIR/bin at the end of
their PATH, à-la:  PATH="${PATH}:/path/to/buildroot/output/host/bin"

In this case, we would not find any matching date.

The issue is that Buildroot adds HOST_DIR/bin at the beginning of the
PATH, so the real date will be to be found after the HOST_DIR that is
early in the PATH, but before the HOST_DIR that is at the end.

We fix the issue by searching the PATH as it is expecte to be searched,
shoud Buildroot had not added its date wrapper: we use the first date
executable that is found in the PATH, starting from the beginning, that
is after our wrapper, abd that is not the wrapper itself.

Signed-off-by: Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
[yann.morin.1998@free.fr:
  - iterate in order from first-to-last
  - stop on the first occurence
  - handle the case where no date was found
  - extend and expand the commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fakedate/fakedate | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
index 9bef113357..7ebbf1f0da 100755
--- a/package/fakedate/fakedate
+++ b/package/fakedate/fakedate
@@ -18,16 +18,23 @@
 # Copyright (C) 2016 Jérôme Pouiller <jezz@sysmic.org>
 #
 
-DATE_BIN=false
 # Do not call any 'date' before us in the PATH, or that would create
 # an infinite recursion.
-for date in $(which -a date |tac); do
+found=false
+for date in $(which -a date); do
     if [ "${date}" -ef "$0" ]; then
+        found=true
+    elif ${found}; then
+        DATE_BIN="${date}"
         break
     fi
-    DATE_BIN="${date}"
 done
 
+if [ -z "${DATE_BIN}" ]; then
+    printf 'fakedate: no real date found in PATH after "%s"\n' "${0}" >&2
+    exit 1
+fi
+
 if [ -n "$SOURCE_DATE_EPOCH" ]; then
     FORCE_EPOCH=1
     for i in "$@"; do

--===============7466334612826667164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7466334612826667164==--
