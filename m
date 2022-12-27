Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4177C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 22:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D86E60C31;
	Tue, 27 Dec 2022 22:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D86E60C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftFwW8zPCqnf; Tue, 27 Dec 2022 22:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 893F660B2C;
	Tue, 27 Dec 2022 22:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 893F660B2C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF0311BF2E4
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 22:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94FEA408C3
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 22:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94FEA408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EqrAnT3OTqKx for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 22:22:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8224408C0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8224408C0
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 22:22:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id ja17so10182433wmb.3
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 14:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JmWflwb2wlH/d2btA1iJSPpcjCWHX0TV65s5AYc4S2Y=;
 b=Y9+19Bnzy3wZR0HYdtYhBNuptLia9yBvZjiuTzQuYf5TLGAQCy3oyZyanf8YBGAKgC
 2sE0u2rqUWwHiqj63Bibga0SDZxZIfPGD61wG9PaZ0wYJen7mUXQUJxkdwHkL7Jh3D8P
 1pCyfr/Eg59jGi1k6Q8uH0Av2XoFJnOf4WGa0A5L/LXsX+nJznopetCuKXTbcvMjXcRc
 EmtU+viEnC7gU5zNgTI6tcjqilnUS3FHtNu4t4C+C24XQwEGbwA9I/fbj2P7yxFVKl61
 mD+da7SNaBZU1dakEftww1MkE+8uBdzYc0koXv/8SvdxowUX5Or6npsGiHWUJu6LJwWM
 IwJA==
X-Gm-Message-State: AFqh2kqOeTte02G0wNa8Y7oTlzbbyrfC44aP+/EL4rQySKmwbE9tDIhm
 hsg3vQiLCIG0oA9mxgd9cUrU3yEjQQE=
X-Google-Smtp-Source: AMrXdXsRZVQjLTrgIkDEfBzhv442+w3/J/l0r7HcNtpKNIfEdT0i16omtWHZ6i+XDMlPeX03kb0wfQ==
X-Received: by 2002:a05:600c:500e:b0:3cf:88c3:d008 with SMTP id
 n14-20020a05600c500e00b003cf88c3d008mr19472748wmr.28.1672179773462; 
 Tue, 27 Dec 2022 14:22:53 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c080500b003d208eb17ecsm17577384wmp.26.2022.12.27.14.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 14:22:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 23:22:46 +0100
Message-Id: <20221227222246.373638-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JmWflwb2wlH/d2btA1iJSPpcjCWHX0TV65s5AYc4S2Y=;
 b=XdMBAMT+nIzKUUzZ8m2EDIoytlBDVimD7DQXTmpGX6Yso0m3IVOe4cGD/GkccUBk6T
 +Xr+PqtxZr6SbYd/G64ILKSJhCBozFqSoTNyB1lUugeA312epA7AuRKDJUbw/WqY4Zwq
 AqL6SCWMrMyzXPeTQhnpxqKQjFqzEC7Q1b9uqViO44H4xAcUjs/FyImyxsOZZljc32YG
 I9ZYm/43Aa4OaGzdqhnAxvwf3ak57YRqsMj0eIob1ljdHiNfAg1BATnEqADgWPaefYog
 pH8ef8QscApOsJ+FbG69puuus2GcommC6fCMr6J+SSxZc3hTiwcoAVFXhiykqfBuFZdi
 fEvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XdMBAMT+
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: drop upx
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 85c5af46ad6c18841576c0f7abe241a617a44cb7 forgot to drop upx from
DEVELOPERS file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 277f0043e1..c2de0447c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1094,7 +1094,6 @@ F:	package/php-amqp/
 F:	package/python-cherrypy/
 F:	package/sane-backends/
 F:	package/ucl/
-F:	package/upx/
 F:	package/zxing-cpp/
 
 N:	Frank Vanbever <frank.vanbever@essensium.com>
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
