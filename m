Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B897C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 06:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EDB58176C;
	Sun,  9 Jan 2022 06:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OEUMNi0dKll7; Sun,  9 Jan 2022 06:36:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D582481767;
	Sun,  9 Jan 2022 06:36:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45A5E1BF5A0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 06:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31E6340469
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 06:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rg5KtG-NBWPZ for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 06:36:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 585AF400F5
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 06:36:07 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id q5so13249638ioj.7
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 22:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JDcy7VQW+PMEN/Df2TSGSxGp67zr4dOGNBXL+K1yCY8=;
 b=cNauaIbXyAqA4tr0a+/SovbUX7pi5cg/idO7Y40XpY1GCWxqs82PRTM4t+VJtlueKD
 5SOk9EYLhLmxJMlvRWb2TQjLSM90iZqejF4qNEG22O/f2+6HybjcoQgLk7lERZSuA77a
 fyEi2Xr3VHkq6LjRxENR04xt9zMojPtodCd8S9m6o1yWjuiUe0XL4ZNvQEaCDNqM6SFd
 Fe9zH2N3NQsfWN5vtpjW4G2U1KMuQCU7EHiFYnU5DgSRN8vJ2+fOxOPq9jg90oeLrjhw
 2xzEvltEImV1X0HyYkuM0G5oaaxtIuIdQFwni0CD/Ej3lgM/W7yiZqTaMSyYqXPChkdE
 NLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JDcy7VQW+PMEN/Df2TSGSxGp67zr4dOGNBXL+K1yCY8=;
 b=L1sTFSldDHXD6MwPnP4Y2MkYrBtwuJt1Nn/t3zU3xGZ6MX7OJIicZnzk2znMyo3Cp1
 k//zexqVe63qi4LAuCoOdiM9H4ByI4f7kTt6EUQK8TcpQOcW1h5rDZ8wyHdmPsSYZRQR
 0KHWDezSYRE1fGj7tb3AEodZP2Ikk4/4a3sz4a7EZ0n86RY+CL1QiWISlxVMb8MBowa+
 iHevj6W41UfDGk2TrwHs6/M019PR8E6k8ZntHhT+TRb08d2J7pqak998n9emGAZ3TsCh
 krGvmRZONffx4FHYyf4mHZLaB1NflXWVXjqHe9PxF47XFfeMlZDgGTQAP0uP57lDRZuj
 XP8g==
X-Gm-Message-State: AOAM5332nM1jLZidHs/hC12Hvt9THhsTwc7TJoPW8dvJsMG3JFoMMoSX
 sfIKM7EoxtEfnHtEJ3ydKH07a8XhPLw=
X-Google-Smtp-Source: ABdhPJzTwcu3u428zIaAZ7WU4FLg4W+xE3ZOBB+1vuByvcEtLhabOeIwNkumJCA1hkFLWSzre9UBlA==
X-Received: by 2002:a05:6638:34a8:: with SMTP id
 t40mr1314223jal.138.1641710166220; 
 Sat, 08 Jan 2022 22:36:06 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id k7sm2057245ilv.61.2022.01.08.22.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 22:36:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 23:36:01 -0700
Message-Id: <20220109063601.4133447-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] core/pkg-utils: add missing bracket
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

This appears to have been incorrectly removed in:
03aa3e6ac71a0fe1ff87fe192c8de0b1acebd0df

Fixes:
package/pkg-utils.mk:212: *** unterminated call to function 'foreach': missing ')'.  Stop.
make: *** [Makefile:84: _all] Error 2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 6aa64a2096..df55ab685b 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -214,7 +214,7 @@ define per-package-rsync
 	$(foreach pkg,$(1),\
 		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 			$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
-			$(3)
+			$(3))
 endef
 
 # prepares the per-package HOST_DIR and TARGET_DIR of the current
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
