Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E16CC5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 12:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9B1940ACD;
	Fri,  7 Aug 2026 12:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81GuvHEI00Zb; Fri,  7 Aug 2026 12:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28C1E40AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786107333;
	bh=vrWwLmtcEiAZbFZyjoAJ900ORRY9YIZCjpCMMAL62Ag=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sySKeTfyytbgNwRxOm/X277FzTSDCQMxdI64Q0SifZWyoJvdez8N7c5RE+ZKcC/Y1
	 zcRygxlAx6n7cQLqvGtAtAb552MZRNkRtnpU7DrgCgOrgm/r5pKejph3IS5qDn6umx
	 eyD5DW5cNwcO/7UCwzfHL353jUZgyJct9qLxhBJm05Hs1PqOknBJX/ehB+Y045mBAw
	 Xl6CzfEmyCvqwJ7TLbkLLKqjti3EI5Q/Nz4ti755q8eghiK0+Xk0ACtSIqyTmOAvx7
	 5bvXfzAiW2of+q9awqkDklH3o+624hQgZCL4jwqaJRB3f5ZDQt4sAr72s0IIwxM7oP
	 FswYewq2nmvdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28C1E40AC6;
	Fri,  7 Aug 2026 12:55:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 255A5392
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17FC140270
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYhJhQoXYMQj for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 12:55:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F03FB400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F03FB400FE
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F03FB400FE
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:22 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c1676497000so35465066b.3
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 05:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786107321; x=1786712121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UVQvaHWAvsv62X23ELw9Nt0lKiXfyHFCt1tdwu9F0Wc=;
 b=lsNA+TK4tMw1VgpsNcSSGl0WRL2ViEihEwMlJ5tcrSGP7aZNc8m+NEbgRxn+vlu6qK
 K0D1NNu+xcuXSXR6HHZ6aU0j85rbSeLxgenQ+l+M/hD1+JOD+S46PS4TyZtCW5OS7L2D
 kvgQMlakfzsfpmqO79B6/LjhHLfykoZ/PMIzZPMNR1nHtaMP7iLYZSFiWdbVkZdZlvnw
 26FiQ4AwJz3ccFbzXcKMr85nq+tGAhLb3SXa9aO87Hx0dwoPFkzHo7W7U2AdAWQTEb2c
 FtIMSIOJKq6bIzFkL7tpoOXy8qsDy9Ek8NSNyf6vSryo+l4cy8+kXWFtUQZbRlQC3C5l
 VUUw==
X-Gm-Message-State: AOJu0YwwhOx4oqFCaHu8Tt5UmaGink6n/gT9u73dMdrnzZ5qVF1s2FKd
 4z3SuGG0fB84szdAJY+Ii4nqr9y1+nnC5Mxbzzj1U8gUlTZSixfJBdhNfWZVqFNKoenpYnCwItw
 +WGdKff8=
X-Gm-Gg: AR+sD13g6hw9dbBIkw+YFdUmRm1kjiAMN+BVQ9otZ1TBWDlRKJRDuCorPka33DYt9Uk
 1UkKhwsf5WK1Gg9Ke/KWfVqRVflLR8egqJ1lVRWkblhqmRoclgFX/+03z3zXYGjuHfoAin+G4+s
 Z9QS3JCDAr/6XxIz/6/TANqPYS7vaU1L17/l+MP2WXVS0vG3c3wzSq1DI/MGzoj1QHObJRwyNgG
 3gQh+03whla3LdSRrqNdek5LvlnKbyIXNkoxs0V7H1MlhM/eVXmNyGGQ6m6pULv5hP9Tn47XOpY
 1RAblJUhFB/xAt7B3mgBZsCQF0IkymVtG9lfsPGVP6h3JpP06tHTUVNwOFGuNp0gCVX+ErNg4sa
 5u24b2S00k4L1rfZPlbXREwawjBG3eoyS2yjajzMjQKmzhAJSdEjw2u6QlSM11CWddlewfeJf0/
 z7jLsKiIUtZW3+lXZtQjQUpEiskFL28i9re2+wHanUCM47ce/I6uDQsGevE9xPYEubmXCcGkvTU
 atNweks3aGVmGWYqefKDeZOupPTin3TdEqgDOlEAC4M4wYvvYOrXxA62ulRFgvf/V5FuM10RgXT
 MDpPeSvI5Mrvzshz3H6e/dN5Wq3AWY91b/WJ4DGYIdoeldLS/HZkvkLQCnBbCHXg
X-Received: by 2002:a17:907:e008:20b0:c20:7897:bc67 with SMTP id
 a640c23a62f3a-c207897f8f8mr113371066b.3.1786107320956; 
 Fri, 07 Aug 2026 05:55:20 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2080a29a8fsm49539866b.4.2026.08.07.05.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 05:55:20 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri,  7 Aug 2026 14:55:10 +0200
Message-ID: <20260807125510.1285300-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
References: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1786107321; x=1786712121;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UVQvaHWAvsv62X23ELw9Nt0lKiXfyHFCt1tdwu9F0Wc=;
 b=EFroBaDRdohHQgurT65xqGLfAmh4tobysMIttVRT49Z9PnND+2TuJuC4WdPNEwxDZH
 Heu0Mf1r7LxWNwFvCOaLeMmPuvWtvCxsp3WjrUIsJunqDM/QG+nhyRVIHU19nAk7Yu+X
 lehdpEpho6BpP+DNOQxQarTanVzGOeTYnHcvU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=EFroBaDR
Subject: [Buildroot] [PATCH 11/11] test_mender/post-build.sh: use
 /etc/mender/device_type
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

To keep parody with board/mender/x86_64/overlay/etc/mender/mender.conf,
change /var/lib/mender/device_type to /etc/mender/device_type and
add a /etc/mender/mender.conf file.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../testing/tests/package/test_mender/post-build.sh   |  3 +--
 .../test_mender/rootfs-overlay/etc/mender/mender.conf | 11 +++++++++++
 2 files changed, 12 insertions(+), 2 deletions(-)
 create mode 100644 support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf

diff --git a/support/testing/tests/package/test_mender/post-build.sh b/support/testing/tests/package/test_mender/post-build.sh
index db075628e0..f27b0f9417 100755
--- a/support/testing/tests/package/test_mender/post-build.sh
+++ b/support/testing/tests/package/test_mender/post-build.sh
@@ -21,8 +21,7 @@ generate_mender_bootstrap_artifact() {
 function mender_fixup() {
   rm -rf "${TARGET_DIR}"/var/lib/mender
   mkdir -p "${TARGET_DIR}"/var/lib/mender
-  echo "device_type=${COMPATIBLE_TYPE}" > "${TARGET_DIR}"/var/lib/mender/device_type
-
+  echo "device_type=${COMPATIBLE_TYPE}" > "${TARGET_DIR}"/etc/mender/device_type
 }
 
 mender_fixup
diff --git a/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf
new file mode 100644
index 0000000000..5f423fb2cb
--- /dev/null
+++ b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf
@@ -0,0 +1,11 @@
+{
+  "InventoryPollIntervalSeconds": 1800,
+  "UpdatePollIntervalSeconds": 1800,
+  "RetryPollIntervalSeconds": 300,
+  "RootfsPartA": "/dev/vda2",
+  "RootfsPartB": "/dev/vda3",
+  "ServerCertificate": "/etc/mender/server.crt",
+  "ServerURL": "https://docker.mender.io",
+  "TenantToken": "dummy",
+  "DeviceTypeFile": "/etc/mender/device_type"
+}
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
