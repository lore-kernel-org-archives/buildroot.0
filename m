Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E31EC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2F724F1BE;
	Tue, 21 Feb 2023 00:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2F724F1BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVCxG9d5OLiz; Tue, 21 Feb 2023 00:17:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB18C4F07E;
	Tue, 21 Feb 2023 00:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB18C4F07E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37DBF1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B42746FAF4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B42746FAF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXI2yk1gO5li for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC09A6FAC0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC09A6FAC0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8FDA8648F; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Jan 2023 08:28:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 16168abd26b06656bcc24c2b511c29a0f047ebf4
X-Git-Newrev: 7ff5f7ff0a5ffb8de98d132740fe2fbe4fb71b5a
X-Patchwork-Hint: ignore
Message-Id: <20230220205226.C8FDA8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hiredis: fix debug
 install
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ff5f7ff0a5ffb8de98d132740fe2fbe4fb71b5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

hiredis suffix its debug libraries with "d" since version 1.1.0 and
https://github.com/redis/hiredis/commit/dde6916b42a4723b364355eff8fbb477723a789a
resulting in the following build failure with collectd since commit
bd7e90779861bb603fc1cca03f6fad4d951f7bd9:

    redis . . . . . . . . no (symbol 'redisCommand' not found) (dependency error)

Fixes:
 - http://autobuild.buildroot.org/results/394ebf2b6816c69dbdd7901491c0e3fd52befedc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hiredis/hiredis.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index d59933845c..f79b6c757a 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -11,7 +11,9 @@ HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
 HIREDIS_CPE_ID_VENDOR = redislabs
 HIREDIS_INSTALL_STAGING = YES
-HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON
+# Set CMAKE_BUILD_TYPE to Release or the libraries will be suffixed with "d"
+# resulting in a build failure with collectd
+HIREDIS_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release -DDISABLE_TESTS=ON
 
 ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 HIREDIS_CONF_OPTS += -DENABLE_SSL=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
