From: Julius Kriukas <julius@kriukas.lt>
Date: Sun, 28 Jan 2018 13:22:05 +0200
Subject: [Buildroot] [PATCH 1/1] Change host locale from C to en_US.UTF-8
 for reproducable builds
Message-ID: <20180128112205.15275-1-julius@kriukas.lt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_REPRODUCIBLE is enabled building systemd fails with error:

[1/1080] Generating systemd.bg.catalog with a meson_exe.py custom command.
FAILED: catalog/systemd.bg.catalog
/buildroot/output/host/bin/python3 /buildroot/output/host/bin/meson --internal exe /buildroot/output/build/systemd-236/build/meson-private/meson_exe_sed_232a0623cc7ce2cd67ec72ed784b76307102ed76.dat
Warning: You are using 'ANSI_X3.4-1968' which is not a Unicode-compatible locale.
You might see errors if you use UTF-8 strings as filenames, as strings, or as file contents.
Please switch to a UTF-8 locale for your platform.
...
UnicodeDecodeError: 'ascii' codec can't decode byte 0xd0 in position 1079: ordinal not in range(128)
package/pkg-generic.mk:247: recipe for target '/buildroot/output/build/systemd-236/.stamp_built' failed
make: *** [/buildroot/output/build/systemd-236/.stamp_built] Error 1

Other packages using meson build system might fail as well.

This patch changes default host system locale from C to en_US.UTF-8 to
fix this issue. Any Unicode-compatible locale would be suitable here.

Signed-off-by: Julius Kriukas <julius@kriukas.lt>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 7d8ab51a8c..5991c6a221 100644
--- a/Makefile
+++ b/Makefile
@@ -250,8 +250,8 @@ endif
 # timezone and locale may affect build output
 ifeq ($(BR2_REPRODUCIBLE),y)
 export TZ = UTC
-export LANG = C
-export LC_ALL = C
+export LANG = en_US.UTF-8
+export LC_ALL = en_US.UTF-8
 export GZIP = -n
 BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
 export SOURCE_DATE_EPOCH ?= $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
-- 
2.15.1
