Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04600EDE990
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 08:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC0C14170E;
	Thu, 14 Sep 2023 08:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC0C14170E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8OUSBj5OvZjg; Thu, 14 Sep 2023 08:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC5CB417E1;
	Thu, 14 Sep 2023 08:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC5CB417E1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C94571BF5A2
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4ADB60F62
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4ADB60F62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lg1m0OlFMpzl for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 08:34:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA8EA60F34
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 08:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA8EA60F34
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9F0086EF2; Thu, 14 Sep 2023 08:34:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 10:28:16 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 0b02b9c17c49f2bbd7a2dfbf83fde617758438fe
X-Git-Newrev: 82ddf2070cf1612e0702a446dc24d11863876453
X-Patchwork-Hint: ignore
Message-Id: <20230914083402.A9F0086EF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] toolchain/helpers.mk:
 strengthen uClibc locale check
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

commit: https://git.buildroot.net/buildroot/commit/?id=82ddf2070cf1612e0702a446dc24d11863876453
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
(cherry picked from commit 3c8d890c1946308f5396aa6428da5274b25c3a5f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk                                                   | 2 +-
 toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 24c482923a..08ee6060b0 100644
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
index c3483f331c..37c7b82644 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -4,7 +4,6 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	depends on BR2_HOSTARCH = "x86_64"
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
