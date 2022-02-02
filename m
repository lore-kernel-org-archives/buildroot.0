Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E4BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 13:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F7B140462;
	Wed,  2 Feb 2022 13:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLyIV1VMAY0p; Wed,  2 Feb 2022 13:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FB0A404AF;
	Wed,  2 Feb 2022 13:48:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08D4A1BF337
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 13:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7F4C8148B
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 13:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2it52GGJyG88 for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 13:48:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0A0681489
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 13:48:42 +0000 (UTC)
Received: from opfednr01.francetelecom.fr (unknown [xx.xx.xx.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr25.francetelecom.fr (ESMTP service) with ESMTPS id 4JpjnN1PDvzCqsy; 
 Wed,  2 Feb 2022 14:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1643809720;
 bh=3LAavoB/cwFQNAD9JnhVTe/TALWKP2jWkptjozxUMvk=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=fvs6fyKWzrtUCgJ7DqMXkKW54JSLsA2O9+6RMyOPW92Z3XWpUEHcy8Wu9D2w8G4Le
 0DTzZe+2XeiLE1CUdBNWEyl6bbrkExVuNfumJhAgxqLViFArWBcEAOHMwMKH1VytNP
 oa2TV6rr1k6ZlxAadSylsl2Q/N6B9Us08IqkKRZ6EuNJAATqGY4bvZZlTtamL6Ffxk
 JEOwb6XgkTXpUwYSKwCeQp9wSfrmm/pAj+POEle1znLiC/CBt+JuM+vlKuGFW1RNBA
 xHH39zklJhjguEsbinh+GLPifXFUCGUAurcG6pbf4XqOC/HfS6NB5i5bKOz/HdfDxm
 IB60LtUVd5vaQ==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 02 Feb 2022 14:48:38 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Wed, 2 Feb 2022 14:48:38 +0100
Message-ID: <19291_1643809720_61FA8BB8_19291_487_24_41ca9ce22939ce2ed0c41973db7d612542850824.1643809712.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX106.corporate.adroot.infra.ftgroup (10.115.27.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCHv2] package/glibc: allow runing on kernels older
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
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

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

---
Changes v1 -> v2:
  - don't let user provide a version, enable all compat shims  (Arnout,
    Alexey)
  - add size measurements and explanations about no runtime overhead
    measurements  (Arnout)
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
index 5c26b0e6df..9ea9f27a2f 100644
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
