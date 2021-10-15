Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63287C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:16:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBC7160EE2
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBC7160EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5BA0407FF;
	Fri, 15 Oct 2021 20:16:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id txOuTUmiYlmV; Fri, 15 Oct 2021 20:16:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12551407C5;
	Fri, 15 Oct 2021 20:16:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0B521BF2CC
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD0C1407C5
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dihjs4maNtNX for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 20:15:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD0644078F
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 20:15:58 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u18so28457543wrg.5
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 13:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aWdXeV4kMdW4+LMdtH5tYuBeuVgEGC+stG2/WeUQdqw=;
 b=qI5M82Ge+yR26WNh9Ni5EFOZf6cho33315kQECAkoihSqlCvze1JPYIMPbhENg/tdH
 A3d6uFoJlnvz6xR23M/x6I54HD+3627PHOWGcePi548XVI/NrQatJM6F5iMOyjp1bX/b
 mQtmn/iZun+k97Zg7xwf6ZRwViG57r2vDP0AX7WpKcGnGjPzgNTbrb6HbDjNkGO+4DrI
 5/mI+EbP+tzLHcf/hr4t2TaOertcec8yKnj2q5qDCBLUwAStw1EI+JXbRKYFS9m2EAe8
 tKTDo65wiiTqR9iYeSjT8drCMZZw9+NNK8aEFg/Kk8IfQuol0EHRz4kXCNordhjkhTkc
 yfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aWdXeV4kMdW4+LMdtH5tYuBeuVgEGC+stG2/WeUQdqw=;
 b=lv7yrAbbJtkE+5H3MPw9JWgP2yLI5XIC68hxyve/NRD5fAvLjyzWztfQZcS9RKFQGV
 NBMt7IY59wcHf9jrhffTSlgaIluxzT5k5Gw8AIVi1FitR96F9WQL6N/IIuSDsh5Wwm57
 b3JeFUgahEQfOBYXWbBP2zhJKABbJXFRW1rWH5ewlFBb3dOW89j4pooZseW6EqguwXpz
 XITxhlHHdgpxKz0vy2Alo+gbAugNpmcGw0v6sbqAu0NSCopoSjJPfz89rL/JeSHh1UkR
 VAyQPoEJ8Be8Cyvo6jdp0Cq7/ysm1JZomSF157DXtnesVC04J8aVWxpyMKXXhmPujs/d
 5QXQ==
X-Gm-Message-State: AOAM533KuGaVi2GCM2lEvIb/AJZsD2PI291/DnQojnjXn01Xp3IQC3Dp
 QwCKBeT7xkn9c4wBeNK/PoY9IneeUCI=
X-Google-Smtp-Source: ABdhPJxHYYd5uxz3Qo/g/G6x/2N2mRi5NneUtjAOj9NKfoXAfwvGqCmtsRa2fXk9BIb6J7AgH0R0MQ==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr17223599wrx.137.1634328956764; 
 Fri, 15 Oct 2021 13:15:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id a127sm10853205wme.40.2021.10.15.13.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 13:15:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 22:14:48 +0200
Message-Id: <20211015201448.1651232-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lockfile-progs: bump to version
 0.1.19
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lockfile-progs/lockfile-progs.hash | 6 +++---
 package/lockfile-progs/lockfile-progs.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lockfile-progs/lockfile-progs.hash b/package/lockfile-progs/lockfile-progs.hash
index fc3d4b68bc..bf318350f3 100644
--- a/package/lockfile-progs/lockfile-progs.hash
+++ b/package/lockfile-progs/lockfile-progs.hash
@@ -1,5 +1,5 @@
-# From https://snapshot.debian.org/archive/debian/20180903T205652Z/pool/main/l/lockfile-progs/lockfile-progs_0.1.18.tar.gz
-sha256	a42995a4b97e6188efc90fcc1a761163c4b2cff5c81b936f85c84301ddb05ce6	lockfile-progs_0.1.18.tar.gz
+# From https://snapshot.debian.org/archive/debian/20210903T205304Z/pool/main/l/lockfile-progs/lockfile-progs_0.1.19.dsc
+sha256  2c5704b01c8f474f82921780e4592a927b2bf6a6d7616354a6c5d7cd5664857e  lockfile-progs_0.1.19.tar.gz
 
 # Hash for license file
-sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index d2f8f61188..6045aa713d 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LOCKFILE_PROGS_VERSION = 0.1.18
+LOCKFILE_PROGS_VERSION = 0.1.19
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
-LOCKFILE_PROGS_SITE = http://snapshot.debian.org/archive/debian/20180903T205652Z/pool/main/l/lockfile-progs
+LOCKFILE_PROGS_SITE = http://snapshot.debian.org/archive/debian/20210903T205304Z/pool/main/l/lockfile-progs
 LOCKFILE_PROGS_DEPENDENCIES = liblockfile
 LOCKFILE_PROGS_LICENSE = GPL-2.0
 LOCKFILE_PROGS_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
