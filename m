Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46D8C25B79
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 13:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 499568206B;
	Wed, 15 May 2024 13:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NccXbmQqs4QX; Wed, 15 May 2024 13:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51DA382094
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51DA382094;
	Wed, 15 May 2024 13:28:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C908A1BF97C
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 13:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C302440644
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 13:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_lywwF_1SMk for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 13:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC05B4056F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC05B4056F
 for <buildroot@buildroot.org>; Wed, 15 May 2024 13:27:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C629B87320; Wed, 15 May 2024 13:27:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 15:18:09 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 0d9357b3ccadb96d9ff9bff829e582bed8b100a1
X-Git-Newrev: f5a347c1dc11297f57d1b33aaf4f9c936fa2d241
X-Patchwork-Hint: ignore
Message-Id: <20240515132757.C629B87320@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] kconfig/lxdialog: fix
 check() with GCC14
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
Content-Type: multipart/mixed; boundary="===============6248953050786234574=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6248953050786234574==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f5a347c1dc11297f57d1b33aaf4f9c936fa2d241
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

GCC14 now treats implicit int types as error so when check() from
check-lxdialog.sh is called to check whether we can link against ncurses
it will fail silently and the help text indicating to install ncurses is
printed.

However, this is not due to missing ncurses but once the stderr redirect
to /dev/null is removed we can see the root cause:
<stdin>:2:1: error: return type defaults to ‘int’ [-Wimplicit-int]

So, in order for menuconfig to work with GCC14 lets just specify the
return type of main() as int.

Npte that the upstream kconfig in the linux kernel source tree no longer
carries or uses the check-lxdialog.sh script since commit 1c5af5cf9308
(kconfig: refactor ncurses package checks for building mconf and nconf),
so there is no commit we can backport to our kconfig copy.

Signed-off-by: Robert Marko <robimarko@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Tested-by: Petr Vorel <petr.vorel@gmail.com>
[yann.morin.1998@free.fr: add note about upstream kernel]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a6210d28dbf66b2f0a42d945711dfd93c7329feb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/kconfig/lxdialog/check-lxdialog.sh         |  2 +-
 .../22-kconfig-lxdialog-fix-check-with-GCC14.patch | 43 ++++++++++++++++++++++
 support/kconfig/patches/series                     |  1 +
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/support/kconfig/lxdialog/check-lxdialog.sh b/support/kconfig/lxdialog/check-lxdialog.sh
index 16cd9a3186..27d6c30a57 100755
--- a/support/kconfig/lxdialog/check-lxdialog.sh
+++ b/support/kconfig/lxdialog/check-lxdialog.sh
@@ -48,7 +48,7 @@ trap "rm -f $tmp" 0 1 2 3 15
 check() {
         $cc -x c - -o $tmp 2>/dev/null <<'EOF'
 #include CURSES_LOC
-main() {}
+int main() {}
 EOF
 	if [ $? != 0 ]; then
 	    echo " *** Unable to find the ncurses libraries or the"       1>&2
diff --git a/support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch b/support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch
new file mode 100644
index 0000000000..41081bb45d
--- /dev/null
+++ b/support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch
@@ -0,0 +1,43 @@
+From 3ae91337b53fa3ccf0bad7f181fcaf483fab22ee Mon Sep 17 00:00:00 2001
+From: Robert Marko <robimarko@gmail.com>
+Date: Wed, 3 Apr 2024 14:18:07 +0200
+Subject: [PATCH] kconfig/lxdialog: fix check() with GCC14
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC14 now treats implicit int types as error so when check() from
+check-lxdialog.sh is called to check whether we can link against ncurses
+it will fail silently and the help text indicating to install ncurses is
+printed.
+
+However, this is not due to missing ncurses but once the stderr redirect
+to /dev/null is removed we can see the root cause:
+<stdin>:2:1: error: return type defaults to ‘int’ [-Wimplicit-int]
+
+So, in order for menuconfig to work with GCC14 lets just specify the
+return type of main() as int.
+
+Signed-off-by: Robert Marko <robimarko@gmail.com>
+Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
+Tested-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ kconfig/lxdialog/check-lxdialog.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kconfig/lxdialog/check-lxdialog.sh b/kconfig/lxdialog/check-lxdialog.sh
+index 16cd9a3186..27d6c30a57 100755
+--- a/kconfig/lxdialog/check-lxdialog.sh
++++ b/kconfig/lxdialog/check-lxdialog.sh
+@@ -48,7 +48,7 @@ trap "rm -f $tmp" 0 1 2 3 15
+ check() {
+         $cc -x c - -o $tmp 2>/dev/null <<'EOF'
+ #include CURSES_LOC
+-main() {}
++int main() {}
+ EOF
+ 	if [ $? != 0 ]; then
+ 	    echo " *** Unable to find the ncurses libraries or the"       1>&2
+-- 
+2.44.0
+
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index e5a6f69d8f..f120e323b7 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -10,3 +10,4 @@
 19-merge_config.sh-add-br2-external-support.patch
 20-merge_config.sh-Allow-to-define-config-prefix.patch
 21-Avoid-false-positive-matches-from-comment-lines.patch
+22-kconfig-lxdialog-fix-check-with-GCC14.patch

--===============6248953050786234574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6248953050786234574==--
