Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F220E7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 18:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 099A9846FD;
	Fri, 13 Dec 2024 18:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iy-M4TNKyoRs; Fri, 13 Dec 2024 18:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F1118470C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F1118470C;
	Fri, 13 Dec 2024 18:16:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E403ECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 18:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6578F405DB
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 18:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcRO3ZQld9GB for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 18:16:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20A2E400BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20A2E400BD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 18:16:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06BDF86F19; Fri, 13 Dec 2024 18:16:25 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 19:11:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af8d12953cb41a0b66395488562dc249c6c96b00
X-Git-Newrev: f7530d2bce00301882b7b71995144caafbe04feb
X-Patchwork-Hint: ignore
Message-Id: <20241213181625.06BDF86F19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: Make sequencer dependent
 on rawmidi
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f7530d2bce00301882b7b71995144caafbe04feb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch and adjust dependency to fix build error.

Fixes:
http://autobuild.buildroot.net/results/9a5/9a53d3c1411699f581e3a90d7f517fcb6b9e3de0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...igure-Make-sequencer-dependent-on-rawmidi.patch | 35 ++++++++++++++++++++++
 package/alsa-lib/Config.in                         |  1 +
 2 files changed, 36 insertions(+)

diff --git a/package/alsa-lib/0002-configure-Make-sequencer-dependent-on-rawmidi.patch b/package/alsa-lib/0002-configure-Make-sequencer-dependent-on-rawmidi.patch
new file mode 100644
index 0000000000..fb1d18df36
--- /dev/null
+++ b/package/alsa-lib/0002-configure-Make-sequencer-dependent-on-rawmidi.patch
@@ -0,0 +1,35 @@
+From: Takashi Iwai <tiwai@suse.de>
+Date: Sun, 24 Nov 2024 08:32:29 +0000 (+0100)
+Subject: configure: Make sequencer dependent on rawmidi
+X-Git-Url: https://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff_plain;h=6880219ad4ba55ae8a94a34b7a987b3369f7c96f
+
+configure: Make sequencer dependent on rawmidi
+
+The sequencer feature requires rawmidi implicitly, and it became more
+obvious with UMP support.  Add the dependency check to configure
+script.
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+
+Upstream: https://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff;h=6880219ad4ba55ae8a94a34b7a987b3369f7c96f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+
+diff --git a/configure.ac b/configure.ac
+index 1cd22a59..69aeb978 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -483,6 +483,12 @@ fi
+ AC_SUBST(PYTHON_LIBS)
+ AC_SUBST(PYTHON_INCLUDES)
+ 
++if test "$build_rawmidi" != "yes"; then
++  if test "$build_seq" = "yes"; then
++    AC_ERROR([Cannot enable sequencer without rawmidi])
++  fi
++fi
++
+ AM_CONDITIONAL([BUILD_MIXER], [test x$build_mixer = xyes])
+ AM_CONDITIONAL([BUILD_PCM], [test x$build_pcm = xyes])
+ AM_CONDITIONAL([BUILD_RAWMIDI], [test x$build_rawmidi = xyes])
diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 6df03afe0e..360122f97f 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -65,6 +65,7 @@ config BR2_PACKAGE_ALSA_LIB_HWDEP
 config BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "seq"
 	default y
+	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
 
 config BR2_PACKAGE_ALSA_LIB_UCM
 	bool "ucm"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
