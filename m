Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDFDC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:12:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D452160F56
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D452160F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B274483D87;
	Tue,  3 Aug 2021 23:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x5D2OauFgTLf; Tue,  3 Aug 2021 23:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E62B983D6C;
	Tue,  3 Aug 2021 23:12:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E45F31BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C743840685
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ex8RA80dTVkV for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C2D24065A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EE4C5866AF; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 20 Jun 2021 18:33:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0e0abdb034f50affe45e35da2891a77376c0bec7
X-Git-Newrev: 13c30bc923f61744cfec33eb6feffb52019beab2
X-Patchwork-Hint: ignore
Message-Id: <20210803210953.EE4C5866AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsoup: always
 disable tls_check
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

commit: https://git.buildroot.net/buildroot/commit/?id=13c30bc923f61744cfec33eb6feffb52019beab2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Always disable tls_check to avoid the following build failure since bump to
version 2.72.0 in commit 8e5f7f1cfc8fd7a9d5270f6a9707eb9eecfd21da:

../output-1/build/libsoup-2.72.0/meson.build:184:4: ERROR: Can not run test applications in this cross environment.

Indeed, tls_check will run code since
https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c45253243a2deca4880d4f614f2932373445cf9

That is the only thing that this option does: it runs code to check that
libgio is built with TLS support.

While at it, also drop glib-networking build-time dependency

Also mark gnutls as a runtime dependency (it already was used as such).

Fixes:
 - http://autobuild.buildroot.org/results/9e539dc7185cfb81f18438dd36357cb49ef23a5a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libsoup/Config.in  | 4 ++--
 package/libsoup/libsoup.mk | 7 +------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 0c0454c7c2..02e8e8b578 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -24,8 +24,8 @@ config BR2_PACKAGE_LIBSOUP_GNOME
 config BR2_PACKAGE_LIBSOUP_SSL
 	bool "https support"
 	depends on !BR2_STATIC_LIBS # glib-networking, gnutls
-	select BR2_PACKAGE_GLIB_NETWORKING
-	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_GLIB_NETWORKING # runtime
+	select BR2_PACKAGE_GNUTLS # runtime
 	help
 	  Enable HTTPS (SSL) support.
 
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 2f63e9e85c..964488f430 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -30,6 +30,7 @@ LIBSOUP_CONF_OPTS = \
 	-Dntlm=disabled \
 	-Dsysprof=disabled \
 	-Dtests=false \
+	-Dtls_check=false \
 	-Dvapi=disabled
 
 ifeq ($(BR2_PACKAGE_BROTLI),y)
@@ -52,10 +53,4 @@ else
 LIBSOUP_CONF_OPTS += -Dgnome=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
-LIBSOUP_DEPENDENCIES += glib-networking
-else
-LIBSOUP_CONF_OPTS += -Dtls_check=false
-endif
-
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
