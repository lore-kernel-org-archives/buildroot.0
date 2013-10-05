From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  5 Oct 2013 21:49:09 +0200
Subject: [Buildroot] [PATCH 4/9] manual: add information about buildroot
	toolchain not being relocable and put some hints to use it
In-Reply-To: <cover.1381002281.git.s.martin49@gmail.com>
References: <cover.1381002281.git.s.martin49@gmail.com>
Message-ID: <ef67fc0502d4a0a4cdce65dc850921e08e0cfef0.1381002281.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: A.R.D. <contact@team-ard.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
Changes v2 -> v3:
- rephrase how to use buildroot toochain as an external one

Changes v1 -> v2:
- rephrase commit message
- wrap line at 70-80 chars
- misc. typo and formating fixes
- misc. rewordings

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/customize-toolchain.txt | 72 +++++++++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 15 deletions(-)

diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 82ecc28..324afd2 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -31,28 +31,70 @@ set the environment variable BR_DEBUG_WRAPPER to either one of:
 Using the internal Buildroot toolchain backend
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-The internal Buildroot toolchain backend *only* allows to generate
-*http://www.uclibc.org/[uClibc]-based toolchains*.
+The internal Buildroot toolchain backend allows to generate any C-library-based
+toolchains. 'eglibc' and 'glibc' -based toolchain generation support is still
+experimental in Buildroot
 
-However, it allows to tune major settings, such as:
+It allows to tune major settings, such as:
 
 * Linux headers version;
 
-* http://www.uclibc.org/[uClibc] configuration (see xref:uclibc-custom[uClibc]);
+* C library configuration (only available for
+  http://www.uclibc.org/[uClibc], see xref:uclibc-custom[uClibc]);
 
 * Binutils, GCC, Gdb and toolchain options.
 
 These settings are available after selecting the +Buildroot toolchain+ type in
 the menu +Toolchain+.
 
-Using the Crosstool-NG backend
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-
-The http://crosstool-ng.org[crosstool-NG] toolchain backend enables a rather
-limited set of settings under the Buildroot +Toolchain+ menu:
-
-* The http://crosstool-ng.org[crosstool-NG] configuration file
-
-* Gdb and some toolchain options
-
-Then, the toolchain can be fine-tuned by invoking +make ctng-menuconfig+.
+It is possible to only build the toolchain by running:
+
+---------------------------------------
+make toolchain
+---------------------------------------
+
+To avoid to rebuild the toolchain (when using the 'internal Buildroot toolchain
+backend') after executing +make clean+, you can build the toolchain in some
+place, then use this prebuilt toolchain as an 'external toolchain' in another
+buildroot configuration.
+
+1. Configure the toolchain using the 'internal Buildroot toolchain backend'
+  to meet your needs:
++
+---------------------------------------
+make O=/path/to/somewhere menuconfig
+---------------------------------------
++
+1. Build the toolchain:
++
+---------------------------------------
+make O=/path/to/somewhere toolchain
+---------------------------------------
++
+1. Configure target configuration using the prebuilt toolchain as an
+   'external toolchain':
++
+---------------------------------------
+make O=/path/to/somewhere_else menuconfig
+---------------------------------------
++
+In the 'Toolchain' menu, set:
++
+* 'Toolchain type': +External toolchain+ (+BR2_TOOLCHAIN_EXTERNAL+)
+* 'Toolchain': +Custom toolchain+ (+BR2_TOOLCHAIN_EXTERNAL_CUSTOM+)
+* 'Toolchain origin': +Pre-installed toolchain+
+  (+BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED+)
+* 'Toolchain path': +/path/to/somewhere/host/usr+
+  (+BR2_TOOLCHAIN_EXTERNAL_PATH+)
+* and set the external toolchain properties accordingly to the ones set for
+  the prebuilt toolchain.
++
+1. Build the target binaries:
++
+---------------------------------------
+make O=/path/to/somewhere_else
+---------------------------------------
+
+Note that toolchains built using the 'internal Buildroot toolchain backend' are
+*not* relocable, so if you plan to share it with other machines, you will
+*have to* install it in the same location (i.e.: in +/path/to/somewhere+).
-- 
1.8.4
