Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69771C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14F606FB96;
	Tue, 21 Feb 2023 01:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14F606FB96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z61Fgoizbg2e; Tue, 21 Feb 2023 01:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D0AB700A3;
	Tue, 21 Feb 2023 01:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D0AB700A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 964811BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E890D6FE66
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E890D6FE66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TASEbqLxe5q4 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13C8D6FC28
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13C8D6FC28
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03BDF86495; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 12:28:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1a1081dcbf8d706b08df53fe2ff2d652caf889ae
X-Git-Newrev: 231d00e63ac08c98d7e823c3bd60a618ff322577
X-Patchwork-Hint: ignore
Message-Id: <20230220205252.03BDF86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain/toolchain-wrapper.c:
 set CCACHE env variables only when ccache is enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=231d00e63ac08c98d7e823c3bd60a618ff322577
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit modifies the toolchain-wrapper to make sure that the
CCACHE_COMPILERCHECK and CCACHE_BASEDIR are only set if ccache support
is enabled. Indeed, when BR2_USE_CCACHE is not set (or to a value
different than 1), we don't call the compiler with ccache, so there is
no reason to set those ccache environment variables, and they could
potentially conflict with a separate usage of ccache, outside of
Buildroot, for example when using the Buildroot SDK.

In particular, the value of CCACHE_BASEDIR doesn't not make any sense
when the Buildroot toolchain is not used during the Buildroot build,
as it points to the output directory $(BASE_DIR).

We pay attention to also not show those variables as being set in the
BR2_DEBUG_WRAPPER dump.

To help a little bit with this, a ccache_enabled boolean is introduced
to indicate when ccache is being used.

There is still quite a bit of #ifdef-ery involved, but it's not easy
to find a simpler way to organize the code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-By: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/toolchain-wrapper.c | 49 ++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 4c08e97237..f66e588bfd 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -494,10 +494,28 @@ int main(int argc, char **argv)
 
 	exec_args = args;
 #ifdef BR_CCACHE
-	/* If BR2_USE_CCACHE is not defined, or its value is not 1,
-	 * skip the ccache call */
+	/* If BR2_USE_CCACHE is set and its value is 1, enable ccache
+	 * usage */
 	char *br_use_ccache = getenv("BR2_USE_CCACHE");
-	if (!br_use_ccache || strncmp(br_use_ccache, "1", strlen("1")))
+	bool ccache_enabled = br_use_ccache && !strncmp(br_use_ccache, "1", strlen("1"));
+
+	if (ccache_enabled) {
+#ifdef BR_CCACHE_HASH
+		/* Allow compilercheck to be overridden through the environment */
+		if (setenv("CCACHE_COMPILERCHECK", "string:" BR_CCACHE_HASH, 0)) {
+			perror(__FILE__ ": Failed to set CCACHE_COMPILERCHECK");
+			return 3;
+		}
+#endif
+#ifdef BR_CCACHE_BASEDIR
+		/* Allow compilercheck to be overridden through the environment */
+		if (setenv("CCACHE_BASEDIR", BR_CCACHE_BASEDIR, 0)) {
+			perror(__FILE__ ": Failed to set CCACHE_BASEDIR");
+			return 3;
+		}
+#endif
+	} else
+		/* ccache is disabled, skip it */
 		exec_args++;
 #endif
 
@@ -505,12 +523,14 @@ int main(int argc, char **argv)
 	if (debug > 0) {
 		fprintf(stderr, "Toolchain wrapper executing:");
 #ifdef BR_CCACHE_HASH
-		fprintf(stderr, "%sCCACHE_COMPILERCHECK='string:" BR_CCACHE_HASH "'",
-			(debug == 2) ? "\n    " : " ");
+		if (ccache_enabled)
+			fprintf(stderr, "%sCCACHE_COMPILERCHECK='string:" BR_CCACHE_HASH "'",
+				(debug == 2) ? "\n    " : " ");
 #endif
 #ifdef BR_CCACHE_BASEDIR
-		fprintf(stderr, "%sCCACHE_BASEDIR='" BR_CCACHE_BASEDIR "'",
-			(debug == 2) ? "\n    " : " ");
+		if (ccache_enabled)
+			fprintf(stderr, "%sCCACHE_BASEDIR='" BR_CCACHE_BASEDIR "'",
+				(debug == 2) ? "\n    " : " ");
 #endif
 		for (i = 0; exec_args[i]; i++)
 			fprintf(stderr, "%s'%s'",
@@ -518,21 +538,6 @@ int main(int argc, char **argv)
 		fprintf(stderr, "\n");
 	}
 
-#ifdef BR_CCACHE_HASH
-	/* Allow compilercheck to be overridden through the environment */
-	if (setenv("CCACHE_COMPILERCHECK", "string:" BR_CCACHE_HASH, 0)) {
-		perror(__FILE__ ": Failed to set CCACHE_COMPILERCHECK");
-		return 3;
-	}
-#endif
-#ifdef BR_CCACHE_BASEDIR
-	/* Allow compilercheck to be overridden through the environment */
-	if (setenv("CCACHE_BASEDIR", BR_CCACHE_BASEDIR, 0)) {
-		perror(__FILE__ ": Failed to set CCACHE_BASEDIR");
-		return 3;
-	}
-#endif
-
 	if (execv(exec_args[0], exec_args))
 		perror(path);
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
