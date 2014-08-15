From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 Aug 2014 16:39:11 +0200
Subject: [Buildroot] [PATCH 6/6] [RFC] package/pkg-cmake.mk: add ccache
	support for host packages
In-Reply-To: <1408113551-29932-1-git-send-email-s.martin49@gmail.com>
References: <1408113551-29932-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1408113551-29932-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This ccache support for host-cmake-package uses the same logic as the
one done for the target packages in the toolchainfile.cmake file.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-cmake.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 2006b76..3a6b7e6 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -89,6 +89,16 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
 		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
 		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
+		-DCMAKE_ASM_COMPILER="$$(HOSTAS)" \
+		$$(if $$(BR2_CCACHE),\
+			-DCMAKE_C_COMPILER="$$(HOST_DIR)/usr/bin/ccache" \
+			-DCMAKE_CXX_COMPILER="$$(HOST_DIR)/usr/bin/ccache" \
+			-DCMAKE_C_COMPILER_ARG1="$$(HOSTCC)" \
+			-DCMAKE_CXX_COMPILER_ARG1="$$(HOSTCXX)" \
+		, \
+			-DCMAKE_C_COMPILER="$$(HOSTCC)" \
+			-DCMAKE_CXX_COMPILER="$$(HOSTCXX)" \
+		) \
 		-DBUILD_TESTING=OFF \
 		$$($$(PKG)_CONF_OPT) \
 	)
-- 
2.0.4
