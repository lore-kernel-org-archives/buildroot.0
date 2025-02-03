Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF53EC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5732350778;
	Fri, 28 Feb 2025 17:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EpiRwmATMi6t; Fri, 28 Feb 2025 17:09:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17253404C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17253404C7;
	Fri, 28 Feb 2025 17:09:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1860C711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F1E94251E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjAK8NWeieYN for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B56E42F22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B56E42F22
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80CDC87A92; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 18:41:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b03098645f7473389f878fdf610def79e371cf45
X-Git-Newrev: 30066345aa29bbd773f984448597d40143f7ff80
X-Patchwork-Hint: ignore
Message-Id: <20250228163026.80CDC87A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/optee-client: add
 option to use same version as optee-os
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
Content-Type: multipart/mixed; boundary="===============0394342362504247581=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0394342362504247581==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=30066345aa29bbd773f984448597d40143f7ff80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We can select a custom official version for the optee-os package; add an
option to select the same version for optee-client, to easily keep them
synchronized.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Étienne Carrière <etienne.carriere@foss.st.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/optee-client/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index 738d43f837..efed800a87 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -19,10 +19,16 @@ if BR2_PACKAGE_OPTEE_CLIENT
 
 choice
 	prompt "optee-client version"
+	default BR2_PACKAGE_OPTEE_CLIENT_AS_OS \
+				if BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 	default BR2_PACKAGE_OPTEE_CLIENT_LATEST
 	help
 	  Select the version of optee-client you want to use
 
+config BR2_PACKAGE_OPTEE_CLIENT_AS_OS
+	bool "Same as optee-os being built"
+	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
+
 config BR2_PACKAGE_OPTEE_CLIENT_LATEST
 	bool "4.3.0"
 	help
@@ -52,6 +58,8 @@ endif
 
 config BR2_PACKAGE_OPTEE_CLIENT_VERSION
 	string
+	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
+				if BR2_PACKAGE_OPTEE_CLIENT_AS_OS
 	default "4.3.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL
 

--===============0394342362504247581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0394342362504247581==--
