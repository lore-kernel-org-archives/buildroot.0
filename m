Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB957C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 21:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8162540993;
	Sun,  3 Dec 2023 21:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8162540993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RDQ5DDmYM3VJ; Sun,  3 Dec 2023 21:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A75F409AD;
	Sun,  3 Dec 2023 21:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A75F409AD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69F7B1BF3EE
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 21:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4255E40297
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 21:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4255E40297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFfPvJ1r7V9Q for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 21:24:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E64A400F9
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 21:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E64A400F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B280878CF; Sun,  3 Dec 2023 21:24:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 22:23:09 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 49da7a4ae362e7fe1ef77c743388d6d5d2f87e3e
X-Git-Newrev: 55678b84a153456ac4c55bab38ae8eba88d70f9b
X-Patchwork-Hint: ignore
Message-Id: <20231203212402.1B280878CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/putty: disable
 gssapi
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

commit: https://git.buildroot.net/buildroot/commit/?id=55678b84a153456ac4c55bab38ae8eba88d70f9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

PUTTY_GSSAPI is enabled by default resulting in the following build
failure since bump to version 0.78 in commit
5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4:

 /home/fabrice/buildroot/output/build/putty-0.79/unix/gss.c:133:10: fatal error: gssapi/gssapi.h: No such file or directory
  133 | #include <gssapi/gssapi.h>
      |          ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d6d06b5aa0df070c3880399e044fb3cd3a830aec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 499b4d6d22a704adf65d1db0808952ad386ee1a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/putty/putty.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index c79917dac0..93e978a36a 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -10,6 +10,7 @@ PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
 PUTTY_CPE_ID_VENDOR = putty
 PUTTY_DEPENDENCIES = host-pkgconf
+PUTTY_CONF_OPTS = -DPUTTY_GSSAPI=OFF
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 PUTTY_DEPENDENCIES += libgtk3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
