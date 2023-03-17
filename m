Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9ADC6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 20:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9455441BEC;
	Fri, 17 Mar 2023 20:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9455441BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voD0DzLevFDp; Fri, 17 Mar 2023 20:27:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95CA941BF0;
	Fri, 17 Mar 2023 20:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95CA941BF0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E955C1BF279
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 20:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9EA240576
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 20:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9EA240576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1A-fpz-jXR4O for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 20:27:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D626640393
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D626640393
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 20:27:42 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.21.176])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8A6437802FE;
 Fri, 17 Mar 2023 21:27:33 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 21:27:22 +0100
Message-Id: <20230317202724.79207-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1679084859;
 bh=HJbUJZXSukifBu7DZavnbCkNE3CCt0y4OtcwTkj41uU=;
 h=From:To:Cc:Subject:Date:From;
 b=XfYKV02Ar8qiXzXAgzNU8Sz5mLJ6E2bmAfvzCOhyt06te9HtF2bbpHjjOspoMr3ND
 eIvqBpeDiVR7DIo8rfFwW6HtEQ54EZ7KzqZdqrwudhxCj3Bsa6ZKUlBg6KE4gr9pRh
 bBAlAaLwyu+4zvapyh29uSzwZpYZQDv97kjQXekX/5z21haT8re+3mdsMk0GsZBPtU
 SdANJa1zmcv1ToIjRD4B1qeFEmuLV9l7TEe77u+dbutlrotldOiM59hww2/RpENUxZ
 FshRBk6SqIwJ9yZcwvmF41NO9aGjeBa1aPt4WaTqBAgqRTIfAhRLCupDqsMf/aN10t
 K6lMAkatde3PA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XfYKV02A
Subject: [Buildroot] [PATCH 1/3] package/kodi/br-kodi: fix shellcheck
 warnings
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
    package/kodi/br-kodi:0: run 'shellcheck' and fix the warnings
    ...
    3 warnings generated

This commit fixes the warnings reported by the command:

    shellcheck package/kodi/br-kodi

Fixes:

    In package/kodi/br-kodi line 11:
        LOOP=0
        ^----^ SC2317 (info): Command appears to be unreachable. Check usage (or ignore if invoked indirectly).

    In package/kodi/br-kodi line 12:
        killall "${KODI##*/}"
        ^-------------------^ SC2317 (info): Command appears to be unreachable. Check usage (or ignore if invoked indirectly).

    In package/kodi/br-kodi line 36:
    exit ${ret}
         ^----^ SC2086 (info): Double quote to prevent globbing and word splitting.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi/br-kodi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi/br-kodi b/package/kodi/br-kodi
index 83d4d4e5ac..bc64515246 100755
--- a/package/kodi/br-kodi
+++ b/package/kodi/br-kodi
@@ -7,6 +7,7 @@ shift
 
 # In case someone asked we terminate, just kill
 # the Kodi process
+# shellcheck disable=SC2317  # Don't warn about unreachable commands
 trap_kill() {
     LOOP=0
     killall "${KODI##*/}"
@@ -33,4 +34,4 @@ while [ ${LOOP} -eq 1 ]; do
             ;;
     esac
 done
-exit ${ret}
+exit "${ret}"
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
