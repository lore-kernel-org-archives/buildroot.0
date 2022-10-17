Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981BFC433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 15:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4091A404EC;
	Mon, 17 Oct 2022 15:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4091A404EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y29-TEACSesz; Mon, 17 Oct 2022 15:18:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58114404D5;
	Mon, 17 Oct 2022 15:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58114404D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30FC71BF2A5
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 15:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D19C60AC0
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 15:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D19C60AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bFR3zv1_GIMV for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 15:17:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2B0D607C7
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2B0D607C7
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 15:17:44 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id k2so25709198ejr.2
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 08:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zLEeryzKSjNYulYTu4BTis5eM6pqjzy6FpZyLm7y+TQ=;
 b=l6umUXReeBjQgqLeFXDioNbHV00UwoCOA9MIHRY3rmVcUuhElGQQ7BQadE18iIDhVW
 JDhompCTrJH9Sane1dwnyVkGv7Q/U2FFIl+J5+NZcyEMysZ/+qxnZcgrFnnOjUqlA3dH
 WbpeYCfNmy+9lr2qt7fs4aED5E4Rwz7Ea3CIexIHQp5By4vwqOVp8bOn+ZiZCfDy4exE
 cS2yNVoQ2R/Xf/xsY5QlOpuCRnmi9rtJVFwcb72+OcmnLILmvtRNN4Fbo0aCArqrVoA1
 9BBWfKypv5gCQWGC3+Y08jejJD7FuLy1ls1uCQ4pZ4NF6HuLfsPVz5HiK+VN2B2wqduh
 endw==
X-Gm-Message-State: ACrzQf3u+nwjQF7wx/EXpCv2QejcgNmc/xbN0r0aHH+CMqVvNfhm/lMN
 gfnGV7UqF025jrngYq2OPdOALXcLqVKL/eqj
X-Google-Smtp-Source: AMsMyM6ZzHEJY7b6Dkr1fWm6Gbikfr7PWsEleOInqNmx/y23Y8O4ndq0qeIisItIKX6xlDfd2BSO5g==
X-Received: by 2002:a17:907:25c5:b0:783:f5df:900e with SMTP id
 ae5-20020a17090725c500b00783f5df900emr8798642ejc.491.1666019862323; 
 Mon, 17 Oct 2022 08:17:42 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2788:1a4:785::9])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a50d48b000000b00458947539desm7471904edi.78.2022.10.17.08.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 08:17:40 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 17:17:25 +0200
Message-Id: <20221017151726.44005-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20221017151726.44005-1-thomas.perale@mind.be>
References: <20221017151726.44005-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLEeryzKSjNYulYTu4BTis5eM6pqjzy6FpZyLm7y+TQ=;
 b=WaK+/rtL+44fdVrVWU2mNllHPkU+K6EmQx2NHlsayuP0CClfvsAbQZh87Czs4jw/fM
 IwktUOAOV8hqvUBymEmE9tIkv5YPt4MDD9Cn7qyRru41jy7KscPZPH3oZ/2AHbQelfNA
 +6VstCP/bc4UhB81jdkezxB8RjqgJz5EmyWslTx/ZFro3NvtuAirRhVkzABsv1rkWmMY
 zuVpHTY/qmK7xR6hpQZI4/LrsvTHppIljp4z7P8ELIY5HwwEtT7hYPlaiEgVYj9DMQZ/
 X14KeMpEB2kL39+Uw3tQPAUtN5kZ8smc6a0KM5L50VLPQIez63/bHNSFUr/qIZmArswy
 UMlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=WaK+/rtL
Subject: [Buildroot] [PATCH 3/4] package/go-bin: new package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides a pre-built version of the go compiler for the
host target.
This enable the user to select between the pre-built and the compiled
version of the go compiler. The pre-built version will be used by
default when a go compiler is required.

The virtual package 'goc' creates a menu that let the user select which
variant of the go compiler to use.

The supported host platform for the pre-built compiler are actually the
same as the one for 'go-bootstrap' no further verification are required
than the one already in place.

For now GO_BIN_VERSION and GO_VERSION are set the same by hand but in
next version this variable should be in common. Because the order of the
'.mk' file is not guaranteed this will be investigated in a next patch.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/Config.in.host        |  1 +
 package/go-bin/Config.in.host |  5 +++++
 package/go-bin/go-bin.hash    |  4 ++++
 package/go-bin/go-bin.mk      | 20 ++++++++++++++++++++
 package/goc/Config.in.host    | 26 +++++++++++++++++++++++++-
 5 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 package/go-bin/Config.in.host
 create mode 100644 package/go-bin/go-bin.hash
 create mode 100644 package/go-bin/go-bin.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 8c44ff0cb4..95b59bdacc 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -37,6 +37,7 @@ menu "Host utilities"
 	source "package/genpart/Config.in.host"
 	source "package/gnupg/Config.in.host"
 	source "package/go/Config.in.host"
+	source "package/go-bin/Config.in.host"
 	source "package/go-bootstrap/Config.in.host"
 	source "package/goc/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
diff --git a/package/go-bin/Config.in.host b/package/go-bin/Config.in.host
new file mode 100644
index 0000000000..392060584f
--- /dev/null
+++ b/package/go-bin/Config.in.host
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH
+	string
+	default 386      if BR2_HOSTARCH = "x86"
+	default amd64    if BR2_HOSTARCH = "x86_64"
+	default arm64    if BR2_HOSTARCH = "arm"
diff --git a/package/go-bin/go-bin.hash b/package/go-bin/go-bin.hash
new file mode 100644
index 0000000000..91456d3e9a
--- /dev/null
+++ b/package/go-bin/go-bin.hash
@@ -0,0 +1,4 @@
+# sha256 checksum from https://go.dev/dl/
+sha256  9acc57342400c5b0c2da07b5b01b50da239dd4a7fad41a1fb56af8363ef4133f  go1.19.1.linux-386.tar.gz
+sha256  acc512fbab4f716a8f97a8b3fbaa9ddd39606a28be6c2515ef7c6c6311acffde  go1.19.1.linux-amd64.tar.gz
+sha256  49960821948b9c6b14041430890eccee58c76b52e2dbaafce971c3c38d43df9f  go1.19.1.linux-arm64.tar.gz
diff --git a/package/go-bin/go-bin.mk b/package/go-bin/go-bin.mk
new file mode 100644
index 0000000000..cf2db90532
--- /dev/null
+++ b/package/go-bin/go-bin.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# go-bin
+#
+################################################################################
+
+GO_BIN_VERSION = 1.19.1
+GO_BIN_SITE = https://go.dev/dl
+GO_BIN_LICENSE = BSD-3-Clause
+GO_BIN_LICENSE_FILES = LICENSE
+
+HOST_GO_BIN_PROVIDES = host-goc
+
+HOST_GO_BIN_SOURCE = go$(GO_BIN_VERSION).linux-$(call qstrip, $(BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH)).tar.gz
+
+define HOST_GO_BIN_INSTALL_CMDS
+	$(HOST_GO_INSTALL_CMDS)
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/goc/Config.in.host b/package/goc/Config.in.host
index b0266b50ea..0bde50982f 100644
--- a/package/goc/Config.in.host
+++ b/package/goc/Config.in.host
@@ -8,8 +8,32 @@ config BR2_PACKAGE_HOST_GOC
 
 if BR2_PACKAGE_HOST_GOC
 
+choice
+	prompt "Go compiler variant"
+	default BR2_PACKAGE_HOST_GO_BIN
+	help
+	  Select a Go compiler variant.
+
+	  Default to 'host-go-bin'.
+
+config BR2_PACKAGE_HOST_GO
+	bool "host go"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  This package will build the go compiler for the host.
+
+config BR2_PACKAGE_HOST_GO_BIN
+	bool "host go (pre-built)"
+	help
+	  This package will install pre-built versions of the compiler
+	  for the host.
+
+endchoice
+
 config BR2_PACKAGE_PROVIDES_HOST_GOC
 	string
-	default "host-go"
+	# Default to host-go-bin
+	default "host-go-bin" if BR2_PACKAGE_HOST_GO_BIN
+	default "host-go" if BR2_PACKAGE_HOST_GO
 
 endif
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
