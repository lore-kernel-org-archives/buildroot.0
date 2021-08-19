Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BCCC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:47:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FFE9610A0
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FFE9610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69BD1819FC;
	Thu, 19 Aug 2021 20:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tYcopAMUwcd; Thu, 19 Aug 2021 20:47:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF51681A46;
	Thu, 19 Aug 2021 20:47:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6BD21BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3EED613D6
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:46:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9YcHNB8ReTTv for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:46:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E114613D4
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:46:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1E36E8D5AC; Thu, 19 Aug 2021 20:46:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:46:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 338a9b655dd955131c1af8fccebabfb4be1857d6
X-Git-Newrev: 8831c0db9e81db6f53e44597b7b4e74bff43d0cf
X-Patchwork-Hint: ignore
Message-Id: <20210819204608.1E36E8D5AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: fix NLS build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8831c0db9e81db6f53e44597b7b4e74bff43d0cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

/tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/util/libvirt_util.a(viralloc.c.o): in function `virInsertElementsN':
viralloc.c:(.text+0x167): undefined reference to `libintl_dgettext'

Fixes:
 - http://autobuild.buildroot.net/results/2349c55a4a42f08ca52700c60cda3065b0c4bd88

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvirt/libvirt.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index b36cf3fb60..1b420771f5 100644
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
