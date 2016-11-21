From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 21:44:58 +0100
Subject: [Buildroot] [git commit] openblas: disable OpenMP
Message-ID: <20161121204510.10CF481976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb45f199e509d05be4bc696b740f995918fe9eb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For powerpc (and powerpc only), the openblas build system will enable
USE_OPENMP when threads are enabled. But the toolchain wasn't
necessarily built with OpenMP support. So explicitly disable OpenMP -
for all architectures, not just powerpc, just to keep things simple.

We could have autodetected whether OpenMP is available at configure
time, but that would be more of a feature patch, it's up to upstream
to do that.

Fixes:
http://autobuild.buildroot.net/results/423b5e79cd4342d6c160ed478054b294b0826c6a
http://autobuild.buildroot.net/results/c9e554c8f880b49b3c9203725ac5e6565b7e5c6f

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openblas/openblas.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 9583e0e..a26e10a 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -31,6 +31,9 @@ else
 OPENBLAS_MAKE_OPTS += USE_THREAD=0
 endif
 
+# We don't know if OpenMP is available or not, so disable
+OPENBLAS_MAKE_OPTS += USE_OPENMP=0
+
 # Static-only/Shared-only toggle
 ifeq ($(BR2_STATIC_LIBS),y)
 OPENBLAS_MAKE_OPTS += NO_SHARED=1
