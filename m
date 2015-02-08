From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  8 Feb 2015 17:57:20 +0100
Subject: [Buildroot] [PATCH] package/erlang: fix build issue with pcre
	package
Message-ID: <1423414640-30254-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the pcre package is build before erlang, the erlang's build
system use pcre.h from pcre package instead of using pcre.h bundled
by Erlang.

Erlang use an old version of this file which is incompatible
with the upstream one.

http://autobuild.buildroot.net/results/cbd/cbd8b54eef535f19d7d400fd269af1b3571d6143/build-end.log

And many more.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...ts-emulator-reorder-inclued-headers-paths.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/erlang/0003-erts-emulator-reorder-inclued-headers-paths.patch

diff --git a/package/erlang/0003-erts-emulator-reorder-inclued-headers-paths.patch b/package/erlang/0003-erts-emulator-reorder-inclued-headers-paths.patch
new file mode 100644
index 0000000..c17eefc
--- /dev/null
+++ b/package/erlang/0003-erts-emulator-reorder-inclued-headers-paths.patch
@@ -0,0 +1,43 @@
+From 85a3e5b4f65e5284e59dcdd90e92ea7d50ef6907 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 8 Feb 2015 17:23:13 +0100
+Subject: [PATCH] erts/emulator: reorder inclued headers paths
+
+If the Perl Compatible Regular Expressions is installed on the
+host and the path to the headers is added to the CFLAGS, the
+pcre.h from the host is used instead of the one provided by
+erlang.
+
+Erlang use an old version of this file which is incompatible
+with the upstream one.
+
+Move INCLUDES before CFLAGS to use pcre.h from erlang.
+
+http://autobuild.buildroot.net/results/cbd/cbd8b54eef535f19d7d400fd269af1b3571d6143/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ erts/emulator/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/erts/emulator/Makefile.in b/erts/emulator/Makefile.in
+index 7145824..d079487 100644
+--- a/erts/emulator/Makefile.in
++++ b/erts/emulator/Makefile.in
+@@ -678,11 +678,11 @@ else
+ # Usually the same as the default rule, but certain platforms (e.g. win32) mix
+ # different compilers
+ $(OBJDIR)/beam_emu.o: beam/beam_emu.c
+-	$(V_EMU_CC) $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) $(INCLUDES) -c $< -o $@
++	$(V_EMU_CC) $(INCLUDES) $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) -c $< -o $@
+ endif
+ 
+ $(OBJDIR)/%.o: beam/%.c
+-	$(V_CC) $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) $(INCLUDES) -c $< -o $@
++	$(V_CC) $(INCLUDES) $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) -c $< -o $@
+ 
+ $(OBJDIR)/%.o: $(TARGET)/%.c
+ 	$(V_CC) $(CFLAGS) $(INCLUDES) -Idrivers/common -c $< -o $@
+-- 
+1.9.3
+
-- 
1.9.3
