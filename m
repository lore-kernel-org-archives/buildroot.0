Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD08AC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8525461B3A;
	Thu, 30 Nov 2023 08:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8525461B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fy5hFPL0FhFA; Thu, 30 Nov 2023 08:31:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9FFF60B90;
	Thu, 30 Nov 2023 08:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9FFF60B90
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC0BB1BF23B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4E408444C
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E408444C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9CitvWL44V6E for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:31:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD75384449
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD75384449
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC46987601; Thu, 30 Nov 2023 08:31:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 09:04:26 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2f93db49d433c337fccad539c2d8a4169bff5045
X-Git-Newrev: b8e0734ebf3ecf870333af3709903c369b29304c
X-Patchwork-Hint: ignore
Message-Id: <20231130083133.BC46987601@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/gcc: fix
 disabling the documentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8e0734ebf3ecf870333af3709903c369b29304c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

gcc.mk attempts to disable building the documentation by setting
MAKEINFO=missing, but it is not working.  If makeinfo is installed
and recent enough, gcc still uses it.  This can be checked easily:

grep BUILD_INFO='info' host-gcc-initial-*/build/gcc/config.log

It happens because the root ./configure script will check
$MAKEINFO --version (aka 'missing --version') and will overwrite it with
MAKEINFO='missing makeinfo' because the version does not match.

Having MAKEINFO='missing makeinfo' is a problem because
'missing makeinfo' will actually attempt to run 'makeinfo' before
failing with an error message.  If makeinfo is installed on the host,
then 'missing makeinfo' will successfully run makeinfo anyway.

Many gcc subprojects will check $MAKEINFO --version and enable building
the documentation if it is recent enough.  This patch overrides these
checks by forcing gcc_cv_prog_makeinfo_modern=no.

Building the GCC documentation can fail with the wrong makeinfo version.
It happened at least when building GCC 11.3.0 with makeinfo 7.1.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f7b9d3ad2b4acccad5252737003e8a0db4f43340)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5d023d725f..834da24925 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -88,9 +88,12 @@ HOST_GCC_COMMON_CONF_OPTS += --with-debug-prefix-map=$(BASE_DIR)=buildroot
 endif
 
 # Don't build documentation. It takes up extra space / build time,
-# and sometimes needs specific makeinfo versions to work
+# and sometimes needs specific makeinfo versions to work. Override the check
+# for a modern makeinfo otherwise the configure scripts will still enable it.
 HOST_GCC_COMMON_CONF_ENV = \
 	MAKEINFO=missing
+HOST_GCC_COMMON_MAKE_OPTS = \
+	gcc_cv_prog_makeinfo_modern=no
 
 GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
 GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
@@ -295,7 +298,7 @@ HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
 # For gcc-final, the gcc logic to detect whether SSP support is
 # available or not in the C library is not working properly for
 # uClibc, so let's be explicit as well.
-HOST_GCC_COMMON_MAKE_OPTS = \
+HOST_GCC_COMMON_MAKE_OPTS += \
 	gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
 ifeq ($(BR2_CCACHE),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
