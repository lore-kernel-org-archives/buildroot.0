Return-Path: <SRS0=UKoJ=OW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB24C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 21:41:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0132561994
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 21:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0132561994
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9081B846E4;
	Sat,  2 Oct 2021 21:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t3T-J4VvaH-9; Sat,  2 Oct 2021 21:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAFFD8455C;
	Sat,  2 Oct 2021 21:41:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F0E41BF312
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 21:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CB9F8455C
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 21:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KHRBN5v9skn for <buildroot@lists.busybox.net>;
 Sat,  2 Oct 2021 21:41:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62F9E8452F
 for <buildroot@buildroot.org>; Sat,  2 Oct 2021 21:41:51 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id i62so15813411ioa.6
 for <buildroot@buildroot.org>; Sat, 02 Oct 2021 14:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gXxd6yUurtujpJPs4hT00ltJGQnzvX5D42v16yXIIYQ=;
 b=Pa1UKzcP241gOQDuif3EhaiAC4VHOXBxOaZmzcJuwUENS2xHnUSBKB7PCrDV41IQLm
 j9cf4kIeQQXTuVIddS+mntciur6i22q0D+H092uuw3bjj5UJ1l+jex5BfVB9APo+m1Ji
 Q0mIs9fnJohQK+IrGk8u7kl6YzJfFSWJXfr/zvEsFAK8IgPSAeYuLsqFKLy7K3SjTez7
 kPc2jGkKnFLgmyyOuIKp/PiVLFhy/QfQpsd+iU4bZkCR6Qu2G5BqFhOdQhTuyNv8UoB+
 /OJyDZ4KqdTjV3Zq+mh6YhnXlUidrXZCyEuKQxAtA5Q7d/Ducl5Uyk9R87tOrDoxG4zl
 F55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gXxd6yUurtujpJPs4hT00ltJGQnzvX5D42v16yXIIYQ=;
 b=uOwVPDnNZbxjaJtzdg5FMUoyqRes0yGUQRztQ1bjeCvUBOTmozT7jjYZ65g3o/WiMG
 l/4vxcm5bxhHj3rGX5A4Uk4ZTbYdXDL0RD0X5pCC6OKJVvt7vKqvb8Qi/t2cnM1Y/RTt
 f/nO7Fpbqrj45lCamtAB8CmG9uvqNFJb/fNl/4Z4cy9FHXlfSaYCSGFPXedJUlhDUjm2
 4dFnyGN11Opa5eck3PTA/lAveRI/YHBL+EUzgAG7l+nctcCBZug8+/cgKP2/l1olr56z
 Hj8g0ABnuf9OYUv2ijO7IGOOFiRZj4IWQwyC8K67RO5fkEpZidtKSsb+JIpEk2HFr5kG
 0Y0Q==
X-Gm-Message-State: AOAM531AdL4hbRQOBiDnWGrWLRhT9Zwcu57Y1EMesveSw+N7kLvUjwWT
 cWW5r3wCCX6TXJK/zGAZ+HQBB6WvA5s=
X-Google-Smtp-Source: ABdhPJyY5uM1l5Dqkg4Uws0+JH+DbG7T1j+PAvjiKRxxUlBoUTxf/Oy4E8orZahBzCezNQCjSDCpLg==
X-Received: by 2002:a05:6638:2189:: with SMTP id
 s9mr4279629jaj.73.1633210910099; 
 Sat, 02 Oct 2021 14:41:50 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id d1sm6078528ils.25.2021.10.02.14.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 14:41:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Oct 2021 15:41:46 -0600
Message-Id: <20211002214146.3974248-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/pipewire: bump to version 0.3.38
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to backport an ARM compilation build fix.

The optional pw-cli tool now depends on readline, so depend on it when
available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add readline dependency for pw-cli when available
---
 .../0001-cpu-fix-compilation-on-ARM.patch     | 28 +++++++++++++++++++
 package/pipewire/pipewire.hash                |  2 +-
 package/pipewire/pipewire.mk                  |  6 +++-
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 package/pipewire/0001-cpu-fix-compilation-on-ARM.patch

diff --git a/package/pipewire/0001-cpu-fix-compilation-on-ARM.patch b/package/pipewire/0001-cpu-fix-compilation-on-ARM.patch
new file mode 100644
index 0000000000..445cab08bd
--- /dev/null
+++ b/package/pipewire/0001-cpu-fix-compilation-on-ARM.patch
@@ -0,0 +1,28 @@
+From f8817b439433798bd7217dc4ae72197887b0fc96 Mon Sep 17 00:00:00 2001
+From: Wim Taymans <wtaymans@redhat.com>
+Date: Thu, 30 Sep 2021 11:12:27 +0200
+Subject: [PATCH] cpu: fix compilation on ARM
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+f8817b439433798bd7217dc4ae72197887b0fc96]
+---
+ spa/plugins/support/cpu-arm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spa/plugins/support/cpu-arm.c b/spa/plugins/support/cpu-arm.c
+index d80b8ad87..de07ebf41 100644
+--- a/spa/plugins/support/cpu-arm.c
++++ b/spa/plugins/support/cpu-arm.c
+@@ -80,7 +80,7 @@ arm_init(struct impl *impl)
+ 	int arch;
+ 
+ 	if (!(cpuinfo = get_cpuinfo())) {
+-		spa_log_warn(impl->log, NAME " %p: Can't read cpuinfo", impl);
++		spa_log_warn(impl->log, "%p: Can't read cpuinfo", impl);
+ 		return 1;
+ 	}
+ 
+-- 
+2.25.1
+
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index a289464988..879cfa41cb 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ce7dbd71bce46c9d81c549d8c846e8f3a8a263a19bf981d141d57bd2d316e3ac  pipewire-0.3.35.tar.bz2
+sha256  f4ae272e8d3fa3ff6a6ba2a465d1f951405b08fd31bbb82c27bb7cf55e113ba1  pipewire-0.3.38.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index d6cbe1605f..57f9d9c478 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.35
+PIPEWIRE_VERSION = 0.3.38
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -142,6 +142,10 @@ else
 PIPEWIRE_CONF_OPTS += -Dlibpulse=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+PIPEWIRE_DEPENDENCIES += readline
+endif
+
 ifeq ($(BR2_PACKAGE_SDL2),y)
 PIPEWIRE_DEPENDENCIES += sdl2
 PIPEWIRE_CONF_OPTS += -Dsdl2=enabled
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
