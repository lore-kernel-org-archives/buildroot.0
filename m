Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF556C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:35:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A29A61130
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A29A61130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7639960EA4;
	Wed,  6 Oct 2021 14:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Enk3INKT-86c; Wed,  6 Oct 2021 14:35:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C22D860EA0;
	Wed,  6 Oct 2021 14:35:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81A491BF36B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F125605FB
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5qGs0NOzZW3 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 14:35:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD29A60600
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 14:35:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B798892264; Wed,  6 Oct 2021 14:32:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 16:31:55 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 7da52aaf0f77f908c6e06d778361d43d7f068099
X-Git-Newrev: bba5c4345aade8cf5c39f9cc4dc029f6ad7dbbac
X-Patchwork-Hint: ignore
Message-Id: <20211006143231.B798892264@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/refpolicy: make
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
Content-Type: multipart/mixed; boundary="===============7622094727471256191=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7622094727471256191==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bba5c4345aade8cf5c39f9cc4dc029f6ad7dbbac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
index 1180f0d38b..ecd8cf226b 100644
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

--===============7622094727471256191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7622094727471256191==--
