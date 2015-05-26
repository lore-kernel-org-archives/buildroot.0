From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:09 +0200
Subject: [Buildroot] [PATCH 14/21 RFC] docs/manual: document the
	br2-external ID
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <f46ced8a953b9fc53bd2d9651d183d5e062fce58.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the manual with the new external.id mandatory file.

Take the opportunity to add a section listing all mandatory files,
Config.in, external.mk and the new external.id, instead of just hinting
about them in the external package recipes section.

Change the example to use the ID-suffixed variable instead of the raw
BR2_EXTERNAL variable, which won;t be useable once we introduce support
for multiple br2-external trees, as it would then contain more that one
path.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/customize-outside-br.txt | 38 +++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index a3d6efd..744666d 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -57,7 +57,20 @@ Or disable the usage of external definitions:
 buildroot/ $ make BR2_EXTERNAL= xconfig
 -----
 
-+BR2_EXTERNAL+ allows three different things:
+A +BR2_EXTERNAL+ tree must contain at least those three files:
+
+ * +external.id+, which should contain the ID for the BR2_EXTERNAL tree.
+   That ID is used to construct the +BR2_EXTERNAL_$(ID)+ variable,
+   available in +Config.in+ and +external.mk+ (see below), so that ID
+   must be a valid make and Kconfig variable.
++
+Examples: +FOO+, +BAR_42+...
+
+ * +Config.in+ and +external.mk+ (see below), which can be used to define
+   package recipes, like for packages bundled in Buildroot itself, or
+   other custom configuration options. Those two files can be empty.
+
++BR2_EXTERNAL+ then allows three different things:
 
  * One can store Buildroot defconfigs in the +configs+ subdirectory of
    +$(BR2_EXTERNAL)+. Buildroot will automatically show them in the
@@ -68,14 +81,15 @@ buildroot/ $ make BR2_EXTERNAL= xconfig
  * One can store all the board-specific configuration files there,
    such as the kernel configuration, the root filesystem overlay, or
    any other configuration file for which Buildroot allows to set its
-   location. The +BR2_EXTERNAL+ value is available within the
-   Buildroot configuration using +$(BR2_EXTERNAL)+. As an example, one
-   could set the +BR2_ROOTFS_OVERLAY+ Buildroot option to
-   +$(BR2_EXTERNAL)/board/<boardname>/overlay/+ (to specify a root
+   location. The location of the +BR2_EXTERNAL+ tree is available in the
+   Buildroot configuration using the +$(BR2_EXTERNAL_$(ID))+ variable. As
+   an example, (considering the ID +BAR_42+), one could set the
+   +BR2_ROOTFS_OVERLAY+ Buildroot option to
+   +$(BR2_EXTERNAL_BAR_42)/board/<boardname>/overlay/+ (to specify a root
    filesystem overlay), or the +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+
    Buildroot option to
-   +$(BR2_EXTERNAL)/board/<boardname>/kernel.config+ (to specify the
-   location of the kernel configuration file).
+   +$(BR2_EXTERNAL_BAR_42)/board/<boardname>/kernel.config+ (to specify
+   the location of the kernel configuration file).
 
  * One can store package recipes (i.e. +Config.in+ and
    +<packagename>.mk+), or even custom configuration options and make
@@ -83,23 +97,19 @@ buildroot/ $ make BR2_EXTERNAL= xconfig
    make it appear in the top-level configuration menu, and includes
    +$(BR2_EXTERNAL)/external.mk+ with the rest of the makefile logic.
 +
-.Note
-Providing +Config.in+ and +external.mk+ is mandatory, but they can be
-   empty.
-+
 The main usage of this is to store package recipes. The recommended
    way to do this is to write a +$(BR2_EXTERNAL)/Config.in+ file that
    looks like:
 +
 ------
-source "$BR2_EXTERNAL/package/package1/Config.in"
-source "$BR2_EXTERNAL/package/package2/Config.in"
+source "$BR2_EXTERNAL_BAR_42/package/package1/Config.in"
+source "$BR2_EXTERNAL_BAR_42/package/package2/Config.in"
 ------
 +
 Then, have a +$(BR2_EXTERNAL)/external.mk+ file that looks like:
 +
 ------
-include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
+include $(sort $(wildcard $(BR2_EXTERNAL_BAR_42)/package/*/*.mk))
 ------
 +
 And then in +$(BR2_EXTERNAL)/package/package1+ and
-- 
1.9.1
