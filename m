Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9AAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 08:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BE244283A;
	Fri, 27 May 2022 08:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XwiHPy6JXswB; Fri, 27 May 2022 08:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3529642838;
	Fri, 27 May 2022 08:11:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0B01BF9D1
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C20481A46
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dR2RgIOYct-u for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 08:11:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57A538134C
 for <buildroot@buildroot.org>; Fri, 27 May 2022 08:11:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 76D6E865C0; Fri, 27 May 2022 08:00:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 10:01:39 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d2ae0e06c0fcb197ad3d9e809b07a5effa21f005
X-Git-Newrev: 4c19c0f29cf7f0e7cfbc1dbf5ba6e75578d9cef2
X-Patchwork-Hint: ignore
Message-Id: <20220527080001.76D6E865C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/netsurf: fix
 build with BR2_OPTIMIZE_FAST
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c19c0f29cf7f0e7cfbc1dbf5ba6e75578d9cef2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disable duktape with BR2_OPTIMIZE_FAST to fix the following build
failure:

In file included from content/handlers/javascript/duktape/duktape.h:195,
                 from build/Linux-framebuffer/duktape/application_cache.c:21:
content/handlers/javascript/duktape/duk_config.h:2861:2: error: #error __FAST_MATH__ defined, refusing to compile
 2861 | #error __FAST_MATH__ defined, refusing to compile
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2f1b42e2be3aa76cbacd84f3d0ad8b13edce6982

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit aa2a017ba911419bc5b54821888007fb3587a495)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsurf/netsurf.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 1064698c12..574c1423df 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -14,6 +14,17 @@ NETSURF_CPE_ID_VENDOR = netsurf-browser
 NETSURF_DEPENDENCIES = expat jpeg libpng \
 	host-bison host-flex host-gperf host-pkgconf host-vim
 
+# internal duktape doesn't build with BR2_OPTIMIZE_FAST
+ifeq ($(BR2_OPTIMIZE_FAST),y)
+define NETSURF_DUKTAPE_CONFIGURE_CMDS
+	echo "override NETSURF_USE_DUKTAPE := NO"       >> $(@D)/netsurf/Makefile.config
+endef
+else
+define NETSURF_DUKTAPE_CONFIGURE_CMDS
+	echo "override NETSURF_USE_DUKTAPE := YES"      >> $(@D)/netsurf/Makefile.config
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_NETSURF_GTK),y)
 NETSURF_DEPENDENCIES += libgtk2
 NETSURF_FRONTEND = gtk2
@@ -77,6 +88,7 @@ endef
 endif
 
 define NETSURF_CONFIGURE_CMDS
+	$(NETSURF_DUKTAPE_CONFIGURE_CMDS)
 	$(NETSURF_ICONV_CONFIGURE_CMDS)
 	$(NETSURF_SVG_CONFIGURE_CMDS)
 	$(NETSURF_FONTLIB_CONFIGURE_CMDS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
