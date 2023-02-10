Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C442C636D7
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCF3861221;
	Fri, 10 Feb 2023 22:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCF3861221
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sMvvO6aflCh7; Fri, 10 Feb 2023 22:49:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0470061219;
	Fri, 10 Feb 2023 22:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0470061219
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBF921BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3A9661066
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A9661066
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z_IyWIhayKhs for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:47:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1806E60C1C
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1806E60C1C
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:47:34 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j25so6546881wrc.4
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:47:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5OWtn2fySgIjLBs3xveMIf7vO7qb/ZRxRBOvD4iK8xA=;
 b=yCYUnzUGNjN2Roy9QFR2XaBclrjOuWj8M0Qy7BykFa/IIl2yabSkeBJi++GKF9s72f
 gCacI94nQyfAM8NqQfF9RaT1guLrAy6lDuIOifKvBpwnbcfkGm+H5c9vNFyV5cYxdV87
 PY7YywRkxU6e2M9GM8o6dlRr50O8Y9OOcxTlLw5EQLsPfBs/J+PzP1gGZOiaMFrnGxqR
 wrWTMiSCipw5wxYTR2oAC4BMkJeaYmbTMJLh9ikkYJgHsZJvzXEg35Bb9xYX+LQm4sG+
 37vIqcTZQAjHQU5KHm9V9it9IZKYM0eiJZl6qX6RN/ptTx77NgDzCqIwYB2Y1Z2S0+3q
 aXhg==
X-Gm-Message-State: AO0yUKWJh8XUhOM0UFjmMLOFBWuvzp70cxnY1qI5cA7vl/abEb+FfnUH
 i9IMaIy9gQXMsXUXqYquE6GbjLmZW4r9YuJQ
X-Google-Smtp-Source: AK7set9xOAAIwxqHYN+81sh/0dU6Iwo8hh/mpm8yeih4shS5qg7dMu0YhjGbU3zlRzcRaL5w/cWEHg==
X-Received: by 2002:adf:de01:0:b0:2c5:4c8c:b2fc with SMTP id
 b1-20020adfde01000000b002c54c8cb2fcmr1598118wrm.11.1676069253329; 
 Fri, 10 Feb 2023 14:47:33 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002be0b1e556esm4576128wrn.59.2023.02.10.14.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 14:47:32 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:47:17 +0100
Message-Id: <20230210224717.3293906-11-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230210224717.3293906-1-romain.naour@smile.fr>
References: <20230210224717.3293906-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5OWtn2fySgIjLBs3xveMIf7vO7qb/ZRxRBOvD4iK8xA=;
 b=riq271TZaTlHcKbep63YeGLznVVeq0fOg6rkLmUsU4sZnEk4Rj9jiMh6MoLETaXiCu
 efsz0utPjmFwSb9CA+2PSjV6JnQGk3xkiKTGDeX0hXEW+4RnGPygMjfYsM/TbKSDRYmX
 Club4wRA8wrEIipYmYxT/1OTyM0vIgR4KZtUidV2Df2CcGNtWeJCbjWXzFN+PyL50dbb
 bFSy+UJJ2GvLJOSCfinM0vPypUigiwo7IxLyPg6hw4sdFldwfdeP4XWmzZGa7V3x8oeO
 btVwgya7AhYmKnyFn+lAzBVQIi7fvVnAx5PyH/nDkIAEbNWeLc2Jiq5a+kVtrtdKirSF
 VtFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=riq271TZ
Subject: [Buildroot] [PATCH v3 10/10] DEVELOPERS: add Daniel Lang for
 llvm-project
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 203103e108..33a4c1758a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -642,6 +642,7 @@ F:	package/dacapo/
 N:	Daniel Lang <d.lang@abatec.at>
 F:	package/dbus-cxx/
 F:	package/libsigc/
+F:	package/llvm-project/
 F:	package/paho-mqtt-cpp/
 
 N:	Damien Lanson <damien@kal-host.com>
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
