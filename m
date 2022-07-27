Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269ABC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 12:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1874409F7;
	Wed, 27 Jul 2022 12:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1874409F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9wq8MvGgC84m; Wed, 27 Jul 2022 12:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C0B54094B;
	Wed, 27 Jul 2022 12:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C0B54094B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C53161BF372
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 12:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A005A40154
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 12:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A005A40154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TuD-0KZ0Jg-D for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 12:55:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 801D740518
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 801D740518
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 12:55:10 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j7so2130859wrh.3
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 05:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yaHUEqQzZMmDVpnz4xH8qmU8Az0+7/7f/bR0iTnIOh4=;
 b=77kQSX+LtulZVAtivElvyqjqQqM/mplhtAJlF71B9LkniB/+YLfE6nQh/POfIx/x59
 cByD2ZZhjMvgUEMcIKOJKOAO3qi8bsQipr8h5HBFKKs+IvOHwT4xH3t+wokMEE7K2c4B
 yVI3ebvTTuOG8GA4J9e6vMkMICSt8Ghjjg+nRymNWh03poJTilq/AtWIuUIaZAVqiryz
 PZiId3FhAdOmAD52imwLLVuo+eZZmQjJcFOBTCcbzZ5b93RrICpkdKdlLc9NkyHch0lh
 sPI3cFQr4BZtrtD7TURwFgi5kHktgGbVhMZm2LI2JX7H3VOudY00S6pGUfG2jFDzs2gw
 YIew==
X-Gm-Message-State: AJIora9LLDW8pzBW+BgOk318fASJkuQHlAEKobEH+c4gj1XwIIKnGkph
 h62Nsur8iC36cxJ4+4VPQLnLuWqN5DfxQQ==
X-Google-Smtp-Source: AGRyM1u6anYzzfqOzKaHfP04QyFJxJe6GN4QO1GkVGiQ0wwt7CY7OgRF5exY46kMaAODLFH8YGvi7w==
X-Received: by 2002:a05:6000:1885:b0:21d:ae7a:4f97 with SMTP id
 a5-20020a056000188500b0021dae7a4f97mr14419600wri.74.1658926508341; 
 Wed, 27 Jul 2022 05:55:08 -0700 (PDT)
Received: from nitra.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 c1-20020adffb01000000b0021e30e9e44asm17126425wrr.53.2022.07.27.05.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 05:55:07 -0700 (PDT)
From: Nicolas Tran <nicolas.tran@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 14:55:04 +0200
Message-Id: <20220727125504.2177588-1-nicolas.tran@smile.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yaHUEqQzZMmDVpnz4xH8qmU8Az0+7/7f/bR0iTnIOh4=;
 b=WsMPxtQxyj+tdPhK2zeihhukqPCZ0JwTy7DzGyhlkLBZT01/esnsooa2CGabsaUUBz
 zd+AFLCxiIMptmYM2zykGfT6ufDoZZJc1UpKO+B4blebDG0+5ySq9Ruiktsm+/xaPvyE
 Z6OvdfArhsrLZMGYBA2JPrW1vIJOsulEE4PPXjYVHsaECGpECEHswpiOVkFTHfIg25wX
 3wzD+k1pkEfdhALPMjN4ahYs0tNZVLWwncDHOArIlz5nWVmPSaOBQ86dFE9UFAeg8FqR
 Dq0DsG5is3H0vmiP2TL/w5POCgpZOGztM0g+AIxx/oJPi7YI2YzmtO+qc3yv6+Yz/uNR
 EQgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=WsMPxtQx
Subject: [Buildroot] [PATCH v4] package/dust: new package
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
Cc: Nicolas Tran <nicolas.tran@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dust is an alternative of the command du from the Linux kernel,
written in Rust. It aims to be more intuitive and visual in order
to give the user a better view of his system's storage capacity.

Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
---

The package has been checked with correct formatting and
without typos:
$ ./utils/check-package package/dust/*

Tests have been run using test-pkg:
$ ./utils/test-pkg -c dust.config -p dust

test-pkg config:
To run the test, the file dust.config contains the following line
BR2_PACKAGE_DUST=y

Results:
     bootlin-armv5-uclibc [1/6]: SKIPPED
      bootlin-armv7-glibc [2/6]: OK
    bootlin-armv7m-uclibc [3/6]: SKIPPED
      bootlin-x86-64-musl [4/6]: OK
       br-arm-full-static [5/6]: SKIPPED
             sourcery-arm [6/6]: OK

This PATCH v4 contains an updated value of the dust tarball's hash.
It was wrong in the previous patch because I made a $ make dust-dirclean
without removing the sources in the dl/ directory while I trying to
update the package from the v0.8.1-alpha.2 to the v0.8.1.
Moreover, tests have been rerun successfully.

Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/dust/Config.in | 11 +++++++++++
 package/dust/dust.hash |  3 +++
 package/dust/dust.mk   | 12 ++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/dust/Config.in
 create mode 100644 package/dust/dust.hash
 create mode 100644 package/dust/dust.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 270fc52de1..9938acb2fa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2184,6 +2184,7 @@ F:	package/exiv2/
 F:	package/ofono/
 
 N:	Nicolas Tran <nicolas.tran@smile.fr>
+F:	package/dust/
 F:	package/hyperfine/
 
 N:	Niklas Cassel <niklas.cassel@wdc.com>
diff --git a/package/Config.in b/package/Config.in
index f039d83113..f93ff56c8d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -211,6 +211,7 @@ menu "Filesystem and flash utilities"
 	source "package/curlftpfs/Config.in"
 	source "package/davfs2/Config.in"
 	source "package/dosfstools/Config.in"
+	source "package/dust/Config.in"
 	source "package/e2fsprogs/Config.in"
 	source "package/e2tools/Config.in"
 	source "package/ecryptfs-utils/Config.in"
diff --git a/package/dust/Config.in b/package/dust/Config.in
new file mode 100644
index 0000000000..7b6e9304bc
--- /dev/null
+++ b/package/dust/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DUST
+	bool "dust"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  dust is an alternative written in Rust of the command "du"
+	  from the Linux kernel. It aims to be more intuitive and visual
+	  in order to give the user a better view of his system's
+	  current storage capacity.
+
+	  https://github.com/bootandy/dust.git
diff --git a/package/dust/dust.hash b/package/dust/dust.hash
new file mode 100644
index 0000000000..d4f6bff4e4
--- /dev/null
+++ b/package/dust/dust.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  271cc0f1978049b2dbfece633b85d4dd0184df346bd93720062c13e4332f2549  dust-0.8.1.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/dust/dust.mk b/package/dust/dust.mk
new file mode 100644
index 0000000000..2cffc336a9
--- /dev/null
+++ b/package/dust/dust.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# dust
+#
+################################################################################
+
+DUST_VERSION = 0.8.1
+DUST_SITE = $(call github,bootandy,dust,v$(DUST_VERSION))
+DUST_LICENSE = APACHE-2.0
+DUST_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
