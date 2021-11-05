Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587DBC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 17:32:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C347260EB4
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 17:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C347260EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5439282871;
	Fri,  5 Nov 2021 17:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6n6P_qhEX_c; Fri,  5 Nov 2021 17:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B033C82865;
	Fri,  5 Nov 2021 17:32:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F12B51BF59C
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 17:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E13354079E
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 17:32:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tt-B6NSq6HpV for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 17:32:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1A054078F
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 17:32:43 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u18so14844228wrg.5
 for <buildroot@buildroot.org>; Fri, 05 Nov 2021 10:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8dHRExih+SQVw+nCnu+oqgpgfd6eLoPk+COGsmff2fc=;
 b=WdCdi7i/fbwnURSUuWOBD3hJNUnnutZlaLhtNSMMYTj+lHHtaoSzcQsBTCFa0Tw6jQ
 cQjJmFMW+K+lPtKNzSoo2M3ylITbFuHhrub3pMTBqL8eJEOF3i5ggP86C6dCxAtIZSaA
 wC0i/bv2msmpiQYcmLhxX9uFQmZ1GwDS0ayDb+XnbT1ozlLCuFmQF+Wruu/M3lAvciVr
 M4eIrlPLGYB43eTVtpUo6UjBPc+CrVpziHfp5Cnc7T3LCwVcKNuGBlKJjpRkhk65MAsU
 YTh3HKuQ+i7xlH1ihwzroU0pWnThVU5UZUJ/xOE1cEY12xhtbWt+3WZlK0cTy4Ik4itK
 /SkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8dHRExih+SQVw+nCnu+oqgpgfd6eLoPk+COGsmff2fc=;
 b=3hWXOa9PYhU8KGeu0mbko13qmigLJdE9G4oHTq5CLC1IUXmPiJkmXcayojSWWh3TER
 gF6YwD3bE5lczkMx3UYdUUbAqekkJAUV7WZwB1yfe26879olMLVkdNtaH8ZOCus2STUB
 k+e26nIC5PCc+5pAN2MC6TmHC40Z8M+7DR+7vVItpAyK8g3ibGIOuQWtBzRPuRumXg1I
 N9kIRDSUqL4XCHtWeu6MiABcBe16q6kSwfwFQBiE3M1DGowq7voAUnV00urtjN68WvT8
 V4QGUnA7xyQU8MTvK51RSZvfkhx6RN6RZfg7UyRDwyR4J+dKKN1jqFk1CcBo6FE+5tDa
 s32Q==
X-Gm-Message-State: AOAM532haLMzdQvLfPbiFPwVEZTTOfbG0so/msMX3mh3k6CNqwVyQJ3X
 fsWprge4JNkFLlrBONjZ5m7W6Rb9wMA=
X-Google-Smtp-Source: ABdhPJzzBiaC6qn2Tx4/yjpB08HvxdS+++e/OCKTd6GRRYEGmEFl5Dl3rt4v89KyKQCoz23b9o3sKQ==
X-Received: by 2002:adf:cc8d:: with SMTP id p13mr69880635wrj.274.1636133561599; 
 Fri, 05 Nov 2021 10:32:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id m2sm11471397wml.15.2021.11.05.10.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 10:32:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 18:30:48 +0100
Message-Id: <20211105173048.2483666-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/netdata: add prometheus remote
 write backend support
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

prometheus remote write backend depends on protobuf and snappy and is
enabled by default since the addition of the package in commit
1d2bb469078b5818aa2390b9868cd632200f17a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netdata/Config.in  | 19 +++++++++++++++++++
 package/netdata/netdata.mk | 10 ++++++++++
 2 files changed, 29 insertions(+)

diff --git a/package/netdata/Config.in b/package/netdata/Config.in
index 88f88cb7ed..34d139125d 100644
--- a/package/netdata/Config.in
+++ b/package/netdata/Config.in
@@ -16,6 +16,25 @@ config BR2_PACKAGE_NETDATA
 
 	  https://github.com/netdata/netdata
 
+if BR2_PACKAGE_NETDATA
+
+config BR2_PACKAGE_NETDATA_PROMETHEUS
+	bool "prometheus remote write backend"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf, snappy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_SNAPPY
+	help
+	  Enable prometheus remote write backend
+
+comment "prometheus remote write backend needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+
+endif
+
 comment "netdata needs a toolchain w/ NPTL, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 34365cbf56..ac717d56b0 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -60,6 +60,16 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 NETDATA_CONF_ENV += LIBS=-latomic
 endif
 
+ifeq ($(BR2_PACKAGE_NETDATA_PROMETHEUS),y)
+# Override the result of AC_PATH_PROG([CXX_BINARY], [${CXX}], [no])
+# which fails because CXX is set to the full CXX binary path
+NETDATA_CONF_ENV += ac_cv_path_CXX_BINARY=yes
+NETDATA_CONF_OPTS += --enable-backend-prometheus-remote-write
+NETDATA_DEPENDENCIES += protobuf snappy
+else
+NETDATA_CONF_OPTS += --disable-backend-prometheus-remote-write
+endif
+
 define NETDATA_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/netdata/S60netdata \
 		$(TARGET_DIR)/etc/init.d/S60netdata
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
