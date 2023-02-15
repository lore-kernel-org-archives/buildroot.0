Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2C4C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91DEF417A6;
	Wed, 15 Feb 2023 21:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91DEF417A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lc5ZexclPizn; Wed, 15 Feb 2023 21:48:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38E4840209;
	Wed, 15 Feb 2023 21:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38E4840209
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59A061BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32E7181FC6
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32E7181FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JSCN3-oH3M87 for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:48:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D44881FBD
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D44881FBD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C20B85EEE; Wed, 15 Feb 2023 21:48:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 22:46:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b259dac22a4179494e9947c485b6b171d8fef52e
X-Git-Newrev: 3481674ee36fe9fa695e2e6c255bf02b5ab380b0
X-Patchwork-Hint: ignore
Message-Id: <20230215214803.2C20B85EEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dmalloc: don't use SSP
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3481674ee36fe9fa695e2e6c255bf02b5ab380b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dmalloc directly calls into $(LD) to generate a shared library our of
the static one.

To detect what command it should run, ./configure tries various
incantations of ld with various command line options until one does not
fail. One of those is (basically):
    $(LD) --whole-archive -o contest.o.t contest.a

This makes ./configure conclude what the command to link a shared
library in the Makefile should be, and thus stores that in a variable:
    shlinkargs='$(LD) --whole-archive -o $@'

... which is then AC_SUBST()ed into Makefile.in with a rule like:

    $(SHLIB): $(LIBRARY)
        @shlinkargs@ $(LIRARY)

which once substiuted, gives:

    $(SHLIB): $(LIBRARY)
        $(LD) --whole-archive -o $@ $(LIRARY)

However, when SSP is enabled, the __stack_chk_fail_local and co symbols
are provided by additional libraries or object files, and that is the
responsibility of gcc to pass those when linking. But as dmalloc
directly calls ld, it misses those.

Changing dmalloc to use $(CC) is not trivial, however.

First, we can't pass LD=$(TARGET_CC), otherwise the whole package
explodes [0]: indeed --whole-archive is unknown to gcc, so it must be
passed as -Wl,--whole archive instead. So we'd need to add a new test
that uses $(CC), like so:
    $(CC) -Wl,--whole-archive -o contest.o.t contest.a

However, in that case, gcc does pass additional libs/objs (like, for
eample, the SSP ones) to the linker. But then those are also included
in the whole-archive section. This causes the linker to add all the
symbols form those libs/objs, even those not needed for SSP; on some
archs, like PPC, that may require floating point symbols (__muldiv3 et
al.) which are in another library, and thus the linker can't find them.

The proper solution wouild be to add -Wl,--no-whole-archive, but that
would have to be added _after_ the library we want to link, i.e.e we
should be able to evntually run:

    $(CC) -Wl,--whole-archive -o $@ $(LIRARY) -Wl,--no-whole-archive

That would require that we introduce a new variable that is added
_after_ the $(LIBRARY), e.g. @shlinkargs_post@ or so...

This is a bigger endeavour than we want to pursue...

Since dmalloc is a debugging utility, it is not supposed to go into
production builds, and during debugging, it would not be surprising that
it needs to poke around arrays to debug them.

So, we go the easier route: disable SSP altogether.

[0] with lots of nice colors, but that's not the point, is it?

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dmalloc/dmalloc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 6b90f810b2..5bd6691725 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -14,6 +14,13 @@ DMALLOC_LICENSE_FILES = LICENSE.txt
 DMALLOC_INSTALL_STAGING = YES
 DMALLOC_CFLAGS = $(TARGET_CFLAGS)
 
+# dmalloc uses $(LD) to link, and thus misses the object files or libs that
+# are needed to provide the __stack_chk_fail_local and co. symbols. Changing
+# to use $(CC) is really more complex that we'd like. Since dmalloc is
+# involved in debugging memory allocation, it is not expected to be a
+# production library, so we do not care that much that it has SSP.
+DMALLOC_CFLAGS += -fno-stack-protector
+
 ifeq ($(BR2_STATIC_LIBS),y)
 DMALLOC_CONF_OPTS += --disable-shlib
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
