Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5910DCD6E7B
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 22:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FE9261131;
	Fri,  5 Jun 2026 22:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TllyteBr0tqm; Fri,  5 Jun 2026 22:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F177E6137B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780699377;
	bh=Z+pycdBNe+Cn8l/unDu0PEa89/fadoxD2MVIRCocOgA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=WjInPKBmVDsYY6VSgPpojRPSvNWkyINo6agN8548nWDBabeqGsPIwZdLsyyYTuJnS
	 GvFFIS9zWti+Pqj0heSq5IKRgx2/NFh0egmwsMMAoyIyJBy4xLKFxRt2oSg+J+OqDG
	 Y9lG1UkbNGoCQUgvyUv/FKuQ4TKiKcMyTR5YYETU11B7IWNHSDrTVV8DDW0BSJAmQv
	 Lk/jC5u1GFUvDHIunckj9tOR+aGb5zh13KNvhUqe1A0KqgjW9eZHdnAV8CMb0SwJJr
	 /HadkbJ3ymOi5/PsbQKbVi/9DHEwyTo7dwFc1kqlj/fTUSPOUVmfdbJzC+R+pqX5EU
	 oEKJ0C7/qkjTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F177E6137B;
	Fri,  5 Jun 2026 22:42:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 686E0187
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 22:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51EAF405E1
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 22:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kevDD51pr2c8 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 22:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5856540082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5856540082
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5856540082
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 22:42:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso23458305e9.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 15:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780699372; x=1781304172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5/fJONsnixwmphSpjhbVUNOkH6B3zE1hBN1ImFDIT5o=;
 b=fMRXS+9MHAXOxowwWfFhrfohpdo1DfGcGbWKJnTE80CUaZy1eoxbXV/S6wMse2qdM2
 kKYazgKwHFoexpLzUDgxFgseB2v6q8FcPsE1HE5I5WdpFYCjbmHm6IMjRHm/nJ6uwDGh
 VZWK5OOYDbjSIy9PDjF/T1XINJS54rkSJcUZ5RE7qbkWrgvoG5xl8hKr5KLPDf4ZTgg+
 qTpespQq5nuQaBvI6TS5Qzi7wD7Z1jwRBjTpdhlo9BdQrpwEViBpygpQ7DASfyEZlb1F
 GlwmScBmFN7MN1fGgjXl3oiGMCFG3vsWXaSIe6xg1GVP48LGfLuG6YsX2FRfUfQN0e1o
 2eXA==
X-Gm-Message-State: AOJu0YzyEulOWgQ+qbnw0iIjkgfzUHtKru8/DUWFWx6Lig4Il/oL+nZI
 5ybqzWTF+3x/q5CuZ2U9sh1ga9Gy3/pRo/m5Vqz4L1dCFcadSar6XlhcvDH+uMxhGnk2IpZFwUk
 Cmz+R
X-Gm-Gg: Acq92OHQsTjz7WqMNzJtAhk39c4ZEXaTUS9aK2Bx88xW8ltSuaK5mEGtSUAAg92JXD4
 J3iy5u6vxpbii+X0+Mrp3xaCcUggqOsLl55zEBWhwT6327AdA5t6xPG6nMt4mDlI+am06PG1ELE
 fTV3zEudpaRSQnbmU9Bm2125LNVgkaimwY+4RtdipouFDvRTnuCsTZYDgot4/tNTyyL1jGYOIqY
 +CjV1ZF/oD3Ram9K4CmGeBKx7699mGZ2MyQj4QO/NzGd88S/j0uuKEl5ZsO8zoW8V1bO4nBqiml
 lbuGhPjv2OaOzzD4rnVq4Gp4SDtXCTwXRG3vHhH6fBqztEOnUP1+Gls6Tsv0gtYatQY5t6pB6Qx
 6fOM7pLPFnOQO3mDYHwkiYA9vLJWa1kQZEy9f+c00u0NcbirHSrZqcYoXWrhOSbioCBtyyNBoZL
 SCJslRKulqOoBgaCdgr1Ynf9d0NJCH/Wy4DF9l5wRkJpJF01dkDrDMCUo/CKjlIDiQc4zMFXOt+
 dxg1s6/HQb5lSKhtZilUMrcmR2u/AaJ2Lih
X-Received: by 2002:a05:600c:4506:b0:490:4973:91a0 with SMTP id
 5b1f17b1804b1-490c25c0bd7mr96832515e9.10.1780699372051; 
 Fri, 05 Jun 2026 15:42:52 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f0a43e9sm29380248f8f.0.2026.06.05.15.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 15:42:51 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat,  6 Jun 2026 00:42:49 +0200
Message-ID: <20260605224249.2590975-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780699372; x=1781304172; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5/fJONsnixwmphSpjhbVUNOkH6B3zE1hBN1ImFDIT5o=;
 b=pLg1Phup3s0hYBWdEzDX+d54M1FAxufXHPSMd4q/tqEGGoav1w027Q5zvYR3TdCAk2
 /vVed19sG90wW/AFzNyvhXlfK5YpXwfz6wvkULHuNYagXwmSkH2dQmcDW9cMFcUwWBIB
 jMh9Qt0ZiOgkMWLwTayFM2VN6C59effsywDys=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=pLg1Phup
Subject: [Buildroot] [PATCH] package/runc: needs user namespace support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the runc security bump to version 1.3.5 [1], the TestOci fail due
to missing user namespace support in the kernel:

  proc/self/setgroups: no such file or directory

Like for the docker-engine package, a script check-config.sh is
provided to check any missing kernel support.

  Generally Necessary:
  - cgroup hierarchy: properly mounted [/sys/fs/cgroup]
  - CONFIG_NAMESPACES: enabled
  - CONFIG_NET_NS: missing
  - CONFIG_PID_NS: enabled
  - CONFIG_IPC_NS: enabled
  - CONFIG_UTS_NS: enabled

At least make sure that CONFIG_USER_NS is enabled for TestOci.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14696525946 (TestOci)

[1] e013e2df84fb36985261d7b3c6e6af06afd40f93

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 10ff98c9d7..94c7a3088e 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -26,5 +26,10 @@ endif
 HOST_RUNC_LDFLAGS = $(RUNC_LDFLAGS)
 HOST_RUNC_TAGS = cgo static_build
 
+# based on script/check-config.sh
+define RUNC_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)
+endef
+
 $(eval $(golang-package))
 $(eval $(host-golang-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
