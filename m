Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322F6C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 17:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFAEE61155;
	Tue, 21 Feb 2023 17:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFAEE61155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bkh21MMJJlv5; Tue, 21 Feb 2023 17:24:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E44C561386;
	Tue, 21 Feb 2023 17:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E44C561386
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53E391BF42C
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBFD44015F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBFD44015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edIBLJwYLY3O for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D3D340414
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D3D340414
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 5058121729;
 Tue, 21 Feb 2023 11:22:19 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 11:22:03 -0600
Message-Id: <20230221172205.2450111-13-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221172205.2450111-1-vfazio@xes-inc.com>
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1677000139; bh=S0anN6AfiLxBl5oy20atQsveeOAvD8iqDwvqr6yaA6I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vyoqDcCT9q5LwNwH8QGE4dsB8XItvjml51MLX51+qRYlSuZCJUjOZu8lzuaooLzf6
 RKN6wmmje0On72GA+BX0E5OUrDMAbWTaFGMr/rXTGJXdW3Szx7vcA3IP29W0V1L8WM
 F4B1xKe/7xM53OxFt+nBvrpZwlOktt/8YSnsyQlY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=vyoqDcCT
Subject: [Buildroot] [PATCH 13/15] package/pkg-autotools: drop support for
 FOO_GETTEXTIZE
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

Remove all support for FOO_GETTEXTIZE and alert users to FOO_AUTOPOINT
as the recommended solution in its stead.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 package/pkg-autotools.mk | 23 +----------------------
 package/pkg-generic.mk   |  3 +++
 2 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 48485567d7..f17186dfe4 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -87,14 +87,6 @@ define CONFIGURE_FIX_POWERPC64_HOOK
 	support/scripts/fix-configure-powerpc64.sh $($(PKG)_DIR)
 endef
 
-#
-# Hook to gettextize the package if needed
-#
-define GETTEXTIZE_HOOK
-	@$(call MESSAGE,"Gettextizing")
-	$(Q)cd $($(PKG)_SRCDIR) && $(GETTEXTIZE)
-endef
-
 #
 # Hook to autoreconf the package if needed
 #
@@ -144,14 +136,6 @@ ifndef $(2)_AUTORECONF
  endif
 endif
 
-ifndef $(2)_GETTEXTIZE
- ifdef $(3)_GETTEXTIZE
-  $(2)_GETTEXTIZE = $$($(3)_GETTEXTIZE)
- else
-  $(2)_GETTEXTIZE ?= NO
- endif
-endif
-
 ifndef $(2)_AUTOPOINT
  ifdef $(3)_AUTOPOINT
   $(2)_AUTOPOINT = $$($(3)_AUTOPOINT)
@@ -245,13 +229,8 @@ $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 ifeq ($$($(2)_AUTORECONF),YES)
 
-# This has to come before autoreconf
-ifeq ($$($(2)_GETTEXTIZE),YES)
-$(2)_PRE_CONFIGURE_HOOKS += GETTEXTIZE_HOOK
-$(2)_DEPENDENCIES += host-gettext
-$(2)_AUTORECONF_ENV += AUTOPOINT=/bin/true
 # autopoint is provided by gettext
-else ifeq ($$($(2)_AUTOPOINT),YES)
+ifeq ($$($(2)_AUTOPOINT),YES)
 $(2)_DEPENDENCIES += host-gettext
 $(2)_AUTORECONF_ENV += AUTOPOINT=$$(HOST_DIR)/bin/autopoint
 else
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a6ef5efb5f..6be28db623 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1215,6 +1215,9 @@ endif
 ifneq ($$($(2)_GETTEXTIZE_OPTS),)
 $$(error "$(2)_GETTEXTIZE_OPTS is no longer supported. Please fix your .mk file.")
 endif
+ifneq ($$($(2)_GETTEXTIZE),)
+$$(error "$(2)_GETTEXTIZE is no longer supported in favor of $(2)_AUTOPOINT. Please update your package.")
+endif
 
 PACKAGES += $(1)
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
