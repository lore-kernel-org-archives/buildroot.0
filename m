Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8206CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 10:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F8304223D;
	Sat, 23 Sep 2023 10:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F8304223D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PN-UaanCSt_U; Sat, 23 Sep 2023 10:00:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EA9741BC3;
	Sat, 23 Sep 2023 10:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EA9741BC3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1E3E1BF834
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 10:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B1B04052C
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 10:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B1B04052C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JkF6b29T81aV for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 10:00:44 +0000 (UTC)
Received: from mail.light-speed.de (mail.light-speed.de [85.214.38.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CE674016B
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 10:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CE674016B
Received: from bilbo.fritz.box (ip5f5a8b4a.dynamic.kabel-deutschland.de
 [95.90.139.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.light-speed.de (Postfix) with ESMTPSA id EFD0A3D42A6B;
 Sat, 23 Sep 2023 12:00:39 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 12:00:35 +0200
Message-Id: <20230923100035.1504933-1-mail@jens-maus.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jens-maus.de; s=mail; t=1695463240;
 bh=wSXfvYxAzafjotp2SX7QHdJve9IFUsuCkq0G2vCt7hg=;
 h=From:To:Cc:Subject:Date;
 b=vWNKZYWK1F8A/kkVQbf/Dtb8buNJxFLZwNvqpiKj32wzEdp3Qh5x6YBeLWIQwFVvq
 K0wzqOVJqKESRgfq+AmamTjSNAEoBznSxAKg2p0E3ZPKqNG4FChcvWdUL2T2m2yydw
 hC+uRZa6DkfpUIye5JqQAnGCA2cVWGA6aSb2PLLU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=jens-maus.de header.i=@jens-maus.de
 header.a=rsa-sha256 header.s=mail header.b=vWNKZYWK
Subject: [Buildroot] [PATCH] package/linux-tools: fix SysV init script
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
From: Jens Maus via buildroot <buildroot@buildroot.org>
Reply-To: Jens Maus <mail@jens-maus.de>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit fixes the S10hyperv SysV init script which expects binaries
to be locate in /sbin while they are installed in /usr/sbin. Please
note, that the systemd init scripts correctly reference them.
Furthermore, the SysV init script did not check for an actual HyperV
environment to be present, which is also corrected. In addition, this
commit also fixes check-package warnings regarding a missing DAEMON
definition.

Signed-off-by: Jens Maus <mail@jens-maus.de>
---
 package/linux-tools/S10hyperv | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/S10hyperv b/package/linux-tools/S10hyperv
index 32887d1b6c..be9ed2c5df 100644
--- a/package/linux-tools/S10hyperv
+++ b/package/linux-tools/S10hyperv
@@ -2,14 +2,18 @@
 
 PROGS="@PROGS@"
 PIDDIR="/var/run"
+DAEMON="hyperv"
 
 # shellcheck source=/dev/null
-[ -r "/etc/default/hyperv" ] && . "/etc/default/hyperv"
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+# only continue if we are in a HyperV platform
+[ -e "/sys/bus/vmbus" ] || exit 0
 
 start_one() {
 	printf 'Starting %s: ' "$1"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -b -m -S -q -p "$PIDDIR/$1.pid" -x "/sbin/$1" -- -n
+	start-stop-daemon -b -m -S -q -p "$PIDDIR/$1.pid" -x "/usr/sbin/$1" -- -n
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
