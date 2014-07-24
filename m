From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Jul 2014 20:57:54 +0200
Subject: [Buildroot] [PATCH 2 of 2] kconfig-package: add documentation to
	manual
In-Reply-To: <patchbomb.1406228272@localhost>
References: <patchbomb.1406228272@localhost>
Message-ID: <a69058f56d211b43733a.1406228274@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds documentation for the new kconfig-package infrastructure to
the manual.

Note that due to the simplicity of the infrastructure, the documentation
is not split in a 'tutorial' and a 'reference', like for the other
infrastructures. Instead, the usage is described in one section.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-kconfig.txt |  54 ++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt         |   2 ++
 2 files changed, 56 insertions(+), 0 deletions(-)

diff -r a28bf078ba44 -r a69058f56d21 docs/manual/adding-packages-kconfig.txt
--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
+++ b/docs/manual/adding-packages-kconfig.txt	Thu Jul 24 20:54:50 2014 +0200
@@ -0,0 +1,54 @@
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
+configuration. This infrastructure provides the necessary make logic to
+expose the package +menuconfig+ target as +foo-menuconfig+ in Buildroot, and
+to handle the copying and copy-back of the configuration file in a
+correct way.
+
+As this infrastructure only handles the kconfig part, it should be used
+in combination with one of the other package infrastructures, like
++generic-package+, +autotools-package+, ...
+
+In order to use the +kconfig-package+ infrastructure for a Buildroot
+package, the minimally required lines in the .mk file are:
+
+------------------------------
+FOO_KCONFIG_FILE = reference-to-source-configuration-file
+
+$(eval $(kconfig-package))
+------------------------------
+
+This snippet will create following make targets:
+
+* +foo-menuconfig+, which calls the package's +menuconfig+ target
+
+* +foo-update-config+, which copies back the configuration to the source
+  configuration file.
+
+and will ensure that the source configuration file is copied to the build
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
diff -r a28bf078ba44 -r a69058f56d21 docs/manual/adding-packages.txt
--- a/docs/manual/adding-packages.txt	Thu Jul 24 20:14:00 2014 +0200
+++ b/docs/manual/adding-packages.txt	Thu Jul 24 20:54:50 2014 +0200
@@ -25,6 +25,8 @@
 
 include::adding-packages-virtual.txt[]
 
+include::adding-packages-kconfig.txt[]
+
 include::adding-packages-hooks.txt[]
 
 include::adding-packages-gettext.txt[]
