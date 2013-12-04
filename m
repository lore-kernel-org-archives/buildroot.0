From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Dec 2013 00:14:51 +0100
Subject: [Buildroot] [PATCHv6 5/5] docs/manual: add explanations about
	BR2_EXTERNAL
In-Reply-To: <1386198891-17968-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386198891-17968-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386198891-17968-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit updates the manual to add details on how to use the
BR2_EXTERNAL feature.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/customize-outside-br.txt | 137 +++++++++++++++++++++++++++++++++++
 docs/manual/customize.txt            |   2 +
 2 files changed, 139 insertions(+)
 create mode 100644 docs/manual/customize-outside-br.txt

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
new file mode 100644
index 0000000..4069834
--- /dev/null
+++ b/docs/manual/customize-outside-br.txt
@@ -0,0 +1,137 @@
+// -*- mode:doc -*- ;
+
+[[outside-br-custom]]
+Keeping customization outside Buildroot
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The Buildroot community recommends and encourages upstreaming to the
+official Buildroot version the packages and board supports that are
+written by developers. However, it is sometimes not possible or
+desirable because some of these packages or board supports are highly
+specific or proprietary.
+
+In this case, Buildroot users are offered two choices:
+
+ * They can add their packages, board support and configuration files
+   directly within the Buildroot tree, and maintain them by using
+   branches in a version control system.
+
+ * They can use the +BR2_EXTERNAL+ mechanism, which allows to keep
+   package recipes, board support and configuration files outside of
+   the Buildroot tree, while still having them nicely integrated in
+   the build logic. The following paragraphs give details on how to
+   use +BR2_EXTERNAL+.
+
++BR2_EXTERNAL+ is an environment variable that one can use to point to
+a directory that contains Buildroot customizations. It can be passed
+to any Buildroot +make+ invocation. It is automatically saved in the
+hidden +.br-external+ file in the output directory, so that it is not
+needed to pass +BR2_EXTERNAL+ at every +make+ invocation. It can
+however be changed at any time by passing a new value, and can be
+removed by passing an empty value.
+
+The +BR2_EXTERNAL+ path can be either an absolute or a relative path,
+but if it's passed as a relative path, it is important to note that it
+is interpreted relatively to the main Buildroot source directory, not
+the Buildroot output directory.
+
+Some examples:
+
+-----
+ buildroot/ $ make BR2_EXTERNAL=../foobar menuconfig
+-----
+
+Starting from now on, external definitions from the +../foobar+
+directory will be used:
+
+-----
+ buildroot/ $ make
+ buildroot/ $ make legal-info
+-----
+
+We can switch to another external definitions directory at any time:
+
+-----
+ buildroot/ $ make BR2_EXTERNAL=../barfoo xconfig
+-----
+
+Or disable the usage of external definitions:
+
+-----
+ buildroot/ $ make BR2_EXTERNAL= xconfig
+-----
+
+This +BR2_EXTERNAL+ then allows three different things:
+
+ * One can store all the board-specific configuration files there,
+   such as the kernel configuration, the root filesystem overlay, or
+   any other configuration file for which Buildroot allows to set its
+   location. The +BR2_EXTERNAL+ value is available within the
+   Buildroot configuration using +$(BR2_EXTERNAL)+. As an example, one
+   could set the +BR2_ROOTFS_OVERLAY+ Buildroot option to
+   +$(BR2_EXTERNAL)/board/<boardname>/overlay/+ (to specify a root
+   filesystem overlay), or the +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+
+   Buildroot option to
+   +$(BR2_EXTERNAL)/board/<boardname>/kernel.config+ (to specify the
+   location of the kernel configuration file). To achieve this, it is
+   recommended but not mandatory, to store those details in
+   directories called +board/<boardname>/+ under +BR2_EXTERNAL+. This
+   matches the directory structure used within Buildroot.
+
+ * One can store package recipes (i.e +Config.in+ and
+   +<packagename>.mk+), or even custom configuration options and make
+   logic. Buildroot automatically includes +BR2_EXTERNAL/Config.in+ to
+   make it appear in the top-level configuration menu, and includes
+   +BR2_EXTERNAL/external.mk+ with the rest of the makefile logic.
++
+The main usage of this is to store package recipes. The recommended
+   way to do this is to write a +BR2_EXTERNAL/Config.in+ that looks
+   like:
++
+------
+menu "<somecompany> packages"
+
+source "$BR2_EXTERNAL/package/package1/Config.in"
+source "$BR2_EXTERNAL/package/package2/Config.in"
+
+endmenu
+------
++
+Then, have a +BR2_EXTERNAL/external.mk+ file that looks like:
++
+------
+include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
+------
++
+And then in +BR2_EXTERNAL/package/package1+ and
+   +BR2_EXTERNAL/package/package2+ create normal Buildroot package
+   recipes, as explained in xref:adding-packages[].
+
+ * One can store Buildroot defconfigs in the +configs+ subdirectory of
+   +BR2_EXTERNAL+. Buildroot will automatically show them in the
+   output of +make help+ and allow them to be loaded with the normal
+   +make <name>_defconfig+ command.
+
+In the end, a typical +BR2_EXTERNAL+ directory organization would
+generally be:
+
+-----
+$(BR2_EXTERNAL)/
++-- Config.in
++-- external.mk
++-- board/
+|   +-- <boardname>/
+|       +-- linux.config
+|       +-- overlay/
+|           +-- etc/
+|               +-- <some file>
++-- configs/
+|   +-- <boardname>_defconfig
++-- package/
+    +-- package1/
+    |    +-- Config.in
+    |    +-- package1.mk
+    +-- package2/
+        +-- Config.in
+        +-- package2.mk
+------
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index 0456ef1..7e46fd8 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -17,3 +17,5 @@ include::customize-toolchain.txt[]
 include::customize-store.txt[]
 
 include::customize-packages.txt[]
+
+include::customize-outside-br.txt[]
-- 
1.8.1.2
