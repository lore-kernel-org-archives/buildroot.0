From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  8 Dec 2017 22:29:52 +0100
Subject: [Buildroot] [PATCH v2] gdb: prevent installation of libbfd.so and
 libopcode.so
Message-ID: <20171208212952.20366-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gdb install target installs dynamic versions of libbfd and
libopcode, accidentally overwriting the binutils provided versions
(gdb itself links against the bundled static ones to avoid
version problems, so the dynamic ones are un-needed).

Prevent the installation by using the '--disable-install-libbfd'
configure option.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - enhance commit log (suggested by Thomas Petazzoni)
  - use --disable-install-libbfd instead of --disable-shared
---
 package/gdb/gdb.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 7e86ba0c7e..0f3846687e 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -55,9 +55,11 @@ endif
 
 # When gdb sources are fetched from the binutils-gdb repository, they
 # also contain the binutils sources, but binutils shouldn't be built,
-# so we disable it.
+# so we disable it (additional the option --disable-install-libbfd
+# prevents the un-wanted installation of libobcodes.so and libbfd.so).
 GDB_DISABLE_BINUTILS_CONF_OPTS = \
 	--disable-binutils \
+	--disable-install-libbfd \
 	--disable-ld \
 	--disable-gas
 
-- 
2.15.0
