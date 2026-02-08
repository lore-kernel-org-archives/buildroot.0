Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568DBEF06E4
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 20:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAC57606EE;
	Sun,  8 Feb 2026 20:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAkwTaxJWhbL; Sun,  8 Feb 2026 20:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C402E607D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770580943;
	bh=cLeu/KiwMEnM4P1/O1RcjpxLmcRAnUjteMR6XUA5wBM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oIDeEkBS0OkGZRIlElfbVr54lHjCbdNyN97HQRahH4FmpSszoxXOiKbVHx+pBiEFY
	 9RJohpxVplJMVbsCAmAE1KiqoaKktWZd2RW6FQDEQm4OOd80EBEzblVlx3krX5CqD2
	 WvkJGo1Ygpr9H41xaAh97Vo5R62PypEfvJGNT4X7hr8ivjafYX/zdYoQfzjTnkDaql
	 dlwCxlkTX4drHmWF0l6TGSOVDMQBaaEc1jgJAHfVnaRUHgJHd6K/JZwRJzcnkh4IYV
	 IWEI/Lx7wHXQZcsb4zqly2wYuydVWSG+Vz7w9bv7gdkB5CVbkqX01+hI0sKDSHalDS
	 hMSByIDb+Zp0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C402E607D2;
	Sun,  8 Feb 2026 20:02:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF6BF219
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 20:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1AA2400C7
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 20:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmTylMS_gAR3 for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 20:02:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.46;
 helo=mail-ej1-f46.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 819F44041B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 819F44041B
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 819F44041B
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 20:02:21 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8eafb515aeso433954966b.1
 for <buildroot@buildroot.org>; Sun, 08 Feb 2026 12:02:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770580939; x=1771185739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/kjeQLz8XIvxEHcFcKxvMznM+Xc63M2mvxK8qFOHAM=;
 b=f/I11Blru5DaT1RADbdRh8ltSu2KVQMo+OWm+zcfVyQhh1yBoKBELBxtoYqfDPhG1X
 MRwprz2Sig+2kfM9/6pwWuO8SyjinoYv8G1UlLcOLIu7eY34oVY69PHP889xVnn5mfTM
 QTPiLNcnaQYVQSLfusF3R1IcmtZyjgo9hrs+kdw5lcdmSjWE4lvytjIchJXy7yDXG4EO
 OzxeBaHe+kVUs07WGsUSrN+VMESZVf0aGJ6bOBP9mEBpiNI6IiC6Zibkqg7SyVonTb3i
 uzy9CDQ8cpB89Kgziyw6yzvvN8hT4vICoz6Xyy7OYhkmKZSeYrk1/XKbxmTc3FkwAwDe
 w7wA==
X-Gm-Message-State: AOJu0YwPWaEWFNXz1UXB4qVKw1xC/VyhKYIU6Hs73EY9DXIh0G4RnMd7
 deXyHgAbUuH9mjjtojBR2wl5M5lfDPQIQlONgH2Ro1tWy+IjJMexiyV2wuFXHQ==
X-Gm-Gg: AZuq6aKNBSl7CHdk7KuHqmxwAdSErCBPJDRlDVuAoDtWLSWeU/7DuXM2rrbhx1Det+c
 TFuZWqFt2D3msDPN5pw0JZ46LD+Id7XbUWRJlnakUgOxOWlP8PrLDVQFGbYzKVoCnjN/IN6Nzwl
 f/cGJwFMcatqUxpC9vQ8AqF8b0XNsN1eoMAdxD93pblPYXSwrEl52TsXSr/sEXMtOm95lMuyUxJ
 HMLtg7RLhaHUmir3YUM7ELvVQ/bUmrc7vGY0K8y/xA4Y1ROQZ3UCWMh8VRyrL3pq3GbLkCfI6Vv
 Segq76hgkYPfVV2D5sA/+BN8qo68DSj/E21Do9JdogeVX9YdvTkbh34jRbMZ1YVpiI7t0APl4be
 2EPnEW7ugyiTf51AZyUWAExdvKo0Dd745wmhsLAx3ESYBp/FhJglAVr+wwTvwTxFHCzt5Luo3CR
 DCV6JDqndesrq9SGUBENN6EeR7l2AXjYWoy53T4g4n8l7pHZswQjOOoPoRbcOW
X-Received: by 2002:a17:907:7b9e:b0:b87:28f7:d3b6 with SMTP id
 a640c23a62f3a-b8edf1ea7aemr468371966b.19.1770580938777; 
 Sun, 08 Feb 2026 12:02:18 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb5f:fa00:d99b:3dbe:7b93:9245])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b8edae5a288sm313043166b.64.2026.02.08.12.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 12:02:18 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sun,  8 Feb 2026 21:02:16 +0100
Message-ID: <20260208200216.3008154-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/yq: disable CGO to fix
 cross-compilation failures
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

runtime.cgo_yield: relocation target _cgo_yield not defined
net._cgo_77133bf98b3a_C2func_getaddrinfo: relocation target _cgo_77133bf98b3a_C2func_getaddrinfo not defined
net._cgo_77133bf98b3a_Cfunc_freeaddrinfo: relocation target _cgo_77133bf98b3a_Cfunc_freeaddrinfo not defined
net._cgo_77133bf98b3a_Cfunc_gai_strerror: relocation target _cgo_77133bf98b3a_Cfunc_gai_strerror not defined
/home/thomas/Documents/external/buildroot/output/host/lib/go/pkg/tool/linux_amd64/link: too many errors

The errors occur because yq doesn't actually require CGO - it's a pure Go
application with no C dependencies. However, the Go toolchain was attempting
to use CGO during cross-compilation, leading to unresolved symbols.

So disable CGO, which is confirmed by upstream's build configuration that
explicitly sets CGO_ENABLED=0 in their .goreleaser.yaml:

https://github.com/mikefarah/yq/blob/v4.49.2/.goreleaser.yaml#L14

Fixes:
 - https://autobuild.buildroot.org/results/52ec88fdcfea00f32a4dffea5cebb901ecdbd1ad

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/yq/yq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/yq/yq.mk b/package/yq/yq.mk
index 10d09597916..5aa8133aad2 100644
--- a/package/yq/yq.mk
+++ b/package/yq/yq.mk
@@ -9,5 +9,6 @@ YQ_SITE = $(call github,mikefarah,yq,v$(YQ_VERSION))
 YQ_LICENSE = MIT
 YQ_LICENSE_FILES = LICENSE
 YQ_GOMOD = github.com/mikefarah/yq/v4
+YQ_GO_ENV = CGO_ENABLED=0
 
 $(eval $(golang-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
