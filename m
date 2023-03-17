Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5F0C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 20:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D7A64026E;
	Fri, 17 Mar 2023 20:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D7A64026E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oq89t1Yo4ocg; Fri, 17 Mar 2023 20:28:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6D74401BF;
	Fri, 17 Mar 2023 20:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6D74401BF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCBD71BF279
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 20:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 965EE6134D
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 20:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 965EE6134D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y6URfp5pEEEs for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 20:27:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBC9860FAC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBC9860FAC
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 20:27:55 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.21.176])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 43EC378034D;
 Fri, 17 Mar 2023 21:27:47 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 21:27:24 +0100
Message-Id: <20230317202724.79207-3-ju.o@free.fr>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230317202724.79207-1-ju.o@free.fr>
References: <20230317202724.79207-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1679084874;
 bh=e9XMOzb/AkktWCGTZHGHWbQjDo8cC9W1BfMpSX+grT0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gJN1i3f2dnq2xLCXM/jNcRwPatXSxSuhlG6PqQTqTR7VzrQqO2URb2bjEpW2GDIUu
 QmNWog+r9Pr++6AuO40sySnlZfH6F9Mvmr0PfcA+iL1nsRmgrLNxmYVDiqsNzg2vbY
 gMAECQn+Fvq6Fhse8geMJTmE4X2w3M/10jJ8ZbUCYRXToPwSokBPXgXvwEHZuKf4Zl
 yYB752rNrEgfM0AwGspM9H11Pis5C8m7LSiQJ3NonDid/rGUbObXXRJIFBKzpfY2bO
 7PsojpDZ82QdaL6ZF9uFWqRVQuuF3rynJm8xeRqe12vVW8GdDeinzlIkI/fj7G3/jO
 1cJCQwYeuiIkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gJN1i3f2
Subject: [Buildroot] [PATCH 3/3] utils/config: fix shellcheck warnings
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
    utils/config:0: run 'shellcheck' and fix the warnings
    ...
    1 warnings generated

This commit fixes the warnings reported by the command:

    shellcheck utils/config

Fixes:

    In utils/config line 175:
		    if grep -q "# ${BR2_PREFIX}$ARG is not set" $FN ; then
                                                                ^-^ SC2086 (info): Double quote to prevent globbing and word splitting.

    In utils/config line 178:
			    if V="$(grep "^${BR2_PREFIX}$ARG=" $FN)"; then
                                                               ^-^ SC2086 (info): Double quote to prevent globbing and word splitting.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/config b/utils/config
index 5f5e4362e5..9107725a70 100755
--- a/utils/config
+++ b/utils/config
@@ -172,10 +172,10 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--state|-s)
-		if grep -q "# ${BR2_PREFIX}$ARG is not set" $FN ; then
+		if grep -q "# ${BR2_PREFIX}$ARG is not set" "$FN" ; then
 			echo n
 		else
-			if V="$(grep "^${BR2_PREFIX}$ARG=" $FN)"; then
+			if V="$(grep "^${BR2_PREFIX}$ARG=" "$FN")"; then
 				V="${V/#${BR2_PREFIX}$ARG=/}"
 				V="${V/#\"/}"
 				V="${V/%\"/}"
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
