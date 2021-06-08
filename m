From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  8 Jun 2021 17:18:38 +0200
Subject: [Buildroot] [PATCHv2 2/3] toolchain/toolchain-external: fixup gdb
 pretty-printer loader for libstdcxx
In-Reply-To: <20210608151840.20917-1-patrickdepinguin@gmail.com>
References: <20210608151840.20917-1-patrickdepinguin@gmail.com>
Message-ID: <20210608151840.20917-3-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

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
---
 .../pkg-toolchain-external.mk                 | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 6d91cb5d1e..d7fb93ee20 100644
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
+	pythondir=$$(find $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR) -path '*/libstdcxx/__init__.py' 2>/dev/null | xargs dirname | xargs dirname | head -n1); \
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
-- 
2.26.3
