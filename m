Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C1CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 07:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 488EC60AEB;
	Thu, 28 Apr 2022 07:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q876tvNuY7HG; Thu, 28 Apr 2022 07:47:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BB8B60AC9;
	Thu, 28 Apr 2022 07:47:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 296741BF333
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 07:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FAD840117
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 07:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CIEoE9nlN4U4 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 07:47:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC405400FB
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 07:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651132031;
 bh=oe91+gdpLza9t6aZsrBYeXDxKkId79dyJNyINsDwx6I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=c/bifde9+ESJV4780j6A2ygsCfx7E3uj+0tVKEWVWjC9U4601uM71rogkuEs+R3Cw
 u5AO6deQ8k+JQWnPb6orBB6Dr+52ICyFexF5OLPTaIDUTTSGWS/g+rNrCXd4IvkTI8
 y/sZPbjz6Vr4aGzIXOV7jSpAmM1tJ4lvf3Sxpiso=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([84.133.21.31]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MCKBm-1nafC11wgM-009Qhx; Thu, 28 Apr 2022 09:47:11 +0200
From: Andreas Ehmanns <universeiii@gmx.de>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 09:46:41 +0200
Message-Id: <20220428074641.5682-1-universeiii@gmx.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:hUaKIc20iCM7ooAKnaruiCdlJ1gQdVANW63bgp9rL/Qh4hYTmpP
 NfXqs/7eC61k1NQScZJ5XHS1rq/wNv0UZWaJqu+BKJyMpx6aCJwUI6E8zlLZJspJ21rhdo+
 wqQfhpHMjl3U2gegDTSCkl3ZFwLUQP34w++HoqJdZqbgZO9BeQf+9cWEO5i8hxDN3HirA2v
 /Vi1jRjBVFUguD+9zXCYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9Qy7vlOQWw8=:xcGjArWtGdrqXt2yzyd2ep
 I9VPXoJvMMLZSIDTlblnOH5CXZ+Yt6x1Y5V4VJX3exNVgK12DDZ6eycczo6r6iu/ztCwAUnon
 0jGNDXcYUkSlyTbsJWi50EEgudEoYQFafyGpCJmmP3nhD7qIcuFeQkZY52nnP4a4htuCGotQJ
 Kh0EGXSh+yStdE/v9CWkMBQkcr1svdv20mz5pyMLiZV/NPy8cB5DBCOWQomPN1SRcbi9bW0HM
 CUy6l4ihaa2hhmcmULHL2xebc+OeLvvbKejY0tLSCAPVp/M/xPpxozo9prJgAfy5u2GgddoV7
 AjY/t2jWiTiKwqP2hKr0w88hSG9H4VIVwAduy15/Tlr805ITfbZtrW5+THkUV8liLh4E9S+yO
 ewaEHJQQRZdSSHmR/FiJTcl6sOOhN0gb/19FuX1DbuiAxqmosW1PAkKA1IobbShC0BVo5IDl3
 cH1LqoWoYha3haH7EdX20jesbt+O+nQAWmlW3Z+7nC16D6YDXLeM3YZFHJlEI4Fs+rXdDPkh0
 bTnfDu3iK/JfrFvBphqMP2DJcltu9X1fexuh6Bus2Xg8li+H55LH638ZRbN67Witw/nqD+W9k
 IW1bnWKTq8qGOkRbHKLA2UerdatqspTmXHtZgeN65B2yNpDONFg5KSk6VVy+XDhiogsXeVmqY
 V3zWErmd7ss1R+mHHEI3lRPLh9AqiRX5ELuBUYMOBfHehPA1Th7em8dD9u/afJHxE4DrDNb4i
 DUVDHZT6mJakQMGKM5GaZ3oTP8bwhqyC+5CZfZfw6r6F3Y7ozGxDWwq8xv5akrIrWuL8obbki
 bbCrJkWJtzKKRLAXaVPZTvDcFtGfRZfV/SAdgriio9eJSbuz4Z/lsaDyRBW4Lzrws1pziOa+q
 EiCYpt5wW/7tKI983T+bZbmgaq/R8/y4QeydXUDx5JcPBvzz327IFVdhxjlMwgF4hxidHRuMB
 RRPPxVAhgXcNvFwyHcXkecTe3pUyyRkwl6sVAHub24UBhnGM195H6wlmfzy0HxHl8RbuF7niJ
 uR1fVEA7lnq8NxGR758Ao5o7r/QuWuLBTRUBSTZ8COKssuWqRNIXu2yFo9XHSniGhApiBJpAo
 u16a5x1CLgzJzU=
Subject: [Buildroot] [PATCH 1/1] package/dhcp: add security options to DHCP
 server
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
Cc: Andreas Ehmanns <universeiii@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I was trying to make the ISC dhcp daemon more secure by using the
-user and -group option to let dhcp server run as non-root user.
Unfortunately these options are not available when building ISC dhcp
server with buildroot.
The reason is, that the configure script must be called with the
option --enable-paranoia to activate these options. But this option
is not set in the dhcp.mk file.

To be backward compatible I added a new option to the dhcp's Config.in
file to enable this feature when desired and parse this option in
dhcp.mk.

Signed-off-by: Andreas Ehmanns <universeiii@gmx.de>
---
 package/dhcp/Config.in | 8 ++++++++
 package/dhcp/dhcp.mk   | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index e0706efafb..5cf7af82de 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -25,6 +25,14 @@ config BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK
 	help
 	  Enable delayed ACK feature in the ISC DHCP server.

+config BR2_PACKAGE_DHCP_SERVER_ENABLE_PARANOIA
+	bool "Enable paranoia options"
+	depends on BR2_PACKAGE_DHCP_SERVER
+	help
+	  Add option --enable-paranoia to configure script. This activates
+	  additional server options (-user, -group and -chroot) to make
+	  dhcp server more secure.
+
 config BR2_PACKAGE_DHCP_RELAY
 	bool "dhcp relay"
 	help
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index f815c6c802..b73137506d 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -78,6 +78,10 @@ ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
 DHCP_CONF_OPTS += --enable-delayed-ack
 endif

+ifeq ($(BR2_PACKAGE_DHCP_SERVER_ENABLE_PARANOIA),y)
+DHCP_CONF_OPTS += --enable-paranoia
+endif
+
 define DHCP_INSTALL_LIBS
 	$(MAKE) -C $(@D)/bind install-bind DESTDIR=$(TARGET_DIR)
 	$(MAKE) -C $(@D)/common install-exec DESTDIR=$(TARGET_DIR)
--
2.26.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
