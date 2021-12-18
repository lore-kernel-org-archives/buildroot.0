Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25793C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5EF940235;
	Sat, 18 Dec 2021 22:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrAg8EcybuJE; Sat, 18 Dec 2021 22:35:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEC3440195;
	Sat, 18 Dec 2021 22:35:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74D3D1BF23C
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F76984DB1
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 937AsyYE5ZE7 for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:35:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D711E84DB0
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:35:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v7so4194621wrv.12
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 14:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I7kskmnOWM1ISIZrSXNZDPKOI913B9idHe1o6lyAwXs=;
 b=UF6n1aTpIvdz8j9GzfoH/vnLmswXFCyYA35ZG9mIoFrpARgsTHv+5tPVKUwo3ltlXD
 L6crqnR1RMBc6yOrNYkC1c23x7nSUZXvn24fIZUsUeevoHUmydq+ZUi4ydI2SrBQKx4t
 ANrAjUytHifCVfJAH/9tpzH6SM/HvyiJRiH5M/kocsKDi2x34BTt2g4BCmw85eiBXb1c
 Zb63WWQBR9FnLPcPkJRA3/Dil5yLeV9zavTzNQTH/RXGSHpqyK7gQgmj6f7sPUjfQVrY
 K1k96McQujZUF5VTy4MgeW92sZzbPKezpPH8QT9xn3evvdHoI7UtUPt8GPET6CgYwRAy
 AdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I7kskmnOWM1ISIZrSXNZDPKOI913B9idHe1o6lyAwXs=;
 b=jIO28KDgtakdjAZqdJUHvAJFujnJ5rtuLL4/ettawX/d0bZPXzDz5LvOD7Ci1Gw1+k
 BZZQRbR1cQaThM7bHgUinc4NSj7DRMZqSRK2r6DT025u015qYaOzlUk2iVw3NpW7NwmQ
 OZau0Uyq9/1NTtllRz4NZvlXe3pR4peCxs56xdnp/ByTd8ZQmR1Kxmd7nfKcv0Bgpt5M
 pYllDwUkWaO3Rz+wEXlN9Gsji8GxLKi7w2OTo5WncpO/tOgR0orAvP5dUI6cQsnoMTPA
 RbvjVgnHj0qLkumGsZoCYr40Ln+WeHJLq+oFDemVEjEYiFbnig3ZLQzdYDHxXgpdlml0
 8SdQ==
X-Gm-Message-State: AOAM533feTAOYmKmGx2kSqKZXxbeqgN4+gagXNv0a9bbub2geGh8mbFz
 JhRxx8UR08TQMv+UQQnp0njfz+zKc80BHA==
X-Google-Smtp-Source: ABdhPJwfbf0yYvpub94p2LqxKESDg/TK6BBPjS4oTTWT8WQlRC8Da0gKuM9qm2/vuTVmxgLbznrIlQ==
X-Received: by 2002:adf:816b:: with SMTP id 98mr7626185wrm.201.1639866933002; 
 Sat, 18 Dec 2021 14:35:33 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id o12sm10880945wrv.76.2021.12.18.14.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 14:35:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 23:35:06 +0100
Message-Id: <20211218223506.578057-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libopenaptx: fix typo
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Yunhao Tian <t123yh.xyz@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace libogg by libopenaptx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libopenaptx/libopenaptx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenaptx/libopenaptx.mk b/package/libopenaptx/libopenaptx.mk
index 49e89d871c..12c33f6225 100644
--- a/package/libopenaptx/libopenaptx.mk
+++ b/package/libopenaptx/libopenaptx.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# libogg
+# libopenaptx
 #
 ################################################################################
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
