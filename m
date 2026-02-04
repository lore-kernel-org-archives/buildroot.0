Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26755EA7940
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 19:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6C4E81359;
	Wed,  4 Feb 2026 19:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpTG60VYACrE; Wed,  4 Feb 2026 19:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E1E6821BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770233530;
	bh=AoZTcWT9g4aECYD8s47XQnekQS1dtVohAqt6Mgun/Kw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=B+HOFpN92fso4ctSk6cVbSfXZqnooSrNUFqcgbYm47aEBD2S3dEQUTgPVMc575bDN
	 6pCeoStSflpDC1kulWPT+kXKagtUVKr4IzvjzVkJ/19BdVHrdKpS50V7fPTjGy/HF3
	 hRqzUd5JzJnl0nmKzeUJxu3r+v2EpBC7smnPYTiuPCWRTLB5Rqbp9JaC3aLXsOsGJr
	 89JwJ0L+Bq7Nnw7mbLh+WNx1bmkMJWx3ZkoMnW/BHgaygNVy1kmJzxxDuQmB93dKhk
	 93WwrUQ6BzHaYNGxojKsG9aeJU7kBfZV+llFCdu7om1pLuRXs6yymjDWIant7eJ+YR
	 wDISswu1k5D8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E1E6821BA;
	Wed,  4 Feb 2026 19:32:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0634017A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF4D7409EA
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SATub853RTyH for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 19:32:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E90EE40791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E90EE40791
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E90EE40791
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:32:06 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-385c2f88618so1709711fa.2
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 11:32:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770233525; x=1770838325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JwiQtuIX7S8iF6W8+/lm+in5lPmEBpVQIKyXe79ZfA4=;
 b=B6y/mcOENmAIKmeosD9IAn4phNL/jQImz3ZFL6dpwrQXLs14K0Ks6oXiRDAbhAKvhU
 PLYGyHsZfz7laXK7g4MIq330sxChtMP7GXvTEuMFpU5TrIUkcmugd9IbdSMVCGWBQ8qj
 odMF/WM+5UBL20D6bz8VW6X3SUt13Dth6zgmRdXuEK9L9ZiM6lYWRuvmTosIDkpz/oFQ
 T3AFN9bKtaYS9Jmo/wcD6P2IPtL6J13DgJOhG2mAgqGGp319IsK4JJkR5cbpyVBpZlLL
 pEc2rZ0TKYkl2BHArvhdd4TAqOso9Pqeh1sIcu07t/yO4SGenlWJHZUEYD0TvmeXMS6m
 tINg==
X-Gm-Message-State: AOJu0YyyCT3suqdxNC9NcV0Zo24RvMiPqkrmbP4UVkd8XRdO3lOkvKPe
 3QTpW+ZgLsLKVrHLDDyyVKLW1w2mkZfn2c/9iucs/VxqHlCqVxIpQcCW5l2CLPHExuMsXvdCi/H
 dJVKLSPg=
X-Gm-Gg: AZuq6aInQt06ECPAN0rJXJwGYgpX/glQRCDH5fNhUPWpCDLiqDwOKvmWlbXSZjDiwWf
 U8sR/I3Ut9DHXkuRY6JLWn2S3BP03a7fdI7g4CDEAl7ZKjXNNgEWWnv3AFshjGfRfLbSS8SrgAs
 b47dKA6yVuY9O9pPD4ggdULvnRSPe5v8lL7XPX08iJWUH1BNrf5n4LGslNnuPqOQY19mNncCDgE
 W+nfVXU/IZ6csUYSrlpCM3zccyMbfa8UYCo/hUD4y1CTCl5qbRSvdWkdWWUX5jb+Yz2Df2iS88e
 uRhlPdfCVZd+FYkUHfU/ixEAzUQmgdmku7658MouQ7G62RUZPCmAxenbzkDBJFjXiULaST9OIIK
 euqb7CV8Orhip6B+UNvoOGJZjcZndygEvbNKWwOBjZnbDjTzeInM2XS9sjxe6rHnD4tTh4Jg6Cn
 kawB7tV1egio3xAVUQxxl1kGhvaos1ku5CFbk4P2S3fVmc1lLqmmvixERpvfloGwuDXTPylpomf
 yqxMg==
X-Received: by 2002:a05:600c:8b88:b0:480:4a90:1b00 with SMTP id
 5b1f17b1804b1-4830e96d623mr45022485e9.20.1770226436861; 
 Wed, 04 Feb 2026 09:33:56 -0800 (PST)
Received: from P-NTS-Evian
 (2a02-8440-9501-c6d4-0a70-6c91-93ab-53a1.rev.sfr.net.
 [2a02:8440:9501:c6d4:a70:6c91:93ab:53a1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805edcfsm7535429f8f.35.2026.02.04.09.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 09:33:56 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Wed,  4 Feb 2026 18:33:49 +0100
Message-ID: <20260204173349.315559-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770233525; x=1770838325; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JwiQtuIX7S8iF6W8+/lm+in5lPmEBpVQIKyXe79ZfA4=;
 b=ftQgj/RTffnUNQZsn7BEweqyqQVW250hMPN6C+XvVIpWMTRhWCAa/1FcBObLEdhROF
 19nvw8cEibaIKDM6WqsRd2uJjO39Kc2RcQz8UI1o0MJzAGMmKRO4YI80aAKalfsL35of
 zbrlD1dfKVd7N/RmkYCjrnkY1WzDNCWkExtck=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ftQgj/RT
Subject: [Buildroot] [PATCH] Revert "package/pkg-cmake.mk: add
 Platform/Buildroot-Initialize.cmake"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit [1] some cmake packages fail to build when cmake from the
host is used.

>>> openjpeg 2.5.4 Configuring

CMake Error at [...]/host/share/buildroot/Platform/Buildroot-Initialize.cmake:1 (include):
  include could not find requested file:

    Platform/Linux-Initialize
Call Stack (most recent call first):
  /usr/share/cmake-3.25/Modules/CMakeSystemSpecificInitialize.cmake:21 (include)
  CMakeLists.txt:20 (project)

This reverts commit [1] ef9f0a07ed40970a7de4c608a5708ef6ceb75131 for
the time being.

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/pkg-cmake.mk                    | 2 --
 support/misc/Buildroot-Initialize.cmake | 1 -
 2 files changed, 3 deletions(-)
 delete mode 100644 support/misc/Buildroot-Initialize.cmake

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index f572bdebb3..ba287d244a 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -287,8 +287,6 @@ define TOOLCHAIN_CMAKE_INSTALL_FILES
 		> $(HOST_DIR)/share/buildroot/toolchainfile.cmake
 	$(Q)$(INSTALL) -D -m 0644 support/misc/Buildroot.cmake \
 		$(HOST_DIR)/share/buildroot/Platform/Buildroot.cmake
-	$(Q)$(INSTALL) -D -m 0644 support/misc/Buildroot-Initialize.cmake \
-		$(HOST_DIR)/share/buildroot/Platform/Buildroot-Initialize.cmake
 endef
 
 TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_CMAKE_INSTALL_FILES
diff --git a/support/misc/Buildroot-Initialize.cmake b/support/misc/Buildroot-Initialize.cmake
deleted file mode 100644
index 3451562f08..0000000000
--- a/support/misc/Buildroot-Initialize.cmake
+++ /dev/null
@@ -1 +0,0 @@
-include(Platform/Linux-Initialize)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
