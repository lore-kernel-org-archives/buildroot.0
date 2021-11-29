Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBE4C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77A6881027;
	Mon, 29 Nov 2021 22:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRkGyxn-WFy6; Mon, 29 Nov 2021 22:25:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7AB98102F;
	Mon, 29 Nov 2021 22:25:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D4081BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF5DA401BD
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:25:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ZRmELfzZ2iC for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:25:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94880400D4
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:25:00 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso18006637wms.3
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eiiEYVgRS8KmYnFv+97YVDnZjb8iyAV2IEt7tJMEP5s=;
 b=Uf79Ril6viTP4p1rsjm8kSFHcF6aSE+Yi96rXsmaTOMxs6b+BSa5BbQ/vh7LV4w9jp
 KLDivnPqe1sAP6TKOfGkq5RO4N78ojB8E/EeCTbJyeg0cJL3t6gD/+UhWfFAxGfqI16r
 /o9nZPikkOWsWiKYCBCUKWUNX+SejTp4NjYgjaUyt8IX9xz1FCVyy+RAIwTE+fnctpqT
 dobpe39/fdeiDnvL7m6GFPTT/NcJx+CMlC58/LOUIvdfjudILxYdd/vxAvb90w/uYs2d
 00cLsSlYprRah5YhxNfVmf/ilgS9n1VJS21wwuDps7wxCVFzRj07Cvg0bz8SuItDGTHu
 JQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eiiEYVgRS8KmYnFv+97YVDnZjb8iyAV2IEt7tJMEP5s=;
 b=6CPOydQ2y7IDOTS/UZW09Q2YI4yI8vivN62Vto+hz8cQ7Vjd5Ow+hQAgubnXzsjQni
 kCSTzrbjKGqW3I/P0Z8cWeYQREhttW3bSXJU0BM9SQOWy7Moqkf85SQO2PX5f0qqxY3e
 p5ywZCdxDKURQo0Pzr7XJ+Qo7v5nVAx7jT+7Wt51LXYfCoRL2i/iA1a0J5OY/gBR0Vc9
 KwjwvxG+nsN0t164ChcxuEKm83EF30TQE7+c0wfMHTyvo3G88FCPTPrY/vBQh4bTtOyJ
 dJZaM7rDzli+3lpZj9kZBTkdv2CARQHrfUI8p/ZZg4iswXOFjsvAscsQ4y9vzaU72lAU
 iVsg==
X-Gm-Message-State: AOAM531s1DtXRpQlYzHfPEmcXjfGByBkuyEtJtQQRe8NK2rKYfFpEGbU
 /Kr8orAiuclluzD2x9THpkXEO3RHxOA=
X-Google-Smtp-Source: ABdhPJx3MpO6npL7DOXo859YrpC0Vz+umVWcqftb8EqF1UtHsbp3denyZR0hHs8svXm3nqWKobZ8EQ==
X-Received: by 2002:a05:600c:190b:: with SMTP id
 j11mr801199wmq.112.1638224698704; 
 Mon, 29 Nov 2021 14:24:58 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id g13sm20167541wrd.57.2021.11.29.14.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:24:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:22:24 +0100
Message-Id: <20211129222224.2184060-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pru-software-support: drop spurious
 space
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ash Charles <ashcharles@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
bd438fc06f3fc8b509994c02d100bc05c0ac13b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pru-software-support/pru-software-support.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index cff3fb54ed..87a382948b 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -7,7 +7,7 @@
 PRU_SOFTWARE_SUPPORT_VERSION = 5.9.0
 PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot
 PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_NAME)-package-v$(PRU_SOFTWARE_SUPPORT_VERSION).tar.gz
-PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3-Clause, Public Domain
+PRU_SOFTWARE_SUPPORT_LICENSE = BSD-3-Clause, Public Domain
 PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v6.1-Manifest.html
 PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
 HOST_PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
