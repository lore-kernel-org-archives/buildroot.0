Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68294C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 025EC60E21;
	Sun, 14 Aug 2022 23:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 025EC60E21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TsOmz127yYZB; Sun, 14 Aug 2022 23:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 073EA60DB7;
	Sun, 14 Aug 2022 23:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 073EA60DB7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5F141BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE05B60C12
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE05B60C12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kd5N4oYh4hIt for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16653605AE
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16653605AE
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:20 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id bq26so2999649vkb.8
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4lCKk3NObj3remqHHnyI+DWEztXa085FRTMOuVaa3iE=;
 b=gx8tH4M9wPi/ucgHRkWJksv5JFpvGOzkWFDxnExfVHvypFzditp60tqIWx4sHZQ2WQ
 FmQpMr//FQstOpUZsdOZixiyvkbr2foirGustXkra4qwHljakRX/gk6dRAa8n4fobKTl
 FzF/mGZ1fVXytxBVtJPfmxDG5dG41o+yeC8YiwdugTfBlwL8JynMdJJxOM8dfAlfozQn
 9i+/6W3zXzvLhMuFz3QmvVuxST3eFFXsPSCwpUDS4RtRwIZXsi3a8EWsNueqPOLIpUuC
 oa9FpE5nD/NddnHJnO4aRi5zzpK+DyEhvhRWes7Rn0KCMT+q1wmYx+5UCYE+XgjHuIaa
 op9A==
X-Gm-Message-State: ACgBeo0zpEdplwzH0OV6SgUeEMA0j/rbZ+kJ5v34NZ9SGEcnecslxjPi
 L3Y6Tofd2xlmuimhAqn0ojjErq8Td18=
X-Google-Smtp-Source: AA6agR6yA+ZR9CzbfnIn6VQjuq1zYHtvZIBrd/NDtG3zZmTi33lK/yRmKXBv1Y78IS3siUKSFjYWpw==
X-Received: by 2002:a1f:30cb:0:b0:376:486a:7cb6 with SMTP id
 w194-20020a1f30cb000000b00376486a7cb6mr5453357vkw.29.1660520358870; 
 Sun, 14 Aug 2022 16:39:18 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:17 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:13 -0300
Message-Id: <20220814233845.2247022-2-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4lCKk3NObj3remqHHnyI+DWEztXa085FRTMOuVaa3iE=;
 b=RnuGxOvfmd3PIbBMbfbUi0tGPb6d13qZZscLrIOwAr/BBrT1nhvT++0E/76gSHbAYG
 ojkIvd7kMGg9+E3kqxqI7INspUAuxzLNIeZrTNW15Jqyynw8SMuN1Cdv1b/kgvHW7Gvl
 yo+xKrOY6qU2B8xDq3+7Cb/xQaaYzcqwUG3jxai/UnH8hw9bCobJBJu9evTjuGeQ/0IV
 aoibMjmfWJXo9clHjV3RNRl2qCHcdZJ72eVViE2RaLuCVwDTYhYoVglzcvCTsmAZSkZr
 L6jExH4uafqLbRMA3B6gJBN+s1dF6mqj196gfVOUbdtbZp6uSGzKmH7QjxXlAmZyIJf8
 VNow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RnuGxOvf
Subject: [Buildroot] [PATCH 01/33] package/tclap: fix typo on help
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

libary -> library

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/tclap/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tclap/Config.in b/package/tclap/Config.in
index 560cf33174..64b0b74c8a 100644
--- a/package/tclap/Config.in
+++ b/package/tclap/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_TCLAP
 	  This is a small, flexible library that provides a simple
 	  interface for defining and accessing command line
 	  arguments. It was initially inspired by the user friendly
-	  CLAP libary. The difference is that this library is
+	  CLAP library. The difference is that this library is
 	  templatized, so the argument class is type independent. Type
 	  independence avoids identical-except-for-type objects, such
 	  as IntArg, FloatArg, and StringArg. While the library is not
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
