Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1DAC43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8985E824E3;
	Sun, 19 Jun 2022 13:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8985E824E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lFbSBqx2YrlE; Sun, 19 Jun 2022 13:44:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E1182451;
	Sun, 19 Jun 2022 13:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89E1182451
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC0781BF9A4
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B629E414CB
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B629E414CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3jqXUIldilnn for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:43:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EFCB4099B
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EFCB4099B
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 99E9387317; Sun, 19 Jun 2022 13:31:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 15:41:03 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 734bb1b64a6ea2e0f5ceea97a54483bf5fc7c47b
X-Git-Newrev: 707fa376837ef8d7e85b12b94ae9c9579a22d953
X-Patchwork-Hint: ignore
Message-Id: <20220619133125.99E9387317@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/dmalloc: fix
 strndup detection
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

commit: https://git.buildroot.net/buildroot/commit/?id=707fa376837ef8d7e85b12b94ae9c9579a22d953
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix strndup detection as already done for strdup in commit
f9287b263f0808c2f0632aa1560d88e39fbf970b to avoid the following build
failure raised since bump to version 5.6.5 in commit
736932c71552adc4dfa95c5236d1064860900e8a:

In file included from /nvmedata/autobuild/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/string.h:630:0,
                 from append.c:34:
dmalloc.h:396:7: error: expected identifier or '(' before '__extension__'
 char *strndup(const char *string, const DMALLOC_SIZE max_len);
       ^

Fixes:
 - http://autobuild.buildroot.org/results/2164dac43e2607a3570e8f98957a70f579d06cd3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit dcf695206ed3fb61d2828b6e40c91aa7c4c52fe3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmalloc/dmalloc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 93dc45c15d..81ac467277 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -49,6 +49,7 @@ DMALLOC_CONF_ENV = CFLAGS="$(DMALLOC_CFLAGS)"
 define DMALLOC_POST_PATCH
 	$(SED) 's/^ac_cv_page_size=0$$/ac_cv_page_size=12/' $(@D)/configure
 	$(SED) 's/ac_cv_strdup_macro=no$$/ac_cv_strdup_macro=yes/' $(@D)/configure
+	$(SED) 's/ac_cv_strndup_macro=no$$/ac_cv_strndup_macro=yes/' $(@D)/configure
 	$(SED) 's/(ld -/($${LD-ld} -/' $(@D)/configure
 	$(SED) 's/'\''ld -/"$${LD-ld}"'\'' -/' $(@D)/configure
 	$(SED) 's/ar cr/$$(AR) cr/' $(@D)/Makefile.in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
