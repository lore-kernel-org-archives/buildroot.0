Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E8EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FBC24010E;
	Sat, 15 Jan 2022 09:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhXnbK6HJfGQ; Sat, 15 Jan 2022 09:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4134340569;
	Sat, 15 Jan 2022 09:31:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3418A1BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 217D54013A
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5RDp4iTb9phw for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:31:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04CE64010E
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 09:31:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3E0BF825F8; Sat, 15 Jan 2022 09:24:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 09:41:54 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 4fea34dddc967e7fc3377dee8f17bd32615a1523
X-Git-Newrev: 257dda3c473fd6e818812183ba8ce66f8d718412
X-Patchwork-Hint: ignore
Message-Id: <20220115092450.3E0BF825F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/keepalived: fix
 CVE-2021-44225
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

commit: https://git.buildroot.net/buildroot/commit/?id=257dda3c473fd6e818812183ba8ce66f8d718412
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

In Keepalived through 2.2.4, the D-Bus policy does not sufficiently
restrict the message destination, allowing any user to inspect and
manipulate any property. This leads to access-control bypass in some
situations in which an unrelated D-Bus system service has a settable
(writable) property

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e4464fabb6323dba4974096886166b9c4631fd38)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...02-dbus-fix-policy-to-not-be-overly-broad.patch | 42 ++++++++++++++++++++++
 package/keepalived/keepalived.mk                   |  3 ++
 2 files changed, 45 insertions(+)

diff --git a/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch b/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch
new file mode 100644
index 0000000000..6287d6117d
--- /dev/null
+++ b/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch
@@ -0,0 +1,42 @@
+From 7977fec0be89ae6fe87405b3f8da2f0b5e415e3d Mon Sep 17 00:00:00 2001
+From: Vincent Bernat <vincent@bernat.ch>
+Date: Tue, 23 Nov 2021 06:50:59 +0100
+Subject: [PATCH] dbus: fix policy to not be overly broad
+
+The DBus policy did not restrict the message destination, allowing any
+user to inspect and manipulate any property.
+
+Signed-off-by: Vincent Bernat <vincent@bernat.ch>
+
+[Retrieved from:
+https://github.com/acassen/keepalived/commit/7977fec0be89ae6fe87405b3f8da2f0b5e415e3d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ keepalived/dbus/org.keepalived.Vrrp1.conf | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/keepalived/dbus/org.keepalived.Vrrp1.conf b/keepalived/dbus/org.keepalived.Vrrp1.conf
+index 2b78a575c..b5ced6085 100644
+--- a/keepalived/dbus/org.keepalived.Vrrp1.conf
++++ b/keepalived/dbus/org.keepalived.Vrrp1.conf
+@@ -3,12 +3,15 @@
+  "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+ <busconfig>
+ 	<policy user="root">
+-		<allow own="org.keepalived.Vrrp1"/>
+-		<allow send_destination="org.keepalived.Vrrp1"/>
++		<allow own="org.keepalived.Vrrp1" />
++		<allow send_destination="org.keepalived.Vrrp1" />
+ 	</policy>
+ 	<policy context="default">
+-		<allow send_interface="org.freedesktop.DBus.Introspectable" />
+-		<allow send_interface="org.freedesktop.DBus.Peer" />
+-		<allow send_interface="org.freedesktop.DBus.Properties" />
++		<allow send_destination="org.keepalived.Vrrp1"
++		       send_interface="org.freedesktop.DBus.Introspectable" />
++		<allow send_destination="org.keepalived.Vrrp1"
++		       send_interface="org.freedesktop.DBus.Peer" />
++		<allow send_destination="org.keepalived.Vrrp1"
++		       send_interface="org.freedesktop.DBus.Properties" />
+ 	</policy>
+ </busconfig>
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 5d42cab741..e31c02dec5 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -12,6 +12,9 @@ KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CPE_ID_VENDOR = keepalived
 KEEPALIVED_CONF_OPTS = --disable-hardening
 
+# 0002-dbus-fix-policy-to-not-be-overly-broad.patch
+KEEPALIVED_IGNORE_CVES += CVE-2021-44225
+
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
 KEEPALIVED_CONF_OPTS += --enable-json
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
