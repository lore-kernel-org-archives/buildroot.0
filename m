Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EBACA101F
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 16:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13D6E4218D;
	Sun,  7 Sep 2025 16:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ceOKAMgu81fC; Sun,  7 Sep 2025 16:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461E141927
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 461E141927;
	Sun,  7 Sep 2025 16:42:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A035CA
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B89241927
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_1pg6zCzIiF for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 16:42:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 515AD41542
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 515AD41542
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:42:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 402DD83751; Sun,  7 Sep 2025 16:42:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Sep 2025 17:47:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50bc5aa17b320d91809048d5ef6a110f8c0b9157
X-Git-Newrev: b45400dad416d174459ccafc1ec223b984434a5b
X-Patchwork-Hint: ignore
Message-Id: <20250907164243.402DD83751@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: do build-time detection
 of non-working toolchain
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b45400dad416d174459ccafc1ec223b984434a5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to Python 3.13.2 in commit
d63e207eb869063f82c867658676c2903beb08cb, there is a runtime assertion
in Python when the toolchain doesn't support time64 [1]. The only such
toolchain is one with uClibc and linux headers < 5.1.

Encoding this dependency in Config.in was deemed to complicated (cfr.
commit ffd00280315e60908d0d317b1dfb4c714590a03e).

Instead, do a build-time check of the same condition. The check itself
is a bit complicated, but it is localized to python3.mk and doesn't need
to be propagated to all reverse dependencies.

Testing such a corner case toolchain is a bit complicated. It can be
done with the following configuration.

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2018.02-1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_PYTHON3=y

It needs to be built in an environment that has libmpfr.so.4 installed
as the pre-built toolchain from that era did not include it. An easy
way to achieve this is to build this configuration under an old
Buildroot Docker container:

IMAGE=buildroot/base:20180205.0730 ./utils/docker-run make python3

With a build-time check, the autobuilders could get build failures when
generating such a config. However, the autobuilders cannot use a
toolchain with this configuration (they only use more recent
toolchains). Therefore, no update to genrandconfig is needed.

[1] https://gitlab.com/buildroot.org/buildroot/-/issues/95#note_2348479811

Cc: Vincent Fazio <vfazio@xes-inc.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python3/python3.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ef0658262a..1546915f08 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -315,3 +315,11 @@ define PYTHON3_REMOVE_OPTIMIZED_PYC_FILES
 		xargs -0 --no-run-if-empty rm -f
 endef
 PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_OPTIMIZED_PYC_FILES
+
+# uClibc without time64 support (i.e. when linux headers < 5.1) causes
+# a runtime assertion in Python. Encoding this as a dependency in Config.in
+# causes too many problems for propagating reverse dependencies. Therefore
+# instead we do a build time check.
+ifeq ($(BR_BUILDING)$(BR2_PACKAGE_PYTHON3)$(BR2_TOOLCHAIN_USES_UCLIBC)-$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1),yyy-)
+$(error Python3 doesn't work with uClibc and kernel headers < 5.1. Please use a different toolchain or unselect Python3.)
+endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
