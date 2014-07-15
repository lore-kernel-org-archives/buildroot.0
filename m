From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 21:19:37 +0200
Subject: [Buildroot] [git commit] lm-sensors: don't use host ldconfig
Message-ID: <20140715192013.AB6409D1C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c70c45004b87f134af96adf11178a8e1d1c4625
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To know whether the libiconv library is available, lm-sensors is using
the host ldconfig, which is obviously wrong in cross-compilation.

Moreover, the lm-sensors program making use of the iconv_*() API
already does it when __UCLIBC__ is *not* defined. In this case, the
iconv_*() functions are already part of the C library, so there is no
need to link against a separate library. Therefore, this patch simply
removes the libiconv handling.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../lm-sensors-0002-no-host-ldconfig.patch         |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/lm-sensors/lm-sensors-0002-no-host-ldconfig.patch b/package/lm-sensors/lm-sensors-0002-no-host-ldconfig.patch
new file mode 100644
index 0000000..51f7f6a
--- /dev/null
+++ b/package/lm-sensors/lm-sensors-0002-no-host-ldconfig.patch
@@ -0,0 +1,29 @@
+Remove usage of host ldconfig
+
+To know whether the libiconv library is available, lm-sensors is using
+the host ldconfig, which is obviously wrong in cross-compilation.
+
+Moreover, the lm-sensors program making use of the iconv_*() API
+already does it when __UCLIBC__ is *not* defined. In this case, the
+iconv_*() functions are already part of the C library, so there is no
+need to link against a separate library. Therefore, this patch simply
+removes the libiconv handling.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/prog/sensors/Module.mk
+===================================================================
+--- a/prog/sensors/Module.mk
++++ b/prog/sensors/Module.mk
+@@ -37,10 +37,8 @@
+ REMOVESENSORSBIN := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(BINDIR)/%,$(PROGSENSORSTARGETS))
+ REMOVESENSORSMAN := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(PROGSENSORSMAN1DIR)/%,$(PROGSENSORSMAN1FILES))
+ 
+-LIBICONV := $(shell if /sbin/ldconfig -p | grep -q '/libiconv\.so$$' ; then echo \-liconv; else echo; fi)
+-
+ $(PROGSENSORSTARGETS): $(PROGSENSORSSOURCES:.c=.ro) lib/$(LIBDEP_FOR_PROGS)
+-	$(CC) $(EXLDFLAGS) -o $@ $(PROGSENSORSSOURCES:.c=.ro) $(LIBICONV) -Llib -lsensors -lm
++	$(CC) $(EXLDFLAGS) -o $@ $(PROGSENSORSSOURCES:.c=.ro) -Llib -lsensors -lm
+ 
+ all-prog-sensors: $(PROGSENSORSTARGETS)
+ user :: all-prog-sensors
