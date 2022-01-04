Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A467C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12EEE826FB;
	Tue,  4 Jan 2022 17:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FafGneN7B9yH; Tue,  4 Jan 2022 17:17:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D3038141B;
	Tue,  4 Jan 2022 17:17:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 746301BF9B4
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69E8760BDB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gb7e4GmFWAvq for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:17:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E6A060BD2
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:17:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 03EBB82DFB; Tue,  4 Jan 2022 17:11:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 17:52:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee16da9654f83682accea5873732303f355e0c0b
X-Git-Newrev: ee6477095a61a46ad66209f4fd14eaca12b51576
X-Patchwork-Hint: ignore
Message-Id: <20220104171106.03EBB82DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: disable execinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee6477095a61a46ad66209f4fd14eaca12b51576
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable execinfo to avoid the following build failure if libexecinfo is
built before tvheadend since the addition of the package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/peko/autobuild/instance-0/output-1/build/tvheadend-b8710206eb073c72b142bce95846b77a0ffa34a6/build.linux/src/tvhlog.o: in function `tvhlog_backtrace_printf':
/home/peko/autobuild/instance-0/output-1/build/tvheadend-b8710206eb073c72b142bce95846b77a0ffa34a6/src/tvhlog.c:522: undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/ee9ad2c999b622097fe0f1522e7e32184722e548

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0002-configure-add-execinfo-option.patch       | 55 ++++++++++++++++++++++
 package/tvheadend/tvheadend.mk                     |  1 +
 2 files changed, 56 insertions(+)

diff --git a/package/tvheadend/0002-configure-add-execinfo-option.patch b/package/tvheadend/0002-configure-add-execinfo-option.patch
new file mode 100644
index 0000000000..c55d127d58
--- /dev/null
+++ b/package/tvheadend/0002-configure-add-execinfo-option.patch
@@ -0,0 +1,55 @@
+From 04c01e631cb1bf47dd50b1ef92a086308e380eff Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 1 Jan 2022 16:53:29 +0100
+Subject: [PATCH] configure: add execinfo option
+
+Add execinfo option to allow the user to disable the feature even if
+execinfo.h is found on the system
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upsteam status: https://github.com/tvheadend/tvheadend/pull/1431]
+---
+ configure | 17 +++++++++++++++--
+ 1 file changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 4dad024c4..c087502bf 100755
+--- a/configure
++++ b/configure
+@@ -75,6 +75,7 @@ OPTIONS=(
+   "ddci:yes"
+   "cclang_threadsan:no"
+   "gperftools:no"
++  "execinfo:auto"
+ )
+ 
+ #
+@@ -150,11 +151,23 @@ if [ ${PLATFORM} = "freebsd" ]; then
+     # If we don't have libunwind then fallback to execinfo.
+     if ! enabled libunwind
+     then
+-        check_cc_header execinfo
++        if enabled_or_auto execinfo; then
++            if check_cc_header execinfo; then
++                enable execinfo
++            else
++                die "execinfo.h not found (use --disable-execinfo)"
++           fi
++        fi
+     fi
+ 
+ else
+-    check_cc_header execinfo
++    if enabled_or_auto execinfo; then
++        if check_cc_header execinfo; then
++            enable execinfo
++        else
++            die "execinfo.h not found (use --disable-execinfo)"
++        fi
++    fi
+ fi
+ check_cc_option mmx
+ check_cc_option sse2
+-- 
+2.33.0
+
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 4e84e496bf..58ebdcb054 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -161,6 +161,7 @@ define TVHEADEND_CONFIGURE_CMDS
 			--enable-dvbscan \
 			--enable-bundle \
 			--enable-pngquant \
+			--disable-execinfo \
 			--disable-ffmpeg_static \
 			--disable-hdhomerun_static \
 			$(TVHEADEND_CONF_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
