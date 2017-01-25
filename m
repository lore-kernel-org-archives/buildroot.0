From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 16:44:42 +1300
Subject: [Buildroot] [git commit] package/libasplib: fix build error on m68k
Message-ID: <20170125034447.86DEB7FE9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=336c2a4db0331fd2bfc8a2798337d9c58d4cbc1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch written by Waldemar Brodkorb:
http://lists.busybox.net/pipermail/buildroot/2016-November/177726.html

This patch however did not work: "Unfortunately libasplib cmake
infrastructure ignores my CMAKE_CXX_FLAGS."

To make this patch work libasplib needed to be bumped because the cmake
infrastructure was updated back in August 2016 which fixed the problem:
https://github.com/AchimTuran/asplib/commit/6326d1f5e8dad9fd9947b7f4688ddddda91e9e9e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libasplib/libasplib.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libasplib/libasplib.mk b/package/libasplib/libasplib.mk
index 038fc38..b3b1fdb 100644
--- a/package/libasplib/libasplib.mk
+++ b/package/libasplib/libasplib.mk
@@ -18,4 +18,11 @@ LIBASPLIB_CONF_OPTS = \
 	-DBUILD_SIGNALS=ON \
 	-DBUILD_TIMER=ON
 
+# Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
+ifeq ($(BR2_m68k_cf),y)
+LIBASPLIB_CXXFLAGS += -fno-dwarf2-cfi-asm
+endif
+
+LIBASPLIB_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(LIBASPLIB_CXXFLAGS)"
+
 $(eval $(cmake-package))
