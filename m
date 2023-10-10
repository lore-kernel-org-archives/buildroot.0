Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9234ECD8CB6
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 20:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D3AB6144F;
	Tue, 10 Oct 2023 20:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D3AB6144F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ZoopL24QSEh; Tue, 10 Oct 2023 20:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CAA1614C7;
	Tue, 10 Oct 2023 20:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CAA1614C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A69F1BF389
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE4F941850
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE4F941850
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zM95mARnwcwL for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 20:36:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 863CD41511
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 20:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 863CD41511
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74162844B1; Tue, 10 Oct 2023 20:36:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 22:29:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9ac23c6d669f1d7d0ee6da8ccdae511a673235a
X-Git-Newrev: 23c5fe7909cc5ee3222331fb822496b580163e04
X-Patchwork-Hint: ignore
Message-Id: <20231010203622.74162844B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: handle creation of
 /var/log/journal
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=23c5fe7909cc5ee3222331fb822496b580163e04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

journald will always have a runtime log in /run/systemd/journal,
and a persistent one in /var/log/journal under certain conditions.
By default it will check for the existence of that directory.

When /var is not backed by mass-storage you typically don't want your
log duplicated and journald should be tuned to account for
having only RAM available.

With this commit, the directory will no longer be created automatically,
but instead it's created only if the root filesystem is writeable.

It is rather easy for users to opt-in by either creating that directory
(e.g. with a tmpfiles fragment) or editing /etc/systemd/journald.conf.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d220673572..824c811c0c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -63,6 +63,7 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
 SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
+	-Dcreate-log-dirs=false \
 	-Ddbus=false \
 	-Ddbus-interfaces-dir=no \
 	-Ddefault-compression='auto' \
@@ -111,6 +112,10 @@ ifeq ($(BR2_nios2),y)
 SYSTEMD_LDFLAGS = $(TARGET_LDFLAGS) -Wl,--no-fatal-warnings
 endif
 
+ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
+SYSTEMD_JOURNALD_PERMISSIONS = /var/log/journal d 2755 root systemd-journal - - - - -
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_DEPENDENCIES += acl
 SYSTEMD_CONF_OPTS += -Dacl=true
@@ -621,6 +626,7 @@ define SYSTEMD_PERMISSIONS
 	/var/lib/private d 700 0 0 - - - - -
 	/var/log/private d 700 0 0 - - - - -
 	/var/cache/private d 700 0 0 - - - - -
+	$(SYSTEMD_JOURNALD_PERMISSIONS)
 	$(SYSTEMD_LOGIND_PERMISSIONS)
 	$(SYSTEMD_MACHINED_PERMISSIONS)
 	$(SYSTEMD_HOMED_PERMISSIONS)
@@ -800,6 +806,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	--libdir=lib \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
+	-Dcreate-log-dirs=false \
 	-Dmode=release \
 	-Dutmp=false \
 	-Dhibernate=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
