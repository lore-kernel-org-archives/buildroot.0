From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 12:08:09 +0100
Subject: [Buildroot] [PATCH 1/1] gcc: do not pass --with-pkgversion to gcc <
	4.3
In-Reply-To: <cover.1260875280.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260875280.git.thomas.petazzoni@free-electrons.com>
Message-ID: <962ea5b29b0ce1966359688f2dffc173073575c8.1260875280.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 09c181f2891276c458de327d241151bab38bde0f added new options
passed to gcc configure to set --with-pkgversion and --with-bugurl, to
gcc >= gcc 4.3. To check this, it was checking that the GCC_VERSION
string does not contain 4.2.

Unfortunately, the test is bogus. It does a findstring on x4.2. (with
a final dot) but compares the result with x4.2 (without the final
dot).

The result is that even with 4.2 versions, the test was true, leading
--with-pkgversion and --with-bugurl being passed to gcc's configure
script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 32f7a1e..6f65cb3 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -45,7 +45,7 @@ GCC_NO_MPFR:=y
 endif
 
 # Branding works on >= 4.3
-ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2)
+ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
 BUILDROOT_VERSION_STRING=$(call qstrip,$(BR2_VERSION))
 EXTRA_GCC_CONFIG_OPTIONS+=--with-pkgversion="Buildroot $(BUILDROOT_VERSION_STRING)" \
 	--with-bugurl="http://bugs.buildroot.net/"
-- 
1.6.3.3
