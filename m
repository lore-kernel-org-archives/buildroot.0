Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9E9D10BFD
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F24160621;
	Sat, 26 Oct 2024 14:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 06dF4-HMBlIu; Sat, 26 Oct 2024 14:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6943605D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6943605D1;
	Sat, 26 Oct 2024 14:42:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E7075C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C45140175
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkYojQ-MX80s for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C568401CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C568401CC
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:42:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41C518191A; Sat, 26 Oct 2024 14:42:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:40:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb4d73973b7bae6c922ea88c18b24e09a11b6e7b
X-Git-Newrev: b9c7d79eba2bc0b0ffc1c9b02abcc0d28c6afebc
X-Patchwork-Hint: ignore
Message-Id: <20241026144245.41C518191A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: add an option to
 enable lws async dns
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b9c7d79eba2bc0b0ffc1c9b02abcc0d28c6afebc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lws now features optional asynchronous, ie, nonblocking recursive DNS
resolution done on the event loop, enable `-DLWS_WITH_SYS_ASYNC_DNS=1`
at cmake to build it in.

The default libc name resolution is via libc `getaddrinfo()`, which is
blocking, possibly for quite long periods (seconds).  If you are
taking care about latency, but want to create outgoing connections,
you can't tolerate this exception from the rule that everything in
lws is nonblocking.

Lws' asynchronous DNS resolver creates a caching name resolver
that directly queries the configured nameserver itself over UDP,
from the event loop.

https://libwebsockets.org/lws-api-doc-main/html/md_READMEs_2README_8async-dns.html

Signed-off-by: Bart Van Severen <bart.vanseveren@barco.com>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libwebsockets/Config.in        | 6 ++++++
 package/libwebsockets/libwebsockets.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index 05c132641e..6116cfecb5 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -19,6 +19,12 @@ config BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL
 	  unconditionally compiled in for library versions
 	  prior to 3.2.0.
 
+config BR2_PACKAGE_LIBWEBSOCKETS_ASYNC_DNS
+	bool "enable async dns support"
+	help
+	  Enable asynchronous DNS resolver that directly queries
+	  the configured nameserver over UDP, from the event loop.
+
 endif
 
 comment "libwebsockets needs a toolchain w/ dynamic library"
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index c00c44cac3..e53febfce4 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -98,4 +98,8 @@ ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL),y)
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_EXTERNAL_POLL=ON
 endif
 
+ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS_ASYNC_DNS),y)
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SYS_ASYNC_DNS=ON
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
