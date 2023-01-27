Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99948C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 05:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7B9782768;
	Fri, 27 Jan 2023 05:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7B9782768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q_xCV93HUxY3; Fri, 27 Jan 2023 05:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 439DD8257D;
	Fri, 27 Jan 2023 05:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 439DD8257D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 044691BF489
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 05:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC820403E5
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 05:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC820403E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MGh6bKzdKold for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 05:06:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00B97402F5
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00B97402F5
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 05:06:17 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id m8so1899274ili.7
 for <buildroot@buildroot.org>; Thu, 26 Jan 2023 21:06:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qIrEhVhGw5XMEEpUA4KlTMNL5o+Gvjxakf9nKl1QotA=;
 b=JvTshsxHwx8pqhmZdW36K8qPS/w+iM/8b0A8ah3fb9B07Jwn38m+rOlOQcXCuE/yeN
 oozvFRXe7kz+Ef//xc7sqJjvqPw1KbR6iRgeXQSDWBwMiPJ/PnQzxBaIenLG6pF4j4x2
 6KGiGz8V1J3lH4Wmgle9p8F4Alr1QccQsLnis5OimhlSDIj7W2/FDClhH3nFhKpGeVrq
 T9n7hesxF2yFfXF04hHrC3ttgJcRzuzFscrSUwGd62n83VAfI8ci8wWtae3/1fGW+dNg
 OK1B3+3HVCTVUzpTUHI+zvZatQDCIBDVgb96pIR0x9plt38nEYlufmJbrcvd6p6Fy5Mm
 1ETA==
X-Gm-Message-State: AO0yUKWzBTOfRkWwiFh14YX3DJNN1yMSYea6bqwonQ2UNLxuqE3aLk2R
 Hq2TAZ5AJjKXMOYx+AfJEljiDhiCMFx5zQ==
X-Google-Smtp-Source: AK7set+xAxnsS//OaDfwi1Nux6pmCHYMYGIspb9vVvIUylPKhEQe2rnzeNAHhratqsxDXgU1ZMrM9A==
X-Received: by 2002:a05:6e02:188d:b0:310:956d:e8be with SMTP id
 o13-20020a056e02188d00b00310956de8bemr11236958ilu.19.1674795976792; 
 Thu, 26 Jan 2023 21:06:16 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 h31-20020a022b1f000000b00363f8e0ab41sm1078287jaa.152.2023.01.26.21.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 21:06:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Jan 2023 22:06:13 -0700
Message-Id: <20230127050613.793962-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qIrEhVhGw5XMEEpUA4KlTMNL5o+Gvjxakf9nKl1QotA=;
 b=CIwuKyKZhh9po5MWFzGRuFdXzl8NX0t+neaYfIie5W5HohcUGJTcp+suMx4W+DgORU
 YHTRzhHXkHb0OHkp96jnhspF3eNw/VrPT8x9bWejoySl1h/ti4mxMdkPNUGGAw8MskuJ
 xEMnAj6UFMzMy9jv7Hyz4yJNNH83p8E4VN1ZMFL78/EQuzy1CqOrdcZjKW6lUibTdMzW
 5fMbJuXfom2KUZ002Zwv8uwFOsrl2v159Arnk8EizFvt/+/W+OSCmUSu/aEA50Ryz60E
 9oji6gaIWXSGYO4jaG4KuFq+e9CfGOUjq1KHpsDDBtPf/pivl0Pqsn5hbJV+nwuLqxhW
 VGOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CIwuKyKZ
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: add missing C++
 dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - http://autobuild.buildroot.net/results/529/5291fe0fac1d5c7b6587e4a566991a764a2632fb

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-greenlet/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
index 9f66ebe119..32ccdaae27 100644
--- a/package/python-greenlet/Config.in
+++ b/package/python-greenlet/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
 config BR2_PACKAGE_PYTHON_GREENLET
 	bool "python-greenlet"
 	depends on BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Lightweight in-process concurrent programming.
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
