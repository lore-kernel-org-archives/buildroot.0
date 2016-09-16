From: Frederik Aalund <fpa@sbtaqua.com>
Date: Fri, 16 Sep 2016 15:30:31 +0200
Subject: [Buildroot] [PATCH 3/3] python3: Compile host-python3 statically
Message-ID: <1474032631-21311-1-git-send-email-fpa@sbtaqua.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous behaviour was to compile host-python3 with `--enable-shared` as is done for the target python installation. The problem is that if the host *already* has a python installation, then host-python3 will be called with the system `libpython3.5.so`. So even though the $(HOST_DIR) python executable is called, the system .so is used.

On my system, I have python 3.5.1. I was trying to python 3.5.2 for buildroot. I noticed druing the build that the host-python thought it was 3.5.1 (as on the system). This was caused by the above. In combination with the `PYTHON3_PYC_ONLY`, this caused all the *.pyc files to be compiled for 3.5.1 even though it should have been 3.5.2.

I've changed the `python3.mk` file so that host-python3 is built statically. This way, such errors will not occur.

Alternatively, one could make sure to always call host-python3 with an `LD_LIBRARY_PATH` which points to the `$(HOST_DIR)`. However, this requires a much more invasive change than simply compiling python statically.

Signed-off-by: Frederik Aalund <fpa@sbtaqua.com>
---
 package/python3/python3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 1b63f95..093f570 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -25,6 +25,7 @@ PYTHON3_LIBTOOL_PATCH = NO
 # third-party Python modules.
 
 HOST_PYTHON3_CONF_OPTS += 	\
+	--disable-shared    \
 	--without-ensurepip	\
 	--without-cxx-main 	\
 	--disable-sqlite3	\
-- 
2.5.0
