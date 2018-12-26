From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Dec 2018 09:52:26 +0100
Subject: [Buildroot] [PATCH 1/5 v5] package/meson: never try to run
 generated target binaries
In-Reply-To: <cover.1545814334.git.yann.morin.1998@free.fr>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
Message-ID: <898a91d14004c0149c8a6c4fcf85670d736ffe11.1545814334.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

As explained in [0], meson will try on its own to decide whether it can
run what it builds. If it happens that the host and target CPUs are
"compatible", that test may fail and meson may believe it can run what
it builds.

Override that test by using needs_exe_wrapper=true, and not defining an
actual exe_wrapper.

[0] https://mesonbuild.com/Cross-compilation.html

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr:
  - split in its own patch
  - improve commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/meson/cross-compilation.conf.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
index 0eec74087b..fc8e27f7eb 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/package/meson/cross-compilation.conf.in
@@ -11,6 +11,7 @@ strip = '@TARGET_CROSS at strip'
 pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
 
 [properties]
+needs_exe_wrapper = true
 c_args = [@TARGET_CFLAGS@]
 c_link_args = [@TARGET_LDFLAGS@]
 cpp_args = [@TARGET_CXXFLAGS@]
-- 
2.14.1
