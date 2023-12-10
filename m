Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B11C4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 19:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CC32400D0;
	Sun, 10 Dec 2023 19:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CC32400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1tAfbnm6Fm61; Sun, 10 Dec 2023 19:19:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9561440116;
	Sun, 10 Dec 2023 19:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9561440116
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 543091BF368
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 19:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3995381DFA
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 19:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3995381DFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ot0DihOin9W8 for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 19:19:43 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05B7B81DF7
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 19:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05B7B81DF7
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c41df5577so7863255e9.0
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 11:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702235981; x=1702840781;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+IvpJXzlq3oY8Uk1dyGpU3xVj0Ajk2VmjLB/yY7a2U=;
 b=Db5RtgiSxiYmT6TqAb789tDALtSG88JxQRnS17v/QVHQQnL7qMOW474MDrPr4NOBas
 gkwglKnLAYIVWGGbB/E7GrK5ym3nhnoJpwi+ZtkbomA0bvp9ptIdFPkXvMWaNcRV/S3c
 bSHL2OUoSa2/UABSa8yUuwWifv39ZMziYcI/McjOfoCteBzgUfjaMmYoOLAwlMhkxfGs
 bUj/65sRrDOHJrlLofQqqvv6kF7/hkgEwbkwXFu5jA9bv6M/RBMCVRjpV4ulPDpe2gM4
 cafMPIwGmiPFn8wLqGuAaWg/psh68jC4UzDZKlvdeRPIGTQcKJ4sd/uTC67YZDAMlpuM
 qRtw==
X-Gm-Message-State: AOJu0YwLM3IC6sHTTON5a+Btxr7oKkcQ5m6MhlFGeNZDpuiGb8L44s95
 Z4JEPRuhevTgEW2ZO8l8JLFlFbPdXoo=
X-Google-Smtp-Source: AGHT+IGru+pYJDFd0hUH10t7qvn5X4cBgXBvgsvP6Y4pHXk93tXMUslZdTEXCmO70yO3UyHmaNHp1g==
X-Received: by 2002:a05:600c:c3:b0:40c:2305:ccff with SMTP id
 u3-20020a05600c00c300b0040c2305ccffmr869571wmm.301.1702235980656; 
 Sun, 10 Dec 2023 11:19:40 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c501200b0040b37f1079dsm12900533wmr.29.2023.12.10.11.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Dec 2023 11:19:40 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Dec 2023 20:19:39 +0100
Message-ID: <20231210191939.1487618-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702235981; x=1702840781; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=a+IvpJXzlq3oY8Uk1dyGpU3xVj0Ajk2VmjLB/yY7a2U=;
 b=U3ZBvutLdHryvyf/E/Z+/ZOpEm9xeXy8w5zaTpF1d/FTVvPotz+S2cOOt7++qbcb6U
 8J095UgJkiBaBxvbgREQK3tzY+97rxi0iQfa4df7Du9pzViPGbtbm7GmoYAhbGbE4PPh
 HbgQwe27VjaLfKKJePS8LFpmwF5DtQmJrhpS4MiuMTQH0mW9bQ8kxxniRIiAg6AgHxov
 xylunwYLt4Y5tnUvK+7WGf6mvIYYqnq/TJMmlvw4jCdLiAMG3vIUBYSz0SNhhsJ7oxmc
 tUJ7IruIEjM0U7nu9COj5GriJK0lHwDBcW7K1W2tVVK/yoI6dLkDFNS73HH6YrX/ZJbU
 4z4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U3ZBvutL
Subject: [Buildroot] [PATCH] doc/manual: rsync is not optional
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rsync is used in the infrastructure, mostly for the per-package infra,
and for the override-srcdir mechanism, but also to build the manual.
As such, it is not optional but mandatory, and already listed so.

Drop the reference to rsync from the list of optional packages.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/prerequisite.adoc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
index 48be489f90..262a5153f5 100644
--- a/docs/manual/prerequisite.adoc
+++ b/docs/manual/prerequisite.adoc
@@ -69,7 +69,7 @@ development packages typically have a _-dev_ or _-devel_ suffix.
 In the official tree, most of the package sources are retrieved using
 +wget+ from _ftp_, _http_ or _https_ locations. A few packages are only
 available through a version control system. Moreover, Buildroot is
-capable of downloading sources via other tools, like +rsync+ or +scp+
+capable of downloading sources via other tools, like +git+ or +scp+
 (refer to xref:download-infra[] for more details). If you enable
 packages using any of these methods, you will need to install the
 corresponding tool on the host system:
@@ -78,7 +78,6 @@ corresponding tool on the host system:
 ** +cvs+
 ** +git+
 ** +mercurial+
-** +rsync+
 ** +scp+
 ** +sftp+
 ** +subversion+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
