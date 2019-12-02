From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:50 -0000
Subject: [Buildroot] [git commit] package/dtc: install host libfdt headers
 in a subdirectory
Message-ID: <20191202083932.EFFA47F98A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e381d823f6834fc1b9e5574febd7e4e737295e89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Installing the libfdt headers at $(HOST_DIR)/include interferes with the
build of the kernel, as in beaglebone:

2019-11-01T22:23:16 /usr/bin/make -f ./scripts/Makefile.build obj=scripts
2019-11-01T22:23:16 /usr/bin/make -f ./scripts/Makefile.build obj=scripts/dtc need-builtin=
2019-11-01T22:23:16 (cat /dev/null; ) > scripts/dtc/modules.order
2019-11-01T22:23:16 /usr/bin/gcc -O2 -I/work/beaglebone/host/include -L/work/beaglebone/host/lib -Wl,-rpath,/work/beaglebone/host/lib -Wp,-MD,scripts/dtc/libfdt/.fdt_ro.o.d -Wall -Wmissing-prototypes -Wstrict-p>
2019-11-01T22:23:16 scripts/dtc/libfdt/fdt_ro.c:92:10: error: redefinition of ???fdt_get_max_phandle???
2019-11-01T22:23:16 uint32_t fdt_get_max_phandle(const void *fdt)
2019-11-01T22:23:16 ^~~~~~~~~~~~~~~~~~~
2019-11-01T22:23:16 In file included from scripts/dtc/libfdt/fdt_ro.c:54:
2019-11-01T22:23:16 /work/beaglebone/host/include/libfdt.h:384:24: note: previous definition of ???fdt_get_max_phandle??? was here
2019-11-01T22:23:16 static inline uint32_t fdt_get_max_phandle(const void *fdt)
2019-11-01T22:23:16 ^~~~~~~~~~~~~~~~~~~
2019-11-01T22:23:16 make[4]: *** [scripts/Makefile.host:107: scripts/dtc/libfdt/fdt_ro.o] Error 1
2019-11-01T22:23:16 make[3]: *** [scripts/Makefile.build:544: scripts/dtc] Error 2
2019-11-01T22:23:16 make[2]: *** [Makefile:1066: scripts] Error 2
2019-11-01T22:23:16 make[1]: *** [package/pkg-generic.mk:241: /work/beaglebone/build/linux-4dae378bbe721277b08699d1d88ffae12acc9b09/.stamp_built] Error 2

We cannot simply disable dtc support and patching the kernel makefiles
is risky and error-prone, so let's just install the host-dtc headers at
$(HOST_DIR)/include/libfdt to circumvent the problem.

Packages that depend on those headers (e.g. host-qemu) must be updated
to user the correct path but this is small change.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dtc/dtc.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index a0fffa5b80..76106519e5 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -18,8 +18,11 @@ DTC_MAKE_OPTS = \
 	NO_PYTHON=1 \
 	NO_VALGRIND=1
 
+# For the host, we install headers in a special subdirectory to avoid
+# conflicts with the in-kernel libfdt copy.
 HOST_DTC_MAKE_OPTS = \
 	PREFIX=$(HOST_DIR) \
+	INCLUDEDIR=$(HOST_DIR)/include/libfdt \
 	NO_PYTHON=1 \
 	NO_VALGRIND=1 \
 	NO_YAML=1
