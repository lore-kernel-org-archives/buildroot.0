From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 23:04:48 +0200
Subject: [Buildroot] [git commit] musl: Make only shared libraries
	conditional
Message-ID: <20151019210452.5D5CC81D54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84120c10f5ba6c8c4b8d32068616cbdb8a8a8102
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

External toolchain use requires a static libc (as buildroot uses
`gcc --print-file-name libc.a` to find the sysroot); thus, the static portion
of a musl build should not be conditional.

Signed-off-by: Charles Duffy <chaduffy@cisco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/musl/musl.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index f0c45f5..2f43aab 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -29,7 +29,8 @@ define MUSL_CONFIGURE_CMDS
 			--prefix=/usr \
 			--libdir=/lib \
 			--disable-gcc-wrapper \
-			$(SHARED_STATIC_LIBS_OPTS))
+			--enable-static \
+			$(if $(BR2_STATIC_LIBS),--disable-shared,--enable-shared))
 endef
 
 define MUSL_BUILD_CMDS
