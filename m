Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B22C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D8934036E;
	Sat,  4 Nov 2023 20:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D8934036E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HRm879YWc0Pp; Sat,  4 Nov 2023 20:37:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B99E40360;
	Sat,  4 Nov 2023 20:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B99E40360
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 793F41BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52D0060B15
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52D0060B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BrvIFH89Xiyk for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:37:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC08B60AFD
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC08B60AFD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96F41812BF; Sat,  4 Nov 2023 20:37:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 21:37:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6122ba62f6d9ac4350b9bb2e5d935acfd077e2c9
X-Git-Newrev: 3c71477f663c64bf7e3455e235f610fe17d0956c
X-Patchwork-Hint: ignore
Message-Id: <20231104203724.96F41812BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nano: really disable nanorc for
 !BR2_PACKAGE_FILE
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c71477f663c64bf7e3455e235f610fe17d0956c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3c4fa30f7abf (package/nano: fix tiny build) tried to explicitly
disable libmagic/coloring/nanorc, but accidently passed 2x
--disable-libmagic instead of --disable-nanorc.  Fix that.

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nano/nano.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 8a2003b92a..8b93527bec 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -34,7 +34,7 @@ ifeq ($(BR2_PACKAGE_FILE),y)
 NANO_DEPENDENCIES += file
 NANO_CONF_OPTS += --enable-libmagic --enable-color --enable-nanorc
 else
-NANO_CONF_OPTS += --disable-libmagic --disable-libmagic --disable-color
+NANO_CONF_OPTS += --disable-libmagic --disable-color --disable-nanorc
 endif # BR2_PACKAGE_FILE
 endif # BR2_PACKAGE_NANO_TINY
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
