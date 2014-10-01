From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 23:14:47 +0200
Subject: [Buildroot] [git commit] gnupg2: fix build on non-wchar toolchains
Message-ID: <20141001211741.372A89D7C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a87887095809c48cccf201f1c38b41ffe8ef822
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gnupg2 configure script checks whether <stdint.h> complies with
C99. When doing this, it expects a number of WCHAR_* definitions to be
present, which is not the case on non-wchar capable toolchains. The
gnupg2 configure script then concludes that <stdint.h> is not
C99-compliant and generates its own, which causes some build failures
related to intmax_t being not defined.

Since wchar is not actually used in gnupg2, this commit fixes this
problem by forcing gnupg2 to think that our <stdint.h> is
C99-compliant.

Fixes:

  http://autobuild.buildroot.org/results/40f/40fff3bc304e1a83524f28be8f6afc2e217281ad/

And lots of similar issues. Thanks a lot for Romain Naour for the
initial investigation and lots of discussion on IRC about this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
---
 package/gnupg2/gnupg2.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 4b0a26e..71badb6 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -18,6 +18,7 @@ GNUPG2_CONF_OPT = \
 	--with-libassuan-prefix=$(STAGING_DIR)/usr \
 	--with-ksba-prefix=$(STAGING_DIR)/usr \
 	--with-pth-prefix=$(STAGING_DIR)/usr
+GNUPG2_CONF_ENV = gl_cv_header_working_stdint_h=yes
 
 ifneq ($(BR2_PACKAGE_GNUPG2_GPGV2),y)
 define GNUPG2_REMOVE_GPGV2
