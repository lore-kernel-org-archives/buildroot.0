From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  1 May 2019 14:40:30 -0500
Subject: [Buildroot] [PATCH v7 3/5] package/llvm: disable libxml2
In-Reply-To: <20190501194032.765-1-matthew.weber@rockwellcollins.com>
References: <20190501194032.765-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190501194032.765-4-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libxml2 is needed during Windows builds to populate the COFF
file manifest info.  This isn't required for Linux builds.

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--
This change was discovered during testing of compiler-rt
patchset.  This patch could be independently applied.

v4
 - New patch

v5
 - Rebased post 2018.11 on master

v6
 - Updated comment about dependencies (Romain)
---
 package/llvm/llvm.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index a1c0167ff6..9d276c5190 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -133,6 +133,11 @@ HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=ON
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
2.17.1
