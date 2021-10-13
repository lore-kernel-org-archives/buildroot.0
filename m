Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CCDC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:44:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4BD6610E5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4BD6610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B1F14052A;
	Wed, 13 Oct 2021 18:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aArq962obcnR; Wed, 13 Oct 2021 18:44:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76C7E40482;
	Wed, 13 Oct 2021 18:44:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67A3F1BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62A2140482
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VSSclTrQ02ny for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:44:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1262640155
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:44:18 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id o20so11540774wro.3
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RmvSeF7WIAqYGEpwngkw9pM06y0UIKB2lOy2W09g1YQ=;
 b=VvX8GZUj6xRz7xGdfxZ6X3PMDz7slwz0d45V2UFelign0B9qYYqFM7I2OQL/0JsOr1
 NooQcmXpw0CzJkfJpyChWplsEKIuUh2rvtvuoh/SPuPBsXaakaFtW0UD137NFRz5xGp0
 H67vJ727GsybcL6S8kh5tqBZc729sgK6yXubvxFs28CLgNvahNQ4GImCX7Yx9rk8rh/t
 SpeFPvualziNozYhwbDIyO0GWOjeOEdBBSFLUKxZkESEG8voZn2JX5i7caRkNzyYJP/K
 6u86mUC0OZL8qHUhQNKi+FW9dL+Ze0AiMwlAA5XJO9IUhTZPOiQIcRUSSxS/QyoHBEc3
 88fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RmvSeF7WIAqYGEpwngkw9pM06y0UIKB2lOy2W09g1YQ=;
 b=fiL4r3tcHz58l6ZOZAVlHtgKYy+OacJq1U/R2MyfScBM6u1bMnWCoaCV+nqvj2zdn7
 AQB4Y66ZuQsrQDsZqAzcf3RTVvgiPn9PDPb2BgdByNAFa5t3Z8sahtO6TNIyIEYumhwP
 JQMFahT+j+vLioakC/tgxcAgs8Sxq2bTolFiJgZJwqCHASI47RIQD6qv1ociXnQYIdgX
 8o7KDDnXp9+QwFFFxASEjRtTbBSLzeZwTt5macrpJqq+0KUSpfTpBZsGyCO5Qyv4Mel7
 xuLPH3blZtJkbekSeIAZa7p4asZeErTk/PiBu0l+sCvmlYWiaYtOHX1wga/WteBRngYw
 8nEg==
X-Gm-Message-State: AOAM531e7TsugbC2SJbHQFxe+977DA61J4oY+ABJFttURUsfabnr74cm
 zYbK2qRJ54UHs1rZT7DkmrybMjOiiIA=
X-Google-Smtp-Source: ABdhPJx2Oiy86H75vAz3aQ5BqOWfyUb/rKOW2Pi0m/+ShR3QaxzAteiXkp5115QZbBzu6AyjblmUHw==
X-Received: by 2002:adf:9bc9:: with SMTP id e9mr974388wrc.388.1634150656878;
 Wed, 13 Oct 2021 11:44:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id n68sm6033018wmn.13.2021.10.13.11.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:44:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 20:43:07 +0200
Message-Id: <20211013184307.1869426-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tinydtls: fix build with automake
 >= 1.16.4
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

Touch ar-lib as suggested by upstream in
https://github.com/eclipse/tinydtls/pull/103 and
https://github.com/eclipse/tinydtls/commit/5c6fd178e83cec7ccc40ac3ab13a15ce611da8a8
to avoid the following build failure since bump of automake to version
1.16.4 in commit fe90272b5128987ee7492fff950660e05324838d:

configure.ac: error: required file 'ar-lib' not found

Fixes:
 - http://autobuild.buildroot.org/results/fa23cdf0d454c2ad11af3cdcc2810cd442918667

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinydtls/tinydtls.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tinydtls/tinydtls.mk b/package/tinydtls/tinydtls.mk
index 6d839bc05a..bba9e5f6fa 100644
--- a/package/tinydtls/tinydtls.mk
+++ b/package/tinydtls/tinydtls.mk
@@ -16,4 +16,10 @@ TINYDTLS_AUTORECONF = YES
 # use inttypes.h data types instead of u_intXX_t for musl compatibility
 TINYDTLS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DSHA2_USE_INTTYPES_H"
 
+# Fix build with automake >= 1.16.4
+define TINYDTLS_TOUCH_AR_LIB
+	touch $(@D)/ar-lib
+endef
+TINYDTLS_PRE_CONFIGURE_HOOKS += TINYDTLS_TOUCH_AR_LIB
+
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
