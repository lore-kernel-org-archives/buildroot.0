Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F174CC636D7
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A711960BEC;
	Fri, 10 Feb 2023 22:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A711960BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id phf85xFjofaH; Fri, 10 Feb 2023 22:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED05C61058;
	Fri, 10 Feb 2023 22:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED05C61058
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6339B1BF973
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BED241B4A
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BED241B4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AdjJKGyl4kvN for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:31:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D23341B49
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D23341B49
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:31:46 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id ba1so6489641wrb.5
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tu7XCIBETmKd3MB9i7ipWZvnH8uICBrVPOxis783emk=;
 b=EVDd1RngBZgvLnc0BpDKp10Vt+KUixno3kUq1HH2aJwGCLjAMAkNEfG4KTmUOU1P68
 emLFw43ELbPRFe+SgYKf7mIKeBiWiqn/YlT2oZCG5MEqidNiH/7+gG4KlmNbeKraQwxE
 dIJDKEeM/O1X+1Pr5nLDxLsnsh3GGhmbX/X0GSP/hPvrF/8Y3DuTupDAOaNQW/oMYTWt
 H6FzNnfE04bMM4z/cSwyZZXZLLl1xOWcPSS1SPxco/BKT0TnKJKUK3J/H2lfSpNJkTFH
 TlO9Dq7J6xlu9h+vG8x0B83p4f8Cg7EabOS1USvk59JDHRTFnYJA01XEhlGojPhkuDHC
 VBcg==
X-Gm-Message-State: AO0yUKV5KfYYFIp5swhKkARcPaRXX30lF14bvtudWd3Otc/SrWDkKNJk
 MSZtslK9Fg8LthBCeUvxY0m2seiD2P0=
X-Google-Smtp-Source: AK7set+iZ/2KOrkwlSPUHzDUgKp4svF1yCCBYW61VgiNxG3erjTyBv6/y5Zy/TjpAUuwT0uNKXPn9g==
X-Received: by 2002:adf:e852:0:b0:2c5:4680:7d17 with SMTP id
 d18-20020adfe852000000b002c546807d17mr4060039wrn.17.1676068304472; 
 Fri, 10 Feb 2023 14:31:44 -0800 (PST)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 n15-20020a5d4c4f000000b002c54538c9bdsm3130221wrt.10.2023.02.10.14.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 14:31:44 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:31:42 +0100
Message-Id: <20230210223143.1060114-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=tu7XCIBETmKd3MB9i7ipWZvnH8uICBrVPOxis783emk=;
 b=kXaIJWhyU6ZcdB3nO2schOE+3qSxWUnM5/5m2ByuyTQPrl4Xb+pIn3T4/fZEAeXAxQ
 /K0UP67/TuBBE6ERIkoqEnNMYMjtgD0BqPGZLXaipE3RhEg+H/t1T59k977r2t34z7qt
 lLgAz6cEb6lup5XXxIhpnB120gOE3XeI143J/DApXOWo25y8dWeOiStPXURw4k4Zxxla
 MLLfgTyzw8nvg38+RcPVNyn0NzFSlxWnO7ETVAF+sSmzu/1Tv+fTpLUhm3UKsmxlFPYH
 FPsUUsdMeKb2oSPa2Kl9axr1u0J21tpbF7g8/qUJ+V14TG9A5M7TpmPupz+oBsTGzM9Z
 LyQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kXaIJWhy
Subject: [Buildroot] [PATCH 1/2] support/download: catch post-process errors
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, when the post-process helper fails while downloading from
upstream, there is no fallback to the backup mirror.

In case the post-process helper fails, we mut consider that to be a
download failure, so we must bail out as if the download backend itself
did fail, but we fail to do so.

Duplicate the logic we have for the download helper: if the post-process
helper fails, remove the downloaded stuff, and continue on to the next
URI, which will ultimately hit the backup mirror (if one has been
configured).

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/dl-wrapper | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 09a6ac1f1a..1e8d6058f6 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -138,9 +138,15 @@ main() {
         fi
 
         if [ -n "${post_process}" ] ; then
-            "${OLDPWD}/support/download/${post_process}-post-process" \
-                -o "${tmpf}" \
-                -n "${raw_base_name}"
+            if ! "${OLDPWD}/support/download/${post_process}-post-process" \
+                    -o "${tmpf}" \
+                    -n "${raw_base_name}"
+            then
+                # cd back to keep path coherence
+                cd "${OLDPWD}"
+                rm -rf "${tmpd}"
+                continue
+            fi
         fi
 
         # cd back to free the temp-dir, so we can remove it later
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
