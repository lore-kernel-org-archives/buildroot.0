From: Matt Weber <Matthew.Weber@collins.com>
Date: Mon,  3 Dec 2018 22:08:50 -0600
Subject: [Buildroot] [PATCH v5 7/7] package/llvm: disable libxml2
In-Reply-To: <1543896530-33550-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1543896530-33550-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1543896530-33550-7-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libxml2 is needed during Windows builds to populate the COFF
file manifest info

If left enabled, a dependency would need to be added and paths
set for libxml2 include and library paths. This isn't require at
this point for Linux builds.

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
This change was discovered during testing of compiler-rt
patchset.  This patch could be independently applied.

Romain, hopefully you are able to verify this resolves the path
posioning you observed with the target build and libxml2.

v4
 - New patch

v5
 - Rebased post 2018.11 on master
---
 package/llvm/llvm.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 14f317d..ef54f10 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -123,6 +123,11 @@ HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=ON
 HOST_LLVM_DEPENDENCIES += host-zlib
 LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=OFF
 
+# libxml2 can be disabled as it is used for LLVM Windows builds where COFF
+# files include manifest info
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBXML2=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBXML2=OFF
+
 # We don't use llvm for static only build, so enable PIC
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
 LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
-- 
1.9.1
