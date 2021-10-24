Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D53EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 05:29:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3D1A60D43
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 05:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3D1A60D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 392D1402A2;
	Sun, 24 Oct 2021 05:29:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zx-A1MWdHOC; Sun, 24 Oct 2021 05:29:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 641DD400A6;
	Sun, 24 Oct 2021 05:29:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E74BE1BF3F9
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 05:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2560400A6
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 05:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zK8CNuYa9Zqf for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 05:29:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DA4A40022
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 05:29:19 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id p142so11095903iod.0
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 22:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wAtt9iZu16Xj24xTbYzDCJsQvuCuAgT+0pVHF/l6yA0=;
 b=qA6RHtiSFnQZkW1ferTbJ/Wyns2sYBMAOuHdCnK8JqzjSt9fOmoZIDEC+K+s3m4OO1
 cwKKnMj0AiCq9/8o1FeJ4odQ8Ivqar79FuEtuqQbw7ZV87tYKB9lHSFTr8+CQyvfIRO5
 np/75+HPNedVQKYTOfmoQAjZUr8y34WgcbbUBhIwBo06cse/OF61m6gCJnRLhLnKZq74
 rRK/+LzfJOHOfveWEQxZqz8J2Vks+0HaKG2lK1IA6whjey45Vx7bM/6ogiQ6uHoas6GD
 pXuxSlMBjKHmL1lg6prz4mahUs1txh7RMxnsuzgNCQodICCFxfKKyqjcad2O3h7U1rJ8
 p/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wAtt9iZu16Xj24xTbYzDCJsQvuCuAgT+0pVHF/l6yA0=;
 b=PHVM08pNXo20vj4dn+5fkSDXgb6NeJ3f5AkszYdFXTpmxF+JWP8gRY/uqKC+zNEIMH
 xUC+AlQxEMtjSLLqfv3cjDxgZkTpr4kpHLhf02u4z0eUaD7H06r7CeGIU4M7Gc0/wtnB
 thkq8Si/ItNXq6ShhsVvV9IujnF/MO5NbZJ1nLTWAx1Ag+gTHuks7F6C53SR1skN7yG5
 8/qxfz8GJ11FbozXjD0IB52LRU/YIb8wiKUTuiEL05qVByn2c+4Y3tTEM3Rqo59K5z06
 keqwInOSsvcG6iEFTA08kt8Bg6WGP8q3P6z+Dr2ytP+rCcwI2pvvJ5crjDst7jDaqV56
 CTmQ==
X-Gm-Message-State: AOAM532TGGa7aRyRgZn+6zz+2DgUBpOQGQkBGFYb1l9bsz5gQwilVwpt
 +MrnH7EqNoTln05yWXOwT2ZO5/XJX48=
X-Google-Smtp-Source: ABdhPJyxLOjEDBwMaTYHTYkcuomCk5KMZoDTD/uh25whCN5lfgoqOgOo7m6ld0yXGyULfdO+q9JeYg==
X-Received: by 2002:a05:6602:2a42:: with SMTP id
 k2mr6161385iov.132.1635053358490; 
 Sat, 23 Oct 2021 22:29:18 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id m10sm7341615ilh.73.2021.10.23.22.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 22:29:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Oct 2021 23:28:52 -0600
Message-Id: <20211024052852.3999292-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-utils: only overwrite newer for
 per-package-rsync
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently during target-finalize we rsync packages in sorted order,
however if one rebuilds a package that has reverse dependencies
the rebuilt version may get overwritten by the old version from the
reverse dependency if the reverse dependency gets recyned after
the rebuilt package(based on alphabetical sorting) during the
target-finalize stage.

To prevent this only copy files newer than their targets.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index ae3c7f9da9..5af34d4ee0 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -184,7 +184,7 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define per-package-rsync
 	mkdir -p $(3)
 	$(foreach pkg,$(1),\
-		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
+		rsync -au --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 		$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 		$(3)$(sep))
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
