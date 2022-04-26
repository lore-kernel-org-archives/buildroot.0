Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84234C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 20:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3393840991;
	Tue, 26 Apr 2022 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6NgkRiFO905; Tue, 26 Apr 2022 20:50:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F15B5408CF;
	Tue, 26 Apr 2022 20:50:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E66141BF9B4
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4B73408CF
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h8Oz2UjpSEO1 for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 20:50:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51FB3408E2
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 20:50:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BBF2A844EB; Tue, 26 Apr 2022 20:39:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 22:41:42 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5d58fb7df673637199ec10070080e0d8d9978f50
X-Git-Newrev: 76c8a1ca741bbb005d1522fcdbb7976576cdb729
X-Patchwork-Hint: ignore
Message-Id: <20220426203953.BBF2A844EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wireplumber: fix
 package by making the dbus dependency optional
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
Content-Type: multipart/mixed; boundary="===============6630781760215757932=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6630781760215757932==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=76c8a1ca741bbb005d1522fcdbb7976576cdb729
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 2699eb563156f6e9282342534122cf08ed7a0c25)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireplumber/wireplumber.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/wireplumber/wireplumber.mk b/package/wireplumber/wireplumber.mk
index 37a8de5364..674af3d392 100644
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

--===============6630781760215757932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6630781760215757932==--
