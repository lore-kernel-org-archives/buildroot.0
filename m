Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749F5C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 09:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28CBD60D57;
	Sun,  3 Apr 2022 09:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IEBpLrj0P-GO; Sun,  3 Apr 2022 09:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 116D560C24;
	Sun,  3 Apr 2022 09:43:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39DF61BF599
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27683403AC
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I2QmW8QC8sHl for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 09:43:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C82D40145
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 09:43:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 072E185ED7; Sun,  3 Apr 2022 09:34:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 11:32:19 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 14c91f703526fee8e0b09a28018a57b0a835ccdd
X-Git-Newrev: cd7f1dcad51c1dc77bb1d8a285180c69b2b60f41
X-Patchwork-Hint: ignore
Message-Id: <20220403093405.072E185ED7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-treq: fix
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd7f1dcad51c1dc77bb1d8a285180c69b2b60f41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

python-treq needs TLS support in twisted so select
BR2_PACKAGE_PYTHON_TWISTED_TLS moreover it doesn't depend directly on
service_identity and pyOpenSSL since version 17.3.0 and
https://github.com/twisted/treq/commit/ef2ac7ea2b74774adb9fef7675facc6017bfda89

Finally, python-idna was never a direct dependency of python-treq

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b5b4496c425576e4e444b65474d397aeb4a7cd42)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-treq/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 6ca8be8ab7..9fd0f8b0ed 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -3,13 +3,11 @@ config BR2_PACKAGE_PYTHON_TREQ
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
 	depends on BR2_PACKAGE_PYTHON3 # python-twisted
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
-	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
-	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
-	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	select BR2_PACKAGE_PYTHON_TWISTED_TLS # runtime
 	help
 	  treq is an HTTP library inspired by requests but written on
 	  top of Twisted's Agents. It provides a simple, higher level
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
