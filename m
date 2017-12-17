From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Dec 2017 10:08:13 +0100
Subject: [Buildroot] [git commit] gdb: prevent installation of libbfd.so and
 libopcode.so
Message-ID: <20171217090821.53FD182DD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b54c7931952874a814e48df75093e13ad955604f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gdb install target installs dynamic versions of libbfd and
libopcode, accidentally overwriting the binutils provided versions
(gdb itself links against the bundled static ones to avoid
version problems, so the dynamic ones are un-needed).

Prevent the installation by using the '--disable-install-libbfd'
configure option.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 7e86ba0..5ca464a 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -55,9 +55,11 @@ endif
 
 # When gdb sources are fetched from the binutils-gdb repository, they
 # also contain the binutils sources, but binutils shouldn't be built,
-# so we disable it.
+# so we disable it (additionally the option --disable-install-libbfd
+# prevents the un-wanted installation of libobcodes.so and libbfd.so).
 GDB_DISABLE_BINUTILS_CONF_OPTS = \
 	--disable-binutils \
+	--disable-install-libbfd \
 	--disable-ld \
 	--disable-gas
 
