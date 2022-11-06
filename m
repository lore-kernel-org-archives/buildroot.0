Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554BFC6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0025940320;
	Mon, 20 Feb 2023 20:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0025940320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJwwTKK5Cgth; Mon, 20 Feb 2023 20:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9D1441D63;
	Mon, 20 Feb 2023 20:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9D1441D63
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F4371BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB00940C03
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB00940C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zln2AyzSc2Pe for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B787A40C0C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B787A40C0C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B06FB86495; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 13:19:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0fc1bf137e44caf44a018cf948d5bd2a10566860
X-Git-Newrev: 0d9f268424558c37cd9538596358a537cd2f882d
X-Patchwork-Hint: ignore
Message-Id: <20230220205147.B06FB86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/crun: fix musl and
 uclibc-ng builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d9f268424558c37cd9538596358a537cd2f882d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following musl and uclibc-ng build failures raised since the
addition of the package in commit
530d6f661e506a4774b7236cb93d65f669adbc92:

configure: error: *** argp functions not found - install libargp or argp_standalone

Fixes:
 - http://autobuild.buildroot.org/results/55b283fa46a797253193fb752638ba88597a416b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/crun/Config.in | 1 +
 package/crun/crun.mk   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/crun/Config.in b/package/crun/Config.in
index 5aca10dcdb..5def7001c1 100644
--- a/package/crun/Config.in
+++ b/package/crun/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CRUN
 	bool "crun"
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_YAJL # libocispec
 	help
 	  crun is a fast and low-memory OCI Container Runtime in C.
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index 4a0c150594..65f166e657 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -15,6 +15,10 @@ CRUN_CPE_ID_VENDOR = crun_project
 CRUN_AUTORECONF = YES
 CRUN_CONF_OPTS = --disable-embedded-yajl
 
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+CRUN_DEPENDENCIES += argp-standalone
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 CRUN_DEPENDENCIES += libcap
 CRUN_CONF_OPTS += --enable-caps
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
