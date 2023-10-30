Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD19C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 00:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B69C0402DC;
	Mon, 30 Oct 2023 00:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B69C0402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3msUfmU3Cqxq; Mon, 30 Oct 2023 00:27:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7E5740629;
	Mon, 30 Oct 2023 00:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7E5740629
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AEF6A1BF20B
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 00:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 875AB4F1F9
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 00:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 875AB4F1F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qPpf_Bplzpwg for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 00:27:55 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F6574F1F0
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 00:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F6574F1F0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CC17EB8068F;
 Mon, 30 Oct 2023 00:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6035C433C7;
 Mon, 30 Oct 2023 00:27:49 +0000 (UTC)
From: Damien Le Moal <dlemoal@kernel.org>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Oct 2023 09:27:48 +0900
Message-ID: <20231030002748.280144-1-dlemoal@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1698625670;
 bh=9+cCevgVwwNsAPQkKXl6XQNptsjkPztrqRUNziU1KnA=;
 h=From:To:Cc:Subject:Date:From;
 b=nhKGIvDmnouJsbJos7q8FDhsPp+CNU7q+itf3a62sI7BnYerkpCFqvaqpvlfz2qfD
 cGFi64dQSDCz7v+wTV4PW93sPNhZ65eKaMe/+w7Q+zknezEDVhFB7ckz/aVWKV76im
 XNpLyzvK6fjs+UBX5BB2IPv3RbvI4dqdM20S5U7dAKjmxvKF6QQL80V/yTi4t7MXcZ
 ue6QpTnVFvooynLKVQv82KirKwIqch7sPQ9ZMyG3WXqP9oyOvSMh+lLNgb4W4h8vVi
 1QGquhd8Qe8YkYhz5GxOtkQx5ZlxgEKmY0eOgoQKef64PiXyJDnrIe3HWBTbBM0CJE
 j8UTBrHNtbXLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=nhKGIvDm
Subject: [Buildroot] [PATCH] package/gcc: Fix gcc finale library installation
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When BR2_TOOLCHAIN_HAS_LIBATOMIC is "n", there is no gcc libatomic.so
library to install. For configurations with such settings, compilation
fails as gcc-final.mk unconditionally adds libatomic as an installation
target. This error, for instance, shows for all Canaan K210 riscv
configs, as they all use uclibc flat binary format which disabled
libatomic:

Fix this by modifying package/gcc/gcc-final/gcc-final.mk to add
libatomic to GCC_FINAL_LIBS only for configurations that have
BR2_TOOLCHAIN_HAS_LIBATOMIC set to "y".

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
---
 package/gcc/gcc-final/gcc-final.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index edb9b2f73a..99d7047b5f 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -144,7 +144,11 @@ HOST_GCC_FINAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
 # -cc symlink to the wrapper is not created.
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
-GCC_FINAL_LIBS = libatomic
+GCC_FINAL_LIBS =
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GCC_FINAL_LIBS += libatomic
+endif
 
 ifeq ($(BR2_STATIC_LIBS),)
 GCC_FINAL_LIBS += libgcc_s
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
