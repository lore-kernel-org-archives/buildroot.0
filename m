Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9B6C77B7D
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 14:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F124B8407E;
	Mon, 15 May 2023 14:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F124B8407E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GK9Ijl7_kdK4; Mon, 15 May 2023 14:26:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22E048406B;
	Mon, 15 May 2023 14:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22E048406B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF2E31BF575
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 14:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4A8640C3F
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 14:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4A8640C3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlCKR_5IW41g for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 14:26:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B87AA400C5
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B87AA400C5
 for <buildroot@buildroot.org>; Mon, 15 May 2023 14:26:02 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3062b101ae1so8372858f8f.2
 for <buildroot@buildroot.org>; Mon, 15 May 2023 07:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684160761; x=1686752761;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3WyDFr2lztrYtaYPkJnO7YF8SmihNnQZIq7t/5i4+p8=;
 b=BXfa9juJSiJcoKW8KqyAAdez7oW9+MkPWE6bUEyU90fBeXc2GF/Js+7FOV7HYg8EdI
 7qfafldrWmaESaavFwq/cLF7ApKiDVvcRKKuuNgu/tT47q5fVee8uQ3QhBMr2IFhwTTE
 Vk1WBvXj3rf/i4T9brLERbb05IyF4R/CcgKVHNPtUxs6UedwZtmFLnsGOYJ+R8AGjI4j
 2cpF1LopYoc6VzpyDokMugZJEUer5pZ65ezyUtWN44Cmw3XvW0Mv/yENLgZpst74dpfg
 lgK+zk5RrbhvxeRv7JpUSmkawZ1CusanGf/72P/o/nkSt8rebdCt3aWhBOgD1HOBNUyv
 x5dg==
X-Gm-Message-State: AC+VfDyY7On3yDsXLfkMDufcCR/YUzRUIBYsZhK0djaLkga7FNWO1Y+e
 ndEULJTT18R/eajrdU89F0YIaur9IWM=
X-Google-Smtp-Source: ACHHUZ4MY32A892kT8wrD+KGPiZ5HJPz+2mARJqWvySm+LwUOLDCJAnHqxBNla9xcldg4oHYEgV2kw==
X-Received: by 2002:a05:6000:b:b0:302:1b72:b951 with SMTP id
 h11-20020a056000000b00b003021b72b951mr22444498wrx.26.1684160760524; 
 Mon, 15 May 2023 07:26:00 -0700 (PDT)
Received: from localhost.localdomain
 (aputeaux-652-1-54-113.w83-204.abo.wanadoo.fr. [83.204.213.113])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a5d67d0000000b002fae7408544sm32878239wrw.108.2023.05.15.07.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:25:59 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 May 2023 16:25:56 +0200
Message-Id: <20230515142556.3718991-1-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684160761; x=1686752761;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3WyDFr2lztrYtaYPkJnO7YF8SmihNnQZIq7t/5i4+p8=;
 b=eitpLjI8sA0aK58dPEeAhdRtYKG3yHKTHCow9DhhRxTqhzp16VKStJQeVJ6gxMkkde
 Ys1uhUy9o119+WeAGkmgEW7NO4vS+A6W3kGfW8IkY0mtEdQO5gyu0YTPg5wuUd5wEegF
 hRfLfiXF3Ty0669q7HBY40Xcjgqsx4zJo1x4iMYF5MT4rnbv1/d1eUAncJ+CFzLDOtJz
 7xy0pT4AmcC0bIzJ75Ul1jGmtYzw1/ImzK86fHjWe7R/dyp+pkXzU9iR0Tnu8xDt1Ysx
 Wr/3vCo949v4yOBJV+hmm6C2jaj5RH243bgoJo0jro5ZCOB1ek6MLpFgcvThlxHlo9iE
 c1OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=eitpLjI8
Subject: [Buildroot] [PATCH] package/sshpass: bump to version 1.10
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
Cc: Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog 1.09 -> 1.10:
ef1034d Tag version 1.10
c596390 Controlling TTY code fix.
32b7553 Help message problems
c89cee9 Convert repository from SVN to git
934f87f Sig unsafe functions in signal handler
ed856e6 Better "-e" handling.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 package/sshpass/sshpass.hash | 2 +-
 package/sshpass/sshpass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sshpass/sshpass.hash b/package/sshpass/sshpass.hash
index cb8968bca4..3fe95c8b0f 100644
--- a/package/sshpass/sshpass.hash
+++ b/package/sshpass/sshpass.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8dc48717dedc49fb7  sshpass-1.09.tar.gz
+sha256  ad1106c203cbb56185ca3bad8c6ccafca3b4064696194da879f81c8d7bdfeeda  sshpass-1.10.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/sshpass/sshpass.mk b/package/sshpass/sshpass.mk
index 21e10397b6..beb0a63911 100644
--- a/package/sshpass/sshpass.mk
+++ b/package/sshpass/sshpass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHPASS_VERSION = 1.09
+SSHPASS_VERSION = 1.10
 SSHPASS_SITE = http://downloads.sourceforge.net/project/sshpass/sshpass/$(SSHPASS_VERSION)
 SSHPASS_LICENSE = GPL-2.0+
 SSHPASS_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
