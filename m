Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1506CE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 11:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58CD06102C;
	Mon, 25 Sep 2023 11:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58CD06102C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QPPgfFc3MHCy; Mon, 25 Sep 2023 11:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A20E96107F;
	Mon, 25 Sep 2023 11:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A20E96107F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A53E1BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8AA281E14
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8AA281E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKhxuclYrB-t for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 11:48:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C81681BD4
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 11:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C81681BD4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D27287729; Mon, 25 Sep 2023 11:48:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 13:36:39 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: cf901e414f55a874a898ae14638568888fa7acda
X-Git-Newrev: 40448ec53473a7589d2a11fb969430d1aa01ad8c
X-Patchwork-Hint: ignore
Message-Id: <20230925114822.0D27287729@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/agentpp: fix
 build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=40448ec53473a7589d2a11fb969430d1aa01ad8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following build failure with gcc 4.8 raised since bump of snmppp
to version 3.5.0 in commit e011fa0415883b9d44df616cfaf6956e1a11da88:

configure: error: Cannot find suitable libsnmp++ library

[...]

configure:9496: checking if libsnmp++ can be linked with flags from pkg-config
configure:9528: /home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-none-linux-gnueabi-g++ -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -D_XOPEN_SOURCE=XPG6  conftest.cpp -L/home/buildroot/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/lib -lsnmp++ >&5
In file included from /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/snmp_pp/snmp_pp.h:71:0,
                 from conftest.cpp:92:
/home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/snmp_pp/uxsnmp.h:628:35: error: 'nullptr' was not declared in this scope
      CSNMPMessage *snmp_message = nullptr);
                                   ^

Fixes:
 - http://autobuild.buildroot.org/results/f272473e7b588f5390b183072935a0217290ee4e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7c6c018ad45c952a47e7f0e707da0d797cdbe4c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/agentpp/agentpp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 0ef549426e..7616d3eb0c 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -11,6 +11,7 @@ AGENTPP_LICENSE = Apache-2.0
 AGENTPP_LICENSE_FILES = LICENSE-2_0.txt
 AGENTPP_INSTALL_STAGING = YES
 AGENTPP_DEPENDENCIES = host-pkgconf snmppp
+AGENTPP_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 AGENTPP_CONF_OPTS += \
 	--disable-proxy \
 	--disable-forwarder \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
