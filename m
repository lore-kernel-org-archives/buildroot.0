Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9439C433EF
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 15:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0817981B25;
	Wed, 24 Nov 2021 15:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X368xutoiOcd; Wed, 24 Nov 2021 15:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7353481B17;
	Wed, 24 Nov 2021 15:07:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F75A1BF41A
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 15:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F24740458
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 15:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xyhNzfddq6B6 for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 15:07:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AEE34040D
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 15:07:11 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so2350426wmc.2
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 07:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=R/JyHcPSaVIPZ9plIElJ790mMuvbXTDJUm8uJO4e7R8=;
 b=c6SaE6nV30zdkAZMbrrlHoXWVkPGzPp5ZGsOSHEgJWDEt3mLWNxthaO6Yt5RYEDiJK
 RBWwk3CvAKvVCQ/MW317lbwBUNEIkNOopEkmaEUw5b5/ohbYwLrEdmFNnfpT63nPZ5NV
 Zu5t41CQXw2tM4BuH4ZLWQn25WMqmxuHpeCs5a1gn7fh/UB7XUpQdUfq7ickTCB3gKnF
 gJgeSLKq+Q9HWGuVBHXQnNHBOBeFGpCeX/3r6CCb+ueWZD5XfMerOAlPuKb1F5+rI7vm
 bxAy0MuoZOcrxSwWLxM31KkBjl+X/ANUzvP3dkJMLv5cwtlfHRVSNoxZCvxEXVmWPaZX
 z2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=R/JyHcPSaVIPZ9plIElJ790mMuvbXTDJUm8uJO4e7R8=;
 b=mbbD/8rbUQMgWYLKZC+pEt2RaYqmfODkPmPYPb2HJayVmA5K1/1AAmTUVY9s/cEHDm
 4QMQ/ICzO1+FO51lQjb4vZV8UPjHcRSozvYAvBL+7OOM9boFZvK8aMgeHSvtcNonrpNT
 cUtZYYbj2fkEkMnagI3iFJkxirIc9thadK0c+REQFLs83aCoUf7V1YX/iraMo0q1yABf
 N345q8fi9m+D6WnXcDV3GnOFV1iIxu73IGbPTQNTqpLqrRL2UFz55hoauhLnOT0ffKK4
 fTrPg7WBVjhT0QkxO12SzE6iQgpiSPvVX6dh7ejNIYYTNe1KEXdpGhruDCRU0q/Yv25p
 laHA==
X-Gm-Message-State: AOAM531TjuEmxl/S/fLo4xSG+H2mWBdNz2cjFCCB4bgWZ6FFQgftzwCo
 qM3o3S18+OmayxP5u+GHuyw=
X-Google-Smtp-Source: ABdhPJw/j4BEyPY+4nEYdqUPnzs8TNEAOLWY2fDKVtLFQkLUTx9u24+OOYDBBaofS4NFnPc0MSMS/g==
X-Received: by 2002:a1c:a9c6:: with SMTP id s189mr16368693wme.38.1637766429539; 
 Wed, 24 Nov 2021 07:07:09 -0800 (PST)
Received: from camb691.localdomain (bilbo.ozlabs.org. [203.11.71.1])
 by smtp.gmail.com with ESMTPSA id k187sm6022703wme.0.2021.11.24.07.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 07:07:09 -0800 (PST)
Date: Wed, 24 Nov 2021 15:06:54 +0000
From: Cyril Bur <cyrilbur@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Message-ID: <20211124150654.2096bd33@camb691.localdomain>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] pkg-stats: Ignore make output without '='
 character
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
Cc: luca@lucaceresoli.net, thomas.de_schampheleire@nokia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It is possible that some users of buildroot have put it in a repository
and call into it from another Makefile such as:
.DEFAULT:
	$(MAKE) O=$(abspath $(O)) -C buildroot $(@)

This technique works well except that Make tells us that it changes into
the buildroot directory:
make[1]: Entering directory 'buildroot'

Because this line doesn't have an equals within it, python raises a
ValueError exception within pkg-stats.

This patch has python tell the invoked make not to print directories

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
Dropped the RFC after feedback from Arnout which I have taken onboard

 support/scripts/pkg-stats | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 3992c8312a..a435abff3d 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -375,7 +375,8 @@ def get_config_packages():
 
 def package_init_make_info():
     # Fetch all variables at once
-    variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
+    variables = subprocess.check_output(["make", "--no-print-directory", "-s",
+                                         "BR2_HAVE_DOT_CONFIG=y", "printvars",
                                          "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES %_CPE_ID"])
     variable_list = variables.decode().splitlines()
 
-- 
2.34.0


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
