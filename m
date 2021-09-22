Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DDEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:45:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 991E86105A
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 991E86105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CCF481A34;
	Wed, 22 Sep 2021 19:45:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wuoo2UHfOCPI; Wed, 22 Sep 2021 19:44:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB3CA818CA;
	Wed, 22 Sep 2021 19:44:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E4911BF321
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38654401FD
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mwVa7VXj2HN2 for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:44:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4FF140121
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:44:55 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id y89so3562479ede.2
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 12:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ihNQiFq7YFJcYwDuMSxbhCxcWpa8xovm/oJaPXpJn5k=;
 b=KMCCiqjPFjqyHougDLhuvCmrwos5Elpv5S5Gsz92J+OLamrOx3QYxf9SnGSKCRJNJ7
 /+Wzi3guq8r9Vdee/7GSopl4VG/tCRoZ1/FI6alYZ8/SB/v1nMahgtDEWpT8Pj9mpjCx
 LJ9fVdye5SfvdszCey8mY7fpPhfvNTluGC69hMxxTFSq+E57G8We49wDkkD/Mhw+gyap
 Gb7/67Ap+fX4uFj2SWWSncfMglJktDMY1XeOUOvFnZdkiFD+2ZZRSsv7SoE9i4ER/LmX
 IwFli7CwC90UXJ6mOLJoJ6kWEaGc1KVhmuWFe3ChEoefDZUt+Ik3MC5EuAs4GiwpleTW
 JbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ihNQiFq7YFJcYwDuMSxbhCxcWpa8xovm/oJaPXpJn5k=;
 b=Kw/kvwhcYBS47+5VnGjPlKAA9a+VBrEWsAK6kmF4e2XXw0Kgd335R6N44xAlrvHwgO
 DRBtlF7wK6CgPPJbO2udg+u2HEG6yBoWooxXGTMXTtmNjLYAJNHstaODtiEiDQaJE2Xu
 eDFluPiRLX9tuQssgnHL0PTVxC3RDrg4fexzpy/alDck5RGsIxi3kVFdP24TALmMzUop
 JN+WkbDeCR3v74vOsXhMwXg4nsRbCbYR1Ok5MltJ3r4RvyoCDOpo9VO3J3aWHFFB4a9u
 S0tlxRDGZBxFkRUv7JcAgDD+fs2n9DTP9AwhwjwL52vjrg0bh8NozEeR3QMwhF88Foq3
 NAZQ==
X-Gm-Message-State: AOAM532ZSlaWQ8KuGM0or5TW7EFw5pLlXG3FlJoAII1wppCNOHf4bC7u
 rCuyXoRXBIHFd7/uaUtX2nuFlnX+mbUr6w==
X-Google-Smtp-Source: ABdhPJxJQyxGgvHhh0IRyzELCiTjsv9Qwq4ABo9W2oj+pfl4AnhepqDLaRHuLuPV/CSjsk8NORcg4g==
X-Received: by 2002:a17:906:7047:: with SMTP id
 r7mr1030153ejj.342.1632339893827; 
 Wed, 22 Sep 2021 12:44:53 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e28sm1694145edc.93.2021.09.22.12.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 12:44:53 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 21:44:46 +0200
Message-Id: <20210922194446.925494-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] utils/diffconfig: use python3 explicitly
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Python 2 is EOL sice 2020 [1], it's still available on distros, but may
not be installed by default (as being replaced by python3). A
compatibility symlink python -> python3 may not be installed either.

Convert the shebang line to the usual /usr/bin/env based line.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/diffconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/diffconfig b/utils/diffconfig
index f1af23cfce..f490c5571f 100755
--- a/utils/diffconfig
+++ b/utils/diffconfig
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 #
 # diffconfig - a tool to compare .config files.
 #
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
