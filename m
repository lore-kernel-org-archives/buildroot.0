Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAF0C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 16:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E1A281010;
	Sun, 28 Jul 2024 16:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xi7CCnx0LrEE; Sun, 28 Jul 2024 16:36:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E0288104C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E0288104C;
	Sun, 28 Jul 2024 16:36:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBDA71BF82C
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 16:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA2AD6067B
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 16:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bzcu6lMMI45h for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 16:36:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD4AF6066A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD4AF6066A
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 16:36:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2F508283E; Sun, 28 Jul 2024 16:36:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 16:32:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7801890c3a076309362b477e9e27952dd4ebbab6
X-Git-Newrev: 6caf350c1a9f5c6907d109e1c55fe420ec1aebd6
X-Patchwork-Hint: ignore
Message-Id: <20240728163645.C2F508283E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: fix menuconfig with GCC 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=6caf350c1a9f5c6907d109e1c55fe420ec1aebd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC 14 errors out on the implicit return type of "main() {}". The
patch also removes the /dev/null redirection of GCC stderr that hid
the actual problem.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reviewed-by: Brandon Maier <brandon.maier@collins.com>
Tested-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...g-gcc-failing-saying-ncurses-is-not-found.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch b/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
new file mode 100644
index 0000000000..4651d8c2c9
--- /dev/null
+++ b/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
@@ -0,0 +1,38 @@
+From ctxnop@gmail.com  Sun Jul 21 12:10:52 2024
+From: ctxnop@gmail.com (Nop)
+Date: Sun, 21 Jul 2024 14:10:52 +0200
+Subject: [PATCH] menuconfig: GCC failing saying ncurses is not found
+
+Newer GCC increased diagnostics levels resulting in considering the
+test code to be invalid. The resulting message was misleading, saying
+that ncurses was not found, while the check failed for an unrelated
+reason which was hidden because GCC stderr was redirected to
+/dev/null.
+
+Signed-off-by: ctxnop <ctxnop@gmail.com>
+Upstream: http://lists.busybox.net/pipermail/busybox/2024-July/090840.html
+[Fiona: rephrased commit message for clarity]
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ scripts/kconfig/lxdialog/check-lxdialog.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh
+b/scripts/kconfig/lxdialog/check-lxdialog.sh
+index 5075ebf2d..c644d1d48 100755
+--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
++++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
+@@ -45,9 +45,9 @@ trap "rm -f $tmp" 0 1 2 3 15
+
+ # Check if we can link to ncurses
+ check() {
+-        $cc -x c - -o $tmp 2>/dev/null <<'EOF'
++	$cc -x c - -o $tmp <<'EOF'
+ #include CURSES_LOC
+-main() {}
++int main() { return 0; }
+ EOF
+ 	if [ $? != 0 ]; then
+ 	    echo " *** Unable to find the ncurses libraries or the"       1>&2
+--
+2.45.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
