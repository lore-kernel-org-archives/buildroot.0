Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4D9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 20:17:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEE6C60EE0
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 20:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEE6C60EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59D40402BE;
	Mon, 27 Sep 2021 20:17:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzAaYotXFq2D; Mon, 27 Sep 2021 20:17:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E89940132;
	Mon, 27 Sep 2021 20:17:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F32C1BF239
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 20:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0270480F94
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 20:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rz5aMdAMdbe0 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 20:17:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B386B80F8B
 for <buildroot@busybox.net>; Mon, 27 Sep 2021 20:17:51 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id s21so13986493wra.7
 for <buildroot@busybox.net>; Mon, 27 Sep 2021 13:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6pJKTbAnhldfPEK9evg33LwRIYLDumxg/+nIJa0Qo5o=;
 b=ddSXZHQN/up7hzofVxulhA82OackABUteIxPLWOGn1JiIi5nn1WfwVwKddL3Tx87fa
 2tcAxFkZH+xdo9NnZVVM3AJ+SpdBGLSiuQd7nlXC5G+VMCrZVO0l5o4iGIPjAY53TkNX
 RheMKRyO9a2L3ELliaOAVlm1l5u6fCMdhH6Y6xK+0kmEarRCLkVUXUq+ijhJ5DORaUz8
 WSz+R+rkOnN8saiXMkPQ5o9x11Mi3MkXdQJjfG850wvrfy4A9FZpX75ktLzpQhHB/BCd
 lt09PS3RLtHqUpKTp/d6Ib9fHt1QmFQ4Zw/HfnCVNbmYAJcST9sglHn/HlYrh8k1cdmO
 OhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6pJKTbAnhldfPEK9evg33LwRIYLDumxg/+nIJa0Qo5o=;
 b=UC6MwsOIShwfCuBPMqmwG40BopUYBG5TIc+rc/3ohrn2idpzBLylVQGfhy2wP96HXb
 gbZjtE2TmRGhWKGZsIFkVP5DibuTRp84e6sOKKkG25rlLnmcss00RuuJA2B06FnksAxa
 t4pN2H4IMMTqwZr33iF7w+U/iXFalxiOwxROiXZWVkLHrcBHO4M2fKdr1XiCe+om2sGe
 bPix4JqF3eP0KrZn+AOonWzry7xyKobrk+4YqBIENiu5pCBD+fMql8/vxv5vXuNCCrbR
 YGuaSBZ9xdZEwS2k/O912ferNjOAzXkOKB5nqbbasTfjcW7/rqBdFfrQXKl9YTjhOjpi
 FVvw==
X-Gm-Message-State: AOAM531U1wkfJYjuy7QSHemHOgh/b/0S9PKXCjfkwld6n92K3vBd60MD
 mdkUDs71DFjDldLUc1YXs9vICxQyJeY=
X-Google-Smtp-Source: ABdhPJzCyiwizJ9qFbFst1hRSEf4nkCXriqh+yKlr1nSLjelFvVptw55e8IBABjNq5SdmT5/dgQcfw==
X-Received: by 2002:a5d:658e:: with SMTP id q14mr2074308wru.257.1632773869863; 
 Mon, 27 Sep 2021 13:17:49 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id y7sm15153950wrs.95.2021.09.27.13.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 13:17:49 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 27 Sep 2021 22:17:39 +0200
Message-Id: <20210927201740.122649-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/dash: bump to version 0.5.11.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dash/dash.hash | 4 ++--
 package/dash/dash.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 24cc7318b..1803bcdb2 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,4 +1,4 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.2.tar.gz.sha256sum
-sha256  62b9f1676ba6a7e8eaec541a39ea037b325253240d1f378c72360baa1cbcbc2a  dash-0.5.11.3.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.5.tar.gz.sha512sum
+sha512  5387e213820eeb44d812bb4697543023fd4662b51a9ffd52a702810fed8b28d23fbe35a7f371e6686107de9f81902eff109458964b4622f4c5412d60190a66bf  dash-0.5.11.5.tar.gz
 # Locally calculated
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 1712dcf59..fed3a9955 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.11.3
+DASH_VERSION = 0.5.11.5
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
