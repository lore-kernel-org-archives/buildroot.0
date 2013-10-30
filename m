From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Oct 2013 10:29:15 +0000 (UTC)
Subject: [Buildroot] [Bug 6632] CMake use host pkg-config
In-Reply-To: <bug-6632-163@https.bugs.busybox.net/>
References: <bug-6632-163@https.bugs.busybox.net/>
Message-ID: <20131030102915.8FD369BC3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6632

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-10-30 10:29:15 UTC ---
What about something like:

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 0e08722..70014b5 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -62,7 +62,7 @@ ifeq ($(5),target)
 define $(2)_CONFIGURE_CMDS
        (cd $$($$(PKG)_BUILDDIR) && \
        rm -f CMakeCache.txt && \
-       $$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+       $(TARGET_MAKE_ENV) $$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake
$$($$(PKG)_SRCDIR) \
               
-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
                -DCMAKE_INSTALL_PREFIX="/usr" \
                $$($$(PKG)_CONF_OPT) \
@@ -74,7 +74,7 @@ else
 define $(2)_CONFIGURE_CMDS
        (cd $$($$(PKG)_BUILDDIR) && \
        rm -f CMakeCache.txt && \
-       $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+       $(HOST_MAKE_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
                -DCMAKE_INSTALL_SO_NO_EXE=0 \
                -DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
                -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
