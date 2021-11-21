Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F5AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 17:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95A14403E7;
	Sun, 21 Nov 2021 17:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id citQYYTVdyRN; Sun, 21 Nov 2021 17:10:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3A47403C7;
	Sun, 21 Nov 2021 17:10:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4506D1BF3E1
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 330DA401DB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q0xDp_6-y6jC for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 17:09:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07D0E40010
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 17:09:32 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id 84so8862043vkc.6
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 09:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bvMJsOC3aSHtlTxulFxTTSGtKbAkWrtM6q3SuuNjO8o=;
 b=aQQgHjS+6qSWOfA73lrhVDh2dyfKMfTd9gxHuR9LDLIZbqZPOVQnwpnHDWS4ep8qnl
 qnAK3dZ2s/p2h1xbgezHFMs6PD5l6Xcy7dKANE3Y2fYc3tiye5qOFa2Fd/2qx9yGMS0R
 A7JnKUUShrCLXHX2pIJCQwVRzpOzQd489zqRVEtRewklTbtqwQZZz6t4KSqL33OwMrJn
 ZWNrDaBHM3awg4fRvmlDJvqCEG5loQN+TPBLJcaP8zRmYpIQbCOVSeW5sjD4sYG95zpB
 zPVwFJ5bxCHi22E8/GZSX/oGYJCb2DNwDUATWHtt/OioOpDEaswVWEnNGtIXuYeO2NT5
 owEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bvMJsOC3aSHtlTxulFxTTSGtKbAkWrtM6q3SuuNjO8o=;
 b=HnWxCluUnAT9NU7Hh5/tGPGPYU2dQHguN4qoIRdRAU3k5Wg5nkVy29vmBx2WdAp6bB
 1OAwkh/x7FYdp3VujyDW2ADElxgrb6FLldAwq8V4o81HEyScA5C8Qd2uX0YuULf7hFO7
 pRYBu9RoFUXyVEkHksRwjdaOlBologG1ExABr3wp+CnsUmU8eL3trNQGF/m/ro13OFDF
 gtUtHSaSv4nugYvBXZbl1XZ+uX4+Oekn+Ep5VL9IWMAi4iDCQ8SFXiWTrwmxB7yRwiue
 9NvgY2GsRFsUvlx2hsYAX1CCW2Z0Gr+aH8lRHxskC1oFiDBCYgIa2rW8w1ltD7I8YDPJ
 xXkg==
X-Gm-Message-State: AOAM530AJ6C1/ZYCgiZVZMkJ/seMfRcukE9r0jXNXa/IIQkiCN2pM5PX
 oDChQircklmAllTXTJS7IKB68oHXK3A=
X-Google-Smtp-Source: ABdhPJzLuDIcItYqhpBvG40Umd8GhPddJFGxI8XPfjPr7aUOterWCmK6jlo+KLZYG8Gy1kTqnkwL6w==
X-Received: by 2002:a05:6122:20a7:: with SMTP id
 i39mr149055624vkd.15.1637514571893; 
 Sun, 21 Nov 2021 09:09:31 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id q9sm3159121vkn.44.2021.11.21.09.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 09:09:31 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:07:56 -0300
Message-Id: <20211121170756.3810922-7-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211121170756.3810922-1-ricardo.martincoski@gmail.com>
References: <20211121170756.3810922-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-next v2 7/7] Makefile: include *.patch in
 check-package
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Since a long time, we have a check-package check for patches. Make sure
that this check runs in 'make check-package', by including *.patch in
the find expression.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Ricardo: do not run check for SoB for now]
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
v2 for http://patchwork.ozlabs.org/project/buildroot/patch/20211025192813.159336-1-arnout@mind.be/
At next branch currently we have 53 SoB warnings.

I don't want to mess with missing SoBs for now :)
These are the reasons:
IMO, someone must check every single one of the 53 .patches to add a
SoB. What should we do for them?
 - check where the patch came from? Maybe not possible in some cases.
 - assume that who added the patch was signing it (is this a valid legal
   assumption?)
 - maybe add the SoB of the person checking the patch instead?
 - many patches missing a SoB also completely miss a header describing
   the patch

But while these .patch files are not fixed, we can use this
'--exclude=Sob' and check in the GitLab pipeline all other parts of
.patch files that check-package knows already. See:
$ ./utils/check-package --dry-run package/screen/0001-no-memcpy-fallback.patch
package/screen/0001-no-memcpy-fallback.patch: would run: ['ApplyOrder', 'NewlineAtEof', 'NumberedSubject', 'Sob']

v2 of this series can be applied already, see a run in the GitLab CI
using this series:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/1804683744
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 4062883cc2..55676386f9 100644
--- a/Makefile
+++ b/Makefile
@@ -1224,8 +1224,8 @@ check-flake8:
 	| xargs -- python3 -m flake8 --statistics
 
 check-package:
-	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \) \
-		-exec ./utils/check-package {} +
+	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
+		-exec ./utils/check-package --exclude=Sob {} +
 
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
