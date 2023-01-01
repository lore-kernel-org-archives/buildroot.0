Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF4BC4167B
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 18:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F50B402BC;
	Sun,  1 Jan 2023 18:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F50B402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jOxzQhQGEUJV; Sun,  1 Jan 2023 18:24:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93BDF400D2;
	Sun,  1 Jan 2023 18:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93BDF400D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A7DC1BF41A
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 239FA60AD5
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 239FA60AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FfaX3ntNNwqp for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 18:24:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54A7560ACE
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 18:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54A7560ACE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 447AA87072; Sun,  1 Jan 2023 18:24:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Jan 2023 19:22:15 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 4d41c163d57864e8f86b42a409cfed6354c4275f
X-Git-Newrev: e68074e21e4b5e13dd0a4425edfdec72cd0bdbdc
X-Patchwork-Hint: ignore
Message-Id: <20230101182406.447AA87072@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/fmlib: fix build
 for ppc e500mc
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

commit: https://git.buildroot.net/buildroot/commit/?id=e68074e21e4b5e13dd0a4425edfdec72cd0bdbdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

When BR2_powerpc_e500mc=y, fmlib package compilation fails with output:

    make[2]: *** No rule to make target 'libfm-e500mc.a'.  Stop.

The fmlib package "make help" command shows:

    The available make libfm-<arch>.a targets are:
	    libfm-ppce500mc.a		(P2, P3, P4)
    ...

The package Config.in incorrectly sets BR2_PACKAGE_FMLIB_ARCHTYPE
to "e500mc", which is then passed as the package make target.
The correct value should be "ppce500mc".

The commit fixes this build issue.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1df9d42bdd8cc2e594d6337ee62c3f31499baf80)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fmlib/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index df4ae440ea..7bccfd7c83 100644
--- a/package/fmlib/Config.in
+++ b/package/fmlib/Config.in
@@ -37,7 +37,7 @@ endchoice
 
 config BR2_PACKAGE_FMLIB_ARCHTYPE
 	string
-	default "e500mc" if BR2_powerpc_e500mc
+	default "ppce500mc" if BR2_powerpc_e500mc
 	default "ppc64e6500" if BR2_powerpc_e6500 && BR2_powerpc64
 	default "ppc32e6500" if BR2_powerpc_e6500 && BR2_powerpc
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
