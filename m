Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81130C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 15:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF526417BD;
	Sun, 12 Jun 2022 15:47:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcLc0SKuF50Y; Sun, 12 Jun 2022 15:47:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC383417B4;
	Sun, 12 Jun 2022 15:47:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A98F1BF3D0
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 15:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14E5560E6D
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 15:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3qohtrCaEra for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 15:47:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CFCF60B37
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 15:47:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 478C386E66; Sun, 12 Jun 2022 15:35:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jun 2022 17:47:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 975af835d1af3bd90177e19bbca31a72855aaad0
X-Git-Newrev: e6904fdd7e6d5d25e21ff78ed1636673b068fef4
X-Patchwork-Hint: ignore
Message-Id: <20220612153516.478C386E66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnetconf2: doesn't build with
 libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6904fdd7e6d5d25e21ff78ed1636673b068fef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnetconf2 doesn't build with libressl which doesn't provide
X509_STORE_CTX_get1_certs resulting in the following build failure with
netopeer2:

[100%] Linking C executable netopeer2-server
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblaze-buildroot-linux-gnu/11.2.0/../../../../microblaze-buildroot-linux-gnu/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/lib/libnetconf2.so: undefined reference to `X509_STORE_CTX_get1_certs'

Fixes:
 - http://autobuild.buildroot.org/results/7f9a114a477e859dfbc62a53ab66c58eddb2318b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnetconf2/libnetconf2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 11a1995ea1..00d2c08f63 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -23,7 +23,7 @@ else
 LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL), y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL), y)
 LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=ON
 LIBNETCONF2_DEPENDENCIES += openssl
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
