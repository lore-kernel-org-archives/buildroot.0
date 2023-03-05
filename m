Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D284CC61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 18:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7286060FD5;
	Sun,  5 Mar 2023 18:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7286060FD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pA_DzKIwx135; Sun,  5 Mar 2023 18:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A403C60FCD;
	Sun,  5 Mar 2023 18:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A403C60FCD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4F361BF3A9
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BED95402DD
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BED95402DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7xmPJT_NWKjO for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 18:58:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9843C40228
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 18:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9843C40228
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 826FE868CF; Sun,  5 Mar 2023 18:58:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 19:54:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1312da7650b41d95aecf29fab85fd6a9903c507
X-Git-Newrev: 6454358fe16912b17d56db6767cfac8d67c34204
X-Patchwork-Hint: ignore
Message-Id: <20230305185825.826FE868CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pugixml: drop header-only option
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

commit: https://git.buildroot.net/buildroot/commit/?id=6454358fe16912b17d56db6767cfac8d67c34204
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Header-only option raises the following build failure with gerbera since
commit cc3a4a7b1de7b158354c650d234339e8a969a730:

/home/thomas/autobuild/instance-2/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: CMakeFiles/gerbera.dir/src/main.cc.o: in function `ConfigGenerator::~ConfigGenerator()':
/home/thomas/autobuild/instance-2/output-1/build/gerbera-1.10.0/src/config/config_generator.h:33: undefined reference to `pugi::xml_document::~xml_document()'

This build failure can't be fixed by adding a
!BR2_PACKAGE_PUGIXML_HEADER_ONLY dependency as it will create the
following recursive dependency:

package/gerbera/Config.in:1:error: recursive dependency detected!
package/gerbera/Config.in:1:    symbol BR2_PACKAGE_GERBERA depends on BR2_PACKAGE_PUGIXML_HEADER_ONLY
package/pugixml/Config.in:42:   symbol BR2_PACKAGE_PUGIXML_HEADER_ONLY depends on BR2_PACKAGE_PUGIXML
package/pugixml/Config.in:1:    symbol BR2_PACKAGE_PUGIXML is selected by BR2_PACKAGE_GERBERA

Moreover, commit 48b2e50eb8df36e3e3ab18692bd9e0dde3b38702 stated that
"Compact and header-only modes are not strictly needed for our use case,
but we did the work anyway and may be useful for someone else."

So dropping header-only seems to be the right approach

Fixes:
 - http://autobuild.buildroot.org/results/800537a1ef5f48d24c20aad7a9c96c56dfdc77f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy           | 6 ++++++
 package/pugixml/Config.in  | 9 ---------
 package/pugixml/pugixml.mk | 4 ----
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 381e1e3a8c..a31543d5fa 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_PUGIXML_HEADER_ONLY
+	bool "pugixml header-only removed"
+	select BR2_LEGACY
+	help
+	  The header-only version raises a build failure with gerbera.
+
 config BR2_PACKAGE_UCCP420WLAN
 	bool "uccp420wlan removed"
 	select BR2_LEGACY
diff --git a/package/pugixml/Config.in b/package/pugixml/Config.in
index 6b7d2e3259..d5a3cb3ebb 100644
--- a/package/pugixml/Config.in
+++ b/package/pugixml/Config.in
@@ -39,15 +39,6 @@ config BR2_PACKAGE_PUGIXML_COMPACT
 
 	  http://pugixml.org/docs/manual.html#dom.memory.compact
 
-config BR2_PACKAGE_PUGIXML_HEADER_ONLY
-	bool "Enable header-only version"
-	help
-	  All source code for pugixml will be included in every
-	  translation unit that includes pugixml.hpp. This is how most
-	  of Boost and STL libraries work.
-
-	  http://pugixml.org/docs/manual.html#install.building.header
-
 endif
 
 comment "pugixml needs a toolchain w/ C++"
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index c8d59f0864..415227a40a 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -31,10 +31,6 @@ endif
 PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
 HOST_PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
 
-ifeq ($(BR2_PACKAGE_PUGIXML_HEADER_ONLY),y)
-PUGIXML_BUILD_DEFINES += PUGIXML_HEADER_ONLY
-endif
-
 PUGIXML_CONF_OPTS += -DPUGIXML_BUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
 
 HOST_PUGIXML_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
