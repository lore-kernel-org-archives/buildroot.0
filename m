Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B8FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 08:44:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1425D6113D
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 08:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1425D6113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB85E607A7;
	Mon,  8 Nov 2021 08:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfoIPsATCnco; Mon,  8 Nov 2021 08:44:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29035607A1;
	Mon,  8 Nov 2021 08:44:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89C261BF393
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 08:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8698080DAF
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 08:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syZecltaaMY8 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 08:44:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8169380DB7
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 08:44:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7CD8D8B561; Mon,  8 Nov 2021 08:40:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 09:42:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0787695a50b77e71669bef4e1e67e8f8c8e505ef
X-Git-Newrev: 12ef36004b0f00d00e5b28b01a79791ec69a1aa0
X-Patchwork-Hint: ignore
Message-Id: <20211108084024.7CD8D8B561@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boinc: needs at least gcc 4.8 for
 c++11 features
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

commit: https://git.buildroot.net/buildroot/commit/?id=12ef36004b0f00d00e5b28b01a79791ec69a1aa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/ed3/ed3656f443364f01895600f332816d20e340f315/

hostinfo_unix.cpp:1695:37: error: range-based 'for' loops are not allowed in C++98 mode
         for (const string &ignore : ignore_list) {

Adding -std=c++11 to CXXFLAGS is done in _MAKE_OPTS due to the Makefiles
not passing CXXFLAGS from _CONV_ENV down to client/Makefile.

This is needed since bump to version 7.18.1 in commit
fe79fba3fd52cd6445c5a1d90629c94605c93519 and
https://github.com/BOINC/boinc/commit/ed70369c091923addf5a8d64bed92c0417e91e07

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Peter: extend commit message as suggested by Fabrice Fontaine]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boinc/Config.in | 4 +++-
 package/boinc/boinc.mk  | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/boinc/Config.in b/package/boinc/Config.in
index 5239019a57..72d5440131 100644
--- a/package/boinc/Config.in
+++ b/package/boinc/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BOINC
 	bool "boinc"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBCURL
@@ -16,7 +17,8 @@ config BR2_PACKAGE_BOINC
 
 	  https://boinc.berkeley.edu
 
-comment "boinc needs a toolchain w/ dynamic library, C++, threads"
+comment "boinc needs a toolchain w/ dynamic library, C++, threads, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 567ffc923c..7f78c427ea 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -45,6 +45,8 @@ else
 BOINC_CONF_OPTS += --disable-fcgi
 endif
 
+BOINC_MAKE_OPTS = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
 # Remove boinc-client because it is incompatible with buildroot
 define BOINC_REMOVE_UNNEEDED_FILE
 	$(RM) $(TARGET_DIR)/etc/init.d/boinc-client
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
