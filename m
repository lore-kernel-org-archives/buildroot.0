From: Geoff Levand <geoff@infradead.org>
Date: Fri, 27 Jul 2018 15:23:28 -0700
Subject: [Buildroot] [PATCH v1] dtc: Add set-ldshared.patch
In-Reply-To: <20180727110728.300c06e2@windsurf>
References: <28d7fee033a5e5ef512c02d5291d20b1d19fdbbf.1532460521.git.geoff@infradead.org>
 <20180727110728.300c06e2@windsurf>
Message-ID: <f1e71e0d-6728-78d1-0431-c1e2846ab885@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes pylibfdt cross compile errors.

http://autobuild.buildroot.net/?reason=%dtc-1.4.7

Signed-off-by: Geoff Levand <geoff@infradead.org>
---

Hi Thomas,

This gets the dtc package to build with python support, but
it seems the real problem is that python distutils doesn't
set LDSHARED correctly, which should default to CC.

-Geoff

 package/dtc/set-ldshared.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/dtc/set-ldshared.patch

diff --git a/package/dtc/set-ldshared.patch b/package/dtc/set-ldshared.patch
new file mode 100644
index 0000000000..09220da359
--- /dev/null
+++ b/package/dtc/set-ldshared.patch
@@ -0,0 +1,13 @@
+diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
+index 9507d3d..c2ac8e9 100644
+--- a/pylibfdt/Makefile.pylibfdt
++++ b/pylibfdt/Makefile.pylibfdt
+@@ -8,7 +8,7 @@ PYMODULE = $(PYLIBFDT_objdir)/_libfdt.so
+ define run_setup
+ 	SOURCES="$(1)" CPPFLAGS="$(CPPFLAGS)" OBJDIR="$(PYLIBFDT_objdir)"
+ 	VERSION="$(dtc_version)"
+-	$(PYLIBFDT_objdir)/setup.py --quiet $(2)
++	LDSHARED="$(CC) -shared" $(PYLIBFDT_objdir)/setup.py --quiet $(2)
+ endef
+ 
+ $(PYMODULE): $(PYLIBFDT_srcs)
-- 
2.14.1
