Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE25AC001DF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A68EE40BB3;
	Wed, 26 Jul 2023 21:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A68EE40BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iTcgg-b_wYst; Wed, 26 Jul 2023 21:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4B3240A59;
	Wed, 26 Jul 2023 21:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4B3240A59
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7388A1BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58FD7612B2
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58FD7612B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0KKgekkVHShZ for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:20:28 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 734D16120B
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 734D16120B
Received: by mail.gandi.net (Postfix) with ESMTPA id 50A67FF802;
 Wed, 26 Jul 2023 21:20:26 +0000 (UTC)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@paral.in>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed, 26 Jul 2023 23:20:08 +0200
Message-ID: <20230726212009.221147-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
References: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690406427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMxmq9i7AikNdPqHJ2upA6EqrvqE/JJU1jBhnA2zjt4=;
 b=E32gseYsDDX2iUygW220cCkXFpokCfIcziLuBimz/JV1fyUXe7Ppq9PqL8dWmy9/0lx+k7
 4oR9+GmfyatMaFMVLo7srEP50SFtnw92BYSoHbwkmEN3WF645ZCl63Fd7x5fA6n2x6cCg1
 LlR3e6tp+mYYWgmDhT8JwFiUAS1dEBlhu6GFrfNgT2PS+7AI/GyxRKa4q9B1Oo381v5ev0
 Zcpq/W0Ow/u7YeTE8c7K+KxamlO/j59RCDXrXJQbuJgF7mzcIyt4e0C8B9+lp/SNrA94Q1
 r48/G9mxDP1TEU9GzblX6q/RAB7dHb8mVJq6ZLijvxD5WhOGZjeA0ZIZuxxAfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E32gseYs
Subject: [Buildroot] [PATCH RFC 2/2] utils/docker-run: mount the download
 directory if specified
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If the user has defined $BR2_DL_DIR in the environment, it would be
nice to have it accessible inside the Docker container, and the
BR2_DL_DIR environment variable set to access it.

This commit does exactly this: it mounts the host $BR2_DL_DIR as /dl
in the container, and sets BR2_DL_DIR=/dl in the container.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Here as well, opinion from Docker expert would be useful. For example,
with this change, the files added in the download directory are owned
by $USER:docker and not $USER:$USER as would probably be expected.
---
 utils/docker-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index eee1aad7a4..6ea4311c68 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -20,4 +20,8 @@ if tty -s; then
     docker_opts+=( -t )
 fi
 
+if test -n "${BR2_DL_DIR}"; then
+    docker_opts+=( --volume "${BR2_DL_DIR}:/dl:Z" -e "BR2_DL_DIR=/dl" )
+fi
+
 exec docker run "${docker_opts[@]}" "${IMAGE}" "${@}"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
