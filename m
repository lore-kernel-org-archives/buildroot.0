From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 09:54:04 +0200
Subject: [Buildroot] [git commit] manual: add documentation for
	kconfig-package
Message-ID: <20140804075840.3A4899D11C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e91cd2902d3e66ef9f94358e57c9a55ed1e7e202
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds documentation for the new kconfig-package infrastructure to
the manual.

Note that due to the simplicity of the infrastructure, the documentation
is not split in a 'tutorial' and a 'reference', like for the other
infrastructures. Instead, the usage is described in one section.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[me: slight grammar fix 'copy -back- the configuration +back+ to...']
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-kconfig.txt |   56 +++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt         |    2 +
 2 files changed, 58 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
new file mode 100644
index 0000000..f14b87b
--- /dev/null
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -0,0 +1,56 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Infrastructure for packages using kconfig for configuration files
+
+A popular way for a software package to handle user-specified
+configuration is +kconfig+. Among others, it is used by the Linux
+kernel, Busybox, and Buildroot itself. The presence of a .config file
+and a +menuconfig+ target are two well-known symptoms of kconfig being
+used.
+
+Buildroot features an infrastructure for packages that use kconfig for
+their configuration. This infrastructure provides the necessary logic to
+expose the package's +menuconfig+ target as +foo-menuconfig+ in
+Buildroot, and to handle the copying back and forth of the configuration
+file in a correct way.
+
+The +kconfig-package+ infrastructure is based on the +generic-package+
+infrastructure. All variables supported by +generic-package+ are
+available in +kconfig-package+ as well. See
+xref:generic-package-reference[] for more details.
+
+In order to use the +kconfig-package+ infrastructure for a Buildroot
+package, the minimally required lines in the +.mk+ file, in addition to
+the variables required by the +generic-package+ infrastructure, are:
+
+------------------------------
+FOO_KCONFIG_FILE = reference-to-source-configuration-file
+
+$(eval $(kconfig-package))
+------------------------------
+
+This snippet creates the following make targets:
+
+* +foo-menuconfig+, which calls the package's +menuconfig+ target
+
+* +foo-update-config+, which copies the configuration back to the source
+  configuration file.
+
+and ensures that the source configuration file is copied to the build
+directory at the right moment.
+
+In addition to these minimally required lines, several optional variables can
+be set to suit the needs of the package under consideration:
+
+* +FOO_KCONFIG_EDITORS+: a space-separated list of kconfig editors to
+  support, for example 'menuconfig xconfig'. By default, 'menuconfig'.
+
+* +FOO_KCONFIG_OPT+: extra options to pass when calling the kconfig
+  ediftors. This may need to include '$(FOO_MAKE_OPT)', for example. By
+  default, empty.
+
+* +FOO_KCONFIG_FIXUP_CMDS+: a list of shell commands needed to fixup the
+  configuration file after copying it or running a kconfig editor. Such
+  commands may be needed to ensure a configuration consistent with other
+  configuration of Buildroot, for example. By default, empty.
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index 31f92f4..9c97128 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -25,6 +25,8 @@ include::adding-packages-perl.txt[]
 
 include::adding-packages-virtual.txt[]
 
+include::adding-packages-kconfig.txt[]
+
 include::adding-packages-hooks.txt[]
 
 include::adding-packages-gettext.txt[]
