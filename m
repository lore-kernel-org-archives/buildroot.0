Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E09CEE4993
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 13:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFEFC40942;
	Sun, 20 Aug 2023 13:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFEFC40942
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XGHblofbi0mz; Sun, 20 Aug 2023 13:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A64540936;
	Sun, 20 Aug 2023 13:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A64540936
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE9171BF46D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 13:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9744C60B6F
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 13:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9744C60B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qKeen97MOfkh for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 13:33:51 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DE2D60838
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 13:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DE2D60838
Received: by mail.gandi.net (Postfix) with ESMTPA id D148F60002;
 Sun, 20 Aug 2023 13:33:46 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 20 Aug 2023 15:33:32 +0200
Message-ID: <20230820133333.912207-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692538428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=M5Qi0vayHToasxrLeKZGQoc1my8G2RHRiRChQZPls6M=;
 b=oF7EGA0OGVSalNvqAoFZPEEevjRmNUlng/zo3OrbJDad+nwJwPNIpCc5My6rQ6utINUJwy
 sWLgQn7fv3ai2Z/K35Z5vBySneVPtknUy1a8VSCamj3jvYmuCTZ+hA86+/7UzlA+mBYuqy
 5EjHcDJO6z/SkvX9RgtdZrI8v3WJDrJLMd2iAc1r9EQCGpiCyaEk3pPZIzA3yDbk30a8sO
 fmtOIHvDNvsbQ87Dji2g5mJ5hQl8ZdBnRqArpL6Kdvq6HHoAH1ETlyrfXJIiU7FS/rmA59
 njXxUK9ktdDZuqZYJjSvJxTCK8eaZZdLda5QOrnlSi/Sq5lKAn0JEvKcVtcimg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oF7EGA0O
Subject: [Buildroot] [PATCH] utils/docker-run: allow IMAGE to be passed in
 the environment
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
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It is sometimes useful to use docker-run, but with a different image
than the default one. This commit allows to override the image being
used by only defining IMAGE if not already passed in the environment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Note: this patch applies on top of the series of patches on
utils/docker-run by Yann E. Morin at
https://patchwork.ozlabs.org/project/buildroot/list/?series=368134.
---
 utils/docker-run | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/utils/docker-run b/utils/docker-run
index 02cf68c946..e4581d1c4f 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -9,9 +9,11 @@ else
     # Support git-worktree
     GIT_DIR="$(cd "${MAIN_DIR}" && git rev-parse --no-flags --git-common-dir)"
 fi
-# shellcheck disable=SC2016
-IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
-        sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
+if test -z "${IMAGE}" ; then
+    # shellcheck disable=SC2016
+    IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
+		sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
+fi
 
 declare -a docker_opts=(
     -i
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
