Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65547C83F17
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3402A410F3;
	Thu, 10 Jul 2025 20:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nleoHyD3Y9qa; Thu, 10 Jul 2025 20:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A427410B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A427410B5;
	Thu, 10 Jul 2025 20:23:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A4B0B10
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1810C613AD;
 Thu, 10 Jul 2025 20:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HIES88_wdl0; Thu, 10 Jul 2025 20:23:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 87686613EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87686613EB
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87686613EB
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:09 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso1414630f8f.1
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178987; x=1752783787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fmshKD2eUTKGsR5cX656KqxLA/yWK/qzWXbs8t+zzs0=;
 b=o1/cd1N6t/wW4ETSAhsgeAcB5UpCxGlndTeBl1ifFZ8GC3bp1Z4PNSZYc4KMG2AjlV
 HejrHpS4cutsFVNm1E77caFmBNw+W502/KCFP2z+kHvH+mVRvELAZuLKce3BlWA/2g4v
 fx74OIOXXDE8NgDW2JrMGgXCZty1HqAWfbYf6YHDuUEf71Q7JKnsWjWJKslssgCWkxgl
 +G4QMmd/ISv/ERpkwV1n7dpumwXQKSARi82jupc490hK0CtYx/2ZXGTPSDqORkZz8bBS
 YTgqBiQXlcvaud6kFdyHYAOgHGRM7pUQ3+qYldowu8Q7FZ7GgFapyMe6S9Yys6bKVsJA
 rspw==
X-Gm-Message-State: AOJu0YzfTA3aIdQqFqUswuP0noazR/JUNVwo5MIAlpA+YSSIz8bZ1mcM
 co6FvBqkXvOYjm+HeTxwU2MHWYG/uUcBzD7NrIztcIbFyDP/0qCvKs4pO8Jzcw==
X-Gm-Gg: ASbGncuSysq/qwz1i7CkP5enBVKHzZt9HZwn8oTTYrs9j9+qQrwsrtgCnR0Sn/tm3oD
 QafBCjE8EsC+Ks2SUo9m/5tTGG6zM5V/Xrxi02PEY6REI0e2lk9S3pxIxmx5Rhp7HxL60g593rn
 IxTDvan6NfEFeJ2D7L4y3T7i7uhXqavJwmhG3MXbgaWUTSB4VTbEvx7UypryohKOljlCf6hWnPy
 MI7mQ8N9pFVn62I0+jCJLVoWkLg3F/v2pkSuMQIEAgbY/xbSKjSLhkize8TDhq1nKg5EScVjay/
 RBV0DhpNDG+Y1X8yvkwlKOTojUWkqRxLdp5juVS0BiW2veb/oj8Efw1WfzoxTv4/xWfG+8mLVhX
 YhEyqjSU=
X-Google-Smtp-Source: AGHT+IFteZ7x+mP2KkYVrjWsjGelRhSymDzCFTujVww4XxxQu+2O38y+j7b5zr6WGuqvnfv7fSAucg==
X-Received: by 2002:a05:6000:2c0f:b0:3b3:a6c2:1d1b with SMTP id
 ffacd0b85a97d-3b5f2dfd809mr79973f8f.28.1752178987474; 
 Thu, 10 Jul 2025 13:23:07 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:07 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu, 10 Jul 2025 22:22:55 +0200
Message-ID: <8cb77576fb425d315c4e5a1b8624a8954213dff8.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178987; x=1752783787; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fmshKD2eUTKGsR5cX656KqxLA/yWK/qzWXbs8t+zzs0=;
 b=L59czJ8v26Yu0i+fzPD7kZWOaFt9xx5Ms5pDxp8XYhwfe3PTg8kVhbv9jsREKH4rC7
 I3l3Q++wznBNmphYrcLz+tT94Yiaqr1NR8BqdwvDzk3TDshTZi9WvBrs5POdusZC7ADN
 NZZm/RL8SRZHrcrbp0ofx3x8p0S2lrqOkqim0s/3L8H6BX0v4vVquD+Ty/KEVOKjOVHM
 8sWmBdZfdNKZ2FNt3CQADYarUGnkwTEwUX+LjdYrEXOjzbsWk4iSI4As+nbFOE+V+VWI
 rudaz5RRUm6l6Qoy/7hGPiLIQooXBYC25uTDp7pvHmP28RoQW6HSF3prj7eDyTCA6OBh
 YDGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=L59czJ8v
Subject: [Buildroot] [PATCH 13/17 v2] package/coreutils: no need for chroot
 workaround with merged-bin
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/coreutils/coreutils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index a6d193b49e..60772c9e7b 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -125,6 +125,7 @@ define COREUTILS_CREATE_TEST_SYMLINK
 endef
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CREATE_TEST_SYMLINK
 
+ifeq ($(BR2_ROOTFS_MERGED_BIN),)
 # gnu thinks chroot is in bin, debian thinks it's in sbin
 ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
 define COREUTILS_FIX_CHROOT_LOCATION
@@ -137,6 +138,7 @@ define COREUTILS_FIX_CHROOT_LOCATION
 endef
 endif
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_FIX_CHROOT_LOCATION
+endif
 
 # Explicitly install ln and realpath, which we *are* insterested in.
 # A lot of other programs still get installed, however, but disabling
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
