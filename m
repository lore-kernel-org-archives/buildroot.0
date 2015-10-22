From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Oct 2015 22:34:15 +0200
Subject: [Buildroot] [PATCH 20/21 v2] docs/manual: document the br2-external
	ID
In-Reply-To: <cover.1445545973.git.yann.morin.1998@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
Message-ID: <7fc654ad197b16c299c07a5d3507a009a3345349.1445545973.git.yann.morin.1998@free.fr>
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
BR2_EXTERNAL variable, which won't be useable once we introduce support
for multiple br2-external trees, as it would then contain more that one
path.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/customize-outside-br.txt | 50 ++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 9ad177d..afc5b78 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -57,19 +57,41 @@ Or disable the usage of external definitions:
 buildroot/ $ make BR2_EXTERNAL= xconfig
 -----
 
-+BR2_EXTERNAL+ allows three different things:
+A +BR2_EXTERNAL+ tree must contain at least those three files:
+
++external.id+::
+   That file should contain the ID for the +BR2_EXTERNAL+ tree.
+   That ID is used to construct the +BR2_EXTERNAL_$(ID)+ variable,
+   available in +Config.in+ and +external.mk+ (see below), so that ID
+   must be a valid make and Kconfig variable. Buildroot sets
+   +BR2_EXTERNAL_$(ID)+ to the path of the +BR2_EXTERNAL+ tree.
++
+Examples:
++
+  ** +FOO+ -> +BR2_EXTERNAL_FOO+
+  ** +BAR_42+ -> +BR2_EXTERNAL_BAR_42+
+  ** ...
+
++Config.in+::
++external.mk+::
+   Those files (which may each be empty) can be used to define package
+   recipes, like for packages bundled in Buildroot itself, or other
+   custom configuration options.
+
+Using +BR2_EXTERNAL+ then allows three different things:
 
  * One can store all the board-specific configuration files there,
    such as the kernel configuration, the root filesystem overlay, or
    any other configuration file for which Buildroot allows to set its
-   location. The +BR2_EXTERNAL+ value is available within the
-   Buildroot configuration using +$(BR2_EXTERNAL)+. As an example, one
-   could set the +BR2_ROOTFS_OVERLAY+ Buildroot option to
-   +$(BR2_EXTERNAL)/board/<boardname>/overlay/+ (to specify a root
+   location. The location of the +BR2_EXTERNAL+ tree is available in the
+   Buildroot configuration using the +BR2_EXTERNAL_$(ID)+ variable. As
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
@@ -77,27 +99,23 @@ buildroot/ $ make BR2_EXTERNAL= xconfig
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
-And then in +$(BR2_EXTERNAL)/package/package1+ and
-   +$(BR2_EXTERNAL)/package/package2+ create normal Buildroot
+And then in +$(BR2_EXTERNAL_FOO_42)/package/package1+ and
+   +$(BR2_EXTERNAL_FOO_42)/package/package2+ create normal Buildroot
    package recipes, as explained in xref:adding-packages[].
    If you prefer, you can also group the packages in subdirectories
    called <boardname> and adapt the above paths accordingly.
-- 
1.9.1
