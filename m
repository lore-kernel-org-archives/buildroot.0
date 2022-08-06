Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABD5C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 21:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC0F04176D;
	Sat,  6 Aug 2022 21:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC0F04176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTMQkD-hQ3-r; Sat,  6 Aug 2022 21:58:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2EB24175D;
	Sat,  6 Aug 2022 21:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2EB24175D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20C491BF3FF
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0CE1823DD
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0CE1823DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bxzT3hBhoHA4 for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 21:58:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20F5A823C6
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 21:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20F5A823C6
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4DA8F86ECA; Sat,  6 Aug 2022 21:44:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Aug 2022 23:57:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e7ae463d177ac6f3a9b0d22d3c34cd81a867d39
X-Git-Newrev: 88dd3fcd7277fdb61c911d7ae454df886e423377
X-Patchwork-Hint: ignore
Message-Id: <20220806214425.4DA8F86ECA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-meson.mk: add support for
 fortran cross-compilation
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

commit: https://git.buildroot.net/buildroot/commit/?id=88dd3fcd7277fdb61c911d7ae454df886e423377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-scipy is moving to a meson build infrastructure, and requires
fortran cross-compilation. This commit extends the cross-compilation
configuration file generated for use by meson to add the "fortran",
"fortran_args" and "fortran_link_args" properties.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-meson.mk                   | 2 ++
 support/misc/cross-compilation.conf.in | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 156b005fdd..32d41170f3 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -76,10 +76,12 @@ define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
         -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
         -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
+        -e "s%@TARGET_FC@%$(TARGET_FC)%g" \
         -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
         -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
         -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
         -e "s%@TARGET_ENDIAN@%$(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))%g" \
+        -e "s%@TARGET_FCFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
         -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
         -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
         -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
index 235e5a8495..7053df472b 100644
--- a/support/misc/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -9,6 +9,7 @@ cpp = '@TARGET_CXX@'
 ar = '@TARGET_AR@'
 strip = '@TARGET_STRIP@'
 cmake = '@BR2_CMAKE@'
+fortran = '@TARGET_FC@'
 pkgconfig = '@PKGCONF_HOST_BINARY@'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
@@ -18,6 +19,8 @@ c_args = [@TARGET_CFLAGS@]
 c_link_args = [@TARGET_LDFLAGS@]
 cpp_args = [@TARGET_CXXFLAGS@]
 cpp_link_args = [@TARGET_LDFLAGS@]
+fortran_args = [@TARGET_FCFLAGS@]
+fortran_link_args = [@TARGET_LDFLAGS@]
 wrap_mode = 'nodownload'
 cmake_prefix_path = '@STAGING_DIR@/usr/lib/cmake'
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
