Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454E5C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 07:08:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C210A610A7
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 07:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C210A610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8289360B90;
	Thu, 19 Aug 2021 07:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdzJJFEzUMAC; Thu, 19 Aug 2021 07:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB41B60BA3;
	Thu, 19 Aug 2021 07:08:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8372B1BF2B8
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 07:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8078980C2A
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 07:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBBQwFOo0S-7 for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 07:08:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0021980D96
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 07:08:27 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id f5so7352937wrm.13
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 00:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e7s2I30XF9mYb8clE8HjAybFsL79PM2jLqrPFH09nLI=;
 b=qY1lSY22p4t3/nZej6u70jqwyD34Wb2Nx0KAvrgpyQWM4ZQtBcCgIlIbJAfNhx6wp1
 m6ZeVFXqRqy5zP6rIKt67o5/dHZlY/SXEBsC3LTBEgTsC4XV+uDc5LhWv07jEsQH5IK6
 8kUM9MyeiqkLNz5govPpgZh6q/LHUjGAW3+1WFboy3JZekV83b27PXiM12aTeQqOXjhX
 3G5PigSN8S3AoBj/bE+36KN/+za27/K8EhkdIJl3NYc7er0cfuz8P9GNU/NNshZK1v+D
 /CsXrlfLp1rpk6XvjSJICgvFSuLDArU0q9N7JQVYbPPXmfCP+Oz5ZdHo1SJjQ7K1xQCC
 qz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e7s2I30XF9mYb8clE8HjAybFsL79PM2jLqrPFH09nLI=;
 b=Q653d48hqPxXcc8nOt8onLtggrYJeljTkIc43ywP0ZROiusYr9esA2Cv+NJXEb57kg
 1pek644qEGz9DNE32Q2tduD61p0BPotChefRmTgWo3Zq8aVyKejzOdo9Hl5L3RvPJfPN
 c5USsxl+UXwVCThw9mg3DtlbGym75GTMlyrajOgsfXFiF2l/8chM9tjBLwYbqaQTkOqA
 BZwbQiN4f77pj7IJpFt9KIpg/JElTwiAqyS4HAF3lkYobhhpqob1vLq9g1kzDG34P8Vs
 J+UCo+BHWcEH0m8A/wDzqdg7CHnhb+kRxEU4hH7+LbAZmr1aO0O99GUrqvA2/V148Wmp
 yHHw==
X-Gm-Message-State: AOAM533Q7cXs8IR9jWooj2K/wpScU2lylhJoQX6bJo6wLSoirloXui1r
 RF/qVSyO3WSKICwyTVinaS4TMu6DWuK1oQ==
X-Google-Smtp-Source: ABdhPJxOarxqLa0Ggo08/1eydLjXCpmOw0Al+Tppx/6PQ68Fe1qxESwg9O/iscRiF5o5UTzcK0DfdQ==
X-Received: by 2002:a5d:4dc3:: with SMTP id f3mr1933880wru.302.1629356905732; 
 Thu, 19 Aug 2021 00:08:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id g9sm1810024wmk.34.2021.08.19.00.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 00:08:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 09:08:07 +0200
Message-Id: <20210819070807.618276-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libvirt: fix NLS build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure raised since the addition of the package
in commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

/tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/util/libvirt_util.a(viralloc.c.o): in function `virInsertElementsN':
viralloc.c:(.text+0x167): undefined reference to `libintl_dgettext'

Fixes:
 - http://autobuild.buildroot.net/results/2349c55a4a42f08ca52700c60cda3065b0c4bd88

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 93eab849cc..be1ef34798 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -21,7 +21,10 @@ LIBVIRT_DEPENDENCIES = \
 	libtirpc \
 	libxml2 \
 	udev \
-	zlib
+	zlib \
+	$(TARGET_NLS_DEPENDENCIES)
+
+LIBVIRT_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 LIBVIRT_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`" \
@@ -49,6 +52,7 @@ LIBVIRT_CONF_OPTS = \
 	-Dinit_script=$(if $(BR2_INIT_SYSTEMD),systemd,none) \
 	-Dlogin_shell=disabled \
 	-Dnetcf=disabled \
+	-Dnls=$(if $(BR2_SYSTEM_ENABLE_NLS),enabled,disabled) \
 	-Dnumad=disabled \
 	-Dopenwsman=disabled \
 	-Dpciaccess=enabled \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
