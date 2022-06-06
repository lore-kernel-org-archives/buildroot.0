Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF54C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B0CC40546;
	Mon,  6 Jun 2022 10:32:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urW2rhUVVjjl; Mon,  6 Jun 2022 10:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CCE7402F7;
	Mon,  6 Jun 2022 10:32:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 035021BF982
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7565832DC
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7N1Vj4b24XpF for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:31:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 337BF831F2
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:31:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3EB6D86CC0; Mon,  6 Jun 2022 10:19:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 12:29:28 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: aa0dc6693137bba82cb41a086284780e7f38a793
X-Git-Newrev: 5f1e1c24b4069b4691c2832534801c34ff2cd107
X-Patchwork-Hint: ignore
Message-Id: <20220606101958.3EB6D86CC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/dhcp: fix build
 without atomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f1e1c24b4069b4691c2832534801c34ff2cd107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure without atomic raised since commit
fde21979427ffeb4fe9c0068310be195f2dec5ec:

/nvmedata/autobuild/instance-25/output-1/host/lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: cannot find -latomic: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/db6/db6923915e36bcdb2953a3cdd2b450fa10794631

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d81a99cc7cf2373b28bc06da4d3c543982b312b1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/dhcp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index f815c6c802..981e34e551 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -62,9 +62,14 @@ else
 DHCP_BIND_EXTRA_CONFIG += --without-zlib
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_ATOMIC),y)
+DHCP_BIND_EXTRA_CONFIG += --enable-atomic
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 DHCP_CONF_ENV += LIBS=-latomic
 endif
+else
+DHCP_BIND_EXTRA_CONFIG += --disable-atomic
+endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DHCP_CONF_OPTS += --disable-libtool
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
