Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA34C6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 20:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 267A341BF4;
	Fri, 17 Mar 2023 20:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 267A341BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OLnHVG5EZygH; Fri, 17 Mar 2023 20:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38CF241C10;
	Fri, 17 Mar 2023 20:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38CF241C10
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFCB11BF279
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 20:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA81240576
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 20:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA81240576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ODZanbh8SAVX for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 20:27:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDF3540393
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDF3540393
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 20:27:48 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.21.176])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 29C0978032A;
 Fri, 17 Mar 2023 21:27:40 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 21:27:23 +0100
Message-Id: <20230317202724.79207-2-ju.o@free.fr>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230317202724.79207-1-ju.o@free.fr>
References: <20230317202724.79207-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1679084867;
 bh=HI3mQ2U0CFz5j+LH5/WwzDDTXjr0VhWfT2J619dyWMo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fnK68SFC+2J2ybAaiDI+AbnnPNZD4JEyzpXaGHJgZo/uQ6d/HTVp2wJmhg6wm/Sn5
 Wwo+qKk3S9g858YKw5ZLTkNiYt4Ig2FqonSsm7cyMC0q5bpS8Wh3X/xraqV/pYxp/t
 RbvG+GEhwO4ekyGTqhi1FFwoi4Bk7E5LtG+jv6xAb6KfiN25e2JxSze7uvHjkucY4R
 bqpO8a6OhCwnUgZz+Nctz1bGwPnM2WxWgnegv3IXbh/9jcAmWnuO2zOJoppjhdurpI
 +ivQcXWhb5IvDN/2zEt/vHZ4q0cp6QHkGsK9KIpOeAc0vZeaiRBpHbkRxeaFLgHPcS
 yMUhTMBikSJWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fnK68SFC
Subject: [Buildroot] [PATCH 2/3] package/linux-tools/S10hyperv: fix
 shellcheck warnings
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, Julien Olivain <ju.o@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When running "make check-package" on a system with shellcheck 0.9.0,
the command fails with output:

    make check-package
    package/linux-tools/S10hyperv:0: run 'shellcheck' and fix the warnings
    ...
    2 warnings generated

This commit fixes the warnings reported by the command:

    shellcheck package/linux-tools/S10hyperv

This commit also fixes the four-space indent by a single tab on the
changed lines. Since this fixes the indentation warnings of
check-package, the Indent exclusion in .checkpackageignore is also
removed.

Fixes:

    In package/linux-tools/S10hyperv line 27:
        return $ret
               ^--^ SC2086 (info): Double quote to prevent globbing and word splitting.

    In package/linux-tools/S10hyperv line 48:
        return $ret
               ^--^ SC2086 (info): Double quote to prevent globbing and word splitting.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore           | 2 +-
 package/linux-tools/S10hyperv | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 405e1c5677..04966a9b06 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -94,7 +94,7 @@ package/libftdi/0002-libftdi.pc-requires-libusb-fix-static-build.patch Sob
 package/libiio/S99iiod Shellcheck Variables
 package/libmad/0001-mips-h-constraint-removal.patch Sob
 package/lighttpd/S50lighttpd EmptyLastLine Indent Shellcheck Variables
-package/linux-tools/S10hyperv Indent Variables
+package/linux-tools/S10hyperv Variables
 package/linuxptp/S65ptp4l Indent Shellcheck
 package/linuxptp/S66phc2sys Indent Shellcheck
 package/lirc-tools/S25lircd Indent Variables
diff --git a/package/linux-tools/S10hyperv b/package/linux-tools/S10hyperv
index ec934bc972..32887d1b6c 100644
--- a/package/linux-tools/S10hyperv
+++ b/package/linux-tools/S10hyperv
@@ -24,7 +24,7 @@ start() {
 	for prog in ${PROGS}; do
 		start_one "${prog}" || ret=$?
 	done
-    return $ret
+	return "$ret"
 }
 
 stop_one() {
@@ -45,7 +45,7 @@ stop() {
 	for prog in ${PROGS}; do
 		stop_one "${prog}" || ret=$?
 	done
-    return $ret
+	return "$ret"
 }
 
 restart() {
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
