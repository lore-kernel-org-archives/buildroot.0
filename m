Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCD8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:01:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FCAB6113A
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FCAB6113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0D6383F73;
	Sat, 11 Sep 2021 15:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGMZV7UILQul; Sat, 11 Sep 2021 15:00:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56F8E8364B;
	Sat, 11 Sep 2021 15:00:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 609931BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49B5C40142
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qrQ85CdmaLsO for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 15:00:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA8DD400E8
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 15:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B812089076; Sat, 11 Sep 2021 14:58:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 16:50:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9985c5d5bfe5ac7864aeb96ff59ac8a9c40e012
X-Git-Newrev: 8dda79970661090f202e1f20e5982ba53fdaeb95
X-Patchwork-Hint: ignore
Message-Id: <20210911145842.B812089076@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gobject-introspection: fix
 --includedir
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8dda79970661090f202e1f20e5982ba53fdaeb95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set includedir to $(STAGING_DIR)/usr/share/gir-1.0 instead of . in
Makefile.introspection or g-ir-compiler won't find .gir files resulting
in a build failure for autotools-based based programs such as gconf
since bump of gobject-introspection to version 1.68.0 in commit
abc110e3624aa4e8a9bd8595b3fdc0aec60845e0:

Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
error parsing file GConf-2.0.gir: Failed to parse included gir GObject-2.0

Fixes:
 - http://autobuild.buildroot.org/results/8180d893cbd27512915a7f8a3adb232b93a98ceb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gobject-introspection/gobject-introspection.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 81938b14df..f34dca7278 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -133,6 +133,12 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 
 	$(SED) "s%typelibdir=.*%typelibdir=\$${prefix}/lib/girepository-1.0%g" \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
+
+	# Set includedir to $(STAGING_DIR)/usr/share/gir-1.0 instead of . or
+	# g-ir-compiler won't find .gir files resulting in a build failure for
+	# autotools-based based programs
+	$(SED) "s%includedir=.%includedir=$(STAGING_DIR)/usr/share/gir-1.0%g" \
+		$(STAGING_DIR)/usr/share/gobject-introspection-1.0/Makefile.introspection
 endef
 GOBJECT_INTROSPECTION_POST_INSTALL_STAGING_HOOKS += GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
