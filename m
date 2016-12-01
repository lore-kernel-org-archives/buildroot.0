From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Thu,  1 Dec 2016 16:33:24 -0200
Subject: [Buildroot] [PATCH v2] stella: fix bug when compiling with PPC
	altivec vectorization
Message-ID: <1480617204-25349-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PPC altivec vectorization triggers a bug when compiling with -std=c++11
because "bool" is redefined in altivec.h.

src/emucore/Event.hxx:112:23: error: cannot convert ?bool? to ?__vector(4) __bool int? in assignment
         myKeyTable[i] = false;
                       ^

Acording to a bug report in GCC [1], "You need to use -std=g++11 or
undefine bool after the include of altivec.h as context sensitive
keywords is not part of the C++11 standard".

So let's compile with -std=gnu++11 by default.

Tested on ARM, x86 and PPC.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58241#c3

Fixes:
http://autobuild.buildroot.net/results/0970d2c8e1787ceffc46b589522e53d52675e03c
http://autobuild.buildroot.net/results/ec1bc57675b6e53af0cd33d7b99cd2e3bf5d9d7e

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---

Changes v1 -> v2:
  - compile with gnu++11 on all archs (suggested by Sam Bobroff)

---
 ...-gnu-11-standard-to-prevent-errors-on-PPC.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/stella/0004-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch

diff --git a/package/stella/0004-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch b/package/stella/0004-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch
new file mode 100644
index 000000000000..76d12a2cdd93
--- /dev/null
+++ b/package/stella/0004-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch
@@ -0,0 +1,35 @@
+From 6946a491cae42b971aad3bc5d822e0e549eca8bd Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Thu, 1 Dec 2016 15:20:33 -0200
+Subject: [PATCH] Use gnu++11 standard to prevent errors on PPC.
+
+PPC altivec vectorization triggers a bug when compiling with -std=c++11
+because "bool" is redefined in altivec.h.
+
+Acording to a bug report in GCC, "You need to use -std=g++11 or
+undefine bool after the include of altivec.h as context sensitive
+keywords is not part of the C++11 standard".
+
+So let's use gnu++11 standard.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 6dd0129587b3..6ed50ea4c335 100644
+--- a/Makefile
++++ b/Makefile
+@@ -51,7 +51,7 @@ else
+ endif
+ CXXFLAGS+= -Wall -Wextra -Wno-unused-parameter -Wno-ignored-qualifiers
+ ifdef HAVE_GCC
+-  CXXFLAGS+= -Wno-multichar -Wunused -fno-rtti -Woverloaded-virtual -Wnon-virtual-dtor -std=c++11
++  CXXFLAGS+= -Wno-multichar -Wunused -fno-rtti -Woverloaded-virtual -Wnon-virtual-dtor -std=gnu++11
+ endif
+ 
+ ifdef PROFILE
+-- 
+1.9.1
+
-- 
1.9.1
