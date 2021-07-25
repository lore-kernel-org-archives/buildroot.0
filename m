Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A63C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:20:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF9860F23
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EF9860F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D35A2400FD;
	Sun, 25 Jul 2021 21:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-z6Mf_WXx1E; Sun, 25 Jul 2021 21:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D77A1400D9;
	Sun, 25 Jul 2021 21:20:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EB4D1BF95A
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E5EB6069D
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V6Xh3ao_sKrz for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:19:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 562A660609
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:19:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7DF9988F7D; Sun, 25 Jul 2021 20:45:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 23:12:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5609c63f0b1b11f4c036c2203b01fa697968d173
X-Git-Newrev: 049135c409b081d37b9455cd7564c8581334e11b
X-Patchwork-Hint: ignore
Message-Id: <20210725204515.7DF9988F7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-external: fixup gdb
 pretty-printer loader for libstdcxx
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

commit: https://git.buildroot.net/buildroot/commit/?id=049135c409b081d37b9455cd7564c8581334e11b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc installs a libstdcxx-...so-gdb.py file that gdb will load automatically
when it loads libstdcxx.so, via the mechanism described at [1].

However, the auto-load file installed by gcc contains hardcoded paths
referring to the location where the (external) toolchain was built, which
are normally not available.

Fix up the paths in the load file so that the pretty printers can be loaded
automatically.

Note that gdb will only auto-load the file if its location is marked as
'safe'. A subsequent commit will take care of that.

Technically, there could be more than one load file, e.g. in lib and
usr/lib, so fix them all. This was for example observed in
BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64.
In a very specific case with a local custom toolchain, there were actually
two 'python' directories, which would break the sed command, so arbitrarily
limit to the first one encountered.

[1] https://sourceware.org/gdb/onlinedocs/gdb/objfile_002dgdbdotext-file.html

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external/pkg-toolchain-external.mk    | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 6d91cb5d1e..68d7a3fe21 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -485,6 +485,26 @@ define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
 	fi
 endef
 
+# GCC installs a libstdcxx-...so-gdb.py file that gdb will load automatically,
+# but it contains hardcoded paths referring to the location where the (external)
+# toolchain was built. Fix up these paths so that the pretty printers can be
+# loaded automatically.
+# By default, the pretty printers are installed in
+# $(datadir)/gcc-$(gcc_version)/python but this could have been overwritten with
+# the gcc configure option: --with-python-dir. We thus have to search the
+# correct path first.
+define TOOLCHAIN_EXTERNAL_FIXUP_PRETTY_PRINTER_LOADER
+	$(Q)loadfiles=$$(find $(STAGING_DIR) -name 'libstdc++.so*-gdb.py' 2>/dev/null); \
+	pythondir=$$(find $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR) -path '*/libstdcxx/__init__.py' 2>/dev/null | sed 's%/libstdcxx/__init__.py%%' | head -n1); \
+	if [ -n "$$loadfiles" ] && [ -n "$$pythondir" ]; then \
+		echo "Fixing up hardcoded paths in GDB pretty-printer auto-load file(s) for libstdcxx: $$loadfiles"; \
+		sed -ri \
+			-e 's%^libdir\s*=.*%libdir = "$(STAGING_DIR)/lib"%' \
+			-e "s%^pythondir\s*=.*%pythondir = '$$pythondir'%" \
+			$$loadfiles; \
+	fi
+endef
+
 # uClibc-ng dynamic loader is called ld-uClibc.so.1, but gcc is not
 # patched specifically for uClibc-ng, so it continues to generate
 # binaries that expect the dynamic loader to be named ld-uClibc.so.0,
@@ -589,6 +609,7 @@ define $(2)_INSTALL_STAGING_CMDS
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
+	$$(TOOLCHAIN_EXTERNAL_FIXUP_PRETTY_PRINTER_LOADER)
 endef
 
 # Even though we're installing things in both the staging, the host
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
