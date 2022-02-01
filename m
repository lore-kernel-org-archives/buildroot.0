Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD9BC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 14:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B9F7409A9;
	Tue,  1 Feb 2022 14:00:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12ZdTs--H9qC; Tue,  1 Feb 2022 14:00:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5704409C9;
	Tue,  1 Feb 2022 14:00:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B7051BF328
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 14:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57E78408C4
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 14:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hl2n7dtXg6Ry for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 14:00:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCD80409F7
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 14:00:22 +0000 (UTC)
Received: from opfednr02.francetelecom.fr (unknown [xx.xx.xx.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr23.francetelecom.fr (ESMTP service) with ESMTPS id 4Jp65J2LWKz5vrr
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 15:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1643724020;
 bh=copfCSgsYbSOZSzXiHO/hZCZGJQ7h08BlR/EElQ4N2U=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=EmNklVt2qbV4+1DJemgS81Ap4NnI4t1xvmTlK9aQRBfPVOz/gDFmuh+ZsHVh3P2Rc
 JPOvOTsH4A97ZCFmr2xJ7jNIdOuGYUYT+Lv4HR/qEW4iZSM1C4nqLzxYMm1Y6B0seg
 Pf6trc+W6vB37Eayx3ANZJmhDP1x/jGRp/iJKITle+JepPjfj8V9Bb61ugg/CXdmOl
 UV+FkgYMQ1gtrT6NheW8RUIMYfBsv+ME1uImTWyUUphveR4EkXnaROftoMVXS3xCpl
 btq7KLqouyTv3aYSOIjhJnRUEQJD8njgEuvwrgkHSQ8KAFyT/RvlfwA1341bb2Euci
 mLE+ParpHo6iw==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 01 Feb 2022 15:00:06 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 1 Feb 2022 15:00:06 +0100
Message-ID: <12945_1643724020_61F93CE8_12945_430_1_dfe1b340bf9e8e2c47987f28f8fd40cca7d16b3b.1643724006.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.52]
X-ClientProxiedBy: OPE16NORMBX101.corporate.adroot.infra.ftgroup (10.115.26.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH] package/glibc: allow runing on kernel older
 than used for the headers
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>,
 Frederic GARDES <frederic.gardes@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Currently, we configure glibc to not add compatibility support for
kernel older than the one used for the headers. This is on the
expectation that the system will never run on a kernel that is older
than the one used for the headers and, when Buildroot builds the kernel,
on another, older kernel.

However, in some situations, it is possible to build for a generic
system, where the kernel may be a different version. This can be the
case, for example, when Building an image that is to be used in a
container that can run on a range of machines each with different kernel
versions. In such a case, it is interesting to build glibc in a way as
to take better advantage of the newer kernels, and thus using newer
kernel headers, while still allowing running onn older kernels, and thus
carrying more compatibility code.

We add an option to glibc to be allow the user to provide the oldest
kernel version they expect to use, and use that if specified; if not
specified (the default), use the version of the kernel headers as was
done previously.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Frederic GARDES <frederic.gardes@orange.com>
---
 package/glibc/Config.in | 12 ++++++++++++
 package/glibc/glibc.mk  |  5 ++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 5ecd058145..01da045ce7 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -10,6 +10,18 @@ config BR2_PACKAGE_GLIBC
 	help
 	  https://www.gnu.org/software/libc/
 
+config BR2_PACKAGE_GLIBC_KERNEL_COMPAT
+	string "Oldest kernel version supported"
+	help
+	  If you plan on running on various kernel versions, enter the
+	  oldest version you expect to run on here.
+
+	  Note that the older the version, the more backward compatibility
+	  code is added, and the slower the code may get.
+
+	  Leave it empty (the default) to use the same version as used for
+	  the kernel headers.
+
 config BR2_PACKAGE_GLIBC_UTILS
 	bool "Install glibc utilities"
 	help
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5c26b0e6df..43015417c2 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -98,6 +98,9 @@ endif
 GLIBC_MAKE = $(BR2_MAKE)
 GLIBC_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"
 
+GLIBC_KERNEL_VERSION = $(or $(call qstrip,$(BR2_PACKAGE_GLIBC_KERNEL_COMPAT)), \
+			    $(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)))
+
 # Even though we use the autotools-package infrastructure, we have to
 # override the default configure commands for several reasons:
 #
@@ -128,7 +131,7 @@ define GLIBC_CONFIGURE_CMDS
 		--disable-profile \
 		--disable-werror \
 		--without-gd \
-		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
+		--enable-kernel=$(GLIBC_KERNEL_VERSION) \
 		--with-headers=$(STAGING_DIR)/usr/include)
 	$(GLIBC_ADD_MISSING_STUB_H)
 endef
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
