From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 05 Aug 2011 16:54:32 +0200
Subject: [Buildroot] [PATCH] Fix sorting-related issue when using make 3.82
Message-ID: <b48283f33363fb03ff99.1312556072@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In make 3.82, wildcards are no longer sorted. This impacts lines like:
	include package/*/*.mk

A specific scenario under which this fails: if the .mk file of an autotools-based package with FOO_AUTORECONF set to yes, happens to be included before the autoconf/autoconf.mk file, the $(AUTORECONF) variable is not yet set and autoreconfiguration fails with the following message:

>>> host-module-init-tools 3.12 Autoreconfiguring
cd /repo/tdescham/reborn/buildroot-dummy/output/build/host-module-init-tools-3.12/ &&
/bin/sh: -c: line 1: syntax error: unexpected end of file
make: *** [/repo/tdescham/reborn/buildroot-dummy/output/build/host-module-init-tools-3.12/.stamp_configured] Error 2

caused by the following statement in package/Makefile.autotools.in:
	$(Q)cd $$($$(PKG)_SRCDIR) && $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)

This patch adds explicit sorting to the include statement in Makefile, fixing this scenario for make-3.82.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---

Note that I don't understand the mechanics of this failure completely: I had expected that a package named 'aaa' would still fail to autoreconfigure, even with this patch applied. However, this is not true: this patch does fix the problem with make-3.82.

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -309,7 +309,7 @@
 include toolchain/toolchain-crosstool-ng.mk
 endif
 
-include package/*/*.mk
+include $(sort $(wildcard package/*/*.mk))
 
 include boot/common.mk
 include target/Makefile.in
