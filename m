Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C99CCD19A
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 11:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7063960689;
	Wed, 18 Sep 2024 11:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbmg5Nw0SEdd; Wed, 18 Sep 2024 11:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85237606A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85237606A2;
	Wed, 18 Sep 2024 11:17:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 302431BF29C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 11:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EA844266C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 11:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bk3QE7ZWi5Td for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 11:17:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3283541A10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3283541A10
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 11:17:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9607683AD3; Wed, 18 Sep 2024 11:17:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 13:13:45 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6c2f122ce0be77c65a93b9a4cd2294c177c2f280
X-Git-Newrev: b485e48a9873feecfcdc26265815374bb8ffddd4
X-Patchwork-Hint: ignore
Message-Id: <20240918111703.9607683AD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ntpsec: fix host
 building
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

commit: https://git.buildroot.net/buildroot/commit/?id=b485e48a9873feecfcdc26265815374bb8ffddd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The following build failure on xtensa:

Waf: Entering directory `/home/buildroot/instance-0/output-1/build/ntpsec-1.2.3/build/host'
[1/2] Processing ntpd/ntp_parser.y
[2/2] Compiling build/host/ntpd/ntp_parser.tab.c
gcc: error: unrecognized command-line option '-mlongcalls'
gcc: error: unrecognized command-line option '-mauto-litpools'

reveals that the target's CFLAGS are being used for host compilation.
The patch fixes the host compilation by correctly setting the CFLAGS to
be used.

It should be noted that the build script used by ntpsec applies CFLAGS
for host compilation and --cross-cflags for target compilation.

Fixes:
 - http://autobuild.buildroot.org/results/9321a637f2c340ce8dcb24249676bb6c44d0dfc6

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 064e4c09fa788ccf0927fcaf3987e0f0fdc08eb7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntpsec/ntpsec.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index 661af78842..3acf7745cf 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -42,6 +42,7 @@ NTPSEC_DEPENDENCIES = \
 # --cross-compiler
 NTPSEC_CONF_OPTS = \
 	CC="$(HOSTCC)" \
+	CFLAGS="$(HOST_CFLAGS)" \
 	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config" \
 	--libdir=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/ntp \
 	--cross-compiler="$(TARGET_CC)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
