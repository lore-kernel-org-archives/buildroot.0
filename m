From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 30 Jan 2014 21:38:52 +0100
Subject: [Buildroot] [PATCH v3 5/6] pkg-cmake.mk: add PATH in the configure
	command environment
In-Reply-To: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
References: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1391114333-28001-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because BR2_PATH is not exported in the environment beforehand running
cmake, it is necessary to add it on the cmake configure command.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2 -> v3:
- rebase
- no one-line commit log (ThomasP)

changes v1 -> v2:
- rebase
- remove explicit PATH=... in configure commands in pkg-autotools.mk
  because it is already added via *_CONFIGURE_OPTS (ThomasP), and
  reword the commit message.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-cmake.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 13be557..16d9920 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -61,6 +61,7 @@ ifeq ($(5),target)
 define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
+	PATH=$(BR2_PATH) \
 	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
@@ -75,6 +76,7 @@ else
 define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
+	PATH=$(BR2_PATH) \
 	$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
-- 
1.8.5.3
