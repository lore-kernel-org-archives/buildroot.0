Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E331FC9EDA
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 09:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB458614D6;
	Sat,  7 Mar 2026 09:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NEv7lUHk3lP; Sat,  7 Mar 2026 09:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A49860F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772876194;
	bh=B7/yIzw9zZxWp2aylcfJbcU0lCjDydRVLio9SJZRevU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KSYi5EVHL1hpxDZQ+YXtRNLbYF7wnRl04KvIznS+4VYxhA/fHG210MxNKoEJNe1mo
	 9Gm4+7T7T6ndzBiWBXS6ELg+XQHkqHiQZ84EmeR1tgGjNZJytwCQPQwlF9aYvYz+jk
	 F/+JZcZJ+FVyRMxQ69b1LPSR4zfFvQ7vV0SxaRHLjWkSqhkig7mJ42BUOTt6GtguvU
	 wKameqU95KsccSYWTeLVIJRS3yIO8n0ZV4ZNbU4IG0LRzwi5nngTunNzSXzcXWxVjm
	 qeSPZBxTL3YZRGRvu60z7SMDCKdOuRNx9pJhPKewxmcP62RdHyqi0m6lANGYcHv4CZ
	 wMrIwXwZgnhqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A49860F31;
	Sat,  7 Mar 2026 09:36:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E53AD169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 09:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1EC7841E9
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 09:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QlvGC0uqypKE for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 09:36:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA42B841E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA42B841E8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA42B841E8
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 09:36:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05D1CA4C3763
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:36:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41026)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyo5F-000000002Vs-2tp1
 for buildroot@buildroot.org; Sat, 07 Mar 2026 09:36:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  7 Mar 2026 10:36:29 +0100
Message-ID: <20260307093629.22188-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772876190;
 bh=QNR0ujJJrsTPvorYzVyuPl9z9LQQJKLgla+gN2H3dGs=;
 h=From:To:Subject:Date:From;
 b=LTwhYkGk4Z8lBUgDv15lRUSL4Mu7FHOzWqhAyulHGK/vLbiOlomycAUMmMernQw6/
 A5h9yVaXkGrb1zYpM6vTGfNxXVsIidTbv1jFrtLumiiANzJ5dDyh8L99aX26RQKA62
 Ll1R1MfJFGYw3NhjPXeCgM0ztQJPsMKXEd9OnguAtms2z3AQswkGHmlMX4XX3rXw4D
 aP3uo6hHR/sqBCJBTN2lQl22aGKuZPK0ljdCWN/srYtVtdWya76eI5HdvbxeLishd+
 HCOCUM8L68h/t1ND4DSKiXzAfV0se1JPJL4FR0iEpiu549oJw5+Zui5F9XBGeqpaSq
 rF6p6i7NAWyqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=LTwhYkGk
Subject: [Buildroot] [PATCH v2 1/1] package/docker: Fix build with gcc-15.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add patch from Debian to fix build error with gcc-15.x

Fixes:
https://autobuild.buildroot.net/results/495/4956555fd033d43c1877e66141789bcd06aff5be/

Patch sent to fork which is used by Arch Linux:
https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=wmdocker

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: updated upstream URL after commit of the PR

 ...tibility-explicit-fallthrough-undecl.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch

diff --git a/package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch b/package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch
new file mode 100644
index 0000000000..c0dc18d17a
--- /dev/null
+++ b/package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch
@@ -0,0 +1,38 @@
+From 55054532589041e3c7b970fefaeeeee871f4f6be Mon Sep 17 00:00:00 2001
+From: Tianon Gravi <tianon@debian.org>
+Date: Wed, 25 Feb 2026 08:24:26 +0100
+Subject: [PATCH] fix gcc-15+ compatibility (explicit fallthrough,
+ undeclared/unused arguments)
+
+Downloaded from Debian:
+https://sources.debian.org/src/docker/1.5-6/debian/patches/gcc-15.patch
+
+Upstream: https://github.com/mdomlop/wmdocker/commit/55054532589041e3c7b970fefaeeeee871f4f6be
+
+[Bernd: rebased patch]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ docker.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/docker.c b/docker.c
+index 4cc8d78..6105ab8 100644
+--- a/docker.c
++++ b/docker.c
+@@ -46,7 +46,7 @@ void signal_handler(int signal)
+ }
+ 
+ 
+-void parse_cmd_line()
++void parse_cmd_line(int argc, char **argv)
+ {
+   int i;
+   gboolean help = FALSE;
+@@ -283,6 +283,7 @@ void event_loop()
+       case ReparentNotify:
+         if (e.xany.window == win) /* reparented to us */
+           break;
++        /* fallthrough */
+       case UnmapNotify:
+       case DestroyNotify:
+         for (it = icons; it; it = g_slist_next(it)) {
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
