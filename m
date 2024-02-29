Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F1EC54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 14:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C24BF4051C;
	Thu, 29 Feb 2024 14:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMoYj-DE9B3B; Thu, 29 Feb 2024 14:29:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E25E417B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E25E417B4;
	Thu, 29 Feb 2024 14:29:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7141BF3FB
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 14:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54F5360EAC
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 14:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLT7LVSFHr8Y for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 14:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEA7B60A99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEA7B60A99
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 14:24:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A630287D15; Thu, 29 Feb 2024 14:24:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 15:20:50 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 611b139e76e82e6b635a0bf77383a6508904eace
X-Git-Newrev: 29f2034b2c6d2aa1b2060b5198644e637ae604d3
X-Patchwork-Hint: ignore
Message-Id: <20240229142434.A630287D15@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/haproxy: fix
 runtime 'FATAL ERROR: invalid code detected -- cannot go further'
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

commit: https://git.buildroot.net/buildroot/commit/?id=29f2034b2c6d2aa1b2060b5198644e637ae604d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit 9b90ef61784d314147ace4972f9bdc0cb4fcce77)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
