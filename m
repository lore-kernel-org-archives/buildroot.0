From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  9 Jan 2018 22:15:36 -0600
Subject: [Buildroot] [PATCH v3 5/8] boost: correct linker flag seq
In-Reply-To: <1515557739-6027-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1515557739-6027-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1515557739-6027-5-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will correct the sequence of -pie and -shared options.
When used together, -pie should be provided to the linker before
-shared.

Upstream: https://lists.boost.org/boost-build/2017/11/29701.php

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...ost-patch-to-correct-linker-flag-sequence.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/boost/0004-boost-patch-to-correct-linker-flag-sequence.patch

diff --git a/package/boost/0004-boost-patch-to-correct-linker-flag-sequence.patch b/package/boost/0004-boost-patch-to-correct-linker-flag-sequence.patch
new file mode 100644
index 0000000..697aab7
--- /dev/null
+++ b/package/boost/0004-boost-patch-to-correct-linker-flag-sequence.patch
@@ -0,0 +1,41 @@
+From 8d59b42a87320a05feb81897c6ba4e47274e65ae Mon Sep 17 00:00:00 2001
+From: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+Date: Fri, 29 Sep 2017 15:48:37 -0500
+Subject: [PATCH 1/1] boost: patch to correct linker flag sequence
+
+Description
+This patch will correct the sequence of -pie and -shared options.
+ When used together, -pie should be provided to the linker before
+ -shared. If -pie is provided after -shared, the linker throws an
+ error shown below as example.
+
+-------------------------------------------------------------------------
+/host/powerpc-buildroot-linux-gnu/sysroot/usr/lib/Scrt1.o:(.data+0x4):
+ undefined reference to `main'
+/host/lib/gcc/powerpc-buildroot-linux-gnu/6.4.0/../../../..
+/powerpc-buildroot-linux-gnu/bin/ld: BFD (GNU Binutils) 2.28.1
+ assertion fail elf32-ppc.c:8923
+collect2: error: ld returned 1 exit status
+-------------------------------------------------------------------------
+
+Signed-off-by: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+---
+ tools/build/src/tools/gcc.jam | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
+index 0f346a5..b2076c7 100644
+--- a/tools/build/src/tools/gcc.jam
++++ b/tools/build/src/tools/gcc.jam
+@@ -1027,7 +1027,7 @@ rule link.dll ( targets * : sources * : properties * )
+ # Differs from 'link' above only by -shared.
+ actions link.dll bind LIBRARIES
+ {
+-    "$(CONFIG_COMMAND)" -L"$(LINKPATH)" -Wl,$(RPATH_OPTION:E=-R)$(SPACE)-Wl,$(RPATH) "$(.IMPLIB-COMMAND)$(<[1])" -o "$(<[-1])" $(HAVE_SONAME)-Wl,$(SONAME_OPTION)$(SPACE)-Wl,$(<[-1]:D=) -shared $(START-GROUP) "$(>)" "$(LIBRARIES)" $(FINDLIBS-ST-PFX) -l$(FINDLIBS-ST) $(FINDLIBS-SA-PFX) -l$(FINDLIBS-SA) $(END-GROUP) $(OPTIONS) $(USER_OPTIONS)
++    "$(CONFIG_COMMAND)" -L"$(LINKPATH)" $(OPTIONS) $(USER_OPTIONS) -Wl,$(RPATH_OPTION:E=-R)$(SPACE)-Wl,$(RPATH) "$(.IMPLIB-COMMAND)$(<[1])" -o "$(<[-1])" $(HAVE_SONAME)-Wl,$(SONAME_OPTION)$(SPACE)-Wl,$(<[-1]:D=) -shared $(START-GROUP) "$(>)" "$(LIBRARIES)" $(FINDLIBS-ST-PFX) -l$(FINDLIBS-ST) $(FINDLIBS-SA-PFX) -l$(FINDLIBS-SA) $(END-GROUP)
+ }
+ 
+ rule setup-threading ( targets * : sources * : properties * )
+-- 
+1.9.1
+
-- 
1.9.1
