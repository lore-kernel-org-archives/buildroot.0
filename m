Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AA9C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 09:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA1FB41335;
	Fri, 14 Feb 2025 09:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmzGReNZpJXe; Fri, 14 Feb 2025 09:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A666B4131F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A666B4131F;
	Fri, 14 Feb 2025 09:28:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ABE6C2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 09:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4942C4131F
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 09:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWIsCjykAczN for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 09:28:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDFD340DCE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDFD340DCE
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDFD340DCE
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 09:28:18 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab7fa1bc957so339909266b.2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 01:28:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739525296; x=1740130096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+V3cuBLHD0B/ustEY806yKuQz+PUDMpd+DzNw/wHJ3g=;
 b=idvA6u41A5NB4Gps39TIZ8hKc7PKkphRPCF4JBj8msJJdWp9BzHSmyR9Rtqz+zE8pc
 zgRAcAvLiIS1GmvVSIYv+uzXoBF9bbrz2we2mjfv3c8FBonHBOxtABRUN1Q6wBAJqOXj
 sC3SB1foOmfdBwUuEO5tqQld33vcld1QWFkfxIhZ14fsiqpGQN9w6U58aVneC3xoY61g
 RZCeZEh1DVJtZ9yfkpkJG/M0vW9Sx9/NhostNqHx5+1sms3c2NJVlsECKZfglSe69EXX
 0wBClg6Ugjsfd3wd6xMfaE2YO6wsJi455zn0IYon2r4YloUdBGuHdFw+fA0qC+K8NkdQ
 Egjw==
X-Gm-Message-State: AOJu0Yz7TMtIX4yEZRjOV/mqfu9qC9H1wK5729eJIm9S2gf6COSYEl0F
 /PdUC5X+zx/Ohpq0YE7IC/Q/QHy5Vt/t+F6sp8z+1hglSI0c3yVJDUt9gyK6ol9qrmWyvbyBsTT
 h
X-Gm-Gg: ASbGncszXC1kX76ZvA9ir3GazxBr47OTmgcaKOdQg75WYFupNK7eXudbdBkPzZsBazg
 fcpkqUGgDaWLiZHnxWf9CCk7hI3KP6Psm309Ctrnmt1J9xx0Ljbt61D2liTQ4T4T0UseiLXpMkF
 MbUmK9qneSd/aqbZt1qyWVFviI6tmY/PMS2RJRg9cgo15tZTRsgnstZ4bdKXnUqzJ3HqUQ8SbVp
 d5oP8lKnQWkPGNNzpL3cxSfUv2Ns2NlMasuL3k4+n4eOJMsDYoecBNrYAJQ1+4sN49BsrGCli3j
 Djp/4QVGNCjgJVL9fThp35suGf62KsuJ2/6tew7tDLgH8bMwZezjmaEfvuI=
X-Google-Smtp-Source: AGHT+IFA5oxVhsvnA57EBlOaKlEmID7GvG7CTKlqlaGcYI9gCBebdaJOFv7FSRPSqqfs0Q/PhUGvYQ==
X-Received: by 2002:a17:907:2d8e:b0:ab7:c152:a3ca with SMTP id
 a640c23a62f3a-aba4eb8adbdmr548764866b.6.1739525296510; 
 Fri, 14 Feb 2025 01:28:16 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([176.200.207.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5339ddbesm304561366b.152.2025.02.14.01.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 01:28:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 14 Feb 2025 10:28:08 +0100
Message-ID: <20250214092808.2372973-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1739525296; x=1740130096;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+V3cuBLHD0B/ustEY806yKuQz+PUDMpd+DzNw/wHJ3g=;
 b=AbmaWrfE+lFm5iqSW+PFD0PiOBBRIeGvztdV9HWONKLu29TUpV7kXx/2kM4tTzmduW
 sAGLd/RG6s7GqE6p6/GxDtEm0fdynB6ZAG2mWfAdf8wfLL1BN/L5rzYO4qo3zJZWb82F
 WclpcGrv7eqC6G+iO2eqZbVOu9e6A0LFeQuOw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=AbmaWrfE
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 14.2.3
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 19446b589a5b..9ef258e160d4 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  3054c8e63db3abdf1a5c8f9fdb7e6b4ad833f9bcfb58324c0ff86de0784c70e0  armadillo-14.2.2.tar.xz
+sha256  fc70c3089a8d2bb7f2510588597d4b35b4323f6d4be5db5c17c6dba20ab4a9cc  armadillo-14.2.3.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 1798cbf5ed13..14d7738ea3f0 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 14.2.2
+ARMADILLO_VERSION = 14.2.3
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
