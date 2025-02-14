Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B604FC021A6
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 18:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CCA3849D4;
	Fri, 14 Feb 2025 18:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44yzmvIZTKOI; Fri, 14 Feb 2025 18:07:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A5EE849E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A5EE849E8;
	Fri, 14 Feb 2025 18:07:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C74C1E7
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B06340359
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gi_AWOE79X2M for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 18:07:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B484A4056A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B484A4056A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B484A4056A
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:07:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07bc.dip0.t-ipconnect.de [91.58.7.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 766D1A4C4BAA;
 Fri, 14 Feb 2025 19:07:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33662)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tj05z-000000004sZ-3SlG;
 Fri, 14 Feb 2025 18:07:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Daniel Lang <dalang@gmx.at>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Fri, 14 Feb 2025 19:07:19 +0100
Message-Id: <20250214180723.37419-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1739556444;
 bh=fUzo7Rwa3McL58jeJVDfFTn2GrhvhaVq+bN6vyWpkK8=;
 h=From:To:Cc:Subject:Date:From;
 b=MTKrNNIDe4CC8TlefFQn3qNlk90UazarpyD4Xk8YVX500u2SOw49XVP6wfIu5h92y
 EyjFHRg+CMFEBo0y9qEsWHJLZp+SZe18aV9Q5xh6rwYX0z3vnoHYLBVRLzKCStZ6RF
 HzwpNgQYLQmOf8anT1UYHtPTDYghvOqG/A6X+UMbB12KXr+hqDVp0wIfm0T3duKthE
 C4ykeS4QOipElM4oUW5457GezipfcwwkYWd1Hren5ji7eR84kEUTgzA+U9v1pyFqi8
 pJ6nVm0GCFA+x26Ai9KJv92rc+vaHgoThii7s+uIGVpnmsgbfL5NKioYax6owZ1ejr
 dWJCEeKPYEAIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=MTKrNNID
Subject: [Buildroot] [PATCH v2 1/5] package/libdrm: add host variant
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

host-libdrm is needed by host-mesa3d (introduced by this patch series),
which is needed by (target) mesa3d, when enabling the Gallium Iris
driver since version 24.1.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Clarified why host variant is needed (Julien)

 package/libdrm/libdrm.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 9d463ca01e..a8a912859e 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -116,4 +116,25 @@ else
 LIBDRM_CONF_OPTS += -Dtests=false
 endif
 
+HOST_LIBDRM_CONF_OPTS = \
+	-Damdgpu=disabled \
+	-Dcairo-tests=disabled \
+	-Detnaviv=disabled \
+	-Dexynos=disabled \
+	-Dfreedreno=disabled \
+	-Dfreedreno-kgsl=false \
+	-Dinstall-test-programs=false \
+	-Dintel=disabled \
+	-Dman-pages=disabled \
+	-Dnouveau=disabled \
+	-Domap=disabled \
+	-Dradeon=disabled \
+	-Dtegra=disabled \
+	-Dvc4=disabled \
+	-Dvmwgfx=disabled \
+	-Dtests=false \
+	-Dudev=false \
+	-Dvalgrind=disabled
+
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
