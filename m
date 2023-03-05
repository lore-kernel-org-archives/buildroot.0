Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E82C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 18:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1271C60FAC;
	Sun,  5 Mar 2023 18:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1271C60FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K88kEuLfxTyY; Sun,  5 Mar 2023 18:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42D9360FCF;
	Sun,  5 Mar 2023 18:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42D9360FCF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1941C1BF865
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF94181757
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF94181757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVvxgVrjZuYt for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 18:28:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2BF3817BD
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 18:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2BF3817BD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF7BB86712; Sun,  5 Mar 2023 18:28:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 19:23:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f96255f4a40a5cbc0c37a69126c5a06fe8773b6
X-Git-Newrev: f931ac28192b59fce36e5e63bb5770b598d26def
X-Patchwork-Hint: ignore
Message-Id: <20230305182821.CF7BB86712@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gr-osmosdr: drop
 BR2_PACKAGE_GR_OSMOSDR_PYTHON
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

commit: https://git.buildroot.net/buildroot/commit/?id=f931ac28192b59fce36e5e63bb5770b598d26def
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop BR2_PACKAGE_GR_OSMOSDR_PYTHON as disabling python will raise the
following build failure if BR2_PACKAGE_GNURADIO_PYTHON is set since bump
of gnuradio to version 3.10.4.0 in commit
e37c110bead8b7b35cd97915673fa785ccb39f2d and
https://github.com/gnuradio/gnuradio/commit/51d3ad973292763a6fc0cf8e971faa3cf89029e9:

CMake Error at lib/CMakeLists.txt:51 (add_library):
  Target "gnuradio-osmosdr" links to target "Python::Module" but the target
  was not found.  Perhaps a find_package() call is missing for an IMPORTED
  target, or an ALIAS target is missing?

No entry in Config.in.legacy is needed as python support in gr-osmosdr
will now automatically be enabled if BR2_PACKAGE_GNURADIO_PYTHON is set

Fixes:
 - http://autobuild.buildroot.org/results/49e9f7bf8bfc7008688c1a3bc3744b7d3be3ce18

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gr-osmosdr/Config.in     | 7 -------
 package/gr-osmosdr/gr-osmosdr.mk | 2 +-
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
index 04fa10be80..d83de75282 100644
--- a/package/gr-osmosdr/Config.in
+++ b/package/gr-osmosdr/Config.in
@@ -11,13 +11,6 @@ config BR2_PACKAGE_GR_OSMOSDR
 
 if BR2_PACKAGE_GR_OSMOSDR
 
-config BR2_PACKAGE_GR_OSMOSDR_PYTHON
-	bool "python support"
-	depends on BR2_PACKAGE_GNURADIO_PYTHON
-	depends on BR2_PACKAGE_PYTHON3
-	help
-	  Enable Python support
-
 config BR2_PACKAGE_GR_OSMOSDR_IQFILE
 	bool "IQ File Source support"
 	help
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 89907c1baa..6011a67539 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -22,7 +22,7 @@ GR_OSMOSDR_CONF_OPTS = \
 # compile time.
 GR_OSMOSDR_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_GR_OSMOSDR_PYTHON),y)
+ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
 GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=ON
 GR_OSMOSDR_DEPENDENCIES += python3
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
