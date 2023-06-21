Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98F3EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 21 Jun 2023 16:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C30E41B69;
	Wed, 21 Jun 2023 16:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C30E41B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwcjH5EISt9e; Wed, 21 Jun 2023 16:01:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1564C41B6A;
	Wed, 21 Jun 2023 16:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1564C41B6A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4BF1BF83B
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 16:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5749260AAE
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 16:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5749260AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_RTjtrgJo4U for <buildroot@lists.busybox.net>;
 Wed, 21 Jun 2023 16:00:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17DE560A8B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17DE560A8B
 for <buildroot@buildroot.org>; Wed, 21 Jun 2023 16:00:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0f96.dip0.t-ipconnect.de [91.58.15.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 98A3BA4C00B7;
 Wed, 21 Jun 2023 18:00:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48700)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qC0GI-0004TI-0p;
 Wed, 21 Jun 2023 18:00:50 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 21 Jun 2023 18:00:49 +0200
Message-Id: <20230621160050.359493-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687363250;
 bh=x+8NkLmp0RhCGv5qWN5DisY4lTmC5JR9s/sJujVfluA=;
 h=From:To:Cc:Subject:Date:From;
 b=xW3DY9By6iE2qwTL9j8a1HUKAlUEDTbYH1IsKHbF++6pR25BxnH579KfWgDIS2MnZ
 7i46uxOvK7jsamb9Kh12FGftFAdW0y34kGgwR0LFqzWJSY2mgxmNiWJZTpJLATUlIg
 XRpByWoqG/BWXTbhtdu/ltikjfKgWU9obOmE15b45dFeDbbTkOANVW9ozhsX255NwD
 Gr15E3Gbktum3gHH5UDcrQRNuzzkbmtYB0sYpLtop0VbPFL9di0EDSMKYzOiiz6Xka
 tq+YjFjB4LochmL67iy0Ll4L1J4jTd6wS0BygL/1tsCvLSrIwvGseHC51lRxbODJLJ
 N3otCWwB+ncug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=xW3DY9By
Subject: [Buildroot] [PATCH 1/2] package/gupnp: fix build with newer
 versions of libxml
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/b26/b267c4137edebc504757b6275824c748cce3d894/

../libgupnp/gupnp-service.c:1005:9: error: 'xmlRecoverMemory' is deprecated [-Werror=deprecated-declarations]

libxml2 deprecated the function xmlRecoverMemory with commit
https://github.com/GNOME/libxml2/commit/51035c539edf67de93ced3cf037bb1f2b298e526
first included in versions 2.11.0. Buildroot bumped libxml2 to the 2.11
branch with commit dfe1ca7872a45bcdc825ff0900d7fd929097a635.

Instead of backporting an upstream fix [1] from the master branch to the
gupnp-1.4 branch we follow the Gentoo way [2][3] to disable
-Werror=deprecated-declarations in meson.build to prevent future build
errors.

[1] https://gitlab.gnome.org/GNOME/gupnp/-/commit/80e68995b745a5900eaaa1d0c424d3a9d354e42d
[2] https://bugs.gentoo.org/907384
[3] https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=ba8214a9700716349d8d7a3c8543889ced116c3d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gupnp/gupnp.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index f41f26d2dd..da04eae682 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -15,6 +15,12 @@ GUPNP_INSTALL_STAGING = YES
 GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
 GUPNP_CONF_OPTS = -Dexamples=false
 
+# prevents build errors with newer versions of libxml
+define GUPNP_REMOVE_DEPRECATED_DECLARATIONS
+	$(SED) '/-Werror=deprecated-declarations/d' $(@D)/meson.build
+endef
+GUPNP_POST_PATCH_HOOKS += GUPNP_REMOVE_DEPRECATED_DECLARATIONS
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GUPNP_CONF_OPTS += -Dintrospection=true -Dvapi=true
 GUPNP_DEPENDENCIES += host-vala gobject-introspection
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
