Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551AED10BF5
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 09:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E91DA81F7C;
	Sat, 26 Oct 2024 09:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6s5Ij-jkJQfq; Sat, 26 Oct 2024 09:57:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09F3881FB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09F3881FB3;
	Sat, 26 Oct 2024 09:57:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5FD92318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 09:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A37AB81F7C
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 09:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzmeZquFt5UM for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 09:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C348D81BD4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C348D81BD4
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 09:57:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B69C183924; Sat, 26 Oct 2024 09:57:35 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 11:47:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82828dfc5720416825ba43c3365a2958666322ea
X-Git-Newrev: 10d25d98edbc75d47f6a8838d91d39e48b12c895
X-Patchwork-Hint: ignore
Message-Id: <20241026095735.B69C183924@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jailhouse: fix python helper
 scripts installation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=10d25d98edbc75d47f6a8838d91d39e48b12c895
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When compiling jailhouse with BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS=y,
installation is failing with error:

    /bin/sh: -c: line 1: syntax error near unexpected token ')'

This error is due to an extra ')' character in the macro
JAILHOUSE_INSTALL_HELPER_SCRIPTS.

This commit fixes this typo.

Signed-off-by: Raimundo Sagarzazu <rai.sagarzazu@outlook.com>
[Julien: reworded the commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jailhouse/jailhouse.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index b5a8b40fdd..1354acf600 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -44,7 +44,7 @@ define JAILHOUSE_INSTALL_HELPER_SCRIPTS
 	$(HOST_DIR)/bin/python setup.py \
 		install --no-compile \
 		$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
-		--root=$(TARGET_DIR))
+		--root=$(TARGET_DIR)
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
