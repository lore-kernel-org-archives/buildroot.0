Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4183CC83F14
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4452417F8;
	Wed, 30 Aug 2023 21:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4452417F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4Tqv9aggHEV; Wed, 30 Aug 2023 21:44:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA194417F6;
	Wed, 30 Aug 2023 21:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA194417F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D2C71BF405
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 639F28176F
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 639F28176F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id de20ulea-gqt for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:44:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78E2C8179D
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E2C8179D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64C2D86640; Wed, 30 Aug 2023 21:44:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 23:44:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fa3a239ac21a3ea1175303bc9b1293571a43979
X-Git-Newrev: 3c8d890c1946308f5396aa6428da5274b25c3a5f
X-Patchwork-Hint: ignore
Message-Id: <20230830214451.64C2D86640@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/helpers.mk: strengthen uClibc
 locale check
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3c8d890c1946308f5396aa6428da5274b25c3a5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, when verifying the configuration of a uClibc toolchain for
the presence of locale support, we check __UCLIBC_HAS_LOCALE__. It
turns out that we in fact also expect __UCLIBC_HAS_XLOCALE__ to be
defined, as without it locale_t is not defined, causing build failure
in some packages, such as libcpprestsdk:

In file included from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/include/cpprest/json.h:18,
                 from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/src/pch/stdafx.h:88,
                 from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/src/http/client/http_client_msg.cpp:13:
/home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/include/cpprest/asyncrt_utils.h:317:13: error: 'locale_t' does not name a type
  317 |     typedef locale_t xplat_locale;
      |             ^~~~~~~~

As essentially our requirement for uClibc in external toolchains is
"it should match the uClibc configuration used by Buildroot for
internal toolchains", it makes sense to verify
__UCLIBC_HAS_XLOCALE__. Note that of course checking
__UCLIBC_HAS_XLOCALE__ is sufficient, as it cannot be enabled if
__UCLIBC_HAS_LOCALE isn't.

This addresses an issue with the Synopsys ARC external toolchain,
which is built with __UCLIBC_HAS_LOCALE__, but without
__UCLIBC_HAS_XLOCALE__ causing a build failure with some
packages (such as libcpprestsdk).

Therefore, this patch also changes how the Synospys ARC external
toolchain is exposed in Buildroot: it no longer advertise locale
support.

Fixes:

  http://autobuild.buildroot.org/results/e6778e60cc1ea455f5b4511d5824f04d8040f67b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/helpers.mk                                                   | 2 +-
 toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 27a5470ca3..e5c838c0af 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -307,7 +307,7 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,,$${UCLIBC_CONFIG_FILE},Large file support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_TOOLCHAIN_HAS_NATIVE_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_XLOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS__,BR2_TOOLCHAIN_HAS_THREADS,$${UCLIBC_CONFIG_FILE},Thread support) ;\
 	$(call check_uclibc_feature,__PTHREADS_DEBUG_SUPPORT__,BR2_TOOLCHAIN_HAS_THREADS_DEBUG,$${UCLIBC_CONFIG_FILE},Thread debugging support) ;\
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index 985e7b1710..292e652fb0 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -5,7 +5,6 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_ENABLE_LOCALE
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
