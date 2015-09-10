From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 22:07:30 +0200
Subject: [Buildroot] [git commit] setools: fix race condition
Message-ID: <20150910200800.CD6937FAD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ac68fe2c9b4cea91c7a30429ebf75279ede8e70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported upstream:

  https://github.com/TresysTechnology/setools3/issues/5

setools tries to compile a .c file before being generated and then it
produces an error like this one:

error: policy_scan.c: No such file or directory

Until upstream fixes the problem we can workaround this by using MAKE1
as the SETOOLS_MAKE.

Fixes:

  http://autobuild.buildroot.net/results/119/1196ac448c77320b59b63b6133d2d1af1245bf69/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/setools/setools.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index a2bfd42..71301c7 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -12,6 +12,10 @@ SETOOLS_INSTALL_STAGING = YES
 SETOOLS_LICENSE = GPLv2+ LGPLv2.1+
 SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 
+# Race condition reported upstream:
+# https://github.com/TresysTechnology/setools3/issues/5
+SETOOLS_MAKE = $(MAKE1)
+
 # configure.ac is patched by the cross compile patch,
 # so autoreconf is necessary
 SETOOLS_AUTORECONF = YES
