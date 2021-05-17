Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161FEC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:05:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4CD460F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4CD460F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9675340585;
	Tue,  3 Aug 2021 22:05:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P4Tl9-NcGVBH; Tue,  3 Aug 2021 22:05:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E90BA40565;
	Tue,  3 Aug 2021 22:05:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D0581BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 628654053D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t22LhBR9rIvn for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D27A240494
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 344928399D; Tue,  3 Aug 2021 21:09:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 17 May 2021 22:44:46 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eb251b30084e38e539c004a7e2ebe305ae16a3f3
X-Git-Newrev: 1f187371d002fb321a175233afddb50b2b6c3607
X-Patchwork-Hint: ignore
Message-Id: <20210803210940.344928399D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Makefile: remove cpe-updates
 on clean
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f187371d002fb321a175233afddb50b2b6c3607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit fd7312940aef (Makefile: add new missing-cpe target) added the
rule to generate a set of files to update the NVD.

For an in-tree build, 'make clean' remove the output directory, so
those files are removed. But for an out-of-tree build, the output
directory is not removed, so those files still linger around after a
clean.

Explicitly remove them on clean, to cater for both cases.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Matthew Weber <matthew.weber@collins.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 75ef7f5eb5..c3305f46e9 100644
--- a/Makefile
+++ b/Makefile
@@ -229,6 +229,8 @@ LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/host-manifest.csv
 LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 
+CPE_UPDATES_DIR = $(BASE_DIR)/cpe-updates
+
 BR2_CONFIG = $(CONFIG_DIR)/.config
 
 # Pull in the user's configuration file
@@ -947,11 +949,11 @@ pkg-stats:
 
 .PHONY: missing-cpe
 missing-cpe:
-	$(Q)mkdir -p $(O)/cpe-updates
+	$(Q)mkdir -p $(CPE_UPDATES_DIR)
 	$(Q)cd "$(CONFIG_DIR)" ; \
 	$(TOPDIR)/support/scripts/gen-missing-cpe \
 		--nvd-path $(DL_DIR)/buildroot-nvd \
-		--output $(O)/cpe-updates
+		--output $(CPE_UPDATES_DIR)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
@@ -1087,7 +1089,7 @@ printvars:
 clean:
 	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
-		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR)
+		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR) $(CPE_UPDATES_DIR)
 
 .PHONY: distclean
 distclean: clean
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
