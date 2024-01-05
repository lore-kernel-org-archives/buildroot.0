Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1DBC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17A20401ED;
	Fri,  5 Jan 2024 12:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17A20401ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPqDvkqe704T; Fri,  5 Jan 2024 12:45:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07656435DF;
	Fri,  5 Jan 2024 12:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07656435DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A6511BF385
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60FCC417B1
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60FCC417B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 86u5gHpAhfcw for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:45:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F73741780
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F73741780
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BDD884406; Fri,  5 Jan 2024 12:45:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 13:43:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d0327c802557bdf892a6aaf3abac57ed15fd80e
X-Git-Newrev: 5b12863107cb73d8263dd24eab1fb15bd9cb5e0f
X-Patchwork-Hint: ignore
Message-Id: <20240105124511.2BDD884406@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lsof: fix build without wchar or
 locale
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5b12863107cb73d8263dd24eab1fb15bd9cb5e0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without wchar or locale raised since
bump to version 4.99.3 in commit
1edafc4b483e82b045d3a0cc9cbbd000d6183ac7 and
https://github.com/lsof-org/lsof/commit/898fe0eceec98ca71198de7d9c18e7ce6144ee13:

In file included from common.h:42,
                 from misc.c:31:
../machine.h:415:26: fatal error: wctype.h: No such file or directory
  415 | #    define WIDECHARINCL <wctype.h>
      |                          ^

Fixes:
 - http://autobuild.buildroot.org/results/aa98b10e8eff5cc4fd03b4a64224cdfb6a0324a5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lsof/lsof.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index bb6eacb696..1831080b17 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -16,14 +16,14 @@ endif
 
 ifeq ($(BR2_USE_WCHAR),)
 define LSOF_CONFIGURE_WCHAR_FIXUPS
-	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' \
+	$(SED) 's,^#[[:space:]]*define HASWIDECHAR.*,#undef HASWIDECHAR,' \
 		$(@D)/machine.h
 endef
 endif
 
 ifeq ($(BR2_ENABLE_LOCALE),)
 define LSOF_CONFIGURE_LOCALE_FIXUPS
-	$(SED) 's,^#define[[:space:]]*HASSETLOCALE.*,#undef HASSETLOCALE,' \
+	$(SED) 's,^#[[:space:]]*define HASSETLOCALE.*,#undef HASSETLOCALE,' \
 		$(@D)/machine.h
 endef
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
