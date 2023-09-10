Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFFBC71153
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 19:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7409E60BFF;
	Sun, 10 Sep 2023 19:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7409E60BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G44hqviTFkOc; Sun, 10 Sep 2023 19:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9048A60BEC;
	Sun, 10 Sep 2023 19:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9048A60BEC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51FA71BF350
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3849D81551
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3849D81551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5PQIrx4torka for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 19:35:08 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6C61813DC
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 19:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6C61813DC
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-501bd7711e8so6442223e87.1
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 12:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694374505; x=1694979305;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZGsKkvjKOECo0MA4CnPxUNtyUsdakknXcL2dla6gFLM=;
 b=Vi8LdhRcGhyZW/KhLMPpktH604Ol33H5L/Z7hiZlliPR8b7C0xRUfCMZbKkFjn0dq1
 Rq+1svAwEv/CKiE2rc5Csku4CM1qSVi9hjgyLjapfIsR9tahqEr/A0l31W8x6NQ3nClU
 dfCc6JIBydfR/4ehVD1j2goaQM+nGMSa6AhaiQhp1VKX+nM1cQraG3PRwlEq3YuS12zn
 F0CtywxNFuNbtB42puKnJL6UWPf0yU4aUjy/dzbF7EzOiep41O03MQ7H0XLj54oN2zyp
 q1QMQ6gv2mD58vtCGs4MpHG1xXJfdF4xK1XIRf0pCbq2DE+oq+H8lMItFK6mtYRLX4uk
 kB/Q==
X-Gm-Message-State: AOJu0Yz2g2GG9zGnsl45ZMErqGUvd5vJqW1xRX5XkVCCKyWkJksMbrdS
 16hFs2e/ie+x+W6VlWgK0tIq9bC6b3p4dw==
X-Google-Smtp-Source: AGHT+IGsCIDpYIQIpMuvzJ0jh9UKfPr5A9yptOA/pSGv6V8wXiP3CYv8iISVMoTAgc0B4xJj5/X+0g==
X-Received: by 2002:a05:6512:31c5:b0:502:a588:6609 with SMTP id
 j5-20020a05651231c500b00502a5886609mr5581466lfe.3.1694374504501; 
 Sun, 10 Sep 2023 12:35:04 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 u6-20020ac24c26000000b005008757cd6csm1068455lfq.241.2023.09.10.12.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Sep 2023 12:35:03 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 10 Sep 2023 21:37:25 +0200
Message-ID: <20230910193725.1435827-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694374505; x=1694979305; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZGsKkvjKOECo0MA4CnPxUNtyUsdakknXcL2dla6gFLM=;
 b=DBqylYoZCy3BsxLHJCoyu0dDIEtFFwjuVzhtZzf7MpmIO37dB9whMaUV0CqkdGYzrt
 iJI5tMLIuD5rQfRfteiE8dV49zsgc4jRYSZpiATs/DiJ/og/PJwkNjvDxLJBzD41pnjD
 ddlwP6FWtzQZkiC5wXPlGRe8PI+Ev2IUVPS6qzGM9c2O3fphX8vPVXIvS7kvY4cd9GUN
 1K7mMXO5B+aJskRgO8hzXGaNKu6VY7IF2N+BCGuBVOV8LkgvipNdSiJIssn5dGtnYEN4
 +nMhEgRxWLOVLJaAiNE7HmX6l7sNMFR98Q9TeMAiYtlOyYjXFm7+8lLUcUnNCinIhjAi
 ObAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DBqylYoZ
Subject: [Buildroot] [PATCH v2] package/criu: new package
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Checkpoint/Restore In Userspace (CRIU), is a software tool for the
Linux operating system to make it possible to freeze a running
application and checkpoint it to persistent storage as a collection of files.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

Notes:
    v2:
    
    - Addressed comments from Thomas.
    - Tested on ARM target and on x86_64 with qemu.
    
    test-pkg skips test though, and I'm not sure why.
    $ utils/test-pkg -d ~/mnt/encwork/git/br-test-pkg/ -p criu
                        bootlin-armv5-uclibc [1/6]: SKIPPED
                         bootlin-armv7-glibc [2/6]: SKIPPED
                       bootlin-armv7m-uclibc [3/6]: SKIPPED
                         bootlin-x86-64-musl [4/6]: SKIPPED
                          br-arm-full-static [5/6]: SKIPPED
                                sourcery-arm [6/6]: SKIPPED

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/criu/Config.in | 44 +++++++++++++++++++++++++++++++++++
 package/criu/criu.hash |  3 +++
 package/criu/criu.mk   | 53 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 102 insertions(+)
 create mode 100644 package/criu/Config.in
 create mode 100644 package/criu/criu.hash
 create mode 100644 package/criu/criu.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3af43d2d27..cf7cb9718a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2050,6 +2050,7 @@ F:	support/testing/tests/package/test_python_pytest.py
 F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
+F:	package/criu/
 F:	package/libcamera/
 F:	package/libcamera-apps/
 F:	package/libostree/
diff --git a/package/Config.in b/package/Config.in
index b21a2f8c65..c6c809f59c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2665,6 +2665,7 @@ menu "System tools"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
+	source "package/criu/Config.in"
 	source "package/crun/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
diff --git a/package/criu/Config.in b/package/criu/Config.in
new file mode 100644
index 0000000000..932e65863e
--- /dev/null
+++ b/package/criu/Config.in
@@ -0,0 +1,44 @@
+# criu only builds on certain architectures
+config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_mips
+	default y if BR2_x86_64
+	default y if BR2_powerpc64
+	default y if BR2_s390x
+
+menuconfig BR2_PACKAGE_CRIU
+	bool "criu"
+	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_PYTHON3 # host-python3-ssl
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on !BR2_STATIC_LIBS # protobuf, libbsd
+	depends on BR2_USE_WCHAR # libbsd
+	depends on BR2_USE_MMU # libcap
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_PROTOBUF_C
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_LIBBSD
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBNET
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_PYTHON3
+	help
+	  Checkpoint/Restore In Userspace (CRIU), is a software
+	  tool for the Linux operating system to make it possible
+	  to freeze a running application and checkpoint it to
+	  persistent storage as a collection of files.
+
+	  https://criu.org/Main_Page
+
+comment "criu needs a toolchain w/ threads, dynamic library, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_USE_WCHAR
diff --git a/package/criu/criu.hash b/package/criu/criu.hash
new file mode 100644
index 0000000000..2c4a07252b
--- /dev/null
+++ b/package/criu/criu.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  6a9997981c9fe4730c848ce59346b3a22fad69b803607cb67a3f6ec0557fa474  criu-3.18.tar.gz
+sha256  568a1fa9d90e18a1a1a61ea58ec2eece16b56a5042cc72c1b4f8d4455ae6fcb7  COPYING
diff --git a/package/criu/criu.mk b/package/criu/criu.mk
new file mode 100644
index 0000000000..095ff8e290
--- /dev/null
+++ b/package/criu/criu.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# CRIU
+#
+################################################################################
+
+CRIU_VERSION = 3.18
+CRIU_SOURCE = criu-$(CRIU_VERSION).tar.gz
+CRIU_SITE = https://github.com/checkpoint-restore/criu/archive/refs/tags/v$(CRIU_VERSION)
+
+CRIU_LICENSE = GPL-2.0
+CRIU_LICENSE_FILES = COPYING
+CRIU_DEPENDENCIES =\
+	host-pkgconf \
+	host-protobuf-c \
+	host-python3 \
+	host-python-pip \
+	libaio \
+	libbsd \
+	libcap \
+	libnet \
+	libnl \
+	protobuf \
+	protobuf-c \
+	python3
+
+CRIU_MAKE_ENV =\
+	$(TARGET_MAKE_ENV) \
+	$(TARGET_CONFIGURE_OPTS) \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	WERROR=0
+
+#x86_64 is treated as x86 in criu
+#Also, powerpc64 is refered to as ppc64 in criu.
+ifeq ($(BR2_ARCH),"x86_64")
+CRIU_MAKE_ENV += ARCH=x86
+else ifeq ($(BR2_ARCH),"powerpc64")
+CRIU_MAKE_ENV += ARCH=ppc64
+else
+CRIU_MAKE_ENV += ARCH=$(BR2_ARCH)
+endif
+
+define CRIU_BUILD_CMDS
+	rm -rf $(@D)/images/google/protobuf/descriptor.proto
+	ln -s  $(STAGING_DIR)/usr/include/google/protobuf/descriptor.proto $(@D)/images/google/protobuf/descriptor.proto
+	$(CRIU_MAKE_ENV) $(MAKE) USERCFLAGS="$(TARGET_CFLAGS)" -C $(@D)
+endef
+
+define CRIU_INSTALL_TARGET_CMDS
+	$(CRIU_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install-criu install-lib install-compel
+endef
+
+$(eval $(generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
