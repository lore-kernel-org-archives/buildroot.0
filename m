Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B360C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 09:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F09A60F07;
	Mon,  5 Feb 2024 09:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F09A60F07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6v1QtlDHcQt; Mon,  5 Feb 2024 09:22:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 840F760EF6;
	Mon,  5 Feb 2024 09:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 840F760EF6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 107311BF40B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD1D78238F
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD1D78238F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uhwjUqBPNjN6 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 09:22:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEDF88238B
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 09:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEDF88238B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D710086995; Mon,  5 Feb 2024 09:22:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 10:21:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c7e6a5d57b83f71f21821cd56c21e0514128a7e
X-Git-Newrev: 9b90ef61784d314147ace4972f9bdc0cb4fcce77
X-Patchwork-Hint: ignore
Message-Id: <20240205092216.D710086995@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haproxy: fix runtime 'FATAL ERROR:
 invalid code detected -- cannot go further'
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b90ef61784d314147ace4972f9bdc0cb4fcce77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Setting HAPROXY_CFLAGS on the haproxy build command line overrides CFLAGS
which were internally set by the haproxy Makefile.

Among those omitted CFLAGS is -fwrapv. Compiling haproxy without it and
and then running the program results in runtime error:

$ haproxy
FATAL ERROR: invalid code detected -- cannot go further, please recompile!
...

To address this issue, include HAPROXY_CFLAGS in the DEFINE variable instead
of CFLAGS in haproxy.mk.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/haproxy/haproxy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 63a92090f3..61a9ebebe4 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -82,7 +82,7 @@ endif
 
 define HAPROXY_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(HAPROXY_MAKE_OPTS) CFLAGS="$(HAPROXY_CFLAGS)" -C $(@D)
+		$(HAPROXY_MAKE_OPTS) DEFINE="$(HAPROXY_CFLAGS)" -C $(@D)
 endef
 
 define HAPROXY_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
