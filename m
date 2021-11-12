Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB130C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 10:49:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4846060F39
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 10:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4846060F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E94A5818CD;
	Fri, 12 Nov 2021 10:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZM-bATwaoP9g; Fri, 12 Nov 2021 10:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5418C80EF2;
	Fri, 12 Nov 2021 10:49:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A2571BF298
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 10:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89A2D40579
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 10:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGZPkiX5Xd49 for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 10:49:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB86540530
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 10:49:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i5so14780328wrb.2
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 02:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TYiK3WnV+U8xJRmybgPX4GsoXiJZRAFhZZX+CnjjSYQ=;
 b=Ro3E3g3SMLx8dP8GTxUxe7FqDWkaoyFXbX84Ea2pk3AfMNE17L64xrdaBcKhn5G1lL
 MWDlTshbePsYeoivsO5k8hOTnnHpe8spoNsoynZbulp4/dA+EbEao9rAzX/YWyEI87iP
 JXzxbivbLLWXZ8C5NZhD+2KcBCyeUKlHxSNpCx/UmQm7p3AmqHyv+6s6LTJClfXCd1ys
 Li7M1yVRaly0gM8tMJES99o9nHf4umyU+lUnCUj3Q9GWSzxOY5jPVJ+9aRFZHRvMKol2
 Mrabx2yNZKWMhKAfyZH7wdO5udIPRMauHd+9jh7zXE0I3i+tSl7mTPkmVo1GMR08bB7O
 f8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TYiK3WnV+U8xJRmybgPX4GsoXiJZRAFhZZX+CnjjSYQ=;
 b=RVcI5iEi4YtisaIxRgUx8ezFslPhBs89MzBoaSN+9VNaGy2HCQ9/ICAgmbmJJkAP/6
 HDFvC9tPxkiXKAIDeXPYMxMXgFnLe1E2EGhzEoO0PJHpYky/Tiks5ZljELiIvsQ6Ty12
 QQgZ6taAnFzWKcQ2ZEowVN+eLBVlRqAdg+2v86vxjpcBWHHd+wB5PXdpdm5RfQMw4z50
 bcneQh0eigRhwRrGx7E15ZbDSPn9250ToO9wgf6A7dk5rl9pNNDnqSSHXJdeHCCI33uW
 U5CA9BZGuVdtA2o9mpfk5q+mrmPes4jn0wTHgabuUwsIQ5OiwxWnj/4O3haCKuSZHOLJ
 k5DQ==
X-Gm-Message-State: AOAM531axtpQRkTxDqQFlEcBfY4bAmLV4jFgZuT8uEcy4i4+oDScRSgV
 Rdzb1KPn9Qe6fpsmhKE5Z/rEVpngHLI=
X-Google-Smtp-Source: ABdhPJwsyKJwUGSHgx20FbCjalq4hpwfWNkYB0dGxNis/39AaC78UKJNz24Xf9VQwFWXGoLFDdGqpQ==
X-Received: by 2002:adf:e84d:: with SMTP id d13mr17741442wrn.72.1636714166691; 
 Fri, 12 Nov 2021 02:49:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h204sm5623589wmh.33.2021.11.12.02.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 02:49:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 11:47:24 +0100
Message-Id: <20211112104724.3308539-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire-media-session: needs
 alsa-lib-ucm
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the
package in commit 51f30f47cd04efe494c8da37077bea860d3fbe14:

../src/alsa-endpoint.c:34:10: fatal error: alsa/use-case.h: No such file or directory
   34 | #include <alsa/use-case.h>
      |          ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/bbf54d1bdb0f8f2d4f675ffdcbcbbf56562c3d7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pipewire-media-session/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pipewire-media-session/Config.in b/package/pipewire-media-session/Config.in
index d025cd4d75..affbc00c1a 100644
--- a/package/pipewire-media-session/Config.in
+++ b/package/pipewire-media-session/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PIPEWIRE_MEDIA_SESSION
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_PIPEWIRE
 	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_UCM
 	select BR2_PACKAGE_DBUS
 	help
 	  Build pipewire media-session support
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
