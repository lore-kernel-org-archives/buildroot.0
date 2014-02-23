From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 16:04:38 +0100
Subject: [Buildroot] [PATCH 12/13] docs/manual: document the usage of
	<pkg>_OVERRIDE_SRCDIR
In-Reply-To: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1393167879-16637-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/advanced.txt                    |  2 +
 docs/manual/using-buildroot-development.txt | 84 +++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 docs/manual/using-buildroot-development.txt

diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
index 764b71a..fb337f5 100644
--- a/docs/manual/advanced.txt
+++ b/docs/manual/advanced.txt
@@ -11,3 +11,5 @@ include::ccache-support.txt[]
 include::download-location.txt[]
 
 include::package-make-target.txt[]
+
+include::using-buildroot-development.txt[]
diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
new file mode 100644
index 0000000..3267302
--- /dev/null
+++ b/docs/manual/using-buildroot-development.txt
@@ -0,0 +1,84 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+Using Buildroot during development
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The normal operation of Buildroot is to download a tarball, extract
+it, configure, compile and install the software component found inside
+this tarball. The source code is extracted in
++output/build/<package>-<name>+, which is a temporary directory:
+whenever +make clean+ is used, this directory is entirely removed, and
+re-recreated at the next +make+ invocation. Even when a Git or
+Subversion repository is used as the input for the package source
+code, Buildroot creates a tarball out of it, and then behaves as it
+does normally with tarballs.
+
+This behavior is well-suited when Buildroot is used mainly as an
+integration tool, to build and integrate all the components of an
+embedded Linux system. However, if one uses Buildroot during the
+development of certain components of the system, this behavior is not
+very convenient: one would instead like to make a small change to the
+source code of one package, and be able to quickly rebuild the system
+with Buildroot.
+
+Making changes directly in +output/build/<package>-<name>+ is not
+appropriate solution, because this directory is removed on +make
+clean+.
+
+Therefore, Buildroot provides a specific mechanism for this use case:
+the +<pkg>_OVERRIDE_SRCDIR+ mechanism. Buildroot reads an _override_
+file, which allows the user to tell Buildroot the location of the
+source for certain packages. By default this _override_ file is named
++local.mk+ and located in the top directory of the Buildroot source
+tree, but a different location can be specified through the
++BR2_PACKAGE_OVERRIDE_FILE+ configuration option.
+
+In this _override_ file, Buildroot expects to find lines of the form:
+
+------------------
+<pkg1>_OVERRIDE_SRCDIR = /path/to/pkg1/sources
+<pkg2>_OVERRIDE_SRCDIR = /path/to/pkg2/sources
+------------------
+
+For example:
+
+------------------
+LINUX_OVERRIDE_SRCDIR = /home/bob/linux/
+BUSYBOX_OVERRIDE_SRCDIR = /home/bob/busybox/
+------------------
+
+When Buildroot finds that for a given package, an
++<pkg>_OVERRIDE_SRCDIR+ has been defined, it will no longer attempt to
+download, extract and patch the package. Instead, it will directly use
+the source code available in in the specified directory and +make
+clean+ will not touch this directory. This allows to point Buildroot
+to your own directories, that can be managed by Git, Subversion, or
+any other version control system. To achieve this, Buildroot will use
+_rsync_ to copy the source code of the component from the specified
++<pkg>_OVERRIDE_SRCDIR+ to +output/build/<package>-custom/+.
+
+This mechanism is best used in conjuction with the +make
+<pkg>-rebuild+ and +make <pkg>-reconfigure+ targets. A +make
+<pkg>-rebuild all+ sequence will _rsync_ the source code from
++<pkg>_OVERRIDE_SRCDIR+ to +output/build/<package>-custom+ (thanks to
+_rsync_, only the modified files are copied), and restart the build
+process of just this package.
+
+In the example of the +linux+ package above, the developer can then
+make a source code change in +/home/bob/linux+ and then run:
+
+-----------------------
+make linux-rebuild all
+-----------------------
+
+and in a matter of seconds gets the updated Linux kernel image in
++output/images+. Similarly, a change can be made to the Busybox source
+code in +/home/bob/busybox+, and after:
+
+-----------------------
+make busybox-rebuild all
+-----------------------
+
+the root filesystem image in +output/images+ contains the updated
+Busybox.
-- 
1.8.3.2
