Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D11C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 14:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2E2882F77;
	Tue, 11 Jan 2022 14:55:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jlnvxZ2Qe5Li; Tue, 11 Jan 2022 14:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10E3682FA9;
	Tue, 11 Jan 2022 14:55:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5229A1BF345
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 14:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DA5F82FA9
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 14:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EXZFstaw2B-u for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 14:55:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27E0982F77
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 14:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dm10LxKbih2UniZv6olfnv2imIpSlvJz95InKM/OF6E=; b=FgKbLzJp65ADsCNK2OFsg3UbRu
 Ivl+7Lb5/WCgiztAPRVLJASGUgq+M1T2j5p1y25rHm7Ka2UcZ0brQioS+pfwDH7EuGyksHRBEzaZH
 2JsrVfO7jlCV0LJBPd+GmfjM4uI6GD5zn6aHA3xcIy4E5Yyoxoq/V1QdghF5dCcCFgUN7/KlodNIG
 bXmJ0MVYIfefUcZ9pt8gEg+uSaaG4ChrASIMf4i+VqJcX5thgiIdMHQQYi+R+X97CEAIdAzSUCWlf
 53p4KzgjOIm1ML//JjxkvVjG8El4AdZRQHR3eIoTeFm4Bj+0BXMqiYwsUYA7Fx6lo6a520BNy0dob
 0a3NcFzQ==;
Received: from 91-153-34-128.elisa-laajakaista.fi ([91.153.34.128] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1n7IYk-0009f3-BJ; Tue, 11 Jan 2022 15:55:38 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 64f98361;
 Tue, 11 Jan 2022 14:55:28 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 16:55:27 +0200
Message-Id: <20220111145527.3422053-1-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RFC 1/1] package/wpewebkit: use ninja for faster
 builds
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instruct CMake to use the Ninja generator, and override build/install
commands to use Ninja instead, which results in faster builds. The
host-ninja package is required to build some of the dependencies used
by wpewebkit (e.g. libepoxy) so in practice this is not introducing
a new host dependency that would slow down the build.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.mk | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 64c179534f..2cbed60cb3 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -14,11 +14,12 @@ WPEWEBKIT_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
 WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
-WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby \
+WPEWEBKIT_DEPENDENCIES = host-gperf host-ninja host-python3 host-ruby \
 	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
 	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
 
 WPEWEBKIT_CONF_OPTS = \
+	-GNinja \
 	-DPORT=WPE \
 	-DENABLE_ACCESSIBILITY=OFF \
 	-DENABLE_API_TESTS=OFF \
@@ -101,4 +102,24 @@ ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS
 WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
+define WPEWEBKIT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(WPEWEBKIT_NINJA_ENV) \
+		$(BR2_CMAKE) --build $(WPEWEBKIT_BUILDDIR) -- $(NINJA_OPTS) $(WPEWEBKIT_NINJA_OPTS)
+endef
+
+define WPEWEBKIT_INSTALL_CMDS
+	$(TARGET_MAKE_ENV) $(WPEWEBKIT_NINJA_ENV) \
+		$(BR2_CMAKE) --install $(WPEWEBKIT_BUILDDIR)
+endef
+
+define WPEWEBKIT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(WPEWEBKIT_NINJA_ENV) DESTDIR=$(STAGING_DIR) \
+		$(BR2_CMAKE) --install $(WPEWEBKIT_BUILDDIR)
+endef
+
+define WPEWEBKIT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(WPEWEBKIT_MAKE_ENV) DESTDIR=$(TARGET_DIR) \
+		$(BR2_CMAKE) --install $(WPEWEBKIT_BUILDDIR)
+endef
+
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
