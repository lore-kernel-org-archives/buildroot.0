Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78B1C433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B721340A69;
	Thu,  2 Dec 2021 17:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hpQr4y00U-8; Thu,  2 Dec 2021 17:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C448240A65;
	Thu,  2 Dec 2021 17:40:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2CA1BF9D1
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D14060644
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hSeDKLNaer9m for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:40:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 767046063F
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:40:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 489DE922AF; Thu,  2 Dec 2021 17:35:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Dec 2021 18:20:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76e66240da9b5dac8177fca4deb0f66c3c994023
X-Git-Newrev: dd89074e8338b2114832469e2a188ff7824a7e25
X-Patchwork-Hint: ignore
Message-Id: <20211202173531.489DE922AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/e2fsprogs: don't install compile_et
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd89074e8338b2114832469e2a188ff7824a7e25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/e2fsprogs/e2fsprogs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index ca891066a2..76215e8c34 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -90,5 +90,11 @@ define HOST_E2FSPROGS_INSTALL_CMDS
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
