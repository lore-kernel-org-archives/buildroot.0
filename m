Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558BAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 21:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 115C2404A4;
	Mon, 13 Dec 2021 21:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojGiiLbvypu4; Mon, 13 Dec 2021 21:19:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 190F5404A8;
	Mon, 13 Dec 2021 21:19:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5B531BF2B0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B278480B99
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ukQPsIYNnZlV for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 21:16:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 303EF80B98
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639430185;
 bh=AJdOjb3h8XAa4cG8eNszvQ18W+H++JevgNm3McCPV4c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=NkftL2BHf1iWdHMSRWYEqVhUO9zW/8theL3xfAZHl4UTVflSMc8EKdwaHvLtq7PvZ
 oRiJDl2Uu9DPsoO75rq9zYPU0me9TeGYg4W9ecEZcO072qsDmptBnQFZWoJkzSHqn4
 Uf7TJ59jENr67Xp+KCtlCmcR+3Uxs8AdCEEwTZdg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.61]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McH5a-1mOdrJ0Q0a-00clAy; Mon, 13
 Dec 2021 22:16:25 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 22:16:24 +0100
Message-Id: <20211213211624.14426-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:y4Ao/H03SbETQ6J9vy0qDruF/5GMbaeLxxc7jJyPA4L7r3XGCkN
 N4QcctkGmwavcsoUGaqox9zs9WgRcHDLVqoUTdKZ8UZaP5SEzcUgczgsYTusK7cM1OgXAyh
 Jb5OzTePF266wdnO/1HXSgWzsJBoamQ6QvTMHXNZy/JzSiHwhLYtNeE93aL/xVGEDtO6D2A
 VQi/ICkrr3vD4f0f9xtWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A2LVr7wnxnw=:jUJgbK5S8GmhULp9z+90ir
 aog6q/9WeX0jr9bSMkDmClQX70iBYwkES/KgiZCVBEoca/q1mlglUgW/25FtEOjkJpMxrva20
 8f6W/Qj6wZYJ2vKszUoWm9ImjDKRaPedqG0ehMj7s6fdPN7PtW+fRIgVQM9ENk79TcsgnG+Fw
 4cB5P9TFHJxoc4xJa5+197mOkVwc9IOx7J9Kc8pBM0s4Wlu/pVdSmrOarWulmbnWQHSIKNeyD
 JJ/gfIJtKlOYqebF0ZYK/cWgHfcayhGcmc0PhVc9gH47vLvNXf/spiOMQIajBZGsvhT8UseUf
 uSIQ81rC5FKsKC9WnTOP+4liUoGFVcM61XUPOZyrLodSN2OqKUCwtYovNYtLNStdea5ZimcA+
 ITBFVCxpxgoPrcVXFM7/ozzxwKyNF+PD2rUl0Dz4TfFRcMnLxIiZiuf7AwilXqfUXZEoi/LTT
 ju3dETVbEdpfGwS9OuFocGm0WfVtR7MQpJwLclAgdTSFYFJ8yMx+VLTOzjkWB5bF+3ng6Zyr2
 KWgLLUVp048/1pS9qc8tz9hUgfJ9Oaogj0Qpe3Xeq3X42GgtWMFJrlUXLjl3IDL3rsKJ7FLxA
 zHhSYQJhdVRzMHHNKWcxYsKS8WzJNru9NXca2ykOHeRxTj6A9PbPNdVp+EfgOeiruu8DtBH8r
 e8cy2yDRwbURuXZ/NdBhXJmuPtrtqbq5eSCofhcxJVNWkxZUvyZdvRAFG7vXbRgBWnZjshCHN
 3SmRJ4X/kPbd3tPMAaLEQj3sYnhH2xO/tbZovdYrYHexu8jmS5l8wnoxJz5P06j9q+6dC4dn7
 7zy9YEwgpdKCZcqM4yjRWEq9j5ELAzJu/B2BLY3sw0MzEk+EBIdfIfbAG7AmW5o4mw6zta+lE
 RzrsBfkMupjlP2pqWGFl4X48fh0c4cnIql5HMzE2JSJVe3dh9gGXnL4hh5ehHCx6LBxhVNZlg
 mJ38KLdEeMYbRtyDekqHgcpzoBnnoDbwc/uYZuXxNAFvX94eU8VXz6XZm74/F/VHISnmyIHEe
 jpyPXDOb6T1WQwu2t82HjQaIWxKb9K+9+uqKUL+nJidSJ3iXnJlfO65o2RCWkKIiV21xy9WZ9
 BUcfHl7DgAfSWI=
Subject: [Buildroot] [PATCH v1] package/lighttpd: bump version to 1.4.63
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- rebase (and change to git format) 0001-Fix-default-config-file.patch/
  0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch

For details see [1].

[1] https://www.lighttpd.net/2021/12/4/1.4.63/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...t-lighttpd-configuration-file-to-ha.patch} | 47 ++++++++++++-------
 package/lighttpd/lighttpd.hash                |  4 +-
 package/lighttpd/lighttpd.mk                  |  2 +-
 3 files changed, 33 insertions(+), 20 deletions(-)
 rename package/lighttpd/{0001-Fix-default-config-file.patch => 0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch} (59%)

diff --git a/package/lighttpd/0001-Fix-default-config-file.patch b/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
similarity index 59%
rename from package/lighttpd/0001-Fix-default-config-file.patch
rename to package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
index 47a859770d..1a887655b8 100644
--- a/package/lighttpd/0001-Fix-default-config-file.patch
+++ b/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
@@ -1,4 +1,8 @@
-Modify the default lighttpd configuration file to have one a starting conf
+From d1de409b0aeb8dffd42673444043caf01437804e Mon Sep 17 00:00:00 2001
+From: Maxime Ripard <maxime.ripard@free-electrons.com>
+Date: Mon, 13 Dec 2021 22:07:17 +0100
+Subject: [PATCH] Modify the default lighttpd configuration file to have one a
+ starting conf
 
   * Changed the log path to /var/log and logs filenames
   * Disable IPv6
@@ -9,11 +13,16 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Signed-off-by: Simon Dawson <spdawson@gmail.com>
 [Gustavo: update for 1.4.37]
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ doc/config/conf.d/access_log.conf |  2 +-
+ doc/config/lighttpd.conf          | 16 ++++++++--------
+ 2 files changed, 9 insertions(+), 9 deletions(-)
 
-diff -Nura lighttpd-1.4.37.orig/doc/config/conf.d/access_log.conf lighttpd-1.4.37/doc/config/conf.d/access_log.conf
---- lighttpd-1.4.37.orig/doc/config/conf.d/access_log.conf	2015-09-01 14:38:48.684673663 -0300
-+++ lighttpd-1.4.37/doc/config/conf.d/access_log.conf	2015-09-01 14:38:53.975855142 -0300
-@@ -9,7 +9,7 @@
+diff --git a/doc/config/conf.d/access_log.conf b/doc/config/conf.d/access_log.conf
+index e685d43..92cff4f 100644
+--- a/doc/config/conf.d/access_log.conf
++++ b/doc/config/conf.d/access_log.conf
+@@ -9,7 +9,7 @@ server.modules += ( "mod_accesslog" )
  ##
  ## Default access log.
  ##
@@ -22,12 +31,13 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/conf.d/access_log.conf lighttpd-1.4.3
  
  ##
  ## The default format produces CLF compatible output.
-diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/config/lighttpd.conf
---- lighttpd-1.4.37.orig/doc/config/lighttpd.conf	2015-09-01 14:38:48.684673663 -0300
-+++ lighttpd-1.4.37/doc/config/lighttpd.conf	2015-09-01 14:39:40.256442492 -0300
+diff --git a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
+index 495d2a1..c3e1446 100644
+--- a/doc/config/lighttpd.conf
++++ b/doc/config/lighttpd.conf
 @@ -13,8 +13,8 @@
  ## if you add a variable here. Add the corresponding variable in the
- ## chroot example aswell.
+ ## chroot example as well.
  ##
 -var.log_root    = "/var/log/lighttpd"
 -var.server_root = "/srv/www"
@@ -36,7 +46,7 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
  var.state_dir   = "/run"
  var.home_dir    = "/var/lib/lighttpd"
  var.conf_dir    = "/etc/lighttpd"
-@@ -90,7 +90,7 @@
+@@ -90,7 +90,7 @@ server.port = 80
  ##
  ## Use IPv6?
  ##
@@ -45,7 +55,7 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
  
  ##
  ## bind to a specific IP
-@@ -101,8 +101,8 @@
+@@ -101,8 +101,8 @@ server.use-ipv6 = "enable"
  ## Run as a different username/groupname.
  ## This requires root permissions during startup. 
  ##
@@ -56,7 +66,7 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
  
  ##
  ## Enable lighttpd to serve requests on sockets received from systemd
-@@ -118,7 +118,7 @@
+@@ -118,7 +118,7 @@ server.groupname = "lighttpd"
  ##
  ## Document root
  ##
@@ -65,7 +75,7 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
  
  ##
  ## The value for the "Server:" response field.
-@@ -144,7 +144,7 @@
+@@ -144,7 +144,7 @@ server.pid-file = state_dir + "/lighttpd.pid"
  ##
  ## Path to the error log file
  ##
@@ -74,12 +84,15 @@ diff -Nura lighttpd-1.4.37.orig/doc/config/lighttpd.conf lighttpd-1.4.37/doc/con
  
  ##
  ## If you want to log to syslog you have to unset the 
-@@ -195,7 +195,7 @@
- ## sendfile       - is recommended for small files.
- ## writev         - is recommended for sending many large files
+@@ -192,7 +192,7 @@ include conf_dir + "/conf.d/debug.conf"
+ ## and write(). Every modern OS provides its own syscall to help network
+ ## servers transfer files as fast as possible 
  ##
--server.network-backend = "sendfile"
+-#server.network-backend = "sendfile"
 +server.network-backend = "writev"
  
  ##
  ## As lighttpd is a single-threaded server, its main resource limit is
+-- 
+2.34.1
+
diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 98c1824783..7601745fd7 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.61.sha256sum
-sha256  43f0d63d04a1b7c5b8aab07e0612e44ccad0afc0614bab784c5b019872363432  lighttpd-1.4.61.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.63.sha256sum
+sha256  2aef7f0102ebf54a1241a1c3ea8976892f8684bfb21697c9fffb8de0e2d6eab9  lighttpd-1.4.63.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 7ca71e356a..98e84e8de8 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).61
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).63
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
