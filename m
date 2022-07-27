Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF473C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 18:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 881EE8250B;
	Wed, 27 Jul 2022 18:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 881EE8250B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WutnesWT1XjM; Wed, 27 Jul 2022 18:49:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9574E8268F;
	Wed, 27 Jul 2022 18:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9574E8268F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB1141BF422
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95C2F400F1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95C2F400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MJUBwNg-SaNr for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 18:48:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99253400D8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99253400D8
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 18:48:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 5C0DA60005;
 Wed, 27 Jul 2022 18:48:56 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed, 27 Jul 2022 20:48:50 +0200
Message-Id: <20220727184850.2857314-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727184850.2857314-1-thomas.petazzoni@bootlin.com>
References: <20220727184850.2857314-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658947736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Egv6/eSyZeoUWZt9K6O+M0ozL3HrVXSJkx7gp32Njic=;
 b=Gs0iiGE8rFQYd9rppW11YMYUsFuQCetzAKgvr2It5Kk8wDYSGTtzJQPKjZBhB+vAtNHiSo
 TBQ7LbIcsPLrXx5i3uMUvUN99zEZSGCsaJ01/ShkwI65cOU4SeSvjLqzPQ9P2mdC+Wxc86
 S/Ek8bez4ZRpQbI/J2XdTtUUpDIehM5fVUwb1eHF5uywbnVH3fcTAiQkq8TmoZSC3zeR13
 yUHPUNc2rXKNhdNY0EYiMns697r1aSS/g/mqPKs3gqnCEGY+4AkYpzce5mLe9GqfcVgn13
 jJJk2cF4ZXQJccE+m87BQ/5747OX3nF6Wo9QOVII02+PGSH5f5GSujt8D8U4Ug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Gs0iiGE8
Subject: [Buildroot] [PATCH 3/3] toolchain/toolchain-wrapper: don't hardcode
 CCACHE_BASEDIR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CCACHE_BASEDIR variable was hardcoded to $(BASE_DIR), and
therefore when moving around the toolchain-wrapper as part of the SDK,
the CCACHE_BASEDIR would still point to the original location of the
Buildroot build.

Instead of doing this, leverage the logic we already have in the
toolchain wrapper, which determines based on the toolchain wrapper
location itself what is the base directory.

So now, toolchain-wrapper.mk is only passing a boolean to
toolchain-wrapper.c, that tells whether the BR2_USE_CCACHE_BASEDIR
option is enabled or not.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-wrapper.c  | 6 +++---
 toolchain/toolchain-wrapper.mk | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 37b24dd24a..bed90d6292 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -538,9 +538,9 @@ int main(int argc, char **argv)
 		return 3;
 	}
 #endif
-#ifdef BR_CCACHE_BASEDIR
-	/* Allow compilercheck to be overridden through the environment */
-	if (setenv("CCACHE_BASEDIR", BR_CCACHE_BASEDIR, 0)) {
+#ifdef BR_USE_CCACHE_BASEDIR
+	/* Allow basedir to be overridden through the environment */
+	if (setenv("CCACHE_BASEDIR", absbasedir, 0)) {
 		perror(__FILE__ ": Failed to set CCACHE_BASEDIR");
 		return 3;
 	}
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index cbf46f15fa..c87120f0f7 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -70,7 +70,7 @@ endif
 endif
 
 ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
-TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
+TOOLCHAIN_WRAPPER_ARGS += -DBR_USE_CCACHE_BASEDIR
 endif
 
 ifeq ($(BR2_PIC_PIE),y)
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
