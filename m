From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 22:01:09 +0200
Subject: [Buildroot] [git commit] c-icap: avoid host library search path
Message-ID: <20160426200120.0DD3F81E40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcebe9f1f8d44fbd642330ee498268d49f2238d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add AUTORECONF as a workaround to the effect of '-Wl,-rpath -Wl,/usr/lib' that
c-icap adds to the linker command.

Fixes:
http://autobuild.buildroot.net/results/077/077374329b2782dbb4b4a9ee7af264cdda311ccc/
http://autobuild.buildroot.net/results/057/057a88179150a4f02990d7b9b0d8f2de3c9da1a3/
http://autobuild.buildroot.net/results/da6/da62b80989df6b8f1b5557b4987d7a6999d30bb8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-icap/c-icap.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index cff642c..3078721 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -20,6 +20,13 @@ C_ICAP_CONF_OPTS = \
 # Pre-seed cache variables for tests done with AC_TRY_RUN that are not
 # cross-compile friendly
 C_ICAP_CONF_ENV = ac_cv_10031b_ipc_sem=yes ac_cv_fcntl=yes
+# c-icap adds '-Wl,-rpath -Wl,/usr/lib' to the link command line. This
+# causes the linker to search for libraries that are listed as NEEDED
+# in the libicapapi.so ELF header in host libraries, which breaks the
+# build. The affected library is libz. Forcing AUTORECONF adds -lz to
+# the link command line, and that makes the linker look first in
+# sysroot, thus avoiding the build breakage.
+C_ICAP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 C_ICAP_CONF_OPTS += --with-berkeleydb
