Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAFFC47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 19:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8FAD4156C;
	Tue, 23 Jan 2024 19:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8FAD4156C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Gy4mkKXjZco; Tue, 23 Jan 2024 19:00:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ED02414EA;
	Tue, 23 Jan 2024 19:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ED02414EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE1A81BF35C
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 19:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B239240462
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 19:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B239240462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id czVOFMWoWdSg for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 19:00:43 +0000 (UTC)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA45640391
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 19:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA45640391
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-290ec261a61so114106a91.0
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 11:00:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706036442; x=1706641242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tt1CwAL9pO/DA1HXVlvsjweNdKUGGsoTrwdIaKZlom0=;
 b=TMwL+aRCSF5vF6biBGPSwvDkkC73oE5Fkv44O+AWgI01qHBTIeOxMo3KBqWek23VX9
 aJZ/rVVlnDQPEXhiiB3bkzuwXj2FhfxN4ynYAMlCPHyiH0pgA+p8Mel+882x9TnsITx+
 q5/Sau1x8nu54Z7VMZZzReCwgyueaVBF0oXu/Jc+BZNq8z1Wrqegfc6kfYY5z/cAOobA
 VHWESz+81j3T6vc+ycuqK1z9EEuwW765LN57mrCNjLLfUJpMJrLMOfPK3VqSTsw8guDE
 CXq9EElLg2nYTbuEJYfWq2gmnfl0S3jLlvmaAPLi+mZDES3EXDzopYrYUlNLUq5vrt7e
 PJgw==
X-Gm-Message-State: AOJu0YzXiEKX5br0caUmzcla3VacBLORroZnB0y/u+cAu3v8C8JTDt5z
 qOKfZ3WKd7190mHqNrbewBLjlMz/xVkWNSRmCC0n9L+NujLaCEpoa8LLFcxNq8m/4KjQJRhzNNw
 H
X-Google-Smtp-Source: AGHT+IFH5arPOdjocu5dQAX5a9NDaIZYxw9YmbvxoJqmyDnj+U47zOucQEugtQW4Lg9Hapa6Lo1w8A==
X-Received: by 2002:a17:90b:3711:b0:28c:3507:a89e with SMTP id
 mg17-20020a17090b371100b0028c3507a89emr2987656pjb.21.1706036442188; 
 Tue, 23 Jan 2024 11:00:42 -0800 (PST)
Received: from fedora.. ([75.174.129.54]) by smtp.gmail.com with ESMTPSA id
 km7-20020a17090327c700b001d752c4f36asm3708638plb.78.2024.01.23.11.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 11:00:41 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 12:00:33 -0700
Message-ID: <20240123190035.904936-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123190035.904936-1-adam.duskett@amarulasolutions.com>
References: <20240123190035.904936-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706036442; x=1706641242;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tt1CwAL9pO/DA1HXVlvsjweNdKUGGsoTrwdIaKZlom0=;
 b=F3M3h+YCYvHBO5hWy++cE0S2D6xB/ladwr49wL3MjvDegd3gjufnisP6LVLut9lBms
 rTtlFww+EP3X1u5AIZJ/IFKH7SkQO3evRhjtr6u6CIS59GuB8XWvTlHVBC2d8ffiZRdB
 gBssmWRNOP7BC35jwlsYd3XtXSjk5RJjhR6/I=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=F3M3h+YC
Subject: [Buildroot] [PATCH 1/3] package/flutter-pi: remove libgles
 requirement for gstreamer audio plugin
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

package/flutter-pi: remove libgles requirement for gstreamer audio plugin

I erroneously added the dependency BR2_PACKAGE_HAS_LIBGLES for the gstreamer
audio player plugin, and the CMakeLists.txt file does not check for gles2 when
the plugin is selected. This error was likely due to a copy/paste mistake.
Remove the requirement.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-pi/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
index bb0e3702c1..95b5525806 100644
--- a/package/flutter-pi/Config.in
+++ b/package/flutter-pi/Config.in
@@ -47,7 +47,6 @@ config BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN
 
 config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN
 	bool "gstreamer audio player"
-	depends on BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
