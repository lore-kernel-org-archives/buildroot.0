Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6978CA1018
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 11:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9379840302;
	Sat, 31 Aug 2024 11:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Igt-xZxk9h7J; Sat, 31 Aug 2024 11:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9387440356
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9387440356;
	Sat, 31 Aug 2024 11:36:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 174101BF484
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 11:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 048F540251
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 11:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBvxZpod6lKh for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 11:36:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.50;
 helo=mail-wr1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04A7540111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04A7540111
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04A7540111
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 11:36:34 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-374c1e5fe79so135347f8f.1
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 04:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725104192; x=1725708992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jFYOdA5s2hDJlIxT+kkrZCXYMhh6YPQKF2Jiyzwq4Wg=;
 b=kHIcFqa06qgua1CUs7gXwvwHB1stYe+sSSzwGDxuFtFtPPXTq9lR6ez6XI+/WKaOBT
 0wNGMweiTuGlnR13kikdyDyRkcc0bMOYIgJg0AvB01u9OjCv64aPtqfiMwqRknNmHbsR
 NdM7ROfVP9mkQdYJksVjPoIyj3byYOOcJ5zsuPlw2gbnmKWtkBSnJiM5F+NC6YVEpJOh
 QFaT8ptqoAjq3xK3M0d7Nuu9wOH2qeyIAQNQ8Xs5KJ1ruEIUjKo+VVKuQMoBm/TTsVMG
 W3Dj8cLRVJDRIKlwWNiIUebIbaVTB52GAxRV9PBg7f3vO7Fiozmo15JYnR1bk4uh7VVD
 U0Fg==
X-Gm-Message-State: AOJu0YxVK1HMUdesVuJ0yU7LFP+NCGmEyT82ijJ3qrtpW5QiL75AEGDn
 uFqPY0ZnE7k093PtxcfoiAAMUWDpH/B/P1RQYS4MdPySg/7ieE9EMyJNsPL/
X-Google-Smtp-Source: AGHT+IHwNpYOhc8ov44+HGJZjJmYDt4iSm8OmGnq1th6LHqah5+eDkteFXf9idglMZpDSDQSvuJPFg==
X-Received: by 2002:a05:6000:188a:b0:368:7fca:9040 with SMTP id
 ffacd0b85a97d-374a9652f91mr3665904f8f.39.1725104191892; 
 Sat, 31 Aug 2024 04:36:31 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:d3c8:da3f:79f7:89e5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c29aa150sm572196f8f.101.2024.08.31.04.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 04:36:31 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 13:36:26 +0200
Message-ID: <20240831113626.105125-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240831113626.105125-1-thomas@devoogdt.com>
References: <20240831113626.105125-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/libgtk4: fix execinfo compile error
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

../testsuite/reftests/gtk-reftest.c:28:10: fatal error: execinfo.h: No such file or directory

We don't need the test suite, so disable it.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/libgtk4/libgtk4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index 8cb7fd0384..48bfc80c00 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -26,6 +26,7 @@ LIBGTK4_DEPENDENCIES = \
 
 LIBGTK4_CONF_OPTS = \
 	-Dbuild-tests=false \
+	-Dbuild-testsuite=false \
 	-Dmedia-ffmpeg=disabled \
 	-Dprint-cpdb=disabled \
 	-Dvulkan=disabled \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
