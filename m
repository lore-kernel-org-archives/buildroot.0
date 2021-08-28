Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09CCC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 12:22:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A1B660EAF
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 12:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A1B660EAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 170B360673;
	Sat, 28 Aug 2021 12:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdi41M5qdhH5; Sat, 28 Aug 2021 12:22:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E68760688;
	Sat, 28 Aug 2021 12:22:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 199831BF319
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 12:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07A3683E6B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 12:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fxGndBLcG4HJ for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 12:22:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AFF283E66
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 12:22:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2FFAD8ED94; Sat, 28 Aug 2021 12:21:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 14:21:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 033561487604cfcf7282ee6c57bef79c8bd3013d
X-Git-Newrev: bdf792910945f287beda6d9262492f1910646a61
X-Patchwork-Hint: ignore
Message-Id: <20210828122118.2FFAD8ED94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: Prevent overwriting of
 fakedate
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=bdf792910945f287beda6d9262492f1910646a61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
