Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C4DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 12:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2AD640AA8;
	Tue, 10 May 2022 12:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y19xyoP5cbu5; Tue, 10 May 2022 12:34:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDBD140144;
	Tue, 10 May 2022 12:34:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 977801BF255
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 12:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83985400FB
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 12:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KE9kJOlJ3hEd for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 12:34:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EC3840144
 for <buildroot@buildroot.org>; Tue, 10 May 2022 12:34:25 +0000 (UTC)
Received: from opfedar03.francetelecom.fr (unknown [xx.xx.xx.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar24.francetelecom.fr (ESMTP service) with ESMTPS id 4KyHXv24k1z5vdX; 
 Tue, 10 May 2022 14:34:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1652186063;
 bh=jeHlnca7c35duMwNBQAMaAy2aoGE7azOEKntLE0I+HM=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=xYNQ1yODS52mPEaOTybhd9jCauKvzT3VemOfooQk/PpZrhHFrQxJprcWm/E44iCgc
 sAgOyUsGNUN5nw1vMFmuVbIFc2EZ9qAB3u5trNBGzVS+p7CMBQe612EFHN+ATYNmGK
 5zs7HXv69ZGhY4PR17+3tZ3wtOjouwXNb2P1JyZ8fg/Kjj5ZfnHPO+rdzKxlGefUfK
 lNuAd/TTM4dlOxec2dveQpbGjBY3eZUhHDe7pei+cHyRs5ElV92zIXogk2Xgt2FuhG
 k2ZLP0lgm3J5jK7xr1XmMWx+co7++NnVa4jFWbIQRGvPrDSCeTRjmanMi0urkSTR+F
 ZVfHykxeLu/pQ==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 10 May 2022 14:34:20 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 10 May 2022 14:34:20 +0200
Message-ID: <11033_1652186063_627A5BCF_11033_340_1_f3b8c61ce2f116c06c455a1f0163db9ca541896a.1652186060.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX601.corporate.adroot.infra.ftgroup
 (10.115.26.29) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH] fs/oci: entrypoint and command are
 space-separated lists
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

The prompt and variable name for the OCI "entrypoint arguments" are
somewhat incorrect. Indeed, they are in fact use to set the image
"command". Yet, using "command" would be confusing too, because the
interplay between entrypoint and command is tricky [0].

TL-DR; when both entrrypoint and command are set, command acts as
arguments passed to the entrypoint.

Additionally, we currently can only pass a single item as either
entrypoint or command. This precludes passing actual arguments to the
entrypoint, or passing multiple arguments as command.

For example:
    BR2_TARGET_ROOTFS_OCI_ENTRYPOINT="/bin/tini -g -p SIGTERM --"
    BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="/usr/bin/env sh"

generates an images with (only relevant fileds are included below):

    {
        "config": {
            "Entrypoint": [ "/bin/tini -g -p SIGTERM --" ],
            "Cmd": [ "/usr/bin/env sh" ]
        }
    }

This is obviously incorrect, and not what one would expect:

    {
        "config": {
            "Entrypoint": [ "/bin/tini", "-g", "-p", "SIGTERM --" ],
            "Cmd": [ "/usr/bin/env", "sh" ]
        }
    }

Fix that by passing as-many --entrypoint or --cmd as there are
space-separated items in the corresponding lists.

[0] https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Cc: Matthew Weber <matthew.weber@collins.com>
---
 fs/oci/oci.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/oci/oci.mk b/fs/oci/oci.mk
index aa81920d36..f98db0a8c8 100644
--- a/fs/oci/oci.mk
+++ b/fs/oci/oci.mk
@@ -15,13 +15,13 @@ OCI_SLOCI_IMAGE_OPTS += $(and $(GO_GOARM),--arch-variant v$(GO_GOARM))
 # entrypoint
 OCI_ENTRYPOINT = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT))
 ifneq ($(OCI_ENTRYPOINT),)
-OCI_SLOCI_IMAGE_OPTS += --entrypoint "$(OCI_ENTRYPOINT)"
+OCI_SLOCI_IMAGE_OPTS += $(patsubst %,--entrypoint %,$(OCI_ENTRYPOINT))
 endif
 
 # entrypoint arguments
 OCI_ENTRYPOINT_ARGS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS))
 ifneq ($(OCI_ENTRYPOINT_ARGS),)
-OCI_SLOCI_IMAGE_OPTS += --cmd "$(OCI_ENTRYPOINT_ARGS)"
+OCI_SLOCI_IMAGE_OPTS += $(patsubst %,--cmd %,$(OCI_ENTRYPOINT_ARGS))
 endif
 
 # author
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
