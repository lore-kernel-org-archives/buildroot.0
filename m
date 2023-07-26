Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E2FC04A6A
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 20:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A56EA40C53;
	Wed, 26 Jul 2023 20:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A56EA40C53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeBC2HgsEXwN; Wed, 26 Jul 2023 20:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4FF24151A;
	Wed, 26 Jul 2023 20:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4FF24151A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68C9B1BF40D
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4043741E4B
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4043741E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xp6Vx_QsxeG0 for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 20:28:44 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4CB641E4D
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 20:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4CB641E4D
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-55c993e26ffso117260a12.0
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 13:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690403323; x=1691008123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tkcxP7MaPUJjS4DYUOwXwiSVQKjBzMdGw8oFrTtywY8=;
 b=FUt3uFwx1Y9Q00cR7MvJD1L3aiKkb4T82nCLszIiX9R/Zyz+soysFt0k8c4mUp4n/y
 vXPyprDljoqQhukLtnKbe2da06XSLTRGX9BJ5xuQ23eCt/NknOAsChbL68mM5Z+XC7Va
 iQslp/RPLFG9VWmzGGJkcf67NH/6FdRpEMu1yndttSrReXhuOTTWC9d93K109uygdTDZ
 lzrsHPSrkZILoLLYsXrRV5Fnn9bSJL+Wdm0lDVfigDL1PMJVIrvEeaMh6NN/sMjIOPYh
 UQMPJCQRFUrtHbBFwsTIDxXvAfX6lqgLYt6615s+tmc4z44CNe8N048VzOrJjEUViED9
 7Dow==
X-Gm-Message-State: ABy/qLbPQhAZHiZmHxtpqraomwD5f4IkA42LLl+MPxSWRVlSyOhEOYUU
 GuaJytIFxB++74KiCTwRjWhMdZhITDWwvju6WD7Czw==
X-Google-Smtp-Source: APBJJlFLCYvC8dZVcV6I8aWKfTjUS5QylgpWbTD7ToerdnEhDOXWbF+eAoivqHS5PGU0sea5CHy32g==
X-Received: by 2002:a17:90a:898a:b0:267:f141:9100 with SMTP id
 v10-20020a17090a898a00b00267f1419100mr2524414pjn.45.1690403323029; 
 Wed, 26 Jul 2023 13:28:43 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 v20-20020a17090a899400b00260a5ecd273sm29600pjn.1.2023.07.26.13.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 13:28:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 13:28:37 -0700
Message-ID: <20230726202838.1931660-2-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726202838.1931660-1-christian@aperture.us>
References: <20230726202838.1931660-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690403323; x=1691008123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tkcxP7MaPUJjS4DYUOwXwiSVQKjBzMdGw8oFrTtywY8=;
 b=V8PTACHQzF6PcC527MgwEgh3tPjzLwjSIm0o1TA6caRTcx/kKl0rSG3Kg33VsSTQsx
 2HUEL4BZnfU1TdF0gYqYBGuaduNuKsMN3kvoJ/ypXHJ19qi528/kKgcoORcw5/BI+GhP
 9kn5q+YHhvw3PLBK8U1guh1LzBdWNT+j+ADxRSdfQUvA6cy9JxS2Ln/3aaCaVulYn/ma
 TDU7azHcrbP3hbYzowdVVodDcXetnNNVluV6iPhDn8siG0Tr0bc0UUlsij+Scma7KN8g
 BHPyi9bZqZ6Icv00dXU5YjUKrXt0KES3bwsxFpM6XXaM1Ub/xYjHO2sRdFNwi3lKDsVF
 3Cfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=V8PTACHQ
Subject: [Buildroot] [PATCH v1 2/3] package/python-pylibfdt: add host python
 package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/python-pylibfdt/python-pylibfdt.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
index 5511bd12b3..8850b69b30 100644
--- a/package/python-pylibfdt/python-pylibfdt.mk
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -12,4 +12,7 @@ PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
 PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
 
+HOST_PYTHON_PYLIBFDT_DEPENDENCIES = $(PYTHON_PYLIBFDT_DEPENDENCIES)
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
