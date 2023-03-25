Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B73DC6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 21:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF2B781762;
	Sat, 25 Mar 2023 21:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF2B781762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bNaALkko0GJo; Sat, 25 Mar 2023 21:08:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32CA98198D;
	Sat, 25 Mar 2023 21:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32CA98198D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A2BC1BF39A
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BD33404DD
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BD33404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5hzWFdAymoji for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 526B140447
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 526B140447
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4138D82AB9; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 21:24:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 067a69412a5d274ed3771c52fb9864cc37cb16d8
X-Git-Newrev: 658e7626e54965669bf51e5e6d470d2638b1ac33
X-Patchwork-Hint: ignore
Message-Id: <20230325210739.4138D82AB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-autotools: set AUTOPOINT via
 AUTOCONF_ENV
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

commit: https://git.buildroot.net/buildroot/commit/?id=658e7626e54965669bf51e5e6d470d2638b1ac33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously, AUTOPOINT was hardcoded to /bin/true in autoconf.mk.

Moving the definition of this variable into AUTOCONF_ENV as part of the
autotools infrastructure will allow us to conditionally set the variable
based on package flags to support migrating away from FOO_GETTEXTIZE.

While we're at it, split the overly long line that defines AUTORECONF,
wrapping at 80 columns.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
[Arnout: split long line]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/autoconf/autoconf.mk | 5 ++++-
 package/pkg-autotools.mk     | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 7e0850422b..15ce9d5927 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -23,4 +23,7 @@ $(eval $(host-autotools-package))
 # variables used by other packages
 AUTOCONF = $(HOST_DIR)/bin/autoconf -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
 AUTOHEADER = $(HOST_DIR)/bin/autoheader -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
-AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true GTKDOCIZE=/bin/true $(HOST_DIR)/bin/autoreconf -f -i
+AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" \
+	AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" \
+	AUTOMAKE="$(AUTOMAKE)" GTKDOCIZE=/bin/true \
+	$(HOST_DIR)/bin/autoreconf -f -i
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 55d95d204e..418cd10945 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -241,6 +241,7 @@ ifeq ($$($(2)_GETTEXTIZE),YES)
 $(2)_PRE_CONFIGURE_HOOKS += GETTEXTIZE_HOOK
 $(2)_DEPENDENCIES += host-gettext
 endif
+$(2)_AUTORECONF_ENV += AUTOPOINT=/bin/true
 $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
 # default values are not evaluated yet, so don't rely on this defaulting to YES
 ifneq ($$($(2)_LIBTOOL_PATCH),NO)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
