Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE476C74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 22:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 514F181F36;
	Sat, 18 Mar 2023 22:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 514F181F36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J-l9cZwBWn0p; Sat, 18 Mar 2023 22:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88F2581778;
	Sat, 18 Mar 2023 22:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88F2581778
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCF571BF2FF
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96D6360E24
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96D6360E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jOK-BiqdhVUN for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 22:05:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDE6660E19
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 22:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDE6660E19
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD6C086EA5; Sat, 18 Mar 2023 22:05:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 23:04:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cc99b8cf6765fd12225f512c52b5807ac329d76
X-Git-Newrev: c4173d8b08525f260fea8a2a1e805b806bcba9fc
X-Patchwork-Hint: ignore
Message-Id: <20230318220510.AD6C086EA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools/S10hyperv: fix
 shellcheck warnings
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4173d8b08525f260fea8a2a1e805b806bcba9fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When running "make check-package" on a system with shellcheck 0.9.0,
the command fails with output:

    make check-package
    package/linux-tools/S10hyperv:0: run 'shellcheck' and fix the warnings
    ...
    2 warnings generated

This commit fixes the warnings reported by the command:

    shellcheck package/linux-tools/S10hyperv

This commit also fixes the four-space indent by a single tab on the
changed lines. Since this fixes the indentation warnings of
check-package, the Indent exclusion in .checkpackageignore is also
removed.

Fixes:

    In package/linux-tools/S10hyperv line 27:
        return $ret
               ^--^ SC2086 (info): Double quote to prevent globbing and word splitting.

    In package/linux-tools/S10hyperv line 48:
        return $ret
               ^--^ SC2086 (info): Double quote to prevent globbing and word splitting.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore           | 2 +-
 package/linux-tools/S10hyperv | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 405e1c5677..04966a9b06 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -94,7 +94,7 @@ package/libftdi/0002-libftdi.pc-requires-libusb-fix-static-build.patch Sob
 package/libiio/S99iiod Shellcheck Variables
 package/libmad/0001-mips-h-constraint-removal.patch Sob
 package/lighttpd/S50lighttpd EmptyLastLine Indent Shellcheck Variables
-package/linux-tools/S10hyperv Indent Variables
+package/linux-tools/S10hyperv Variables
 package/linuxptp/S65ptp4l Indent Shellcheck
 package/linuxptp/S66phc2sys Indent Shellcheck
 package/lirc-tools/S25lircd Indent Variables
diff --git a/package/linux-tools/S10hyperv b/package/linux-tools/S10hyperv
index ec934bc972..32887d1b6c 100644
--- a/package/linux-tools/S10hyperv
+++ b/package/linux-tools/S10hyperv
@@ -24,7 +24,7 @@ start() {
 	for prog in ${PROGS}; do
 		start_one "${prog}" || ret=$?
 	done
-    return $ret
+	return "$ret"
 }
 
 stop_one() {
@@ -45,7 +45,7 @@ stop() {
 	for prog in ${PROGS}; do
 		stop_one "${prog}" || ret=$?
 	done
-    return $ret
+	return "$ret"
 }
 
 restart() {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
