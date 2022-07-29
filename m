Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2CDC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 20:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C03CF404F5;
	Fri, 29 Jul 2022 20:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C03CF404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9MiYHXogZDjv; Fri, 29 Jul 2022 20:49:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0A5A40526;
	Fri, 29 Jul 2022 20:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0A5A40526
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DC5F1BF35D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58C5560601
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58C5560601
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HzQueR5VKe2w for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 20:49:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E5CC605C9
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 20:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E5CC605C9
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1115F869CD; Fri, 29 Jul 2022 20:36:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 22:45:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15c972f32a9e4c8fb3e18646885141ab0fa52fc0
X-Git-Newrev: 32b341fa34b23f81ee2dc8dea7b7b45035c3e8fa
X-Patchwork-Hint: ignore
Message-Id: <20220729203601.1115F869CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: add integration section for
 systemd with dbus
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

commit: https://git.buildroot.net/buildroot/commit/?id=32b341fa34b23f81ee2dc8dea7b7b45035c3e8fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a section to the "Integration topics" chapter about how we integrate
systemd. Add a first subsection about how dbus and dbus-broker work with
systemd.

This is just the start of the integration information about systemd.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/integration-systemd.txt | 27 +++++++++++++++++++++++++++
 docs/manual/integration.txt         |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/docs/manual/integration-systemd.txt b/docs/manual/integration-systemd.txt
new file mode 100644
index 0000000000..44248b43ff
--- /dev/null
+++ b/docs/manual/integration-systemd.txt
@@ -0,0 +1,27 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[integration-systemd]]
+=== Systemd
+
+This chapter describes the decisions taken in Buildroot's integration of
+systemd, and how various use cases can be implemented.
+
+==== DBus daemon
+
+Systemd requires a DBus daemon. There are two options for it: traditional dbus
+(+BR2_PACKAGE_DBUS+) and bus1 dbus-broker (+BR2_PACKAGE_DBUS_BROKER+). At
+least one of them must be chosen. If both are included in the configuration,
+dbus-broker will be used as system bus, but the traditional dbus-daemon is
+still installed as well and can be used as session bus. Also its tools (e.g.
++dbus-send+) can be used (systemd itself has +busctl+ as an alternative). In
+addition, the traditional dbus package is the only one that provides +libdbus+,
+which is used by many packages as dbus integration library.
+
+Both in the dbus and in the dbus-broker case, the daemon runs as user +dbus+.
+The DBus configuration files are also identical for both.
+
+To make sure that only one of the two daemons is started as system bus, the
+systemd activation files of the dbus package (+dbus.socket+ and the
++dbus.service+ symlink in +multi-user.target.wants+) are removed when
+dbus-broker is selected.
diff --git a/docs/manual/integration.txt b/docs/manual/integration.txt
index bdfbfa59de..be56bf6567 100644
--- a/docs/manual/integration.txt
+++ b/docs/manual/integration.txt
@@ -9,4 +9,6 @@ level. Buildroot is highly configurable, almost everything discussed
 here can be changed or overridden by xref:rootfs-custom[rootfs overlay
 or custom skeleton] configuration.
 
+include::integration-systemd.txt[]
+
 include::integration-selinux-support.txt[]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
