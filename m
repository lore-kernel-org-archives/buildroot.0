Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EF2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 12:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B51028281A;
	Mon, 10 Jan 2022 12:47:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5byNidVqoJQ; Mon, 10 Jan 2022 12:47:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0922281386;
	Mon, 10 Jan 2022 12:47:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A96B1BF275
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 12:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDAAF401D2
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 12:47:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXzTHpNe-h8U for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 12:47:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E67B401D1
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 12:47:33 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id ECD9D100006;
 Mon, 10 Jan 2022 12:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1641818850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y0jThsZwmmqeqD6KF1R/zoOsitaDggjjX4mhTUkAM14=;
 b=NDQ66WKFI83239qsow8iRHcSJSRToR7957vkXVVEdx36W9nVHqLgIO+THBw4lBqMLY2Ajv
 OYP6s2Ivp9hvqW+fCaR8rTfYxWdVpE4Dq8CbEoSPv6wmMvn5b5KPphU9mrmbumpoT364ea
 lhftZTaanD+pWvxRKpAeobgWvq0DFAz3xv48I59ib3MpqVYoDFORWSB2WJnfx4Yrl5KvcL
 /nODJ2yy3BfYQHAOOh/72boQATPBuAvvNhxWxbs56a3ELyVL5zOywuqplgK4xX5CfvSEmq
 cbk0cERLUuaM+EbpbGDsqZiyovQPt5phndRA7JXorh/+Xfhx3s3wWxk0i3tqtA==
From: Thierry Bultel <thierry.bultel@linatsea.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 13:46:42 +0100
Message-Id: <20220110124644.1388438-1-thierry.bultel@linatsea.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/3] package/cross-ldd: new package
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cross-ldd works just as ldd, but supports
other architectures. It is needed by dracut, for instance.
It is suffixed with "-ldd-buildroot" to avoid conflicts
with toolchains that already implement it.

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
---
Changes v1 -> v2:
  - simplified the download (suggested by Arnoult)
Changes v2 -> v3
  - changed the name to -ldd-cross, in order to avoid
    a conflict with the external toolchains that implement it
Changes v3 -> v4
  - No more Config.in. It is just a bind host-only package
  - cross-ldd.mk: added pointer to dracut documentation in
    the comment
  - Changed the suffix to -ldd-buildroot
  - No longer uses SED, but uses an actual patch for that

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
---
 .../cross-ldd/000-change-extension-name.patch | 12 ++++++++++
 package/cross-ldd/cross-ldd.mk                | 23 +++++++++++++++++++
 package/dracut/dracut                         | 15 ++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 package/cross-ldd/000-change-extension-name.patch
 create mode 100644 package/cross-ldd/cross-ldd.mk
 create mode 100644 package/dracut/dracut

diff --git a/package/cross-ldd/000-change-extension-name.patch b/package/cross-ldd/000-change-extension-name.patch
new file mode 100644
index 0000000000..74364adc88
--- /dev/null
+++ b/package/cross-ldd/000-change-extension-name.patch
@@ -0,0 +1,12 @@
+diff -purN host-cross-ldd-6c9c724ebd6a29c279c6e5734e44c07f067808ec.orig/cross-compile-ldd host-cross-ldd-6c9c724ebd6a29c279c6e5734e44c07f067808ec/cross-compile-ldd
+--- host-cross-ldd-6c9c724ebd6a29c279c6e5734e44c07f067808ec.orig/cross-compile-ldd	2022-01-06 12:25:40.144852639 +0000
++++ host-cross-ldd-6c9c724ebd6a29c279c6e5734e44c07f067808ec/cross-compile-ldd	2022-01-06 12:25:40.148852681 +0000
+@@ -19,7 +19,7 @@ sed="${SED:-sed}"
+ grep="${GREP:-grep}"
+ 
+ my_name="$( basename "${0}" )"
+-prefix="${0%-ldd}"
++prefix="${0%-ldd-buildroot}"
+ gcc="${prefix}-gcc"
+ readelf="${prefix}-readelf"
+ fake_load_addr_root="$((0xdeadbeef))"
diff --git a/package/cross-ldd/cross-ldd.mk b/package/cross-ldd/cross-ldd.mk
new file mode 100644
index 0000000000..845e819aee
--- /dev/null
+++ b/package/cross-ldd/cross-ldd.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# cross-ldd
+#
+# ldd drop-in replacement for cross-compilation toolchains.
+# This is the officially supported version mentioned
+# in the dracut documentation (see dracut/docs/README.cross)
+#
+################################################################################
+
+CROSS_LDD_VERSION = 6c9c724ebd6a29c279c6e5734e44c07f067808ec
+CROSS_LDD_SOURCE = $(CROSS_LDD_VERSION).tar.gz
+CROSS_LDD_SITE = https://gist.github.com/jerome-pouiller/c403786c1394f53f44a3b61214489e6f/archive
+CROSS_LDD_LICENSE = GPL-2.0
+
+# Notice that we change the name to '-ldd-buildroot', in order to avoid conflict
+# with some external toolchains that implement it
+
+define HOST_CROSS_LDD_INSTALL_CMDS
+	install -D -m 755 $(@D)/cross-compile-ldd $(TARGET_CROSS)ldd-buildroot
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/dracut/dracut b/package/dracut/dracut
new file mode 100644
index 0000000000..9d3db3b58e
--- /dev/null
+++ b/package/dracut/dracut
@@ -0,0 +1,15 @@
+#!/bin/bash
+
+set -e
+set -x
+
+if [ -z "$*" ]; then
+    echo "No argument supplied"
+    exit
+fi
+
+DRACUT_LDD=${TARGET_CROSS}ldd-cross \
+DRACUT_INSTALL="${HOST_DIR}/lib/dracut/dracut-install" \
+dracutbasedir=${HOST_DIR}/usr/lib/dracut \
+dracutsysrootdir=${TARGET_DIR} \
+${HOST_DIR}/bin/dracut "$@"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
