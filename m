Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3D7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E71A385A28;
	Sun, 12 Dec 2021 14:20:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JMQHai3Ojij3; Sun, 12 Dec 2021 14:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41C1F85A25;
	Sun, 12 Dec 2021 14:20:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA2011BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91EA860D96
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xkl1tbphUI-N for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:20:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C56DB60A8B
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:20:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DC5C282DFB; Sun, 12 Dec 2021 14:15:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 11:50:21 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 5997470110ca314ce060ad9b69bba2ab5e187ba1
X-Git-Newrev: ebc6277adf78a99aadd1746740b41d22af153d64
X-Patchwork-Hint: ignore
Message-Id: <20211212141521.DC5C282DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/e2fsprogs: don't
 install compile_et
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebc6277adf78a99aadd1746740b41d22af153d64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Don't install compile_et as it raises the following build failure with
samba4 since, at least, bump to version 4.14.7 in commit
630e85f8f5ed64933b45599fc4332d9609177c5c:

source4/heimdal/lib/asn1/asn1_err.c:47:23: error: 'link' redeclared as different kind of symbol
   47 | static struct et_list link = { 0, 0 };
      |                       ^~~~
In file included from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/bits/sigstksz.h:24,
                 from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/signal.h:328,
                 from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/sys/param.h:28,
                 from ../../lib/replace/../replace/replace.h:659,
                 from ../../source4/heimdal_build/config.h:10,
                 from source4/heimdal/lib/asn1/asn1_err.c:1:
/home/giuliobenetti/autobuild/run/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/unistd.h:819:12: note: previous declaration of 'link' was here
  819 | extern int link (const char *__from, const char *__to)
      |            ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/d6de6ed59c553f6f413d280f3c65184945bb3850

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dd89074e8338b2114832469e2a188ff7824a7e25)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/e2fsprogs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index e40af73cce..80a7065985 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -80,5 +80,11 @@ define HOST_E2FSPROGS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) install install-libs
 endef
 
+# Remove compile_et which raises a build failure with samba4
+define HOST_E2FSPROGS_REMOVE_COMPILE_ET
+	$(RM) $(HOST_DIR)/bin/compile_et
+endef
+HOST_E2FSPROGS_POST_INSTALL_HOOKS += HOST_E2FSPROGS_REMOVE_COMPILE_ET
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
