From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:41:12 +0200
Subject: [Buildroot] [git commit] manual/user guide/customization: add
	section on project-specific packages
Message-ID: <20140921174201.81CA99D488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c3e82f06850ffd4cda7e2c1a703eccd76f89c4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a new section to chapter 'Project-specific customization' to
describe how to add project-specific packages from a project-specific
directory. The principle was already described in the presentation 'Using
Buildroot for real projects' but was never documented in official Buildroot
documentation.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/customize-packages.txt |   71 ++++++++++++++++++++++++++++++++++++
 docs/manual/customize.txt          |    2 +
 2 files changed, 73 insertions(+), 0 deletions(-)

diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
new file mode 100644
index 0000000..e3ecb4c
--- /dev/null
+++ b/docs/manual/customize-packages.txt
@@ -0,0 +1,71 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[customize-packages]]
+=== Adding project-specific packages
+
+In general, any new package should be added directly in the +package+
+directory and submitted to the Buildroot upstream project. How to add
+packages to Buildroot in general is explained in full detail in
+xref:adding-packages[] and will not be repeated here.  However, your
+project may need some proprietary packages that cannot be upstreamed.
+This section will explain how you can keep such project-specific
+packages in a project-specific directory.
+
+As shown in xref:customize-dir-structure[], the recommended location for
+project-specific packages is +package/<company>/+. If you are using the
++BR2_EXTERNAL+ feature (see xref:outside-br-custom[]) the recommended
+location is +$(BR2_EXTERNAL)/package/+.
+
+However, Buildroot will not be aware of the packages in this location,
+unless we perform some additional steps. As explained in
+xref:adding-packages[], a package in Buildroot basically consists of two
+files: a +.mk+ file (describing how to build the package) and a
++Config.in+ file (describing the configuration options for this
+package).
+
+Buildroot will automatically include the +.mk+ files in first-level
+subdirectories of the +package+ directory (using the pattern
++package/\*/*.mk+). If we want Buildroot to include +.mk+ files from
+deeper subdirectories (like +package/<company>/package1/+) then we
+simply have to add a +.mk+ file in a first-level subdirectory that
+includes these additional +.mk+ files. Therefore, create a file
++package/<company>/<company>.mk+ with following contents (assuming you
+have only one extra directory level below +package/<company>/+):
+
+-----
+include $(sort $(wildcard package/<company>/*/*.mk))
+-----
+
+If you are using +BR2_EXTERNAL+, create a file
++$(BR2_EXTERNAL)/external.mk+ with following contents (again assuming only
+one extra level):
+
+-----
+include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
+-----
+
+For the +Config.in+ files, create a file +package/<company>/Config.in+
+that includes the +Config.in+ files of all your packages. An exhaustive
+list has to be provided since wildcards are not supported in the source command of kconfig.
+For example:
+
+-----
+source "package/<company>/package1/Config.in"
+source "package/<company>/package2/Config.in"
+-----
+
+Include this new file +package/<company>/Config.in+ from
++package/Config.in+, preferably in a company-specific menu to make
+merges with future Buildroot versions easier.
+
+If you are using +BR2_EXTERNAL+, create a file
++$(BR2_EXTERNAL)/Config.in+ with similar contents:
+
+-----
+source "$BR2_EXTERNAL/package/package1/Config.in"
+source "$BR2_EXTERNAL/package/package2/Config.in"
+-----
+
+You do not have to add an include for this +$(BR2_EXTERNAL)/Config.in+
+file as it is included automatically.
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index b389d7f..98db69d 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -55,4 +55,6 @@ include::customize-post-image.txt[]
 
 include::customize-patches.txt[]
 
+include::customize-packages.txt[]
+
 include::customize-store.txt[]
