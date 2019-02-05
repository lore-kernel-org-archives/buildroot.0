From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  5 Feb 2019 08:07:32 -0600
Subject: [Buildroot] [PATCH 2/2] package/ibrdtnd: include cstring
In-Reply-To: <1549375652-41472-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1549375652-41472-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1549375652-41472-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Failure output
 SecurityCertificateManager.lo
 SecurityCertificateManager.cpp: In static member function 'static void dtn::security::SecurityCertificateManager::validateSubject(X509*, const string&)':
 SecurityCertificateManager.cpp:208:53: error: 'memcmp' was not declared in this scope
        if(memcmp(utf8_eid, utf8_cert_name, utf8_eid_len) == 0){

Upstream
https://github.com/ibrdtn/ibrdtn/commit/122fa8ed49f896abf6a389505f3d0b66d49d1e77

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Unsure why this failure came up as part of my testing for
http://autobuild.buildroot.net/results/385/3852a414afacbe3c044b1e49be8ccf8c554c8565
That build failure was using GCC4.8 and this fix was for GCC8.2+
---
 ...ertificateManager.cpp-include-cstring-267.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/ibrdtnd/0002-SecurityCertificateManager.cpp-include-cstring-267.patch

diff --git a/package/ibrdtnd/0002-SecurityCertificateManager.cpp-include-cstring-267.patch b/package/ibrdtnd/0002-SecurityCertificateManager.cpp-include-cstring-267.patch
new file mode 100644
index 0000000..e681936
--- /dev/null
+++ b/package/ibrdtnd/0002-SecurityCertificateManager.cpp-include-cstring-267.patch
@@ -0,0 +1,29 @@
+From 9458a8627ed73600488a6d8a0ce2ce1d123da583 Mon Sep 17 00:00:00 2001
+From: bkuhls <bkuhls@users.noreply.github.com>
+Date: Sun, 19 Aug 2018 11:23:48 +0200
+Subject: [PATCH] SecurityCertificateManager.cpp: include cstring (#267)
+
+Fixes build with gcc-8.2.0.
+
+Upstream: https://github.com/ibrdtn/ibrdtn/commit/122fa8ed49f896abf6a389505f3d0b66d49d1e77
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ src/security/SecurityCertificateManager.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/security/SecurityCertificateManager.cpp b/src/security/SecurityCertificateManager.cpp
+index 5fba703..f2bbb01 100644
+--- a/src/security/SecurityCertificateManager.cpp
++++ b/src/security/SecurityCertificateManager.cpp
+@@ -22,6 +22,7 @@
+ #include "security/SecurityCertificateManager.h"
+ #include "Configuration.h"
+ 
++#include <cstring>
+ #include <cstdlib>
+ 
+ #include <ibrcommon/Logger.h>
+-- 
+1.9.1
+
-- 
1.9.1
