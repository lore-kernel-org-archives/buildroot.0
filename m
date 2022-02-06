Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C539C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF13960C21;
	Sun,  6 Feb 2022 10:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d86M2t0LiAcL; Sun,  6 Feb 2022 10:55:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 047E660BE4;
	Sun,  6 Feb 2022 10:55:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C91D1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A2AC4032E
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xEyh7VgSj5Wx for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:55:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9BA34032B
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:55:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7668281DF5; Sun,  6 Feb 2022 10:48:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 11:55:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 437543c7d907943a159870a4b04efa88e36cc460
X-Git-Newrev: 525ffc2bb17fa11fc128124d2d3a92d8698eaab8
X-Patchwork-Hint: ignore
Message-Id: <20220206104826.7668281DF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: allow runing on kernels
 older than used for the headers
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=525ffc2bb17fa11fc128124d2d3a92d8698eaab8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we configure glibc to not add compatibility support for
kernels older than the one used for the headers. This is on the
expectation that the system will never run on a kernel that is older
than the one used for the headers or, when Buildroot builds the kernel,
on another, older kernel.

However, in some situations, it is possible to build for a generic
system, where the kernel may be a different version. This can be the
case, for example, when Building an image that is to be used in a
container that can run on a range of machines each with different kernel
versions. In such a case, it is interesting to build glibc in a way as
to take better advantage of the newer kernels, and thus using newer
kernel headers, while still allowing running on older kernels, and thus
carrying more compatibility code.

We add an option to glibc to allow the user to enable compatibility
shims. To simplify the case, when that option is enabled, we just let
glibc enable as old compatibility shims as supported by the current
architecture.

The code size increase is very small. For an ARM Cortex-A7, with
gcc-10.3.0, the delta is as follows (other files installed by glibc had
no size delta; sizes in bytes):
    file                  | no compat | compat    | delta
    ----------------------+-----------+-----------+-------
    ld-linux-armhf.so.3   | 200216    | 200284    | +  68
    libc.so.6             | 1814496   | 1823120   | +8624
                                            ------+-------
                                            Total | +8692

No runtime overhead has been measured; the overhead is most probably
in the measurement noise. Indeed, the compatibility shims are very
lightweight. For example, there are 9 arch-generic shims:
    renameat2(), execveat(), mlock2(), statx(), faccessat2(),
    close_range(), time64-related syscall shenanigans, a waitid()
    feature, and a futex operation (LOCK_PI2)
and then each arch may define a few others. i386 has less than 20
(mostly related to socket options, and one for the ordering of the
clone() arguments), while ARM seems to have only two (mlock2() and a
configurable futex feature).

Note: however, as Arnout pointed out, some programs may still actually
fail to run even with such compatibility shim, if they really expect the
shimed syscalls to really exist and have no fallback (and/or no proper
error-handling). Still, in the vast majority of cases, those
compatibility shims are enough to have a system running.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Tested-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/glibc/Config.in | 12 ++++++++++++
 package/glibc/glibc.mk  |  8 ++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 5ecd058145..8e9ddac7d9 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -10,6 +10,18 @@ config BR2_PACKAGE_GLIBC
 	help
 	  https://www.gnu.org/software/libc/
 
+config BR2_PACKAGE_GLIBC_KERNEL_COMPAT
+	bool "Enable compatibiltiy shims to run on older kernels"
+	help
+	  Say 'y' here if you plan on running your system on a kernel
+	  older than the version used for the toolchain headers.
+
+	  Enabling those compatibility shims may generate a slightly
+	  bigger and slightly slower glibc library.
+
+	  The oldest supported kernel version depends on the
+	  architecture.
+
 config BR2_PACKAGE_GLIBC_UTILS
 	bool "Install glibc utilities"
 	help
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 9b591aa2a3..2702994c6b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -98,6 +98,10 @@ endif
 GLIBC_MAKE = $(BR2_MAKE)
 GLIBC_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"
 
+ifeq ($(BR2_PACKAGE_GLIBC_KERNEL_COMPAT),)
+GLIBC_CONF_OPTS += --enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))
+endif
+
 # Even though we use the autotools-package infrastructure, we have to
 # override the default configure commands for several reasons:
 #
@@ -128,8 +132,8 @@ define GLIBC_CONFIGURE_CMDS
 		--disable-profile \
 		--disable-werror \
 		--without-gd \
-		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
-		--with-headers=$(STAGING_DIR)/usr/include)
+		--with-headers=$(STAGING_DIR)/usr/include \
+		$(GLIBC_CONF_OPTS))
 	$(GLIBC_ADD_MISSING_STUB_H)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
