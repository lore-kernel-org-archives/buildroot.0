From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 14:21:17 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/meson: never try
 to run generated target binaries
Message-ID: <20190118132725.651668140B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae31ce3cde74db8c9e0fae6a7701036c49bfe7b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit f112f2b991b47a7309116e132c969e3731a7e911)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
