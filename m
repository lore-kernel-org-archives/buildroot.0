Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D600C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:31:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 795F860F6D
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 795F860F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BD6B404D7;
	Mon, 27 Sep 2021 16:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBZ_6hMWn0XP; Mon, 27 Sep 2021 16:31:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F49D404D1;
	Mon, 27 Sep 2021 16:31:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 672161BF955
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53627404D1
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMTQFHaliXlw for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 16:31:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CCEA401E9
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 16:31:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D38528D328; Mon, 27 Sep 2021 16:29:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 18:31:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 502b8576c44e18b7721c042d9fc72dbba5e08473
X-Git-Newrev: 5141cee10939c56da3741967c128c58eac190222
X-Patchwork-Hint: ignore
Message-Id: <20210927162920.D38528D328@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: make sure xmllint is
 used
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
Content-Type: multipart/mixed; boundary="===============0992829891406528755=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0992829891406528755==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5141cee10939c56da3741967c128c58eac190222
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/refpolicy/refpolicy.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index eb345d0f98..975c3b584c 100644
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

--===============0992829891406528755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0992829891406528755==--
