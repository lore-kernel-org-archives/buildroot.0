Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E050C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB2D640364;
	Sun, 14 Aug 2022 23:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB2D640364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id opOQsuVLzURV; Sun, 14 Aug 2022 23:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CE1B405BF;
	Sun, 14 Aug 2022 23:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CE1B405BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 557971BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 310D9402F5
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 310D9402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHSeJvoX7z9G for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74056400E4
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74056400E4
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:03 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id b124so5830391vsc.9
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VoMI9eIzSPFjTM9pRtWTyqZendlCsHox98PE/9nPIJ8=;
 b=qqVovpLy91NKAOLOoJ4XtEPTiL8Rr/NC+wSeB3dH52zzo+TXjlvc7EqDy63vqVtByf
 RgVBOzLN9cda/EO1EKZ5NeLAf3KD74nHGNdka7G03Y83RslWtKgRfFLSMhWy8qApiJts
 AODGExmCdsD/RHZf1R9lhlFeNTGh5QNFrlaGNZve4dDQJvtcqPXi4oBYazIr4Z3WsDJc
 WhC4pDzo6ocFc8hoQ6nCjuM5mDtSEqe4rXWPeq//vSUOsd+Lh22ui7/gGU6LhKDDbJVJ
 9Z89BimMviQLJMVUP3TZRKrTNZl08vJ7N+Dnl3/1Ko8zRS18XqDZZUjgdea4flV3FnNa
 +MdQ==
X-Gm-Message-State: ACgBeo3Ef/GjM52HYnfyhSfDR/8Rx8tSthY3JWd1dN50AVgs892uVHcL
 zZFujQvD3/OjHDKdMxu2EztYPfx1F50=
X-Google-Smtp-Source: AA6agR7mPcP0ZhTfEi1Lf0qUGPvPoMMz6N7EOm1LyHitmfAhu/kGL5yaiWJLNSF0+Kc7MoQ8IXpc5g==
X-Received: by 2002:a67:c30d:0:b0:370:25e1:7c with SMTP id
 r13-20020a67c30d000000b0037025e1007cmr5392671vsj.70.1660520403121; 
 Sun, 14 Aug 2022 16:40:03 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:02 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:30 -0300
Message-Id: <20220814233845.2247022-19-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VoMI9eIzSPFjTM9pRtWTyqZendlCsHox98PE/9nPIJ8=;
 b=fIwBYwFn6S+yO40Ci28HKFEIyKdyCkG3PWc8VXLQReg8M57SexYvSGDxHMS2l872VZ
 Qmt1T1E9aR2WFdZ5LBa6RG1l5k3f9xUN/aZ0e0FYxKXNd9yuwGFjhd2ASTImNFkYa32k
 NuMMBVx+zRS8U3vF9rVwczi8a2OgH7yNd50atP8jWUTZflOI3+RtNNcut1k4RQ0kIn7x
 8SQrSY3liHhPVHPBFnaQ7mREI642tRTE6CRLnB3Bj3mFdzle1xivfMdWz6f3ZFqRNJMA
 YoUykZE49jvSYozA3EeCLf+vSYev7vTAOv+4Shz3DQNnFTK3meWFNIg3nUqzQbHR54U4
 pW3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fIwBYwFn
Subject: [Buildroot] [PATCH 18/33] package/libglvnd: fix typo on
 BR2_PACKAGE_XORGPROTO
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

The typo was added in 2020 by commit
'0378e2e5d9 package/libglvnd: new package'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/libglvnd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
index d020c21465..f471e289bd 100644
--- a/package/libglvnd/Config.in
+++ b/package/libglvnd/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_LIBGLVND_DISPATCH_GL
 	depends on BR2_PACKAGE_XORG7 # libx11, libXext, xorgproto
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_XORGPROTO
+	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_HAS_LIBGL
 
 config BR2_PACKAGE_LIBGLVND_DISPATCH_EGL
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
