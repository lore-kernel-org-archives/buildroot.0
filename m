Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C023C64ED8
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 16:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FC8E40B4F;
	Sun, 19 Feb 2023 16:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FC8E40B4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kVfN_luaG5GO; Sun, 19 Feb 2023 16:48:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F94B40B34;
	Sun, 19 Feb 2023 16:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F94B40B34
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80AFC1BF287
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A433819B8
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A433819B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Brb9M60MPVZj for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 16:48:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 351DE8129B
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 351DE8129B
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 16:48:30 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 p18-20020a05600c359200b003dc57ea0dfeso664325wmq.0
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 08:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WmGZM25+VR5HSCSR7gBcPP7N4dKzhZMpWCGjkXg2sSw=;
 b=2Nq2tDhIPSib+vAG04D2U3JZ9QXua+1DTFjv9OR3HxRnuZgkttFGhDAebY3nJMlAlW
 ujf09Jpr7i95DT169VJx8EO+66Bbmg6KypeJMS/hTPPZDkxkwZKKp+OdbDHS/2y/KD2w
 QdCpgWyNMBO1Js0FPJCD1t/Hpwt5hcoZYTQadEks0/OSLAiXwNDcu9NrubjHU/aHvhXL
 a9yojtvluFfRu+F0AsIorVBkfnTQBrub+4vA5cvdu1LKywq7WkPeBq0MCmxD+3QYs7MY
 aLQUkgJmr3FS84TCa5duhUohKIkOKoe2jro6flMbNm15gXTglRss0N2R6x6C8Waw5sxo
 KB2Q==
X-Gm-Message-State: AO0yUKVa+GK+dCqld1VvJ2ICI3t89pBk1zZt4nZzC8z4MUBiqIw+Qpbd
 QWBxMWAHgOEKRneEOJqwy6GnixyDIHQ=
X-Google-Smtp-Source: AK7set/aa45Lp5i7zds/wh70UUazjC+N24qOyohnFTJRzDyVzfyO7h9jX+Y1dntarh9S3ieECsXGhg==
X-Received: by 2002:a05:600c:3d8f:b0:3dd:1c46:b92 with SMTP id
 bi15-20020a05600c3d8f00b003dd1c460b92mr5178812wmb.16.1676825308088; 
 Sun, 19 Feb 2023 08:48:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b003e2232d0960sm8064404wmp.23.2023.02.19.08.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 08:48:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 17:48:21 +0100
Message-Id: <20230219164822.142283-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230219164822.142283-1-fontaine.fabrice@gmail.com>
References: <20230219164822.142283-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WmGZM25+VR5HSCSR7gBcPP7N4dKzhZMpWCGjkXg2sSw=;
 b=nw0NSuduNm2l4aXrcM0Fs3FnNFtZY0ahknV3lEaZU/KlQrBbbAJh66eVBiIUPsDd4Y
 7gSO9r9MtGXJ3a7qneSvETk/sQs0YFr3Sg4nW54F1A58ICJCs83QxNNqnC5qxosVrNuZ
 vk7lDoe3H3W8+2BuVoBDdh4D0itJA8nw4w/93r6WKk67TfkZSSLGYlFoRN2t/5zxC1Yt
 2MH6fOO2t2dsBhEhA0/s7EEoXNfuCHOLBbYTyzZMYleg3sZp+CB+3d8+pxJHnkFuBHHN
 RnfDGXqPK3bDnA3mwWJV+kucM7vWrS5K2NyWI5aqK487hG1ShQ+DAiRtqchbVKA9B3L5
 tWZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nw0NSudu
Subject: [Buildroot] [PATCH v2,
 2/3] package/libjxl: disable benchmark and tests
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable benchmark and tests which are enabled by default since the
addition of the package in commit
e648d399d8bd609697e78f13f7fa76be06d91a57

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libjxl/libjxl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index 1257928efd..b4dfbecf82 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -23,7 +23,9 @@ endif
 LIBJXL_CONF_OPTS = \
 	-DJPEGXL_BUNDLE_LIBPNG=OFF \
 	-DJPEGXL_BUNDLE_SKCMS=OFF \
+	-DJPEGXL_ENABLE_BENCHMARK=OFF \
 	-DJPEGXL_ENABLE_DOXYGEN=OFF \
+	-DJPEGXL_ENABLE_EXAMPLES=OFF \
 	-DJPEGXL_ENABLE_JNI=OFF \
 	-DJPEGXL_ENABLE_MANPAGES=OFF \
 	-DJPEGXL_ENABLE_OPENEXR=OFF \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
