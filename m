From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Feb 2017 18:24:32 +0100
Subject: [Buildroot] [PATCHv4] package/ccache: do not force colored
	diagnostics
Message-ID: <1487093072-4270-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to GCC but
this flag requires GCC v4.9 or later. Older versions complain about the
unrecognized command line option.

Using GCC_COLORS in the context of Buildroot is seldom useful, so we
just unexport GCC_COLORS altogether.

Reported-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
This defconfig (provided by Carlos) helps reproduce the issue, during
the build of openssl:
    BR2_powerpc=y
    BR2_powerpc_8548=y
    BR2_CCACHE=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng_e500v2-linux-gnuspe.tar.xz"
    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="powerpc-ctng_e500v2-linux-gnuspe"
    BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
    BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
    BR2_TOOLCHAIN_EXTERNAL_CXX=y
    BR2_PACKAGE_OPENSSL=y

---
Changes v3 -> v4: (Yann)
  - simply unexport GCC_COLORS  (Arnout)

Changes v2 -> v3: (Yann)
  - drop the environment variable override  (Yann)
  - directly patch ccache  (Thomas)

Changes v1->v2  (Carlos)
  Fix indentation, use positive logic and improve the commit message,
  acording to comments from Thomas Petazzoni and Yann E. MORIN.
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index dcda8fe..4db971b 100644
--- a/Makefile
+++ b/Makefile
@@ -402,6 +402,7 @@ unexport QMAKESPEC
 unexport TERMINFO
 unexport MACHINE
 unexport O
+unexport GCC_COLORS
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
-- 
2.7.4
