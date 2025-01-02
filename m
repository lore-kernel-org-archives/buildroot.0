Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DFAE77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 18:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5993F80D25;
	Thu,  2 Jan 2025 18:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyVAwBcpePPi; Thu,  2 Jan 2025 18:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6746B80D29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6746B80D29;
	Thu,  2 Jan 2025 18:56:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C121F24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1A9B80D25
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Pj3T4f4XW8z for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 18:56:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A3E180D15
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A3E180D15
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EE9582150; Thu,  2 Jan 2025 18:56:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 2 Jan 2025 19:53:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff3861a344d0832e48bc0daee77f8bcd6518d099
X-Git-Newrev: 65127a8a772132c3d0905241563d1978a2b332ba
X-Patchwork-Hint: ignore
Message-Id: <20250102185643.1EE9582150@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl: properly pass CFLAGS/LDFLAGS
 when building host-perl
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

commit: https://git.buildroot.net/buildroot/commit/?id=65127a8a772132c3d0905241563d1978a2b332ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

HOST_CFLAGS and HOST_LDFLAGS are currently not accounted for when
building host-perl. In particular, it means that executables
built/installed by host-perl do not have a RPATH pointing to
HOST_DIR/lib, which can cause issues as libcrypt.so can now be
provided by host-libxcrypt.

This was causing check-host-rpath to complain in the situation where:

1. host-perl was built, with no RPATH, linked against the system
   libcrypt.so

2. host-libxcrypt was built afterwards, installed as
   HOST_DIR/lib/libcrypt.so, which made check-host-rpath complain as
   HOST_DIR/bin/perl is linked against a library present in
   HOST_DIR/lib but doesn't have a RPATH to HOST_DIR/lib

Fixes:

  http://autobuild.buildroot.net/results/d4348d7f872ccd734795a1d071960a696148ed6a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/perl/perl.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 0f7038a048..dc7c0b8d42 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -98,7 +98,9 @@ endef
 HOST_PERL_CONF_OPTS = \
 	-des \
 	-Dprefix="$(HOST_DIR)" \
-	-Dcc="$(HOSTCC)"
+	-Dcc="$(HOSTCC)" \
+	-Dccflags="$(HOST_CFLAGS)" \
+	-Dldflags="$(HOST_LDFLAGS)"
 
 define HOST_PERL_CONFIGURE_CMDS
 	(cd $(@D); $(HOST_MAKE_ENV) HOSTCC='$(HOSTCC_NOCCACHE)' \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
