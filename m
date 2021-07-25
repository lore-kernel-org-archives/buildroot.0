Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D30C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 09:16:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0356023F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 09:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F0356023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D10A40224;
	Sun, 25 Jul 2021 09:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PdjnfYxrIkMr; Sun, 25 Jul 2021 09:16:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5035B40212;
	Sun, 25 Jul 2021 09:16:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1635E1BF398
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 09:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 057E360623
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 09:16:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnA8bFdnQCug for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 09:16:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC3B7605DB
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 09:16:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q3so7316288wrx.0
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ISSe43vYnsvl6nqh2DozlIG8OVZdIe8FF7iiVLo05o=;
 b=p5mgvzjIpiB5ZN0rtPkIg6H/8AYMuDy6WGqFKcdBLiXMiUHHSj3R5b4vpoMcnt/wwT
 TR1H+fydPSA8ozmuAFpr1V0uyP1olsFYSmZEmvdbKQcBiOEnheJlulEDtePbKIId2NXG
 msc59+8vjFGk5cN1jZ4ribB1SXosld83vuNkIHvh0O9L/5skYNKEG8MeTlMKrJBOqHP2
 DNX63YUnp4nwt2sw0XbkD+cJd8zUMrXkjcGT5GM172VU0busqUVCzCPdxqqgiPCBQRXg
 WKJoly/vYGkBSHbvuXnRNncETsuMdPtz7Cjm/vAAF2ZcKOq2ZodgcfG5mE7si4I/Ms8L
 7HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ISSe43vYnsvl6nqh2DozlIG8OVZdIe8FF7iiVLo05o=;
 b=AI31P3WZSosPVhdB3T2NCJ/SLYb6z+4ZVqzaB1/GjCszJd/qlFw0sJpTR/xEoUmo8F
 Ymr5fDr+1u8X4s1klfhtWCqmG8HESkcJvuDzlSzQ3sNM2+D6kSU0/9+u/0BxeR6YZf/4
 z+k7y0OKuD1CjQz1r7sObm5S1niwxTWacguaXqE/Brc7OTfRiBBMnWTBICxLhPRh4w5k
 cTrXWxvYdWGQWQ47zWn7CCcCmV0OrlCQ1T1d7qoyDLbh3l37OFmXI2YMHBRHU9ME5qsj
 eHzoisDtiaGpBm+6DQrA8GuMKBSQAXH60NENa9M355dWZtuP/xnlVfRHa69Ib7vNsj9f
 eVkA==
X-Gm-Message-State: AOAM533VNrcw3rSa9VFuX5bhkK+J9OmI1okdynx4p8gw7xUr3q4CrXWs
 uhpsnWgbFuq+Um2437sjtsDVyNixmbW4eA==
X-Google-Smtp-Source: ABdhPJyMcSwjsdvKNTHNxEfa08MvjQup3VLAGdfpTwkn9xghcZmpxG3k2/0GgjUsqwYF0eNt6jG0WA==
X-Received: by 2002:adf:e652:: with SMTP id b18mr1799232wrn.349.1627204588852; 
 Sun, 25 Jul 2021 02:16:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id d24sm9963909wmb.42.2021.07.25.02.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 02:16:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 11:16:22 +0200
Message-Id: <20210725091622.897777-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bird: needs autoreconf
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

For an unknown reason, autoreconf is needed since bump to version 2.0.8
in commit f5906644b45269b1a5fe109cb64fad837e4fbff2 to avoid the
following build failure:

checking for glob.h... no
configure: error: glob.h not found.

This build failure is raised because -g0 and -g are both passed to gcc:

configure:5207: checking for glob.h
configure:5230: /data/buildroot-autobuilder/instance-0/output-1/host/bin/mips64el-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -pthread -fno-strict-aliasing -fno-strict-overflow -flto -Wall -Wextra -Wstrict-prototypes -Wno-parentheses -Wno-pointer-sign -Wno-missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pthread -flto=4 -g conftest.c  >&5
/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/ccDboxph.ltrans0.ltrans.o:(.debug_info+0x2a): undefined reference to `conftest.c.0943dc99'
/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/ccDboxph.ltrans0.ltrans.o:(.debug_info+0x2f): undefined reference to `conftest.c.0943dc99'

-g0 is passed by buildroot and -g is passed by bird if
$ac_test_CFLAGS" != set (since version 2.0.7 and
https://gitlab.nic.cz/labs/bird/-/commit/cc95b4594ac924b40325a4f1adcae5312179db40)

For an unknown reason without autoreconf, ac_test_CFLAGS doesn't seem to
be equal to "set"

Fixes:
 - http://autobuild.buildroot.org/results/1d2acc9f6b8830adc8b62d6b2e55837abae561a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bird/bird.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index a8b9b18b50..7d7002d5f2 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -11,6 +11,7 @@ BIRD_LICENSE_FILES = README
 BIRD_CPE_ID_VENDOR = nic
 BIRD_SELINUX_MODULES = bird
 BIRD_DEPENDENCIES = host-flex host-bison
+BIRD_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_BIRD_CLIENT),y)
 BIRD_CONF_OPTS += --enable-client
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
