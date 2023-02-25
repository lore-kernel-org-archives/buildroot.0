Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABB8C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E550A40586;
	Sat, 25 Feb 2023 09:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E550A40586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x583or7_8klc; Sat, 25 Feb 2023 09:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FA2B400EC;
	Sat, 25 Feb 2023 09:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FA2B400EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DF121BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75677400EC
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75677400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJqO5dtsWqos for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2A8640017
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2A8640017
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF2198691D; Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 10:37:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edc6350d427bdd47552a276d80c6ad055add86af
X-Git-Newrev: 45e2aa588d7d10941032c1661b9cf1e6c52b2680
X-Patchwork-Hint: ignore
Message-Id: <20230225093924.AF2198691D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: fix build with -Ofast
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

commit: https://git.buildroot.net/buildroot/commit/?id=45e2aa588d7d10941032c1661b9cf1e6c52b2680
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update -Ofast workaround as suggested by Yann E. Morin to avoid the
following build failure raised since bump to version 252.4 in commit
a2c823d1f548d5a0120d27d6c000603192360f7b and
https://github.com/systemd/systemd/commit/60f97fee2d2f948c8e8963ea8ff767008cb93cae:

../output-1/build/systemd-252.4/meson.build:397:8: ERROR: Problem encountered: -Ofast, -ffast-math, or -ffinite-math-only is specified in c_args.

Fixes:
 - http://autobuild.buildroot.org/results/8f41c4984b645851724e554c3162b83bc312bee7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index cce9162f6d..63467171ed 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -100,7 +100,7 @@ SYSTEMD_CONF_OPTS += \
 
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_OPTIMIZE_FAST),y)
-SYSTEMD_CFLAGS += -O3
+SYSTEMD_CFLAGS += -O3 -fno-finite-math-only
 endif
 
 ifeq ($(BR2_nios2),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
