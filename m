From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 22:02:08 +0200
Subject: [Buildroot] [git commit] docs/manual: clarify the reinstallation of
 a package
Message-ID: <20191021195553.EC0F0839C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9155d1a38d7b1251db36b35bcf0b3f77b4648557
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since <package>-rebuild implies <package>-reinstall and
<package>-reconfigure implies <package>-rebuild, it is confusing
to mention the make and make <package> commands when describing
the restart of the configuration, compilation and installation of
the package.

Therefore remove the ", followed by +make+ or +make <package>+"
portions in the "8.3. Understanding how to rebuild packages" section,
and add a new paragraph clarifying how to include the rebuilt package
in the filesystem image, if that is necessary.

Signed-off-by: Vivien Didelot <vivien.didelot@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/rebuilding-packages.txt | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index 6faa67adcb..8f4d40d4d6 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -99,16 +99,20 @@ re-configure, re-compile and re-install this package from scratch. You
 can ask buildroot to do this with the +make <package>-dirclean+ command.
 
 On the other hand, if you only want to restart the build process of a
-package from its compilation step, you can run +make
-<package>-rebuild+, followed by +make+ or +make <package>+. It will
-restart the compilation and installation of the package, but not from
-scratch: it basically re-executes +make+ and +make install+
-inside the package, so it will only rebuild files that changed.
-
-If you want to restart the build process of a package from its
-configuration step, you can run +make <package>-reconfigure+, followed
-by +make+ or +make <package>+. It will restart the configuration,
-compilation and installation of the package.
+package from its compilation step, you can run +make <package>-rebuild+. It
+will restart the compilation and installation of the package, but not from
+scratch: it basically re-executes +make+ and +make install+ inside the package,
+so it will only rebuild files that changed.
+
+If you want to restart the build process of a package from its configuration
+step, you can run +make <package>-reconfigure+. It will restart the
+configuration, compilation and installation of the package.
+
+While +<package>-rebuild+ implies +<package>-reinstall+ and
++<package>-reconfigure+ implies +<package>-rebuild+, these targets as well
+as +<package>+ only act on the said package, and do not trigger re-creating
+the root filesystem image. If re-creating the root filesystem in necessary,
+one should in addition run +make+ or +make all+.
 
 Internally, Buildroot creates so-called _stamp files_ to keep track of
 which build steps have been completed for each package. They are
