Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45D2C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:25:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27E9A60F38
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27E9A60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0BE7402D3;
	Sun,  8 Aug 2021 20:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2JFucuu3l4z; Sun,  8 Aug 2021 20:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C25E4021F;
	Sun,  8 Aug 2021 20:25:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70CC11BF422
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60DFE82896
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uHX-amItigIr for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 20:25:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4E8482884
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 20:25:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 460908D2C9; Sun,  8 Aug 2021 20:25:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 22:25:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a8ef2f3f7bc211d38a5a37007bdeb489bd37aae
X-Git-Newrev: 521d387640d704f24caee51841388d98bcac739b
X-Patchwork-Hint: ignore
Message-Id: <20210808202523.460908D2C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gobject-introspection: fix
 datarootdir
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=521d387640d704f24caee51841388d98bcac739b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

datarootdir has been removed since version 1.66 and
https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/a88b1ac548516ab25140a2e9dea8cac894bbac93
resulting in the following build failures with autotools-based
applications using introspection (e.g. libmediaart or libsecret) if
gobject-introspection is not installed on host since commit
abc110e3624aa4e8a9bd8595b3fdc0aec60845e0:

make[3]: *** No rule to make target 'MediaArt-2.0.typelib', needed by 'all'.  Stop.

or

Makefile:2917: /usr/share/gobject-introspection-1.0/Makefile.introspection: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/70585b81fd6aa78e2aa6e5173f35c0f26a1408a9
 - http://autobuild.buildroot.org/results/95aa8e189f3326ecae6133e298c56ffcbbc3198f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gobject-introspection/gobject-introspection.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index d8138b2e96..fbc545b3c7 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -116,12 +116,12 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 
 	# Gobject-introspection installs Makefile.introspection in
 	# $(STAGING_DIR)/usr/share which is needed for autotools-based programs to
-	# build .gir and .typelib files. Unfortuantly, gobject-introspection-1.0.pc
+	# build .gir and .typelib files. Unfortunately, gobject-introspection-1.0.pc
 	# uses $(prefix)/share as the directory, which
 	# causes the host /usr/share being used instead of $(STAGING_DIR)/usr/share.
-	# Change datarootdir to $(libdir)/../share which will prefix $(STAGING_DIR)
+	# Change datadir to $(libdir)/../share which will prefix $(STAGING_DIR)
 	# to the correct location.
-	$(SED) "s%datarootdir=.*%datarootdir=\$${libdir}/../share%g" \
+	$(SED) "s%datadir=.*%datadir=\$${libdir}/../share%g" \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
 
 	# By default, girdir and typelibdir use datadir and libdir as their prefix,
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
