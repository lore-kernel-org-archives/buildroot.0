From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 16:44:21 +0200
Subject: [Buildroot] [git commit] binutils: fix bfin build
Message-ID: <20160823155419.EB7AE82258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6fd59ebf01a83dc841cfa66ed250d9e1e83373c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See gcc bug for details:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77311

Fixes:

  http://autobuild.buildroot.net/results/1e93be2fb02a3fb2731e48b0d9e54a0d4080a112/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 2936eb5..85663a8 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -71,6 +71,12 @@ endif
 BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
 HOST_BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
 
+# gcc bug with Os/O2/O3, PR77311
+# error: unable to find a register to spill in class 'CCREGS'
+ifeq ($(BR2_bfin),y)
+BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O1"
+endif
+
 # Install binutils after busybox to prefer full-blown utilities
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 BINUTILS_DEPENDENCIES += busybox
