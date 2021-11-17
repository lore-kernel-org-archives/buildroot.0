Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0A9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 17:34:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C09C6138B
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 17:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C09C6138B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E94D360A5C;
	Wed, 17 Nov 2021 17:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9b_kVFRhC00q; Wed, 17 Nov 2021 17:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 392E360A4A;
	Wed, 17 Nov 2021 17:34:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5659A1BF34F
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 17:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 507B04048E
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 17:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rAK6MnCqRCia for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 17:34:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 448FA40526
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 17:34:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u1so6129625wru.13
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 09:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PbLZ4KSZqOLY3cOoSdABPNA78GXkdOgCmHNhP7B+2nI=;
 b=X8XnDrfWoC2FTTblZmSgEt+CpVNc/ZhyM9pEEo1CBxhhNj6sm/jMkHR+88xsjFmVgm
 xzDflmzfUYxNeK48jR8X6r3ZkEs69gM13+kL0grv0DJUpadFR6GMAPIDEClbKYLdPqPr
 8RaL5+yyCRUfhbb4W/WOaJZTDUAMQmzTdbAMpDY/Kji7ZrIYM9VtPmGFZPv1f+U3fvOe
 mKLlE4O36jkdbZXKPqxYmAxAP4p8Ifs57kRcCiTkLDCo7Xo///imtd8cvXlKVhEcYPD3
 w98EEuGuJF0k/sAGTYIxP7gW4A+U2yvaWnVx9zzDxFHB0A4kmHXvpuLow4woqEmLWUXP
 W+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PbLZ4KSZqOLY3cOoSdABPNA78GXkdOgCmHNhP7B+2nI=;
 b=xZ1TrLBGdvl8g37j7XOuaSFsHdG3IdiFwxtrgMd0SZd7W3m9+HKszNcwsN0tLzO1Jl
 DqJvxn6hELgjTKNWz7rXmEs0xW1qKNLeh2pY/JAx8BDa3Y0tKeR5p1Pp/4lA3dbEsFJH
 LR3nyplvCWwOtBPaWRkcNML9ppy0M4vLvvZx2dW6tfSmxaGUHLNRrvTp45eRXRau6Md7
 ATAMTnfuHjl8qZpQX9ejKj8N1RhhhlFZ1FkEfwbBSJgMEYFk5kDsQfQHryQFxKw2j7vv
 Dee9DQBAW9qS5+C7lb+LPwOpYBHoCw9YiBoqFNPJUoJPMqnWP5niqIkhqrowOFK9tlfx
 TBww==
X-Gm-Message-State: AOAM533hTPVnJwOIVQ7o87MgQeGxdjMY5FcxbkydC4sM93Jna1LIrI5n
 Vq0mm+x61nWkVSIQMLtDzPcGYw2i7KU=
X-Google-Smtp-Source: ABdhPJxe5U5Wsh8KtU8bPCNLCXBf1H5kGC2Z2nU+7l1gTTraofPcRrlFf3vj/bZ5uszRb6rPxleHxQ==
X-Received: by 2002:adf:e484:: with SMTP id i4mr22114118wrm.49.1637170449227; 
 Wed, 17 Nov 2021 09:34:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id az15sm343990wmb.0.2021.11.17.09.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 09:34:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 18:31:52 +0100
Message-Id: <20211117173152.994041-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/apparmor: fix per-package build
 with apache
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following per-package build failure with apache:

/home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/../../usr/build-1/libtool --silent --mode=link /home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/bin/aarch64-linux-gcc    -o mod_apparmor.la  -rpath /usr/modules -module -avoid-version    mod_apparmor.lo -L/home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -lapparmor
/home/buildroot/autobuild/instance-3/output-1/per-package/apache/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/9.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: cannot find /lib64/libc.so.6

This build failure is raised because the fix added by commit
3c836e54203b16015c9c52cbe007adc92d293a0d was incomplete as the apr
special libtool script was not patched (see commit
b747c29c4e8eb89b7b99658dfd34f4a6b6b0744d for a detailled explanation)

Fixes:
 - http://autobuild.buildroot.org/results/6747b1cb11b129ea4bcb1ecc9645e94fb8e095e8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apparmor/apparmor.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 400ea349ae..6f0e59224d 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -59,7 +59,8 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define APPARMOR_FIXUP_APXS
 	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apparmor/@g" \
 		$(STAGING_DIR)/usr/bin/apxs \
-		$(STAGING_DIR)/usr/build/config_vars.mk
+		$(STAGING_DIR)/usr/build/config_vars.mk \
+		$(STAGING_DIR)/usr/build-1/libtool
 endef
 APPARMOR_POST_CONFIGURE_HOOKS += APPARMOR_FIXUP_APXS
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
