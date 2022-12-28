Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB949C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88A004F31D;
	Mon, 20 Feb 2023 22:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88A004F31D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ytvLGRFMvmss; Mon, 20 Feb 2023 22:48:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 043154F311;
	Mon, 20 Feb 2023 22:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 043154F311
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E077F1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE5E5416C3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE5E5416C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pl0bgfPEnsWk for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA75D416E4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA75D416E4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D74AC86494; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 11:01:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d77db2df74a3ccb430cbc326edef2c4a588878b0
X-Git-Newrev: 6264dfae49af69d7358f2d6fef21bd720e62440f
X-Patchwork-Hint: ignore
Message-Id: <20230220205216.D74AC86494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/aubio: switch to
 external waf script
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

commit: https://git.buildroot.net/buildroot/commit/?id=6264dfae49af69d7358f2d6fef21bd720e62440f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since the python 3.11 version bump [1], the waf script
bundled in aubio 0.4.9 can't be executed anymore due
to a waf bug [2].

Use the waf script provided by the Buildroot waf package
infrastructure after removing the old waf script and its
libraries.

Fixes:
http://autobuild.buildroot.org/results/e2b/e2be18415ca794c68e708f2fdfd0a1a1ff5be714

[1] 738500c296c8b1206f20e94ca3e7c5932a6a0486
[2] https://gitlab.com/ita1024/waf/-/commit/68997828c850ce7fb30b73b4adfde35053e539d1

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aubio/aubio.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index b2eb2b5e6d..c995fdfac7 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -16,6 +16,17 @@ AUBIO_CONF_OPTS = \
 	--disable-docs \
 	--disable-atlas
 
+# The waf script bundled in aubio 0.4.9 is too old for python3.11
+# Similar issue with Jack:
+# https://github.com/jackaudio/jack2/issues/898
+AUBIO_NEEDS_EXTERNAL_WAF = YES
+
+# The old waf script bundled in aubio 0.4.9 need to be removed first.
+define AUBIO_REMOVE_OLD_WAF
+	$(RM) -fr $(@D)/waf $(@D)/waflib
+endef
+AUBIO_POST_EXTRACT_HOOKS = AUBIO_REMOVE_OLD_WAF
+
 # Add --notests for each build step to avoid running unit tests on the
 # build machine.
 AUBIO_WAF_OPTS = --notests
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
