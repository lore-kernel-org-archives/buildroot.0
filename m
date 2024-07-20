Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEDDC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ACC040356;
	Sat, 20 Jul 2024 21:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBvY7ZtE31Yo; Sat, 20 Jul 2024 21:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B998404E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B998404E3;
	Sat, 20 Jul 2024 21:06:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E2511BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17967400D8
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAWouYaD1VXS for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CA2F40151
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CA2F40151
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:05:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06122822BA; Sat, 20 Jul 2024 21:05:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:05:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 910e91f3b0311bc9dc5ef00c43b6e3c930eac300
X-Git-Newrev: 29d29569ebde681d28db9d6bc123d3487e240134
X-Patchwork-Hint: ignore
Message-Id: <20240720210558.06122822BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openswan: select libxcrypt if
 needed
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=29d29569ebde681d28db9d6bc123d3487e240134
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-7/output-1/build/openswan-3.0.0/programs/pluto/xauth.c:36:10: fatal error: crypt.h: No such file or directory
   36 | #include <crypt.h>
      |          ^~~~~~~~~

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/df7cce809e3e4aa92e700a3fc5105c6c20f21f6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openswan/Config.in   | 1 +
 package/openswan/openswan.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index 724654e984..31c4a66b35 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_OPENSWAN
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_IPROUTE2
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Openswan is an implementation of IPsec for Linux
 
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 4c6a779f0d..64218810f8 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -22,6 +22,10 @@ OPENSWAN_DEPENDENCIES += libcurl
 OPENSWAN_MAKE_OPTS += USE_LIBCURL=true
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+OPENSWAN_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENSWAN_DEPENDENCIES += openssl
 OPENSWAN_MAKE_OPTS += HAVE_OPENSSL=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
