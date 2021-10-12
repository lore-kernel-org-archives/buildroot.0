Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E38C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:55:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F22960F12
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F22960F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14CE882611;
	Tue, 12 Oct 2021 20:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGYTkrGjwCYJ; Tue, 12 Oct 2021 20:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DF37823E0;
	Tue, 12 Oct 2021 20:55:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B9441BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 876B180E05
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s5SUcAQ0MTT7 for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A306B80E20
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:55:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 20F1F95552; Tue, 12 Oct 2021 20:52:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 22:51:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 128af17dce9cc377c5d58fd9f3adb157e6bcb958
X-Git-Newrev: c9aa5a1a8a5b73f2cd6f339e5451c21a566a71e0
X-Patchwork-Hint: ignore
Message-Id: <20211012205221.20F1F95552@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/autoconf: disable gtkdocize
 integration
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9aa5a1a8a5b73f2cd6f339e5451c21a566a71e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 2.70 (which was skipped when bumping to 2.71 in ecd54b65c1)
autoreconf checks if a package uses gtkdoc by check if the macro GTK_DOC_CHECK
is used. If detected, gtkdocize will be run as part of the reconfiguration
process.

http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=dd880a0a6de5602cdd40b770ed6b083b34aa0768

If gtkdocize is not installed, this fails with:

Can't exec "gtkdocize": No such file or directory at /home/buildroot/autobuild/instance-1/output-1/host/share/autoconf/Autom4te/FileUtils.pm line 293.
autoreconf: error: gtkdocize failed with exit status: 2

Defining GTKDOCIZE ensures, that autoreconf succeeds without gtkdocize.

Fixes:
http://autobuild.buildroot.net/results/d0259d1f8bed195e35338ead6c7c33fcc571497a/

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/autoconf/autoconf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 5742ea6c55..7e0850422b 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -23,4 +23,4 @@ $(eval $(host-autotools-package))
 # variables used by other packages
 AUTOCONF = $(HOST_DIR)/bin/autoconf -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
 AUTOHEADER = $(HOST_DIR)/bin/autoheader -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
-AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf -f -i
+AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true GTKDOCIZE=/bin/true $(HOST_DIR)/bin/autoreconf -f -i
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
