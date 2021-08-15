Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C24C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 07:26:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71B6D60E52
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 07:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71B6D60E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49A6080E58;
	Sun, 15 Aug 2021 07:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpG7_5gpw90D; Sun, 15 Aug 2021 07:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD4A8835D9;
	Sun, 15 Aug 2021 07:26:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB7141BF4DB
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 07:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6C90605C7
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 07:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPITieiI9kjv for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 07:25:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1FB9605E2
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 07:25:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 66DA986D9A; Sun, 15 Aug 2021 07:25:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 09:25:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b30697b316ea4e336abebeea34d5c6447688630
X-Git-Newrev: 634dcbd50dd5cf4b25153689e61bcba45163c841
X-Patchwork-Hint: ignore
Message-Id: <20210815072511.66DA986D9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sylpheed: fix CVE-2021-37746
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

commit: https://git.buildroot.net/buildroot/commit/?id=634dcbd50dd5cf4b25153689e61bcba45163c841
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

textview_uri_security_check in textview.c in Claws Mail before 3.18.0,
and Sylpheed through 3.7.0, does not have sufficient link checks before
accepting a click.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...arden-link-checker-before-accepting-click.patch | 37 ++++++++++++++++++++++
 package/sylpheed/sylpheed.mk                       |  3 ++
 2 files changed, 40 insertions(+)

diff --git a/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch b/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
new file mode 100644
index 0000000000..fe3375bc91
--- /dev/null
+++ b/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
@@ -0,0 +1,37 @@
+From ac286a71ed78429e16c612161251b9ea90ccd431 Mon Sep 17 00:00:00 2001
+From: Paul <paul@claws-mail.org>
+Date: Sun, 23 May 2021 12:16:40 +0100
+Subject: [PATCH] harden link checker before accepting click
+
+[Retrieved from:
+https://git.claws-mail.org/?p=claws.git;a=commit;h=ac286a71ed78429e16c612161251b9ea90ccd431]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/textview.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/textview.c b/src/textview.c
+index 62ad46eaf..3cdf5d911 100644
+--- a/src/textview.c
++++ b/src/textview.c
+@@ -2885,7 +2885,7 @@ gboolean textview_uri_security_check(TextView *textview, ClickableText *uri)
+ 	gboolean retval = TRUE;
+ 
+ 	if (is_uri_string(uri->uri) == FALSE)
+-		return TRUE;
++		return FALSE;
+ 
+ 	visible_str = textview_get_visible_uri(textview, uri);
+ 	if (visible_str == NULL)
+@@ -2922,6 +2922,8 @@ gboolean textview_uri_security_check(TextView *textview, ClickableText *uri)
+ 		if (aval == G_ALERTALTERNATE)
+ 			retval = TRUE;
+ 	}
++	if (strlen(uri->uri) > get_uri_len(uri->uri))
++		retval = FALSE;
+ 
+ 	g_free(visible_str);
+ 
+-- 
+2.25.1
+
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 2f8a7aeff9..a7c7adade3 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -14,6 +14,9 @@ SYLPHEED_CPE_ID_VENDOR = sylpheed_project
 SYLPHEED_CONF_OPTS = --disable-gtkspell --disable-gpgme
 SYLPHEED_DEPENDENCIES = host-pkgconf libgtk2
 
+# 0001-harden-link-checker-before-accepting-click.patch
+SYLPHEED_IGNORE_CVES += CVE-2021-37746
+
 # Remove the -I$(includedir) from the Makefiles
 # because it refers to the host /usr/include.
 define SYLPHEED_PRECONFIGURE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
