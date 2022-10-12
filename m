Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E36DC433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 15:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1923C40577;
	Wed, 12 Oct 2022 15:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1923C40577
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kpBS-uGGeKTP; Wed, 12 Oct 2022 15:45:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4412A40567;
	Wed, 12 Oct 2022 15:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4412A40567
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A56851BF4DD
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 15:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8108360E65
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 15:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8108360E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TWO7DCfQDPPm for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 15:45:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A62C060BCB
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 15:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A62C060BCB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95AD086BF8; Wed, 12 Oct 2022 15:45:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Oct 2022 17:43:43 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 23fbc414296c27f5200d21ce5a9ff53f80e5af0c
X-Git-Newrev: c52157f6aabd1cc92026610efa48aae4fe1053dc
X-Patchwork-Hint: ignore
Message-Id: <20221012154543.95AD086BF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/collectd: work
 around gcc bug 68485
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

commit: https://git.buildroot.net/buildroot/commit/?id=c52157f6aabd1cc92026610efa48aae4fe1053dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

collectd is impacted by the microblaze-specific gcc bug #68485 [0].

As for all other impacted packages, force no optimisation when using a
toolchain riddled with that bug.

Fixes:
   http://autobuild.buildroot.net/results/6a8/6a87bbe17e6f606a97097800dc484a7b17bffa7d/

[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 15f48d57f73da375ed28e582ab68740704b499fd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 5751757040..5510c265e8 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -27,6 +27,14 @@ COLLECTD_PLUGINS_DISABLE = \
 
 COLLECTD_CONF_ENV += LIBS="-lm"
 
+COLLECTD_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+COLLECTD_CFLAGS += -O0
+endif
+
+COLLECTD_CONF_ENV += CFLAGS="$(COLLECTD_CFLAGS)"
+
 #
 # NOTE: There's also a third availible setting "intswap", which might
 # be needed on some old ARM hardware (see [2]), but is not being
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
