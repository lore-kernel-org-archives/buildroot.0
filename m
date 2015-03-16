From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 22:09:34 +0100
Subject: [Buildroot] [git commit] docs/manual: add documentation on
	Config.in.host
Message-ID: <20150316212645.C7F278015F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b3ac72d0f821f858baba052287e29878f1fa062
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

+ rearrange the structure a bit by adding a new paragraph for the Config
files

Signed-off-by: Jan Heylen <heyleke@gmail.com>
[ThomasDS:
  - clarify commit title
  - add list continuations to fix indentation of Config.in.host details]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt |   50 ++++++++++++++++++++++++++--
 1 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 8a88282..1ce9a3b 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -11,12 +11,18 @@ Some packages have been grouped by topic in a sub-directory:
 one of these categories, then create your package directory in these.
 New subdirectories are discouraged, however.
 
+=== Config files
 
-=== +Config.in+ file
+For the package to be displayed in the configuration tool, you need to
+create a Config file in your package directory. There are two types:
++Config.in+ and +Config.in.host+.
 
-Then, create a file named +Config.in+. This file will contain the
-option descriptions related to our +libfoo+ software that will be used
-and displayed in the configuration tool. It should basically contain:
+==== +Config.in+ file
+
+For packages used on the target, create a file named +Config.in+. This
+file will contain the option descriptions related to our +libfoo+ software
+that will be used and displayed in the configuration tool. It should basically
+contain:
 
 ---------------------------
 config BR2_PACKAGE_LIBFOO
@@ -49,6 +55,42 @@ supposed to contain anything but the 'bare' name of the package.
 source "package/libfoo/Config.in"
 --------------------------
 
+
+==== +Config.in.host+ file
+
+Some packages also need to be built for the host system. There are two
+options here:
+
+* The host package is only required to satisfy build-time
+  dependencies of one or more target packages. In this case, add
+  +host-foo+ to the target package's +BAR_DEPENDENCIES+ variable. No
+  +Config.in.host+ file should be created.
+
+* The host package should be explicitly selectable by the user from
+  the configuration menu. In this case, create a +Config.in.host+ file
+  for that host package:
++
+---------------------------
+config BR2_PACKAGE_HOST_FOO
+	bool "host foo"
+	help
+	  This is a comment that explains what foo for the host is.
+
+	  http://foosoftware.org/foo/
+---------------------------
++
+The same coding style and options as for the +Config.in+ file are valid.
++
+Finally you have to add your new +libfoo/Config.in.host+ to
++package/Config.in.host+. The files included there are 'sorted alphabetically'
+and are 'NOT' supposed to contain anything but the 'bare' name of the package.
++
+--------------------------
+source "package/foo/Config.in.host"
+--------------------------
++
+The host package will then be available from the +Host utilities+ menu.
+
 [[depends-on-vs-select]]
 ==== Choosing +depends on+ or +select+
 
