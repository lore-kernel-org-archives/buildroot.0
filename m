From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 11 Feb 2020 16:04:45 +0100
Subject: [Buildroot] [PATCH] mfgtools: fix build issue
Message-ID: <20200211150445.GA15724@p1g2.work>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tool fails to build on recent distros due to conflicting declaration
of __time64_t. Adding a check around the declaration to avoid
redefinition.

Patch not submitted upstream as the tool is not supported by NXP
anymore[1].

Fixes:
http://autobuild.buildroot.net/results/ca4498ad21a96ba2a38ca2467dadffdbb516355b/

[1] https://github.com/NXPmicro/mfgtools/pull/104

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Hi,

As explained in my reply to Jorg's patch that drops mfgtools [1], I'm
having second thoughts on this.
Maybe this small patch should be included instead of dropping the
package?

Let me know your thoughts.

Regards,
Gary

[1] http://patchwork.ozlabs.org/patch/1220600/
---
 ...onflicting-declaration-of-__time64_t.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch

diff --git a/package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch b/package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch
new file mode 100644
index 0000000000..7d0d3974a2
--- /dev/null
+++ b/package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch
@@ -0,0 +1,27 @@
+From 1af7bc09451e0b779f7bfb0dcc58ffb3abe9c584 Mon Sep 17 00:00:00 2001
+From: Gary Bisson <bisson.gary@gmail.com>
+Date: Tue, 11 Feb 2020 15:30:12 +0100
+Subject: [PATCH] lnx_def.h: fix conflicting declaration of __time64_t
+
+Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
+---
+ MfgToolLib/lnx_def.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/MfgToolLib/lnx_def.h b/MfgToolLib/lnx_def.h
+index c6869dd..a38bb99 100644
+--- a/MfgToolLib/lnx_def.h
++++ b/MfgToolLib/lnx_def.h
+@@ -124,7 +124,9 @@ typedef unsigned long * ULONG_PTR;
+ typedef char * LPOLESTR;
+ typedef void * HDEVINFO;
+ typedef unsigned long long ULONGLONG;
++#ifndef __time64_t
+ typedef long long __time64_t;
++#endif
+ typedef long long __int64;
+ typedef unsigned long DWORD_PTR;
+ typedef unsigned int UINT;
+-- 
+2.25.0
+
-- 
2.25.0
