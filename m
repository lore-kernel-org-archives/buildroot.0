Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2C3C3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 20:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78490605A4;
	Sun,  4 Aug 2024 20:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3nFHOtM2Hbg; Sun,  4 Aug 2024 20:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5947F6063D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5947F6063D;
	Sun,  4 Aug 2024 20:41:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 919381BF4DD
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B8E3403B7
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSAdSjQbCW0N for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 20:41:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E47A40390
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E47A40390
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 20:41:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6AC8F83F22; Sun,  4 Aug 2024 20:41:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Aug 2024 22:40:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9d6e6fb11b906f08fd974dbf58fbf66b17756ac
X-Git-Newrev: 069a93389455827a59084638ab4e079484977e80
X-Patchwork-Hint: ignore
Message-Id: <20240804204117.6AC8F83F22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/procps-ng: add option to select
 'top' layout
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

commit: https://git.buildroot.net/buildroot/commit/?id=069a93389455827a59084638ab4e079484977e80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new procps-ng uses modern top layout by default which doesn't
provide detailed cpu usage info, so let's add an option for nostalgic
users that allows to get the original layout back.

Signed-off-by: Xiang Lin <myd.xia@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/procps-ng/Config.in    | 10 ++++++++++
 package/procps-ng/procps-ng.mk |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 6ff8983202..4afd01699b 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -8,3 +8,13 @@ config BR2_PACKAGE_PROCPS_NG
 	  Provides things like kill, ps, uptime, free, top, etc...
 
 	  http://sourceforge.net/projects/procps-ng/
+
+if BR2_PACKAGE_PROCPS_NG
+
+config BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP
+	bool "Use original top layout"
+	help
+	  Disable modern top layout, return to original top with
+	  detail cpu usage.
+
+endif
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index c5675e2ee6..2f28e3571e 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -52,6 +52,10 @@ else
 PROCPS_NG_CONF_OPTS += --enable-w
 endif
 
+ifeq ($(BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP),y)
+PROCPS_NG_CONF_OPTS += --disable-modern-top
+endif
+
 # Avoid installing S02sysctl, since openrc provides /etc/init.d/sysctl.
 define PROCPS_NG_INSTALL_INIT_OPENRC
 	@:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
