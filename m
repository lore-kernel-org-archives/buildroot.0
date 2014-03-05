From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Mar 2014 19:45:24 +0100
Subject: [Buildroot] [git commit] host-python{,
	3}: fix parallel install of libpython
Message-ID: <20140305184614.BC5F39BD70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c94ab3cfd59c29ed27160ebd9759aea6a3fe58a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During installation, host-python and host-python3 run the freshly built
python executable. This is done with a proper LD_LIBRARY_PATH to make
sure it picks up the libpython in the build directory. However, the
python binary has an RPATH pointing to the $(HOST_DIR)/usr/lib.
Therefore, if libpython exists there, it will be used instead.

If the install step is run in parallel, it is possible that libpython
is already partially copied to $(HOST_DIR)/usr/lib when python is run.
This gives an error like:

python: error while loading shared libraries: $(HOST_DIR)/usr/lib/libpython3.4m.so.1.0: file too short

The fix is simple: use RUNPATH instead of RPATH, which allows
LD_LIBRARY_PATH to override RUNPATH. That way, the libpython in the
build directory is always used. RUNPATH is enabled by passing
--enable-new-dtags to the linker.

Fixes e.g.
http://autobuild.buildroot.net/results/2a6/2a62de3247ba5ad273f03d01e690a3eeb11aa7b4

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk   |    6 ++++++
 package/python3/python3.mk |    6 ++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 94765cb..216448e 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -34,6 +34,12 @@ HOST_PYTHON_CONF_OPT += 	\
 	--disable-ssl		\
 	--disable-pyo-build
 
+# Make sure that LD_LIBRARY_PATH overrides -rpath.
+# This is needed because libpython may be installed at the same time that
+# python is called.
+HOST_PYTHON_CONF_ENV += \
+	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags"
+
 # Building host python in parallel sometimes triggers a "Bus error"
 # during the execution of "./python setup.py build" in the
 # installation step. It is probably due to the installation of a
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 880b66e..3d95a6d 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -30,6 +30,12 @@ HOST_PYTHON3_CONF_OPT += 	\
 	--disable-idle3		\
 	--disable-pyo-build
 
+# Make sure that LD_LIBRARY_PATH overrides -rpath.
+# This is needed because libpython may be installed at the same time that
+# python is called.
+HOST_PYTHON3_CONF_ENV += \
+	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags"
+
 PYTHON3_DEPENDENCIES  = host-python3 libffi
 
 HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib
