Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7C1C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 22:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FD62401DF;
	Sat,  6 Aug 2022 22:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FD62401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNulflH7vA0D; Sat,  6 Aug 2022 22:10:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C7DC4013A;
	Sat,  6 Aug 2022 22:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C7DC4013A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E2C91BF580
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86BEA60F85
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86BEA60F85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pm6xM48C310Q for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 22:10:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC35960BA9
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 22:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC35960BA9
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E11BF86ECF; Sat,  6 Aug 2022 21:56:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 00:01:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88dd3fcd7277fdb61c911d7ae454df886e423377
X-Git-Newrev: cd933d676f210789730ecb25b23d902620d72072
X-Patchwork-Hint: ignore
Message-Id: <20220806215604.E11BF86ECF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-meson.mk: fix handling of
 fortran compiler flags
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd933d676f210789730ecb25b23d902620d72072
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit
88dd3fcd7277fdb61c911d7ae454df886e423377 ("package/pkg-meson.mk: add
support for fortran cross-compilation") incorrectly handled the
FCFLAGS value to create the cross-compilation.conf file. This commit
fixes that by making the PKG_MESON_CROSSCONFIG_SED macro take a 4th
argument containing the fcflags, and adjusting the call sites, as well
as the PKG_MESON_INSTALL_CROSS_CONF macro.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-meson.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 32d41170f3..0632ab21cf 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -71,7 +71,7 @@ endif
 # Generates sed patterns for patching the cross-compilation.conf template,
 # since Flags might contain commas the arguments are passed indirectly by
 # variable name (stripped to deal with whitespaces).
-# Arguments are variable containing cflags, cxxflags, ldflags.
+# Arguments are variable containing cflags, cxxflags, ldflags, fcflags
 define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
         -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
@@ -81,7 +81,7 @@ define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
         -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
         -e "s%@TARGET_ENDIAN@%$(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))%g" \
-        -e "s%@TARGET_FCFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
+        -e "s%@TARGET_FCFLAGS@%$(call make-sq-comma-list,$($(strip $(4))))%g" \
         -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
         -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
         -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
@@ -129,7 +129,7 @@ define $(2)_CONFIGURE_CMDS
 	mkdir -p $$($$(PKG)_SRCDIR)/build
 	sed -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
 	    -e "/^\[properties\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES),\n$$(x)):" \
-	    $$(call PKG_MESON_CROSSCONFIG_SED,$(2)_CFLAGS,$(2)_CXXFLAGS,$(2)_LDFLAGS) \
+	    $$(call PKG_MESON_CROSSCONFIG_SED,$(2)_CFLAGS,$(2)_CXXFLAGS,$(2)_LDFLAGS,$(2)_FCFLAGS) \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
 	PATH=$$(BR_PATH) \
 	CC_FOR_BUILD="$$(HOSTCC)" \
@@ -248,9 +248,10 @@ define PKG_MESON_INSTALL_CROSS_CONF
 	sed -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g" \
 	    -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_LDFLAGS@%g" \
 	    -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CXXFLAGS@%g" \
+	    -e "s%@TARGET_FCFLAGS@%$(call make-sq-comma-list,$(TARGET_FCFLAGS))@PKG_TARGET_FCFLAGS@%g" \
 	    $(call PKG_MESON_CROSSCONFIG_SED) \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
-	sed $(call PKG_MESON_CROSSCONFIG_SED,TARGET_CFLAGS,TARGET_CXXFLAGS,TARGET_LDFLAGS) \
+	sed $(call PKG_MESON_CROSSCONFIG_SED,TARGET_CFLAGS,TARGET_CXXFLAGS,TARGET_LDFLAGS,TARGET_FCFLAGS) \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
