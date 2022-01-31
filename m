Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC65C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 22:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B9AC82B3E;
	Mon, 31 Jan 2022 22:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqrM3A3Fk0po; Mon, 31 Jan 2022 22:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 724FB82B24;
	Mon, 31 Jan 2022 22:30:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B69EB1BF836
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 22:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4FFA82B24
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 22:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tTWFLpiS5aoP for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 22:30:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D51281409
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 22:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643668227;
 bh=xzst2jjmrnKFZS7886IH/iUNClLEohGbPWwMYAwHf5Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=EhRVsUBfyAzZhbTu3Vs7CgNIQwmNiIzzNY4UKGn7OuoLW7FuKlGJ3oRUFeZFWAx15
 Oh8+8mGlundp7qKy3yLeZe6QnTntsQjG5UO5khQsvJtJUYzBxN7CyjbocFelV379TR
 /t9fjUAPUbZVlST/Zm0TM/exjnK7HQp/gVjgCVxA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.249]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M3UV8-1nFD9d2QB0-000YjD; Mon, 31 Jan 2022 23:30:27 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 23:30:24 +0100
Message-Id: <20220131223024.22386-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:hamuH7ZF9AttsTR+8gVCLi6DZEtRLuZmi29Q2iwqdCtN1UNmXtB
 dCzHhOqIYAsHYY2G5p2iN+aBPBZPWkBbq6DcpbNolNQbpLENN3cF7oP2M9LRB1qpasRgyLD
 Q9mI2CA2aHowy3qDbB73nidayoEw9mZxq1jXTlceJChkUdJmfDOIGIylcoyUP9xh8THfpZX
 U4cCt7Nq9eQR5hNSaC81w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/EsZLB1+x8g=:xDa/JMnFHtveVImK5ZV633
 BxEgbvI3qnyhNUS11VBeji5YwTGai+t/JpAoo2hcjxNWtn3RK8nwL1PG/tEjK4g6CDW48XJW2
 jihRaZ3vty1xTj0sm2maxImg4QnTafGIhKVsWSk/fQROONV0eEqtIVPhSPTZrEHrleiTyoKsB
 IeYGkntbSCPl2gEDSmMRpJv4P1tLcWO+E9bWK8aJwqW/HqG9Qn287ycFjj4WeUepM67ZRMIOr
 8fbicI4P76m7b36vRPGUdLo8aPcrMWSIqZ2TWvqo/4Ew0FqGbqeQZ2xWZBgM9UZC1F0bwQIa3
 3xjFszZtjcRhJw5Kg0maicJi65ahYo2MWnxtQzlIUW9QvqzCzdLNFxBW8/GoQMJbBZ/VgFPcO
 XMINw5FvUOEkywM4xXx5ufjstIAHbu7oe8XAXSgvbrausY7QUrm4NWpE+RrEnwsK0P22dhsYs
 TOtwlelrXoQRmMXl+ZAcFj3gPYJSvZCD88D4Jo84JOh6Z+iyeeMorOYeA0cfQN3Oz26YoPRvc
 Oc7dT0nbBxIpp6ODHPuH+FnuduR0baKCIq+uyVsBtYeH7J+/fOpnUNwoU5bdyoy0Fv9/EGxrG
 IV9P0OqPdG1P0wmSao3r7rzqa8xjFwiMhwo9a6C7dkEkXR58inFfwBPPEJmnXvConT8CZLRNY
 8rKUnz5nudX7QgUiPVaVaeuK/KgZ6S460hckEQcpUJVc4bngqyvIj1zTubEsaV5NJyNWvvVC2
 inpk71quF2VJn2kqcGHxy3scBqC6p6MC511d6xs/MKUFwnyVcFBLmTOHVGkxj9WpxlP4bLldW
 mcyyZc9MTIVM4uo7RvAoXihvAe/sxqEFD7fCeNZtUvmF7fHFFtzViosdVYwkXPA5AaYZKgTkj
 YXs3kQ9DI/3zkw8vauJ/4PuxilfwjchBWnpfbgr6dlNy9l7ukZcxLaXIsGoTjsmadeQyOnIoc
 eI1h/fYZAfqpmIKH1urTfbYCM8W1lJe20kqIt4eoR8RJgLYgrYjKGF93z7+CJ+pQ771azbpxe
 Gz61QAaTfdLtClMEpMd1wfecj71LsaxbVDnRSM/U8fQ+0Amet4hd4U/FXT6f9qQkgp9LON2OA
 GXCET7CTxSUghc=
Subject: [Buildroot] [PATCH v1] package/qt5base: fix uclibc/musl compile
 with libexecinfo enabled
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
Cc: Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- depend and link against libexecinfo if enabled to fix linking failure
  in case execinfo.h is detected for qlogging:

  qt5base-5.15.2/src/corelib/global/qlogging.cpp:110 - __has_include(<execinfo.h>)

- libexecinfo already depends on !BR2_TOOLCHAIN_USES_GLIBC

- rename plain QT5BASE_CONFIGURE_ARCH_CONFIG to QT5BASE_CONFIGURE_ARCH_CONFIG_LIBATOMIC

Fixes:

  - http://autobuild.buildroot.net/results/e7c685744b1f1bebb7fec9835bda534a72b7b7c2

  .../riscv64-buildroot-linux-musl/bin/ld: .../build/qt5base-5.15.2/src/corelib/global/qlogging.cpp:1398: undefined reference to `backtrace_symbols'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/qt5base.mk | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 4ef3759566..59c423c49c 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -234,6 +234,14 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
 
+# see qt5base-5.15.2/src/corelib/global/qlogging.cpp:110 - __has_include(<execinfo.h>)
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+QT5BASE_DEPENDENCIES += libexecinfo
+define QT5BASE_CONFIGURE_ARCH_CONFIG_LIBEXECINFO
+	printf '!host_build { \n LIBS += -lexecinfo\n }' >$(QT5BASE_ARCH_CONFIG_FILE)
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_LIBINPUT),y)
 QT5BASE_CONFIGURE_OPTS += -libinput
 QT5BASE_DEPENDENCIES += libinput
@@ -282,7 +290,7 @@ endif
 QT5BASE_ARCH_CONFIG_FILE = $(@D)/mkspecs/devices/linux-buildroot-g++/arch.conf
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 # Qt 5.8 needs atomics, which on various architectures are in -latomic
-define QT5BASE_CONFIGURE_ARCH_CONFIG
+define QT5BASE_CONFIGURE_ARCH_CONFIG_LIBATOMIC
 	printf '!host_build { \n LIBS += -latomic\n }' >$(QT5BASE_ARCH_CONFIG_FILE)
 endef
 endif
@@ -305,7 +313,8 @@ define QT5BASE_CONFIGURE_CMDS
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
 	$(QT5BASE_CONFIGURE_CONFIG_FILE)
 	touch $(QT5BASE_ARCH_CONFIG_FILE)
-	$(QT5BASE_CONFIGURE_ARCH_CONFIG)
+	$(QT5BASE_CONFIGURE_ARCH_CONFIG_LIBATOMIC)
+	$(QT5BASE_CONFIGURE_ARCH_CONFIG_LIBEXECINFO)
 	$(QT5BASE_CONFIGURE_HOSTCC)
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
