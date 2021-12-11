Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FB8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 08:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43BD142A2A;
	Sat, 11 Dec 2021 08:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olOP70TQiTv4; Sat, 11 Dec 2021 08:01:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74051429BF;
	Sat, 11 Dec 2021 08:01:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 956A41BF592
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 08:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A7124234F
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 08:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Poe4xDjdHOp for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 08:01:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67F464018B
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 08:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6C0A782673; Sat, 11 Dec 2021 07:56:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 08:46:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 7e41ae43fd945a7bc5fd703c34b2d39110f0f378
X-Git-Newrev: 36770de4e73a989fb899fcd68e013dc74f98b36b
X-Patchwork-Hint: ignore
Message-Id: <20211211075605.6C0A782673@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gdb: fix NLS build
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

commit: https://git.buildroot.net/buildroot/commit/?id=36770de4e73a989fb899fcd68e013dc74f98b36b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix the following build failure raised since version 10.1 and
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=9a665d62266e75f0519f3a663784c458885b5c63:

  CXXLD  libinproctrace.so
/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: gdbsupport/tdesc-ipa.o: in function `print_xml_feature::visit(tdesc_type_builtin const*)':
/home/buildroot/autobuild/instance-2/output-1/build/gdb-10.2/build/gdbserver/../../gdbserver/../gdbsupport/tdesc.cc:310: undefined reference to `libintl_gettext'

Fixes:
 - http://autobuild.buildroot.org/results/faacc874fe9d32b74cb3d3dea988ef661cb0e3d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 2da1267c1e223c416a2f428dcf5dcb6ea1257956)
[Peter: drop 11.1 patch]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0008-gdbserver-Makefile.in-fix-NLS-build.patch | 38 ++++++++++++++++++++++
 package/gdb/gdb.mk                                 |  1 +
 2 files changed, 39 insertions(+)

diff --git a/package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
new file mode 100644
index 0000000000..3d7534a48a
--- /dev/null
+++ b/package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
@@ -0,0 +1,38 @@
+From c098500aee945ee7a3021649eb0a2655b004103c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 18 Nov 2021 22:52:08 +0100
+Subject: [PATCH] gdbserver/Makefile.in: fix NLS build
+
+Fix the following build failure raised since gdb version 10.1 and
+https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=9a665d62266e75f0519f3a663784c458885b5c63:
+
+  CXXLD  libinproctrace.so
+/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: gdbsupport/tdesc-ipa.o: in function `print_xml_feature::visit(tdesc_type_builtin const*)':
+/home/buildroot/autobuild/instance-2/output-1/build/gdb-10.2/build/gdbserver/../../gdbserver/../gdbsupport/tdesc.cc:310: undefined reference to `libintl_gettext'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/faacc874fe9d32b74cb3d3dea988ef661cb0e3d0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://sourceware.org/pipermail/gdb-patches/2021-November/183580.html]
+---
+ gdbserver/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
+index 71c3c4ad959..e69fbc4dae4 100644
+--- a/gdbserver/Makefile.in
++++ b/gdbserver/Makefile.in
+@@ -383,7 +383,7 @@ $(IPA_LIB): $(sort $(IPA_OBJS)) ${CDEPS}
+	$(SILENCE) rm -f $(IPA_LIB)
+ 	$(ECHO_CXXLD) $(CC_LD) -shared -fPIC -Wl,--soname=$(IPA_LIB) \
+ 		-Wl,--no-undefined $(INTERNAL_CFLAGS) $(INTERNAL_LDFLAGS) \
+-		-o $(IPA_LIB) ${IPA_OBJS} -ldl -pthread
++		-o $(IPA_LIB) ${IPA_OBJS} -ldl -pthread $(INTL)
+ 
+ # Put the proper machine-specific files first, so M-. on a machine
+ # specific routine gets the one for the correct machine.
+-- 
+2.33.0
+
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index e69dabd757..39d3c59937 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -166,6 +166,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
 GDB_CONF_OPTS += --enable-gdbserver
+GDB_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
 else
 GDB_CONF_OPTS += --disable-gdbserver
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
