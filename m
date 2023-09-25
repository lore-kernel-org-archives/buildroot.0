Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F60CE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 12:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 064D8611F1;
	Mon, 25 Sep 2023 12:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 064D8611F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0DXVAlCbw95k; Mon, 25 Sep 2023 12:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F0B8610AD;
	Mon, 25 Sep 2023 12:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F0B8610AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 99D041BF947
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73B1D60F5F
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73B1D60F5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZKsd2NCPvsy for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 12:04:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 882E460A94
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 12:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 882E460A94
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77DF48776F; Mon, 25 Sep 2023 12:04:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 14:00:51 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 3de9a93b4268de257afc8c2a7df47cdf8eca35e8
X-Git-Newrev: 0919c5de1938709bbe4b5d55ed1258e1b4ea007a
X-Patchwork-Hint: ignore
Message-Id: <20230925120415.77DF48776F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/openvpn: dco
 needs headers >= 4.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=0919c5de1938709bbe4b5d55ed1258e1b4ea007a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

NLMSGERR_ATTR_MAX has been added in kernel 4.16 with
https://github.com/torvalds/linux/commit/dc2b9f19e3bdaa87a7c3d123b8bba8a42d96d942
resulting in the following build failure since bump to version 2.6.4 in
commit a46ac2346558d05afe405dda3730169df4b677d2 and
https://github.com/OpenVPN/openvpn/commit/e34437c26b764851555e4acbe2ccca6bec235c7e:

dco_linux.c: In function 'ovpn_nl_cb_error':
dco_linux.c:303:27: error: 'NLMSGERR_ATTR_MAX' undeclared (first use in this function); did you mean '__CTRL_ATTR_MAX'?
     struct nlattr *tb_msg[NLMSGERR_ATTR_MAX + 1];
                           ^~~~~~~~~~~~~~~~~
                           __CTRL_ATTR_MAX

Fixes:
 - http://autobuild.buildroot.org/results/69b9737913ac0b5cd2c117d526602874da3ee487

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 45c41098ef50e50c4b0aa426e90e5758bf7bc330)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 7c2506870e..2d27fdab45 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -16,7 +16,7 @@ OPENVPN_CONF_OPTS = \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
 OPENVPN_CONF_ENV = NETSTAT=/bin/netstat
 
-ifeq ($(BR2_PACKAGE_LIBNL),y)
+ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16),yy)
 OPENVPN_CONF_OPTS += --enable-dco
 OPENVPN_DEPENDENCIES += libnl
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
