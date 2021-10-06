Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCD9C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:37:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CD75610C8
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CD75610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04361605FB;
	Wed,  6 Oct 2021 14:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_jfDvC1PK8e; Wed,  6 Oct 2021 14:37:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57432606BB;
	Wed,  6 Oct 2021 14:37:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 82C3E1BF9B6
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E6FD60E9D
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OpNGWsVTmDT9 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 14:35:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB351606BB
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 14:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A80819230E; Wed,  6 Oct 2021 14:32:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 16:31:41 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 64699c338f030f383318df02e8e5ff392a081039
X-Git-Newrev: 081262c59f1a8a20077575eda43990fb649d1f54
X-Patchwork-Hint: ignore
Message-Id: <20211006143256.A80819230E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/refpolicy: make
 sure xmllint is used
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
Content-Type: multipart/mixed; boundary="===============9066036420051944968=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9066036420051944968==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=081262c59f1a8a20077575eda43990fb649d1f54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

When parsing and adding modules the refpolicy build system checks their
validity using xmllint. By default the host system version is used and
if not found an error is displayed but the build is not stopped. This
leads to interesting issues where modules are not added correctly to
modules.conf[1] (other possible issues are likely).

Fix this by adding a dependency on host-libxml2 and explicitly use the
xmllint binary built by Buildroot.

[1] https://lore.kernel.org/buildroot/20210830114531.2285178-1-jose.pekkarinen@unikie.com/

Tested-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Antoine Tenart <atenart@kernel.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5141cee10939c56da3741967c128c58eac190222)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/refpolicy/refpolicy.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index a42483dba2..7782a5be54 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -14,7 +14,8 @@ REFPOLICY_DEPENDENCIES = \
 	host-policycoreutils \
 	host-python3 \
 	host-setools \
-	host-gawk
+	host-gawk \
+	host-libxml2
 
 ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)
 REFPOLICY_VERSION = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION))
@@ -30,6 +31,7 @@ endif
 # Cannot use multiple threads to build the reference policy
 REFPOLICY_MAKE = \
 	PYTHON=$(HOST_DIR)/usr/bin/python3 \
+	XMLLINT=$(LIBXML2_HOST_BINARY) \
 	TEST_TOOLCHAIN=$(HOST_DIR) \
 	$(TARGET_MAKE_ENV) \
 	$(MAKE1)

--===============9066036420051944968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9066036420051944968==--
