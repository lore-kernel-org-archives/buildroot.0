Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685A7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 141C585A00;
	Sun, 12 Dec 2021 14:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id soe967JjQiUe; Sun, 12 Dec 2021 14:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FC92859FF;
	Sun, 12 Dec 2021 14:35:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4709F1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 407A18597D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r635o978rbUI for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:35:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83A4A84FB6
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:35:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 96C2A83236; Sun, 12 Dec 2021 14:29:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 11:48:28 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: c795b817a9c785d29c7abc4de939d203b20c92d9
X-Git-Newrev: 92309ec38c7b70115bb8b9db1e67cd8415a9325a
X-Patchwork-Hint: ignore
Message-Id: <20211212142951.96C2A83236@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/e2fsprogs: don't
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

commit: https://git.buildroot.net/buildroot/commit/?id=92309ec38c7b70115bb8b9db1e67cd8415a9325a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
index bd147e737e..fd7e9fe744 100644
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
