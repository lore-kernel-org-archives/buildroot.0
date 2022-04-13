Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF47FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 20:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2740D83E46;
	Wed, 13 Apr 2022 20:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Bhit5pX3Tuj; Wed, 13 Apr 2022 20:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07A8F83E18;
	Wed, 13 Apr 2022 20:27:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEB8E1BF38D
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 20:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9F8441732
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 20:27:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifBI38C3Cp0w for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 20:27:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8071C41705
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 20:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 60B1383C36; Wed, 13 Apr 2022 20:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 22:27:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a9157705a5fec20a5a3aa47f7ea6bf4c95942ae
X-Git-Newrev: 2699eb563156f6e9282342534122cf08ed7a0c25
X-Patchwork-Hint: ignore
Message-Id: <20220413201734.60B1383C36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireplumber: fix package by making
 the dbus dependency optional
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
Content-Type: multipart/mixed; boundary="===============7876320082986739772=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7876320082986739772==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2699eb563156f6e9282342534122cf08ed7a0c25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The wireplumber currently as "dbus" in its DEPENDENCIES, but it does
not select/depend on it at the Kconfig level. A simple configuration
such as:

BR2_PACKAGE_LUA=y
BR2_PACKAGE_PIPEWIRE=y
BR2_PACKAGE_WIREPLUMBER=y

Therefore fails to build with:

Makefile:576: *** dbus is in the dependency chain of wireplumber that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Since dbus is actually an optional dependency of wireplumber, this
commit fixes the issue by really handling it as an optional
dependency.

Fixes: c9a3c10417aadce9ee4922e30235776409ce8eb3 ("package/wireplumber: new package")
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireplumber/wireplumber.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/wireplumber/wireplumber.mk b/package/wireplumber/wireplumber.mk
index 327138391d..763e3d7639 100644
--- a/package/wireplumber/wireplumber.mk
+++ b/package/wireplumber/wireplumber.mk
@@ -9,13 +9,17 @@ WIREPLUMBER_SOURCE = wireplumber-$(WIREPLUMBER_VERSION).tar.bz2
 WIREPLUMBER_SITE = https://gitlab.freedesktop.org/pipewire/wireplumber/-/archive/$(WIREPLUMBER_VERSION)
 WIREPLUMBER_LICENSE = MIT
 WIREPLUMBER_LICENSE_FILES = LICENSE
-WIREPLUMBER_DEPENDENCIES = host-pkgconf dbus pipewire libglib2 lua
+WIREPLUMBER_DEPENDENCIES = host-pkgconf pipewire libglib2 lua
 
 WIREPLUMBER_CONF_OPTS = \
 	-Ddoc=disabled \
 	-Dsystem-lua=true \
 	-Dsystem-lua-version=
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+WIREPLUMBER_DEPENDENCIES += dbus
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 WIREPLUMBER_DEPENDENCIES += host-doxygen host-python-lxml gobject-introspection
 WIREPLUMBER_CONF_OPTS += -Dintrospection=enabled

--===============7876320082986739772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7876320082986739772==--
