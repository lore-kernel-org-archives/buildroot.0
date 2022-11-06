Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBC5C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 13:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 215FF40150;
	Sun,  6 Nov 2022 13:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 215FF40150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fa3EEeKiBcEI; Sun,  6 Nov 2022 13:54:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F8DE400E5;
	Sun,  6 Nov 2022 13:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F8DE400E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3DF31BF314
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 13:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B587C403CA
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 13:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B587C403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bb_AOm44HLhf for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 13:53:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C1B1403C7
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 13:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C1B1403C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F81287FEC; Sun,  6 Nov 2022 13:53:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 13:19:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fc1bf137e44caf44a018cf948d5bd2a10566860
X-Git-Newrev: 0d9f268424558c37cd9538596358a537cd2f882d
X-Patchwork-Hint: ignore
Message-Id: <20221106135359.7F81287FEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crun: fix musl and uclibc-ng builds
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
