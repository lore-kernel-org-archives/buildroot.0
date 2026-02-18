Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4C4E9A02C
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 13:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2D2D402D9;
	Wed, 18 Feb 2026 13:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-VZGyZtjsuE; Wed, 18 Feb 2026 13:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 927EE40301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771420037;
	bh=JB4hufJhDkWhuVf3YnwsCIOoXpXSJfv7uPsAkPLxkkw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QiBH2rGuVA6L9uesqyqK05K5TY1eaFgnn9RckKPAhCR20tNmfCA/koDXLMT9d4U6l
	 AVvt9NcK28mjhIwUCzvVVWLGPWl5dcU9XT24HvjIW/gju7XaCSP7hETaeG3mLnZKpg
	 ozSixednyGGao6Y0/+EyrS53TUSDMIRryf0NFQmwjKsK+dgCd6NWVjCw/m6cuF4J5n
	 feTiyPLqukSXIjpwXqcHPjDRgI4y2xsE3vTz1Ol/qkAtr9EqZ04FCDESgsIHRlCQgY
	 HyKSy4yADn8dPJLBmrTz7Ndk00Cb1TQZp2SvyvI7NqV2pQU5P9Gx3N1thMMfZ7gLFy
	 VxqXz79sNrJaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 927EE40301;
	Wed, 18 Feb 2026 13:07:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33BDD206
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 13:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1998B40029
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 13:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rXObqgP1YU3 for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 13:07:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.36.140.178;
 helo=smtpout7.mo534.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D39340027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D39340027
Received: from smtpout7.mo534.mail-out.ovh.net
 (smtpout7.mo534.mail-out.ovh.net [54.36.140.178])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D39340027
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 13:07:13 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net
 (director2.derp.mail-out.ovh.net [79.137.60.36])
 by mo534.mail-out.ovh.net (Postfix) with ESMTPS id 4fGGWP35ygz5y07;
 Wed, 18 Feb 2026 12:47:45 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net
 (director2.derp.mail-out.ovh.net. [127.0.0.1])
 by director2.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Wed, 18 Feb 2026 12:47:45 +0000 (UTC)
Received: from mta7.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.109.249.162])
 by director2.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4fGGWP1pZLz1xvt; Wed, 18 Feb 2026 12:47:45 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.7])
 (Authenticated sender: mooz@blockos.org)
 by mta7.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 9CB95B81383; 
 Wed, 18 Feb 2026 12:47:44 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Vincent Cruz <mooz@blockos.org>, Vincent Jardin <vjardin@free.fr>
Date: Wed, 18 Feb 2026 13:46:27 +0100
Message-ID: <20260218124726.120001-1-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
x-ovh-tracer-id: 13038202397585165163
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTE+nNOXD6nQQzqjq5k4bis/MCfCALPs2wKTqRMaXJ/DwgYwhPq/M+l+9mUMU5bvNPfnQ0gOM7rRrR6sxjllExo+3RdLc5IpFi0uXU4XiiqeNqPYgxN6FPzb/ZTz8mon9DAR5wtEatHDW+uHDvgYNEkKETFaPeFpEWGFl3uBxJ21YPwnnKiQsTgGLCwl171NGb4QVB5doIr3f0CnA5rySKvzvkf5+TE1bQBNVpTKvIhRckNOIEA5njrlyEZkwmPour8ti16qKRNRkDiKf/mGlw6NRxTjBQYYCBNnzcLV1QYEMYfoPBvzwn1ELvNi2ItIqz2RdxIHxpNyHakWRAxGD5LeZQC2EekUd6+sVbClrTeecNTgAQF4tmd5WD4hunlCjl8nIBi4RW03nCEyHKTTWJCO9bkqwIMo3avnlJcN/U/qI9JFnTtU9RsXJRjmHCjIQIGlza/gr8W6cy3A5U2EaCrl0O2rM+3sXk09MjyrF77vL8gRfxrip1xo78rx97uGKAC7XQ7/qt1bnMpfuJlayes07qRVHEWDyb8DBuJowwxk22UEJ4CStr2XUFHVphuMolWQcfK27VT2IOiTf27SbKviVKDLrmv9nYuJDyGsQOu3lkORvYpJ0pS7XDZGbmTMp3Y/l++nYYaAVyDYVQlN5I+F9MMrOx3PIf5kebIXdC4IvQ
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003359e0ad8-7be4-4434-9255-ee2abc548b5f,
 73C40CA7AD7E4C7BFC2E67F5F8FB9D3A0A627262) smtp.auth=mooz@blockos.org
Subject: [Buildroot] [PATCH] package/sysrepo: fix build on riscv32
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

Fixes:
  https://autobuild.buildroot.net/results/b0f/b0f30feeddad1a8d51ac87af8b7c56fd9a9b5ff6/build-end.log

Upstream: https://github.com/sysrepo/sysrepo/commit/a0661b7e6a7b2f784fe3222048066c31187c6f92

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Vincent Cruz <mooz@blockos.org>
---
Tested with Buildroot gitlab CI:
  https://gitlab.com/v_cz/buildroot/-/pipelines/2331736795

 ...-sr_cond_futex-only-if-SYS_futex-sys.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch

diff --git a/package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch b/package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch
new file mode 100644
index 0000000000..d1d2eac758
--- /dev/null
+++ b/package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch
@@ -0,0 +1,33 @@
+From 6917e00fb6c99a97dacdae7040e5c4c53752b10f Mon Sep 17 00:00:00 2001
+From: Vincent Cruz <mooz@blockos.org>
+Date: Tue, 17 Feb 2026 14:14:06 +0100
+Subject: [PATCH 1/1] cmake UPDATE use sr_cond_futex only if SYS_futex syscall
+ is available
+
+Some architectures (for ex. riscv32) may not support SYS_futex system
+call, even though linux/futex.h include file is present.
+
+Upstream: https://github.com/sysrepo/sysrepo/commit/a0661b7e6a7b2f784fe3222048066c31187c6f92
+
+Signed-off-by: Vincent Cruz <mooz@blockos.org>
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9b36de44..e1b39c8c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -163,7 +163,8 @@ set(NACM_SRMON_DATA_PERM "600" CACHE STRING "NACM modules ietf-netconf-acm and s
+ # sr_cond implementation
+ if(NOT SR_COND_IMPL)
+     check_include_file("linux/futex.h" HAS_FUTEX)
+-    if(HAS_FUTEX)
++    check_symbol_exists(SYS_futex "sys/syscall.h" HAS_SYS_FUTEX)
++    if(HAS_FUTEX AND HAS_SYS_FUTEX)
+         set(SR_COND_IMPL "sr_cond_futex")
+     else()
+         set(SR_COND_IMPL "sr_cond_pthread")
+-- 
+2.51.0
+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
