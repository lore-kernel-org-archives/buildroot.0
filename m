Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AD3C4332F
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 19:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41D584181F;
	Sun, 12 Nov 2023 19:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41D584181F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDtEk8atsoy0; Sun, 12 Nov 2023 19:43:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DA3241823;
	Sun, 12 Nov 2023 19:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DA3241823
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C651B1BF23B
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 19:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC5354181F
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 19:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC5354181F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWO3Qg4rVEHT for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 19:43:41 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A327409A7
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 19:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A327409A7
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBD2720002;
 Sun, 12 Nov 2023 19:43:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1r2GMr-00AeWo-0S;
 Sun, 12 Nov 2023 20:43:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Nov 2023 20:43:25 +0100
Message-Id: <20231112194326.2539029-4-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231112194326.2539029-1-peter@korsgaard.com>
References: <20231112194326.2539029-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH 4/4] support/dependencies/check-host-tar.sh:
 blacklist tar 1.35+
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GNU tar 1.35 changed the behaviour for the devmajor/devminor fields,
breaking the download hash validation.  For details, see:

https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00005.html
https://patchwork.ozlabs.org/project/buildroot/patch/20231018141155.533944-1-vfazio@gmail.com/

To work around this issue, blacklist tar 1.35+ similar to how we do it for
pre-1.27 versions so Buildroot falls back to building host-tar (which is
currently 1.34).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/check-host-tar.sh | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index b7d607a47a..7d6b3bf688 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -33,7 +33,12 @@ fi
 major_min=1
 minor_min=27
 
-if [ $major -lt $major_min ]; then
+# Maximal version = 1.34 (1.35 changed devmajor/devminor for files)
+# https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00005.html
+major_max=1
+minor_max=34
+
+if [ $major -lt $major_min -o $major -gt $major_max ]; then
 	# echo nothing: no suitable tar found
 	exit 1
 fi
@@ -43,5 +48,10 @@ if [ $major -eq $major_min -a $minor -lt $minor_min ]; then
 	exit 1
 fi
 
+if [ $major -eq $major_max -a $minor -gt $minor_max ]; then
+	# echo nothing: no suitable tar found
+	exit 1
+fi
+
 # valid
 echo $tar
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
