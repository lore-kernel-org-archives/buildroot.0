Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2F3C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:01:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA2AE61057
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA2AE61057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9392F404CA;
	Tue,  7 Sep 2021 13:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3bTRdVHY4pn; Tue,  7 Sep 2021 13:01:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BF1740252;
	Tue,  7 Sep 2021 13:01:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BC0C1BF334
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C2CE60663
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QvOeFYL3pdIU for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 13:01:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBFF060635
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 13:01:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1385C8880E; Tue,  7 Sep 2021 12:59:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 14:39:39 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 4c787fb093a6014bf68da7f08ea914c10b52c7f1
X-Git-Newrev: 4a6066128057d702c35602aceb84b2bec988055b
X-Patchwork-Hint: ignore
Message-Id: <20210907125934.1385C8880E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/coreutils:
 Prevent overwriting of fakedate
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4a6066128057d702c35602aceb84b2bec988055b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

When BR2_REPRODUCIBLE is set and host-coreutils needs to be built, the
fakedate script installed to 'host/bin/date' will be overwritten by
host-coreutils.

Besides, we do not need our host-coreutils for 'date' at all; we really
rely on the host system to provide it.

Unconditionally disable installing the 'date' binary in host-coreutils.

Note that we explicitly request only ln and realpath to be installed,
but the coreutils buildsystem does not strictly obey to that, as was
already noticed in 885e6fdb8a40 (package/coreutils: introduce a host
variant), which added that comment above HOST_COREUTILS_CONF_OPTS:

    # Explicitly install ln and realpath, which we *are* insterested in.
    # A lot of other programs still get installed, however, but disabling
    # them does not gain much at build time, and is a loooong list that is
    # difficult to maintain...

So, we also update that comment to explain why we still anyway disable
installation of 'date'.

Signed-off-by: Conrad Ratschan <conrad.ratschan@collins.com>
[yann.morin.1998@free.fr:
  - unconditionally disable installing date
  - extend comment and commit log to explain why we need
    --enable-no-install-program=date despite the existing
    --enable-install-program=ln,realpath
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bdf792910945f287beda6d9262492f1910646a61)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 65234a113e..3ec3c847c2 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -154,7 +154,8 @@ COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_FIX_CHROOT_LOCATION
 # Explicitly install ln and realpath, which we *are* insterested in.
 # A lot of other programs still get installed, however, but disabling
 # them does not gain much at build time, and is a loooong list that is
-# difficult to maintain...
+# difficult to maintain... Just avoid overwriting fakedate when creating
+# a reproducible build
 HOST_COREUTILS_CONF_OPTS = \
 	--disable-acl \
 	--disable-libcap \
@@ -162,7 +163,8 @@ HOST_COREUTILS_CONF_OPTS = \
 	--disable-single-binary \
 	--disable-xattr \
 	--without-gmp \
-	--enable-install-program=ln,realpath
+	--enable-install-program=ln,realpath \
+	--enable-no-install-program=date
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
