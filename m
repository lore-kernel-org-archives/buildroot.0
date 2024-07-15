Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC01C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 08:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E590D605B0;
	Mon, 15 Jul 2024 08:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgEEDW-wrDD4; Mon, 15 Jul 2024 08:18:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D967F605BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D967F605BA;
	Mon, 15 Jul 2024 08:18:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D24851BF421
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C058980A06
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VcfzYbMeILeu for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 08:18:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A08B88056F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A08B88056F
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 08:18:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 949CB8693D; Mon, 15 Jul 2024 08:18:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 10:16:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8841eb005d90e7e49bc0c9bb64a48fa468f2b1db
X-Git-Newrev: 455637e8010840ee76c6ad8ae36c189606919262
X-Patchwork-Hint: ignore
Message-Id: <20240715081851.949CB8693D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus: set runstatedir to /run
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
Content-Type: multipart/mixed; boundary="===============6509641380141336833=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6509641380141336833==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=455637e8010840ee76c6ad8ae36c189606919262
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DBus 1.14.x now has the Containers1 interface which uses path in
runstatedir (by default set to /var/run) for creating sockets. With the
default, Systemd complains about it being a legacy directory:

systemd-tmpfiles[102]: /usr/lib/tmpfiles.d/dbus.conf:13: Line references
path below legacy directory /var/run/, updating /var/run/dbus/containers
→ /run/dbus/containers; please update the tmpfiles.d/ drop-in file
accordingly.

Set the configure option runstatedir to /run to use the preferred path
to avoid the warning and use the /run directory consistently. Setting
the value only affects the path of these sockets and to the PID file,
which is already explicitly set by another option.

We already tried to set the --runstatedir option globally, but that
confuses older autotools, so in the end it got reverted in
c8af4eef4982ada8f890eea9fb15fee51e1db4fd.

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/dbus/dbus.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 097b89205e..c60bf473cd 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -33,7 +33,8 @@ DBUS_CONF_OPTS = \
 	--disable-xml-docs \
 	--disable-doxygen-docs \
 	--with-system-socket=/run/dbus/system_bus_socket \
-	--with-system-pid-file=/run/messagebus.pid
+	--with-system-pid-file=/run/messagebus.pid \
+	--runstatedir=/run
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DBUS_CONF_OPTS += LIBS='-pthread'

--===============6509641380141336833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6509641380141336833==--
