Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA79C4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 06:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07F10403C7;
	Thu, 15 Feb 2024 06:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n8sAAbdgjXSO; Thu, 15 Feb 2024 06:10:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0D2F40420
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0D2F40420;
	Thu, 15 Feb 2024 06:10:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51B491BF2A6
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 06:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C35D81F51
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 06:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h56y18plx-QC for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 06:10:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4330381F45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4330381F45
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4330381F45
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 06:10:20 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6e2e44aad03so288275a34.2
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 22:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707977418; x=1708582218;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NpWQJHaIHu6tXObvx3TL5O+KGHO+Kg9L6YxB1bvsmTI=;
 b=MLHMMKljygWma7rWywCxBjcOKcxvTNMOQl8k/IYinbAKXoReid0zq3X/nINPtbYnC8
 IkjRCHHIiBwOOfugwBcR02fIMQGd78R0FnpvMyZL6woLZeheqj3VfrNTckQRQxb4HPWf
 2NcZX0ehCJMnLHSk1dwpLsYImv3tTabaKplL01rhUGt5Ulbmv9xRr37zq8pwsnUqvRKb
 V2nvtqaYg6Np34tQSDjIfwiDxn9zbudewpiy6Z3iw/lE4JeOfb85gsUGBE21jxL9IMVp
 A6JMLCU8McyW0EhIP9+AQab5wtQFcesUJuBy7T7LvnxK/pF7hVjGZvB5p28qur61mU0B
 1E6A==
X-Gm-Message-State: AOJu0Yyjru8vMo3AU0XkH1uziL4pNxWfsEMgh2ouCUUhpMPBY7mgAHcM
 B86GQbjgitk0w+yZPkFHZsENoD7Ok31xOt9Q3ppz0t8SzwRtsyRqwKG8FI+eBWY=
X-Google-Smtp-Source: AGHT+IEDdbqiugEJOXKND+vYnFj2ku3yzlhEj/FXDKs0yZ21r4epJcuOVxpb9zhTeqe4ASwq6L6hZA==
X-Received: by 2002:a05:6358:d5a8:b0:179:292:223 with SMTP id
 ms40-20020a056358d5a800b0017902920223mr880948rwb.28.1707977418476; 
 Wed, 14 Feb 2024 22:10:18 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 y4-20020a170902e18400b001d8ee19ab34sm451510pla.29.2024.02.14.22.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 22:10:18 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 22:08:14 -0800
Message-Id: <20240215060814.2618098-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707977418; x=1708582218; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NpWQJHaIHu6tXObvx3TL5O+KGHO+Kg9L6YxB1bvsmTI=;
 b=faqTgfy950vT7qi9X0pw0EI0AjVju0nSq6GNdEVMDuCY/ja2HCBiwXBgwGPGmObjvW
 whbBuKPjKgsaP2E5aJn+PX4er0fzEUUhYM9Vez9PUmpL47nsSh2HpFwS9a99Lae/fxKN
 EaOxfFA6WS7Ldz0JpPkioEjKQ7ds/ywZU6r+PAs5nO/J40/LCRpYwQIFk3LbnL3dXuug
 b29HQj7RxI7/tleS7tUb5O7HxaJIoJU9mL1GjXZ6lef3KLN2YUhu3L6c93ZFqriQOoZy
 rB+VPRnCh60IWpfoXyccNO9xVlHE3jyH8xSMwaCORh4gxdo6N3Y3IBSoU/G9FQcmaxRu
 g5Qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=faqTgfy9
Subject: [Buildroot] [PATCH 1/1] package/bash: bump to version 5.2.21
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build tested using the following config option:
    BR2_PACKAGE_BASH=y
$ ./utils/test-pkg -c bash.config  -p bash
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/bash/bash.hash | 4 ++--
 package/bash/bash.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bash/bash.hash b/package/bash/bash.hash
index e0a1ebac91..44c1c5ed50 100644
--- a/package/bash/bash.hash
+++ b/package/bash/bash.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# https://ftp.gnu.org/gnu/bash/bash-5.2.15.tar.gz.sig
-sha256  13720965b5f4fc3a0d4b61dd37e7565c741da9a5be24edc2ae00182fc1b3588c  bash-5.2.15.tar.gz
+# https://ftp.gnu.org/gnu/bash/bash-5.2.21.tar.gz.sig
+sha256  c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b977f078560d5b8  bash-5.2.21.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 9a73ed8c36..9d173a5c7c 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_VERSION = 5.2.15
+BASH_VERSION = 5.2.21
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses readline host-bison
 BASH_LICENSE = GPL-3.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
